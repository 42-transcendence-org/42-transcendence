import * as sound from "./sound.js";
import * as physics from "./physics.js";
import * as graphics from "./graphics.js";

export const LEFT = -1;
export const RIGHT = 1;
export const NEUTRAL = 0;

export const STATUS_WAITING = 0;
export const STATUS_ACTIVE = 1;
export const STATUS_ENDED_1 = 2;
export const STATUS_ENDED_2 = 3;

const canvas = document.getElementById("game-canvas");
const ctx = canvas.getContext("2d");

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

const BALL_SIDE = 16
const BALL_SPEED_MAX = 0.70;
const BALL_SPEED_MIN = 0.40;

const PADDLE_WIDTH = 64
const PADDLE_SPEED_MAX = 1.0;
const PADDLE_ACCELERATION = 1.0 / 8000;
const PADDLE_DECCELERATION = 1.0 / 5000;

const POINTS_TO_WIN = 10;

const MAX_ANGLE = Math.PI / 6;

export class GameState {
	constructor() {
		this.status = STATUS_WAITING;
		this.inputs = [0, 0];
		this.particles = [];
		this.net = new physics.Rectangle(MARGIN, (canvas.height - 2) / 2, canvas.width - (2 * MARGIN), 2, 0, 0);
		this.ball = new physics.Rectangle(0, 0, BALL_SIDE, BALL_SIDE, 0, 0);
		this.player1 = new physics.Rectangle(0, 0, PADDLE_WIDTH, BALL_SIDE, 0, 0);
		this.player2 = new physics.Rectangle(0, 0, PADDLE_WIDTH, BALL_SIDE, 0, 0);
		this.score1 = 0;
		this.score2 = 0;
		this.who_scored = 0;
	}

	input_handler(id, input) {
		this.inputs[id] = input
	}

	reset_ball(direction) {
		this.ball.position.x = (canvas.width - this.ball.size.x) / 2;
		this.ball.position.y = (canvas.height - this.ball.size.y) / 2;
		this.ball.velocity = physics.get_vector_in_range(direction, Math.PI / 6);
		this.ball.velocity.x *= BALL_SPEED_MIN;
		this.ball.velocity.y *= BALL_SPEED_MIN;
	}

	reset_game() {
		this.player1.position.x = this.player2.position.x = (canvas.width - this.player1.size.x) / 2;
		this.player1.position.y = canvas.height - (3 * MARGIN);
		this.player2.position.y = 2 * MARGIN;
		this.score1 = 0;
		this.score2 = 0;

		this.reset_ball(new physics.Vector(0, 1));
	}

	update_paddle_velocity(id, player) {
		if (this.inputs[id] != NEUTRAL) {
			let dv = PADDLE_ACCELERATION * this.inputs[id];
			player.velocity.x += dv;
			player.velocity.x = Math.min(Math.max(player.velocity.x, -PADDLE_SPEED_MAX), PADDLE_SPEED_MAX);
		} else {
			let sign = Math.sign(player.velocity.x);
			let dv = -sign * PADDLE_DECCELERATION;
			player.velocity.x += dv;
			if (Math.abs(player.velocity.x) < PADDLE_DECCELERATION) player.velocity.x = 0;
		}
	}

