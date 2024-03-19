export async function changeEmail(event) {
	event.preventDefault()
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
				'X-CSRFToken': window.client.get_cookie("csrftoken"),
			},
			credentials: 'include',
			body: JSON.stringify(formData),
		});

		if (!response.ok) {
			throw new Error('La requête a échoué');
		}

		const responseData = await response.json();
		document.getElementById('email_display_profile').textContent = responseData.email;
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

export async function changeUsername(event) {
	event.preventDefault()
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
				'X-CSRFToken': window.client.get_cookie("csrftoken"),
			},
			credentials: 'include',
			body: JSON.stringify(formData),
		});

		if (!response.ok) {
			throw new Error('La requête a échoué');
		}

		const responseData = await response.json();
		document.getElementById('username_display_profile').textContent = responseData.username;
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


export async function changeNickname(event) {
	event.preventDefault()
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
				'X-CSRFToken': window.client.get_cookie("csrftoken"),
			},
			credentials: 'include',
			body: JSON.stringify(formData),
		});

		if (!response.ok) {
			throw new Error('La requête a échoué');
		}

		const responseData = await response.json();
		document.getElementById('nickname_display_profile').textContent = responseData.first_name;
		document.getElementById('nickname_display_banner').textContent = responseData.first_name;
		document.getElementById('nickname_new').value = '';
	}
	catch (error) {
		console.error('Erreur lors de la récupération des données :', error);
	}

}

export async function changePassword(event) { //FIXME: avoir deux champs password pour vérifier que le password est bien celui que l'user croit avoir tapé fin bref qu'il change pas son mdp a l'arrache on vérifie 2 champs
	event.preventDefault()
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
				'X-CSRFToken': window.client.get_cookie("csrftoken"),
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


export async function changeProfilePicture(event) {
	event.preventDefault()
	const url = 'https://localhost:8443/auth/update_profile_picture/';
	const formData = new FormData(document.getElementById('modify_profile_picture'));
	try {
		const response = await fetch(url, {
			method: 'POST',
			headers: {
				'Authorization': `Bearer ${localStorage.getItem("jwt")}`,
				'X-CSRFToken': window.client.get_cookie("csrftoken"),
			},
			credentials: 'include',
			body: formData,
		});

		if (!response.ok) {
			throw new Error('La requête a échoué');
		}

		const responseData = await response.json();

		document.getElementById('profile_picture_display').src = "auth/static/" + responseData.profile_picture;
		document.getElementById('profile-image').src = "auth/static/" + responseData.profile_picture;

		window.location.reload();
	}
	catch (error) {
		console.error(error);
	}

}
