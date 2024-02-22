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

export class Particle {
	constructor(px, py, sx, sy, vx, vy, t) {
		this.r = new Rectangle(px, py, sx, sy, vx, vy);
	}
}

export class Collision {
	constructor(t, x, y, nx, ny) {
		this.time = t;
		this.point = new Vector(x, y);
		this.normal = new Vector(nx, ny);
	}
}

/**
 *
 * @param {Vector} source - The point of origin for the particles.
 * @param {int} n - The number of particles to create.
 * @param {int} w - The width of a particle.
 * @param {int} h - The height of a particle.
 * @param {float} t - The lifetime of a particle.
 * @param {float} speed - The speed of a particle.
 * @returns {Array<Particle>} - An array filled with n Particle objects.
 */
export function particles_create(source, n, w, h, speed) {
	let array = [];
	for (let i = 0; i < n; i++) {
		array.push(new Particle(
			source.x,
			source.y,
			w,
			h,
			(Math.random() - 0.5) * speed,
			(Math.random() - 0.5) * speed,
		));
	}
	return array;
}

/**
 *
 * @param {Array<Particle>} array - The array containing the paricles
 * @param {float} dt
 */
export function particles_update(array, dt) {
	for (let i = 0; i < array.length; i++) {
		let p = array[i];
		p.r.position.x += p.r.velocity.x * dt;
		p.r.position.y += p.r.velocity.y * dt;
	}
}

/**
 * Checks if a ray intersects with a rectangle.
 *
 * @param {Vector} origin - The origin of the ray.
 * @param {Vector} direction - The direction of the ray.
 * @param {Rectangle} target - The rectangle to test against
 * @returns {Collision} - A Collision object containing all the
 * informations about the collision. If no collision what detected, the 't'
 * parameter of the object is set to -1.
 */
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

/**
 * Update the velocity of r1 to bring it in contact with the object the ray
 * collided with.
 *
 * @param {Rectangle} r1 - The moving rectangle.
 * @param {Collision} collision - An object containing the collision time and normal.
 */
export function aabb_continuous_resolve(r1, collision) {
	return new Vector(
		r1.velocity.x + collision.normal.x * Math.abs(r1.velocity.x) * (1 - collision.time),
		r1.velocity.y + collision.normal.y * Math.abs(r1.velocity.y) * (1 - collision.time)
	);
}

/**
 * Test one moving rectangle against one static rectangle for collision.
 *
 * @param {Rectangle} r1 - The moving rectangle to test for collision.
 * @param {Rectangle} r2 - The static rectangle to test against.
 * @param {float} dt
 * @returns {Collision} - A Collision object containing all the
 * informations about the collision. If no collision what detected, the 't'
 * parameter of the object is set to -1.
 */
export function aabb_continuous_detection(r1, r2, dt) {

	/* If r1 is not moving, a collision cannot occur */
	if (r1.velocity.x == 0 && r1.velocity.y == 0)
		return new Collision(-1, 0, 0, 0, 0);

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
