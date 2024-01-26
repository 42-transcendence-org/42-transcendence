import { g_current_game_id } from './game.js';
import { get_cookie, div_handler } from './utils.js';

/* Authentification */
export function send_status_request() {
	fetch('http://localhost:8000/api/auth/status/', {
		method: 'GET',
		headers: {
			'Content-Type': 'application/json',
		},
		credentials: 'include'
	})
		.then(response => response.json())
		.then(data => {
			if (data.is_authenticated) {
				div_handler("game-menu-div");
			} else {
				div_handler("auth-form-div");
			}
		})
		.catch(error => console.error('Error:', error));
}

export function send_login_request() {
	const username = document.getElementById('username').value;
	const password = document.getElementById('password').value;

	fetch('http://localhost:8000/api/auth/login/', {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json',
			'X-CSRFToken': get_cookie("csrftoken"),
		},
		credentials: 'include',
		body: JSON.stringify({ username, password })
	})
		.then(response => {
			if (response.ok) {
				div_handler("game-menu-div");
			} else {
				throw new Error('Network response was not ok: ' + response.statusText);
			}
		})
		.catch(error => console.error('Error:', error));
}

export function send_register_request() {
	const username = document.getElementById('username').value;
	const password = document.getElementById('password').value;

	fetch('http://localhost:8000/api/auth/register/', {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json',
			'X-CSRFToken': get_cookie("csrftoken"),
		},
		credentials: 'include',
		body: JSON.stringify({ username, password })
	})
		.then(response => {
			if (response.ok) {
				send_login_request();
			} else {
				throw new Error('Network response was not ok: ' + response.statusText);
			}
		})
		.catch(error => console.error('Error:', error));
}

/* User inputs */
export function send_user_input(key_name) {
	if (!g_current_game_id) return;

	let input;
	if (key_name === 'a') {
		input = { id: "1", action: "left" };
	} else if (key_name === 's') {
		input = { id: "1", action: "right" };
	} else if (key_name === 'k') {
		input = { id: "2", action: "left" };
	} else if (key_name === 'l') {
		input = { id: "2", action: "right" };
	} else {
		return;
	}

	fetch(`http://localhost:8000/api/games/${g_current_game_id}/`, {
		method: 'PUT',
		headers: {
			'Content-Type': 'application/json',
			'X-CSRFToken': get_cookie("csrftoken"),
		},
		body: JSON.stringify(input)
	})
		.then(response => {
			if (!response.ok) {
				throw new Error('Network response was not ok');
			}
			return response.json();
		})
		.then(data => {
			console.log('Input sent successfully:', data);
		})
		.catch(error => {
			console.error('Error sending input:', error);
		});
}
