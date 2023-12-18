document.addEventListener('DOMContentLoaded', function() {
    const RegisterForm = document.getElementById('RegisterForm');
    const LoginForm = document.getElementById('LoginForm');
    const authFormContainer = document.getElementById('authFormContainer');
    let isRegisterForm = false;
    let isLoginForm = false; 

    RegisterForm.addEventListener('click', function() {
        if (!isRegisterForm){
            fetch('http://localhost:8002/register_form/')  // Update this URL to your actual authentication service URL
            .then(response => response.text())
            .then(html => {
                authFormContainer.innerHTML = html;
                document.getElementById('authFormContainer').innerHTML = html;
                isFormVisible = true;
            })
            .catch(error => {
                console.error('Error fetching auth form:', error);
            });
            isRegisterForm = true;
            isLoginForm = false;
        } else {
            authFormContainer.innerHTML = '';
            isRegisterForm = false;
        }
    });

    LoginForm.addEventListener('click', function() {
        if (!isLoginForm){
            fetch('http://localhost:8002/login_form/')  // Update this URL to your actual authentication service URL
            .then(response => response.text())
            .then(html => {
                authFormContainer.innerHTML = html;
                document.getElementById('authFormContainer').innerHTML = html;
                isFormVisible = true;
            })
            .catch(error => {
                console.error('Error fetching auth form:', error);
            });
            isLoginForm = true;
            isRegisterForm = false;
        } else {
            authFormContainer.innerHTML = '';
            isLoginForm = false;
        }
    });


});
