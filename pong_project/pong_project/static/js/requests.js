import { g_id } from './game.js';
import { get_cookie, div_handler } from './utils.js';

export async function send_alias_request() {
	try {
		const alias = document.getElementById('alias').value;

		const response = await fetch('/api/alias/', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
				'X-CSRFToken': get_cookie("csrftoken"),
			},
			credentials: 'include',
			body: JSON.stringify({ "alias": alias }),
		});

		if (!response.ok) {
			throw new Error('Network response was not ok: ' + response.statusText);
		}

		div_handler("game-menu-div");
	} catch (error) {
		console.error('Error:', error);
	}
}

export async function send_get_alias_request() {
	try {
		const response = await fetch('/api/alias/', {
			method: 'GET',
			headers: {
				'Content-Type': 'application/json',
				'X-CSRFToken': get_cookie("csrftoken"),
			},
			credentials: 'include',
		});

		if (!response.ok) div_handler("alias-div");
		else div_handler("game-menu-div");

	} catch (error) {
		console.error('Error:', error);
	}
}

export async function send_user_input(player_id, player_input) {
	try {
		if (g_id === null) return;

		const response = await fetch(`/api/games/${g_id}`, {
			method: 'PUT',
			headers: {
				'Content-Type': 'application/json',
				'X-CSRFToken': get_cookie("csrftoken"),
			},
			body: JSON.stringify({ "id": player_id, "input": player_input }),
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
		const response = await fetch('/api/games/', {
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
			throw new Error(data.error);
		}

		if (data) {
			/* TODO Create a new GameInstance */
		} else {
			console.error('Game creation failed');
		}
	} catch (error) {
		console.error('Error:', error);
	}
}
