export function get_cookie(name) {
	let cookie_value = null;
	if (document.cookie && document.cookie !== '') {
		const cookies = document.cookie.split(';');
		for (let i = 0; i < cookies.length; i++) {
			const cookie = cookies[i].trim();
			if (cookie.substring(0, name.length + 1) === (name + '=')) {
				cookie_value = decodeURIComponent(cookie.substring(name.length + 1));
				break;
			}
		}
	}
	return cookie_value;
}

// doc: https://developer.mozilla.org/en-US/docs/Web/API/Window/beforeunload_event
// https://html.spec.whatwg.org/multipage/nav-history-apis.html
// https://github.com/mdn/dom-examples/blob/main/history-api/script.js
// https://developer.mozilla.org/en-US/docs/Web/API/Window/beforeunload_event
// whenever f5 or back/forward pressed for the first time after a click, history length +1, it is normal? idk. Not problematic yet
//count c de la d

export function getDivId(id) {

	const all_divs = document.querySelectorAll('div');

	let div = null;
	all_divs.forEach(shownDiv => {
		if (shownDiv.id === id) {
			div = shownDiv;
		}
	});

	return div.id;
}

export function refreshFunction() {

// NEED TO RELOAD GAMESTATE
	// if (history.length > 1) {
	// 	window = history.state.window;
	// }

}


export function gestionnairePopState() {

	if (history.state === null) {
		console.log('state is null');
		return ;
	}

	divDisplay(getDivId(history.state.id));
}

let count = 0;

function addToHistory() {

	let div = previous_div;

	if (div === null) {
		console.log('div is null');
		return ;
	}

	if (history.state !== null) {
		history.pushState({id: div.id, count: count}, '', '');
	}
	else { //for first load, console warning if not replacing bc only 1 state or smth
		history.replaceState({id: div.id, count: count}, '', '');
	}


}

export function div_handler(div_to_show) {
	
	// if (history.state && history.state.id === div_to_show) {
	// 	alert('You already are on this page !');
	// 	return ;
	// }
	
	count++;

	divDisplay(div_to_show); //ne pas inverser d'ordre avec addToHistory, sinon la première addition à l'historique ne se fait pas
	addToHistory();
}

let previous_div = null;
let loggedDiv = document.getElementById('isLogged');
let notLoggedDiv = document.getElementById('isNotLogged');
let logginBanner = document.getElementById('login-banner');

export function display_loggedDivs_or_notLoggedDivs() {

	let isLogged = localStorage.getItem('isLogged');
	
	if (isLogged === 'true') {
		loggedDiv.style.display = 'block';
		logginBanner.style.display = 'block';
		notLoggedDiv.style.display = 'none';
	} else {
		loggedDiv.style.display = 'none';
		logginBanner.style.display = 'none';
		notLoggedDiv.style.display = 'block';
	}
}

export function thisDivCanBeShown(div_to_show) {

	let childDivs = null;
	
	if (localStorage.getItem('isLogged') === 'true') {
		childDivs = loggedDiv.querySelectorAll('div');
	} else {
		childDivs = notLoggedDiv.querySelectorAll('div');
	}

	let canBeShown = false;
	
	childDivs.forEach(childDiv => {
		if (childDiv.id === div_to_show) {
			canBeShown = true;
		}
	});

	return canBeShown;

}

export function divDisplay(div_to_show) {

	display_loggedDivs_or_notLoggedDivs();

	if (thisDivCanBeShown(div_to_show) === false) {
		div_to_show = 'unauthorized';
		document.getElementById('unauthorized').querySelector('p').textContent = 'Unauthorized: ' + (localStorage.getItem('isLogged') === 'true' ? 'you are already logged in.' : 'you need to be logged in to see this page.');
		// alert('You are not allowed to access this page');
	}
	
	if (previous_div)
		previous_div.style.display = 'none';

	let div = document.getElementById(div_to_show);

	div.style.display = 'block';


	previous_div = div;

}

function showShownDivs() {

	const all_divs = document.querySelectorAll('div');

	console.log('shown divs are:');

	all_divs.forEach(div => {
		if (div.style.display == 'block')
			console.log(div.id, div.style.display);
	})

	console.log('end of shown divs');
}

export function home() {
	let logged = localStorage.getItem('isLogged');
	
	if (logged === 'true') {
		div_handler("logged-in-home");
	} else {
		div_handler("not-logged-home");
	}
}

export function firstView(){

	isLoggedIn().then(isAuthenticated => {
		if (localStorage.getItem('isLogged') === 'true') {
			var username = localStorage.getItem('username'); 
			if (username) {
				var usernameElement = document.getElementById('username');
				usernameElement.textContent = username;
			}
			div_handler("logged-in-home");
		} else {
			div_handler("not-logged-home");
		}
	});
}

function isLoggedIn() {
    return fetch('https://localhost:8443/auth/check-authentication/', {
        credentials: 'include',
    })
        .then(response => response.json())
        .then(data => {
			if (data.isAuthenticated){
				return true;
			}
			return false;
		})
		.catch(error => {
			console.error('Error checking authentication:', error);
			return false;
		});
}