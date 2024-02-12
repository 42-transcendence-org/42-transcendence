import * as g from './global.js';
import * as sound from "./sound.js";
import * as requests from "../requests.js";
import { reset_state } from './state.js';

export class Input {
	constructor(id, input, time) {
		this.id = id;
		this.input = input;
		this.timestamp = time;
	}
}

function get_input(key) {
	switch (key) {
		case 'a':
			return g.INPUT_LEFT
		case 'k':
			return g.INPUT_LEFT
		case 's':
			return g.INPUT_RIGHT
		case 'l':
			return g.INPUT_RIGHT
		case ' ':
			return g.INPUT_SPACE
		case 'Escape':
			return g.INPUT_QUIT
		default:
			return -1;
	}
}

document.addEventListener('keydown', (event) => {
	const time = Date.now();
	const key_name = event.key;
	const input = get_input(key_name);

	if (window.game_session === null || window.game_session.state === null || input === -1)
		return;

	if (key_name === 'a' || key_name === 's') {
		if (window.game_session.type == g.TYPE_REMOTE) {
			window.game_session.inputs.push(new Input(window.alias === window.game_session.name1 ? g.ID_PLAYER1 : g.ID_PLAYER2, input, time));
		} else {
			window.game_session.inputs.push(new Input(g.ID_PLAYER1, input, time));
		}
	} else if (key_name === 'k' || key_name === 'l') {
		window.game_session.inputs.push(new Input(g.ID_PLAYER2, input, time));
	} else if (key_name === ' ') {
		window.game_session.inputs.push(new Input(g.ID_PLAYER1, input, time));
	} else if (key_name === 'Escape') {
		window.game_session.inputs.push(new Input(g.ID_PLAYER1, input, time));
	}
});

document.addEventListener('keyup', (event) => {
	if (window.game_session === null || window.game_session.state === null)
		return;

	const time = Date.now();
	const key_name = event.key;
	if ((key_name === 'a' || key_name === 's')) {
		if (window.game_session.id != 0)
			requests.send_user_input(g.INPUT_NEUTRAL, time);
		if (window.game_session.type == g.TYPE_REMOTE) {
			window.game_session.inputs.push(new Input(window.alias == window.game_session.name1 ? g.ID_PLAYER1 : g.ID_PLAYER2, g.INPUT_NEUTRAL, time));
		} else {
			window.game_session.inputs.push(new Input(g.ID_PLAYER1, g.INPUT_NEUTRAL, time));
		}
	} else if ((key_name === 'k' || key_name === 'l')) {
		window.game_session.inputs.push(new Input(g.ID_PLAYER2, g.INPUT_NEUTRAL, time));
	}
});

export function apply_inputs(session, state) {
	session.inputs.forEach((input) => {
		let player = (input.id === g.ID_PLAYER1 ? state.player1 : state.player2);
		switch (input.input) {
			case g.INPUT_NEUTRAL:
				player.velocity.x = 0;
				break;
			case g.INPUT_LEFT:
				player.velocity.x = -g.PADDLE_SPEED;
				break;
			case g.INPUT_RIGHT:
				player.velocity.x = g.PADDLE_SPEED;
				break;
			case g.INPUT_SPACE:
				if (session.type != g.TYPE_REMOTE && state.status === g.STATUS_BEGIN) {
					state.status = g.STATUS_ACTIVE;
					sound.play_music();
				} else if (session.type != g.TYPE_REMOTE && (state.status === g.STATUS_ACTIVE || state.status === g.STATUS_PAUSED)) {
					state.status = state.status === g.STATUS_ACTIVE ? g.STATUS_PAUSED : g.STATUS_ACTIVE;
				} else if (session.type != g.TYPE_REMOTE && state.status === g.STATUS_ENDED_1 || state.status === g.STATUS_ENDED_2) {
					state.status = g.STATUS_ACTIVE;
					reset_state(state);
				}
				break;
			case g.INPUT_QUIT:
				if (state.status === g.STATUS_ENDED_1 || state.status === g.STATUS_ENDED_2) {
					state.status = g.STATUS_QUIT;
				}
				break;
		}
	});
}
