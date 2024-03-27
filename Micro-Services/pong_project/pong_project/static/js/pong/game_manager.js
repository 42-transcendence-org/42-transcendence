import * as g from './global.js';
import * as ai from './ai.js';
import * as game from './game.js';
import * as sound from './sound.js';
import * as input from './input.js';
import * as snapshot from './snapshot.js';
import * as graphics from './graphics.js';

export class GameManager {
	constructor() {
		this.game = null;
		this.game_id = undefined;
		this.game_type = undefined;
		this.game_result = [];
		this.aliases = ["Player 1", "Player 2"];
		this.request_id = undefined;
		this.event_source = null;

		this.timestep = g.TIMESTEP;
		this.local_tick = 0;
		this.remote_tick = -1;
		this.latest_server_tick = 0;
		this.accumulator = 0.0;
		this.frame_duration = 0.0;
		this.remote_send_rate = g.REMOTE_SEND_RATE;
		this.last_time = performance.now();

		this.ai = new ai.AIManager()
		this.input = new input.InputManager();
		this.sound = new sound.SoundManager();
		this.graphics = new graphics.GraphicsManager();
		this.snapshot = new snapshot.SnapshotManager();
	}
	
	eventlisteners() {
		document.addEventListener('keydown', (event) => this.input.key_handler(event));
		document.addEventListener('keyup', (event) => this.input.key_handler(event));
		document.getElementById('local-button').addEventListener('click', () => this.game_create(g.TYPE_LOCAL));
		document.getElementById('remote-button').addEventListener('click', () => this.game_create(g.TYPE_REMOTE));
		document.getElementById('ai-button').addEventListener('click', () => this.game_create(g.TYPE_AI));
	}

	reset() {
		this.game = null;
		this.game_id = undefined;
		this.game_type = undefined;
		this.game_result = [];
		this.aliases = ["Player 1", "Player 2"];
		this.request_id = undefined;
		this.event_source = null;

		this.timestep = g.TIMESTEP;
		this.local_tick = 0;
		this.remote_tick = -1;
		this.latest_server_tick = 0;
		this.accumulator = 0.0;
		this.frame_duration = 0.0;
		this.remote_send_rate = g.REMOTE_SEND_RATE;
		this.last_time = performance.now();

		this.ai = new ai.AIManager()
		this.input = new input.InputManager();
		this.sound = new sound.SoundManager();
		this.graphics = new graphics.GraphicsManager();
		this.snapshot = new snapshot.SnapshotManager();
	}

	update_remote_tick() {

		if (this.remote_tick < 0) {
			this.remote_tick = this.latest_server_tick - (this.remote_send_rate * 2);
			return;
		}

		const diff = this.latest_server_tick - this.remote_tick;

		if (diff >= this.remote_send_rate * 3) {
			this.remote_tick += Math.min(diff - (this.remote_send_rate * 2), (this.remote_send_rate * 4))
		} else if (diff >= 0 && diff < this.remote_send_rate) {
			this.remote_tick -= 1;
		} else if (diff < 0 && Math.abs(diff) <= this.remote_send_rate * 2) {
			this.remote_tick -= this.remote_send_rate;
		} else if (diff < 0 && Math.abs(diff) > this.remote_send_rate * 2) {
			this.remote_tick = this.latest_server_tick - (this.remote_send_rate * 2);
		}
	}

	update_loop() {
		this.request_id = requestAnimationFrame(this.update_loop.bind(this));

		let curr_time = performance.now();

		/* Convert to seconds */
		this.frame_duration = (curr_time - this.last_time) / 1000;

		/* Cap to avoid the 'spriral of death' */
		if (this.frame_duration > 0.25)
			this.frame_duration = 0.25;

		this.last_time = curr_time;

		this.accumulator += this.frame_duration;

		while (this.accumulator >= this.timestep) {

			this.local_tick += 1;
			if (this.remote_tick >= 0) {
				this.remote_tick += 1;
			}

			if (this.game_type == g.TYPE_AI && this.game.status == g.STATUS_ACTIVE && this.game.particle_pool.get_n_actives() === 0) {
				let input = this.ai.refresh(this.game, this.timestep);
				this.input.create_input(g.ID_PLAYER2, input);
			}

			this.input.process_inputs(this.game_id, this.game, this.local_tick);

			if (this.game_type != g.TYPE_REMOTE) {
				this.game.update(this.timestep);

				if (this.game.status === g.STATUS_ENDED) {
					if (this.game_type === g.TYPE_TOURNY) {
						this.game.status = g.STATUS_QUIT;
					}
					this.save_game_result();
				}

				this.snapshot.save_state(this.game, this.local_tick);
			}

			this.accumulator -= this.timestep;
		}

		if (this.game.status === g.STATUS_QUIT) {
			this.game_destroy();
			return;
		}

		let alpha = undefined;
		let interpolated_snapshots = undefined;
		if (this.game_type === g.TYPE_REMOTE) {
			interpolated_snapshots = this.snapshot.get_interpolated_snapshots(this.remote_tick);
			alpha = (this.remote_tick - interpolated_snapshots[0].tick) / (interpolated_snapshots[1].tick - interpolated_snapshots[0].tick);
		} else {
			interpolated_snapshots = this.snapshot.get_interpolated_snapshots(-1);
			alpha = this.accumulator / this.timestep;
		}

		if (this.game_type === g.TYPE_REMOTE) {
			this.sound.process_sound_events(this.remote_tick);
		} else {
			this.handle_events(this.game);
		}
		this.graphics.interpolate(interpolated_snapshots[0], interpolated_snapshots[1], alpha);
		this.graphics.render(this.game_type);
	}

