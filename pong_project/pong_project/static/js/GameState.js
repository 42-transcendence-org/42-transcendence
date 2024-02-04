import * as sound from "./sound.js";
import * as physics from "./physics.js";

export const LEFT = -1;
export const RIGHT = 1;
export const NEUTRAL = 0;

const STATUS_WAITING = 0;
const STATUS_ACTIVE = 1;
const STATUS_ENDED_1 = 2;
const STATUS_ENDED_2 = 3;

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

class GameState {
	constructor() {
		this.status = STATUS_WAITING;
		this.inputs = [0, 0];
		this.particles = [];
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
		if (this.inputs[id] != NEUTRAL && player.position.x + player.velocity.x * dt > CORRIDOR && player.position.x + player.size.x + player.velocity.x * dt < canvas.width - (CORRIDOR)) {
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
		if (this.status === "waiting") return;

		this.update_paddle_velocity(0, this.player1);
		this.update_paddle_velocity(1, this.player2);
		this.update_paddle_position(0, this.player1, this.ball, dt);
		this.update_paddle_position(1, this.player2, this.ball, dt);

		if (this.particles.length > 0) {
			physics.particles_update(this.particles, dt);
			if (this.particles.length > 0)
				return;
			reset_ball(new physics.Vector(0, who_scored));
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
			update_ball_velocity(player, collision);
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
}

/* FIXME Put this in a proper spot */
export function user_init(data) {
	graphics.load_font(ctx);
}











