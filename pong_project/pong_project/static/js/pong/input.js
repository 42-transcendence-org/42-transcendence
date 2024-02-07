import * as requests from "../requests.js";

/* INPUTS */
const INPUT_LEFT = 0;
const INPUT_RIGHT = 1;
const INPUT_SPACE = 2;
const INPUT_NEUTRAL = 3;
const INPUT_QUIT = 4;

/* FIXME: Would be more efficient to send all inputs in one request */
document.addEventListener('keydown', (event) => {
	if (window.game_session === null || window.game_session.state === null) return;

	const time = Date.now();
	const key_name = event.key;
	if (key_name === 'a' && window.game_session.state.player1.velocity.x > 0) {
		if (window.game_session.id != 0) requests.send_user_input(state.INPUT_LEFT, time);
		window.game_session.input_handler(state.ID_PLAYER1, state.INPUT_LEFT, time);
	} else if (key_name === 's' && window.game_session.state.player1.velocity.x < 0) {
		if (window.game_session.id != 0) requests.send_user_input(state.INPUT_RIGHT, time);
		window.game_session.input_handler(state.ID_PLAYER1, state.INPUT_RIGHT, time);
	} else if (key_name === 'k' && window.game_session.state.player2.velocity.x > 0) {
		window.game_session.input_handler(state.ID_PLAYER2, state.INPUT_LEFT, time);
	} else if (key_name === 'l' && window.game_session.state.player2.velocity.x < 0) {
		window.game_session.input_handler(state.ID_PLAYER2, state.INPUT_RIGHT, time);
	} else if (key_name === ' ') {
		if (window.game_session.id != 0) requests.send_user_input(state.INPUT_SPACE, time);
		window.game_session.input_handler(state.ID_PLAYER1, state.INPUT_SPACE, time);
	} else if (key_name === 'Escape') {
		if (window.game_session.id != 0) requests.send_user_input(state.INPUT_QUIT, time);
		window.game_session.input_handler(state.ID_PLAYER1, state.INPUT_QUIT, time);
	}
});

document.addEventListener('keyup', (event) => {
	if (window.game_session === null || window.game_session.state === null) return;

	const time = Date.now();
	const key_name = event.key;
	if ((key_name === 'a' || key_name === 's') && window.game_session.state.player1.velocity.x != 0) {
		if (window.game_session.id != 0) requests.send_user_input(state.INPUT_NEUTRAL, time);
		window.game_session.input_handler(state.ID_PLAYER1, state.INPUT_NEUTRAL, time);
	} else if ((key_name === 'k' || key_name === 'l') && window.game_session.state.player2.velocity.x != 0) {
		window.game_session.input_handler(state.ID_PLAYER2, state.INPUT_NEUTRAL, time);
	}
});

export class Input {
	constructor(id, input, time) {
		this.id = id;
		this.input = input;
		this.timestamp = time;
	}
}

export function input_add(array, id, input, time) {
	array.push(new Input(id, input, time));
}

/**
 * Apply all inputs to the game state.
 * @param {GameState} state - A game state.
 * @param {Input[]} inputs - An array of inputs.
 */
export function apply_inputs(state, inputs) {
	inputs.forEach((input) => {
		let player = (input.id === ID_PLAYER1 ? state.player1 : state.player2);
		switch (input.input) {
			case INPUT_NEUTRAL:
				player.velocity.x = 0;
				break;
			case INPUT_LEFT:
				player.velocity.x = -PADDLE_SPEED;
				break;
			case INPUT_RIGHT:
				player.velocity.x = PADDLE_SPEED;
				break;
			case INPUT_SPACE:
				if (state.status === STATUS_WAITING) {
					state.status = STATUS_ACTIVE;
					sound.play_music();
				} else if (state.status === STATUS_ACTIVE || state.status === STATUS_PAUSED) {
					state.status = state.status === STATUS_ACTIVE ? STATUS_PAUSED : STATUS_ACTIVE;
				} else if (state.status === STATUS_ENDED_1 || state.status === STATUS_ENDED_2) {
					state.status = STATUS_ACTIVE;
					reset_game();
				}
				break;
			case INPUT_QUIT:
				if (state.status === STATUS_ENDED_1 || state.status === STATUS_ENDED_2) {
					state.status = STATUS_QUIT;
				}
				break;
		}
	});
	/* FIXME Move this somewhere else */
	if (type != TYPE_REMOTE)
		inputs = [];
}