	handle_events(game) {
		if (game.collision_happened) {
			game.collision_happened = false;
			this.sound.play_hit_sound();
		}
		if (game.victory_happened) {
			game.status = g.STATUS_ENDED;
			game.victory_happened = false;
			this.sound.play_victory_sound();
		}
		if (game.score_happened) {
			game.score_happened = false;
			this.sound.play_score_sound();
		}
	}

	save_game_result() {
		if (this.game_result.length === 0) {
			var game = "local";
			if (this.game_type === g.TYPE_REMOTE) {
				game = "remote";
			} else if (this.game_type === g.TYPE_AI) {
				game = "ai";
			} else if (this.game_type === g.TYPE_TOURNY) {
				game = "tournament";
			}
			var opponent = this.aliases[1];
			var winner = opponent;
			var loser = this.aliases[0];

			if (this.game.scores[0] > this.game.scores[1]) {
				winner = this.aliases[0];
				loser = this.aliases[1];
			}

			var result = "Defeat";

			if (winner === this.aliases[0]) {
				result = "Victory";
			}

			this.game_result = {
				"game_type": game,
				"opponent": opponent,
				"player_score": this.game.scores[0],
				"opponent_score": this.game.scores[1],
				"winner": winner,
				"loser": loser,
				"result": result,
			}
			// this.game_result[0] = this.game_type;
			// this.game_result[1] = this.aliases[0]; /* Player 1 name */
			// this.game_result[2] = this.aliases[1]; /* Player 2 name */
			// this.game_result[3] = this.game.scores[0]; /* Player 1 score */
			// this.game_result[4] = this.game.scores[1]; /* Player 2 score */
		}
	}

	get_game_result() {
		const r = [...this.game_result];
		this.game_result = [];
		return r;
	}

	async game_create(type) {

		if (this.game && this.game_type === type) {
			window.client.nextPage("game-div");
			return;
		}

		this.game_type = type;
		if (type === g.TYPE_TOURNY && localStorage.getItem('tournament-game-p1') && localStorage.getItem('tournament-game-p2')) {
			this.aliases[0] = localStorage.getItem('tournament-game-p1');
			this.aliases[1] = localStorage.getItem('tournament-game-p2');
		}

		document.getElementById('game-div-p1').textContent = this.aliases[1];
		document.getElementById('game-div-p2').textContent = this.aliases[0];

		try {
			if (this.game_type === g.TYPE_REMOTE) {
				await this.send_game_creation_request();

				const token = localStorage.getItem("jwt");
				const url = `http://` + window.location.host + `/${this.game_id}/?token=${encodeURIComponent(token)}`;
				this.event_source = new EventSource(url);

				this.event_source.onmessage = (event) => {
					try {

						const data = JSON.parse(event.data);
						if (!data) {
							throw new Error('Data is `null`.');
						} else if (data === "Game has ended.") {
							throw new Error('Player has disconnected.');
						} else {
							this.latest_server_tick = data[0];
							this.update_remote_tick()
							this.snapshot.save_server_data(data);
							this.sound.create_sound_events(data[5], data[8]);
						}

					} catch (error) {
						/* FIXME: Display a special page / div */
						if (error.message === 'Player has disconnected.')
							alert("Player has disconnected, the game has been ended.");
						else
							console.error('EventSource failed:', error);

						this.event_source.close();
						this.game_destroy();
						/* FIXME: Why is 'Unauthorized: you are already logged in.' appearing */
						window.client.home();
					}
				}

				this.event_source.onerror = (error) => {
					console.error('EventSource failed:', error);
					this.event_source.close();
					this.game_destroy();
				};
			}
		}
		catch (error) {
			console.error(error);
			alert("An error occured when creating the game.");
			this.game_destroy();
			return;
		}

		this.sound.play_music();
		this.game = new game.Game();
		window.client.nextPage("game-div");
		this.request_id = requestAnimationFrame(this.update_loop.bind(this));
	}

	game_destroy() {
		this.sound.stop_music();
		cancelAnimationFrame(this.request_id);
		if (this.game_type !== g.TYPE_TOURNY)
			window.client.home();
		else {
			if (localStorage.getItem('tournament-round') === "1") {
				window.client.tournament.secondGame(this.game_result['winner'], this.game_result['loser']);
			} else if (localStorage.getItem('tournament-round') === "2") {
				window.client.tournament.finalGame(this.game_result['winner'], this.game_result['loser']);
			} else if (localStorage.getItem('tournament-round') === "3") {
				window.client.tournament.displayWinner(this.game_result['winner'], this.game_result['loser']);
			}

		}
		this.reset();
	}

	game_delete() {
		this.sound.stop_music();
		cancelAnimationFrame(this.request_id);
		this.reset();
	}

	async send_game_creation_request() {
		const token = localStorage.getItem("jwt");
		const response = await fetch('https://' + window.location.host + '/game/', {
			method: 'POST',
			headers: {
				'Authorization': `Bearer ${token}`,
				'Content-Type': 'application/json',
				'X-CSRFToken': window.client.get_cookie('csrftoken'),
			},
			credentials: 'include',
		});

		const data = await response.json();

		if (!response.ok) {
			throw new Error(data.error || 'Network response was not ok.');
		}

		this.game_id = data.id
	}
}
