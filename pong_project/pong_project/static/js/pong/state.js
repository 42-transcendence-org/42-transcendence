import * as sound from "./sound.js";
import * as physics from "./physics.js";
import * as graphics from "./graphics.js";

import { Input } from './main.js';

const canvas = document.getElementById("game-canvas");
const ctx = canvas.getContext("2d");

const BOARD_WIDTH = canvas.width;
const BOARD_HEIGHT = canvas.height;

/* INPUTS */
const INPUT_LEFT = 0;
const INPUT_RIGHT = 1;
const INPUT_SPACE = 2;
const INPUT_NEUTRAL = 3;
const INPUT_QUIT = 4;

/* STATUSES */
const STATUS_WAITING = 0;
const STATUS_ACTIVE = 1;
const STATUS_ENDED_1 = 2;
const STATUS_ENDED_2 = 3;
const STATUS_PAUSED = 4;
const STATUS_QUIT = 5;

/* GAME TYPES */
export const TYPE_REMOTE = 0;
export const TYPE_LOCAL = 1;
export const TYPE_AI = 2;

/* PLAYERS' IDS */
const ID_PLAYER1 = 0;
const ID_PLAYER2 = 1;

const palette = {
	c1: "#2B2A4C", /* purple */
	c2: "#B31312", /* red */
	c3: "#EA906C", /* flesh */
	c4: "#EEE2DE", /* light grey */
}
const SHADOW = "#252442";
const SHADOW_OFFSET_X = 5;
const SHADOW_OFFSET_Y = 5;

/* font size */
const FSIZE = 24;
const DOUBLE_FSIZE = 48;

const MARGIN = 16;
const CORRIDOR = 2 * MARGIN;

const BALL_SIDE = 16;
const BALL_SPEED_MIN = (BOARD_HEIGHT / 2) - MARGIN;
const BALL_SPEED_MAX = BALL_SPEED_MIN * 2.0;

const PADDLE_WIDTH = 64;
const PADDLE_SPEED = BOARD_WIDTH - (2 * CORRIDOR);

const POINTS_TO_WIN = 1;

const MAX_ANGLE = Math.PI / 6;

const net = new physics.Rectangle(MARGIN, (BOARD_HEIGHT - 2) / 2, BOARD_WIDTH - (2 * MARGIN), 2, 0, 0);

const top_wall = new physics.Rectangle(0, 0, BOARD_WIDTH, MARGIN, 0, 0);
const bot_wall = new physics.Rectangle(0, BOARD_HEIGHT - MARGIN, BOARD_WIDTH, MARGIN, 0, 0);
const left_wall = new physics.Rectangle(0, 0, MARGIN, BOARD_HEIGHT, 0, 0);
const right_wall = new physics.Rectangle(0, BOARD_WIDTH - MARGIN, MARGIN, BOARD_HEIGHT, 0, 0);
const left_corridor = new physics.Rectangle(MARGIN, (BOARD_HEIGHT - 2) / 2, BOARD_WIDTH - (2 * MARGIN), 2, 0, 0);
const right_corridor = new physics.Rectangle(MARGIN, (BOARD_HEIGHT - 2) / 2, BOARD_WIDTH - (2 * MARGIN), 2, 0, 0);

class GameState {
	constructor() {
		this.status = STATUS_WAITING;
		this.particles = [];
		this.ball = new physics.Rectangle((BOARD_WIDTH - BALL_SIDE) / 2, (BOARD_HEIGHT - BALL_SIDE) / 2, BALL_SIDE, BALL_SIDE, 0, BALL_SPEED_MIN);
		this.player1 = new physics.Rectangle((BOARD_WIDTH - PADDLE_WIDTH) / 2, BOARD_HEIGHT - (3 * MARGIN), PADDLE_WIDTH, BALL_SIDE, 0, 0);
		this.player2 = new physics.Rectangle((BOARD_WIDTH - PADDLE_WIDTH) / 2, 2 * MARGIN, PADDLE_WIDTH, BALL_SIDE, 0, 0);
		this.score1 = 0;
		this.score2 = 0;
	}
}

/**
 * Reset the ball to its initial state.
 * @param {physics.Rectangle} ball - A Rectangle representing the ball.
 * @param {physics.Vector} direction - A Vector representing the ball's initial velocity.
 */
function reset_ball(ball, direction) {
	ball.position.x = (BOARD_WIDTH - ball.size.x) / 2;
	ball.position.y = (BOARD_HEIGHT - ball.size.y) / 2;
	ball.velocity = direction;
}

/**
 * Reset the game to its initial state.
 * @param {GameState} state - A game state.
 */
