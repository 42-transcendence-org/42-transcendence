import * as sound from "./sound.js";
import * as physics from "./physics.js";
import * as graphics from "./graphics.js";

export const LEFT = -1;
export const NEUTRAL = 0;
export const RIGHT = 1;
export const SPACE = 2;

export const STATUS_WAITING = 0;
export const STATUS_ACTIVE = 1;
export const STATUS_ENDED_1 = 2;
export const STATUS_ENDED_2 = 3;

const canvas = document.getElementById("game-canvas");
const ctx = canvas.getContext("2d");

const BOARD_WIDTH = canvas.width;
const BOARD_HEIGHT = canvas.height;

const PLAYER1 = 0;
const PLAYER2 = 1;

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
const CORRIDOR = 2 * MARGIN + 8;

const BALL_SIDE = 16;
const BALL_SPEED_MIN = (BOARD_HEIGHT / 2) - MARGIN;
const BALL_SPEED_MAX = BALL_SPEED_MIN * 1.25;

const PADDLE_WIDTH = 64;
const PADDLE_SPEED_MAX = BOARD_WIDTH - (2 * CORRIDOR);

const POINTS_TO_WIN = 5;

const MAX_ANGLE = Math.PI / 6;

export class GameState {
	constructor() {
		this.status = STATUS_WAITING;
		this.inputs = [0, 0];
		this.particles = [];
		this.net = new physics.Rectangle(MARGIN, (BOARD_HEIGHT - 2) / 2, BOARD_WIDTH - (2 * MARGIN), 2, 0, 0);
		this.ball = new physics.Rectangle(20, BOARD_HEIGHT - (3 * MARGIN) - 3, BALL_SIDE, BALL_SIDE, BALL_SPEED_MIN, 0);
		// this.ball = new physics.Rectangle((BOARD_WIDTH - BALL_SIDE) / 2, (BOARD_HEIGHT - BALL_SIDE) / 2, BALL_SIDE, BALL_SIDE, 0, BALL_SPEED_MIN);
		this.player1 = new physics.Rectangle((BOARD_WIDTH - PADDLE_WIDTH) / 2, BOARD_HEIGHT - (3 * MARGIN), PADDLE_WIDTH, BALL_SIDE, PADDLE_SPEED_MAX, 0);
		this.player2 = new physics.Rectangle((BOARD_WIDTH - PADDLE_WIDTH) / 2, 2 * MARGIN, PADDLE_WIDTH, BALL_SIDE, PADDLE_SPEED_MAX, 0);
		this.score1 = 0;
		this.score2 = 0;
	}

	input_handler(id, input) {
		this.inputs[id] = input;
		if (id === PLAYER1 && input === LEFT) this.player1.velocity.x = -PADDLE_SPEED_MAX;
		else if (id === PLAYER1 && input === RIGHT) this.player1.velocity.x = PADDLE_SPEED_MAX;
		else if (id === PLAYER2 && input === LEFT) this.player2.velocity.x = -PADDLE_SPEED_MAX;
		else if (id === PLAYER2 && input === RIGHT) this.player2.velocity.x = PADDLE_SPEED_MAX;
	}

	reset_ball(direction) {
		this.ball.position.x = (BOARD_WIDTH - this.ball.size.x) / 2;
		this.ball.position.y = (BOARD_HEIGHT - this.ball.size.y) / 2;
		this.ball.velocity = direction;
	}

	reset_game() {
		this.player1.position.x = this.player2.position.x = (BOARD_WIDTH - this.player1.size.x) / 2;
		this.player1.position.y = BOARD_HEIGHT - (3 * MARGIN);
		this.player2.position.y = 2 * MARGIN;
		this.score1 = 0;
		this.score2 = 0;

		this.reset_ball(new physics.Vector(0, BALL_SPEED_MIN));
	}

