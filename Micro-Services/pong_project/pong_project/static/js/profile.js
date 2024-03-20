export async function getUserData() {
	const url = 'https://localhost:8443/auth/getInfo/';
	try {
		const response = await fetch(url, {
			credentials: 'include',
		});
		const data = await response.json();
		if (data.error) {
			throw new Error(data.error);
		}
		return data;
	}
	catch (error) {
		console.error(error);
		return null;
	}
}


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

		const responseData = await response.json();
		
		if (responseData.error) {
			alert(responseData.error);
			throw new Error(responseData.error);
		}

		document.getElementById('profile-email-display').textContent = responseData.email;
		document.getElementById('email_new').value = '';
	}
	catch (error) {
		console.error('Erreur lors de la récupération des données :', error);
	}

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

		const responseData = await response.json();

		if (responseData.error) {
			alert(responseData.error);
			throw new Error(responseData.error);
		}

		document.getElementById('nickname_display_profile').textContent = responseData.first_name;
		document.getElementById('banner-nickname-display').textContent = responseData.first_name;
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

		const responseData = await response.json();

		if (responseData.error) {
			alert(responseData.error);
			throw new Error(responseData.error);
		}

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

		const responseData = await response.json();

		if (responseData.error) {
			alert(responseData.error);
			throw new Error(responseData.error);
		}

		document.getElementById('profile-profile_picture_display').src = "auth/static/" + responseData.profile_picture;
		document.getElementById('banner-profile-image-display').src = "auth/static/" + responseData.profile_picture;

		window.location.reload();
	}
	catch (error) {
		console.error(error);
	}

}

import { poster } from './Oauth.js';


export async function addFriend(event) {
	event.preventDefault()
	const url = 'https://localhost:8443/auth/addFriend/';
	const data = {
		friend: document.getElementById('add-friend-input').value,
	};
	console.log(data);
	const response = await poster(url, data);
	if (response === null) {
		return;
	}
	alert(response.message +  " and " + response.friend);
}