document.addEventListener('DOMContentLoaded', function() {
    const loadAuthFormButton = document.getElementById('loadAuthFormButton');
    const authFormContainer = document.getElementById('authFormContainer');

    loadAuthFormButton.addEventListener('click', function() {
        if (authFormContainer.innerHTML !== '') {
            authFormContainer.innerHTML = '';
        } else {
            fetch('http://localhost:8002/auth_form/')  // Update this URL to your actual authentication service URL
            .then(response => response.text())
            .then(html => {
                document.getElementById('authFormContainer').innerHTML = html;
            })
            .catch(error => {
                console.error('Error fetching auth form:', error);
            });
        }
    });
});
