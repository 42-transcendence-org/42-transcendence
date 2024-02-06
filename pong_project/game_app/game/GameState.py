import math

from . import physics

from typing import Tuple

CANVAS_WIDTH = 480
CANVAS_HEIGHT = 650

LEFT = -1
RIGHT = 1
NEUTRAL = 0
SPACE = 2

STATUS_WAITING = 0
STATUS_ACTIVE = 1
STATUS_ENDED_1 = 2
STATUS_ENDED_2 = 3

MARGIN = 16
CORRIDOR = 2 * MARGIN + 8

BALL_SIDE = 16
# BALL_SPEED_MAX = 0.70
# BALL_SPEED_MIN = 0.40

PADDLE_WIDTH = 64
# PADDLE_SPEED_MAX = 1.0
# PADDLE_ACCELERATION = PADDLE_SPEED_MAX / 8000
# PADDLE_DECCELERATION = PADDLE_SPEED_MAX / 5000
PADDLE_SPEED_MAX = 1000
PADDLE_ACCELERATION = PADDLE_SPEED_MAX / 8
PADDLE_DECCELERATION = PADDLE_SPEED_MAX / 5
BALL_SPEED_MAX = 70
BALL_SPEED_MIN = 40

POINTS_TO_WIN = 10

MAX_ANGLE = math.pi / 6

class GameState:
    def __init__(self):
        self.status = STATUS_WAITING
        self.inputs = [0, 0]
        self.particles = []
        self.ball = physics.Rectangle((CANVAS_WIDTH - BALL_SIDE) / 2, (CANVAS_HEIGHT - BALL_SIDE) / 2, BALL_SIDE, BALL_SIDE, 0, BALL_SPEED_MIN)
        self.player1 = physics.Rectangle((CANVAS_WIDTH - PADDLE_WIDTH) / 2, CANVAS_HEIGHT - (3 * MARGIN), PADDLE_WIDTH, BALL_SIDE, 0, 0)
        self.player2 = physics.Rectangle((CANVAS_WIDTH - PADDLE_WIDTH) / 2, 2 * MARGIN, PADDLE_WIDTH, BALL_SIDE, 0, 0)
        self.score1 = 0
        self.score2 = 0
        self.who_scored = 0

    def input_handler(self, id, input):
        self.inputs[id] = input

    def reset_ball(self, direction: physics.Vector) -> None:
        self.ball.position.x = (CANVAS_WIDTH - self.ball.size.x) / 2
        self.ball.position.y = (CANVAS_HEIGHT - self.ball.size.y) / 2
        self.ball.velocity = direction

    def reset_game(self) -> None:
        self.player1.position.x = self.player2.position.x = (
            CANVAS_WIDTH - self.player1.size.x
        ) / 2
        self.player1.position.y = CANVAS_HEIGHT - (3 * MARGIN)
        self.player2.position.y = 2 * MARGIN
        self.score1 = 0
        self.score2 = 0
        self.who_scored = 0

        self.reset_ball(physics.Vector(0, BALL_SPEED_MIN))

    def update_paddle_velocity(self, id: int, player: physics.Rectangle) -> None:
        if self.inputs[id] != NEUTRAL:
            dv = PADDLE_ACCELERATION * self.inputs[id]
            player.velocity.x += dv
            player.velocity.x = min(max(player.velocity.x, -PADDLE_SPEED_MAX), PADDLE_SPEED_MAX)
        else:
            sign = (player.velocity.x > 0) - (player.velocity.x < 0)
            dv = -sign * PADDLE_DECCELERATION
            player.velocity.x += dv
            if abs(player.velocity.x) < PADDLE_DECCELERATION:
                player.velocity.x = 0

    def update_ball_velocity(
        self, player: physics.Rectangle, collision: physics.Collision
    ) -> None:
        r2_expanded = physics.Rectangle(
            player.position.x - self.ball.size.x / 2,
            player.position.y - self.ball.size.y / 2,
            player.size.x + self.ball.size.x,
            player.size.y + self.ball.size.y,
            0,
            0,
        )

        # Update velocity based on collision normal on the x-axis
        if collision.normal.x != 0:
            r1_center = self.ball.position.y + self.ball.size.y / 2
            r2_center = r2_expanded.position.y + r2_expanded.size.y / 2
            c = (r1_center - r2_center) / (r2_expanded.size.y / 2)
            c *= MAX_ANGLE
            self.ball.velocity.x = collision.normal.x * math.cos(c) * BALL_SPEED_MAX
            self.ball.velocity.y = math.sin(c) * BALL_SPEED_MAX

        # Update velocity based on collision normal on the y-axis
        if collision.normal.y != 0:
            r1_center = self.ball.position.x + self.ball.size.x / 2
            r2_center = r2_expanded.position.x + r2_expanded.size.x / 2
            c = (r1_center - r2_center) / (r2_expanded.size.x / 2)
            c *= MAX_ANGLE
            self.ball.velocity.x = math.sin(c) * BALL_SPEED_MAX
            self.ball.velocity.y = collision.normal.y * math.cos(c) * BALL_SPEED_MAX

    def update_paddle_position(
        self,
        id: int,
        player: physics.Rectangle,
        dt: float,
    ) -> None:
        if (self.inputs[id] != NEUTRAL and player.position.x + player.velocity.x * dt > CORRIDOR and player.position.x + player.size.x + player.velocity.x * dt < CANVAS_WIDTH - CORRIDOR):
            collision = physics.aabb_continuous_detection(player, self.ball, dt)
            if 0 < collision.time <= 1.0:
                physics.aabb_continuous_resolve(player, collision)
                collision.normal.x *= -1
                self.update_ball_velocity(self.ball, player, collision)
                self.ball.position.x += self.ball.velocity.x * (1 - collision.time)
                self.ball.position.y += self.ball.velocity.y * (1 - collision.time)
            else:
                player.position.x += player.velocity.x * dt

    def update_ball_position(self):
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
            self.score1 += 1
            physics.particles_create(self.particles, self.ball, 16)
            self.reset_ball(physics.Vector(0, BALL_SPEED_MIN))
        elif self.ball.position.y + self.ball.size.y >= CANVAS_HEIGHT - MARGIN:
            # Bottom wall
            self.score2 += 1
            physics.particles_create(self.particles, self.ball, 16)
            self.reset_ball(physics.Vector(0, -BALL_SPEED_MIN))

    def update(self, dt: float) -> None:
        if self.status == STATUS_WAITING:
            return

        self.update_paddle_velocity(0, self.player1)
        self.update_paddle_velocity(1, self.player2)
        self.update_paddle_position(0, self.player1, dt)
        self.update_paddle_position(1, self.player2, dt)

        if len(self.particles) > 0:
            physics.particles_update(self.particles, dt)
            if len(self.particles) > 0:
                return

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

        self.update_ball_position()

        if self.score1 == POINTS_TO_WIN:
            self.status = STATUS_ENDED_1
        elif self.score2 == POINTS_TO_WIN:
            self.status = STATUS_ENDED_2
