import * as g from './pong/global.js';
import * as profile from './profile.js';
import * as Oauth from './Oauth.js';
import * as game_manager from './pong/game_manager.js';
import * as sound from './pong/sound.js';

export class Client {

	constructor() {
		this.previous_div = null;
		this.loggedDiv = document.getElementById('isLogged');
		this.notLoggedDiv = document.getElementById('isNotLogged');
		this.logginBanner = document.getElementById('login-banner');
		this.loggedIn = false;
		this.formLoginDisplay = false;
		this.formRegisterDisplay = false;
		this.game_manager = new game_manager.GameManager();
	}

	async init() {
		// this.firstView();
		// document.getElementById('login-button').addEventListener('click', () => this.displayFormLogin());
		// document.getElementById('register-button').addEventListener('click', () => this.displayFormRegister());
		document.addEventListener('keydown', (event) => this.game_manager.input.key_handler(event));
		document.addEventListener('keyup', (event) => this.game_manager.input.key_handler(event));

		document.getElementById('local-button').addEventListener('click', () => this.game_manager.game_create(g.TYPE_LOCAL));
		document.getElementById('remote-button').addEventListener('click', () => this.game_manager.game_create(g.TYPE_REMOTE));
		document.getElementById('ai-button').addEventListener('click', () => this.game_manager.game_create(g.TYPE_AI));

		// document.getElementById('loginForm').addEventListener('submit', (event) => this.login_user_request(event));
		// document.getElementById('registerForm').addEventListener('submit', (event) => this.register_user_request(event));
		// document.getElementById('logout-button').addEventListener('click', (event) => this.logout_user_request(event));

		document.getElementById('login-button').addEventListener('click', () => this.nextPage("Login"));
		document.getElementById('register-button').addEventListener('click', () => this.nextPage("Register"));
		document.getElementById('loginForm').addEventListener('submit', (event) => this.login_user_request(event));
		document.getElementById('registerForm').addEventListener('submit', (event) => this.register_user_request(event));
		document.getElementById('logout-button').addEventListener('click', (event) => this.logout_user_request(event));

		document.getElementById('myprofile-button').addEventListener('click', () => this.nextPage("profile"));
		document.getElementById('modify_email').addEventListener('submit', (event) => profile.changeEmail(event));
				document.getElementById('modify_nickname').addEventListener('submit', (event) => profile.changeNickname(event));
		document.getElementById('modify_password').addEventListener('submit', (event) => profile.changePassword(event));
		document.getElementById('modify_profile_picture').addEventListener('submit', (event) => profile.changeProfilePicture(event));
		
		// if (localStorage.getItem("OAuth42Token") !== true) { //At the beginning of a session, requests the 42 OAuth token of our app. Necessary ? Idk, maybe just put it in env?
		// 	localStorage.setItem("OAuth42Token", Oauth.getApp42Token());
		// }
		if (await Oauth.isRedirectedFrom42API() === true) { // redirection from 42 API when trying to connect via 42: OAUTH PART
			document.getElementById('loading').textContent = "Redirecting through 42";
			Oauth.login42(localStorage.getItem("code"));
		} else if (history.length > 1 && history.state != null) { //reload of the page: SPA PART
			this.divDisplay(history.state.id);
		} else { //first load of the page
			this.home();		
		}
		sound.mute_music();
		document.getElementById('home-button').addEventListener('click', (event) => this.nextPage("logged-in-home"));
		document.getElementById('test-button').addEventListener('click', (event) => this.nextPage("test"));
		document.getElementById('sound-button').addEventListener('click', function(event) {event.preventDefault(); sound.mute_sounds();});
		document.getElementById('42-login-button').addEventListener('click', (event) => Oauth.RedirectTo42Login());
		document.getElementById('home-banner').addEventListener('click', (event) =>  this.home());
		window.addEventListener('popstate', await this.HistoryButtonsClicked()); //for back and forward keys
		
		document.getElementById('chatbot-button').addEventListener('click', (event) => this.nextPage("chatbot"));
document.getElementById('friends-button').addEventListener('click', (event) => this.nextPage("friends"));
		document.getElementById('OPENai').addEventListener('submit', (event) =>  Oauth.chatgpt());
		document.getElementById('add-friend-form').addEventListener('submit', (event) => profile.addFriend(event));
		
		//tournament
		// document.getElementById('tournament-button').addEventListener('click', function(event) {event.preventDefault();nextPage("tournament");});
		// document.getElementById('new-tournament').addEventListener('submit', function(event) {event.preventDefault();requests.tournament();});
		
	}

	/* FIXME: Could be probably be replaced by var csrf = document.querySelector('meta[name="csrf-token"]').content; */
	get_cookie(name) {
		let cookie_value = null;
		if (document.cookie && document.cookie !== '') {
			const cookies = document.cookie.split(';');
			for (let i = 0; i < cookies.length; i++) {
				const cookie = cookies[i].trim();
				if (cookie.substring(0, name.length + 1) === (name + '=')) {
					cookie_value = decodeURIComponent(cookie.substring(name.length + 1));
					break;
				}
			}
		}
		return cookie_value;
	}

	async home() {

		let logged = await this.isLoggedIn();
	
		if (logged === 'true') {
			this.nextPage("logged-in-home");
		} else {
			this.nextPage("not-logged-home");
		}
	}

	async HistoryButtonsClicked() {

		if (history.state === null) {
			return ;
		}
		await this.divDisplay(history.state.id);
	}
	
	async nextPage(div_to_show) {
		await this.divDisplay(div_to_show); // affiche la div à afficher
		this.addToHistory(); //ajoute à l'historique
	}
	
