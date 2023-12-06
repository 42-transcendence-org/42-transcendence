document.addEventListener('DOMContentLoaded', function() {
    const showAuthFormButton = document.getElementById('showAuthFormButton');
    const authContentDiv = document.getElementById('authContent');

    if (showAuthFormButton && authContentDiv) {
        showAuthFormButton.addEventListener('click', function() {
            // Toggle the display property between 'none' and 'block'
            authContentDiv.style.display = authContentDiv.style.display === 'none' ? 'block' : 'none';
        });
    }
});