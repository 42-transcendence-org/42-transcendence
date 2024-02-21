import { get_cookie, div_handler } from '../utils.js';

document.addEventListener('DOMContentLoaded', function() {
	const csrftoken = getCookie("csrftoken");
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
	const password = formData.get('password');
	console.log(localStorage.getItem('csrftoken'));
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
			console.log(data.token);
			localStorage.setItem('jwt', data.token);
			console.log('login successful');
			// fetch("../../../templates/home.html")
			// 	.then(response => response.text())
            //     .then(html => {
            //         document.getElementById('authFormContainer').innerHTML = html;
            //     });
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
			// fetch("../../../templates/register.html")
			// 	.then(response => response.text())
            //     .then(html => {
            //         document.getElementById('authFormContainer').innerHTML = html;
            //     });
		} else {
			console.error('Register failed')
		}
	})
	.catch(error => {
		console.error('Error:', error);
	});
}

function getCookie(name) {
    let cookieValue = null;
    if (document.cookie && document.cookie !== '') {
        const cookies = document.cookie.split(';');
        for (let i = 0; i < cookies.length; i++) {
            const cookie = cookies[i].trim();
            if (cookie.substring(0, name.length + 1) === (name + '=')) {
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                break;
            }
        }
    }
    return cookieValue;
}
