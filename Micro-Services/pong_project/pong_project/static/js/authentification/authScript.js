import { get_cookie, div_handler } from '../utils.js';

document.addEventListener('DOMContentLoaded', function() {
	console.log('hey heyheyh')
	const csrftoken = get_cookie("csrftoken");
	localStorage.setItem('csrftoken', csrftoken);
    const authFormContainer = document.getElementById('authFormContainer');
    const statusUser = document.getElementById('statusUser');
	console.log(csrftoken);



    authFormContainer.addEventListener('submit', function(event) {
		event.preventDefault(); // Prevent the default form submission
        if (event.target.id === 'registerForm') {
			sendRegisterForm();
        }

        if (event.target.id === 'loginForm') {
			sendLoginForm();
        }


    });
});

function sendLoginForm(){

	const formData = new FormData(event.target); // Use the event target which is the form
	const username = formData.get('username');
	localStorage.setItem('username', username);
	const password = formData.get('password');
	fetch('https://localhost:8443/auth/login/', {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json',
			'X-CSRFToken': localStorage.getItem('csrftoken'),
		},
		body: JSON.stringify({ username, password }),
		credentials: 'include'
	})
	.then(response => response.json())
	.then(data => {
		if (data.token) {
			localStorage.setItem('isLogged', true);
			localStorage.setItem('jwt', data.token);
			console.log('hi there!!!!');
			statusUser.innerHTML = `
            <p>Welcome hahahaaa, ${username}!</p>
            <button type="button" id="logout">Logout</button>
        	`;
			authFormContainer.innerHTML = '';
		} else {
			console.error('Login failed')
		}
	})
	.catch(error => {
		console.error('Error:', error);
	});
}

function sendRegisterForm(){
	const formData = new FormData(event.target); // Use the event target which is the form
	const username = formData.get('username');
	const password1 = formData.get('password1');
	const password2 = formData.get('password2');

	fetch('https://localhost:8443/auth/register/', {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json',
			'X-CSRFToken': localStorage.getItem('csrftoken'),
		},
		body: JSON.stringify({ username, password1, password2 }),
		credentials: 'include'
	})
	.then(response => response.json())
	.then(data => {
		if (data.register) {
			console.log(data.register);
			console.log('Register successful');
			userStatusDiv.innerHTML = `
            <p>Your account has been succesfully created. You can now login.</p>
			`;
			authFormContainer.innerHTML = '';
		} else {
			console.error('Register failed')
		}
	})
	.catch(error => {
		console.error('Error:', error);
	});
}