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
// 		c *= g.BALL_MAX_ANGLE;
// 		this.ball.velocity.x = collision.normal.x * Math.cos(c) * g.BALL_SPEED_MAX;
// 		this.ball.velocity.y = Math.sin(c) * g.BALL_SPEED_MAX;
// 	}
// 	if (collision.normal.y != 0) {
// 		let r1_center = this.ball.position.x + this.ball.size.x / 2;
// 		let r2_center = expanded.position.x + expanded.size.x / 2;
// 		let c = (r1_center - r2_center) / (expanded.size.x / 2);
// 		c *= g.BALL_MAX_ANGLE;
// 		this.ball.velocity.x = Math.sin(c) * g.BALL_SPEED_MAX;
// 		this.ball.velocity.y = collision.normal.y * Math.cos(c) * g.BALL_SPEED_MAX;
// 	}
// }

update_paddle_position(id, player, dt) {
	if (this.inputs[id] === g.INPUT_NEUTRAL)
		return;

	if (player.position.x + player.velocity.x * dt > g.BOARD_CORRIDOR && player.position.x + player.size.x + player.velocity.x * dt < g.BOARD_WIDTH - g.BOARD_CORRIDOR) {
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


if (this.inputs[g.ID_PLAYER1] == LEFT && this.player1.position.x + this.player1.velocity.x * dt > g.BOARD_CORRIDOR)
	this.player1.position.x += this.player1.velocity.x * dt;
else if (this.inputs[g.ID_PLAYER1] == g.INPUT_RIGHT && this.player1.position.x + this.player1.size.x + this.player1.velocity.x * dt < g.BOARD_WIDTH - g.BOARD_CORRIDOR)
	this.player1.position.x += this.player1.velocity.x * dt;
if (this.inputs[g.ID_PLAYER2] == LEFT && this.player2.position.x + this.player2.velocity.x * dt > g.BOARD_CORRIDOR)
	this.player2.position.x += this.player2.velocity.x * dt;
else if (this.inputs[g.ID_PLAYER2] == g.INPUT_RIGHT && this.player2.position.x + this.player2.size.x + this.player2.velocity.x * dt < g.BOARD_WIDTH - g.BOARD_CORRIDOR)
	this.player2.position.x += this.player2.velocity.x * dt;

update_paddle_velocity(id, player) {
	if (this.inputs[id] != g.INPUT_NEUTRAL) {
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


/**
 * Tests if two rectangles collide using a discrete Axis-Aligned Bounding
 * Box (AABB) method. This method checks for collision at a specific
 * instance in time, unlike continuous methods like swept AABB which
 * consider an object's path over time.
 *
 * @param {Rectangle} r1 - The rectangle to test for collision
 * @param {Rectangle} r2 - The static rectangle against which r1 is tested
 * @returns {boolean} - True if the two rectangles are in collision, else returns false.
 */
export function aabb_discrete_detection(r1, r2) {
	return (r1.position.x < r2.position.x + r2.size.x && r1.position.x + r1.size.x > r2.position.x
		&& r1.position.y < r2.position.y + r2.size.y && r1.position.y + r2.size.y > r2.position.y);
}

/**
 * Tests if two rectangles collide using a discrete Axis-Aligned Bounding
 * Box (AABB) method. If the two rectangles are in collision, the collision
 * is resolved by moving r1 along the axis of minimum overlap.
 *
 * @param {Rectangle} r1 - The rectangle to test for collision
 * @param {Rectangle} r2 - The static rectangle against which r1 is tested
 * @returns {Vector} - The collision normal
 */
export function aabb_discrete_resolve(r1, r2) {
	let overlap = new Vector(
		Math.min(r1.position.x + r1.size.x - r2.position.x, r2.position.x + r2.size.x - r1.position.x),
		Math.min(r1.position.y + r1.size.y - r2.position.y, r2.position.y + r2.size.y - r1.position.y)
	);

	const buffer = 0;
	/* Resolve the collision along the axis of minimum overlap */
	if (overlap.x < overlap.y) {
		/* Horizontal collision */

		if (r1.position.x < r2.position.x) {
			/* r1 is to the left of r2 */
			r1.position.x -= overlap.x + buffer;
			return new Vector(-1, 0);
		} else {
			/* r1 is to the right of r2 */
			r1.position.x += overlap.x + buffer;
			return new Vector(1, 0);
		}
	} else {
		/* Vertical collision */
		if (r1.position.y < r2.position.y) {
			/* r1 is above r2 */
			r1.position.y -= overlap.y + buffer;
			return new Vector(0, -1);
		} else {
			/* r1 is below r2 */
			r1.position.y += overlap.y + buffer;
			return new Vector(0, 1);
		}
	}
}


function draw_line(p1, p2, color) {
	ctx.beginPath();
	ctx.moveTo(p1.x, p1.y);
	ctx.lineTo(p2.x, p2.y);
	ctx.strokeStyle = color;
	ctx.stroke();
}

function draw_disc(x, y, radius, color) {
	ctx.beginPath();
	ctx.arc(x, y, radius, 0, Math.PI * 2, true);
	ctx.fillStyle = color;
	ctx.fill();
}

function draw_circle(x, y, radius, color) {
	ctx.beginPath();
	ctx.arc(x, y, radius, 0, Math.PI * 2, true);
	ctx.strokeStyle = color;
	ctx.stroke();
}






















function update_ball_position(state, dt) {
	const c1 = physics.aabb_continuous_detection(state.ball, state.player1, dt);
	const c2 = physics.aabb_continuous_detection(state.ball, state.player2, dt);
	const c_top = physics.aabb_continuous_detection(state.ball, state.top_wall, dt);
	const c_bot = physics.aabb_continuous_detection(state.ball, state.bot_wall, dt);
	const c_left = physics.aabb_continuous_detection(state.ball, state.left_wall, dt);
	const c_right = physics.aabb_continuous_detection(state.ball, state.right_wall, dt);

	// console.log("1:", c1.time, "2:", c2.time, "L:", c_left.time, "R:", c_right.time, "T:", c_top.time, "B:", c_bot.time);

	let collision_happened = false;

	/* Paddle */
	if ((c1.time > 0 && c1.time <= 1.0) || (c2.time > 0 && c2.time <= 1.0)) {
		collision_happened = true;
		const c = (c1.time > 0 && c1.time <= 1.0) ? c1 : c2;
		const player = (c1.time > 0 && c1.time <= 1.0) ? state.player1 : state.player2;
		const v = physics.aabb_continuous_resolve(state.ball, c);
		state.ball.position.x += v.x * dt;
		state.ball.position.y += v.y * dt;
		update_ball_velocity(state.ball, player, c.normal);
		sound.play_hit_sound();
	} else if ((c_top.time > 0 && c_top.time <= 1.0) || (c_bot.time > 0 && c_bot.time <= 1.0)) {
		/* Top and bottom walls */
		collision_happened = true;
		const dir = (c_top.time > 0 && c_top.time <= 1.0) ? new physics.Vector(0, g.BALL_SPEED_MIN) : new physics.Vector(0, -g.BALL_SPEED_MIN)
		const c = (c_top.time > 0 && c_top.time <= 1.0) ? c_top : c_bot;
		const v = physics.aabb_continuous_resolve(state.ball, c);
		state.ball.position.x += v.x * dt;
		state.ball.position.y += v.y * dt;
		state.ball.velocity.x *= -1;
		if (c_top.time > 0 && c_top.time <= 1.0) {
			state.score1 += 1;
		} else if (c_bot.time > 0 && c_bot.time <= 1.0) {
			state.score2 += 1;
		}
		state.particles = physics.particles_create(new physics.Vector(state.ball.position.x + state.ball.size.x / 2, state.ball.position.y + state.ball.size.y / 2,), 16, 4, 5, 1.5, 100);
		reset_ball(state.ball, dir);
		sound.play_explosion_sound();
	} else if ((c_left.time > 0 && c_left.time <= 1.0) || (c_right.time > 0 && c_right.time <= 1.0)) {
		/* Left and right walls */
		collision_happened = true;
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


	// if (collision_happened === false) {
	// 	state.ball.position.x += state.ball.velocity.x * dt;
	// 	state.ball.position.y += state.ball.velocity.y * dt;
	// }
}
