import * as g from './pong/global.js';
import * as game_manager from './pong/game_manager.js';

export class Client {
	constructor() {
		this.loggedIn = false;
		this.formLoginDisplay = false;
		this.formRegisterDisplay = false;
		this.game_manager = new game_manager.GameManager();
	}

	init() {
		this.firstView();
		document.getElementById('login-button').addEventListener('click', () => this.displayFormLogin());
		document.getElementById('register-button').addEventListener('click', () => this.displayFormRegister());
		document.addEventListener('keydown', (event) => this.game_manager.input.key_handler(event));
		document.addEventListener('keyup', (event) => this.game_manager.input.key_handler(event));

		document.getElementById('local-button').addEventListener('click', () => this.game_manager.game_create(g.TYPE_LOCAL));
		document.getElementById('remote-button').addEventListener('click', () => this.game_manager.game_create(g.TYPE_REMOTE));
		document.getElementById('ai-button').addEventListener('click', () => this.game_manager.game_create(g.TYPE_AI));

		document.getElementById('loginForm').addEventListener('submit', (event) => this.login_user_request(event));
		document.getElementById('registerForm').addEventListener('submit', (event) => this.register_user_request(event));
		document.getElementById('logout-button').addEventListener('click', (event) => this.logout_user_request(event));
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

	displayFormLogin() {
		if (!this.formLoginDisplay) {
			this.show_div("Login");
			this.formLoginDisplay = true;
			this.formRegisterDisplay = false;
		} else {
			this.show_div("");
			this.formLoginDisplay = false;
		}
	}

	displayFormRegister() {
		if (!this.formRegisterDisplay) {
			this.show_div("Register");
			this.formRegisterDisplay = true;
			this.formLoginDisplay = false;
		} else {
			this.show_div("");
			this.formRegisterDisplay = false;
		}
	}


	show_div(div_to_show) {
		const all_divs = document.querySelectorAll('div');

		all_divs.forEach(div => {
			if (div.id === div_to_show) {
				div.style.display = 'block';
			} else if (div.id === 'loggedIn' && div_to_show != 'game-div') {
				if (this.loggedIn == true) {
					div.style.display = 'block';
				} else {
					div.style.display = 'none';
				}
			} else if (div.id === 'notLoggedIn' && div_to_show != 'game-div') {
				if (this.loggedIn == false) {
					div.style.display = 'block';
				} else {
					div.style.display = 'none';
				}
			} else {
				div.style.display = 'none';
			}
		});
	}

	async firstView() {
		const response = await fetch('https://localhost:8443/auth/check-authentication/', {
			method: 'GET',
			headers: {
				'X-CSRFToken': window.client.get_cookie('csrftoken'),
			},
			credentials: 'include'
		});
		const data = await response.json();
		this.loggedIn = data.isAuthenticated;
		if (this.loggedIn == true) {
			var username = localStorage.getItem('username');
			if (username) {
				var usernameElement = document.getElementById('username');
				usernameElement.textContent = username;
			}
			this.show_div("game-menu-div");
		} else {
			this.show_div("");
		}

	}

	async login_user_request(event) {
		event.preventDefault()
		const formData = {
			username: document.getElementById('username_login').value,
			password: document.getElementById('password_login').value,
		};

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
			localStorage.setItem('username', data.username);
			this.firstView();
			document.getElementById('username_login').value = '';
			document.getElementById('password_login').value = '';
		} else {
			alert(data.Authentication);
		}
	}


	async register_user_request(event) {
		event.preventDefault()
		const formData = {
			username: document.getElementById('username_register').value,
			password1: document.getElementById('password1_register').value,
			password2: document.getElementById('password2_register').value,
		};
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
				this.show_div("Registered");
		} else {
			if (data.username)
				alert(data.username);
			if (data.password2) {
				alert(data.password2);
			}
		}

	}

	async logout_user_request(event) {
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
		this.firstView();
	}
}
