import * as requests from './requests.js';
import * as game from './game.js';

document.addEventListener('keydown', (event) => {
	const key_name = event.key;

	if (key_name === 'a') g_inputs[0] = LEFT;
	else if (key_name === 's') g_inputs[0] = RIGHT;
	else if (key_name === 'k') g_inputs[1] = LEFT;
	else if (key_name === 'l') g_inputs[1] = RIGHT;
	else if (key_name === ' ' && state.status === "waiting") { state.status = "active"; sound.play_music(); }
	else if (key_name === ' ' && (state.status === "ended1" || state.status === "ended2")) { state.status = "active"; game_reset(); }
});

document.addEventListener('keyup', (event) => {
	const key_name = event.key;
	if (key_name === 'a' || key_name === 's') {
		g_inputs[0] = NEUTRAL;
	} else if ((key_name === 'k' || key_name === 'l')) {
		g_inputs[1] = NEUTRAL;
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
	// requests.send_status_request();
});
