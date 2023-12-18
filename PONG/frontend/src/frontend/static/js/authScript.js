document.addEventListener('DOMContentLoaded', function() {
    const authFormContainer = document.getElementById('authFormContainer');
    
    authFormContainer.addEventListener('submit', function(event) {
        event.preventDefault(); // Prevent the default form submission
        if (event.target.id === 'registerForm') {
            console.log("coucou");
            event.preventDefault(); // Prevent the default form submission

            const formData = new FormData(event.target); // Use the event target which is the form
            const username = formData.get('username');
            const email = formData.get('email');
            const password = formData.get('password');

            console.log("Username:", username, "Email:", email, "Password:", password);


            fetch('http://localhost:8002/register/', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    // Add CSRF token header if needed
                },
                body: JSON.stringify({ username, email, password })
            })
            .then(response => response.json())
            .then(data => {
                document.getElementById('responseMessage').innerText = data.message;
                if (data.message == 'User created successfully')
                    authFormContainer.innerHTML = '';
            })
            .catch(error => {
                console.error('Error:', error);
            });
        }
    });
});