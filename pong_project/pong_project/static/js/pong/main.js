import * as sound from "./sound.js";
import * as physics from "./physics.js";
import * as graphics from "./graphics.js";
import * as requests from "../requests.js";
import { div_handler } from "../utils.js";

const canvas = document.getElementById("game-canvas");
const ctx = canvas.getContext("2d");

const BOARD_WIDTH = canvas.width;
const BOARD_HEIGHT = canvas.height;

/* INPUTS */
const INPUT_LEFT = 0;
const INPUT_RIGHT = 1;
const INPUT_SPACE = 2;
const INPUT_NEUTRAL = 3;

/* STATUSES */
const STATUS_WAITING = 0;
const STATUS_ACTIVE = 1;
const STATUS_ENDED_1 = 2;
const STATUS_ENDED_2 = 3;

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

const POINTS_TO_WIN = 5;

const MAX_ANGLE = Math.PI / 6;

const net = new physics.Rectangle(MARGIN, (BOARD_HEIGHT - 2) / 2, BOARD_WIDTH - (2 * MARGIN), 2, 0, 0);

document.addEventListener('keydown', (event) => {
	if (g_session === null || g_session.state === null) return;

	const time = Date.now();
	const key_name = event.key;
	if (key_name === 'a' && g_session.state.player1.velocity.x != -PADDLE_SPEED) {
		if (g_session.id != 0) requests.send_user_input(INPUT_LEFT, time);
		g_session.input_handler(ID_PLAYER1, INPUT_LEFT, time);
	} else if (key_name === 's' && g_session.state.player1.velocity.x != PADDLE_SPEED) {
		if (g_session.id != 0) requests.send_user_input(INPUT_RIGHT, time);
		g_session.input_handler(ID_PLAYER1, INPUT_RIGHT, time);
	} else if (key_name === 'k' && g_session.state.player2.velocity.x != -PADDLE_SPEED) {
		g_session.input_handler(ID_PLAYER2, INPUT_LEFT, time);
	} else if (key_name === 'l' && g_session.state.player2.velocity.x != PADDLE_SPEED) {
		g_session.input_handler(ID_PLAYER2, INPUT_RIGHT, time);
	} else if (key_name === ' ') {
		if (g_session.id != 0) requests.send_user_input(INPUT_SPACE, time);
		g_session.input_handler(ID_PLAYER1, INPUT_SPACE, time);
	}
});

document.addEventListener('keyup', (event) => {
	if (g_session === null || g_session.state === null) return;

	const time = Date.now();
	const key_name = event.key;
	if ((key_name === 'a' || key_name === 's') && g_session.state.player1.velocity.x != 0) {
		if (g_session.id != 0) requests.send_user_input(INPUT_NEUTRAL, time);
		g_session.input_handler(ID_PLAYER1, INPUT_NEUTRAL, time);
	} else if ((key_name === 'k' || key_name === 'l') && g_session.state.player2.velocity.x != 0) {
		g_session.input_handler(ID_PLAYER2, INPUT_NEUTRAL, time);
	}
});

class Input {
	constructor(id, input, time) {
		this.id = id;
		this.input = input;
		this.timestamp = time;
	}
}

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

export class GameSession {
	constructor(id, type, name1, name2) {
		this.id = id;
		this.type = type;
		this.inputs = [];
		this.t = 0.0;
		this.dt = 1.0 / 60.0;
		this.accumulator = 0.0;
		this.old_time = 0.0;
		this.name1 = name1;
		this.name2 = name2;
		this.state = new GameState();

		this.event_source = id === 0 ? null : new EventSource(`http://localhost:8000/api/games/${id}/`);

		this.update_start = this.update_start.bind(this);
		this.update_state = this.update_state.bind(this);
	}

	reconcile(data) {
	}

	update_start() {
		if (this.id != 0) {
			this.event_source.onmessage = (event) => {
				this.reconcile(JSON.parse(event.data));
			};
			this.event_source.onerror = (error) => {
				console.error('EventSource failed:', error);
				this.event_source.close();
				/* FIXME: Handle this properly */
			};
		}

		this.old_time = performance.now();
		requestAnimationFrame(this.update_state);
	}

	update_state() {
		let new_time = performance.now();
		let frame_time = new_time - this.old_time;
		this.old_time = new_time;

		/* Convert the frame time from milliseconds to seconds before adding it */
		this.accumulator += (frame_time / 1000);

		while (this.accumulator >= this.dt) {
			this.update(this.dt);
			this.accumulator -= this.dt;
			this.t += this.dt;
		}

		this.draw();
		requestAnimationFrame(this.update_state);
	}

	input_handler(id, input, time) {
		this.inputs.push(new Input(id, input, time));
	}

