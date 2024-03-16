import { isLoggedIn } from './requests.js';
import { get42UserData} from './Oauth.js';

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

export function gestionnairePopState() {

	if (history.state === null) {
		console.log('state is null');
		return ;
	}

	divDisplay(getDivId(history.state.id));
}

function addToHistory() {

	let div = previous_div;

	if (div === null) {
		console.log('div is null');
		return ;
	}

	if (history.state !== null) {
		history.pushState({id: div.id}, '', '');
	}
	else { //for first load, console warning if not replacing bc only 1 state or smth
		history.replaceState({id: div.id}, '', '');
	}


}

export async function nextPage(div_to_show) {

	await divDisplay(div_to_show); // affiche la div à afficher
	
	//ne pas modifier l'ordre de ces deux fct, sinon la première addition à l'historique ne se fait pas

	addToHistory(); //ajoute à l'historique
}

let previous_div = null;

export function newPreviousDiv(div) {
	previous_div = div;
}

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

export async function thisDivCanBeShown(div_to_show) {

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

export async function divDisplay(div_to_show) {

	localStorage.setItem('isLogged', await isLoggedIn());
	
	if (localStorage.getItem('isLogged') === 'true' ) {
		const data = await get42UserData();
		if (data && !data.error) {
			document.getElementById('username_display_profile').innerText = data.username;
			document.getElementById('email_display_profile').innerText = data.email;
			console.log(data.email);
			document.getElementById('nickname_display_profile').innerText = data.nickname;
		}
	}
	display_loggedDivs_or_notLoggedDivs();

	if (await thisDivCanBeShown(div_to_show) === false) {
		div_to_show = 'unauthorized';
		document.getElementById('unauthorized').querySelector('p').textContent = 'Unauthorized: ' + (localStorage.getItem('isLogged') === 'true' ? 'you are already logged in.' : 'you need to be logged in to see this page.');
		// alert('You are not allowed to access this page');
		// alert("WE WERE CALLED");
	}
	else {
		// alert(await thisDivCanBeShown(div_to_show));
		// alert(div_to_show);
	}
	
	if (previous_div) //hides previous div
		previous_div.style.display = 'none';

	let div = document.getElementById(div_to_show);

	document.getElementById('loading').style.display = 'none';
	div.style.display = 'block'; //show new div

	previous_div = div; //enregistre la div actuelle pour pouvoir la cacher plus tard in english is better mais comment on dit enregistre jsplu trou de mémoire

}

export async function home() {

	let logged = await isLoggedIn();

	if (logged === 'true') {
		nextPage("logged-in-home");
	} else {
		nextPage("not-logged-home");
	}
}