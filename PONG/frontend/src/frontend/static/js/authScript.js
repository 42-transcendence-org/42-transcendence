document.addEventListener('DOMContentLoaded', function() {
	const csrftoken = getCookie('csrftoken');
    const authFormContainer = document.getElementById('authFormContainer');
    const statusUser = document.getElementById('statusUser');
	console.log(csrftoken);



    authFormContainer.addEventListener('submit', function(event) {
		event.preventDefault(); // Prevent the default form submission
        if (event.target.id === 'registerForm') {
			sendRegisterForm(csrftoken);
        }

        if (event.target.id === 'loginForm') {
			sendLoginForm(csrftoken);
        }


    });
});

function sendLoginForm(csrftoken){

	const formData = new FormData(event.target); // Use the event target which is the form
	const username = formData.get('username');
	const password = formData.get('password');

	fetch('http://localhost:8002/login/', {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json',
			'X-CSRFToken': csrftoken,
		},
		body: JSON.stringify({ username, password }),
		credentials: 'include'
	})
	.then(response => response.text())
	.then(html => {
		if (html.includes('Indentifiant ou mot de passe incorrect.')){
			authFormContainer.innerHTML = html;
		}
		else {
			localStorage.setItem('csrftoken', csrftoken);
			statusUser.innerHTML = html;
			document.getElementById('statusUser').innerHTML = html;
			authFormContainer.innerHTML = ''
		}
	})
	.catch(error => {
		console.error('Error:', error);
	});
}

function sendRegisterForm(csrftoken){
	const formData = new FormData(event.target); // Use the event target which is the form
	const username = formData.get('username');
	// const email = formData.get('email');
	const password1 = formData.get('password1');
	const password2 = formData.get('password2');

	fetch('http://localhost:8002/register/', {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json',
			'X-CSRFToken': csrftoken,
		},
		body: JSON.stringify({ username, password1, password2 }),
		credentials: 'include'
	})
	.then(response => response.text())
	.then(html => {
		authFormContainer.innerHTML = html;
		document.getElementById('authFormContainer').innerHTML = html;
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
