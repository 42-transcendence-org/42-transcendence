import * as Oauth from './Oauth.js';

export class Tournament {

	constructor() {}

	eventlisteners() {
		document.getElementById('tournament-button').addEventListener('click', () => window.client.nextPage('tournament-lobby'));
		document.getElementById('tournament-nicknames-form').addEventListener('submit', (event) => this.createTournament(event));
		document.getElementById('tournament-game-start-button').addEventListener('click', () => window.client.game_manager.game_create(3));
		document.getElementById('tournament-game-start-button-round2').addEventListener('click', () => window.client.game_manager.game_create(3));
		document.getElementById('tournament-game-start-button-final').addEventListener('click', () => window.client.game_manager.game_create(3));
		// document.getElementById('tournament-nicknames-form').addEventListener('click', (event) => this.createTournament(event));
		// document.getElementById('tournament-game-start-button').addEventListener('click', () => this.secondGame(localStorage.getItem('tournament-game-p1'), localStorage.getItem('tournament-game-p2')));
		// document.getElementById('tournament-game-start-button-round2').addEventListener('click', () => this.finalGame(localStorage.getItem('tournament-game-p1'), localStorage.getItem('tournament-game-p2')));
		// document.getElementById('tournament-game-start-button-final').addEventListener('click', () => this.displayWinner(localStorage.getItem('tournament-game-p1'), localStorage.getItem('tournament-game-p2')));
	}

	async displayWinner(winnerFinal, loserFinal) {
		document.getElementById('tournament-display-final-winner').textContent = winnerFinal;
		document.getElementById('tournament-display-final-loser').textContent = loserFinal;

		//stocker dans la blockchain le vainqueur final ici, ou les score des différents match dans 'secondgame' et 'finalgame', ou dans le back au fur et à esure et envoyer une requete depuis là bas à la fin, tout est faisable
		await window.client.nextPage('tournament-display-winner');
		window.client.inTournament = false;
	}

	finalGame(winnerGame2, loserGame2) {
		document.getElementById('tournament-display-second-match-winner').textContent = winnerGame2;
		document.getElementById('tournament-display-second-match-loser').textContent = loserGame2;
		document.getElementById('tournament-display-final-p1').textContent = localStorage.getItem('tournament-winner-game1');
		document.getElementById('tournament-display-final-p2').textContent = winnerGame2;

		localStorage.setItem('tournament-game-p1', localStorage.getItem('tournament-winner-game1')); //get ids in game through this
		localStorage.setItem('tournament-game-p2', winnerGame2);

		localStorage.setItem('tournament-round', 3);
		localStorage.removeItem('tournament-winner-game1');
		window.client.nextPage('tournament-display-final');
	}

	//call this when 1st game ends
	secondGame(winnerGame1, loserGame1) {
		document.getElementById('tournament-display-first-match-winner').textContent = winnerGame1;
		document.getElementById('tournament-display-first-match-loser').textContent = loserGame1;
		document.getElementById('tournament-display-round2-p1').textContent = localStorage.getItem('tournament-p3');
		document.getElementById('tournament-display-round2-p2').textContent = localStorage.getItem('tournament-p4');
		localStorage.setItem('tournament-winner-game1', winnerGame1);
		
		localStorage.setItem('tournament-game-p1', localStorage.getItem('tournament-p3')); //get ids in game through this
		localStorage.setItem('tournament-game-p2', localStorage.getItem('tournament-p4'));

		localStorage.removeItem('tournament-p3');
		localStorage.removeItem('tournament-p4');
		localStorage.setItem('tournament-round', 2);

		window.client.nextPage('tournament-display-round2');
	}


	async createTournament(event) {
		if (event)
			event.preventDefault();
		const data = [
			document.getElementById('tournament-host-nickname').innerText,
			document.getElementById('tournament-player-2').value,
			document.getElementById('tournament-player-3').value,
			document.getElementById('tournament-player-4').value,
		]

		document.getElementById('tournament-host-nickname').value = '';
		document.getElementById('tournament-player-2').value = '';
		document.getElementById('tournament-player-3').value = '';
		document.getElementById('tournament-player-4').value = '';

		console.log(this.shuffleArray(data));

		document.getElementById('tournament-display-p1').textContent = data[0];
		document.getElementById('tournament-display-p2').textContent = data[1];
		document.getElementById('tournament-display-p3').textContent = data[2];
		document.getElementById('tournament-display-p4').textContent = data[3];

		
		localStorage.setItem('tournament-p3', data[2]);
		localStorage.setItem('tournament-p4', data[3]);

		localStorage.setItem('tournament-game-p1', data[0]);  //get ids in game through this
		localStorage.setItem('tournament-game-p2', data[1]);
		localStorage.setItem('tournament-round', 1);

		window.client.inTournament = true;
		window.client.nextPage('tournament-display-start');

	}
	shuffleArray(array) {
		for (let i = array.length - 1; i > 0; i--) {
			const j = Math.floor(Math.random() * (i + 1));
			[array[i], array[j]] = [array[j], array[i]];
		}
		return array;
	}

}