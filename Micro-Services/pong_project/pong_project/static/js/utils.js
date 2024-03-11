import { debug_mute_music } from './pong/sound.js';

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

	// if (history.length > 1) {
	if (history.state !== null) {
		history.pushState({id: div.id, count: count}, '', '');
		console.log('pushed');
	}
	else { //for first load, console warning if not replacing bc only 1 state or smth
		history.replaceState({id: div.id, count: count}, '', '');
		console.log('replaced');
	}


}

export function div_handler(div_to_show) {
	
	if (history.state && history.state.id === div_to_show) {
		alert('You already are on this page !');
		return ;
	}
	
	count++;

	divDisplay(div_to_show); //ne pas inverser d'ordre avec addToHistory, sinon la première addition à l'historique ne se fait pas
	addToHistory();
}

let previous_div = null;
let loggedDiv = document.getElementById('isLogged');
let notLoggedDiv = document.getElementById('isNotLogged');
let errBanner = document.getElementById('error-banner');

export function divDisplay(div_to_show) {
	console.log(history);




	let isLogged = localStorage.getItem('isLogged');
	
	// console.log('isLogged:', isLogged);

	let homeDiv = (isLogged === 'true') ? 'logged-in-home' : 'not-logged-home';

	let childDivs = null;
	
	if (isLogged === 'true') {
		loggedDiv.style.display = 'block';
		document.getElementById('login-banner').style.display = 'block';
		notLoggedDiv.style.display = 'none';
		console.log('logged');
		childDivs = loggedDiv.querySelectorAll('div');
	} else {
		loggedDiv.style.display = 'none';
		document.getElementById('login-banner').style.display = 'none';
		notLoggedDiv.style.display = 'block';
		childDivs = notLoggedDiv.querySelectorAll('div');
		console.log('not logged');
	}
	// console.log(childDivs)
	
	let isAllowed = false;

	childDivs.forEach(childDiv => {
		if (childDiv.id === div_to_show) {
			isAllowed = true;
		}
		// console.log('got:', div.id, 'and', div_to_show);
	});

	if (isAllowed === false) {
		div_to_show = homeDiv;

		alert('You are not allowed to access this page, you need to ' + (isLogged === 'true' ? 'delog first' : 'log in first'));
		// errBanner.backgroundColor = 'red';
		// return ;
	}
	
	let div = document.getElementById(div_to_show);
	div.style.display = 'block';
	// console.log(div_to_show, 'div_to_show, and div gotten:', div.id);


	if (previous_div && previous_div != div)
		previous_div.style.display = 'none';
	// all_divs.forEach(div => {
	// 	console.log(div.id, div.style.display);
	// })
	previous_div = div;
	console.log('previous div:', previous_div.id);
	// showShownDivs();

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