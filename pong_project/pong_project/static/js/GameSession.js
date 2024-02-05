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

		this.event_source = new EventSource(`http://localhost:8000/api/games/${id}/`);

		this.update_state = this.update_state.bind(this);
	}

	reconcile(data) {
		// this.state.player1.position.x = data.player1.x;
		// this.state.player2.position.x = data.player2.x;
		// console.log(this.state.player1.position.x, data.player1.x, data.id);
	}

	update_start() {
		this.event_source.onmessage = (event) => {
			console.log(event.data);
			this.reconcile(JSON.parse(event.data));
		};
		this.event_source.onerror = (error) => {
			console.error('EventSource failed:', error);
			this.event_source.close(); // Ensure `this` is correct here as well
		};

		this.current_time = performance.now();
		this.state.reset_game();
		requestAnimationFrame(this.update_state);
	}

	update_state() {
		let new_time = performance.now();
		let frame_time = new_time - this.current_time;
		this.current_time = new_time;

		this.accumulator += frame_time;

		while (this.accumulator >= this.dt) {
			this.state.update(this.dt);
			this.accumulator -= this.dt;
			this.t += this.dt;
		}
		this.state.draw();
		requestAnimationFrame(this.update_state);
	}
}