	/* Give a new direction to the ball based on where it hits the paddle */
	update_ball_velocity(player, collision) {
		let expanded = new physics.Rectangle(
			player.position.x - this.ball.size.x / 2,
			player.position.y - this.ball.size.y / 2,
			player.size.x + this.ball.size.x,
			player.size.y + this.ball.size.y,
			0, 0
		);
		if (collision.normal.x != 0) {
			let r1_center = this.ball.position.y + this.ball.size.y / 2;
			let r2_center = expanded.position.y + expanded.size.y / 2;
			let c = (r1_center - r2_center) / (expanded.size.y / 2);
			c *= MAX_ANGLE;
			this.ball.velocity.x = collision.normal.x * Math.cos(c) * BALL_SPEED_MAX;
			this.ball.velocity.y = Math.sin(c) * BALL_SPEED_MAX;
		}
		if (collision.normal.y != 0) {
			let r1_center = this.ball.position.x + this.ball.size.x / 2;
			let r2_center = expanded.position.x + expanded.size.x / 2;
			let c = (r1_center - r2_center) / (expanded.size.x / 2);
			c *= MAX_ANGLE;
			this.ball.velocity.x = Math.sin(c) * BALL_SPEED_MAX;
			this.ball.velocity.y = collision.normal.y * Math.cos(c) * BALL_SPEED_MAX;
		}
	}

	update_paddle_position(id, player, dt) {
		// if (this.inputs[id] != NEUTRAL && player.position.x + player.velocity.x * dt > CORRIDOR && player.position.x + player.size.x + player.velocity.x * dt < canvas.width - (CORRIDOR)) {
		if ((player.position.x + (player.velocity.x * dt) > CORRIDOR) && (player.position.x + player.size.x + (player.velocity.x * dt) < canvas.width - CORRIDOR)) {
			let collision = physics.aabb_continuous_detection(player, this.ball, dt);
			if (collision.time > 0 && collision.time <= 1.0) {
				physics.aabb_continuous_resolve(player, collision);
				sound.play_hit_sound();
				collision.normal.x *= -1;
				update_ball_velocity(player, collision);
				this.ball.position.x += this.ball.velocity.x * (1 - collision.time);
				this.ball.position.y += this.ball.velocity.y * (1 - collision.time);
			}
			else {
				player.position.x += player.velocity.x * dt;
			}
		}
	}

	/* Check for collisions with walls */
	update_ball_position() {
		if (this.ball.position.x <= MARGIN) {
			/* Left wall */
			this.ball.position.x = MARGIN;
			this.ball.velocity.x *= -1;
			sound.play_hit_sound();
		} else if (this.ball.position.x + this.ball.size.x >= canvas.width - MARGIN) {
			/* Right wall */
			this.ball.position.x = canvas.width - this.ball.size.x - MARGIN;
			this.ball.velocity.x *= -1;
			sound.play_hit_sound();
		} else if (this.ball.position.y <= MARGIN) {
			/* Top wall */
			this.who_scored = 1;
			this.score1 += 1;
			physics.particles_create(this.particles, this.ball, 16);
			sound.play_explosion_sound();
		} else if (this.ball.position.y + this.ball.size.y >= canvas.height - MARGIN) {
			/* Bottom wall */
			this.who_scored = -1;
			this.score2 += 1;
			physics.particles_create(this.particles, this.ball, 16);
			sound.play_explosion_sound();
		}
	}

