// Select the canvas element and get its context
const canvas = document.getElementById('pongCanvas');
const ctx = canvas.getContext('2d');
canvas.width = 800;
canvas.height = 400;

// Paddle constructor
function Paddle(x, y, width, height) {
  this.x = x;
  this.y = y;
  this.width = width;
  this.height = height;

  this.render = function() {
    ctx.fillStyle = 'white';
    ctx.fillRect(this.x, this.y, this.width, this.height);
  };
}

// Ball constructor
function Ball(x, y, radius) {
  this.x = x;
  this.y = y;
  this.radius = radius;

  this.render = function() {
    ctx.beginPath();
    ctx.arc(this.x, this.y, this.radius, 0, Math.PI * 2, false);
    ctx.fillStyle = 'white';
    ctx.fill();
    ctx.closePath();
  };
}

// Initialize paddles and ball
let playerPaddle = new Paddle(20, canvas.height / 2 - 30, 10, 60);
let aiPaddle = new Paddle(canvas.width - 30, canvas.height / 2 - 30, 10, 60);
let ball = new Ball(canvas.width / 2, canvas.height / 2, 10);

// Game loop function
function gameLoop() {
  ctx.clearRect(0, 0, canvas.width, canvas.height);
  playerPaddle.render();
  aiPaddle.render();
  ball.render();

  requestAnimationFrame(gameLoop);
}

// Start the game loop
gameLoop();
