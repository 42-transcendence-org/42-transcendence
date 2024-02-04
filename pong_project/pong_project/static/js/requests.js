import * as game from './game.js';
import { get_cookie, div_handler } from './utils.js';

import { LEFT, NEUTRAL, RIGHT } from './game.js'

export async function send_alias_request() {
	try {
		const alias = document.getElementById('alias').value;

		const response = await fetch('http://localhost:8000/api/alias/', {
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



/* Game */
export async function send_user_input(player_id, player_input) {
	try {
		if (!game.g_current_game_data) return;

		const response = await fetch(`http://localhost:8000/api/games/${game.g_current_game_data.id}/update/`, {
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
