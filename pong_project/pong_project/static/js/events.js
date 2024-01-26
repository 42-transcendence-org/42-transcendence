import * as requests from './requests.js';

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
	});

	document.getElementById('start-local-game-btn').addEventListener('click', () => requests.send_game_creation_request('local'));
	document.getElementById('start-remote-game-btn').addEventListener('click', () => requests.send_game_creation_request('remote'));
	document.getElementById('start-ai-game-btn').addEventListener('click', () => requests.send_game_creation_request('ai'));
}


document.addEventListener('DOMContentLoaded', function () {
	add_all_listeners();
	requests.send_status_request();
});
