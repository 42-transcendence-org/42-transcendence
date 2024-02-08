import math

from uuid import UUID
from typing import Dict

import game_app.pong.physics as physics

BOARD_WIDTH = 480
BOARD_HEIGHT = 650

# INPUTS
INPUT_LEFT = 0
INPUT_RIGHT = 1
INPUT_SPACE = 2
INPUT_NEUTRAL = 3
INPUT_QUIT = 4
INPUTS = [INPUT_LEFT, INPUT_RIGHT, INPUT_SPACE, INPUT_NEUTRAL, INPUT_QUIT]

# STATUSES
STATUS_WAITING = 0
STATUS_ACTIVE = 1
STATUS_ENDED_1 = 2
STATUS_ENDED_2 = 3
STATUS_PAUSED = 4
STATUS_QUIT = 5

# GAME TYPES
TYPE_REMOTE = 0

# PLAYERS' IDS
ID_PLAYER1 = 0
ID_PLAYER2 = 1

BOARD_MARGIN = 16
BOARD_CORRIDOR = 2 * BOARD_MARGIN

BALL_SIDE = 16
BALL_SPEED_MIN = (BOARD_HEIGHT / 2) - BOARD_MARGIN
BALL_SPEED_MAX = BALL_SPEED_MIN * 2.0

PADDLE_WIDTH = 64
PADDLE_SPEED = BOARD_WIDTH - (2 * BOARD_CORRIDOR)

POINTS_TO_WIN = 1

BALL_MAX_ANGLE = math.pi / 6


class Input:
    def __init__(self, id, input, time):
        self.id = id
        self.input = input
        self.timestamp = time


class GameState:
    def __init__(self):
        self.status = STATUS_WAITING
        self.particles = []
        self.ball = physics.Rectangle(
            (BOARD_WIDTH - BALL_SIDE) / 2,
            (BOARD_HEIGHT - BALL_SIDE) / 2,
            BALL_SIDE,
            BALL_SIDE,
            0,
            BALL_SPEED_MIN,
        )
        self.player1 = physics.Rectangle(
            (BOARD_WIDTH - PADDLE_WIDTH) / 2,
            BOARD_HEIGHT - (3 * BOARD_MARGIN),
            PADDLE_WIDTH,
            BALL_SIDE,
            0,
            0,
        )
        self.player2 = physics.Rectangle(
            (BOARD_WIDTH - PADDLE_WIDTH) / 2, 2 * BOARD_MARGIN, PADDLE_WIDTH, BALL_SIDE, 0, 0
        )
        self.score1 = 0
        self.score2 = 0


class GameSession:
    def __init__(self, id: UUID, type: str, name1: str, name2: str):
        self.id = id
        self.type = type
        self.inputs = []
        self.last_input = 0
        self.name1 = name1
        self.name2 = name2
        self.state = GameState()

    def input_handler(self, id, input, time):
        self.inputs.append(Input(id, input, time))
        # Ensure inputs are in chronological order
        self.inputs.sort(key=lambda input: input.timestamp)

    def reset_ball(self, direction):
        self.state.ball.position.x = (BOARD_WIDTH - self.state.ball.size.x) / 2
        self.state.ball.position.y = (BOARD_HEIGHT - self.state.ball.size.y) / 2
        self.state.ball.velocity = direction

    def reset_game(self):
        # FIXME Save the game state to the database before creating a new one
        self.state = GameState()
        self.state.status = STATUS_ACTIVE

    def process_inputs(self):
        for input in self.inputs:
            if input.id == ID_PLAYER1:
                player = self.state.player1
            else:
                player = self.state.player2

            if input.input == INPUT_NEUTRAL:
                player.velocity.x = 0
            elif input.input == INPUT_LEFT:
                player.velocity.x = -PADDLE_SPEED
            elif input.input == INPUT_RIGHT:
                player.velocity.x = PADDLE_SPEED
            elif input.input == INPUT_SPACE:
                if self.state.status == STATUS_WAITING:
                    self.state.status = STATUS_ACTIVE
                elif self.state.status in [STATUS_ACTIVE, STATUS_PAUSED]:
                    self.state.status = STATUS_ACTIVE if self.state.status == STATUS_PAUSED else STATUS_PAUSED
                elif self.state.status in [STATUS_ENDED_1, STATUS_ENDED_2]:
                    self.state.status = STATUS_ACTIVE
                    self.reset_game()
            elif input.input == INPUT_QUIT:
                if self.state.status in [STATUS_ENDED_1, STATUS_ENDED_2]:
                    self.state.status = STATUS_QUIT
        # Store the last processed input and clear the array
        self.last_input = self.inputs[-1].time
        self.inputs.clear()

    def get_state(self) -> Dict:
        return {
            "id": str(self.id),
            "type": self.type,
            "status": self.state.status,
            "ball": {
                "x": self.state.ball.position.x,
                "y": self.state.ball.position.y,
                "w": self.state.ball.size.x,
                "h": self.state.ball.size.y,
                "vx": self.state.ball.velocity.x,
                "vy": self.state.ball.velocity.y,
            },
            "player1": {
                "name": self.name1,
                "score": self.state.score1,
                "x": self.state.player1.position.x,
                "y": self.state.player1.position.y,
                "w": self.state.player1.size.x,
                "h": self.state.player1.size.y,
                "vx": self.state.player1.velocity.x,
                "vy": self.state.player1.velocity.y,
            },
            "player2": {
                "name": self.name2,
                "score": self.state.score2,
                "x": self.state.player2.position.x,
                "y": self.state.player2.position.y,
                "w": self.state.player2.size.x,
                "h": self.state.player2.size.y,
                "vx": self.state.player2.velocity.x,
                "vy": self.state.player2.velocity.y,
            },
        }