function reset_state(state) {
	state.status = STATUS_ACTIVE;
	state.particles = [];
	state.ball = new physics.Rectangle((BOARD_WIDTH - BALL_SIDE) / 2, (BOARD_HEIGHT - BALL_SIDE) / 2, BALL_SIDE, BALL_SIDE, 0, BALL_SPEED_MIN);
	state.player1 = new physics.Rectangle((BOARD_WIDTH - PADDLE_WIDTH) / 2, BOARD_HEIGHT - (3 * MARGIN), PADDLE_WIDTH, BALL_SIDE, 0, 0);
	state.player2 = new physics.Rectangle((BOARD_WIDTH - PADDLE_WIDTH) / 2, 2 * MARGIN, PADDLE_WIDTH, BALL_SIDE, 0, 0);
	state.score1 = 0;
	state.score2 = 0;
}

/**
 * Apply all inputs to the game state.
 * @param {GameState} state - A game state.
 * @param {Input[]} inputs - An array of inputs.
 */
function apply_inputs(state, inputs) {
	inputs.forEach((input) => {
		let player = (input.id === ID_PLAYER1 ? state.player1 : state.player2);
		switch (input.input) {
			case INPUT_NEUTRAL:
				player.velocity.x = 0;
				break;
			case INPUT_LEFT:
				player.velocity.x = -PADDLE_SPEED;
				break;
			case INPUT_RIGHT:
				player.velocity.x = PADDLE_SPEED;
				break;
			case INPUT_SPACE:
				if (state.status === STATUS_WAITING) {
					state.status = STATUS_ACTIVE;
					sound.play_music();
				} else if (state.status === STATUS_ACTIVE || state.status === STATUS_PAUSED) {
					state.status = state.status === STATUS_ACTIVE ? STATUS_PAUSED : STATUS_ACTIVE;
				} else if (state.status === STATUS_ENDED_1 || state.status === STATUS_ENDED_2) {
					state.status = STATUS_ACTIVE;
					reset_game();
				}
				break;
			case INPUT_QUIT:
				if (state.status === STATUS_ENDED_1 || state.status === STATUS_ENDED_2) {
					state.status = STATUS_QUIT;
				}
				break;
		}
	});
	/* FIXME Move this somewhere else */
	if (type != TYPE_REMOTE)
		inputs = [];
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
		let c = ((b_center.y - p_center.y) / (expanded.size.y / 2)) * MAX_ANGLE;
		ball.velocity.x = normal.x * Math.cos(c) * BALL_SPEED_MAX;
		ball.velocity.y = Math.sin(c) * BALL_SPEED_MAX;
	} else if (normal.y != 0) {
		let c = ((b_center.x - p_center.x) / (expanded.size.x / 2)) * MAX_ANGLE;
		ball.velocity.x = Math.sin(c) * BALL_SPEED_MAX;
		ball.velocity.y = normal.y * Math.cos(c) * BALL_SPEED_MAX;
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
	} else if (paddle.position.x + paddle.velocity.x * dt > CORRIDOR && paddle.position.x + paddle.size.x + paddle.velocity.x * dt < BOARD_WIDTH - CORRIDOR) {
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

	if (state.ball.position.x <= MARGIN) {
		/* Left wall */
		state.ball.position.x = MARGIN;
		state.ball.velocity.x *= -1;
		sound.play_hit_sound();
	} else if (state.ball.position.x + state.ball.size.x >= BOARD_WIDTH - MARGIN) {
		/* Right wall */
		state.ball.position.x = BOARD_WIDTH - state.ball.size.x - MARGIN;
		state.ball.velocity.x *= -1;
		sound.play_hit_sound();
	} else if (state.ball.position.y <= MARGIN) {
		/* Top wall */
		state.score1 += 1;
		state.particles = physics.particles_create(new physics.Vector(state.ball.position.x + state.ball.size.x / 2, state.ball.position.y + state.ball.size.y / 2,), 16, 4, 5, 1.5, 100);
		sound.play_explosion_sound();
		reset_ball(new physics.Vector(0, BALL_SPEED_MIN));
	} else if (state.ball.position.y + state.ball.size.y >= BOARD_HEIGHT - MARGIN) {
		/* Bottom wall */
		state.score2 += 1;
		state.particles = physics.particles_create(new physics.Vector(state.ball.position.x + state.ball.size.x / 2, state.ball.position.y + state.ball.size.y / 2,), 16, 4, 5, 1.5, 100);
		sound.play_explosion_sound();
		reset_ball(new physics.Vector(0, -BALL_SPEED_MIN));
	}
}

