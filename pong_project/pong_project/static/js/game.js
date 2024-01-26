import { get_cookie } from './utils.js';

export let g_current_game_id = null;
export let g_current_game_data = null;

let BOARD_WIDTH = 600;
let BOARD_HEIGHT = 800;
let PADDLE_WIDTH = 64;
let PADDLE_HEIGHT = 16;
let PADDLE_DX = 1000;
let BALL_SIDE = 16;
let BALL_DX = 0;
let BALL_DY = 100;
let MARGIN = 16;

function game_create(game_type) {
	fetch('http://localhost:8000/api/games/', {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json',
			'X-CSRFToken': get_cookie("csrftoken"),
			'credentials': 'include'
		},
		body: JSON.stringify({ type: game_type }),
	})
		.then(response => response.json())
		.then(data => {
			if (data.id) {
				g_current_game_id = data.id;
				document.getElementById('game-menu-div').style.display = 'none';
				document.getElementById('game-canvas').style.display = 'block';
				game_start_loop(data.id);
			} else {
				console.error('Game creation failed');
			}
		})
		.catch(error => console.error('Error:', error));
}

let canvas = document.getElementById("game-canvas");
let ctx = canvas.getContext("2d");
function game_draw(game_state) {
	/* Clear the canvas */
	ctx.fillStyle = "black";
	ctx.fillRect(0, 0, BOARD_WIDTH, BOARD_HEIGHT);

	/* Draw the paddles and the ball */
	ctx.fillStyle = "white";
	ctx.fillRect(game_state.player1.x, BOARD_HEIGHT - (PADDLE_HEIGHT + 16), PADDLE_WIDTH, PADDLE_HEIGHT);
	ctx.fillRect(game_state.player2.x, 16, PADDLE_WIDTH, PADDLE_HEIGHT);
	ctx.fillRect(game_state.ball.x, game_state.ball.y, BALL_SIDE, BALL_SIDE);

	/* Draw scores */
	/* TODO The correct font is not used */
	ctx.font = "30px Code Page 437";
	ctx.fillText(game_state.player1.score, 20, 50);
	ctx.fillText(game_state.player2.score, 20, BOARD_HEIGHT - 30);
}

function game_start_loop(game_id) {
	let event_source = new EventSource(`http://localhost:8000/api/games/${game_id}/get/`);

	event_source.onmessage = function (event) {
		let game_state = JSON.parse(event.data);
		game_draw(game_state);
	};

	event_source.onerror = function (error) {
		console.error('EventSource failed:', error);
		event_source.close();
	};

	function game_loop() {
		requestAnimationFrame(game_loop);
	}
	requestAnimationFrame(game_loop);
}
