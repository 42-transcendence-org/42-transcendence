import * as Oauth from './Oauth.js';

export class Janken {
	constructor() {
	}
	
	eventlisteners() {
		document.getElementById('janken-button').addEventListener('click', () => window.client.nextPage('janken')); //janken
		document.getElementById('janken-create-game-button').addEventListener('click', () => this.create_game());
		document.getElementById('janken-join-game-button').addEventListener('click', () => this.join_game());
		document.getElementById('rock-button').addEventListener('click', () => this.play('rock'));
		document.getElementById('paper-button').addEventListener('click', () => this.play('paper'));
		document.getElementById('scissors-button').addEventListener('click', () => this.play('scissors'));
		document.getElementById('janken-cancel-game').addEventListener('click', () => this.cancel_game());
		document.getElementById('janken-game-in-progress-button').addEventListener('click', () => client.nextPage('janken-game'));
		document.getElementById('janken-already-played-back').addEventListener('click', () => client.nextPage('janken'));
		document.getElementById('janken-lobby-back').addEventListener('click', () => client.nextPage('janken'));
		document.getElementById('janken-game-back').addEventListener('click', () => client.nextPage('janken'));
		document.getElementById('janken-result-back').addEventListener('click', () => client.nextPage('janken'));
		document.getElementById('janken-history-back').addEventListener('click', () => client.nextPage('janken'));
		document.getElementById('janken-history-back-to-profile').addEventListener('click', () => client.nextPage('profile'));
		document.getElementById('janken-history-button').addEventListener('click', () => client.nextPage('janken-history'));
	}
	
	async relaunchGetters() {
		const url = 'https://localhost:8443/auth/amIPlaying/'
		const response = await Oauth.getter(url);
		if (response.error) {
			document.getElementById("janken-game-in-progress-button").style.display = "none";
			document.getElementById('janken-game-in-progress-button').style.setProperty('--display-before', 'none');
			document.getElementById('janken-button').style.setProperty('--display-before', 'none');
		} else {
			if (response.message == 'You are waiting for an opponent') {
				clearInterval(localStorage.getItem('id_interval_game_waiting'));
				localStorage.setItem('id_interval_game_waiting', setInterval(this.waitForOpponent, 1000));
				return ;
			}
			else if (response.message == 'Waiting for your opponent to play'){
				clearInterval(localStorage.getItem('id_interval_wait_results'));
				localStorage.setItem('id_interval_wait_results', setInterval(this.waitResults, 1000));
			}
				document.getElementById('janken-game-in-progress-button').style.setProperty('--display-before', 'flex');
				document.getElementById('janken-button').style.setProperty('--display-before', 'flex');
		}
	}

	async getHistory() {
		const url = 'https://localhost:8443/auth/jankenHistory/'
		const response = await Oauth.getter(url);
		if (response.error) {
			document.getElementById('janken-history-wins').textContent = 0;
			document.getElementById('janken-history-draws').textContent = 0;
			document.getElementById('janken-history-losses').textContent =  0;
			return ;
		}
		var div = document.getElementById('janken-history-list');
		console.log(response);
		div.textContent = "";
		const limit = response.history.length > 10 ? response.history.length - 10 : 0;
		for (var i = response.history.length - 1; i >= limit; i--) {
			var p = document.createElement('p');
			var p2 = document.createElement('p');
			p.textContent = response.history[i].owner + " played ";
			p.textContent += response.history[i].owner_choice  + (response.history[i].owner_choice == "None" ? "(Forfeit)" : "");
			p.textContent += " and " + response.history[i].opponent + " played ";
			p.textContent += response.history[i].opponent_choice + (response.history[i].opponent_choice == "None" ? "(Forfeit)" : "");
			p.textContent += ". Result: " + response.history[i].result + ". ";
			p2.textContent += "Game ended the " + response.history[i].end_day + " at " + response.history[i].end_time + ".";
			if (response.history[i].winner == response.history[i].owner) {
				// p.textContent += "You " + response.history[i].result + " !";
				p.style.backgroundColor = "green";
			}
			else if (response.history[i].result == "draw") {
				// p.textContent += "It's a draw !";
				p.style.backgroundColor = "yellow";
			}
			else {
				// p.textContent += response.history[i].winner + " " + response.history[i].result + " !";
				p.style.backgroundColor = "red";
			}
			div.appendChild(p);
			p.appendChild(p2);
		}
		document.getElementById('janken-history-wins').textContent = response.wins;
		document.getElementById('janken-history-draws').textContent = response.draws;
		document.getElementById('janken-history-losses').textContent =  response.losses;
	}

