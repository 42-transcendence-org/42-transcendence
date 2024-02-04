import * as physics from "./physics.js";
import * as graphics from "./graphics.js";
import * as sound from "./sound.js";

let canvas = document.getElementById("game-canvas");
let ctx = canvas.getContext("2d");

export const LEFT = -1;
export const RIGHT = 1;
export const NEUTRAL = 0;
export let g_inputs = [0, 0];

const MARGIN = 16;
const CORRIDOR = 2 * MARGIN + 8;
const BALL_SPEED_MAX = 0.70;
const BALL_SPEED_MIN = 0.40;

const PADDLE_SPEED_MAX = 1.0;
const PADDLE_ACCELERATION = 1.0 / 8000;
const PADDLE_DECCELERATION = 1.0 / 5000;

const POINTS_TO_WIN = 10;

const MAX_ANGLE = Math.PI / 6;

let particles = [];

let s = null;
export let g_id = null;

export function user_init(data) {
	let state = {
		status: data.status,
		ball: new physics.Rectangle(data.ball.x, data.ball.y, data.ball.w, data.ball.h, data.ball.vx, data.ball.vy),
		player1: new physics.Rectangle(data.player1.x, data.player1.y, data.player1.w, data.player1.h, data.player1.vx, data.player1.vy),
		player2: new physics.Rectangle(data.player2.x, data.player2.y, data.player2.w, data.player2.h, data.player2.vx, data.player2.vy),
		player1_score: data.player1.score,
		player2_score: data.player2.score,
		player1_name: data.player1.name,
		player2_name: data.player2.name,
		who_scored: 0
	};
	s = state;
	graphics.load_font(ctx);
}

function game_reset() {
	s.player1.position.x = s.player2.position.x = (canvas.width - s.player1.size.x) / 2;
	s.player1.position.y = canvas.height - (3 * MARGIN);
	s.player2.position.y = 2 * MARGIN;
	s.player1_score = 0;
	s.player2_score = 0;

	reset_ball(new physics.Vector(0, 1));
}

function update_paddle_velocity(input_id, player) {
	if (g_inputs[input_id] != NEUTRAL) {
		let dv = PADDLE_ACCELERATION * g_inputs[input_id];
		player.velocity.x += dv;
		player.velocity.x = Math.min(Math.max(player.velocity.x, -PADDLE_SPEED_MAX), PADDLE_SPEED_MAX);
	} else {
		let sign = Math.sign(player.velocity.x);
		let dv = -sign * PADDLE_DECCELERATION;
		player.velocity.x += dv;
		if (Math.abs(player.velocity.x) < PADDLE_DECCELERATION) player.velocity.x = 0;
	}
}

function update_ball_velocity(r1, r2, collision) {
	let r2_expanded = new physics.Rectangle(
		r2.position.x - r1.size.x / 2,
		r2.position.y - r1.size.y / 2,
		r2.size.x + r1.size.x,
		r2.size.y + r1.size.y,
		0, 0
	);
	if (collision.normal.x != 0) {
		let r1_center = r1.position.y + r1.size.y / 2;
		let r2_center = r2_expanded.position.y + r2_expanded.size.y / 2;
		let c = (r1_center - r2_center) / (r2_expanded.size.y / 2);
		c *= MAX_ANGLE;
		r1.velocity.x = collision.normal.x * Math.cos(c) * BALL_SPEED_MAX;
		r1.velocity.y = Math.sin(c) * BALL_SPEED_MAX;
	}
	if (collision.normal.y != 0) {
		let r1_center = r1.position.x + r1.size.x / 2;
		let r2_center = r2_expanded.position.x + r2_expanded.size.x / 2;
		let c = (r1_center - r2_center) / (r2_expanded.size.x / 2);
		c *= MAX_ANGLE;
		r1.velocity.x = Math.sin(c) * BALL_SPEED_MAX;
		r1.velocity.y = collision.normal.y * Math.cos(c) * BALL_SPEED_MAX;
	}
}

