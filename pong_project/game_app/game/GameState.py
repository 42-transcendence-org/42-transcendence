import math

from . import physics

from typing import Tuple

CANVAS_WIDTH = 480
CANVAS_HEIGHT = 650

LEFT = -1
RIGHT = 1
NEUTRAL = 0

MARGIN = 16
CORRIDOR = 2 * MARGIN + 8
BALL_SPEED_MAX = 0.70
BALL_SPEED_MIN = 0.40

PADDLE_SPEED_MAX = 1.0
PADDLE_ACCELERATION = 1.0 / 8000
PADDLE_DECCELERATION = 1.0 / 5000

STATUS_WAITING = 0
STATUS_ACTIVE = 1
STATUS_ENDED_1 = 2
STATUS_ENDED_2 = 3

POINTS_TO_WIN = 10

MAX_ANGLE = math.pi / 6


class GameState:
    def __init__(self):
        self.status = STATUS_WAITING
        self.inputs = [0, 0]
        self.particles = []
        self.ball = physics.Rectangle(0, 0, 16, 16, 0, 0)
        self.player1 = physics.Rectangle(0, 0, 64, 16, 0, 0)
        self.player2 = physics.Rectangle(0, 0, 64, 16, 0, 0)
        self.score1 = 0
        self.score2 = 0
        self.who_scored = 0

    def input_handler(self, input: Tuple[int, int]):
        self.inputs[input[0]] = input[1]

    def reset_ball(self, direction: physics.Vector) -> None:
        self.ball.position.x = (CANVAS_WIDTH - self.ball.size.x) / 2
        self.ball.position.y = (CANVAS_HEIGHT - self.ball.size.y) / 2
        self.ball.velocity = physics.get_vector_in_range(direction, MAX_ANGLE)
        self.ball.velocity.x *= BALL_SPEED_MIN
        self.ball.velocity.y *= BALL_SPEED_MIN

    def reset_game(self) -> None:
        self.player1.position.x = self.player2.position.x = (
            CANVAS_WIDTH - self.player1.size.x
        ) / 2
        self.player1.position.y = CANVAS_HEIGHT - (3 * MARGIN)
        self.player2.position.y = 2 * MARGIN
        self.score1 = 0
        self.score2 = 0
        self.reset_ball(physics.Vector(0, 1))

    def update_paddle_velocity(self, inputs_id: int, paddle: physics.Rectangle) -> None:
        if self.inputs[inputs_id] != NEUTRAL:
            dv = PADDLE_ACCELERATION * self.inputs[inputs_id]
            paddle.velocity.x += dv
            paddle.velocity.x = min(
                max(paddle.velocity.x, -PADDLE_SPEED_MAX), PADDLE_SPEED_MAX
            )
        else:
            sign = (paddle.velocity.x > 0) - (paddle.velocity.x < 0)
            dv = -sign * PADDLE_DECCELERATION
            paddle.velocity.x += dv
            if abs(paddle.velocity.x) < PADDLE_DECCELERATION:
                paddle.velocity.x = 0

    def update_ball_velocity(
        self, r1: physics.Rectangle, r2: physics.Rectangle, collision: physics.Collision
    ) -> None:
        r2_expanded = physics.Rectangle(
            r2.position.x - r1.size.x / 2,
            r2.position.y - r1.size.y / 2,
            r2.size.x + r1.size.x,
            r2.size.y + r1.size.y,
            0,
            0,
        )

        # Update velocity based on collision normal on the x-axis
        if collision.normal.x != 0:
            r1_center = r1.position.y + r1.size.y / 2
            r2_center = r2_expanded.position.y + r2_expanded.size.y / 2
            c = (r1_center - r2_center) / (r2_expanded.size.y / 2)
            c *= MAX_ANGLE
            r1.velocity.x = collision.normal.x * math.cos(c) * BALL_SPEED_MAX
            r1.velocity.y = math.sin(c) * BALL_SPEED_MAX

        # Update velocity based on collision normal on the y-axis
        if collision.normal.y != 0:
            r1_center = r1.position.x + r1.size.x / 2
            r2_center = r2_expanded.position.x + r2_expanded.size.x / 2
            c = (r1_center - r2_center) / (r2_expanded.size.x / 2)
            c *= MAX_ANGLE
            r1.velocity.x = math.sin(c) * BALL_SPEED_MAX
            r1.velocity.y = collision.normal.y * math.cos(c) * BALL_SPEED_MAX

    def update_paddle_position(
        self,
        inputs_id: int,
        player: physics.Rectangle,
        ball: physics.Rectangle,
        dt: float,
    ) -> None:
        if (
            self.inputs[inputs_id] != NEUTRAL
            and player.position.x + player.velocity.x * dt > CORRIDOR
            and player.position.x + player.size.x + player.velocity.x * dt
            < CANVAS_WIDTH - CORRIDOR
        ):
            collision = physics.aabb_continuous_detection(player, ball, dt)
            if 0 < collision.time <= 1.0:
                physics.aabb_continuous_resolve(player, collision)
                collision.normal.x *= -1
                self.update_ball_velocity(ball, player, collision)
                ball.position.x += ball.velocity.x * (1 - collision.time)
                ball.position.y += ball.velocity.y * (1 - collision.time)
            else:
                player.position.x += player.velocity.x * dt

    def update(self, dt: float) -> None:

        if self.status == STATUS_WAITING:
            return

        self.update_paddle_velocity(0, self.player1)
        self.update_paddle_velocity(1, self.player2)
        self.update_paddle_position(0, self.player1, self.ball, dt)
        self.update_paddle_position(1, self.player2, self.ball, dt)

        if len(self.particles) > 0:
            physics.particles_update(self.particles, dt)
            if len(self.particles) > 0:
                return
            if self.who_scored == 1:
                self.reset_ball(physics.Vector(0, 1))
            else:
                self.reset_ball(physics.Vector(0, -1))

        # This allows for the particle effect to finish updating when the game is over
        if self.status == STATUS_ENDED_1 or self.status == STATUS_ENDED_2:
            return

        player = None
        collision = None

        # Collision detection
        c1 = physics.aabb_continuous_detection(self.ball, self.player1, dt)
        c2 = physics.aabb_continuous_detection(self.ball, self.player2, dt)
        if c1.time > 0:
            player = self.player1
            collision = c1
        elif c2.time > 0:
            player = self.player2
            collision = c2

        # Collision resolution
        if collision is not None and player is not None and 0 < collision.time <= 1.0:
            physics.aabb_continuous_resolve(self.ball, collision)
            self.update_ball_velocity(self.ball, player, collision)
            self.ball.position.x += self.ball.velocity.x * (1 - collision.time)
            self.ball.position.y += self.ball.velocity.y * (1 - collision.time)
        else:
            self.ball.position.x += self.ball.velocity.x * dt
            self.ball.position.y += self.ball.velocity.y * dt

        if self.ball.position.x <= MARGIN:
            # Left wall
            self.ball.position.x = MARGIN
            self.ball.velocity.x *= -1
        elif self.ball.position.x + self.ball.size.x >= CANVAS_WIDTH - MARGIN:
            # Right wall
            self.ball.position.x = CANVAS_WIDTH - self.ball.size.x - MARGIN
            self.ball.velocity.x *= -1
        elif self.ball.position.y <= MARGIN:
            # Top wall
            self.who_scored = 1
            self.score1 += 1
            physics.particles_create(self.particles, self.ball, 16)
        elif self.ball.position.y + self.ball.size.y >= CANVAS_HEIGHT - MARGIN:
            # Bottom wall
            self.who_scored = 2
            self.score2 += 1
            physics.particles_create(self.particles, self.ball, 16)

        if self.score1 == POINTS_TO_WIN:
            self.status = STATUS_ENDED_1
        elif self.score2 == POINTS_TO_WIN:
            self.status = STATUS_ENDED_2
