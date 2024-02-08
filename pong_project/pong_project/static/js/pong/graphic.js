import { BOARD_HEIGHT, BOARD_WIDTH, MARGIN, STATUS_ENDED_1, STATUS_ENDED_2, STATUS_PAUSED, STATUS_WAITING } from './state.js';

const canvas = document.getElementById("game-canvas");
const ctx = canvas.getContext("2d");

const palette = {
	c1: "#2B2A4C", /* purple */
	c2: "#B31312", /* red */
	c3: "#EA906C", /* flesh */
	c4: "#EEE2DE", /* light grey */
}

const SHADOW = "#252442";
const SHADOW_OFFSET_X = 5;
const SHADOW_OFFSET_Y = 5;

const FSIZE = 24;
const DOUBLE_FSIZE = 48;

function draw_rect_fill(x, y, w, h, color) {
	ctx.fillStyle = color;
	ctx.fillRect(x, y, w, h);
}

function draw_rect(x, y, w, h, line_width, color) {
	ctx.beginPath();
	ctx.rect(x, y, w, h);
	ctx.strokeStyle = color;
	ctx.lineWidth = line_width;
	ctx.stroke();
}

function draw_text(text, x, y, color) {
	ctx.fillStyle = color;
	ctx.fillText(text, x, y);
}

function load_font() {
	const font_url = window.ASSETS_URL + "code-page-437.ttf";
	const font_file = new FontFace("Code Page 437", `url(${font_url})`);

	font_file.load().then(
		() => {
			document.fonts.add(font_file);
			ctx.font = '24px "Code Page 437"';
		},
		(err) => {
			console.error("Font loading error:", err);
		}
	);
}

load_font();