	update(dt) {
		if (this.status === STATUS_WAITING) return;

		if (this.inputs[0] != NEUTRAL) {
			
		}
		this.update_paddle_velocity(0, this.player1);
		this.update_paddle_velocity(1, this.player2);
		this.update_paddle_position(0, this.player1, this.ball, dt);
		this.update_paddle_position(1, this.player2, this.ball, dt);

		if (this.particles.length > 0) {
			physics.particles_update(this.particles, dt);
			if (this.particles.length > 0)
				return;
			this.reset_ball(new physics.Vector(0, this.who_scored));
		}

		/* This allows for the particle effect to finish updating when the game is over */
		if (this.status === STATUS_ENDED_1 || this.status === STATUS_ENDED_2) return;

		let player = null;
		let collision = null;

		let c1 = physics.aabb_continuous_detection(this.ball, this.player1, dt);
		let c2 = physics.aabb_continuous_detection(this.ball, this.player2, dt);
		if (c1.time > 0) { player = this.player1; collision = c1; }
		else if (c2.time > 0) { player = this.player2; collision = c2; }

		/* Collision resolution */
		if (collision != null && collision.time > 0 && collision.time <= 1.0) {
			physics.aabb_continuous_resolve(this.ball, collision);
			sound.play_hit_sound();
			this.update_ball_velocity(player, collision);
			this.ball.position.x += this.ball.velocity.x * (1 - collision.time);
			this.ball.position.y += this.ball.velocity.y * (1 - collision.time);
		} else {
			this.ball.position.x += this.ball.velocity.x * dt;
			this.ball.position.y += this.ball.velocity.y * dt;
		}

		this.update_ball_position();

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
		graphics.draw_rect_fill(0, 0, canvas.width, canvas.height, palette.c1);

		/* Draw the margin */
		graphics.draw_rect_fill(0, 0, MARGIN, canvas.height, palette.c4);
		graphics.draw_rect_fill(0, 0, canvas.width, MARGIN, palette.c4);
		graphics.draw_rect_fill(canvas.width - MARGIN, 0, MARGIN, canvas.height, palette.c4);
		graphics.draw_rect_fill(0, canvas.height - MARGIN, canvas.width, MARGIN, palette.c4);

		/* Draw the vertical line in the middle of the table */
		graphics.draw_rect_fill(((canvas.width - (MARGIN / 2)) / 2), 0, MARGIN / 2, canvas.height, palette.c4);

		/* Draw the net's shadow */
		graphics.draw_rect_fill(this.net.position.x + SHADOW_OFFSET_X, this.net.position.y + SHADOW_OFFSET_Y - this.net.size.y - 1, this.net.size.x - SHADOW_OFFSET_X, this.net.size.y + 2, SHADOW);

		/* Draw the net */
		graphics.draw_rect_fill(this.net.position.x, this.net.position.y, this.net.size.x, this.net.size.y, palette.c4);

		/* Draw scores shadows */
		graphics.draw_text(this.score1, canvas.width - DOUBLE_FSIZE + SHADOW_OFFSET_X, ((canvas.height / 2) + FSIZE) + SHADOW_OFFSET_Y, SHADOW);
		graphics.draw_text(this.score2, canvas.width - DOUBLE_FSIZE + SHADOW_OFFSET_X, ((canvas.height / 2) - (FSIZE / 3)) + SHADOW_OFFSET_Y, SHADOW);

		/* Draw scores */
		graphics.draw_text(this.score1, canvas.width - DOUBLE_FSIZE, (canvas.height / 2) + FSIZE, palette.c4);
		graphics.draw_text(this.score2, canvas.width - DOUBLE_FSIZE, (canvas.height / 2) - (FSIZE / 3), palette.c4);

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
			const text_x = (canvas.width - text_width) / 2;
			const text_y = (canvas.height + FSIZE / 2) / 2;
			const box_w = text_width + padding * 2;
			const box_h = DOUBLE_FSIZE;
			const box_x = (canvas.width - box_w) / 2;
			const box_y = (canvas.height - box_h) / 2;

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
			let text_x = (canvas.width - text_width) / 2;
			let box_x = (canvas.width - box_w) / 2;
			let text_y, box_y;
			let fourth = canvas.height / 4;
			if (this.status === STATUS_ENDED_1) {
				text_y = ((canvas.height + FSIZE / 2) / 2) + fourth;
				box_y = ((canvas.height - box_h) / 2) + fourth;
			} else {
				text_y = ((canvas.height + FSIZE / 2) / 2) - fourth;
				box_y = ((canvas.height - box_h) / 2) - fourth;
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
			let text_x_again = (canvas.width - text_width_again) / 2;
			let text_y_again = ((canvas.height + FSIZE / 2) / 2);
			let box_w_again = text_width_again + padding * 2;
			let box_h_again = DOUBLE_FSIZE;
			let box_x_again = (canvas.width - box_w_again) / 2;
			let box_y_again = ((canvas.height - box_h_again) / 2);

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
