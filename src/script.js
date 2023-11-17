/* Select the canvas element and get its context */
const canvas = document.getElementById('pongCanvas');
const ctx = canvas.getContext('2d');
canvas.width = 800;
canvas.height = 600;

/* Global variables */
let dt = 1;
let leftScore = 0;
let rightScore = 0;
let border = 16;
let keys = {};

/* Classes */
class GameObject {
	constructor(spritePath) {
		this.sprite = new Image();
		this.width = 0;
		this.height = 0;
		this.x = 0;
		this.y = 0;
		this.dx = 0;
		this.dy = 0;

		/* Set up the onload event */
		this.loaded = new Promise((resolve, reject) => {
			this.sprite.onload = () => {
				this.width = this.sprite.width;
				this.height = this.sprite.height;
				resolve();
			};
			this.sprite.onerror = reject;
		});
		this.sprite.src = spritePath;
	}

	render() {
		ctx.drawImage(this.sprite, this.x, this.y, this.width, this.height);
	}

	move() {
		this.x += this.dx * dt;
		this.y += this.dy * dt;
	}
}

/* Listen for user input */
document.addEventListener('keydown', function (event) {
	keys[event.key] = true;
});

document.addEventListener('keyup', function (event) {
	keys[event.key] = false;
});

let ball = new GameObject('../assets/ball.png');
let background = new GameObject('../assets/bg.png');
let leftPlayer = new GameObject('../assets/paddle.png');
let rightPlayer = new GameObject('../assets/paddle.png');

function update() {
	/* Left player */
	if (keys['q']) {
		/* UP */
		if (leftPlayer.dy > 0) leftPlayer.dy *= -1;
		if (leftPlayer.y - leftPlayer.dy * dt >= border) leftPlayer.move();
	} else if (keys['a']) {
		/* DOWN */
		if (leftPlayer.dy < 0) leftPlayer.dy *= -1;
		if (leftPlayer.y + leftPlayer.height + leftPlayer.dy * dt <= canvas.height - border) leftPlayer.move();
	}

	/* Right player */
	if (keys['ArrowUp']) {
		/* UP */
		if (rightPlayer.dy > 0) rightPlayer.dy *= -1;
		if (rightPlayer.y - rightPlayer.dy * dt >= border) rightPlayer.move();
	} else if (keys['ArrowDown']) {
		/* DOWN */
		if (rightPlayer.dy < 0) rightPlayer.dy *= -1;
		if (rightPlayer.y + rightPlayer.height + rightPlayer.dy * dt <= canvas.height - border) rightPlayer.move();
	}
}

function draw() {
	background.render();
	ball.render();
	rightPlayer.render();
	leftPlayer.render();
}

function main() {
	ctx.clearRect(0, 0, canvas.width, canvas.height);
	update();
	draw();
	requestAnimationFrame(main);
}

Promise.all([background.loaded, ball.loaded, leftPlayer.loaded, rightPlayer.loaded]).then(() => {
	/* Images are fully loaded, we can setup the positions */
	/* Paddle coordinates */
	leftPlayer.x = leftPlayer.width;
	rightPlayer.x = canvas.width - (rightPlayer.width * 2);
	rightPlayer.y = leftPlayer.y = (canvas.height - rightPlayer.height) / 2;
	rightPlayer.dy = leftPlayer.dy = 5.0;
	/* Ball coordinates */
	ball.x = (canvas.width - ball.width) / 2;
	ball.y = (canvas.height - ball.height) / 2;

	/* Start the game loop */
	main();
}).catch(error => {
	console.error("Error loading images", error);
});
