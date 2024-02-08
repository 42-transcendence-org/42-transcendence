import * as g from './global.js';
import * as sound from "./sound.js";
import * as physics from "./physic.js";

export class GameState {
	constructor() {
		this.status = g.STATUS_WAITING;
		this.particles = [];
		this.ball = new physics.Rectangle((g.BOARD_WIDTH - g.BALL_SIDE) / 2, (g.BOARD_HEIGHT - g.BALL_SIDE) / 2, g.BALL_SIDE, g.BALL_SIDE, 0, g.BALL_SPEED_MIN);
		this.player1 = new physics.Rectangle((g.BOARD_WIDTH - g.PADDLE_WIDTH) / 2, g.BOARD_HEIGHT - (3 * g.BOARD_MARGIN), g.PADDLE_WIDTH, g.BALL_SIDE, 0, 0);
		this.player2 = new physics.Rectangle((g.BOARD_WIDTH - g.PADDLE_WIDTH) / 2, 2 * g.BOARD_MARGIN, g.PADDLE_WIDTH, g.BALL_SIDE, 0, 0);
		this.score1 = 0;
		this.score2 = 0;

		this.top_wall = new physics.Rectangle(0, 0, g.BOARD_WIDTH, g.BOARD_MARGIN, 0, 0);
		this.bot_wall = new physics.Rectangle(0, g.BOARD_HEIGHT - g.BOARD_MARGIN, g.BOARD_WIDTH, g.BOARD_MARGIN, 0, 0);
		this.left_wall = new physics.Rectangle(0, 0, g.BOARD_MARGIN, g.BOARD_HEIGHT, 0, 0);
		this.right_wall = new physics.Rectangle(0, g.BOARD_WIDTH - g.BOARD_MARGIN, g.BOARD_MARGIN, g.BOARD_HEIGHT, 0, 0);
		this.left_corridor = new physics.Rectangle(0, 0, g.BOARD_CORRIDOR, g.BOARD_HEIGHT, 0, 0);
		this.right_corridor = new physics.Rectangle(g.BOARD_WIDTH - g.BOARD_CORRIDOR, 0, g.BOARD_CORRIDOR, g.BOARD_HEIGHT, 0, 0);
		this.net = new physics.Rectangle(g.BOARD_MARGIN, (g.BOARD_HEIGHT - 2) / 2, g.BOARD_WIDTH - (2 * g.BOARD_MARGIN), 2, 0, 0);
	}
}

/**
 * Reset the ball to its initial state.
 * @param {physics.Rectangle} ball - A Rectangle representing the ball.
 * @param {physics.Vector} direction - A Vector representing the ball's initial velocity.
 */
function reset_ball(ball, direction) {
	ball.position.x = (g.BOARD_WIDTH - ball.size.x) / 2;
	ball.position.y = (g.BOARD_HEIGHT - ball.size.y) / 2;
	ball.velocity = direction;
}

/**
 * Reset the game to its initial state.
 * @param {GameState} state - A game state.
 */
function reset_state(state) {
	state.status = g.STATUS_ACTIVE;
	state.particles = [];
	state.ball = new physics.Rectangle((g.BOARD_WIDTH - g.BALL_SIDE) / 2, (g.BOARD_HEIGHT - g.BALL_SIDE) / 2, g.BALL_SIDE, g.BALL_SIDE, 0, g.BALL_SPEED_MIN);
	state.player1 = new physics.Rectangle((g.BOARD_WIDTH - g.PADDLE_WIDTH) / 2, g.BOARD_HEIGHT - (3 * g.BOARD_MARGIN), g.PADDLE_WIDTH, g.BALL_SIDE, 0, 0);
	state.player2 = new physics.Rectangle((g.BOARD_WIDTH - g.PADDLE_WIDTH) / 2, 2 * g.BOARD_MARGIN, g.PADDLE_WIDTH, g.BALL_SIDE, 0, 0);
	state.score1 = 0;
	state.score2 = 0;
}

/* FIXME Should we use the contact point instead ? */
/**
 * Update the paddle velocity based on where it hit the paddle.
 * @param {physics.Rectangle} ball - A Rectangle representing the ball.
 * @param {physics.Rectangle} paddle - A Rectangle representing the paddle.
 * @param {physics.Vector} normal - - A Vector representing the normal of the collision.
 */
function update_ball_velocity(ball, paddle, normal) {
	const expanded =
		new physics.Rectangle(
			paddle.position.x - ball.size.x / 2,
			paddle.position.y - ball.size.y / 2,
			paddle.size.x + ball.size.x,
			paddle.size.y + ball.size.y,
			0,
			0
		);
	const b_center =
		new physics.Vector(
			ball.position.x + ball.size.x / 2,
			ball.position.y + ball.size.y / 2
		);
	const p_center =
		new physics.Vector(
			expanded.position.x + expanded.size.x / 2,
			expanded.position.y + expanded.size.y / 2
		);

	if (normal.x != 0) {
		let c = ((b_center.y - p_center.y) / (expanded.size.y / 2)) * g.BALL_MAX_ANGLE;
		ball.velocity.x = normal.x * Math.cos(c) * g.BALL_SPEED_MAX;
		ball.velocity.y = Math.sin(c) * g.BALL_SPEED_MAX;
	} else if (normal.y != 0) {
		let c = ((b_center.x - p_center.x) / (expanded.size.x / 2)) * g.BALL_MAX_ANGLE;
		ball.velocity.x = Math.sin(c) * g.BALL_SPEED_MAX;
		ball.velocity.y = normal.y * Math.cos(c) * g.BALL_SPEED_MAX;
	}
}

