import * as g from './global.js';
import * as state from './state.js';
import * as input from './input.js';
import * as sound from './sound.js';
import * as graphics from './graphics.js';

import { div_handler } from "../utils.js";

export class GameSession {
	constructor(id, type, name1, name2) {
		this.id = id;
		this.type = type;
		this.inputs = [];
		this.t = 0.0;
		this.saved_t = 0.0;
		this.dt = 1.0 / 60.0;
		this.accumulator = 0.0;
		this.previous_time = 0.0;
		this.name1 = name1;
		this.name2 = name2;
		this.ready1 = 0
		this.ready2 = 0
		this.last_recv_input = 0;
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
		/* FIXME: Add security check */
		window.game_session.state.status = g.STATUS_WAITING;
		window.event_source = new EventSource(`http://localhost:8000/api/games/${id}/`);
	} else {
		window.game_session.name1 = "Player 1";
		window.game_session.name2 = type === g.TYPE_LOCAL ? "Player 2" : "Computer";
	}
	div_handler("game-div");
	update_loop_start();
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

function reconcile() {

	window.game_session.ready1 = window.server_data[0];
	window.game_session.ready2 = window.server_data[1];
	window.game_session.state.status = window.server_data[2];
	window.game_session.name1 = window.server_data[3];
	window.game_session.name2 = window.server_data[4];
	window.game_session.last_recv_input = window.server_data[5];
	window.game_session.state.ball.position.x = window.server_data[6];
	window.game_session.state.ball.position.y = window.server_data[7];
	window.game_session.state.ball.velocity.x = window.server_data[8];
	window.game_session.state.ball.velocity.y = window.server_data[9];
	window.game_session.state.score1 = window.server_data[10];
	window.game_session.state.player1.position.x = window.server_data[11];
	window.game_session.state.player1.velocity.x = window.server_data[12];
	window.game_session.state.score2 = window.server_data[13];
	window.game_session.state.player2.position.x = window.server_data[14];
	window.game_session.state.player2.velocity.x = window.server_data[15];

	let new_inputs = window.game_session.inputs.filter(input => input.timestamp > window.game_session.last_recv_input);
	window.game_session.inputs = new_inputs;

	input.apply_inputs(window.game_session, window.game_session.state);

}

function update_loop_start() {
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

	sound.play_music();
	window.game_session.previous_time = performance.now();
	window.request_id = requestAnimationFrame(update_loop);
}

function update_loop() {

	if (window.server_data != null) {
		reconcile();
		window.server_data = null;
	}

	let new_time = performance.now();
	let frame_time = new_time - window.game_session.previous_time;
	window.game_session.previous_time = new_time;

	/* Convert the frame time from milliseconds to seconds before adding it */
	window.game_session.accumulator += (frame_time / 1000);

	input.apply_inputs(window.game_session, window.game_session.state);
	if (window.game_session.type != g.TYPE_REMOTE)
		window.game_session.inputs = [];

	while (window.game_session.accumulator >= window.game_session.dt) {
		if (window.game_session.state.status === g.STATUS_ACTIVE || window.game_session.state.status === g.STATUS_ENDED || window.game_session.state.status === g.STATUS_SCORE) {
			state.state_update(window.game_session, window.game_session.state);
		}
		window.game_session.accumulator -= window.game_session.dt;
		window.game_session.t += window.game_session.dt;
	}

	if (window.game_session.state.status === g.STATUS_QUIT) {
		session_destroy();
		return;
	}

	graphics.draw_state(g.ctx, window.game_session, window.game_session.state);
	window.request_id = requestAnimationFrame(update_loop);
}
