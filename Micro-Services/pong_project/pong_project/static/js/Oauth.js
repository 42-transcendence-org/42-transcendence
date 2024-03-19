export async function RedirectTo42Login(event) //step 1
{
	// event.preventDefault()
	let uri = null;
	const url = 'https://localhost:8443/auth/OAuthRedirectUrl/';
	try {
		const response = await fetch(url, {
			credentials: 'include',
		});
		if (!response.ok) {
			console.error(response);
			throw new Error('La requête de redirection a échoué');
		}

		const data = await response.json();

		uri = data.uri;
	}
	catch (error) {
		console.error(error);
		uri = 'https://localhost:8443'
		return ;
	}
	window.addEventListener('pageshow', redirHandlerPageshow); //NEEDED otherwise we see the not logged in page even if we are logged in when we come back from 42
	window.addEventListener('unload', redirHandlerUnload); //NEDED SAME HARD TO HANDLE F M LIFE
	window.location.href = uri;
	// Now the user will be redirected to the 42 login page, which will proc isRedirectedFrom42API() in the listners !
	// isRedirectedFrom42API() will be triggered because the url will contain the code and state parameters
}

export async function isRedirectedFrom42API() { //step2 that gets proc after 42loggin in
	const urlParams = new URLSearchParams(window.location.search); //vérifier que cette fonction est correcte
    const code = urlParams.get('code');
	const state = urlParams.get('state'); //check avec le backend que c bien le meme state
    if (code && state) {
		if (await isValidState(state) !== true) {
			console.error('Invalid state gotten from the redirection ! This is not a valid redirection from 42. Not authorising the connection.');
			return false;
		}
		localStorage.setItem('code', code);
		return true;
    } else {
		return false;
    }
}



export async function login42(code) { // if step2 == true -> procs this: step3 that calls the 3 next functions to effectively log in

	await obtainUserAccessToken(code);
	const authForm = await CreateUserAndGetHisIDs(code);
	if (authForm === null) {
		console.error('Error while trying to get the username and password from the backend');
		return ;
	}
	await LogTheUserIn(authForm);

}

export async function obtainUserAccessToken(code) {
	const url = 'https://localhost:8443/auth/login42/';
	const dict = {
        'code': code,
    };
	localStorage.removeItem('code');
	try {
		const response = await fetch(url, {
			method: 'POST',
			headers: {
				'Authorization': `Bearer ${localStorage.getItem("jwt")}`,
				'Content-Type': 'application/json',
				'X-CSRFToken': window.client.get_cookie("csrftoken"),
			},
			credentials: 'include',
			body: JSON.stringify(dict),
		});

		const data = await response.json();
		if (data.error) {
			throw new Error(data.error);
		}
	}
	catch (error) {
		console.error(error);
	}
}

export async function CreateUserAndGetHisIDs() {

	try {
	const response = await fetch('https://localhost:8443/auth/login42/', {
			credentials: 'include',
		});

		const data = await response.json();

		if (data.error) {
			throw new Error(data.error);
		}
		return (data);
	}
	catch (error) {
		console.error(error);
		return null;
	}
}

export async function LogTheUserIn(authForm) {
		// event.preventDefault()

	authForm['is42'] = true;
	try {
		const response = await fetch('https://localhost:8443/auth/login/', {
			method: 'POST',
			headers: {
			'Content-Type': 'application/json',
			'X-CSRFToken': window.client.get_cookie("csrftoken"),
			},
			body: JSON.stringify(authForm)
		})
		
		const data = await response.json();
		
		if (data.error)
			throw new Error(data.error);

		if (data.token){
			localStorage.setItem('isLogged', 'true');
			localStorage.setItem('jwt', data.token);
			window.history.replaceState({id: 'logged-in-home'}, '', 'https://localhost:8443');
			window.client.divDisplay('logged-in-home');
		}
	}
	catch (error) {
		console.error(error);
	}
}





//UTILS

export async function getUserData() {
	const url = 'https://localhost:8443/auth/getInfo/';
	try {
		const response = await fetch(url, {
			credentials: 'include',
		});
		const data = await response.json();
		if (data.error) {
			throw new Error(data.error);
		}
		return data;
	}
	catch (error) {
		console.error(error);
		return null;
	}
}


