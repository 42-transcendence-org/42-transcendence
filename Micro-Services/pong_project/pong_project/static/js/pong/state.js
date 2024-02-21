import * as g from './global.js';
import * as sound from "./sound.js";
import * as physics from "./physics.js";

export class GameState {
	constructor() {
		this.status = g.STATUS_BEGIN;
		this.particles = [];
		this.ball = new physics.Rectangle((g.BOARD_WIDTH - g.BALL_SIDE) / 2, (g.BOARD_HEIGHT - g.BALL_SIDE) / 2, g.BALL_SIDE, g.BALL_SIDE, 0, g.BALL_SPEED_MIN);
		this.player1 = new physics.Rectangle((g.BOARD_WIDTH - g.PADDLE_WIDTH) / 2, g.BOARD_HEIGHT - (3 * g.BOARD_MARGIN), g.PADDLE_WIDTH, g.BALL_SIDE, 0, 0);
		this.player2 = new physics.Rectangle((g.BOARD_WIDTH - g.PADDLE_WIDTH) / 2, 2 * g.BOARD_MARGIN, g.PADDLE_WIDTH, g.BALL_SIDE, 0, 0);
		this.score1 = 0;
		this.score2 = 0;
		this.who_serves = true;
	}
}

function reset_ball(ball, who_serves) {
	ball.position.x = (g.BOARD_WIDTH - ball.size.x) / 2;
	ball.position.y = (g.BOARD_HEIGHT - ball.size.y) / 2;
	ball.velocity.x = 0;
	ball.velocity.y = who_serves ? g.BALL_SPEED_MIN : -g.BALL_SPEED_MIN;
}

export function reset_state(state) {
	state.status = g.STATUS_ACTIVE;
	state.particles = [];
	state.ball = new physics.Rectangle((g.BOARD_WIDTH - g.BALL_SIDE) / 2, (g.BOARD_HEIGHT - g.BALL_SIDE) / 2, g.BALL_SIDE, g.BALL_SIDE, 0, g.BALL_SPEED_MIN);
	state.player1 = new physics.Rectangle((g.BOARD_WIDTH - g.PADDLE_WIDTH) / 2, g.BOARD_HEIGHT - (3 * g.BOARD_MARGIN), g.PADDLE_WIDTH, g.BALL_SIDE, 0, 0);
	state.player2 = new physics.Rectangle((g.BOARD_WIDTH - g.PADDLE_WIDTH) / 2, 2 * g.BOARD_MARGIN, g.PADDLE_WIDTH, g.BALL_SIDE, 0, 0);
	state.score1 = 0;
	state.score2 = 0;
}

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

function update_paddle_position(ball, paddle, dt) {
	let c_ball = physics.aabb_continuous_detection(paddle, ball, dt);
	if (c_ball.time > 0 && c_ball.time <= 1.0) {
		sound.play_hit_sound();
		let v = physics.aabb_continuous_resolve(paddle, c_ball);
		paddle.position.x += v.x * dt;
		c_ball.normal.x *= -1;
		update_ball_velocity(ball, paddle, c_ball.normal);
	} else if (paddle.position.x + paddle.velocity.x * dt > g.BOARD_CORRIDOR && paddle.position.x + paddle.size.x + paddle.velocity.x * dt < g.BOARD_WIDTH - g.BOARD_CORRIDOR) {
		paddle.position.x += paddle.velocity.x * dt;
	}
}

function update_ball_position(state, dt) {
	let player = null;
	let collision = null;

	const c1 = physics.aabb_continuous_detection(state.ball, state.player1, dt);
	const c2 = physics.aabb_continuous_detection(state.ball, state.player2, dt);

	if (c1.time > 0) {
		player = state.player1; collision = c1;
	} else if (c2.time > 0) {
		player = state.player2; collision = c2;
	}

	if (collision != null && player != null && collision.time > 0 && collision.time <= 1.0) {
		sound.play_hit_sound();
		let v = physics.aabb_continuous_resolve(state.ball, collision);
		state.ball.position.x += v.x * dt;
		state.ball.position.y += v.y * dt;
		update_ball_velocity(state.ball, player, collision.normal);
	} else {
		state.ball.position.x += state.ball.velocity.x * dt;
		state.ball.position.y += state.ball.velocity.y * dt;
	}

	if (state.ball.position.x <= g.BOARD_MARGIN || state.ball.position.x + state.ball.size.x >= g.BOARD_WIDTH - g.BOARD_MARGIN) {
		/* Left and right walls */
		state.ball.position.x = state.ball.position.x <= g.BOARD_MARGIN ? g.BOARD_MARGIN : g.BOARD_WIDTH - state.ball.size.x - g.BOARD_MARGIN;
		state.ball.velocity.x *= -1;
		sound.play_hit_sound();
	} else if (state.ball.position.y <= g.BOARD_MARGIN || state.ball.position.y + state.ball.size.y >= g.BOARD_HEIGHT - g.BOARD_MARGIN) {
		/* Top and bottoms walls */
		if (state.ball.position.y <= g.BOARD_MARGIN)
			state.score1 += 1;
		else
			state.score2 += 1;
		state.status = g.STATUS_SCORE;
	}
}

export function state_update(session, state) {
	if (state.status === g.STATUS_BEGIN || state.status === g.STATUS_PAUSED || state.status === g.STATUS_QUIT)
		return;

	update_paddle_position(state.ball, state.player1, session.dt);
	update_paddle_position(state.ball, state.player2, session.dt);

	if (state.status === g.STATUS_SCORE || state.status === g.STATUS_ENDED_1 || state.status === g.STATUS_ENDED_2) {
		if (state.particles.length === 0) {
			sound.play_explosion_sound();
			state.particles = physics.particles_create(new physics.Vector(state.ball.position.x + state.ball.size.x / 2, state.ball.position.y + state.ball.size.y / 2,), 16, 4, 5, 100);
		}

		/* FIXME: Find a way to delete the particles when the game is over */
		if (session.t - session.saved_t < 1.5) {
			physics.particles_update(state.particles, session.dt);
			return;
		} else if (state.status === g.STATUS_SCORE) {
			state.status = g.STATUS_ACTIVE;
			state.particles = [];
			state.who_serves = !state.who_serves; /* Change service */
			reset_ball(state.ball, state.who_serves);
		}
	}

	session.saved_t = session.t;
	/* This allows for the particle effect to finish updating when the game is over */
	if (state.status === g.STATUS_ENDED_1 || state.status === g.STATUS_ENDED_2) return;

	update_ball_position(state, session.dt);

	if (state.score1 === g.POINTS_TO_WIN || state.score2 === g.POINTS_TO_WIN) {
		state.status = state.score1 === g.POINTS_TO_WIN ? g.STATUS_ENDED_1 : g.STATUS_ENDED_2;
		sound.play_victory_sound();
	}
}