function state_update(state, dt, t) {
	apply_inputs(state);

	if (state.status === STATUS_WAITING || state.status === STATUS_PAUSED || state.status === STATUS_QUIT)
		return;

	update_paddle_position(state.player1, dt);
	update_paddle_position(state.player2, dt);

	if (state.particles.length > 0) {
		physics.particles_update(state.particles, dt);
		if (state.particles.length > 0)
			return;
	}

	/* This allows for the particle effect to finish updating when the game is over */
	if (state.status === STATUS_ENDED_1 || state.status === STATUS_ENDED_2) return;

	update_ball_position(dt);

	if (state.score1 === POINTS_TO_WIN) {
		state.status = STATUS_ENDED_1;
		sound.play_victory_sound();
	} else if (state.score2 === POINTS_TO_WIN) {
		state.status = STATUS_ENDED_2;
		sound.play_victory_sound();
	}
}

function state_draw(state) {
	/* Draw the background */
	graphics.draw_rect_fill(0, 0, BOARD_WIDTH, BOARD_HEIGHT, palette.c1);

	/* Draw the margin */
	graphics.draw_rect_fill(0, 0, MARGIN, BOARD_HEIGHT, palette.c4);
	graphics.draw_rect_fill(0, 0, BOARD_WIDTH, MARGIN, palette.c4);
	graphics.draw_rect_fill(BOARD_WIDTH - MARGIN, 0, MARGIN, BOARD_HEIGHT, palette.c4);
	graphics.draw_rect_fill(0, BOARD_HEIGHT - MARGIN, BOARD_WIDTH, MARGIN, palette.c4);

	/* Draw the vertical line in the middle of the table */
	graphics.draw_rect_fill(((BOARD_WIDTH - (MARGIN / 2)) / 2), 0, MARGIN / 2, BOARD_HEIGHT, palette.c4);

	/* Draw the net */
	graphics.draw_rect_fill(net.position.x + SHADOW_OFFSET_X, net.position.y + SHADOW_OFFSET_Y - net.size.y - 1, net.size.x - SHADOW_OFFSET_X, net.size.y + 2, SHADOW);
	graphics.draw_rect_fill(net.position.x, net.position.y, net.size.x, net.size.y, palette.c4);

	/* Draw scores */
	graphics.draw_text(state.score1, BOARD_WIDTH - DOUBLE_FSIZE + SHADOW_OFFSET_X, ((BOARD_HEIGHT / 2) + FSIZE) + SHADOW_OFFSET_Y, SHADOW);
	graphics.draw_text(state.score2, BOARD_WIDTH - DOUBLE_FSIZE + SHADOW_OFFSET_X, ((BOARD_HEIGHT / 2) - (FSIZE / 3)) + SHADOW_OFFSET_Y, SHADOW);
	graphics.draw_text(state.score1, BOARD_WIDTH - DOUBLE_FSIZE, (BOARD_HEIGHT / 2) + FSIZE, palette.c4);
	graphics.draw_text(state.score2, BOARD_WIDTH - DOUBLE_FSIZE, (BOARD_HEIGHT / 2) - (FSIZE / 3), palette.c4);

	/* Draw ball, paddles and particles */
	if (state.particles.length === 0) {
		graphics.draw_rect_fill(state.ball.position.x + SHADOW_OFFSET_X, state.ball.position.y + SHADOW_OFFSET_Y, state.ball.size.x, state.ball.size.y, SHADOW);
	} else {
		state.particles.forEach(p => {
			graphics.draw_rect_fill(p.r.position.x + SHADOW_OFFSET_X, p.r.position.y + SHADOW_OFFSET_Y, p.r.size.x, p.r.size.y, SHADOW);
		});
	}
	graphics.draw_rect_fill(state.player1.position.x + SHADOW_OFFSET_X, state.player1.position.y + SHADOW_OFFSET_Y, state.player1.size.x, state.player1.size.y, SHADOW);
	graphics.draw_rect_fill(state.player2.position.x + SHADOW_OFFSET_X, state.player2.position.y + SHADOW_OFFSET_Y, state.player2.size.x, state.player2.size.y, SHADOW);
	if (state.particles.length === 0) {
		graphics.draw_rect_fill(state.ball.position.x, state.ball.position.y, state.ball.size.x, state.ball.size.y, palette.c3);
	} else {
		state.particles.forEach(p => {
			graphics.draw_rect_fill(p.r.position.x, p.r.position.y, p.r.size.x, p.r.size.y, palette.c3);
		});
	}
	graphics.draw_rect_fill(state.player1.position.x, state.player1.position.y, state.player1.size.x, state.player1.size.y, palette.c3);
	graphics.draw_rect_fill(state.player2.position.x, state.player2.position.y, state.player2.size.x, state.player2.size.y, palette.c3);

	/* Draw message boxes */
	if (state.status === STATUS_WAITING || state.status === STATUS_PAUSED) {

		const text = state.status === STATUS_WAITING ? "Hit 'Space' to start" : "Paused";
		const padding = 10;

		const text_w = ctx.measureText(text).width;
		const text_x = (BOARD_WIDTH - text_w) / 2;
		const text_y = (BOARD_HEIGHT + FSIZE / 2) / 2;

		const box_w = text_w + padding * 2;
		const box_h = DOUBLE_FSIZE;
		const box_x = (BOARD_WIDTH - box_w) / 2;
		const box_y = (BOARD_HEIGHT - box_h) / 2;

		/* Draw box */
		graphics.draw_rect(box_x + SHADOW_OFFSET_X - 1, box_y + SHADOW_OFFSET_Y - 1, box_w, box_h, 4, SHADOW);
		graphics.draw_rect(box_x, box_y, box_w, box_h, 4, palette.c4);
		graphics.draw_rect_fill(box_x, box_y, box_w, box_h, palette.c1);

		/* Draw text */
		graphics.draw_text(text, text_x + SHADOW_OFFSET_X, text_y + SHADOW_OFFSET_Y, SHADOW);
		graphics.draw_text(text, text_x, text_y, palette.c4);

	} else if (state.status === STATUS_ENDED_1 || state.status === STATUS_ENDED_2) {

		const text_victory = state.status === STATUS_ENDED_1 ? "Player 1 won !" : "Player 2 won !";
		const text_again = "Hit 'Space' to play again";
		const text_quit = "or 'Escape' to quit";
		const fourth = BOARD_HEIGHT / 4;
		const padding = 10;

		let text_w = ctx.measureText(text_victory).width;
		let box_w = text_w + padding * 2;
		let box_h = DOUBLE_FSIZE;
		let box_x = (BOARD_WIDTH - box_w) / 2;
		let box_y = state.status === STATUS_ENDED_1 ? ((BOARD_HEIGHT - box_h) / 2) + fourth : ((BOARD_HEIGHT - box_h) / 2) - fourth;

		let text_x = (BOARD_WIDTH - text_w) / 2;
		let text_y = state.status === STATUS_ENDED_1 ? ((BOARD_HEIGHT + FSIZE / 2) / 2) + fourth : ((BOARD_HEIGHT + FSIZE / 2) / 2) - fourth;

		/* Draw victory box */
		graphics.draw_rect(box_x + SHADOW_OFFSET_X - 1, box_y + SHADOW_OFFSET_Y - 1, box_w, box_h, 4, SHADOW);
		graphics.draw_rect(box_x, box_y, box_w, box_h, 4, palette.c4);
		graphics.draw_rect_fill(box_x, box_y, box_w, box_h, palette.c1);

		/* Draw victory text */
		graphics.draw_text(text_victory, text_x + SHADOW_OFFSET_X, text_y + SHADOW_OFFSET_Y, SHADOW);
		graphics.draw_text(text_victory, text_x, text_y, palette.c4);

		let text_again_w = ctx.measureText(text_again).width;
		let text_quit_w = ctx.measureText(text_quit).width;
		let max_text_w = Math.max(text_again_w, text_quit_w);

		box_w = max_text_w + padding * 2;
		box_h = 2 * DOUBLE_FSIZE;
		box_x = (BOARD_WIDTH - box_w) / 2;
		box_y = (BOARD_HEIGHT - box_h) / 2;

		let text_again_x = (BOARD_WIDTH - text_again_w) / 2;
		let text_quit_x = (BOARD_WIDTH - text_quit_w) / 2;

		let text_again_y = box_y + FSIZE + padding;
		let text_quit_y = box_y + box_h - FSIZE;

		/* Draw info box */
		graphics.draw_rect(box_x + SHADOW_OFFSET_X - 1, box_y + SHADOW_OFFSET_Y - 1, box_w, box_h, 4, SHADOW);
		graphics.draw_rect(box_x, box_y, box_w, box_h, 4, palette.c4);
		graphics.draw_rect_fill(box_x, box_y, box_w, box_h, palette.c1);

		/* Draw info text */
		graphics.draw_text(text_again, text_again_x + SHADOW_OFFSET_X, text_again_y + SHADOW_OFFSET_Y, SHADOW);
		graphics.draw_text(text_quit, text_quit_x + SHADOW_OFFSET_X, text_quit_y + SHADOW_OFFSET_Y, SHADOW);
		graphics.draw_text(text_again, text_again_x, text_again_y, palette.c4);
		graphics.draw_text(text_quit, text_quit_x, text_quit_y, palette.c4);
	}
}
