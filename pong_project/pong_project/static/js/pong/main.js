import * as ai from './ai.js';
import * as g from './global.js';
import * as state from './state.js';
import * as input from './input.js';
import * as graphics from './graphics.js';

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
		let server_state = new state.GameState();
		server_state.status = data.status;
		server_state.ball.position.x = data.ball.x;
		server_state.ball.position.y = data.ball.y;
		server_state.ball.velocity.x = data.ball.vx;
		server_state.ball.velocity.y = data.ball.vy;
		server_state.player1.position.x = data.player1.x;
		server_state.player2.position.x = data.player2.x;
		server_state.player1.velocity.x = data.player1.vx;
		server_state.player2.velocity.x = data.player2.vx;
		server_state.score1 = data.player1.score;
		server_state.score2 = data.player2.score;

		let new_inputs = this.inputs.filter(input => input.timestamp > data.last_input);
		this.inputs = new_inputs;

		input.apply_inputs(server_state, this.inputs);
		state.state_update(server_state, this.dt, this.t);

		this.state = server_state;
	}

	loop_start() {
		if (this.id != 0) {
			this.event_source.onmessage = (event) => {
				console.log(event.data);
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

	/* FIXME Move all this out of the class */
	loop() {
		let new_time = performance.now();
		let frame_time = new_time - this.old_time;
		this.old_time = new_time;

		/* Convert the frame time from milliseconds to seconds before adding it */
		this.accumulator += (frame_time / 1000);

		while (this.accumulator >= this.dt) {
			input.apply_inputs(this.state, this.inputs);
			if (this.type != g.TYPE_REMOTE)
				this.inputs = [];
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

		graphics.draw_state(g.ctx, this.state);
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
