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

document.addEventListener('DOMContentLoaded', function () {
	const csrfToken = getCookie('csrftoken');

	function createGame(type) {
		fetch('http://localhost:8000/api/games/', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
				'X-CSRFToken': csrfToken,
			},
			body: JSON.stringify({ gameType: type }),
		})
			.then(response => response.json())
			.then(data => console.log(data))
			.catch(error => console.error('Error:', error));
	}

	document.getElementById('buttonHumanLocal').addEventListener('click', () => createGame('local'));
	document.getElementById('buttonHumanRemote').addEventListener('click', () => createGame('remote'));
	document.getElementById('buttonHumanComputer').addEventListener('click', () => createGame('ai'));
});
