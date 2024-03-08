import * as g from './pong/global.js';
import { session_create } from './pong/session.js';
import { get_cookie, div_handler, firstView } from './utils.js';

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
		console.error('Error:', error);
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
		'X-CSRFToken': localStorage.getItem('csrftoken'),
		},
        body: JSON.stringify(formData)
    })
    .then(data => data.json())
	.then(data => {
		if (data.token){
			localStorage.setItem('isLogged', true);
			localStorage.setItem('jwt', data.token);
			localStorage.setItem('username', data.username);
			firstView();
			document.getElementById('username_login').value = '';
			document.getElementById('password_login').value = '';
		} else {
			alert(data.Authentication);
		}
	})
	.catch(error => {
		console.error('Error:', error);
	});
}


export function register_user_request() {
	const formData = {
        username: document.getElementById('username_register').value,
        password1: document.getElementById('password1_register').value,
		password2: document.getElementById('password2_register').value,
    };
    return fetch('https://localhost:8443/auth/register/', {
        method: 'POST',
        headers: {
			'Content-Type': 'application/json',
			'X-CSRFToken': localStorage.getItem('csrftoken'),
		},
        body: JSON.stringify(formData)
    })
    .then(data => data.json())
	.then(data => {
		if (data.message){
			document.getElementById('username_register').value = '',
			document.getElementById('password1_register').value = '',
			document.getElementById('password2_register').value = '',
			div_handler("Registered");
		} else {
			if (data.username)
				alert(data.username);
			if (data.password2) {
				alert(data.password2);
			}
		}
	})
	.catch(error => {
		console.error('Error:', error);
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
		localStorage.setItem('isLogged', false);
		localStorage.removeItem('username');
		firstView();
    });
}