import { GameState } from "./GameState.js"

export class GameSession {
	constructor(id, type, name1, name2) {
		this.id = id;
		this.type = type;
		this.t = 0.0;
		this.dt = 1.0 / 60.0;
		this.accumulator = 0.0;
		this.current_time = 0.0;
		this.name1 = name1;
		this.name2 = name2;
		this.state = new GameState();
	}

	update_start() {
		this.current_time = performance.now();
		requestAnimationFrame(this.update_state());
	}

	update_state() {
		let new_time = performance.now();
		let frame_time = new_time - current_time;
		this.current_time = new_time;

		this.accumulator += frame_time;

		while (this.accumulator >= this.dt) {
			this.state.update(this.dt);
			this.accumulator -= this.dt;
			t += this.dt;
		}
		render();
		requestAnimationFrame(this.update_state());
	}
}
