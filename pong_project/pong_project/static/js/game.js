
/* The original game data as it receive upon game creation */
export let g_current_game_data = null;
/* The updated game state received from the server */
export let g_current_game_data_server = null;
/* The game state maintained by the client */
export let g_current_game_data_local = null;

export let LEFT = 1;
export let RIGHT = 2;

let g_players_inputs = [0, 0];

let BOARD_WIDTH = 600;
let BOARD_HEIGHT = 800;
let PADDLE_WIDTH = 64;
let PADDLE_HEIGHT = 16;
let PADDLE_DX = 1000;
let BALL_SIDE = 16;
let BALL_DX = 0;
let BALL_DY = 100;
let MARGIN = 16;

export function set_current_game_data(data) {
	g_current_game_data = data;
}

export function set_current_game_data_server(data) {
	g_current_game_data_server = data;
}

export function set_current_game_data_local(data) {
	g_current_game_data_local = data;
}

export function set_player_input(player, input) {
	g_players_inputs[player] = input;
}

function game_update_state(dt) {
	let state = g_current_game_data_local;
	let ball = state.ball;
	let p1 = state.player1;
	let p2 = state.player2;
	let score1 = state.player1.score;
	let score2 = state.player2.score;
	let who_scored = 0;

	/* Move Player 1's paddle */
	if (g_players_inputs[0] === LEFT && p1.x - PADDLE_DX * dt > MARGIN) {
		p1.x -= PADDLE_DX * dt;
	} else if (g_players_inputs[0] === RIGHT && p1.x + PADDLE_WIDTH + PADDLE_DX * dt < BOARD_WIDTH - MARGIN) {
		p1.x += PADDLE_DX * dt;
	}
	/* Move Player 2's paddle */
	if (g_players_inputs[1] === LEFT && p2.x - PADDLE_DX * dt > MARGIN) {
		p2.x -= PADDLE_DX * dt;
	} else if (g_players_inputs[1] === RIGHT && p2.x + PADDLE_WIDTH + PADDLE_DX * dt < BOARD_WIDTH - MARGIN) {
		p2.x += PADDLE_DX * dt;
	}

	/* Move the ball */
	ball.x += ball.dx * dt;
	ball.y += ball.dy * dt;

	/* Check for collisions between the ball and the walls */
	if (ball.x <= 0) { 	/* Left wall */
		ball.x = 0;
		ball.dx *= -1;
	} else if (ball.x + BALL_SIDE >= BOARD_WIDTH) {  /* Right wall */
		ball.x = BOARD_WIDTH - BALL_SIDE
		ball.dx *= -1;
	} else if (ball.y <= 0) { /* Top wall */
		score1 += 1;
		who_scored = 1;
	} else if (ball.y + BALL_SIDE >= BOARD_HEIGHT) {  /* Bottom wall */
		score2 += 1;
		who_scored = 2;
	}

	if (score1 == 10 || score2 == 10) {
		/* A player won, end the game */
		state.status = "ended";
	} else if (who_scored != 0) {
		/* A player scored, reset the ball position */
		ball.x = (BOARD_WIDTH - BALL_SIDE) / 2;
		ball.y = (BOARD_HEIGHT - BALL_SIDE) / 2;
		ball.dx = BALL_DX;
		if (who_scored == 1) ball.dy = BALL_DY;
		else ball.dy = -BALL_DY;
	}

	/* Check for collisions between the ball and the paddles */
	if ((ball.y + BALL_SIDE >= p1.y && ball.x + BALL_SIDE >= p1.x && ball.x <= p1.x + PADDLE_WIDTH)
		|| (ball.y <= p2.y + PADDLE_HEIGHT && ball.x + BALL_SIDE >= p2.x && ball.x <= p2.x + PADDLE_WIDTH)) {
		ball.dy *= -1
	}
}

let accumulator = 0.0;
let lastFrameTime = performance.now();
const fixedTimestep = 1 / 60;

function game_loop() {
	let currentFrameTime = performance.now();
	let frameTime = (currentFrameTime - lastFrameTime) / 1000;
	lastFrameTime = currentFrameTime;

	accumulator += frameTime;

	while (accumulator >= fixedTimestep) {
		game_update_state(fixedTimestep);
		accumulator -= fixedTimestep;
	}
	game_draw(g_current_game_data_local);
	requestAnimationFrame(game_loop);
}

function game_reconcile() {
	let lo = g_current_game_data_local;
	let serv = g_current_game_data_server;
	lo.player1.x = serv.player1.x;
	lo.player1.score = serv.player1.score;
	lo.player2.x = serv.player2.x;
	lo.player2.score = serv.player1.score;
	lo.ball.x = serv.ball.x;
	lo.ball.y = serv.ball.y;
	lo.ball.dx = serv.ball.dx;
	lo.ball.dy = serv.ball.dy;
}

export function game_start_loop() {
	let event_source = new EventSource(`http://localhost:8000/api/games/${g_current_game_data.id}/get/`);

	event_source.onmessage = function (event) {
		let game_state = JSON.parse(event.data);
		g_current_game_data_server = game_state;
		// game_reconcile();
	};
	event_source.onerror = function (error) {
		console.error('EventSource failed:', error);
		event_source.close();
	};
	requestAnimationFrame(game_loop);
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
	ctx.font = "30px Arial";
	ctx.fillText(game_state.player1.score, 20, 50);
	ctx.fillText(game_state.player2.score, 20, BOARD_HEIGHT - 30);
}
