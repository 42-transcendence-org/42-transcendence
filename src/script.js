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

function resetBall(direction) {
	ball.x = (canvas.width - ball.width) / 2;
	ball.y = (canvas.height - ball.height) / 2;
	ball.dx = -250 * direction;
	ball.dy = -250;
}

function AABB(paddle, ball) {
	return (
		ball.x < paddle.x + paddle.width &&
		ball.x + ball.width > paddle.x &&
		ball.y < paddle.y + paddle.height &&
		ball.y + ball.height > paddle.y
	);
}

function enhancedCollisionDetection(ball, paddle) {
	if (AABB(ball, paddle)) {
		// Determine the side of the collision
		const topCollision = ball.y + ball.height > paddle.y && ball.y < paddle.y;
		const bottomCollision = ball.y < paddle.y + paddle.height && ball.y + ball.height > paddle.y + paddle.height;
		const leftCollision = ball.x + ball.width > paddle.x && ball.x < paddle.x;
		const rightCollision = ball.x < paddle.x + paddle.width && ball.x + ball.width > paddle.x + paddle.width;

		// Adjust ball's position to avoid getting stuck
		if (topCollision) ball.y = paddle.y - ball.height;
		if (bottomCollision) ball.y = paddle.y + paddle.height;
		if (leftCollision) ball.x = paddle.x - ball.width;
		if (rightCollision) ball.x = paddle.x + paddle.width;

		// Adjust ball's velocity based on collision type
		if (topCollision || bottomCollision) {
			ball.dy *= -1;
			ball.dx = adjustBallHorizontalDirection(ball.x, paddle.x, paddle.width, topCollision, bottomCollision);
		} else {
			ball.dx *= -1;
			ball.dy = adjustBallVerticalDirection(ball.y, paddle.y, paddle.height);
		}
	}
}

function adjustBallHorizontalDirection(ballX, paddleX, paddleWidth, topCollision, bottomCollision) {
	let relativeIntersectX = (topCollision || bottomCollision) ? (paddleX + (paddleWidth / 2)) - ballX : 0;
	let normalizedRelativeIntersectionX = (relativeIntersectX / (paddleWidth / 2));
	let maxBounceAngle = 75; // Maximum bounce angle in degrees
	let bounceAngle = normalizedRelativeIntersectionX * maxBounceAngle;
	return Math.sign(ball.dx) * Math.cos(bounceAngle * Math.PI / 180) * Math.abs(ball.dx);
}

function adjustBallVerticalDirection(ballY, paddleY, paddleHeight) {
	var relativeIntersectY = (paddleY + (paddleHeight / 2)) - ballY;
	var normalizedRelativeIntersectionY = (relativeIntersectY / (paddleHeight / 2));
	var maxBounceAngle = 75; // Maximum bounce angle in degrees
	var bounceAngle = normalizedRelativeIntersectionY * maxBounceAngle;
	return -Math.sign(ball.dy) * Math.cos(bounceAngle * Math.PI / 180) * Math.abs(ball.dy);
}

let lastFrameTime = performance.now();
function update() {
	/* Update dt */
	let now = performance.now();
	dt = (now - lastFrameTime) / 1000;
	lastFrameTime = now;

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
	if (keys['p']) {
		/* UP */
		if (rightPlayer.dy > 0) rightPlayer.dy *= -1;
		if (rightPlayer.y - rightPlayer.dy * dt >= border) rightPlayer.move();
	} else if (keys['l']) {
		/* DOWN */
		if (rightPlayer.dy < 0) rightPlayer.dy *= -1;
		if (rightPlayer.y + rightPlayer.height + rightPlayer.dy * dt <= canvas.height - border) rightPlayer.move();
	}

	/* Ball */
	ball.move();
	/* Check collisions with walls */
	if (ball.y <= border) {
		/* TOP */
		ball.y = border;
		ball.dy *= -1;
	} else if (ball.y + ball.height >= canvas.height - border) {
		/* BOTTOM */
		ball.y = canvas.height - ball.height - border;
		ball.dy *= -1;
	} else if (ball.x <= 0) {
		/* LEFT */
		rightScore++;
		resetBall(-1);
	} else if (ball.x + ball.width >= canvas.width) {
		/* RIGHT */
		leftScore++;
		resetBall(1);
	} else if (enhancedCollisionDetection(ball, leftPlayer)) {
		/* Collision with Left Paddle */
	} else if (enhancedCollisionDetection(ball, rightPlayer)) {
		/* Collision with Right Paddle */
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
	rightPlayer.dy = leftPlayer.dy = canvas.height * 0.90;
	/* Ball coordinates */
	resetBall(1);

	/* Start the game loop */
	main();
}).catch(error => {
	console.error("Error loading images", error);
});
