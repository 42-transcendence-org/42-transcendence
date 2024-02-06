/* Give a new direction to the ball based on where it hits the paddle */
// update_ball_velocity(player, collision) {
// 	let expanded = new physics.Rectangle(
// 		player.position.x - this.ball.size.x / 2,
// 		player.position.y - this.ball.size.y / 2,
// 		player.size.x + this.ball.size.x,
// 		player.size.y + this.ball.size.y,
// 		0, 0
// 	);
// 	if (collision.normal.x != 0) {
// 		let r1_center = this.ball.position.y + this.ball.size.y / 2;
// 		let r2_center = expanded.position.y + expanded.size.y / 2;
// 		let c = (r1_center - r2_center) / (expanded.size.y / 2);
// 		c *= MAX_ANGLE;
// 		this.ball.velocity.x = collision.normal.x * Math.cos(c) * BALL_SPEED_MAX;
// 		this.ball.velocity.y = Math.sin(c) * BALL_SPEED_MAX;
// 	}
// 	if (collision.normal.y != 0) {
// 		let r1_center = this.ball.position.x + this.ball.size.x / 2;
// 		let r2_center = expanded.position.x + expanded.size.x / 2;
// 		let c = (r1_center - r2_center) / (expanded.size.x / 2);
// 		c *= MAX_ANGLE;
// 		this.ball.velocity.x = Math.sin(c) * BALL_SPEED_MAX;
// 		this.ball.velocity.y = collision.normal.y * Math.cos(c) * BALL_SPEED_MAX;
// 	}
// }

update_paddle_position(id, player, dt) {
	if (this.inputs[id] === NEUTRAL)
		return;

	if (player.position.x + player.velocity.x * dt > CORRIDOR && player.position.x + player.size.x + player.velocity.x * dt < BOARD_WIDTH - CORRIDOR) {
		let collision = physics.aabb_continuous_detection(player, this.ball, dt);
		if (collision.time > 0 && collision.time <= 1.0) {
			physics.aabb_continuous_resolve(player, collision);
			sound.play_hit_sound();
			collision.normal.x *= -1;
			this.update_ball_velocity(player, collision);
			this.ball.position.x += this.ball.velocity.x * (1 - collision.time);
			this.ball.position.y += this.ball.velocity.y * (1 - collision.time);
		}
		else {
			player.position.x += (player.velocity.x * dt) * this.inputs[id];
		}
	}
}


if (this.inputs[PLAYER1] == LEFT && this.player1.position.x + this.player1.velocity.x * dt > CORRIDOR)
	this.player1.position.x += this.player1.velocity.x * dt;
else if (this.inputs[PLAYER1] == RIGHT && this.player1.position.x + this.player1.size.x + this.player1.velocity.x * dt < BOARD_WIDTH - CORRIDOR)
	this.player1.position.x += this.player1.velocity.x * dt;
if (this.inputs[PLAYER2] == LEFT && this.player2.position.x + this.player2.velocity.x * dt > CORRIDOR)
	this.player2.position.x += this.player2.velocity.x * dt;
else if (this.inputs[PLAYER2] == RIGHT && this.player2.position.x + this.player2.size.x + this.player2.velocity.x * dt < BOARD_WIDTH - CORRIDOR)
	this.player2.position.x += this.player2.velocity.x * dt;

update_paddle_velocity(id, player) {
	if (this.inputs[id] != NEUTRAL) {
		let dv = PADDLE_ACCELERATION * this.inputs[id];
		player.velocity.x += dv;
		player.velocity.x = Math.min(Math.max(player.velocity.x, -PADDLE_SPEED_MAX), PADDLE_SPEED_MAX);
	} else {
		let sign = Math.sign(player.velocity.x);
		let dv = -sign * PADDLE_DECCELERATION;
		player.velocity.x += dv;
		if (Math.abs(player.velocity.x) < PADDLE_DECCELERATION)
			player.velocity.x = 0;
	}
}

