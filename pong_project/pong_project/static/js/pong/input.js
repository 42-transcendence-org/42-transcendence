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

document.addEventListener('keydown', (event) => {
	if (window.game_session === null || window.game_session.state === null) return;

	const time = Date.now();
	const key_name = event.key;
	if (key_name === 'a' && window.game_session.state.player1.velocity.x != -g.PADDLE_SPEED) {
		if (window.game_session.id != 0) requests.send_user_input(g.INPUT_LEFT, time);
		window.game_session.inputs.push(new Input(g.ID_PLAYER1, g.INPUT_LEFT, time));
	} else if (key_name === 's' && window.game_session.state.player1.velocity.x != g.PADDLE_SPEED) {
		if (window.game_session.id != 0) requests.send_user_input(g.INPUT_RIGHT, time);
		window.game_session.inputs.push(new Input(g.ID_PLAYER1, g.INPUT_RIGHT, time));
	} else if (key_name === 'k' && window.game_session.state.player2.velocity.x != -g.PADDLE_SPEED) {
		window.game_session.inputs.push(new Input(g.ID_PLAYER2, g.INPUT_LEFT, time));
	} else if (key_name === 'l' && window.game_session.state.player2.velocity.x != g.PADDLE_SPEED) {
		window.game_session.inputs.push(new Input(g.ID_PLAYER2, g.INPUT_RIGHT, time));
	} else if (key_name === ' ') {
		if (window.game_session.id != 0) requests.send_user_input(g.INPUT_SPACE, time);
		window.game_session.inputs.push(new Input(g.ID_PLAYER1, g.INPUT_SPACE, time));
	} else if (key_name === 'Escape') {
		if (window.game_session.id != 0) requests.send_user_input(g.INPUT_QUIT, time);
		window.game_session.inputs.push(new Input(g.ID_PLAYER1, g.INPUT_QUIT, time));
	}
});

document.addEventListener('keyup', (event) => {
	if (window.game_session === null || window.game_session.state === null) return;

	const time = Date.now();
	const key_name = event.key;
	if ((key_name === 'a' || key_name === 's') && window.game_session.state.player1.velocity.x != 0) {
		if (window.game_session.id != 0) requests.send_user_input(g.INPUT_NEUTRAL, time);
		window.game_session.inputs.push(new Input(g.ID_PLAYER1, g.INPUT_NEUTRAL, time));
	} else if ((key_name === 'k' || key_name === 'l') && window.game_session.state.player2.velocity.x != 0) {
		window.game_session.inputs.push(new Input(g.ID_PLAYER2, g.INPUT_NEUTRAL, time));
	}
});

/**
 * Apply all inputs to the game state.
 * @param {GameState} state - A game state.
 * @param {Input[]} inputs - An array of inputs.
 */
export function apply_inputs(state, inputs) {
	inputs.forEach((input) => {
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
				if (state.status === g.STATUS_BEGIN) {
					state.status = g.STATUS_ACTIVE;
					sound.play_music();
				} else if (state.status === g.STATUS_ACTIVE || state.status === g.STATUS_PAUSED) {
					state.status = state.status === g.STATUS_ACTIVE ? g.STATUS_PAUSED : g.STATUS_ACTIVE;
				} else if (state.status === g.STATUS_ENDED_1 || state.status === g.STATUS_ENDED_2) {
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
