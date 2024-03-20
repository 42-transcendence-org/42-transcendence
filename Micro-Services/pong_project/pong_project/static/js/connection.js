import * as Oauth from './Oauth.js';

export class Connection {

	constructor() {
	}

	eventlisteners() {
		document.getElementById('login-button').addEventListener('click', () => window.client.nextPage("Login"));
		document.getElementById('register-button').addEventListener('click', () => window.client.nextPage("Register"));
		document.getElementById('loginForm').addEventListener('submit', (event) => this.login_user_request(event));
		document.getElementById('registerForm').addEventListener('submit', (event) => this.register_user_request(event));
		document.getElementById('logout-button').addEventListener('click', (event) => this.logout_user_request(event));
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
				window.client.home();
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
				window.client.nextPage("Registered");
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
		const url = 'https://localhost:8443/auth/logout/'
		const response = await Oauth.getter(url);
		/* FIXME: Check return code */
		localStorage.removeItem('jwt');
		localStorage.removeItem('username');
		window.client.home();
	}

	async isLoggedIn() {
		const url = 'https://localhost:8443/auth/check-authentication/';
		const response = await Oauth.getter(url);
		if (response.error) {
			return 'false';
		}
		return 'true';
	}
}