export class Collision {
	constructor(t, x, y, nx, ny) {
		this.time = t;
		this.point = new Vector(x, y);
		this.normal = new Vector(nx, ny);
	}
}



export function ray_rectangle_collision(origin, direction, target) {
	let t_near = new Vector(
		direction.x === 0 ? (target.position.x - origin.x) > 0 ? Infinity : -Infinity : (target.position.x - origin.x) / direction.x,
		direction.y === 0 ? (target.position.y - origin.y) > 0 ? Infinity : -Infinity : (target.position.y - origin.y) / direction.y
	);
	let t_far = new Vector(
		direction.x === 0 ? (target.position.x + target.size.x - origin.x) > 0 ? Infinity : -Infinity : (target.position.x + target.size.x - origin.x) / direction.x,
		direction.y === 0 ? (target.position.y + target.size.y - origin.y) > 0 ? Infinity : -Infinity : (target.position.y + target.size.y - origin.y) / direction.y
	);

	if (t_near.x > t_far.x) [t_near.x, t_far.x] = [t_far.x, t_near.x];
	if (t_near.y > t_far.y) [t_near.y, t_far.y] = [t_far.y, t_near.y];

	let collision = new Collision(-1, 0, 0, 0, 0);

	if (t_near.x > t_far.y || t_near.y > t_far.x) return collision;

	let t_hit_near = Math.max(t_near.x, t_near.y);
	let t_hit_far = Math.min(t_far.x, t_far.y);

	if (t_hit_far < 0) return collision;

	collision.time = t_hit_near;
	collision.point.x = origin.x + t_hit_near * direction.x;
	collision.point.y = origin.y + t_hit_near * direction.y;

	if (t_near.x > t_near.y) {
		if (direction.x < 0) { collision.normal.x = 1; collision.normal.y = 0; }
		else { collision.normal.x = -1; collision.normal.y = 0; }
	} else if (t_near.x < t_near.y) {
		if (direction.y < 0) { collision.normal.x = 0; collision.normal.y = 1; }
		else { collision.normal.x = 0; collision.normal.y = -1; }
	}
	return collision;
}

export function aabb_continuous_resolve(r1, collision) {
	return new Vector(
		r1.velocity.x + collision.normal.x * Math.abs(r1.velocity.x) * (1 - collision.time),
		r1.velocity.y + collision.normal.y * Math.abs(r1.velocity.y) * (1 - collision.time)
	);
}

export function aabb_continuous_detection(r1, r2, dt) {
	/* If r1 is not moving, a collision cannot occur */
	if (r1.velocity.x == 0 && r1.velocity.y == 0) return new Collision(-1, 0, 0, 0, 0);

	/* Create an expanded target to check against so that we can detect and resolve the collision properly */
	let r2_expanded = new Rectangle(
		r2.position.x - r1.size.x / 2,
		r2.position.y - r1.size.y / 2,
		r2.size.x + r1.size.x,
		r2.size.y + r1.size.y,
		0, 0
	);
	let collision = ray_rectangle_collision(
		new Vector(r1.position.x + r1.size.x / 2, r1.position.y + r1.size.y / 2),
		new Vector(r1.velocity.x * dt, r1.velocity.y * dt),
		r2_expanded
	);

	return collision;
}

/**
 * Generates an new random vector which lies in the range described by the
 * normal vector and the maximum angle.
 *
 * @param {Vector} normal - The direction of the angle
 * @param {number} max_angle - The maximum range of the angle in radian
 * @returns {Vector} - A new Vector which lies in the range described by
 * the normal vector and the maximum angle.
 */
export function get_vector_in_range(normal, max_angle) {
	/* Convert the normal vector to an angle */
	let normal_angle = Math.atan2(normal.y, normal.x);
	/* Generate a random angle within the specified range */
	let random_angle = normal_angle - max_angle + Math.random() * (2 * max_angle);
	/* Create a velocity vector from the random angle and speed */
	return (new Vector(Math.cos(random_angle), Math.sin(random_angle)));
}