	update_ball_velocity(player, normal) {
		console.log(normal.x, normal.y);
		const b_center = new physics.Vector(this.ball.position.x + this.ball.size.x / 2, this.ball.position.y + this.ball.size.y / 2);
		const p_center = new physics.Vector(player.position.x + player.size.x / 2, player.position.y + player.size.y / 2);
		if (normal.x != 0) {
			let c = ((b_center.y - p_center.y) / (player.size.y / 2)) * MAX_ANGLE;
			this.ball.velocity.x = normal.x * Math.cos(c) * BALL_SPEED_MAX;
			this.ball.velocity.y = Math.sin(c) * BALL_SPEED_MAX;
		} else if (normal.y != 0) {
			let c = ((b_center.x - p_center.x) / (player.size.x / 2)) * MAX_ANGLE;
			this.ball.velocity.x = Math.sin(c) * BALL_SPEED_MAX;
			this.ball.velocity.y = normal.y * Math.cos(c) * BALL_SPEED_MAX;
		}
	}

	update_paddle_position(dt) {
		if (this.inputs[PLAYER1] != NEUTRAL && this.player1.position.x + this.player1.velocity.x * dt > CORRIDOR && this.player1.position.x + this.player1.size.x + this.player1.velocity.x * dt < BOARD_WIDTH - CORRIDOR)
			this.player1.position.x += this.player1.velocity.x * dt;
		if (this.inputs[PLAYER2] != NEUTRAL && this.player2.position.x + this.player2.velocity.x * dt > CORRIDOR && this.player2.position.x + this.player2.size.x + this.player2.velocity.x * dt < BOARD_WIDTH - CORRIDOR)
			this.player2.position.x += this.player2.velocity.x * dt;

		if (physics.aabb_discrete_detection(this.player1, this.ball)) {
			sound.play_hit_sound();
			const normal = physics.aabb_discrete_resolve(this.ball, this.player1);
			normal.x *= -1;
			this.update_ball_velocity(this.player1, normal);
		} else if (physics.aabb_discrete_detection(this.player2, this.ball)) {
			sound.play_hit_sound();
			const normal = physics.aabb_discrete_resolve(this.ball, this.player2);
			normal.x *= -1;
			this.update_ball_velocity(this.player2, normal);
		}
	}

	/* Check for collisions with walls */
	update_ball_position(dt) {
		this.ball.position.x += this.ball.velocity.x * dt;
		this.ball.position.y += this.ball.velocity.y * dt;

		if (physics.aabb_discrete_detection(this.ball, this.player1)) {
			sound.play_hit_sound();
			const normal = physics.aabb_discrete_resolve(this.ball, this.player1);
			this.update_ball_velocity(this.player1, normal);
		} else if (physics.aabb_discrete_detection(this.ball, this.player2)) {
			sound.play_hit_sound();
			const normal = physics.aabb_discrete_resolve(this.ball, this.player2);
			this.update_ball_velocity(this.player2, normal);
		} else if (this.ball.position.x <= MARGIN) {
			/* Left wall */
			this.ball.position.x = MARGIN;
			this.ball.velocity.x *= -1;
			sound.play_hit_sound();
		} else if (this.ball.position.x + this.ball.size.x >= BOARD_WIDTH - MARGIN) {
			/* Right wall */
			this.ball.position.x = BOARD_WIDTH - this.ball.size.x - MARGIN;
			this.ball.velocity.x *= -1;
			sound.play_hit_sound();
		} else if (this.ball.position.y <= MARGIN) {
			/* Top wall */
			this.score1 += 1;
			physics.particles_create(this.particles, this.ball, 16);
			sound.play_explosion_sound();
			this.reset_ball(new physics.Vector(0, BALL_SPEED_MIN));
		} else if (this.ball.position.y + this.ball.size.y >= BOARD_HEIGHT - MARGIN) {
			/* Bottom wall */
			this.score2 += 1;
			physics.particles_create(this.particles, this.ball, 16);
			sound.play_explosion_sound();
			this.reset_ball(new physics.Vector(0, -BALL_SPEED_MIN));
		}
	}

	update(dt) {
		if (this.status === STATUS_WAITING) return;

		this.update_paddle_position(dt);

		if (this.particles.length > 0) {
			physics.particles_update(this.particles, dt);
			if (this.particles.length > 0)
				return;
		}

		/* This allows for the particle effect to finish updating when the game is over */
		if (this.status === STATUS_ENDED_1 || this.status === STATUS_ENDED_2) return;

		this.update_ball_position(dt);

		if (this.score1 === POINTS_TO_WIN) {
			this.status = STATUS_ENDED_1;
			sound.play_victory_sound();
		} else if (this.score2 === POINTS_TO_WIN) {
			this.status = STATUS_ENDED_2;
			sound.play_victory_sound();
		}
	}

