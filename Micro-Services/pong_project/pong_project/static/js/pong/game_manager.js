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

	reset() {
		this.game = null;
		this.game_id = undefined;
		this.game_type = undefined;
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

		if (this.remote_tick === -1) {
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
			this.remote_tick += 1;

			/* TODO Find a way to prevent the AI from preshoting the ball during the explosion animation */
			if (this.game_type == g.TYPE_AI && this.game.status == g.STATUS_ACTIVE) {
				let input = this.ai.refresh(this.game, this.timestep);
				this.input.create_input(g.ID_PLAYER2, input);
			}

			this.input.process_inputs(this.game_id, this.game, this.local_tick);

			if (this.game_type != g.TYPE_REMOTE) {
				this.game.update(this.timestep);
				this.handle_events();
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

		this.graphics.interpolate(interpolated_snapshots[0], interpolated_snapshots[1], alpha);
		this.graphics.render(this.game_type);
	}

	handle_events() {
		if (this.game.collision_happened) {
			this.game.collision_happened = false;
			this.sound.play_hit_sound();
		}
		if (this.game.victory_happened) {
			this.game.status = g.STATUS_ENDED;
			this.game.victory_happened = false;
			this.sound.play_victory_sound();
		}
		if (this.game.score_happened) {
			this.game.score_happened = false;
			this.sound.play_score_sound();
		}
	}

	async game_create(type) {
		if (this.game) {
			window.client.show_div("game-div");
			return;
		}

		this.game_type = type;

		try {
			if (this.game_type === g.TYPE_REMOTE) {
				await this.send_game_creation_request();

				const token = localStorage.getItem("jwt");
				const url = `http://localhost:8003/${this.game_id}/?token=${encodeURIComponent(token)}`;
				this.event_source = new EventSource(url);

				this.event_source.onmessage = (event) => {
					const data = JSON.parse(event.data);

					this.latest_server_tick = data[0];
					this.update_remote_tick()
					this.snapshot.save_server_data(data);

				};

				this.event_source.onerror = (error) => {
					console.error('EventSource failed:', error);
					this.event_source.close();
					this.game_destroy();
				};

			}
		} catch (error) {
			console.error(error);
			alert("An error occured when creating the game.");
			return;
		}

		this.sound.play_music();
		this.game = new game.Game();
		window.client.show_div("game-div");
		this.request_id = requestAnimationFrame(this.update_loop.bind(this));
	}

	game_destroy() {
		this.sound.stop_music();
		cancelAnimationFrame(this.request_id);
		window.client.show_div("game-menu-div");
		this.reset();
	}

	async send_game_creation_request() {
		const token = localStorage.getItem("jwt");
		const response = await fetch('https://localhost:8443/game/', {
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
