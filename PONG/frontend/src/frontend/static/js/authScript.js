// Example: script.js
document.addEventListener('DOMContentLoaded', function() {
    const authForm = document.getElementById('authForm');

    if (authForm) {
        authForm.addEventListener('submit', function(event) {
            event.preventDefault();

            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;

            // const formData = new FormData(authForm);
            // const username = formData.get('username');
            // const password = formData.get('password');
            console.log(username)
            console.log(password)

            fetch('http://localhost:8002/register/', {  // Update URL based on your setup
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON({ username, password })
            })
            .then(response => response.json())
            .then(data => {
                document.getElementById('responseMessage').innerText = data.message;
            })
            .catch(error => {
                console.error('Error:', error);
            });
        });
    };
});
