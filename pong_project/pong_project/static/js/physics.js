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
 * @returns {Vector} - The collision normal
 */
export function aabb_discrete_resolve(r1, r2) {
	let overlap = new Vector(
		Math.min(r1.position.x + r1.size.x - r2.position.x, r2.position.x + r2.size.x - r1.position.x),
		Math.min(r1.position.y + r1.size.y - r2.position.y, r2.position.y + r2.size.y - r1.position.y)
	);

	const buffer = 1;
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

export function particles_create(array, source, n) {
	array.length = 0;
	for (let i = 0; i < n; i++) {
		array.push(new Particle(
			source.position.x + source.size.x / 2,
			source.position.y + source.size.y / 2,
			4,
			4,
			(Math.random() - 0.5) * 100,
			(Math.random() - 0.5) * 100,
			1.5)
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
