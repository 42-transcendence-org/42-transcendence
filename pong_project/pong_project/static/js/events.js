import { send_login_request, send_register_request, send_status_request, send_user_input } from './requests.js';

function add_all_listeners() {
	document.getElementById('login-btn').addEventListener('click', function () {
		send_login_request();
	});

	document.getElementById('register-btn').addEventListener('click', function () {
		send_register_request();
	});

	document.addEventListener('keydown', (event) => {
		const key_name = event.key;
		send_user_input(key_name);
	});

	// document.getElementById('start-local-game-btn').addEventListener('click', () => createGame('local', csrfToken));
	// document.getElementById('start-remote-game-btn').addEventListener('click', () => createGame('remote', csrfToken));
	// document.getElementById('start-ai-game-btn').addEventListener('click', () => createGame('ai', csrfToken));
}


document.addEventListener('DOMContentLoaded', function () {
	add_all_listeners();
	send_status_request();
});
