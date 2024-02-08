import * as g from './global.js';
import * as sound from "./sound.js";
import * as physics from "./physic.js";

export class GameState {
	constructor() {
		this.status = g.STATUS_WAITING;
		this.particles = [];
		this.ball = new physics.Rectangle(20, g.BOARD_HEIGHT - (3 * g.BOARD_MARGIN), g.BALL_SIDE, g.BALL_SIDE, g.BALL_SPEED_MIN, 0);
		// this.ball = new physics.Rectangle((g.BOARD_WIDTH - g.BALL_SIDE) / 2, (g.BOARD_HEIGHT - g.BALL_SIDE) / 2, g.BALL_SIDE, g.BALL_SIDE, 0, g.BALL_SPEED_MIN);
		this.player1 = new physics.Rectangle((g.BOARD_WIDTH - g.PADDLE_WIDTH) / 2, g.BOARD_HEIGHT - (3 * g.BOARD_MARGIN), g.PADDLE_WIDTH, g.BALL_SIDE, 0, 0);
		this.player2 = new physics.Rectangle((g.BOARD_WIDTH - g.PADDLE_WIDTH) / 2, 2 * g.BOARD_MARGIN, g.PADDLE_WIDTH, g.BALL_SIDE, 0, 0);
		this.score1 = 0;
		this.score2 = 0;

		this.top_wall = new physics.Rectangle(0, 0, g.BOARD_WIDTH, g.BOARD_MARGIN, 0, 0);
		this.bot_wall = new physics.Rectangle(0, g.BOARD_HEIGHT - g.BOARD_MARGIN, g.BOARD_WIDTH, g.BOARD_MARGIN, 0, 0);
		this.left_wall = new physics.Rectangle(0, 0, g.BOARD_MARGIN, g.BOARD_HEIGHT, 0, 0);
		this.right_wall = new physics.Rectangle(g.BOARD_WIDTH - g.BOARD_MARGIN, 0, g.BOARD_MARGIN, g.BOARD_HEIGHT, 0, 0);
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
export function reset_state(state) {
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
function update_paddle_position(ball, paddle, corridor, dt) {

	if (paddle.velocity.x === 0) return;

	const c_ball = physics.aabb_continuous_detection(paddle, ball, dt);
	const c_corridor = physics.aabb_continuous_detection(paddle, corridor, dt);

	if (c_ball.time > 0 && c_ball.time <= 1.0) {
		sound.play_hit_sound();
		const v = physics.aabb_continuous_resolve(paddle, c_ball);
		paddle.position.x += v.x * dt;
		c_ball.normal.x *= -1;
		update_ball_velocity(ball, paddle, c_ball.normal);
	} else if (c_corridor.time > 0 && c_corridor.time <= 1.0) {
		paddle.velocity.x = 0;
	} else {
		paddle.position.x += paddle.velocity.x * dt;
	}
}

function update_ball_position(state, dt) {
	let player = null;
	let collision = null;

	const c1 = physics.aabb_continuous_detection(state.ball, state.player1, dt);
	const c2 = physics.aabb_continuous_detection(state.ball, state.player2, dt);
	const c_top = physics.aabb_continuous_detection(state.ball, state.top_wall, dt);
	const c_bot = physics.aabb_continuous_detection(state.ball, state.bot_wall, dt);
	const c_left = physics.aabb_continuous_detection(state.ball, state.left_wall, dt);
	const c_right = physics.aabb_continuous_detection(state.ball, state.right_wall, dt);

	if (c1.time > 0) {
		player = state.player1; collision = c1;
	} else if (c2.time > 0) {
		player = state.player2; collision = c2;
	}

	if (collision != null && player != null && collision.time > 0 && collision.time <= 1.0) {
		sound.play_hit_sound();
		const v = physics.aabb_continuous_resolve(state.ball, collision);
		state.ball.position.x += v.x * dt;
		state.ball.position.y += v.y * dt;
		update_ball_velocity(state.ball, player, collision.normal);
	} else if ((c_top.time > 0 && c_top.time <= 1.0) || (c_bot.time > 0 && c_bot.time <= 1.0)) {
		/* Top and bottom walls */
		let score = (c_top.time > 0 && c_top.time <= 1.0) ? state.score1 : state.score2;
		const dir = (c_top.time > 0 && c_top.time <= 1.0) ? new physics.Vector(0, g.BALL_SPEED_MIN) : new physics.Vector(0, -g.BALL_SPEED_MIN)
		const c = (c_top.time > 0 && c_top.time <= 1.0) ? c_top : c_bot;
		const v = physics.aabb_continuous_resolve(state.ball, c_top);
		state.ball.position.x += v.x * dt;
		state.ball.position.y += v.y * dt;
		state.ball.velocity.x *= -1;
		score += 1;
		state.particles = physics.particles_create(new physics.Vector(state.ball.position.x + state.ball.size.x / 2, state.ball.position.y + state.ball.size.y / 2,), 16, 4, 5, 1.5, 100);
		sound.play_explosion_sound();
		reset_ball(state.ball, dir);
	} else if ((c_left.time > 0 && c_left.time <= 1.0) || (c_right.time > 0 && c_right.time <= 1.0)) {
		/* Left and right walls */
		const c = (c_left.time > 0 && c_left.time <= 1.0) ? c_left : c_right;
		const v = physics.aabb_continuous_resolve(state.ball, c);
		state.ball.position.x += v.x * dt;
		state.ball.position.y += v.y * dt;
		state.ball.velocity.x *= -1;
		sound.play_hit_sound();
	} else {
		state.ball.position.x += state.ball.velocity.x * dt;
		state.ball.position.y += state.ball.velocity.y * dt;
	}
}

export function state_update(state, dt, t) {
	if (state.status === g.STATUS_WAITING || state.status === g.STATUS_PAUSED || state.status === g.STATUS_QUIT)
		return;

	update_paddle_position(state.ball, state.player1, state.player1.velocity.x < 0 ? state.left_corridor : state.right_corridor, dt);
	update_paddle_position(state.ball, state.player2, state.player2.velocity.x < 0 ? state.left_corridor : state.right_corridor, dt);

	if (state.particles.length > 0) {
		physics.particles_update(state.particles, dt);
		if (state.particles.length > 0)
			return;
	}

	/* This allows for the particle effect to finish updating when the game is over */
	if (state.status === g.STATUS_ENDED_1 || state.status === g.STATUS_ENDED_2) return;

	update_ball_position(state, dt);

	if (state.score1 === g.POINTS_TO_WIN) {
		state.status = g.STATUS_ENDED_1;
		sound.play_victory_sound();
	} else if (state.score2 === g.POINTS_TO_WIN) {
		state.status = g.STATUS_ENDED_2;
		sound.play_victory_sound();
	}
}