function update_paddle_position(input_id, player, ball, dt) {
	if (g_inputs[input_id] != NEUTRAL && player.position.x + player.velocity.x * dt > CORRIDOR && player.position.x + player.size.x + player.velocity.x * dt < canvas.width - (CORRIDOR)) {
		let coll = physics.aabb_continuous_detection(player, ball, dt);
		if (coll.time > 0 && coll.time <= 1.0) {
			physics.aabb_continuous_resolve(player, coll);
			sound.play_hit_sound();
			coll.normal.x *= -1;
			update_ball_velocity(ball, player, coll);
			ball.position.x += ball.velocity.x * (1 - coll.time);
			ball.position.y += ball.velocity.y * (1 - coll.time);
		}
		else {
			player.position.x += player.velocity.x * dt;
		}
	}
}

function reset_ball(direction) {
	s.ball.position.x = (canvas.width - s.ball.size.x) / 2;
	s.ball.position.y = (canvas.height - s.ball.size.y) / 2;
	s.ball.velocity = physics.get_vector_in_range(direction, Math.PI / 6);
	s.ball.velocity.x *= BALL_SPEED_MIN;
	s.ball.velocity.y *= BALL_SPEED_MIN;
}

export function user_update(dt) {
	if (s.status === "waiting") return;

	update_paddle_velocity(0, s.player1);
	update_paddle_velocity(1, s.player2);
	update_paddle_position(0, s.player1, s.ball, dt);
	update_paddle_position(1, s.player2, s.ball, dt);

	if (particles.length > 0) {
		physics.particles_update(particles, dt);
		if (particles.length > 0)
			return;
		if (s.who_scored === 1) reset_ball(new physics.Vector(0, 1));
		else reset_ball(new physics.Vector(0, -1));
	}

	/* This allows for the particle effect to finish updating when the game is over */
	if (s.status === "ended1" || s.status === "ended2") return;

	let player = null;
	let collision = null;

	let c1 = physics.aabb_continuous_detection(s.ball, s.player1, dt);
	let c2 = physics.aabb_continuous_detection(s.ball, s.player2, dt);
	if (c1.time > 0) { player = s.player1; collision = c1; }
	else if (c2.time > 0) { player = s.player2; collision = c2; }

	/* Collision resolution */
	if (collision != null && collision.time > 0 && collision.time <= 1.0) {
		physics.aabb_continuous_resolve(s.ball, collision);
		sound.play_hit_sound();
		update_ball_velocity(s.ball, player, collision);
		s.ball.position.x += s.ball.velocity.x * (1 - collision.time);
		s.ball.position.y += s.ball.velocity.y * (1 - collision.time);
	} else {
		s.ball.position.x += s.ball.velocity.x * dt;
		s.ball.position.y += s.ball.velocity.y * dt;
	}

	if (s.ball.position.x <= MARGIN) {
		/* Left wall */
		s.ball.position.x = MARGIN;
		s.ball.velocity.x *= -1;
		sound.play_hit_sound();
	} else if (s.ball.position.x + s.ball.size.x >= canvas.width - MARGIN) {
		/* Right wall */
		s.ball.position.x = canvas.width - s.ball.size.x - MARGIN;
		s.ball.velocity.x *= -1;
		sound.play_hit_sound();
	} else if (s.ball.position.y <= MARGIN) {
		/* Top wall */
		s.who_scored = 1;
		s.player1_score += 1;
		physics.particles_create(particles, s.ball, 16);
		sound.play_explosion_sound();
	} else if (s.ball.position.y + s.ball.size.y >= canvas.height - MARGIN) {
		/* Bottom wall */
		s.who_scored = 2;
		s.player2_score += 1;
		physics.particles_create(particles, s.ball, 16);
		sound.play_explosion_sound();
	}
	if (s.player1_score === POINTS_TO_WIN) { s.status = "ended1"; sound.play_victory_sound(); }
	else if (s.player2_score === POINTS_TO_WIN) { s.status = "ended2"; sound.play_victory_sound(); }
}

