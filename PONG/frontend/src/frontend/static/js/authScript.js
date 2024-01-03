document.addEventListener('DOMContentLoaded', function() {
    const authFormContainer = document.getElementById('authFormContainer');
    const statusUser = document.getElementById('statusUser');
    const csrftoken = document.querySelector('[name=csrfmiddlewaretoken]').value;


    authFormContainer.addEventListener('submit', function(event) {
        if (event.target.id === 'registerForm') {
            event.preventDefault(); // Prevent the default form submission

            const formData = new FormData(event.target); // Use the event target which is the form
            const username = formData.get('username');
            const password1 = formData.get('password1');
            const password2 = formData.get('password2');

            fetch('http://localhost:8002/register/', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRFToken': csrftoken,
                },
                body: JSON.stringify({ username, password1, password2 })
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

        if (event.target.id === 'loginForm') {
            event.preventDefault(); // Prevent the default form submission

            const formData = new FormData(event.target); // Use the event target which is the form
            const username = formData.get('username');
            const password = formData.get('password');

            fetch('http://localhost:8002/login/', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRFToken': csrftoken,
                },
                body: JSON.stringify({ username, password })
            })
            .then(response => response.text())
            .then(html => {
                statusUser.innerHTML = html;
                document.getElementById('statusUser').innerHTML = html;
                authFormContainer.innerHTML = ''
                console.error('Error:', error);
            })
            .catch(error => {
            });
        }


    });
});
