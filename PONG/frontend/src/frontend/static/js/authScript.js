document.addEventListener('DOMContentLoaded', function() {
    const authFormContainer = document.getElementById('authFormContainer');
    const csrftoken = document.querySelector('[name=csrfmiddlewaretoken]').value;


    authFormContainer.addEventListener('submit', function(event) {
        console.log("toto")
        if (event.target.id === 'registerForm') {
            console.log("coucou");
            event.preventDefault(); // Prevent the default form submission

            const formData = new FormData(event.target); // Use the event target which is the form
            const username = formData.get('username');
            const password1 = formData.get('password1');
            const password2 = formData.get('password2');


            console.log("Username:", username, "Password:", password1);


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
                // if (data.message == 'User created successfully')
                //     authFormContainer.innerHTML = '';
            })
            .catch(error => {
                console.error('Error:', error);
            });
        }

        if (event.target.id === 'loginForm') {
            console.log("coucou2");
            event.preventDefault(); // Prevent the default form submission

            const formData = new FormData(event.target); // Use the event target which is the form
            const username = formData.get('username');
            const password = formData.get('password');

            console.log("Username:", username, "Password:", password);


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
                authFormContainer.innerHTML = html;
                document.getElementById('authFormContainer').innerHTML = html;
                isFormVisible = true;
            })
            .catch(error => {
                console.error('Error:', error);
            });
        }
    });
});
