import * as g from './pong/global.js';
import * as requests from './requests.js';
import { session_create } from './pong/session.js';
import { div_handler } from './utils.js';
import { firstView } from './utils.js';

/* FIXME Move load font somewhere else */
let formLoginDisplay = false
let formRegisterDisplay = false
document.addEventListener('DOMContentLoaded', function () {
	firstView();
	document.getElementById('login-button').addEventListener('click', function(event) {if (!formLoginDisplay) {div_handler("Login"); formLoginDisplay = true; formRegisterDisplay = false;} else {div_handler(""); formLoginDisplay = false;}});
	document.getElementById('register-button').addEventListener('click', function(event) {if (!formRegisterDisplay) {div_handler("Register"); formRegisterDisplay = true; formLoginDisplay = false;} else {div_handler(""); formRegisterDisplay = false;}});
	document.getElementById('local-button').addEventListener('click', () => session_create(0, g.TYPE_LOCAL, "Player 1", "Player 2"));
	document.getElementById('remote-button').addEventListener('click', () => requests.send_game_creation_request());
	document.getElementById('ai-button').addEventListener('click', () => session_create(0, g.TYPE_AI, "Player 1", "Computer"));
	document.getElementById('loginForm').addEventListener('submit', function(event) {event.preventDefault();requests.login_user_request();});
	document.getElementById('registerForm').addEventListener('submit', function(event) {event.preventDefault();requests.register_user_request();});
	document.getElementById('logout-button').addEventListener('click', function(event) {event.preventDefault();requests.logout_user_request();});

});
