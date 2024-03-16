import * as g from './pong/global.js';
import { session_create } from './pong/session.js';
import { get_cookie, nextPage, home } from './utils.js';

export async function send_user_input(input, time) {

	const token = localStorage.getItem("jwt");
	try {
		if (window.game_session === null || window.game_session.id === 0)
			return;

		const response = await fetch(`https://localhost:8443/game/${window.game_session.id}/`, {
			method: 'PUT',
			headers: {
				'Authorization': `Bearer ${token}`,
				'Content-Type': 'application/json',
				'X-CSRFToken': get_cookie("csrftoken"),
			},
			credentials: 'include',
			body: JSON.stringify([input, time]),
		});

		if (!response.ok) {
			throw new Error('Network response was not ok: ' + response.statusText);
		}
	} catch (error) {
		console.error('Error sending input:', error);
	}
}

export async function send_game_creation_request() {

	const token = localStorage.getItem("jwt");
	try {
		const response = await fetch('https://localhost:8443/game/', {
			method: 'POST',
			headers: {
				'Authorization': `Bearer ${token}`,
				'Content-Type': 'application/json',
				'X-CSRFToken': get_cookie("csrftoken"),
			},
			credentials: 'include',
		});

		const data = await response.json();

		if (!response.ok) {
			throw new Error(data.error);
		}

		if (data) {
			session_create(data.id, g.TYPE_REMOTE);
		} else {
			console.error('Game creation failed');
		}
	} catch (error) {
		console.error(error);
	}
}

export function login_user_request() {
	const formData = {
        username: document.getElementById('username_login').value,
        password: document.getElementById('password_login').value,
    };
    return fetch('https://localhost:8443/auth/login/', {
        method: 'POST',
        headers: {
		'Content-Type': 'application/json',
		'X-CSRFToken': get_cookie("csrftoken"),
		},
        body: JSON.stringify(formData)
    })
    .then(data => data.json())
	.then(data => {
		if (data.token){
			localStorage.setItem('jwt', data.token);
			document.getElementById('username_login').value = '';
			document.getElementById('password_login').value = '';
			home();
		} else {
			for (let key in data.error)
				alert(data.error[key]);
			throw new Error(data.error);
		}
	})
	.catch(error => {
		console.error(error);
	});
}


export function register_user_request() {
	const formData = {
        username: document.getElementById('username_register').value,
        password1: document.getElementById('password1_register').value,
		password2: document.getElementById('password2_register').value,
		password: document.getElementById('password1_register').value,
		email: document.getElementById('email_address_register').value,
		first_name: document.getElementById('first_name_register').value,
    };
    return fetch('https://localhost:8443/auth/register/', {
        method: 'POST',
        headers: {
			'Content-Type': 'application/json',
			'X-CSRFToken': get_cookie("csrftoken"),
		},
        body: JSON.stringify(formData)
    })
    .then(data => data.json())
	.then(data => {
		if (data.message){
			document.getElementById('username_register').value = '',
			document.getElementById('password1_register').value = '',
			document.getElementById('password2_register').value = '',
			document.getElementById('email_address_register').value = '',
			document.getElementById('first_name_register').value = '',
			nextPage("Registered");
		} else {
			alert(data.error);
			throw new Error(data.error);
		}
	})
	.catch(error => {
		console.error(error);
	})
}


export function logout_user_request() {
    fetch('https://localhost:8443/auth/logout/', {
        method: 'GET',
        headers: {
            'Authorization': `Bearer ${localStorage.getItem('jwt')}`,
			'X-CSRFToken': localStorage.getItem('csrftoken'),
		},
    })
    .then(() => {
        localStorage.removeItem('jwt'); 
		localStorage.setItem('isLogged', 'false');
		localStorage.removeItem('username');
		document.getElementById('username').innerText = 'username';
		document.getElementById('profile-image').src = '';
		document.getElementById('correction-points').innerText = 'UNDEFINED';
		home();
    });
}


export async function isLoggedIn() {
    return fetch('https://localhost:8443/auth/check-authentication/', {
        credentials: 'include',
    })
        .then(response => response.json())
        .then(data => {
			if (data.isAuthenticated){
				return 'true';
			}
			return 'false';
		})
		.catch(error => {
			console.error('Error checking authentication:', error);
			return 'false';
		});
}


export async function getEmail() {

	return fetch('https://localhost:8443/auth/email/', {
        credentials: 'include',
    })
        .then(response => response.json())
        .then(data => {
			if (data.email){
				return data.email;
			}
			return data.error;
		})
		.catch(error => {
			console.error('Error checking authentication:', error);
			alert(error + " at getEmail");
			return null;
		});
}

export async function getUsername() {

	return fetch('https://localhost:8443/auth/get_username/', {
        credentials: 'include',
    })
        .then(response => response.json())
        .then(data => {
			if (data.username){
				return data.username;
			}
			return data.error;
		})
		.catch(error => {
			console.error('Error checking authentication:', error);
			return null;
		});
}


export async function changeEmail() {
	const url = 'https://localhost:8443/auth/email/';
	const formData = {
        email: document.getElementById('email_new').value,
    };
	try {
		const response = await fetch(url, {
			method: 'POST',
			headers: {
				'Authorization': `Bearer ${localStorage.getItem("jwt")}`,
				'Content-Type': 'application/json',
				'X-CSRFToken': get_cookie("csrftoken"),
			},
			credentials: 'include',
			body: JSON.stringify(formData),
		});

		if (!response.ok) {
			throw new Error('La requête a échoué');
		}

		const responseData = await response.json();
		document.getElementById('email_display').textContent = responseData.email;
		document.getElementById('email_new').value = '';
	}
	catch (error) {
		console.error('Erreur lors de la récupération des données :', error);
	}

}