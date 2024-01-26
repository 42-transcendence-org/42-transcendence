
function add_all_listeners(params) {
	document.getElementById('login-btn').addEventListener('click', function () {
		authRequest('http://localhost:8000/api/auth/login/');
	});

	document.getElementById('register-btn').addEventListener('click', function () {
		authRequest('http://localhost:8000/api/auth/register/');
	});
	document.getElementById('start-local-game-btn').addEventListener('click', () => createGame('local', csrfToken));
	document.getElementById('start-remote-game-btn').addEventListener('click', () => createGame('remote', csrfToken));
	document.getElementById('start-ai-game-btn').addEventListener('click', () => createGame('ai', csrfToken));
}


document.addEventListener('DOMContentLoaded', function () {

});
checkAuthenticationStatus()