export function draw_state(state) {
	/* Draw the background */
	draw_rect_fill(0, 0, BOARD_WIDTH, BOARD_HEIGHT, palette.c1);

	/* Draw the walls */
	draw_rect_fill(state.top_wall.position.x, state.top_wall.position.y, state.top_wall.size.x, state.top_wall.size.y, palette.c4);
	draw_rect_fill(state.bot_wall.position.x, state.bot_wall.position.y, state.bot_wall.size.x, state.bot_wall.size.y, palette.c4);
	draw_rect_fill(state.left_wall.position.x, state.left_wall.position.y, state.left_wall.size.x, state.left_wall.size.y, palette.c4);
	draw_rect_fill(state.right_wall.position.x, state.right_wall.position.y, state.right_wall.size.x, state.right_wall.size.y, palette.c4);

	/* Draw the vertical line in the middle of the table */
	draw_rect_fill(((BOARD_WIDTH - (MARGIN / 2)) / 2), 0, MARGIN / 2, BOARD_HEIGHT, palette.c4);

	/* Draw the net */
	draw_rect_fill(state.net.position.x + SHADOW_OFFSET_X, state.net.position.y + SHADOW_OFFSET_Y - state.net.size.y - 1, state.net.size.x - SHADOW_OFFSET_X, state.net.size.y + 2, SHADOW);
	draw_rect_fill(state.net.position.x, state.net.position.y, state.net.size.x, state.net.size.y, palette.c4);

	/* Draw scores */
	draw_text(state.score1, BOARD_WIDTH - DOUBLE_FSIZE + SHADOW_OFFSET_X, ((BOARD_HEIGHT / 2) + FSIZE) + SHADOW_OFFSET_Y, SHADOW);
	draw_text(state.score2, BOARD_WIDTH - DOUBLE_FSIZE + SHADOW_OFFSET_X, ((BOARD_HEIGHT / 2) - (FSIZE / 3)) + SHADOW_OFFSET_Y, SHADOW);
	draw_text(state.score1, BOARD_WIDTH - DOUBLE_FSIZE, (BOARD_HEIGHT / 2) + FSIZE, palette.c4);
	draw_text(state.score2, BOARD_WIDTH - DOUBLE_FSIZE, (BOARD_HEIGHT / 2) - (FSIZE / 3), palette.c4);

	/* Draw ball, paddles and particles */
	if (state.particles.length === 0) {
		draw_rect_fill(state.ball.position.x + SHADOW_OFFSET_X, state.ball.position.y + SHADOW_OFFSET_Y, state.ball.size.x, state.ball.size.y, SHADOW);
	} else {
		state.particles.forEach(p => {
			draw_rect_fill(p.r.position.x + SHADOW_OFFSET_X, p.r.position.y + SHADOW_OFFSET_Y, p.r.size.x, p.r.size.y, SHADOW);
		});
	}
	draw_rect_fill(state.player1.position.x + SHADOW_OFFSET_X, state.player1.position.y + SHADOW_OFFSET_Y, state.player1.size.x, state.player1.size.y, SHADOW);
	draw_rect_fill(state.player2.position.x + SHADOW_OFFSET_X, state.player2.position.y + SHADOW_OFFSET_Y, state.player2.size.x, state.player2.size.y, SHADOW);
	if (state.particles.length === 0) {
		draw_rect_fill(state.ball.position.x, state.ball.position.y, state.ball.size.x, state.ball.size.y, palette.c3);
	} else {
		state.particles.forEach(p => {
			draw_rect_fill(p.r.position.x, p.r.position.y, p.r.size.x, p.r.size.y, palette.c3);
		});
	}
	draw_rect_fill(state.player1.position.x, state.player1.position.y, state.player1.size.x, state.player1.size.y, palette.c3);
	draw_rect_fill(state.player2.position.x, state.player2.position.y, state.player2.size.x, state.player2.size.y, palette.c3);

	/* Draw message boxes */
	if (state.status === STATUS_WAITING || state.status === STATUS_PAUSED) {

		const text = state.status === STATUS_WAITING ? "Hit 'Space' to start" : "Paused";
		const padding = 10;

		const text_w = ctx.measureText(text).width;
		const text_x = (BOARD_WIDTH - text_w) / 2;
		const text_y = (BOARD_HEIGHT + FSIZE / 2) / 2;

		const box_w = text_w + padding * 2;
		const box_h = DOUBLE_FSIZE;
		const box_x = (BOARD_WIDTH - box_w) / 2;
		const box_y = (BOARD_HEIGHT - box_h) / 2;

		/* Draw box */
		draw_rect(box_x + SHADOW_OFFSET_X - 1, box_y + SHADOW_OFFSET_Y - 1, box_w, box_h, 4, SHADOW);
		draw_rect(box_x, box_y, box_w, box_h, 4, palette.c4);
		draw_rect_fill(box_x, box_y, box_w, box_h, palette.c1);

		/* Draw text */
		draw_text(text, text_x + SHADOW_OFFSET_X, text_y + SHADOW_OFFSET_Y, SHADOW);
		draw_text(text, text_x, text_y, palette.c4);

	} else if (state.status === STATUS_ENDED_1 || state.status === STATUS_ENDED_2) {

		const text_victory = state.status === STATUS_ENDED_1 ? "Player 1 won !" : "Player 2 won !";
		const text_again = "Hit 'Space' to play again";
		const text_quit = "or 'Escape' to quit";
		const fourth = BOARD_HEIGHT / 4;
		const padding = 10;

		let text_w = ctx.measureText(text_victory).width;
		let box_w = text_w + padding * 2;
		let box_h = DOUBLE_FSIZE;
		let box_x = (BOARD_WIDTH - box_w) / 2;
		let box_y = state.status === STATUS_ENDED_1 ? ((BOARD_HEIGHT - box_h) / 2) + fourth : ((BOARD_HEIGHT - box_h) / 2) - fourth;

		let text_x = (BOARD_WIDTH - text_w) / 2;
		let text_y = state.status === STATUS_ENDED_1 ? ((BOARD_HEIGHT + FSIZE / 2) / 2) + fourth : ((BOARD_HEIGHT + FSIZE / 2) / 2) - fourth;

		/* Draw victory box */
		draw_rect(box_x + SHADOW_OFFSET_X - 1, box_y + SHADOW_OFFSET_Y - 1, box_w, box_h, 4, SHADOW);
		draw_rect(box_x, box_y, box_w, box_h, 4, palette.c4);
		draw_rect_fill(box_x, box_y, box_w, box_h, palette.c1);

		/* Draw victory text */
		draw_text(text_victory, text_x + SHADOW_OFFSET_X, text_y + SHADOW_OFFSET_Y, SHADOW);
		draw_text(text_victory, text_x, text_y, palette.c4);

		let text_again_w = ctx.measureText(text_again).width;
		let text_quit_w = ctx.measureText(text_quit).width;
		let max_text_w = Math.max(text_again_w, text_quit_w);

		box_w = max_text_w + padding * 2;
		box_h = 2 * DOUBLE_FSIZE;
		box_x = (BOARD_WIDTH - box_w) / 2;
		box_y = (BOARD_HEIGHT - box_h) / 2;

		let text_again_x = (BOARD_WIDTH - text_again_w) / 2;
		let text_quit_x = (BOARD_WIDTH - text_quit_w) / 2;

		let text_again_y = box_y + FSIZE + padding;
		let text_quit_y = box_y + box_h - FSIZE;

		/* Draw info box */
		draw_rect(box_x + SHADOW_OFFSET_X - 1, box_y + SHADOW_OFFSET_Y - 1, box_w, box_h, 4, SHADOW);
		draw_rect(box_x, box_y, box_w, box_h, 4, palette.c4);
		draw_rect_fill(box_x, box_y, box_w, box_h, palette.c1);

		/* Draw info text */
		draw_text(text_again, text_again_x + SHADOW_OFFSET_X, text_again_y + SHADOW_OFFSET_Y, SHADOW);
		draw_text(text_quit, text_quit_x + SHADOW_OFFSET_X, text_quit_y + SHADOW_OFFSET_Y, SHADOW);
		draw_text(text_again, text_again_x, text_again_y, palette.c4);
		draw_text(text_quit, text_quit_x, text_quit_y, palette.c4);
	}
}
