import * as requests from './requests.js';
import * as game from './game.js';

function add_all_listeners() {
	document.getElementById('login-btn').addEventListener('click', function () {
		requests.send_login_request();
	});

	document.getElementById('register-btn').addEventListener('click', function () {
		requests.send_register_request();
	});

	document.addEventListener('keydown', (event) => {
		const key_name = event.key;

		requests.send_user_input(key_name);
		if (key_name === 'a') game.set_player_input(0, game.LEFT);
		else if (key_name === 's') game.set_player_input(0, game.RIGHT);
		else if (key_name === 'k' && game.g_current_game_data.type === "local") game.set_player_input(1, game.LEFT);
		else if (key_name === 'l' && game.g_current_game_data.type === "local") game.set_player_input(1, game.RIGHT);
	});

	document.addEventListener('keyup', (event) => {
		const key_name = event.key;
		if (key_name === 'a' || key_name === 's') {
			game.set_player_input(0, 0);
		} else if ((key_name === 'k' || key_name === 'l') && game.g_current_game_data.type === "local") {
			game.set_player_input(1, 0);
		}
	});

	document.getElementById('start-local-game-btn').addEventListener('click', () => requests.send_game_creation_request('local'));
	document.getElementById('start-remote-game-btn').addEventListener('click', () => requests.send_game_creation_request('remote'));
	document.getElementById('start-ai-game-btn').addEventListener('click', () => requests.send_game_creation_request('ai'));
}

document.addEventListener('DOMContentLoaded', function () {
	add_all_listeners();
	requests.send_status_request();
});
