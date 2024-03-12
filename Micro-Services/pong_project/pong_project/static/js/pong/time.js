import * as g from './global.js';

export class TimeManager {
	constructor() {
		this.timestep = g.TIMESTEP;
		this.remote_tick = -1;
		this.remote_tick_max = -1;
		this.accumulator = 0.0;
		this.frame_duration = 0.0;
		this.remote_send_rate = 2;
		this.last_time = performance.now();
		this.server_send_rate = g.SERVER_SENDRATE;
		this.interpolation_buffer = this.server_send_rate * 2.0;
	}

	init(tick) {
		this.remote_tick = tick - (this.remote_send_rate * 2);
	}



	update_time() {
		let curr_time = performance.now();

		/* Convert to seconds */
		this.frame_duration = (curr_time - this.last_time) / 1000;

		/* Cap to avoid the 'spriral of death' */
		if (this.frame_duration > 0.25)
			this.frame_duration = 0.25;

		this.last_time = curr_time;

		this.accumulator += this.frame_duration;
	}

	decrement_accumulator() {
		this.accumulator -= this.timestep;
	}

	accumulator_has_enough_time() {
		return this.accumulator >= this.timestep ? true : false;
	}

	get_timestep() {
		return this.timestep;
	}

	get_remote_tick() {
		return this.remote_tick;
	}

	compute_remote_alpha(old_tick, new_tick) {
		return (this.remote_tick - old_tick) / (new_tick - old_tick);
	}

	compute_local_alpha() {
		return this.accumulator / this.timestep;
	}

	get_accumulator() {
		return this.accumulator;
	}
}
