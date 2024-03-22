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

	}

	async game_in_progress() {
		const url = 'https://localhost:8443/auth/gameInProgress/'
		const response = await Oauth.getter(url);
		if (response.error) {
			alert(response.error);
			return ('janken');
		}
		if (response.message == 'waiting for opponent') {
			alert('Waiting for opponent to join your game');
			return ('janken');
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
		localStorage.setItem('id_interval_game_waiting', setInterval(this.waitForOpponent, 100));
		// create a game waiting for an opponent
	}

	async waitForOpponent() {
		console.log("hello");
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
		

	async join_game() {
		const url = 'https://localhost:8443/auth/jankenGame/'
		const response = await Oauth.getter(url);
		if (response.error) {
			alert(response.error);
			return ;
		}
		await window.client.nextPage('janken-game');
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
		console.log(response);
		localStorage.setItem('id_interval_wait_results', setInterval(this.waitResults, 100));
		await window.client.nextPage('janken-already-played');
	}

	async waitResults() {
		const url = 'https://localhost:8443/auth/waitForResults/'
		console.log("hey");
		const response = await Oauth.getter(url);
		if (response.error) {
			if (response.error == 'Error: You are not part of a game')
				clearInterval(localStorage.getItem('id_interval_wait_results'));
			return ;
		}
		clearInterval(localStorage.getItem('id_interval_wait_results'));
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
		console.log(response);
		var div = document.getElementById('janken-result-text');
		var winner = null;
		div.textContent = response.creator + " played " + response.creator_choice + " and " + response.opponent + " played " + response.opponent_choice + ". ";
		div.textContent += "The result of the match is: ";
		if (response.opponent_choice == response.creator_choice)
			winner = "draw";
		else if (response.creator_choice == 'rock' && response.opponent_choice == 'scissors' || response.creator_choice == 'scissors' && response.opponent_choice == 'paper' || response.creator_choice == 'paper' && response.opponent_choice == 'rock')
			winner = response.creator;
		else
			winner = response.opponent;
		if (winner == "draw")
			div.textContent += " it's a draw !";
		else
			div.textContent += winner + " won !";
		if (winner == document.getElementById('banner-nickname-display').textContent)
			div.style.backgroundColor = "red";
		else if (winner == "draw")
			div.style.backgroundColor = "yellow";
		else
			div.style.backgroundColor = "green";
	}

	async amIPlaying() {
		const url = 'https://localhost:8443/auth/amIPlaying/'
		const response = await Oauth.getter(url);
		return response;
	}
}