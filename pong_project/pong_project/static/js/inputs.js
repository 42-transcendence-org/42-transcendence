document.addEventListener('keydown', (event) => {
	const key_name = event.key;
	send_user_input(key_name);
});

function send_user_input(key_name) {
	let input;
	if (!currentGame || !currentGame.id) return; // Ensure there is an active game

	if (key_name === 'a') {
		input = { id: "1", action: "left" };
	} else if (key_name === 's') {
		input = { id: "1", action: "right" };
	} else if (key_name === 'k') {
		input = { id: "2", action: "left" };
	} else if (key_name === 'l') {
		input = { id: "2", action: "right" };
	} else {
		return;
	}

	const csrfToken = getCookie('csrftoken'); // Get CSRF token

	fetch(`http://localhost:8000/api/games/${currentId}/`, {
		method: 'PUT',
		headers: {
			'Content-Type': 'application/json',
			'X-CSRFToken': csrfToken
		},
		body: JSON.stringify(input)
	})
		.then(response => {
			if (!response.ok) {
				throw new Error('Network response was not ok');
			}
			return response.json();
		})
		.then(data => {
			console.log('Input sent successfully:', data);
		})
		.catch(error => {
			console.error('Error sending input:', error);
		});
}
