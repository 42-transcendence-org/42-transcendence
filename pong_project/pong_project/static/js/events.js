import * as sound from './sound.js';
import * as requests from './requests.js';

import { load_font } from './graphics.js';
import { LEFT, NEUTRAL, RIGHT, SPACE, STATUS_WAITING, STATUS_ACTIVE, STATUS_ENDED_1, STATUS_ENDED_2 } from './GameState.js';

function add_all_listeners() {
	document.addEventListener('keydown', (event) => {
		if (g_session === null || g_session.state === null) return;

		const key_name = event.key;
		if (key_name === 'a' && g_session.state.inputs[0] != LEFT) {
			requests.send_user_input(0, LEFT);
			g_session.state.input_handler(0, LEFT);
		} else if (key_name === 's' && g_session.state.inputs[0] != RIGHT) {
			requests.send_user_input(0, RIGHT);
			g_session.state.input_handler(0, RIGHT);
		} else if (key_name === 'k' && g_session.state.inputs[1] != LEFT) {
			requests.send_user_input(1, LEFT);
			g_session.state.input_handler(1, LEFT);
		} else if (key_name === 'l' && g_session.state.inputs[1] != RIGHT) {
			requests.send_user_input(1, RIGHT);
			g_session.state.input_handler(1, RIGHT);
		} else if (key_name === ' ' && g_session.state.status === STATUS_WAITING) {
			/* TODO Send input to server */
			requests.send_user_input(0, SPACE);
			g_session.state.status = STATUS_ACTIVE;
			sound.play_music();
		} else if (key_name === ' ' && (g_session.state.status === STATUS_ENDED_1 || g_session.state.status === STATUS_ENDED_2)) {
			/* TODO Send input to server */
			requests.send_user_input(0, SPACE);
			g_session.state.status = STATUS_ACTIVE;
			g_session.state.reset_game();
		}
	});

	document.addEventListener('keyup', (event) => {
		if (g_session === null || g_session.state === null) return;

		const key_name = event.key;
		if (key_name === 'a' || key_name === 's') {
			g_session.state.inputs[0] = NEUTRAL;
			requests.send_user_input(0, NEUTRAL);
		} else if ((key_name === 'k' || key_name === 'l')) {
			g_session.state.inputs[1] = NEUTRAL;
			requests.send_user_input(1, NEUTRAL);
		}
	});

	document.getElementById('ok-button').addEventListener('click', function () { requests.send_alias_request(); });
	document.getElementById('local-button').addEventListener('click', () => requests.send_game_creation_request('local'));
	document.getElementById('remote-button').addEventListener('click', () => requests.send_game_creation_request('remote'));
	document.getElementById('ai-button').addEventListener('click', () => requests.send_game_creation_request('ai'));
}

document.addEventListener('DOMContentLoaded', function () {
	add_all_listeners();
	load_font();
	requests.send_get_alias_request();
});