	async divDisplay(div_to_show) {
	
		localStorage.setItem('isLogged', await this.isLoggedIn());
		if (localStorage.getItem('isLogged') === 'true' ) { //to show every time the user is logged in
			const data = await profile.getUserData();
			if (data && !data.error) {
				document.getElementById('profile-username-display').innerText = data.username;
				document.getElementById('profile-email-display').innerText = data.email;
				document.getElementById('profile-nickname-display').innerText = data.nickname;
				document.getElementById('banner-nickname-display').innerText = data.nickname;
				document.getElementById('banner-profile-image-display').src = "auth/static/" + data.img;
				document.getElementById('profile-profile_picture_display').src = "auth/static/" + data.img;
			}
		}
	
		this.display_loggedDivs_or_notLoggedDivs();
	
		if (this.thisDivCanBeShown(div_to_show) === false) {
			div_to_show = 'unauthorized';
			document.getElementById('unauthorized').querySelector('p').textContent = 'Unauthorized: ' + (localStorage.getItem('isLogged') === 'true' ? 'you are already logged in.' : 'you need to be logged in to see this page.');
		}
	
		if (this.previous_div) //hides previous div
			this.previous_div.style.display = 'none';
		let div = document.getElementById(div_to_show);
		document.getElementById('loading').style.display = 'none';
		div.style.display = 'block'; //show new div
		this.previous_div = div; //enregistre la div actuelle pour pouvoir la cacher plus tard in english is better mais comment on dit enregistre jsplu trou de mémoire
	
	}
	
	addToHistory() {
	
		let div = this.previous_div;
		if (div === null) {
			return ;
		}
		if (history.state !== null) {
			history.pushState({id: div.id}, '', '');
		}
		else { //for first load, console warning if not replacing bc only 1 state or smth
			history.replaceState({id: div.id}, '', '');
		}
	}
	
	display_loggedDivs_or_notLoggedDivs() {
		
		let isLogged = localStorage.getItem('isLogged');
		
		if (isLogged === 'true') {
			this.loggedDiv.style.display = 'block';
			this.logginBanner.style.display = 'block';
			this.notLoggedDiv.style.display = 'none';
		} else {
			this.loggedDiv.style.display = 'none';
			this.logginBanner.style.display = 'none';
			this.notLoggedDiv.style.display = 'block';
		}
	}
	
	thisDivCanBeShown(div_to_show) {
	
		let childDivs = null;
		if (localStorage.getItem('isLogged') === 'true') {
			childDivs = this.loggedDiv.querySelectorAll('div');
		} else {
			childDivs = this.notLoggedDiv.querySelectorAll('div');
		}
		let canBeShown = false;
		childDivs.forEach(childDiv => {
			if (childDiv.id === div_to_show) {
				canBeShown = true;
			}
		});
		return canBeShown;
	}

	async isLoggedIn() {
		const response = await fetch('https://localhost:8443/auth/check-authentication/', {
			method: 'GET',
			headers: {
				'X-CSRFToken': window.client.get_cookie('csrftoken'),
			},
			credentials: 'include'
		});
		const data = await response.json();
		if (data.isAuthenticated){
			return('true');
		}
		return 'false';
	}

	async login_user_request(event) {
		event.preventDefault()
		const formData = {
			username: document.getElementById('username_login').value,
			password: document.getElementById('password_login').value,
		};
		try {
			const response = await fetch('https://localhost:8443/auth/login/', {
				method: 'POST',
				headers: {
					'Content-Type': 'application/json',
					// 'X-CSRFToken': window.client.get_cookie('csrftoken'),
				},
				body: JSON.stringify(formData)
			});
			const data = await response.json();
			if (data.token) {
				localStorage.setItem('jwt', data.token);
				document.getElementById('username_login').value = '';
				document.getElementById('password_login').value = '';
				this.home();
				document.getElementById('username_login').value = '';
				document.getElementById('password_login').value = '';
			} else {
				alert(data.error);
				throw new Error(data.error);
			}
		} catch (error) {
			console.error(error);
		}
	}


	async register_user_request(event) {
		event.preventDefault()
		const formData = {
			username: document.getElementById('username_register').value,
			password1: document.getElementById('password1_register').value,
			password2: document.getElementById('password2_register').value,
			password: document.getElementById('password1_register').value,
			email: document.getElementById('email_address_register').value,
			first_name: document.getElementById('first_name_register').value,
		};
		try {
			const response = await fetch('https://localhost:8443/auth/register/', {
				method: 'POST',
				headers: {
					'Content-Type': 'application/json',
					'X-CSRFToken': window.client.get_cookie('csrftoken'),
				},
				body: JSON.stringify(formData)
			});
			const data = await response.json();
			if (data.message) {
				document.getElementById('username_register').value = '',
				document.getElementById('password1_register').value = '',
				document.getElementById('password2_register').value = '',
				document.getElementById('email_address_register').value = '',
				document.getElementById('first_name_register').value = '',
				this.nextPage("Registered");
			} else {
				alert(data.error);
				throw new Error(data.error);
			}
		} catch (error) {
			console.error(error);		
		}

	}

	async logout_user_request(event) {
		event.preventDefault()
		const response = await fetch('https://localhost:8443/auth/logout/', {
			method: 'GET',
			headers: {
				'Authorization': `Bearer ${localStorage.getItem('jwt')}`,
				'X-CSRFToken': window.client.get_cookie('csrftoken'),
			},
		});
		/* FIXME: Check return code */
		localStorage.removeItem('jwt');
		this.loggedIn = false;
		localStorage.removeItem('username');
		this.home();
	}
}
