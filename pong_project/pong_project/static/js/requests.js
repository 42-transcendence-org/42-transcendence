import * as game from './game.js';
import { get_cookie, div_handler } from './utils.js';

/* Authentification */
export async function send_status_request() {
	try {
		const response = await fetch('http://localhost:8000/api/auth/status/', {
			method: 'GET',
			headers: {
				'Content-Type': 'application/json',
				'X-CSRFToken': get_cookie("csrftoken"),
			},
			credentials: 'include',
		});

		const data = await response.json();

		if (data.is_authenticated) {
			div_handler("game-menu-div");
		} else {
			div_handler("auth-form-div");
		}
	} catch (error) {
		console.error('Error:', error);
	}
}

export async function send_login_request() {
	try {
		const username = document.getElementById('username').value;
		const password = document.getElementById('password').value;

		const response = await fetch('http://localhost:8000/api/auth/login/', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
				'X-CSRFToken': get_cookie("csrftoken"),
			},
			credentials: 'include',
			body: JSON.stringify({ username, password }),
		});

		if (!response.ok) {
			throw new Error('Network response was not ok: ' + response.statusText);
		}

		div_handler("game-menu-div");
	} catch (error) {
		console.error('Error:', error);
	}
}

export async function send_register_request() {
	try {
		const username = document.getElementById('username').value;
		const password = document.getElementById('password').value;

		const response = await fetch('http://localhost:8000/api/auth/register/', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
				'X-CSRFToken': get_cookie("csrftoken"),
			},
			credentials: 'include',
			body: JSON.stringify({ username, password }),
		});

		if (!response.ok) {
			throw new Error('Network response was not ok: ' + response.statusText);
		}

		await send_login_request();
	} catch (error) {
		console.error('Error:', error);
	}
}

/* Game */
export async function send_user_input(key_name) {
	try {
		if (!game.g_current_game_data) return;

		let input;
		if (key_name === 'a') {
			input = { id: "1", action: "left" };
		} else if (key_name === 's') {
			input = { id: "1", action: "right" };
		} else if (key_name === 'k' && game.g_current_game_data.type === "local") {
			input = { id: "2", action: "left" };
		} else if (key_name === 'l' && game.g_current_game_data.type === "local") {
			input = { id: "2", action: "right" };
		} else {
			return;
		}

		const response = await fetch(`http://localhost:8000/api/games/${game.g_current_game_data.id}/update/`, {
			method: 'PUT',
			headers: {
				'Content-Type': 'application/json',
				'X-CSRFToken': get_cookie("csrftoken"),
			},
			body: JSON.stringify(input),
		});

		if (!response.ok) {
			throw new Error('Network response was not ok: ' + response.statusText);
		}
	} catch (error) {
		console.error('Error sending input:', error);
	}
}

export async function send_game_creation_request(game_type) {
	try {
		const response = await fetch('http://localhost:8000/api/games/', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
				'X-CSRFToken': get_cookie("csrftoken"),
			},
			credentials: 'include',
			body: JSON.stringify({ type: game_type }),
		});

		const data = await response.json();

		if (!response.ok) {
			throw new Error(data.message || 'Server error');
		}

		if (data) {
			game.set_current_game_data(data);
			game.set_current_game_data_server(data);
			game.set_current_game_data_local(data);
			div_handler("game-canvas-div");
			game.game_start_loop();
		} else {
			console.error('Game creation failed');
		}
	} catch (error) {
		console.error('Error:', error);
	}
}
