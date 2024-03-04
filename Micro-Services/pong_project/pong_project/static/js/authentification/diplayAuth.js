// import { get_cookie, div_handler } from '../utils.js';

// let isLoggedIn = localStorage.getItem('isLogged');
// let isFormVisible = false;
// let isRegisterForm = false;
// let isLoginForm = false;
// document.addEventListener('DOMContentLoaded', function() {
// 	const csrftoken = localStorage.getItem('csrftoken');

//     firstView();
// 	statusUser.addEventListener('click', function() {
// 		const targetId = event.target.id;
// 		viewToDisplay(targetId);
// 	});

// });

// function firstView(){
// 	if (isLoggedIn) {
// 		console.log('User is logged');
// 		displayLoggedInUser();
// 	} else {
// 		console.log('User is not logged');
// 		updateUIForLoggedOutUser();
// 	}
// }

// function viewToDisplay(targetId){

//     if (targetId == 'RegisterForm' && !isRegisterForm){
// 		displayRegister();
//         isRegisterForm = true;
//         isLoginForm = false;
//     } else if (targetId == 'LoginForm' && !isLoginForm){
// 		displayLogin();
//         isLoginForm = true;
//         isRegisterForm = false;
//     } else if (targetId == 'logout'){
// 		displayLogout();
//            isLoginForm = false;
//            isRegisterForm = false;
//     } else {
// 		console.log('I pass here')
//         authFormContainer.innerHTML = '';
//         isLoginForm = false;
// 		isRegisterForm = false;
//     }
// 	console.log('lets go');
// }

// function updateUIForLoggedOutUser() {
// 	return fetch('https://localhost:8443/auth/buttons/')  // Update this URL to your actual authentication service URL
// 		.then(response => response.text())
//         .then(html => {
//             statusUser.innerHTML = html;
//             document.getElementById('statusUser').innerHTML = html;
//             isFormVisible = false;
//         })
//         .catch(error => {
//             console.error('Error fetching auth form:', error);
//         });
// }

// function displayLogout(){
// 	console.log("check:", localStorage.getItem('csrftoken'));
// 	fetch('https://localhost:8443/auth/logout/', {
// 		method: 'POST',
// 		credentials: 'include',
// 		headers: {
// 			'Content-Type': 'application/json',
// 			'X-CSRFToken': localStorage.getItem('csrftoken'),
// 		}
// 	})
// 	.then(response => {
// 		if (response.ok) {
// 			localStorage.removeItem('authToken')
// 			deleteCookie('sessionid');
// 			updateUIForLoggedOutUser();
// 		}
// 		console.log(response.ok)
// 	})
// 	.catch(error => {
// 		console.error('Logout failed:', error);
// 	});
// }

// function displayLogin(){
// 	fetch('https://localhost:8443/auth/login/')
// 	.then(response => response.text())
// 	.then(html => {
// 		authFormContainer.innerHTML = html;
// 		document.getElementById('authFormContainer').innerHTML = html;
// 		isFormVisible = true;
// 	})
// 	.catch(error => {
// 		console.error('Error fetching auth form:', error);
// 	});
// }

// function displayRegister(){
// 	fetch('https://localhost:8443/auth/register/')
// 	.then(response => response.text())
// 	.then(html => {
// 		authFormContainer.innerHTML = html;
// 		document.getElementById('authFormContainer').innerHTML = html;
// 		isFormVisible = true;
// 	})
// 	.catch(error => {
// 		console.error('Error fetching auth form:', error);
// 	});
// }

let isRegisterForm = false;
let isLoginForm = false;
document.addEventListener('DOMContentLoaded', function() {
	const csrftoken = localStorage.getItem('csrftoken');

    firstView();
	statusUser.addEventListener('click', function() {
		const targetId = event.target.id;
		viewToDisplay(targetId);
	});
});

function firstView(){
	isLoggedIn().then(isAuthenticated => {
		if (isAuthenticated) {
			console.log('User is logged in');
			displayLoggedInUser();
		} else {
			console.log('User is not logged in');
			updateUIForLoggedOutUser();
		}
	});
}

function viewToDisplay(targetId){


        if (targetId == 'RegisterForm' && !isRegisterForm){
			displayRegister();
            isRegisterForm = true;
            isLoginForm = false;
        } else if (targetId == 'LoginForm' && !isLoginForm){
			displayLogin();
            isLoginForm = true;
            isRegisterForm = false;
        } else if (targetId == 'logout'){
			displayLogout();
            isLoginForm = false;
            isRegisterForm = false;
        } else {
			console.log('I pass here')
            authFormContainer.innerHTML = '';
            isLoginForm = false;
			isRegisterForm = false;
        }
		console.log('lets go');
}

function displayLogout(){
	console.log("check:", localStorage.getItem('csrftoken'));
	fetch('https://localhost:8443/auth/logout/', {
		method: 'POST',
		credentials: 'include',
		headers: {
			'Content-Type': 'application/json',
			'X-CSRFToken': localStorage.getItem('csrftoken'),
		}
	})
	.then(response => {
		if (response.ok) {
			localStorage.removeItem('authToken')
			deleteCookie('sessionid');
			updateUIForLoggedOutUser();
		}
		console.log(response.ok)
	})
	.catch(error => {
		console.error('Logout failed:', error);
	});
}

function displayLogin(){
	fetch('https://localhost:8443/auth/login/')
	.then(response => response.text())
	.then(html => {
		authFormContainer.innerHTML = html;
		document.getElementById('authFormContainer').innerHTML = html;
		// isFormVisible = true;
	})
	.catch(error => {
		console.error('Error fetching auth form:', error);
	});
}

function displayRegister(){
	fetch('https://localhost:8443/auth/register/')
	.then(response => response.text())
	.then(html => {
		authFormContainer.innerHTML = html;
		document.getElementById('authFormContainer').innerHTML = html;
		// isFormVisible = true;
	})
	.catch(error => {
		console.error('Error fetching auth form:', error);
	});
}

function isLoggedIn() {
    return fetch('https://localhost:8443/auth/check-authentication/', {
        credentials: 'include'
    })
        .then(response => response.json())
        .then(data => {
                console.log('Authentication check', data.isAuthenticated);
				return true;
		})
		.catch(error => {
			console.error('Error checking authentication:', error);
			return false;
		});
}


function displayLoggedInUser(){
	statusUser.innerHTML = `
	<p>Welcome hahahaaa, ${localStorage.getItem('username')}!</p>
	<button type="button" id="logout">Logout</button>
	`;
}

function updateUIForLoggedOutUser() {
	return fetch('https://localhost:8443/auth/buttons/')
        .then(response => response.text())
        .then(html => {
            statusUser.innerHTML = html;
            document.getElementById('statusUser').innerHTML = html;
            // isFormVisible = false;
        })
        .catch(error => {
            console.error('Error fetching auth form:', error);
        });
}

function deleteCookie(name) {
    document.cookie = name + '=;expires=Thu, 01 Jan 1970 00:00:01 GMT;';
}
