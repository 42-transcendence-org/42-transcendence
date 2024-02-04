const palette = {
	c1: "#2B2A4C", /* purple */
	c2: "#B31312", /* red */
	c3: "#EA906C", /* flesh */
	c4: "#EEE2DE", /* light grey */
}
const shadow = "#252442";
const shadow_offset_x = 5;
const shadow_offset_y = 5;

const fsize = 24;
const double_fsize = 48;

const net = new physics.Rectangle(MARGIN, (canvas.height - 2) / 2, canvas.width - (2 * MARGIN), 2, 0, 0);

const canvas = document.getElementById("game-canvas");
const ctx = canvas.getContext("2d");

export function draw_line(ctx, p1, p2, color) {
	ctx.beginPath();
	ctx.moveTo(p1.x, p1.y);
	ctx.lineTo(p2.x, p2.y);
	ctx.strokeStyle = color;
	ctx.stroke();
}

export function draw_disc(ctx, x, y, radius, color) {
	ctx.beginPath();
	ctx.arc(x, y, radius, 0, Math.PI * 2, true);
	ctx.fillStyle = color;
	ctx.fill();
}

export function draw_circle(ctx, x, y, radius, color) {
	ctx.beginPath();
	ctx.arc(x, y, radius, 0, Math.PI * 2, true);
	ctx.strokeStyle = color;
	ctx.stroke();
}

export function draw_rect_fill(ctx, x, y, w, h, color) {
	ctx.fillStyle = color;
	ctx.fillRect(x, y, w, h);
}

export function draw_rect(ctx, x, y, w, h, line_width, color) {
	ctx.beginPath();
	ctx.rect(x, y, w, h);
	ctx.strokeStyle = color;
	ctx.lineWidth = line_width;
	ctx.stroke();
}

