document.addEventListener('DOMContentLoaded', function() {
    const loadAuthFormButton = document.getElementById('loadAuthFormButton');

    loadAuthFormButton.addEventListener('click', function() {
        fetch('http://localhost:8002/auth_form/')  // Update this URL to your actual authentication service URL
            .then(response => response.text())
            .then(html => {
                document.getElementById('authFormContainer').innerHTML = html;
            })
            .catch(error => {
                console.error('Error fetching auth form:', error);
            });
    });
});
