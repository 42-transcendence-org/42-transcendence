import { get_cookie } from './utils.js';

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

export async function changeUsername() {
	const url = 'https://localhost:8443/auth/username/';
	const formData = {
        username: document.getElementById('username_new').value,
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
		document.getElementById('username').textContent = responseData.username;
		document.getElementById('username_new').value = '';
	}
	catch (error) {
		console.error('Erreur lors de la récupération des données :', error);
	}

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


export async function changeNickname() {
	const url = 'https://localhost:8443/auth/nickname/';
	const formData = {
        first_name: document.getElementById('nickname_new').value,
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
		document.getElementById('nickname_display').textContent = responseData.first_name;
		document.getElementById('nickname_new').value = '';
	}
	catch (error) {
		console.error('Erreur lors de la récupération des données :', error);
	}

}

export async function getNickname() {

	return fetch('https://localhost:8443/auth/get_nickname/', {
		credentials: 'include',
	})
		.then(response => response.json())
		.then(data => {
			if (data.first_name){
				return data.first_name;
			}
			return data.error;
		})
		.catch(error => {
			console.error('Error checking authentication:', error);
			return null;
		});
}


export async function changePassword() {
	const url = 'https://localhost:8443/auth/password/';
	const formData = {
        password: document.getElementById('password_new').value,
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
		document.getElementById('password_new').value = '';
	}
	catch (error) {
		console.error('Erreur lors de la récupération des données :', error);
	}

}
