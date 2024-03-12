import * as g from './pong/global.js';
import * as requests from './requests.js';
import { session_create } from './pong/session.js';
import { div_handler } from './utils.js';
import { firstView } from './utils.js';
import { gestionnairePopState } from './utils.js';
import { debug_mute_music, mute_sounds } from './pong/sound.js';
import { divDisplay, getDivId, home} from './utils.js';
// import { refreshFunction } from './utils.js';

/* FIXME Move load font somewhere else */

document.addEventListener('DOMContentLoaded', function () {
	
	if (history.length > 1 && history.state != null) { //to handle: use of back button until previous page is reached, then use of forward
		(history.state.username !== null ) ? document.getElementById('username').textContent = history.state.username : null;
		divDisplay(getDivId(history.state.id));
	}
	else {
		firstView();
	}
	debug_mute_music();
	document.getElementById('login-button').addEventListener('click', function(event) {div_handler("Login");});
	document.getElementById('register-button').addEventListener('click', function(event) {div_handler("Register");});
	document.getElementById('local-button').addEventListener('click', function(){ session_create(0, g.TYPE_LOCAL, "Player 1", "Player 2"); });
	document.getElementById('remote-button').addEventListener('click', () => requests.send_game_creation_request());
	document.getElementById('ai-button').addEventListener('click', () => session_create(0, g.TYPE_AI, "Player 1", "Computer"));
	document.getElementById('loginForm').addEventListener('submit', function(event) {event.preventDefault();requests.login_user_request();});
	document.getElementById('registerForm').addEventListener('submit', function(event) {event.preventDefault();requests.register_user_request();});
	document.getElementById('logout-button').addEventListener('click', function(event) {event.preventDefault();requests.logout_user_request();});
	document.getElementById('home-button').addEventListener('click', function(event) {event.preventDefault();div_handler("logged-in-home");});
	document.getElementById('test-button').addEventListener('click', function(event) {event.preventDefault();div_handler("test");});
	document.getElementById('sound-button').addEventListener('click', function(event) {event.preventDefault(); mute_sounds();});
	window.addEventListener('popstate', gestionnairePopState);
	// window.addEventListener('beforeunload', refreshFunction);
	document.getElementById('home-banner').addEventListener('click', function(event) {event.preventDefault(); home();});
});
