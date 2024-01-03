document.addEventListener('DOMContentLoaded', function() {
    const RegisterForm = document.getElementById('RegisterForm');
    const LoginForm = document.getElementById('LoginForm');
    const authFormContainer = document.getElementById('authFormContainer');
    const statusUser = document.getElementById('statusUser');
    
    let isRegisterForm = false;
    let isLoginForm = false;

    if (isLoggedIn()){
        displayLoggedInUser();
    } else {
        fetch('http://localhost:8002/buttons/')  // Update this URL to your actual authentication service URL
        .then(response => response.text())
        .then(html => {
            statusUser.innerHTML = html;
            document.getElementById('statusUser').innerHTML = html;
            isFormVisible = false;
        })
        .catch(error => {
            console.error('Error fetching auth form:', error);
        });
        statusUser.addEventListener('click', function() {
            const targetId = event.target.id;
    
    
            if (targetId == 'RegisterForm' && !isRegisterForm){
                fetch('http://localhost:8002/register/')  // Update this URL to your actual authentication service URL
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
            } else if (targetId == 'LoginForm' && !isLoginForm){
                fetch('http://localhost:8002/login/')  // Update this URL to your actual authentication service URL
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
            } else if (targetId == 'logout'){
                isLoggedIn()
                .then(isAuthenticated => {
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

    }


});

function isLoggedIn() {
    fetch('http://localhost:8002/check-authentication/', {
        credentials: 'include'
    })
        .then(response => response.json())
        .then(data => {
            if (data.isAuthenticated) {
                console.log('User is logged in');
            } else {
                console.log('User is not logged in')
            }
            return data.isAuthenticated;  // Assuming the API returns a JSON object with an isAuthenticated boolean
        });
}


function displayLoggedInUser(){
    fetch('http://localhost:8002/home/', {
        credentials: 'include'
    })
}