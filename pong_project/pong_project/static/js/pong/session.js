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
		this.server_state = null;
	}
}

export function create_session(id, type, name1, name2) {
	if (window.game_session != null) {
		/* FIXME: Check if event_source is null and attempt to reconnect */
		div_handler("game-div");
		return;
	}
	window.game_session = new GameSession(id, type, name1, name2);
	window.event_source = id === 0 ? null : new EventSource(`http://localhost:8000/api/games/${id}/`);
	div_handler("game-div");
	update_loop_start(window.game_session);
}

function reconcile(data, session) {
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

	let new_inputs = session.inputs.filter(input => input.timestamp > data.last_input);
	session.inputs = new_inputs;

	input.apply_inputs(server_state, session.inputs);

	session.server_state = server_state;
}

function update_loop_start(session) {
	if (window.event_source != null) {
		window.event_source.onmessage = (event) => {
			console.log(event.data);
			reconcile(JSON.parse(event.data), session);
		};
		window.event_source.onerror = (error) => {
			console.error('EventSource failed:', error);
			window.event_source.close();
			/* FIXME: Handle this properly */
		};
	}

	session.old_time = performance.now();
	requestAnimationFrame(() => update_loop(session));
}

function update_loop(session) {
	let new_time = performance.now();
	let frame_time = new_time - session.old_time;
	session.old_time = new_time;

	/* Convert the frame time from milliseconds to seconds before adding it */
	session.accumulator += (frame_time / 1000);

	if (session.server_state != null) {
		session.state = session.server_state;
		session.server_state = null;
	}

	while (session.accumulator >= session.dt) {
		input.apply_inputs(session.state, session.inputs);
		if (session.type != g.TYPE_REMOTE)
			session.inputs = [];
		state.state_update(session.state, session.dt, session.t);
		session.accumulator -= session.dt;
		session.t += session.dt;
	}

	/* FIXME: Is there a cleaner way to it ? */
	/* FIXME: Use cancelAnimationFrame */
	if (session.state.status === g.STATUS_QUIT) {
		sound.stop_music();
		div_handler("game-menu-div");
		window.game_session = null;
		return;
	}

	graphics.draw_state(g.ctx, session.state);
	requestAnimationFrame(() => update_loop(session));
}
