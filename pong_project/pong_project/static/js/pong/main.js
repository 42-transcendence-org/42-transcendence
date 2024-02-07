import * as requests from "../requests.js";
import { div_handler } from "../utils.js";

const net = new physics.Rectangle(MARGIN, (BOARD_HEIGHT - 2) / 2, BOARD_WIDTH - (2 * MARGIN), 2, 0, 0);

/* FIXME: Would be more efficient to send all inputs in one request */
document.addEventListener('keydown', (event) => {
	if (g_session === null || g_session.state === null) return;

	const time = Date.now();
	const key_name = event.key;
	if (key_name === 'a' && g_session.state.player1.velocity.x != -PADDLE_SPEED) {
		if (g_session.id != 0) requests.send_user_input(INPUT_LEFT, time);
		g_session.input_handler(ID_PLAYER1, INPUT_LEFT, time);
	} else if (key_name === 's' && g_session.state.player1.velocity.x != PADDLE_SPEED) {
		if (g_session.id != 0) requests.send_user_input(INPUT_RIGHT, time);
		g_session.input_handler(ID_PLAYER1, INPUT_RIGHT, time);
	} else if (key_name === 'k' && g_session.state.player2.velocity.x != -PADDLE_SPEED) {
		g_session.input_handler(ID_PLAYER2, INPUT_LEFT, time);
	} else if (key_name === 'l' && g_session.state.player2.velocity.x != PADDLE_SPEED) {
		g_session.input_handler(ID_PLAYER2, INPUT_RIGHT, time);
	} else if (key_name === ' ') {
		if (g_session.id != 0) requests.send_user_input(INPUT_SPACE, time);
		g_session.input_handler(ID_PLAYER1, INPUT_SPACE, time);
	} else if (key_name === 'Escape') {
		if (g_session.id != 0) requests.send_user_input(INPUT_QUIT, time);
		g_session.input_handler(ID_PLAYER1, INPUT_QUIT, time);
	}
});

document.addEventListener('keyup', (event) => {
	if (g_session === null || g_session.state === null) return;

	const time = Date.now();
	const key_name = event.key;
	if ((key_name === 'a' || key_name === 's') && g_session.state.player1.velocity.x != 0) {
		if (g_session.id != 0) requests.send_user_input(INPUT_NEUTRAL, time);
		g_session.input_handler(ID_PLAYER1, INPUT_NEUTRAL, time);
	} else if ((key_name === 'k' || key_name === 'l') && g_session.state.player2.velocity.x != 0) {
		g_session.input_handler(ID_PLAYER2, INPUT_NEUTRAL, time);
	}
});


class Input {
	constructor(id, input, time) {
		this.id = id;
		this.input = input;
		this.timestamp = time;
	}
}
class AI {
	constructor() {
	}
}

export class GameSession {
	constructor(id, type, name1, name2) {
		this.id = id;
		this.type = type;
		this.inputs = [];
		this.t = 0.0;
		this.dt = 1.0 / 60.0;
		this.accumulator = 0.0;
		this.old_time = 0.0;
		this.name1 = name1;
		this.name2 = name2;
		this.state = new GameState();

		this.ai = type === TYPE_AI ? new AI() : null;
		this.event_source = id === 0 ? null : new EventSource(`http://localhost:8000/api/games/${id}/`);

		this.update_start = this.update_start.bind(this);
		this.update_state = this.update_state.bind(this);
	}

	reconcile(data) {
	}

	update_start() {
		if (this.id != 0) {
			this.event_source.onmessage = (event) => {
				this.reconcile(JSON.parse(event.data));
			};
			this.event_source.onerror = (error) => {
				console.error('EventSource failed:', error);
				this.event_source.close();
				/* FIXME: Handle this properly */
			};
		}

		this.old_time = performance.now();
		requestAnimationFrame(this.update_state);
	}

	update_state() {
		let new_time = performance.now();
		let frame_time = new_time - this.old_time;
		this.old_time = new_time;

		/* Convert the frame time from milliseconds to seconds before adding it */
		this.accumulator += (frame_time / 1000);

		while (this.accumulator >= this.dt) {
			this.update(this.dt);
			this.accumulator -= this.dt;
			this.t += this.dt;
		}
		if (this.state.status === STATUS_QUIT) {
			sound.stop_music();
			div_handler("game-menu-div");
			g_session = null;
			return;
		}

		this.draw();
		requestAnimationFrame(this.update_state);
	}

	input_handler(id, input, time) {
		this.inputs.push(new Input(id, input, time));
	}

}
