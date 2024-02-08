import * as ai from './ai.js';
import * as g from './global.js';
import * as state from './state.js';
import * as input from './input.js';
import * as graphic from './graphic.js';

import { div_handler } from "../utils.js";

export class GameSession {
	constructor(id, type, name1, name2) {
		this.id = id;
		this.type = type;
		this.inputs = [];
		this.t = 0.0;
		this.dt = 1.0 / 60.0;
		this.accumulator = 0.0;
		this.old_time = 0.0;
		this.name1 = name1;
		this.name2 = name2;
		this.state = new state.GameState();

		this.ai = type === g.TYPE_AI ? new ai.AI() : null;
		this.event_source = id === 0 ? null : new EventSource(`http://localhost:8000/api/games/${id}/`);

		this.loop_start = this.loop_start.bind(this);
		this.loop = this.loop.bind(this);
	}


	reconcile(data) {
	}

	loop_start() {
		if (this.id != 0) {
			this.event_source.onmessage = (event) => {
				this.reconcile(JSON.parse(event.data));
			};
			this.event_source.onerror = (error) => {
				console.error('EventSource failed:', error);
				this.event_source.close();
				/* FIXME: Handle this properly */
			};
		}

		this.old_time = performance.now();
		requestAnimationFrame(this.loop);
	}

	loop() {
		let new_time = performance.now();
		let frame_time = new_time - this.old_time;
		this.old_time = new_time;

		/* Convert the frame time from milliseconds to seconds before adding it */
		this.accumulator += (frame_time / 1000);

		while (this.accumulator >= this.dt) {
			input.apply_inputs(this.state, this.inputs);
			state.state_update(this.state, this.dt, this.t);
			this.accumulator -= this.dt;
			this.t += this.dt;
		}
		/* FIXME: Is there a cleaner way to it ? */
		/* FIXME: Use cancelAnimationFrame */
		if (this.state.status === g.STATUS_QUIT) {
			sound.stop_music();
			div_handler("game-menu-div");
			window.game_session = null;
			return;
		}

		graphic.draw_state(g.ctx, this.state);
		requestAnimationFrame(this.loop);
	}
}

export function create_session(type) {
	if (type != g.TYPE_LOCAL && type != g.TYPE_AI)
		return;
	if (window.game_session != null) {
		div_handler("game-div");
		return;
	}
	window.game_session = new GameSession(0, type, "Player 1", type === g.TYPE_LOCAL ? "Player 2" : "Computer");
	div_handler("game-div");
	window.game_session.loop_start();
}
