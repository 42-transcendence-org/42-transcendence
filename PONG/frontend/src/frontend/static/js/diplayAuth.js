document.addEventListener('DOMContentLoaded', function() {
    const loadAuthFormButton = document.getElementById('loadAuthFormButton');
    const authFormContainer = document.getElementById('authFormContainer');
    let isFormVisible = false; 

    loadAuthFormButton.addEventListener('click', function() {
        if (isFormVisible) {
            authFormContainer.innerHTML = '';
            isFormVisible = false;
        } else {
            fetch('http://localhost:8002/auth_form/')  // Update this URL to your actual authentication service URL
            .then(response => response.text())
            .then(html => {
                authFormContainer.innerHTML = html;
                document.getElementById('authFormContainer').innerHTML = html;
                isFormVisible = true;
            })
            .catch(error => {
                console.error('Error fetching auth form:', error);
            });
        }
    });
});
