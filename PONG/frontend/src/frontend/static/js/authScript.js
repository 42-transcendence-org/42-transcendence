// Example: script.js
document.addEventListener('DOMContentLoaded', function() {
    const authForm = document.getElementById('authForm');

    if (authForm) {
        authForm.addEventListener('submit', function(event) {
            event.preventDefault();

            var username = document.getElementById('username').value;
            var password = document.getElementById('password').value;

            fetch('http://localhost:8002/api/auth/register', {  // Update URL based on your setup
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ username: username, password: password })
            })
            .then(response => response.json())
            .then(data => {
                console.log(data);
            })
            .catch(error => {
                console.error('Error:', error);
            });
        });
    };
});