	reset_ball(direction) {
		this.state.ball.position.x = (BOARD_WIDTH - this.state.ball.size.x) / 2;
		this.state.ball.position.y = (BOARD_HEIGHT - this.state.ball.size.y) / 2;
		this.state.ball.velocity = direction;
	}

	reset_game() {
		this.state = new GameState();
		this.state.status = STATUS_ACTIVE;
	}

	process_inputs() {
		this.inputs.forEach((input) => {
			let player = (input.id === ID_PLAYER1 ? this.state.player1 : this.state.player2);
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
					if (this.state.status === STATUS_WAITING) {
						this.state.status = STATUS_ACTIVE;
						sound.play_music();
					} else if (this.state.status === STATUS_ENDED_1 || this.state.status === STATUS_ENDED_2) {
						this.state.status = STATUS_ACTIVE;
						this.reset_game();
					}
					break;
			}
		});
		if (this.type != TYPE_REMOTE)
			this.inputs = [];
	}

	/* FIXME Should we use the contact point instead ? */
	update_ball_velocity(player, normal) {
		const expanded = new physics.Rectangle(player.position.x - this.state.ball.size.x / 2, player.position.y - this.state.ball.size.y / 2, player.size.x + this.state.ball.size.x, player.size.y + this.state.ball.size.y, 0, 0);
		const b_center = new physics.Vector(this.state.ball.position.x + this.state.ball.size.x / 2, this.state.ball.position.y + this.state.ball.size.y / 2);
		const p_center = new physics.Vector(expanded.position.x + expanded.size.x / 2, expanded.position.y + expanded.size.y / 2);
		if (normal.x != 0) {
			let c = ((b_center.y - p_center.y) / (expanded.size.y / 2)) * MAX_ANGLE;
			this.state.ball.velocity.x = normal.x * Math.cos(c) * BALL_SPEED_MAX;
			this.state.ball.velocity.y = Math.sin(c) * BALL_SPEED_MAX;
		} else if (normal.y != 0) {
			let c = ((b_center.x - p_center.x) / (expanded.size.x / 2)) * MAX_ANGLE;
			this.state.ball.velocity.x = Math.sin(c) * BALL_SPEED_MAX;
			this.state.ball.velocity.y = normal.y * Math.cos(c) * BALL_SPEED_MAX;
		}
	}

	/* FIXME The ball passes through the paddle when stuck against the wall and paddle in the x-axis */
	update_paddle_position(paddle, dt) {
		let collision = physics.aabb_continuous_detection(paddle, this.state.ball, dt);
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

	update_ball_position(dt) {
		let player = null;
		let collision = null;

		const c1 = physics.aabb_continuous_detection(this.state.ball, this.state.player1, dt);
		const c2 = physics.aabb_continuous_detection(this.state.ball, this.state.player2, dt);
		if (c1.time > 0) { player = this.state.player1; collision = c1; }
		else if (c2.time > 0) { player = this.state.player2; collision = c2; }

		/* Collision resolution */
		if (collision != null && player != null && collision.time > 0 && collision.time <= 1.0) {
			sound.play_hit_sound();
			/* Scale the ball velocity and move it so that it comes in contact with the paddle without colliding with it */
			physics.aabb_continuous_resolve(this.state.ball, collision);
			this.state.ball.position.x += this.state.ball.velocity.x * dt;
			this.state.ball.position.y += this.state.ball.velocity.y * dt;
			/* Update the ball velocity based on where it hits the paddle */
			this.update_ball_velocity(player, collision.normal);
		} else {
			this.state.ball.position.x += this.state.ball.velocity.x * dt;
			this.state.ball.position.y += this.state.ball.velocity.y * dt;
		}

		if (this.state.ball.position.x <= MARGIN) {
			/* Left wall */
			this.state.ball.position.x = MARGIN;
			this.state.ball.velocity.x *= -1;
			sound.play_hit_sound();
		} else if (this.state.ball.position.x + this.state.ball.size.x >= BOARD_WIDTH - MARGIN) {
			/* Right wall */
			this.state.ball.position.x = BOARD_WIDTH - this.state.ball.size.x - MARGIN;
			this.state.ball.velocity.x *= -1;
			sound.play_hit_sound();
		} else if (this.state.ball.position.y <= MARGIN) {
			/* Top wall */
			this.state.score1 += 1;
			this.state.particles = physics.particles_create(new physics.Vector(this.state.ball.position.x + this.state.ball.size.x / 2, this.state.ball.position.y + this.state.ball.size.y / 2,), 16, 4, 5, 1.5, 100);
			sound.play_explosion_sound();
			this.reset_ball(new physics.Vector(0, BALL_SPEED_MIN));
		} else if (this.state.ball.position.y + this.state.ball.size.y >= BOARD_HEIGHT - MARGIN) {
			/* Bottom wall */
			this.state.score2 += 1;
			this.state.particles = physics.particles_create(new physics.Vector(this.state.ball.position.x + this.state.ball.size.x / 2, this.state.ball.position.y + this.state.ball.size.y / 2,), 16, 4, 5, 1.5, 100);
			sound.play_explosion_sound();
			this.reset_ball(new physics.Vector(0, -BALL_SPEED_MIN));
		}
	}

	update(dt) {
		this.process_inputs();

		if (this.state.status === STATUS_WAITING) return;

		this.update_paddle_position(this.state.player1, this.dt);
		this.update_paddle_position(this.state.player2, this.dt);

		if (this.state.particles.length > 0) {
			physics.particles_update(this.state.particles, dt);
			if (this.state.particles.length > 0)
				return;
		}

		/* This allows for the particle effect to finish updating when the game is over */
		if (this.state.status === STATUS_ENDED_1 || this.state.status === STATUS_ENDED_2) return;

		this.update_ball_position(dt);

		if (this.state.score1 === POINTS_TO_WIN) {
			this.state.status = STATUS_ENDED_1;
			sound.play_victory_sound();
		} else if (this.state.score2 === POINTS_TO_WIN) {
			this.state.status = STATUS_ENDED_2;
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
		graphics.draw_rect_fill(net.position.x + SHADOW_OFFSET_X, net.position.y + SHADOW_OFFSET_Y - net.size.y - 1, net.size.x - SHADOW_OFFSET_X, net.size.y + 2, SHADOW);

		/* Draw the net */
		graphics.draw_rect_fill(net.position.x, net.position.y, net.size.x, net.size.y, palette.c4);

		/* Draw scores shadows */
		graphics.draw_text(this.state.score1, BOARD_WIDTH - DOUBLE_FSIZE + SHADOW_OFFSET_X, ((BOARD_HEIGHT / 2) + FSIZE) + SHADOW_OFFSET_Y, SHADOW);
		graphics.draw_text(this.state.score2, BOARD_WIDTH - DOUBLE_FSIZE + SHADOW_OFFSET_X, ((BOARD_HEIGHT / 2) - (FSIZE / 3)) + SHADOW_OFFSET_Y, SHADOW);

		/* Draw scores */
		graphics.draw_text(this.state.score1, BOARD_WIDTH - DOUBLE_FSIZE, (BOARD_HEIGHT / 2) + FSIZE, palette.c4);
		graphics.draw_text(this.state.score2, BOARD_WIDTH - DOUBLE_FSIZE, (BOARD_HEIGHT / 2) - (FSIZE / 3), palette.c4);

		/* Draw the paddles and the ball shadows */
		if (this.state.particles.length === 0) {
			graphics.draw_rect_fill(this.state.ball.position.x + SHADOW_OFFSET_X, this.state.ball.position.y + SHADOW_OFFSET_Y, this.state.ball.size.x, this.state.ball.size.y, SHADOW);
		} else {
			this.state.particles.forEach(p => {
				graphics.draw_rect_fill(p.r.position.x + SHADOW_OFFSET_X, p.r.position.y + SHADOW_OFFSET_Y, p.r.size.x, p.r.size.y, SHADOW);
			});
		}
		graphics.draw_rect_fill(this.state.player1.position.x + SHADOW_OFFSET_X, this.state.player1.position.y + SHADOW_OFFSET_Y, this.state.player1.size.x, this.state.player1.size.y, SHADOW);
		graphics.draw_rect_fill(this.state.player2.position.x + SHADOW_OFFSET_X, this.state.player2.position.y + SHADOW_OFFSET_Y, this.state.player2.size.x, this.state.player2.size.y, SHADOW);

		/* Draw the paddles and the ball */
		if (this.state.particles.length === 0) {
			graphics.draw_rect_fill(this.state.ball.position.x, this.state.ball.position.y, this.state.ball.size.x, this.state.ball.size.y, palette.c3);
		} else {
			this.state.particles.forEach(p => {
				graphics.draw_rect_fill(p.r.position.x, p.r.position.y, p.r.size.x, p.r.size.y, palette.c3);
			});
		}
		graphics.draw_rect_fill(this.state.player1.position.x, this.state.player1.position.y, this.state.player1.size.x, this.state.player1.size.y, palette.c3);
		graphics.draw_rect_fill(this.state.player2.position.x, this.state.player2.position.y, this.state.player2.size.x, this.state.player2.size.y, palette.c3);


		if (this.state.status === STATUS_WAITING) {
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
		} else if (this.state.status === STATUS_ENDED_1 || this.state.status === STATUS_ENDED_2) {
			let text;
			if (this.state.status === STATUS_ENDED_1) text = "Player 1 won !";
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
			if (this.state.status === STATUS_ENDED_1) {
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


