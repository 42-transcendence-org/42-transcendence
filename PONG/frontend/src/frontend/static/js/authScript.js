// Example: script.js
document.getElementById('authForm').addEventListener('submit', function(event) {
    event.preventDefault();

    var name = document.getElementById('name').value;
    var nickname = document.getElementById('nickname').value;

    fetch('http://localhost:8001/api/auth/register', {  // Update URL based on your setup
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ name: name, nickname: nickname })
    })
    .then(response => response.json())
    .then(data => {
        document.getElementById('responseMessage').innerText = 'Registration successful!';
        // Handle additional logic (e.g., redirect to login page)
    })
    .catch(error => {
        console.error('Error:', error);
    });
});
