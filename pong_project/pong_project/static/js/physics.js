export class Vector {
	constructor(x, y) {
		this.x = x;
		this.y = y;
	}
}

export class Rectangle {
	constructor(px, py, sx, sy, vx, vy) {
		this.size = new Vector(sx, sy);
		this.position = new Vector(px, py);
		this.velocity = new Vector(vx, vy);
	}
}

export class Collision {
	constructor(t, x, y, nx, ny) {
		this.time = t;
		this.point = new Vector(x, y);
		this.normal = new Vector(nx, ny);
	}
}

export class Particle {
	constructor(px, py, sx, sy, vx, vy, t) {
		this.r = new Rectangle(px, py, sx, sy, vx, vy);
		this.life = t;
	}
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
 * @returns {boolean} - True if the two rectangles were in collision, else
 * returns false.
 */
export function aabb_discrete_resolve(r1, r2) {
	if (!aabb_discrete_detection(r1, r2))
		return 0;

	let overlap_x = Math.min(r1.position.x + r1.size.x - r2.position.x, r2.position.x + r2.size.x - r1.position.x);
	let overlap_y = Math.min(r1.position.y + r1.size.y - r2.position.y, r2.position.y + r2.size.y - r1.position.y);

	/* Resolve the collision along the axis of minimum overlap */
	if (overlap_x < overlap_y) {
		/* Horizontal collision */
		if (r1.position.x < r2.position.x) { /* r1 is to the left of r2 */
			r1.position.x -= overlap_x;
			return 1;
		} else { /* r1 is to the right of r2 */
			r1.position.x += overlap_x;
			return 2;
		}
	} else { /* Vertical collision */
		if (r1.position.y < r2.position.y) { /* r1 is above r2 */
			r1.position.y -= overlap_y;
			return 3;
		} else { /* r1 is below r2 */
			r1.position.y += overlap_y;
			return 4;
		}
	}
	return 0;
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

export function particles_create(array, source, n) {
	array.length = 0;
	for (let i = 0; i < n; i++) {
		array.push(new Particle(
			source.position.x + source.size.x / 2,
			source.position.y + source.size.y / 2,
			4,
			4,
			(Math.random() - 0.5) * 0.1,
			(Math.random() - 0.5) * 0.1,
			1000)
		);
	}
}

export function particles_update(array, dt) {
	for (let i = 0; i < array.length; i++) {
		let p = array[i];
		p.r.position.x += p.r.velocity.x * dt;
		p.r.position.y += p.r.velocity.y * dt;
		p.life -= dt;

		/* Remove dead particles */
		if (p.life <= 0) {
			array.splice(i, 1);
		}
	}
}
