import * as requests from './requests.js';
import { load_font } from './pong/graphics.js';
import { create_game } from './utils.js';
import { TYPE_AI, TYPE_LOCAL } from './pong/state.js';

/* FIXME Move load font somewhere else */
document.addEventListener('DOMContentLoaded', function () {
	document.getElementById('ok-button').addEventListener('click', function () { requests.send_alias_request(); });
	document.getElementById('local-button').addEventListener('click', () => create_game(TYPE_LOCAL));
	document.getElementById('remote-button').addEventListener('click', () => requests.send_game_creation_request('remote'));
	document.getElementById('ai-button').addEventListener('click', () => create_game(TYPE_AI));

	load_font();

	requests.send_get_alias_request();
});