	draw() {
		/* Draw the background */
		graphics.draw_rect_fill(0, 0, BOARD_WIDTH, BOARD_HEIGHT, palette.c1);

		/* Draw the margin */
		graphics.draw_rect_fill(0, 0, MARGIN, BOARD_HEIGHT, palette.c4);
		graphics.draw_rect_fill(0, 0, BOARD_WIDTH, MARGIN, palette.c4);
		graphics.draw_rect_fill(BOARD_WIDTH - MARGIN, 0, MARGIN, BOARD_HEIGHT, palette.c4);
		graphics.draw_rect_fill(0, BOARD_HEIGHT - MARGIN, BOARD_WIDTH, MARGIN, palette.c4);

		/* Draw the vertical line in the middle of the table */
		graphics.draw_rect_fill(((BOARD_WIDTH - (MARGIN / 2)) / 2), 0, MARGIN / 2, BOARD_HEIGHT, palette.c4);

		/* Draw the net's shadow */
		graphics.draw_rect_fill(this.net.position.x + SHADOW_OFFSET_X, this.net.position.y + SHADOW_OFFSET_Y - this.net.size.y - 1, this.net.size.x - SHADOW_OFFSET_X, this.net.size.y + 2, SHADOW);

		/* Draw the net */
		graphics.draw_rect_fill(this.net.position.x, this.net.position.y, this.net.size.x, this.net.size.y, palette.c4);

		/* Draw scores shadows */
		graphics.draw_text(this.score1, BOARD_WIDTH - DOUBLE_FSIZE + SHADOW_OFFSET_X, ((BOARD_HEIGHT / 2) + FSIZE) + SHADOW_OFFSET_Y, SHADOW);
		graphics.draw_text(this.score2, BOARD_WIDTH - DOUBLE_FSIZE + SHADOW_OFFSET_X, ((BOARD_HEIGHT / 2) - (FSIZE / 3)) + SHADOW_OFFSET_Y, SHADOW);

		/* Draw scores */
		graphics.draw_text(this.score1, BOARD_WIDTH - DOUBLE_FSIZE, (BOARD_HEIGHT / 2) + FSIZE, palette.c4);
		graphics.draw_text(this.score2, BOARD_WIDTH - DOUBLE_FSIZE, (BOARD_HEIGHT / 2) - (FSIZE / 3), palette.c4);

		/* Draw the paddles and the ball shadows */
		if (this.particles.length === 0) {
			graphics.draw_rect_fill(this.ball.position.x + SHADOW_OFFSET_X, this.ball.position.y + SHADOW_OFFSET_Y, this.ball.size.x, this.ball.size.y, SHADOW);
		} else {
			this.particles.forEach(p => {
				graphics.draw_rect_fill(p.r.position.x + SHADOW_OFFSET_X, p.r.position.y + SHADOW_OFFSET_Y, p.r.size.x, p.r.size.y, SHADOW);
			});
		}
		graphics.draw_rect_fill(this.player1.position.x + SHADOW_OFFSET_X, this.player1.position.y + SHADOW_OFFSET_Y, this.player1.size.x, this.player1.size.y, SHADOW);
		graphics.draw_rect_fill(this.player2.position.x + SHADOW_OFFSET_X, this.player2.position.y + SHADOW_OFFSET_Y, this.player2.size.x, this.player2.size.y, SHADOW);

		/* Draw the paddles and the ball */
		if (this.particles.length === 0) {
			graphics.draw_rect_fill(this.ball.position.x, this.ball.position.y, this.ball.size.x, this.ball.size.y, palette.c3);
		} else {
			this.particles.forEach(p => {
				graphics.draw_rect_fill(p.r.position.x, p.r.position.y, p.r.size.x, p.r.size.y, palette.c3);
			});
		}
		graphics.draw_rect_fill(this.player1.position.x, this.player1.position.y, this.player1.size.x, this.player1.size.y, palette.c3);
		graphics.draw_rect_fill(this.player2.position.x, this.player2.position.y, this.player2.size.x, this.player2.size.y, palette.c3);


		if (this.status === STATUS_WAITING) {
			const text = "Press 'Space' to start";
			const padding = 10;
			const text_width = ctx.measureText(text).width;
			const text_x = (BOARD_WIDTH - text_width) / 2;
			const text_y = (BOARD_HEIGHT + FSIZE / 2) / 2;
			const box_w = text_width + padding * 2;
			const box_h = DOUBLE_FSIZE;
			const box_x = (BOARD_WIDTH - box_w) / 2;
			const box_y = (BOARD_HEIGHT - box_h) / 2;

			/* Draw box shadow */
			graphics.draw_rect(box_x + SHADOW_OFFSET_X - 1, box_y + SHADOW_OFFSET_Y - 1, box_w, box_h, 4, SHADOW);
			graphics.draw_rect_fill(box_x, box_y, box_w, box_h, palette.c1);

			/* Draw box */
			graphics.draw_rect(box_x, box_y, box_w, box_h, 4, palette.c4);
			graphics.draw_rect_fill(box_x, box_y, box_w, box_h, palette.c1);

			/* Draw text's shadow */
			graphics.draw_text(text, text_x + SHADOW_OFFSET_X, text_y + SHADOW_OFFSET_Y, SHADOW);

			/* Draw text */
			graphics.draw_text(text, text_x, text_y, palette.c4);
		} else if (this.status === STATUS_ENDED_1 || this.status === STATUS_ENDED_2) {
			let text;
			if (this.status === STATUS_ENDED_1) text = "Player 1 won !";
			else text = "Player 2 won !";
			let text_again = "Press 'Space' to play again"
			let padding = 10;
			let text_width = ctx.measureText(text).width;
			let box_w = text_width + padding * 2;
			let box_h = DOUBLE_FSIZE;
			let text_x = (BOARD_WIDTH - text_width) / 2;
			let box_x = (BOARD_WIDTH - box_w) / 2;
			let text_y, box_y;
			let fourth = BOARD_HEIGHT / 4;
			if (this.status === STATUS_ENDED_1) {
				text_y = ((BOARD_HEIGHT + FSIZE / 2) / 2) + fourth;
				box_y = ((BOARD_HEIGHT - box_h) / 2) + fourth;
			} else {
				text_y = ((BOARD_HEIGHT + FSIZE / 2) / 2) - fourth;
				box_y = ((BOARD_HEIGHT - box_h) / 2) - fourth;
			}

			/* Draw box shadow */
			graphics.draw_rect(box_x + SHADOW_OFFSET_X - 1, box_y + SHADOW_OFFSET_Y - 1, box_w, box_h, 4, SHADOW);

			/* Draw box */
			graphics.draw_rect(box_x, box_y, box_w, box_h, 4, palette.c4);
			graphics.draw_rect_fill(box_x, box_y, box_w, box_h, palette.c1);

			/* Draw text's shadow */
			graphics.draw_text(text, text_x + SHADOW_OFFSET_X, text_y + SHADOW_OFFSET_Y, SHADOW);

			/* Draw text */
			graphics.draw_text(text, text_x, text_y, palette.c4);

			let text_width_again = ctx.measureText(text_again).width;
			let text_x_again = (BOARD_WIDTH - text_width_again) / 2;
			let text_y_again = ((BOARD_HEIGHT + FSIZE / 2) / 2);
			let box_w_again = text_width_again + padding * 2;
			let box_h_again = DOUBLE_FSIZE;
			let box_x_again = (BOARD_WIDTH - box_w_again) / 2;
			let box_y_again = ((BOARD_HEIGHT - box_h_again) / 2);

			/* Draw box shadow */
			graphics.draw_rect(box_x_again + SHADOW_OFFSET_X - 1, box_y_again + SHADOW_OFFSET_Y - 1, box_w_again, box_h_again, 4, SHADOW);

			/* Draw box */
			graphics.draw_rect(box_x_again, box_y_again, box_w_again, box_h_again, 4, palette.c4);
			graphics.draw_rect_fill(box_x_again, box_y_again, box_w_again, box_h_again, palette.c1);

			/* Draw text's shadow */
			graphics.draw_text(text_again, text_x_again + SHADOW_OFFSET_X, text_y_again + SHADOW_OFFSET_Y, SHADOW);

			/* Draw text */
			graphics.draw_text(text_again, text_x_again, text_y_again, palette.c4);

		}
	}

}
