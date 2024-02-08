import * as requests from './requests.js';
import { create_game } from './utils.js';
import { g.TYPE_AI, g.TYPE_LOCAL } from './pong/state.js';

/* FIXME Move load font somewhere else */
document.addEventListener('DOMContentLoaded', function () {
	document.getElementById('ok-button').addEventListener('click', function () { requests.send_alias_request(); });
	document.getElementById('local-button').addEventListener('click', () => create_game(g.TYPE_LOCAL));
	document.getElementById('remote-button').addEventListener('click', () => requests.send_game_creation_request());
	document.getElementById('ai-button').addEventListener('click', () => create_game(g.TYPE_AI));

	requests.send_get_alias_request();
});
