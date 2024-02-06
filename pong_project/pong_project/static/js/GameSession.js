import { GameState } from "./GameState.js"

let calls = 0;
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

		this.update_start = this.update_start.bind(this);
		this.update_state = this.update_state.bind(this);
	}

	reconcile(data) {
		// this.state.player1.position.x = data.player1.x;
		// this.state.player2.position.x = data.player2.x;
		// this.state.player1.velocity.x = data.player1.vx;
		// this.state.player2.velocity.x = data.player2.vx;
		// this.state.ball.position.x = data.ball.x;
		// this.state.ball.position.y = data.ball.y;
		// this.state.ball.velocity.x = data.ball.vx;
		// this.state.ball.velocity.y = data.ball.vy;
	}

	update_start() {
		this.event_source.onmessage = (event) => {
			this.reconcile(JSON.parse(event.data));
		};
		this.event_source.onerror = (error) => {
			console.error('EventSource failed:', error);
			this.event_source.close();
			/* FIXME: Handle this properly */
		};

		this.current_time = performance.now();
		requestAnimationFrame(this.update_state);
	}

	update_state() {
		let new_time = performance.now();
		let frame_time = new_time - this.current_time;
		this.current_time = new_time;

		/* Convert the frame time from milliseconds to seconds before
		adding it */
		this.accumulator += (frame_time / 1000);

		while (this.accumulator >= this.dt) {
			this.state.update(this.dt);
			this.accumulator -= this.dt;
			this.t += this.dt;
		}

		this.state.draw();
		requestAnimationFrame(this.update_state);
	}
}


