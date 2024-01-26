function check_auth_status() {
	fetch('http://localhost:8000/api/auth/check/', {
		method: 'GET',
		headers: {
			'Content-Type': 'application/json',
			'credentials': 'include'
		}
	})
		.then(response => response.json())
		.then(data => {
			if (data.is_authenticated) {
				// Hide login/register div and show game launch buttons
				document.getElementById('auth-form-div').style.display = 'none';
				document.getElementById('game-launch-buttons').style.display = 'block';
			} else {
				// Show login/register div
				document.getElementById('auth-form-div').style.display = 'block';
			}
		})
		.catch(error => console.error('Error:', error));
}

function make_login_or_register_request(url) {
	const username = document.getElementById('username').value;
	const password = document.getElementById('password').value;

	fetch(url, {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json',
			// Add CSRF token header if needed
		},
		credentials: 'include',
		body: JSON.stringify({ username, password })
	})
		.then(response => response.json())
		.then(data => {
			if (data.message === "Login successful" || data.message === "Registration successful") {
				console.log("Success:", data);
				checkAuthenticationStatus()
			} else {
				console.error("Error:", data);
			}
		})
		.catch(error => console.error('Error:', error));
}
