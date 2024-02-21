import * as g from './pong/global.js';
import * as requests from './requests.js';
import { session_create } from './pong/session.js';

/* FIXME Move load font somewhere else */
document.addEventListener('DOMContentLoaded', function () {
	// document.getElementById('ok-button').addEventListener('click', function () { requests.send_alias_request(); });
	document.getElementById('local-button').addEventListener('click', () => session_create(0, g.TYPE_LOCAL, "Player 1", "Player 2"));
	document.getElementById('remote-button').addEventListener('click', () => requests.send_game_creation_request());
	document.getElementById('ai-button').addEventListener('click', () => session_create(0, g.TYPE_AI, "Player 1", "Computer"));
	// requests.send_get_alias_request();
});