export function load_font(ctx) {
	const font_url = assets_url + "code-page-437.ttf";
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

export function draw_state(s) {
	/* Draw the background */
	graphics.draw_rect_fill(ctx, 0, 0, canvas.width, canvas.height, palette.c1);

	/* Draw the margin */
	graphics.draw_rect_fill(ctx, 0, 0, MARGIN, canvas.height, palette.c4);
	graphics.draw_rect_fill(ctx, 0, 0, canvas.width, MARGIN, palette.c4);
	graphics.draw_rect_fill(ctx, canvas.width - MARGIN, 0, MARGIN, canvas.height, palette.c4);
	graphics.draw_rect_fill(ctx, 0, canvas.height - MARGIN, canvas.width, MARGIN, palette.c4);

	/* Draw the vertical line in the middle of the table */
	graphics.draw_rect_fill(ctx, ((canvas.width - (MARGIN / 2)) / 2), 0, MARGIN / 2, canvas.height, palette.c4);

	/* Draw the net's shadow */
	graphics.draw_rect_fill(ctx, net.position.x + shadow_offset_x, net.position.y + shadow_offset_y - net.size.y - 1, net.size.x - shadow_offset_x, net.size.y + 2, shadow);

	/* Draw the net */
	graphics.draw_rect_fill(ctx, net.position.x, net.position.y, net.size.x, net.size.y, palette.c4);

	/* Draw scores shadows */
	ctx.fillStyle = shadow
	ctx.fillText(s.score1, canvas.width - double_fsize + shadow_offset_x, ((canvas.height / 2) + fsize) + shadow_offset_y);
	ctx.fillText(s.score2, canvas.width - double_fsize + shadow_offset_x, ((canvas.height / 2) - (fsize / 3)) + shadow_offset_y);

	/* Draw scores */
	ctx.fillStyle = palette.c4;
	ctx.fillText(s.score1, canvas.width - double_fsize, (canvas.height / 2) + fsize);
	ctx.fillText(s.score2, canvas.width - double_fsize, (canvas.height / 2) - (fsize / 3));

	/* Draw the paddles and the ball shadows */
	if (particles.length === 0) {
		graphics.draw_rect_fill(ctx, s.ball.position.x + shadow_offset_x, s.ball.position.y + shadow_offset_y, s.ball.size.x, s.ball.size.y, shadow);
	} else {
		particles.forEach(p => {
			graphics.draw_rect_fill(ctx, p.r.position.x + shadow_offset_x, p.r.position.y + shadow_offset_y, p.r.size.x, p.r.size.y, shadow);
		});
	}
	graphics.draw_rect_fill(ctx, s.player1.position.x + shadow_offset_x, s.player1.position.y + shadow_offset_y, s.player1.size.x, s.player1.size.y, shadow);
	graphics.draw_rect_fill(ctx, s.player2.position.x + shadow_offset_x, s.player2.position.y + shadow_offset_y, s.player2.size.x, s.player2.size.y, shadow);

	/* Draw the paddles and the ball */
	if (particles.length === 0) {
		graphics.draw_rect_fill(ctx, s.ball.position.x, s.ball.position.y, s.ball.size.x, s.ball.size.y, palette.c3);
	} else {
		particles.forEach(p => {
			graphics.draw_rect_fill(ctx, p.r.position.x, p.r.position.y, p.r.size.x, p.r.size.y, palette.c3);
		});
	}
	graphics.draw_rect_fill(ctx, s.player1.position.x, s.player1.position.y, s.player1.size.x, s.player1.size.y, palette.c3);
	graphics.draw_rect_fill(ctx, s.player2.position.x, s.player2.position.y, s.player2.size.x, s.player2.size.y, palette.c3);


	if (s.status === "waiting") {
		const text = "Press 'Space' to start";
		const padding = 10;
		const text_width = ctx.measureText(text).width;
		const text_x = (canvas.width - text_width) / 2;
		const text_y = (canvas.height + fsize / 2) / 2;
		const box_w = text_width + padding * 2;
		const box_h = double_fsize;
		const box_x = (canvas.width - box_w) / 2;
		const box_y = (canvas.height - box_h) / 2;

		/* Draw box shadow */
		graphics.draw_rect(ctx, box_x + shadow_offset_x - 1, box_y + shadow_offset_y - 1, box_w, box_h, 4, shadow);
		graphics.draw_rect_fill(ctx, box_x, box_y, box_w, box_h, palette.c1);

		/* Draw box */
		graphics.draw_rect(ctx, box_x, box_y, box_w, box_h, 4, palette.c4);
		graphics.draw_rect_fill(ctx, box_x, box_y, box_w, box_h, palette.c1);

		/* Draw text's shadow */
		ctx.fillStyle = shadow;
		ctx.fillText(text, text_x + shadow_offset_x, text_y + shadow_offset_y);

		/* Draw text */
		ctx.fillStyle = palette.c4;
		ctx.fillText(text, text_x, text_y);
	} else if (s.status === STATUS_ENDED_1 || s.status === STATUS_ENDED_2) {
		let text;
		if (s.status === STATUS_ENDED_1) text = "Player 1 won !";
		else text = "Player 2 won !";
		let text_again = "Press 'Space' to play again"
		let padding = 10;
		let text_width = ctx.measureText(text).width;
		let box_w = text_width + padding * 2;
		let box_h = double_fsize;
		let text_x = (canvas.width - text_width) / 2;
		let box_x = (canvas.width - box_w) / 2;
		let text_y, box_y;
		let fourth = canvas.height / 4;
		if (s.status === STATUS_ENDED_1) {
			text_y = ((canvas.height + fsize / 2) / 2) + fourth;
			box_y = ((canvas.height - box_h) / 2) + fourth;
		} else {
			text_y = ((canvas.height + fsize / 2) / 2) - fourth;
			box_y = ((canvas.height - box_h) / 2) - fourth;
		}

		/* Draw box shadow */
		graphics.draw_rect(ctx, box_x + shadow_offset_x - 1, box_y + shadow_offset_y - 1, box_w, box_h, 4, shadow);

		/* Draw box */
		graphics.draw_rect(ctx, box_x, box_y, box_w, box_h, 4, palette.c4);
		graphics.draw_rect_fill(ctx, box_x, box_y, box_w, box_h, palette.c1);

		/* Draw text's shadow */
		ctx.fillStyle = shadow;
		ctx.fillText(text, text_x + shadow_offset_x, text_y + shadow_offset_y);

		/* Draw text */
		ctx.fillStyle = palette.c4;
		ctx.fillText(text, text_x, text_y);

		let text_width_again = ctx.measureText(text_again).width;
		let text_x_again = (canvas.width - text_width_again) / 2;
		let text_y_again = ((canvas.height + fsize / 2) / 2);
		let box_w_again = text_width_again + padding * 2;
		let box_h_again = double_fsize;
		let box_x_again = (canvas.width - box_w_again) / 2;
		let box_y_again = ((canvas.height - box_h_again) / 2);

		/* Draw box shadow */
		graphics.draw_rect(ctx, box_x_again + shadow_offset_x - 1, box_y_again + shadow_offset_y - 1, box_w_again, box_h_again, 4, shadow);

		/* Draw box */
		graphics.draw_rect(ctx, box_x_again, box_y_again, box_w_again, box_h_again, 4, palette.c4);
		graphics.draw_rect_fill(ctx, box_x_again, box_y_again, box_w_again, box_h_again, palette.c1);

		/* Draw text's shadow */
		ctx.fillStyle = shadow;
		ctx.fillText(text_again, text_x_again + shadow_offset_x, text_y_again + shadow_offset_y);

		/* Draw text */
		ctx.fillStyle = palette.c4;
		ctx.fillText(text_again, text_x_again, text_y_again);

	}
}
