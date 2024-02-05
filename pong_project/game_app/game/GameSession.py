import time
import threading

from uuid import UUID
from typing import Dict

from game_app.game.GameState import GameState

class GameSession:
    def __init__(self, id: UUID, type: str, name1: str, name2: str):
        self.id = id
        self.type = type
        self.name1 = name1
        self.name2 = name2
        self.state = GameState()

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
