import * as g from './global.js';
import { Rectangle } from './physics.js';

function draw_rect_fill(ctx, x, y, w, h, color) {
	ctx.fillStyle = color;
	ctx.fillRect(x, y, w, h);
}

function draw_rect(ctx, x, y, w, h, line_width, color) {
	ctx.beginPath();
	ctx.rect(x, y, w, h);
	ctx.strokeStyle = color;
	ctx.lineWidth = line_width;
	ctx.stroke();
}

function draw_text(ctx, text, x, y, color) {
	ctx.fillStyle = color;
	ctx.fillText(text, x, y);
}

function load_font(ctx) {
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

load_font(g.ctx);

const net = new Rectangle(g.BOARD_MARGIN, (g.BOARD_HEIGHT - 2) / 2, g.BOARD_WIDTH - (2 * g.BOARD_MARGIN), 2, 0, 0);
export function draw_state(ctx, session, state) {
	/* Draw the background */
	draw_rect_fill(ctx, 0, 0, g.BOARD_WIDTH, g.BOARD_HEIGHT, g.PALETTE.C1);

	/* Draw the walls */
	draw_rect_fill(ctx, 0, 0, g.BOARD_MARGIN, g.BOARD_HEIGHT, g.PALETTE.C4);
	draw_rect_fill(ctx, 0, 0, g.BOARD_WIDTH, g.BOARD_MARGIN, g.PALETTE.C4);
	draw_rect_fill(ctx, g.BOARD_WIDTH - g.BOARD_MARGIN, 0, g.BOARD_MARGIN, g.BOARD_HEIGHT, g.PALETTE.C4);
	draw_rect_fill(ctx, 0, g.BOARD_HEIGHT - g.BOARD_MARGIN, g.BOARD_WIDTH, g.BOARD_MARGIN, g.PALETTE.C4);

	/* Draw the vertical line in the middle of the table */
	draw_rect_fill(ctx, ((g.BOARD_WIDTH - (g.BOARD_MARGIN / 2)) / 2), 0, g.BOARD_MARGIN / 2, g.BOARD_HEIGHT, g.PALETTE.C4);

	/* Draw the shadows */
	draw_rect_fill(ctx, net.position.x + g.SHADOW_OFFSET_X, net.position.y + g.SHADOW_OFFSET_Y - net.size.y - 1, net.size.x - g.SHADOW_OFFSET_X, net.size.y + 2, g.SHADOW_COLOR);
	draw_text(ctx, state.score1, g.BOARD_WIDTH - g.DOUBLE_FSIZE + g.SHADOW_OFFSET_X, ((g.BOARD_HEIGHT / 2) + g.FSIZE) + g.SHADOW_OFFSET_Y, g.SHADOW_COLOR);
	draw_text(ctx, state.score2, g.BOARD_WIDTH - g.DOUBLE_FSIZE + g.SHADOW_OFFSET_X, ((g.BOARD_HEIGHT / 2) - (g.FSIZE / 3)) + g.SHADOW_OFFSET_Y, g.SHADOW_COLOR);
	if (state.particles.length != 0) {
		state.particles.forEach(p => {
			draw_rect_fill(ctx, p.r.position.x + g.SHADOW_OFFSET_X, p.r.position.y + g.SHADOW_OFFSET_Y, p.r.size.x, p.r.size.y, g.SHADOW_COLOR);
		});
	} else {
		draw_rect_fill(ctx, state.ball.position.x + g.SHADOW_OFFSET_X, state.ball.position.y + g.SHADOW_OFFSET_Y, state.ball.size.x, state.ball.size.y, g.SHADOW_COLOR);
	}
	draw_rect_fill(ctx, state.player1.position.x + g.SHADOW_OFFSET_X, state.player1.position.y + g.SHADOW_OFFSET_Y, state.player1.size.x, state.player1.size.y, g.SHADOW_COLOR);
	draw_rect_fill(ctx, state.player2.position.x + g.SHADOW_OFFSET_X, state.player2.position.y + g.SHADOW_OFFSET_Y, state.player2.size.x, state.player2.size.y, g.SHADOW_COLOR);

	/* Draw the net */
	draw_rect_fill(ctx, net.position.x, net.position.y, net.size.x, net.size.y, g.PALETTE.C4);

	/* Draw scores */
	draw_text(ctx, state.score1, g.BOARD_WIDTH - g.DOUBLE_FSIZE, (g.BOARD_HEIGHT / 2) + g.FSIZE, g.PALETTE.C4);
	draw_text(ctx, state.score2, g.BOARD_WIDTH - g.DOUBLE_FSIZE, (g.BOARD_HEIGHT / 2) - (g.FSIZE / 3), g.PALETTE.C4);

	/* Draw ball or particles */
	if (state.particles.length != 0) {
		state.particles.forEach(p => {
			draw_rect_fill(ctx, p.r.position.x, p.r.position.y, p.r.size.x, p.r.size.y, g.PALETTE.C3);
		});
	} else {
		draw_rect_fill(ctx, state.ball.position.x, state.ball.position.y, state.ball.size.x, state.ball.size.y, g.PALETTE.C3);
	}

	/* Draw paddles */
	draw_rect_fill(ctx, state.player1.position.x, state.player1.position.y, state.player1.size.x, state.player1.size.y, g.PALETTE.C3);
	draw_rect_fill(ctx, state.player2.position.x, state.player2.position.y, state.player2.size.x, state.player2.size.y, g.PALETTE.C3);

	/* Draw message boxes */
	if (state.status === g.STATUS_BEGIN || state.status === g.STATUS_PAUSED || state.status === g.STATUS_WAITING) {

		let text;
		if (state.status === g.STATUS_BEGIN) {
			text = "Hit 'Space' to start";
			if (session.type === g.TYPE_REMOTE) {
				let rdy = (session.ready1 === true ? 1 : 0) + (session.ready2 === true ? 1 : 0);
				text += ": " + rdy + "/2"
			}
		}

		else if (state.status === g.STATUS_PAUSED)
			text = "Paused";
		else
			text = "Waiting for player...";

		const padding = 10;

		const text_w = ctx.measureText(text).width;
		const text_x = (g.BOARD_WIDTH - text_w) / 2;
		const text_y = (g.BOARD_HEIGHT + g.FSIZE / 2) / 2;

		const box_w = text_w + padding * 2;
		const box_h = g.DOUBLE_FSIZE;
		const box_x = (g.BOARD_WIDTH - box_w) / 2;
		const box_y = (g.BOARD_HEIGHT - box_h) / 2;

		/* Draw box */
		draw_rect(ctx, box_x + g.SHADOW_OFFSET_X - 1, box_y + g.SHADOW_OFFSET_Y - 1, box_w, box_h, 4, g.SHADOW_COLOR);
		draw_rect(ctx, box_x, box_y, box_w, box_h, 4, g.PALETTE.C4);
		draw_rect_fill(ctx, box_x, box_y, box_w, box_h, g.PALETTE.C1);

		/* Draw text */
		draw_text(ctx, text, text_x + g.SHADOW_OFFSET_X, text_y + g.SHADOW_OFFSET_Y, g.SHADOW_COLOR);
		draw_text(ctx, text, text_x, text_y, g.PALETTE.C4);

	} else if (state.status === g.STATUS_ENDED_1 || state.status === g.STATUS_ENDED_2) {

		const text_victory = state.status === g.STATUS_ENDED_1 ? "Player 1 won !" : "Player 2 won !";
		const text_again = "Hit 'Space' to play again";
		const text_quit = "or 'Escape' to quit";
		const fourth = g.BOARD_HEIGHT / 4;
		const padding = 10;

		let text_w = ctx.measureText(text_victory).width;
		let box_w = text_w + padding * 2;
		let box_h = g.DOUBLE_FSIZE;
		let box_x = (g.BOARD_WIDTH - box_w) / 2;
		let box_y = state.status === g.STATUS_ENDED_1 ? ((g.BOARD_HEIGHT - box_h) / 2) + fourth : ((g.BOARD_HEIGHT - box_h) / 2) - fourth;

		let text_x = (g.BOARD_WIDTH - text_w) / 2;
		let text_y = state.status === g.STATUS_ENDED_1 ? ((g.BOARD_HEIGHT + g.FSIZE / 2) / 2) + fourth : ((g.BOARD_HEIGHT + g.FSIZE / 2) / 2) - fourth;

		/* Draw victory box */
		draw_rect(ctx, box_x + g.SHADOW_OFFSET_X - 1, box_y + g.SHADOW_OFFSET_Y - 1, box_w, box_h, 4, g.SHADOW_COLOR);
		draw_rect(ctx, box_x, box_y, box_w, box_h, 4, g.PALETTE.C4);
		draw_rect_fill(ctx, box_x, box_y, box_w, box_h, g.PALETTE.C1);

		/* Draw victory text */
		draw_text(ctx, text_victory, text_x + g.SHADOW_OFFSET_X, text_y + g.SHADOW_OFFSET_Y, g.SHADOW_COLOR);
		draw_text(ctx, text_victory, text_x, text_y, g.PALETTE.C4);

		let text_again_w = ctx.measureText(text_again).width;
		let text_quit_w = ctx.measureText(text_quit).width;
		let max_text_w = Math.max(text_again_w, text_quit_w);

		box_w = max_text_w + padding * 2;
		box_h = 2 * g.DOUBLE_FSIZE;
		box_x = (g.BOARD_WIDTH - box_w) / 2;
		box_y = (g.BOARD_HEIGHT - box_h) / 2;

		let text_again_x = (g.BOARD_WIDTH - text_again_w) / 2;
		let text_quit_x = (g.BOARD_WIDTH - text_quit_w) / 2;

		let text_again_y = box_y + g.FSIZE + padding;
		let text_quit_y = box_y + box_h - g.FSIZE;

		/* Draw info box */
		draw_rect(ctx, box_x + g.SHADOW_OFFSET_X - 1, box_y + g.SHADOW_OFFSET_Y - 1, box_w, box_h, 4, g.SHADOW_COLOR);
		draw_rect(ctx, box_x, box_y, box_w, box_h, 4, g.PALETTE.C4);
		draw_rect_fill(ctx, box_x, box_y, box_w, box_h, g.PALETTE.C1);

		/* Draw info text */
		draw_text(ctx, text_again, text_again_x + g.SHADOW_OFFSET_X, text_again_y + g.SHADOW_OFFSET_Y, g.SHADOW_COLOR);
		draw_text(ctx, text_quit, text_quit_x + g.SHADOW_OFFSET_X, text_quit_y + g.SHADOW_OFFSET_Y, g.SHADOW_COLOR);
		draw_text(ctx, text_again, text_again_x, text_again_y, g.PALETTE.C4);
		draw_text(ctx, text_quit, text_quit_x, text_quit_y, g.PALETTE.C4);
	}
}
