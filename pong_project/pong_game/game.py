from collections import deque

from . import constants as const


class Action:
    def __init__(self, player: str, action: str):
        self.player = player
        self.action = action


class Paddle:
    def __init__(
        self, x=0, y=0, w=const.PADDLE_WIDTH, h=const.PADDLE_HEIGHT, dx=const.PADDLE_DX
    ):
        self.x = x
        self.y = y
        self.w = w
        self.h = h
        self.dx = dx

    def move(self, direction, dt):
        if direction == "left":
            if self.x - self.dx * dt > 16:
                self.x -= self.dx * dt
        if direction == "right":
            if self.x + self.w + self.dx * dt < const.BOARD_WIDTH - 16:
                self.x += self.dx * dt


class Ball:
    def __init__(self, x=0, y=0, w=const.BALL_WIDTH, h=const.BALL_HEIGHT, dx=0, dy=0):
        self.x = x
        self.y = y
        self.w = w
        self.h = h
        self.dx = dx
        self.dy = dy

    def move(self, dt):
        self.x += self.dx * dt
        self.y += self.dy * dt

        if self.x <= 0:
            self.x = 0
            self.dx *= -1
        elif self.x + self.w >= const.BOARD_WIDTH:
            self.x = const.BOARD_WIDTH - self.w
            self.dx *= -1


# Player 1 is at the bottom of the screen, Player 2 is at the top
class Game:
    def __init__(self, game_type="local", game_status="waiting"):
        self.type = game_type
        self.status = game_status
        self.ball = Ball()
        self.player1 = Paddle()
        self.player2 = Paddle()
        self.player1_score = 0
        self.player2_score = 0
        self.actions = deque()
        self.initialize_game(1)

    def initialize_game(self, who_scored):
        self.actions.clear()
        self.player1.x = (const.BOARD_WIDTH - self.player1.w) / 2
        self.player1.y = const.BOARD_HEIGHT - (self.player1.h + 16)
        self.player2.x = (const.BOARD_WIDTH - self.player2.w) / 2
        self.player2.y = 16
        self.ball.x = (const.BOARD_WIDTH - self.ball.w) / 2
        self.ball.y = (const.BOARD_HEIGHT - self.ball.h) / 2
        # TODO Make ball.dx a random number to change the angle
        self.ball.dx = 0
        if who_scored == 1:
            self.ball.dy = 10
        else:
            self.ball.dy = -10

    def add_action(self, player, action):
        self.actions.append(Action(player, action))

    def update(self, dt):
        while self.actions:
            action = self.actions.popleft()
            if action.player == 1:
                self.player1.move(action.action, dt)
            else:
                self.player2.move(action.action, dt)
        self.ball.move(dt)
        self.check_ball_collision()
        self.check_score()

    def check_ball_collision(self):
        if (
            self.ball.y <= self.player2.y + self.player2.h
            and self.ball.x + self.ball.w >= self.player2.x
            and self.ball.x <= self.player2.x + self.player2.w
        ):
            self.ball.dy *= -1

        if (
            self.ball.y + self.ball.h >= self.player1.y
            and self.ball.x + self.ball.w >= self.player1.x
            and self.ball.x <= self.player1.x + self.player1.w
        ):
            self.ball.dy *= -1

    def check_score(self):
        who_scored = 0
        if self.ball.y <= 0:
            self.player1_score += 1
            who_scored = 1
        elif self.ball.y + self.ball.h >= const.BOARD_HEIGHT:
            self.player2_score += 1
            who_scored = 2
        if self.player1_score == 10 or self.player2_score == 10:
            self.game_status = const.ENDED
        else:
            self.initialize_game(who_scored)
