import * as g from './global.js';
import * as request from '../requests.js';
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
	const input_id = get_input(key_name);

	if (window.game_session === null || window.game_session.state === null || input_id === -1)
		return;
	if (window.game_session.type === g.TYPE_REMOTE && (key_name === 'k' || key_name === 'l'))
		return;

	let player_id;
	if (window.game_session.type === g.TYPE_REMOTE) {
		player_id = window.alias === window.game_session.name1 ? g.ID_PLAYER1 : g.ID_PLAYER2;
	} else if (key_name === 'a' || key_name === 's' || key_name === ' ' || key_name === 'Escape') {
		player_id = g.ID_PLAYER1;
	} else if (key_name === 'k' || key_name === 'l') {
		player_id = g.ID_PLAYER2;
	}

	window.game_session.inputs.push(new Input(player_id, input_id, time));
	if (window.game_session.type === g.TYPE_REMOTE)
		request.send_user_input(input_id, time);
});

document.addEventListener('keyup', (event) => {
	const time = Date.now();
	const key_name = event.key;
	const input_id = g.INPUT_NEUTRAL;

	if (window.game_session === null || window.game_session.state === null)
		return;
	if (window.game_session.type === g.TYPE_REMOTE && (key_name === 'k' || key_name === 'l'))
		return;

	let player_id;
	if (window.game_session.type === g.TYPE_REMOTE) {
		player_id = window.alias === window.game_session.name1 ? g.ID_PLAYER1 : g.ID_PLAYER2;
	} else if (key_name === 'a' || key_name === 's') {
		player_id = g.ID_PLAYER1;
	} else if (key_name === 'k' || key_name === 'l') {
		player_id = g.ID_PLAYER2;
	}

	window.game_session.inputs.push(new Input(player_id, input_id, time));
	if (window.game_session.type === g.TYPE_REMOTE)
		request.send_user_input(input_id, time);
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
				} else if (session.type != g.TYPE_REMOTE && (state.status === g.STATUS_ACTIVE || state.status === g.STATUS_PAUSED)) {
					state.status = state.status === g.STATUS_ACTIVE ? g.STATUS_PAUSED : g.STATUS_ACTIVE;
				} else if (session.type != g.TYPE_REMOTE && (state.status === g.STATUS_ENDED_1 || state.status === g.STATUS_ENDED_2)) {
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
