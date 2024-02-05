import * as requests from './requests.js';

import { LEFT, NEUTRAL, RIGHT } from './GameState.js'

/* FIXME: How to access this cleanly */
document.addEventListener('keydown', (event) => {
	const key_name = event.key;

	if (key_name === 'a' && g_session.state.inputs[0] != LEFT) {
		g_session.state.inputs[0] = LEFT;
		requests.send_user_input(0, LEFT);
	} else if (key_name === 's' && g_session.state.inputs[0] != RIGHT) {
		g_session.state.inputs[0] = RIGHT;
		requests.send_user_input(0, RIGHT);
	} else if (key_name === 'k' && g_session.state.inputs[1] != LEFT) {
		g_session.state.inputs[1] = LEFT;
		requests.send_user_input(1, LEFT);
	} else if (key_name === 'l' && g_session.state.inputs[1] != RIGHT) {
		g_session.state.inputs[1] = RIGHT;
		requests.send_user_input(1, RIGHT);
	} else if (key_name === ' ' && state.status === "waiting") {
		/* TODO Send input to server */
		state.status = STATUS_ACTIVE;
		sound.play_music();
	} else if (key_name === ' ' && (state.status === STATUS_ENDED_1 || state.status === STATUS_ENDED_2)) {
		state.status = STATUS_ACTIVE;
		/* TODO Send input to server */
		game_reset();
	}
});

document.addEventListener('keyup', (event) => {
	const key_name = event.key;
	if (key_name === 'a' || key_name === 's') {
		g_session.state.inputs[0] = NEUTRAL;
		requests.send_user_input(0, NEUTRAL);
	} else if ((key_name === 'k' || key_name === 'l')) {
		g_session.state.inputs[1] = NEUTRAL;
		requests.send_user_input(1, NEUTRAL);
	}
});

function add_all_listeners() {
	document.getElementById('ok-button').addEventListener('click', function () {
		requests.send_alias_request();
	});

	document.getElementById('local-button').addEventListener('click', () => requests.send_game_creation_request('local'));
	document.getElementById('remote-button').addEventListener('click', () => requests.send_game_creation_request('remote'));
	document.getElementById('ai-button').addEventListener('click', () => requests.send_game_creation_request('ai'));
}

document.addEventListener('DOMContentLoaded', function () {
	add_all_listeners();
	requests.send_get_alias_request();
});