/* FIXME The ball passes through the paddle when stuck against the wall and paddle in the x-axis */
function update_paddle_position(ball, paddle, dt) {
	let collision = physics.aabb_continuous_detection(paddle, ball, dt);
	if (collision.time > 0 && collision.time <= 1.0) {
		sound.play_hit_sound();
		/* Scale the paddle velocity and move it so that it comes in contact with the ball without colliding with it */
		physics.aabb_continuous_resolve(paddle, collision);
		paddle.position.x += paddle.velocity.x * dt;
		/* Invert the normal in x to get the direction the ball need to go in */
		collision.normal.x *= -1;
		/* Update the ball velocity based on the contact point with paddle */
		this.update_ball_velocity(paddle, collision.normal);
	} else if (paddle.position.x + paddle.velocity.x * dt > g.BOARD_CORRIDOR && paddle.position.x + paddle.size.x + paddle.velocity.x * dt < g.BOARD_WIDTH - g.BOARD_CORRIDOR) {
		/* No collision, move the paddle normally */
		paddle.position.x += paddle.velocity.x * dt;
	}
}

function update_ball_position(state, dt) {
	let player = null;
	let collision = null;

	const c1 = physics.aabb_continuous_detection(state.ball, state.player1, dt);
	const c2 = physics.aabb_continuous_detection(state.ball, state.player2, dt);
	if (c1.time > 0) { player = state.player1; collision = c1; }
	else if (c2.time > 0) { player = state.player2; collision = c2; }

	/* Collision resolution */
	if (collision != null && player != null && collision.time > 0 && collision.time <= 1.0) {
		sound.play_hit_sound();
		/* Scale the ball velocity and move it so that it comes in contact with the paddle without colliding with it */
		physics.aabb_continuous_resolve(state.ball, collision);
		state.ball.position.x += state.ball.velocity.x * dt;
		state.ball.position.y += state.ball.velocity.y * dt;
		/* Update the ball velocity based on where it hits the paddle */
		update_ball_velocity(player, collision.normal);
	} else {
		state.ball.position.x += state.ball.velocity.x * dt;
		state.ball.position.y += state.ball.velocity.y * dt;
	}

	if (state.ball.position.x <= g.BOARD_MARGIN) {
		/* Left wall */
		state.ball.position.x = g.BOARD_MARGIN;
		state.ball.velocity.x *= -1;
		sound.play_hit_sound();
	} else if (state.ball.position.x + state.ball.size.x >= g.BOARD_WIDTH - g.BOARD_MARGIN) {
		/* Right wall */
		state.ball.position.x = g.BOARD_WIDTH - state.ball.size.x - g.BOARD_MARGIN;
		state.ball.velocity.x *= -1;
		sound.play_hit_sound();
	} else if (state.ball.position.y <= g.BOARD_MARGIN) {
		/* Top wall */
		state.score1 += 1;
		state.particles = physics.particles_create(new physics.Vector(state.ball.position.x + state.ball.size.x / 2, state.ball.position.y + state.ball.size.y / 2,), 16, 4, 5, 1.5, 100);
		sound.play_explosion_sound();
		reset_ball(new physics.Vector(0, g.BALL_SPEED_MIN));
	} else if (state.ball.position.y + state.ball.size.y >= g.BOARD_HEIGHT - g.BOARD_MARGIN) {
		/* Bottom wall */
		state.score2 += 1;
		state.particles = physics.particles_create(new physics.Vector(state.ball.position.x + state.ball.size.x / 2, state.ball.position.y + state.ball.size.y / 2,), 16, 4, 5, 1.5, 100);
		sound.play_explosion_sound();
		reset_ball(new physics.Vector(0, -g.BALL_SPEED_MIN));
	}
}

export function state_update(state, dt, t) {
	if (state.status === g.STATUS_WAITING || state.status === g.STATUS_PAUSED || state.status === g.STATUS_QUIT)
		return;

	update_paddle_position(state.player1, dt);
	update_paddle_position(state.player2, dt);

	if (state.particles.length > 0) {
		physics.particles_update(state.particles, dt);
		if (state.particles.length > 0)
			return;
	}

	/* This allows for the particle effect to finish updating when the game is over */
	if (state.status === g.STATUS_ENDED_1 || state.status === g.STATUS_ENDED_2) return;

	update_ball_position(dt);

	if (state.score1 === g.POINTS_TO_WIN) {
		state.status = g.STATUS_ENDED_1;
		sound.play_victory_sound();
	} else if (state.score2 === g.POINTS_TO_WIN) {
		state.status = g.STATUS_ENDED_2;
		sound.play_victory_sound();
	}
}