	async game_in_progress() {
		const url = 'https://localhost:8443/auth/gameInProgress/'
		const response = await Oauth.getter(url);
		if (response.error) {
			// if (document.getElementById('janken').style.display == 'none')
			// 	alert(response.error);
			return ('janken-not-authorized');
		}
		if (response.message == 'waiting for opponent') {
			return ('janken-lobby');
		} else if (response.message == 'game in progress') {
			document.getElementById('janken-game-opponent-nickname').textContent = "Playing against " + response.opponent;
			return ('janken-game');
		} else if (response.message == 'already played') {
			document.getElementById('janken-already-played-opponent-nickname').textContent = response.opponent;
			return ('janken-already-played');
		} else if (response.message == 'game finished') {
			await this.displayResults();
			return ('janken-result');
		}
		// get the game in progress
	}

	async create_game() {
		const url = 'https://localhost:8443/auth/createJankenGame/'
		const response = await Oauth.getter(url);
		if (response.error) {
			// if (response.error == "Error: You are already playing a game") {
			// 	window.client.nextPage('janken-game');
			// } else 
			if (response.error == "Error: You are already waiting for an opponent") {
				await window.client.nextPage('janken-lobby');
			}
			alert(response.error);
			return ;
		}
		await window.client.nextPage('janken-lobby');
		document.getElementById("janken-game-in-progress-button").style.display = "block";
			// create a game waiting for an opponent
	}

	async join_game() {
		const url = 'https://localhost:8443/auth/jankenGame/'
		const response = await Oauth.getter(url);
		if (response.error) {
			alert(response.error);
			return ;
		}
		await window.client.nextPage('janken-game');
		document.getElementById("janken-game-in-progress-button").style.display = "block";
			// join a game waiting for an opponent
	}

	async play(choice) {
		const url = 'https://localhost:8443/auth/jankenGame/'
		const data = {
			'input': choice,
		};
		const response = await Oauth.poster(url, data);
		if (response.error) {
			alert(response.error);
			return ;
		}
		await window.client.nextPage('janken-already-played');
	}

	async waitForOpponent() {
		const url = 'https://localhost:8443/auth/waitForOpponent/'
		const response = await Oauth.getter(url);
		if (response.error) {
			return ;
		}
		clearInterval(localStorage.getItem('id_interval_game_waiting'));
		localStorage.removeItem('id_interval_game_waiting');
		if (document.getElementById('janken-lobby').style.display != 'none') {
			await window.client.nextPage('janken-game');
		} else {
			alert(response.opponent + "joined your game !")
			document.getElementById('janken-button').style.setProperty('--display-before', 'flex');
			document.getElementById('janken-game-in-progress-button').style.setProperty('--display-before', 'flex');
		}
	}		
		
	async waitResults() {
		const url = 'https://localhost:8443/auth/waitForResults/'
		const response = await Oauth.getter(url);
		if (response.error) {
			if (response.error == 'Error: You are not part of a game')
				clearInterval(localStorage.getItem('id_interval_wait_results'));
			return ;
		}
		clearInterval(localStorage.getItem('id_interval_wait_results'));
		localStorage.removeItem('id_interval_wait_results');
		if (document.getElementById('janken-already-played').style.display != 'none')
			await window.client.nextPage('janken-result');
		else
			alert("The game is finished !")
		// wait for the results
	}

	async displayResults() {
		
		clearInterval(localStorage.getItem('id_interval_wait_results'));
		localStorage.removeItem('id_interval_wait_results');
		const url = 'https://localhost:8443/auth/getResults/'
		const response = await Oauth.getter(url);
		if (response.error) {
			alert(response.error);
			return ;
		}
		var div = document.getElementById('janken-result-text');
		div.textContent = response.creator + " played " + response.creator_choice + " and " + response.opponent + " played " + response.opponent_choice + ". ";
		if (response.winner == response.myself) {
			div.textContent += "You " + response.result + " !";
			div.style.backgroundColor = "green";
		}
		else if (response.result == "draw") {
			div.textContent += "It's a draw !";
			div.style.backgroundColor = "yellow";
		}
		else {
			div.textContent += response.winner + " " + response.result + " !";
			div.style.backgroundColor = "red";
		}
	}
	
	async cancel_game() {
		const url = 'https://localhost:8443/auth/deleteMyJankenGameCreation/'
		const response = await Oauth.getter(url);
		if (response.error) {
			alert(response.error);
			return ;
		}
		await window.client.nextPage('janken');
		clearInterval(localStorage.getItem('id_interval_game_waiting'));
		localStorage.removeItem('id_interval_game_waiting');
		// cancel the game
	}
}