export function get_cookie(name) {
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

export function div_handler(div_to_show) {
	const all_divs = document.querySelectorAll('div');

	all_divs.forEach(div => {
		if (div.id === div_to_show) {
			div.style.display = 'block';
		} else if (div.id === 'loggedIn') {
			console.log("Check: ", localStorage.getItem('isLogged'));
			if (localStorage.getItem('isLogged') === 'true'){
				div.style.display = 'block';
			} else {
				div.style.display = 'none';
			}
		} else if (div.id === 'notLoggedIn') {
			console.log("Check2: ", localStorage.getItem('isLogged'));
			if (localStorage.getItem('isLogged') === 'false'){
				div.style.display = 'block';
			} else {
				div.style.display = 'none';
			}
		} else if (div.id === 'statusUser') {
			console.log("Check2: ", localStorage.getItem('isLogged'));
			if (localStorage.getItem('isLogged') === 'true'){
				div.style.display = 'block';
			} else {
				div.style.display = 'none';
			}
		} else {
			div.style.display = 'none';
		}
	});
}

export function firstView(){
	console.log('State User:', localStorage.getItem('isLogged'));
	isLoggedIn().then(isAuthenticated => {
		if (localStorage.getItem('isLogged') === 'true') {
			console.log('User is logged in');
			var username = localStorage.getItem('username'); 
			if (username) {
				var usernameElement = document.getElementById('username');
				usernameElement.textContent = username;
			}
			div_handler("game-menu-div");
		} else {
			console.log('User is not logged in');
			div_handler("");
		}
	});
}

function isLoggedIn() {
    return fetch('https://localhost:8443/auth/check-authentication/', {
        credentials: 'include'
    })
        .then(response => response.json())
        .then(data => {
			if (data.isAuthenticated){
                console.log('Authentication check', data.isAuthenticated);
				return true;
			}
			return false;
		})
		.catch(error => {
			console.error('Error checking authentication:', error);
			return false;
		});
}