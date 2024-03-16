
import * as g from './pong/global.js';
import * as requests from './requests.js';
import { session_create } from './pong/session.js';
import { nextPage } from './utils.js';
import { gestionnairePopState } from './utils.js';
import { debug_mute_music, mute_sounds } from './pong/sound.js';
import { divDisplay, getDivId, home} from './utils.js';
import * as Oauth from './Oauth.js';
import * as profile from './profile.js';
// import { refreshFunction } from './utils.js';

/* FIXME Move load font somewhere else */
document.getElementById('loading').textContent = "Loading...";
document.getElementById('loading').style.display = 'block';

document.addEventListener('DOMContentLoaded', async function () {

	document.getElementById('login-button').addEventListener('click', function() {nextPage("Login");});
	document.getElementById('register-button').addEventListener('click', function() {nextPage("Register");});
	document.getElementById('local-button').addEventListener('click', function(){ session_create(0, g.TYPE_LOCAL, "Player 1", "Player 2"); });
	document.getElementById('remote-button').addEventListener('click', function(){ requests.send_game_creation_request()});
	document.getElementById('ai-button').addEventListener('click', function(){ session_create(0, g.TYPE_AI, "Player 1", "Computer")});
	document.getElementById('loginForm').addEventListener('submit', function(event) {event.preventDefault();requests.login_user_request();});
	document.getElementById('registerForm').addEventListener('submit', function(event) {event.preventDefault();requests.register_user_request();});
	document.getElementById('logout-button').addEventListener('click', function(event) {event.preventDefault();requests.logout_user_request();});
	
	
	if (localStorage.getItem("OAuth42Token") !== true) { //At the beginning of a session, requests the 42 OAuth token of our app. Necessary ? Idk, maybe just put it in env?
		localStorage.setItem("OAuth42Token", Oauth.getApp42Token());
	}
	if (await Oauth.isRedirectedFrom42API() === true) { // redirection from 42 API when trying to connect via 42: OAUTH PART
		document.getElementById('loading').textContent = "Redirecting through 42";
		Oauth.login42(localStorage.getItem("code"));
	} else if (history.length > 1 && history.state != null) { //reload of the page: SPA PART
		divDisplay(getDivId(history.state.id));
	} else { //first load of the page
		home();		
	}
	debug_mute_music();
	document.getElementById('home-button').addEventListener('click', function(event) {event.preventDefault();nextPage("logged-in-home");});
	document.getElementById('test-button').addEventListener('click', function(event) {event.preventDefault();nextPage("test");});
	document.getElementById('sound-button').addEventListener('click', function(event) {event.preventDefault(); mute_sounds();});
	document.getElementById('42-login-button').addEventListener('click', function(event) {event.preventDefault();Oauth.RedirectTo42Login();});
	document.getElementById('home-banner').addEventListener('click', function(event) {event.preventDefault(); home();});
	window.addEventListener('popstate', gestionnairePopState); //for back and forward keys
	// document.getElementById('OPENai').addEventListener('submit', function(event) {event.preventDefault(); Oauth.chatgpt();});


	document.getElementById('modify_email').addEventListener('submit', function(event) {event.preventDefault();profile.changeEmail();});
	document.getElementById('modify_username').addEventListener('submit', function(event) {event.preventDefault();profile.changeUsername();});
	document.getElementById('modify_nickname').addEventListener('submit', function(event) {event.preventDefault();profile.changeNickname();});
	document.getElementById('modify_password').addEventListener('submit', function(event) {event.preventDefault();profile.changePassword();});
	document.getElementById('myprofile-button').addEventListener('click', function(event) {event.preventDefault();nextPage("profile");});


});