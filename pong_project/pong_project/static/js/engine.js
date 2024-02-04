let t = 0.0;
let accumulator = 0.0;
let current_time = 0.0;

const dt = 1.0 / 60.0;

let render;
let integrate;

/* TODO Finalize the loop: https://gafferongames.com/post/fix_your_timestep/ */
function loop() {
	let new_time = performance.now();
	let frametime = new_time - current_time;
	current_time = new_time;

	accumulator += frametime;

	while (accumulator >= dt) {
		integrate(dt);
		accumulator -= dt;
		t += dt;
	}
	render();
	requestAnimationFrame(loop);
}

/**
 * Initializes and starts the main loop of the game engine. This function
 * sets up the game state and controls the timing for updating and
 * rendering the game.
 *
 * @param {Function} user_init - A function that is executed once to
 * initialize the game state. It should contain setup code and is called at
 * the beginning of the program.
 * @param {Function} user_update - A function that updates the game state.
 * It is called repeatedly at fixed time intervals, defined by 'dt'
 * (default: 1/60, or 60 times per second). This function should accept a
 * single parameter 'dt', which represents the fixed time step for each
 * update.
 * @param {Function} user_draw - A function responsible for rendering the
 * game state. It is called as frequently as possible (in sync with the
 * browser's refresh rate). This function should not accept any parameters
 * and is dedicated to drawing operations.
 */
export function start_loop(user_init, user_update, user_draw, data) {
	user_init(data);
	render = user_draw;
	integrate = user_update;
	current_time = performance.now();
	requestAnimationFrame(loop);
}
