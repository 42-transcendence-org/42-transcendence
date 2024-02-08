import * as g from './pong/global.js';
import * as requests from './requests.js';
import { create_session } from './pong/main.js';

/* FIXME Move load font somewhere else */
document.addEventListener('DOMContentLoaded', function () {
	document.getElementById('ok-button').addEventListener('click', function () { requests.send_alias_request(); });
	document.getElementById('local-button').addEventListener('click', () => create_session(g.TYPE_LOCAL));
	document.getElementById('remote-button').addEventListener('click', () => requests.send_game_creation_request());
	document.getElementById('ai-button').addEventListener('click', () => create_session(g.TYPE_AI));

	requests.send_get_alias_request();
});