function redirHandlerUnload() {
	window.removeEventListener('unload', redirHandlerUnload);
	window.client.divDisplay("loading");

}

function redirHandlerPageshow() {
	window.removeEventListener('pageshow', redirHandlerPageshow);
	window.client.divDisplay(history.state.id);
}


async function isValidState(state) { //checks the state gotten from the redirection post login on 42 website
	const url = 'https://localhost:8443/auth/OAuthVerifyState/';
	const data = {
		'state': state,
	};
	try {
		const response = await fetch(url, {
			method: 'POST',
			headers: {
				'Authorization': `Bearer ${localStorage.getItem("jwt")}`,
				'Content-Type': 'application/json',
				'X-CSRFToken': window.client.get_cookie("csrftoken"),
			},
			credentials: 'include',
			body: JSON.stringify(data),
		});
		const rep = await response.json();			
		if (rep.isValidState === true) {
			return true;
		}
		else
			throw new Error('Invalid State');
	}
	catch (error) {
		console.error(error);
		return false;
	}
}

export async function getApp42Token(){
	return fetch('https://localhost:8443/auth/OAuthGetAppToken/', {
		credentials: 'include',
	})
	.then(response => response.json())
	.then(data => {
		if (data.token){
			return true;
		}
		else
			throw new Error(data.error);
	})
	.catch(error => {
		console.error(error);
		return false;
	});
}









export async function chatgpt(event) { //checks the state gotten from the redirection post login on 42 website
	event.preventDefault()
	const url = 'https://localhost:8443/auth/chatgpt/';
	const data = {
		'question': document.getElementById('OpenAIquestion').value,
	};
	try {
		const response = await fetch(url, {
			method: 'POST',
			headers: {
				'Authorization': `Bearer ${localStorage.getItem("jwt")}`,
				'Content-Type': 'application/json',
				'X-CSRFToken': window.client.get_cookie("csrftoken"),
			},
			credentials: 'include',
			body: JSON.stringify(data),
		});
		const rep = await response.json();			
		if (rep.response) {
			console.log(rep.response);
			document.getElementById('chatgpt-response').textContent = rep.response;
			document.getElementById('OpenAIquestion').value = '';
		}
		else
			throw new Error('Invalid response');
	}
	catch (error) {
		console.error(error);
		return false;
	}
}





export async function getter(url) {
	try {
		const response = await fetch(url, {
			headers: {
				'Authorization': `Bearer ${localStorage.getItem("jwt")}`,
				'Content-Type': 'application/json',
				'X-CSRFToken': window.client.get_cookie("csrftoken"),
			},
			credentials: 'include',
		});
		const data = await response.json();

		if (data.error) {
			throw new Error(data.error);
		}
		return data;
	}
	catch (error) {
		console.error(error);
		return error;
	}
}

export async function poster(url, data) {
	try {
		const response = await fetch(url, {
			method: 'POST',
			headers: {
				'Authorization': `Bearer ${localStorage.getItem("jwt")}`,
				'Content-Type': 'application/json',
				'X-CSRFToken': window.client.get_cookie("csrftoken"),
			},
			credentials: 'include',
			body: JSON.stringify(data),
		});
		const rep = await response.json();	
		if (rep.error) {
			throw new Error(rep.error);
		}		
		return rep;
	}
	catch (error) {
		console.error(error);
		return null;
	}
}













//poubelle



// async function postToken(input){
// 	const url = 'https://localhost:8443/auth/OAuth/';
// 	const formData = {
//         path: input,
//     };
// 	try {
// 		const response = await fetch(url, {
// 			method: 'POST',
// 			headers: {
// 				'Authorization': `Bearer ${localStorage.getItem("jwt")}`,
// 				'Content-Type': 'application/json',
// 				'X-CSRFToken': window.client.get_cookie("csrftoken"),
// 			},
// 			credentials: 'include',
// 			body: JSON.stringify(formData),
// 		});

// 		if (!response.ok) {
// 			throw new Error('La requête a échoué');
// 		}

// 		const responseData = await response.json();
// 		console.log(responseData);
// 	}
// 	catch (error) {
// 		console.error('Erreur lors de la récupération des données :', error);
// 	}
// }