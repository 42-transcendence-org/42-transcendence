document.addEventListener('DOMContentLoaded', function() {
    const RegisterForm = document.getElementById('RegisterForm');
    const LoginForm = document.getElementById('LoginForm');
    const authFormContainer = document.getElementById('authFormContainer');
    const statusUser = document.getElementById('statusUser');
	const csrftoken = localStorage.getItem('csrftoken');
	console.log(csrftoken);

    let isRegisterForm = false;
    let isLoginForm = false;

	// let check = isLoggedIn();
	// console.log('check = ', check);

    isLoggedIn().then(isAuthenticated => {
		if (isAuthenticated) {
			console.log('User is logged in');
			displayLoggedInUser();
		} else {
			console.log('User is not logged in');
			updateUIForLoggedOutUser();
		}
	});

		console.log('hello');
        statusUser.addEventListener('click', function() {
            const targetId = event.target.id;


            if (targetId == 'RegisterForm' && !isRegisterForm){
                fetch('http://localhost:8002/register/')  // Update this URL to your actual authentication service URL
                .then(response => response.text())
                .then(html => {
                    authFormContainer.innerHTML = html;
                    document.getElementById('authFormContainer').innerHTML = html;
                    isFormVisible = true;
                })
                .catch(error => {
                    console.error('Error fetching auth form:', error);
                });
                isRegisterForm = true;
                isLoginForm = false;
            } else if (targetId == 'LoginForm' && !isLoginForm){
                fetch('http://localhost:8002/login/')  // Update this URL to your actual authentication service URL
                .then(response => response.text())
                .then(html => {
					authFormContainer.innerHTML = html;
                    document.getElementById('authFormContainer').innerHTML = html;
                    isFormVisible = true;
                })
                .catch(error => {
                    console.error('Error fetching auth form:', error);
                });
                isLoginForm = true;
                isRegisterForm = false;
            } else if (targetId == 'logout'){
				fetch('http://localhost:8002/logout/', {
					method: 'POST',
					credentials: 'include',
					headers: {
						'Content-Type': 'application/json',
						'X-CSRFToken': csrftoken,
					}
				})
				.then(response => {
					if (response.ok) {
						localStorage.removeItem('authToken')
						deleteCookie('sessionid');
						updateUIForLoggedOutUser(csrftoken);
					}
					console.log(response.ok)
				})
                .catch(error => {
                    console.error('Logout failed:', error);
                });
                isLoginForm = false;
                isRegisterForm = false;
            } else {
                authFormContainer.innerHTML = '';
                isLoginForm = false;
            }
        });

});

function isLoggedIn() {
    return fetch('http://localhost:8002/check-authentication/', {
        credentials: 'include'
    })
        .then(response => response.json())
        .then(data => {
                console.log('Authentication check', data.isAuthenticated);
				return data.isAuthenticated;
		})
		.catch(error => {
			console.error('Error checking authentication:', error);
			return false;
		});
}


function displayLoggedInUser(){
    fetch('http://localhost:8002/home/', {
        credentials: 'include'
    })
	.then(response => {
		if (!response.ok) {
			throw new Error('Network response was not ok');
		}
		return response.text();
	})
    .then(html => {
        console.log('HTML response:', html);
		statusUser.innerHTML = html;
    })
    .catch(error => {
        console.error('Error fetchin /hone:', error);
		return false;
    });
}

function updateUIForLoggedOutUser() {
	return fetch('http://localhost:8002/buttons/')  // Update this URL to your actual authentication service URL
        .then(response => response.text())
        .then(html => {
            statusUser.innerHTML = html;
            document.getElementById('statusUser').innerHTML = html;
            isFormVisible = false;
        })
        .catch(error => {
            console.error('Error fetching auth form:', error);
        });
}

function deleteCookie(name) {
    document.cookie = name + '=;expires=Thu, 01 Jan 1970 00:00:01 GMT;';
}
