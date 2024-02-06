import * as requests from './requests.js';

import { load_font } from './pong/graphics.js';

function add_all_listeners() {
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
