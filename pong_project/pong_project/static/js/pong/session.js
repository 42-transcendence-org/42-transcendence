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
		this.old_t = 0.0;
		this.dt = 1.0 / 60.0;
		this.accumulator = 0.0;
		this.old_time = 0.0;
		this.name1 = name1;
		this.name2 = name2;
		this.ready1 = false
		this.ready2 = false
		this.state = new state.GameState();
	}
}

export function session_create(id, type) {
	if (window.game_session != null) {
		/* FIXME: Check if event_source is null and attempt to reconnect */
		div_handler("game-div");
		return;
	}
	window.game_session = new GameSession(id, type, "", "");
	if (type === g.TYPE_REMOTE) {
		window.game_session.state.status = g.STATUS_WAITING;
	} else {
		window.game_session.name1 = "Player 1";
		window.game_session.name2 = type === g.TYPE_LOCAL ? "Player 2" : "Computer";
	}
	window.event_source = id === 0 ? null : new EventSource(`http://localhost:8000/api/games/${id}/`);
	div_handler("game-div");
	update_loop_start(window.game_session);
}

function session_destroy() {
	sound.stop_music();
	div_handler("game-menu-div");
	cancelAnimationFrame(window.request_id);
	window.game_session = null;
	window.request_id = null;
	if (window.event_source) {
		window.event_source.close()
		window.event_source = null;
	}
}

function reconcile(data, session) {

	session.ready1 = data.ready1;
	session.ready2 = data.ready2;
	session.name1 = data.player1.name;
	session.name2 = data.player2.name;
	session.state.status = data.status;
	session.state.ball.position.x = data.ball.x;
	session.state.ball.position.y = data.ball.y;
	session.state.ball.velocity.x = data.ball.vx;
	session.state.ball.velocity.y = data.ball.vy;
	session.state.player1.position.x = data.player1.x;
	session.state.player2.position.x = data.player2.x;
	session.state.player1.velocity.x = data.player1.vx;
	session.state.player2.velocity.x = data.player2.vx;
	session.state.score1 = data.player1.score;
	session.state.score2 = data.player2.score;

	let new_inputs = session.inputs.filter(input => input.timestamp > data.last_input);
	session.inputs = new_inputs;

	input.apply_inputs(session, session.state);

}

function update_loop_start(session) {
	if (window.event_source != null) {
		window.event_source.onmessage = (event) => {
			window.server_data = JSON.parse(event.data);
		};
		window.event_source.onerror = (error) => {
			console.error('EventSource failed:', error);
			window.event_source.close();
			/* FIXME: Handle this properly */
		};
	}

	session.old_time = performance.now();
	window.request_id = requestAnimationFrame(() => update_loop(session));
}

function update_loop(session) {

	if (window.server_data != null) {
		reconcile(window.server_data, session);
		window.server_data = null;
	}

	if (session.state.status != g.STATUS_WAITING) {

		let new_time = performance.now();
		let frame_time = new_time - session.old_time;
		session.old_time = new_time;

		/* Convert the frame time from milliseconds to seconds before adding it */
		session.accumulator += (frame_time / 1000);

		while (session.accumulator >= session.dt) {
			input.apply_inputs(session, session.state);
			if (session.type != g.TYPE_REMOTE)
				session.inputs = [];
			state.state_update(session, session.state);
			session.accumulator -= session.dt;
			session.t += session.dt;
		}

		if (session.state.status === g.STATUS_QUIT) {
			session_destroy();
			return;
		}

	}

	graphics.draw_state(g.ctx, session, session.state);
	window.request_id = requestAnimationFrame(() => update_loop(session));
}
