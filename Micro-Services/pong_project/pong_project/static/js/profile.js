import { poster, getter } from './Oauth.js';

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

export async function fetchProfileData(div_to_show) {

	const data = await getUserData();

	if (data.error) {
		window.client.connection.logout_user_request();
		alert("You don't have a user profile associated to your account, you have been disconnected");
		return ;
	}

	document.getElementById('banner-nickname-display').innerText = data.nickname;
	document.getElementById('banner-profile-image-display').src = "auth/static/" + data.img;
	
	if (div_to_show === 'profile') {
		document.getElementById('profile-username-display').innerText = data.username;
		document.getElementById('profile-email-display').innerText = data.email;
		document.getElementById('profile-nickname-display').innerText = data.nickname;
		document.getElementById('profile-profile-picture-display').src = "auth/static/" + data.img;
	}
	else if (div_to_show === 'friends')
	{
		this.show_friendlist();
		this.showFriendRequests();
	}
	else if (div_to_show === 'friend-profile') {
		const friend_profile = history.state.friend_profile;
		document.getElementById('friend-profile-nickname-display').textContent = friend_profile.nickname;
		document.getElementById('friend-profile-profile-picture-display').src = "auth/static/" + friend_profile.img;
	}
}

export async function getUserData() {
	const url = 'https://localhost:8443/auth/getInfo/';
	return (await getter(url));
}


export async function changeEmail(event) {
	event.preventDefault()
	const url = 'https://localhost:8443/auth/email/';
	const data = {
        email: document.getElementById('email_new').value,
    };

	const response = await poster(url, data);
	document.getElementById('email_new').value = '';
	if (response.error) {
		alert(response.error);
		return ;
	}
	document.getElementById('profile-email-display').textContent = response.email;
}

export async function changeNickname(event) {
	event.preventDefault()
	const url = 'https://localhost:8443/auth/nickname/';
	const data = {
        first_name: document.getElementById('nickname_new').value,
    };
	const response = await poster(url, data);

	document.getElementById('nickname_new').value = '';
	if (response.error) {
		alert(response.error);
		return ;
	}
	document.getElementById('profile-nickname-display').textContent = response.first_name;
	document.getElementById('banner-nickname-display').textContent = response.first_name;
}

export async function changePassword(event) { //FIXME: avoir deux champs password pour vérifier que le password est bien celui que l'user croit avoir tapé fin bref qu'il change pas son mdp a l'arrache on vérifie 2 champs
	event.preventDefault()
	const url = 'https://localhost:8443/auth/password/';
	const data = {
        password: document.getElementById('password_new').value,
    };
	const response = await poster(url, data);

	document.getElementById('password_new').value = '';
	if (response.error) {
		alert(response.error);
		return ;
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

		document.getElementById('profile-profile-picture-display').src = "auth/static/" + responseData.profile_picture;
		document.getElementById('banner-profile-image-display').src = "auth/static/" + responseData.profile_picture;

		window.location.reload();
	}
	catch (error) {
		console.error(error);
	}

}

export async function addFriend(event) {
	event.preventDefault()
	const url = 'https://localhost:8443/auth/addFriend/';
	const data = {
		friend: document.getElementById('add-friend-input').value,
	};
	const response = await poster(url, data);
	document.getElementById('add-friend-input').value = "";
	if (response.error) {
		alert(response.error);
		return ;
	}
	alert(response.message);
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
		new_friend.textContent = 'Friend name: ' + response.friends[i] + ' online= ' + response.online_status[i];
		new_friend.name = response.friends[i];
		new_friend.addEventListener('click', (event) => showFriendProfile(event));
		list.appendChild(new_friend);

		var delete_button = document.createElement('button');
		delete_button.name = response.friends[i];
		delete_button.addEventListener('click', (event) => deleteFriend(event));
		delete_button.textContent = 'Delete';
		list.appendChild(delete_button);
	}
}

export async function showFriendProfile(event) {
	const friend_name = event.target.name;
	const url = 'https://localhost:8443/auth/getFriendInfo/';
	const data = {
		'friend': friend_name,
	};
	const response = await poster(url, data);
	if (response.error) {
		alert(response.error);
		return ;
	}

	document.getElementById('friend-profile-nickname-display').textContent = response.nickname;
	document.getElementById('friend-profile-profile-picture-display').src = "auth/static/" + response.img;
	localStorage.setItem('friend_profile', JSON.stringify(response));
	window.client.nextPage('friend-profile');
}
export async function deleteFriend(event) {
	const friend_name = event.target.name;
	const url = 'https://localhost:8443/auth/DeleteFriend/';

	const data = {
		'friend': friend_name,
	};
	const response = await poster(url, data);
	if (response.error) {
		alert(response.error);
		return ;
	}
	show_friendlist();
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
		refuse_button.name = response.friend_requests[i];
		refuse_button.addEventListener('click', (event) => refuseFriendRequest(event));
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



export async function refuseFriendRequest(event) {
    const friend_name = event.target.name;
    const url = 'https://localhost:8443/auth/RefuseFriendRequest/';
    const data = {
        friend: friend_name,
    };
    const response = await poster(url, data);
    if (response.error) {
        alert(response.error);
        return ;
    }
    document.getElementById('friend_request_from_' + friend_name).remove();
}
