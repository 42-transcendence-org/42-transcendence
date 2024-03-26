export class Tournament {

	constructor() {}

	eventlisteners() {
		document.getElementById('tournament-button').addEventListener('click', () => window.client.nextPage('tournament-lobby'));
		document.getElementById('new-tournament-4p-button').addEventListener('click', () => this.tournamentCreation(4));
		document.getElementById('new-tournament-8p-button').addEventListener('click', () => this.tournamentCreation(8));
		document.getElementById('new-tournament-16p-button').addEventListener('click', () => this.tournamentCreation(16));
		document.getElementById('new-tournament-32p-button').addEventListener('click', () => this.tournamentCreation(32));
		document.getElementById('tournament-nicknames-form').addEventListener('submit', () => this.createTournament());
	}

	async tournament() {
		// const url = 'https://localhost:8443/auth/tournament';
		// const response = await Oauth.getter(url);


		// if not in a tournament, do:

		// window.client.nextPage('tournament-lobby');

		
	}
	// <label for="">Player 1</label>
	// 				<input type="text" id="username_login" name="username" autocomplete="username" required></input>

	async tournamentCreation(nb_players) {

		document.getElementById('tournament-host-nickname').innerHTML = document.getElementById('banner-nickname-display').innerHTML;
		let form = document.getElementById('tournament-nicknames-form');
		form.innerHTML = '';
		for (let i = 1; i < nb_players; i++) {
			
			document.createElement('label').innerHTML = `Player ${i + 1}`;
			document.createElement('input').setAttribute('type', 'text');
			document.createElement('input').setAttribute('id', `player-${i}-nickname`);
			document.createElement('input').setAttribute('name', 'username');
			document.createElement('input').setAttribute('autocomplete', 'username');
			document.createElement('input').setAttribute('required', '');
			form.appendChild(document.createElement('label'));
			form.appendChild(document.createElement('input'));

		}
		// let button = document.createElement('button').setAttribute('type', 'submit');
		// button.innerHTML = 'Create Tournament';
		// form.appendChild(button);

		// await window.client.nextPage('tournament-nicknames');

	}

	async createTournament() {
		nb_players = document.getElementById('tournament-nicknames-form').children.length;

		data = {
			'host': document.getElementById('tournament-host-nickname').innerHTML,
			'players': []
		}

		for (let i = 1; i < nb_players; i++) {
			data['players'].push(document.getElementById(`player-${i}-nickname`).value);
		}


		console.log(data);
	}

}