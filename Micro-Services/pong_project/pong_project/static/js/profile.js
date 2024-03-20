export async function eventlisteners() {
		//Profile
	document.getElementById('myprofile-button').addEventListener('click', () => window.client.nextPage("profile"));
	document.getElementById('modify_email').addEventListener('submit', (event) => changeEmail(event));
	document.getElementById('modify_nickname').addEventListener('submit', (event) => changeNickname(event));
	document.getElementById('modify_password').addEventListener('submit', (event) => changePassword(event));
	document.getElementById('modify_profile_picture').addEventListener('submit', (event) => changeProfilePicture(event));
	//friends
	document.getElementById('friends-button').addEventListener('click', (event) => window.client.nextPage("friends"));
	document.getElementById('add-friend-form').addEventListener('submit', (event) => addFriend(event));
		
}

export async function fetchProfileData(isLogged, div_to_show) {

	if (isLogged === 'true' ) { //to show every time the user is logged in

		const data = await getUserData();

		if (data.error) {
			return ;
		}

		document.getElementById('banner-nickname-display').innerText = data.nickname;
		document.getElementById('banner-profile-image-display').src = "auth/static/" + data.img;
		
		if (div_to_show === 'profile') {
			document.getElementById('profile-username-display').innerText = data.username;
			document.getElementById('profile-email-display').innerText = data.email;
			document.getElementById('profile-nickname-display').innerText = data.nickname;
			document.getElementById('profile-profile_picture_display').src = "auth/static/" + data.img;
		}
		else if (div_to_show === 'friends')
		{
			this.show_friendlist();
			this.showFriendRequests();
		}
	}

}

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
		return {'error': error};
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

		document.getElementById('profile-nickname-display').textContent = responseData.first_name;
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

import { poster, getter } from './Oauth.js';


export async function addFriend(event) {
	event.preventDefault()
	const url = 'https://localhost:8443/auth/addFriend/';
	const data = {
		friend: document.getElementById('add-friend-input').value,
	};
	await poster(url, data);
	document.getElementById('add-friend-input').value = "";
}

export async function show_friendlist() {
	
	var list = document.getElementById('friends-list');
	list.innerHTML = '';

	const url = 'https://localhost:8443/auth/getMyFriends/';
	const response = await getter(url);
	if (response.error) {
		list.textContent = "You have no friends yet !";
		return ;
	}

	var length = response.friends.length;
	for (var i = 0; i < length; i++) {
		var new_friend = document.createElement('button');
		new_friend.textContent = 'Friend name: ' + response.friends[i] + ' online= ' + response.online_status[i]; ;
		list.appendChild(new_friend);
	}
}

export async function showFriendRequests(event) {
	var list = document.getElementById('friends-requests');
	list.innerHTML = '';

	const url = 'https://localhost:8443/auth/FriendRequests/';
	const response = await getter(url);
	if (response.error) {
		list.textContent = "You have no pending friend requests !";
		return ;
	}

	var length = response.friend_requests.length;
	for (var i = 0; i < length; i++) {
		var new_friend = document.createElement('div');
		new_friend.textContent = 'Friend request from: ' + response.friend_requests[i];
		new_friend.id = "friend_request_from_" + response.friend_requests[i];

		var accept_button = document.createElement('button');
		accept_button.textContent = 'Accept';
		accept_button.name = response.friend_requests[i];
		accept_button.addEventListener('click', (event) => acceptFriendRequest(event));
		new_friend.appendChild(accept_button);

		var refuse_button = document.createElement('button');
		refuse_button.textContent = 'Refuse';
		accept_button.addEventListener('click', () => refuseFriendRequest(response.friend_requests[i]));
		new_friend.appendChild(refuse_button);

		// new_friend.addEventListener('click', (event) => acceptFriendRequest(event));
		list.appendChild(new_friend);
	}
}

export async function acceptFriendRequest(event) {
	const url = 'https://localhost:8443/auth/FriendRequests/';
	const friend_name = event.target.name;

	const data = {
		'friend': friend_name,
	};
	const response = await poster(url, data);
	if (response.error) {
		alert(response.error);
		return ;
	}
	document.getElementById('friend_request_from_' + friend_name).remove();
	show_friendlist();
}

export async function refuseFriendRequest(friend_name) {
	const url = 'https://localhost:8443/auth/acceptFriendRequest/';
	const data = {
		friend: friend_name
	};
	await poster(url, data);
}