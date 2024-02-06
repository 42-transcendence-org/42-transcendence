const canvas = document.getElementById("game-canvas");
const ctx = canvas.getContext("2d");

export function draw_line(p1, p2, color) {
	ctx.beginPath();
	ctx.moveTo(p1.x, p1.y);
	ctx.lineTo(p2.x, p2.y);
	ctx.strokeStyle = color;
	ctx.stroke();
}

export function draw_disc(x, y, radius, color) {
	ctx.beginPath();
	ctx.arc(x, y, radius, 0, Math.PI * 2, true);
	ctx.fillStyle = color;
	ctx.fill();
}

export function draw_circle(x, y, radius, color) {
	ctx.beginPath();
	ctx.arc(x, y, radius, 0, Math.PI * 2, true);
	ctx.strokeStyle = color;
	ctx.stroke();
}

export function draw_rect_fill(x, y, w, h, color) {
	ctx.fillStyle = color;
	ctx.fillRect(x, y, w, h);
}

export function draw_rect(x, y, w, h, line_width, color) {
	ctx.beginPath();
	ctx.rect(x, y, w, h);
	ctx.strokeStyle = color;
	ctx.lineWidth = line_width;
	ctx.stroke();
}

export function draw_text(text, x, y, color) {
	ctx.fillStyle = color;
	ctx.fillText(text, x, y);
}

export function load_font() {
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