const palette = {
	c1: "#2B2A4C", /* purple */
	c2: "#B31312", /* red */
	c3: "#EA906C", /* flesh */
	c4: "#EEE2DE", /* light grey */
}
const shadow = "#252442";
const shadow_offset_x = 5;
const shadow_offset_y = 5;

const fsize = 24;
const double_fsize = 48;

const net = new physics.Rectangle(MARGIN, (canvas.height - 2) / 2, canvas.width - (2 * MARGIN), 2, 0, 0);
export function user_draw() {
	/* Draw the background */
	graphics.draw_rect_fill(ctx, 0, 0, canvas.width, canvas.height, palette.c1);

	/* Draw the margin */
	graphics.draw_rect_fill(ctx, 0, 0, MARGIN, canvas.height, palette.c4);
	graphics.draw_rect_fill(ctx, 0, 0, canvas.width, MARGIN, palette.c4);
	graphics.draw_rect_fill(ctx, canvas.width - MARGIN, 0, MARGIN, canvas.height, palette.c4);
	graphics.draw_rect_fill(ctx, 0, canvas.height - MARGIN, canvas.width, MARGIN, palette.c4);

	/* Draw the vertical line in the middle of the table */
	graphics.draw_rect_fill(ctx, ((canvas.width - (MARGIN / 2)) / 2), 0, MARGIN / 2, canvas.height, palette.c4);

	/* Draw the net's shadow */
	graphics.draw_rect_fill(ctx, net.position.x + shadow_offset_x, net.position.y + shadow_offset_y - net.size.y - 1, net.size.x - shadow_offset_x, net.size.y + 2, shadow);

	/* Draw the net */
	graphics.draw_rect_fill(ctx, net.position.x, net.position.y, net.size.x, net.size.y, palette.c4);

	/* Draw scores shadows */
	ctx.fillStyle = shadow
	ctx.fillText(s.player1_score, canvas.width - double_fsize + shadow_offset_x, ((canvas.height / 2) + fsize) + shadow_offset_y);
	ctx.fillText(s.player2_score, canvas.width - double_fsize + shadow_offset_x, ((canvas.height / 2) - (fsize / 3)) + shadow_offset_y);

	/* Draw scores */
	ctx.fillStyle = palette.c4;
	ctx.fillText(s.player1_score, canvas.width - double_fsize, (canvas.height / 2) + fsize);
	ctx.fillText(s.player2_score, canvas.width - double_fsize, (canvas.height / 2) - (fsize / 3));

	/* Draw the paddles and the ball shadows */
	if (particles.length === 0) {
		graphics.draw_rect_fill(ctx, s.ball.position.x + shadow_offset_x, s.ball.position.y + shadow_offset_y, s.ball.size.x, s.ball.size.y, shadow);
	} else {
		particles.forEach(p => {
			graphics.draw_rect_fill(ctx, p.r.position.x + shadow_offset_x, p.r.position.y + shadow_offset_y, p.r.size.x, p.r.size.y, shadow);
		});
	}
	graphics.draw_rect_fill(ctx, s.player1.position.x + shadow_offset_x, s.player1.position.y + shadow_offset_y, s.player1.size.x, s.player1.size.y, shadow);
	graphics.draw_rect_fill(ctx, s.player2.position.x + shadow_offset_x, s.player2.position.y + shadow_offset_y, s.player2.size.x, s.player2.size.y, shadow);

	/* Draw the paddles and the ball */
	if (particles.length === 0) {
		graphics.draw_rect_fill(ctx, s.ball.position.x, s.ball.position.y, s.ball.size.x, s.ball.size.y, palette.c3);
	} else {
		particles.forEach(p => {
			graphics.draw_rect_fill(ctx, p.r.position.x, p.r.position.y, p.r.size.x, p.r.size.y, palette.c3);
		});
	}
	graphics.draw_rect_fill(ctx, s.player1.position.x, s.player1.position.y, s.player1.size.x, s.player1.size.y, palette.c3);
	graphics.draw_rect_fill(ctx, s.player2.position.x, s.player2.position.y, s.player2.size.x, s.player2.size.y, palette.c3);


	if (s.status === "waiting") {
		const text = "Press 'Space' to start";
		const padding = 10;
		const text_width = ctx.measureText(text).width;
		const text_x = (canvas.width - text_width) / 2;
		const text_y = (canvas.height + fsize / 2) / 2;
		const box_w = text_width + padding * 2;
		const box_h = double_fsize;
		const box_x = (canvas.width - box_w) / 2;
		const box_y = (canvas.height - box_h) / 2;

		/* Draw box shadow */
		graphics.draw_rect(ctx, box_x + shadow_offset_x - 1, box_y + shadow_offset_y - 1, box_w, box_h, 4, shadow);
		graphics.draw_rect_fill(ctx, box_x, box_y, box_w, box_h, palette.c1);

		/* Draw box */
		graphics.draw_rect(ctx, box_x, box_y, box_w, box_h, 4, palette.c4);
		graphics.draw_rect_fill(ctx, box_x, box_y, box_w, box_h, palette.c1);

		/* Draw text's shadow */
		ctx.fillStyle = shadow;
		ctx.fillText(text, text_x + shadow_offset_x, text_y + shadow_offset_y);

		/* Draw text */
		ctx.fillStyle = palette.c4;
		ctx.fillText(text, text_x, text_y);
	} else if (s.status === "ended1" || s.status === "ended2") {
		let text;
		if (s.status === "ended1") text = "Player 1 won !";
		else text = "Player 2 won !";
		let text_again = "Press 'Space' to play again"
		let padding = 10;
		let text_width = ctx.measureText(text).width;
		let box_w = text_width + padding * 2;
		let box_h = double_fsize;
		let text_x = (canvas.width - text_width) / 2;
		let box_x = (canvas.width - box_w) / 2;
		let text_y, box_y;
		let fourth = canvas.height / 4;
		if (s.status === "ended1") {
			text_y = ((canvas.height + fsize / 2) / 2) + fourth;
			box_y = ((canvas.height - box_h) / 2) + fourth;
		} else {
			text_y = ((canvas.height + fsize / 2) / 2) - fourth;
			box_y = ((canvas.height - box_h) / 2) - fourth;
		}

		/* Draw box shadow */
		graphics.draw_rect(ctx, box_x + shadow_offset_x - 1, box_y + shadow_offset_y - 1, box_w, box_h, 4, shadow);

		/* Draw box */
		graphics.draw_rect(ctx, box_x, box_y, box_w, box_h, 4, palette.c4);
		graphics.draw_rect_fill(ctx, box_x, box_y, box_w, box_h, palette.c1);

		/* Draw text's shadow */
		ctx.fillStyle = shadow;
		ctx.fillText(text, text_x + shadow_offset_x, text_y + shadow_offset_y);

		/* Draw text */
		ctx.fillStyle = palette.c4;
		ctx.fillText(text, text_x, text_y);

		let text_width_again = ctx.measureText(text_again).width;
		let text_x_again = (canvas.width - text_width_again) / 2;
		let text_y_again = ((canvas.height + fsize / 2) / 2);
		let box_w_again = text_width_again + padding * 2;
		let box_h_again = double_fsize;
		let box_x_again = (canvas.width - box_w_again) / 2;
		let box_y_again = ((canvas.height - box_h_again) / 2);

		/* Draw box shadow */
		graphics.draw_rect(ctx, box_x_again + shadow_offset_x - 1, box_y_again + shadow_offset_y - 1, box_w_again, box_h_again, 4, shadow);

		/* Draw box */
		graphics.draw_rect(ctx, box_x_again, box_y_again, box_w_again, box_h_again, 4, palette.c4);
		graphics.draw_rect_fill(ctx, box_x_again, box_y_again, box_w_again, box_h_again, palette.c1);

		/* Draw text's shadow */
		ctx.fillStyle = shadow;
		ctx.fillText(text_again, text_x_again + shadow_offset_x, text_y_again + shadow_offset_y);

		/* Draw text */
		ctx.fillStyle = palette.c4;
		ctx.fillText(text_again, text_x_again, text_y_again);

	}
}
