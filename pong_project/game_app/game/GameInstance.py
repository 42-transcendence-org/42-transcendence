import time
import threading

from uuid import UUID
from typing import Dict

from .GameState import GameState

dt = 1.0 / 60.0

# FIXME Do we need state_lock ?
class GameInstance:
    def __init__(self, id: UUID, type: str, name1: str, name2: str):
        self.id = id
        self.type = type
        self.t = 0.0
        self.accumulator = 0.0
        self.current_time = time.perf_counter()
        self.player1_name = name1
        self.player2_name = name2
        self.state = GameState()
        self.state_lock = threading.Lock()

    def update_state(self) -> None:
        new_time = time.perf_counter()
        frame_time = new_time - self.current_time
        self.current_time = new_time

        self.accumulator += frame_time

        while self.accumulator >= dt:
            with self.state_lock:
                self.state.update(dt)
            self.accumulator -= dt
            self.t += dt

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
                "name": self.player1_name,
                "score": self.state.player1_score,
                "x": self.state.player1.position.x,
                "y": self.state.player1.position.y,
                "w": self.state.player1.size.x,
                "h": self.state.player1.size.y,
                "vx": self.state.player1.velocity.x,
                "vy": self.state.player1.velocity.y,
            },
            "player2": {
                "name": self.player2_name,
                "score": self.state.player2_score,
                "x": self.state.player2.position.x,
                "y": self.state.player2.position.y,
                "w": self.state.player2.size.x,
                "h": self.state.player2.size.y,
                "vx": self.state.player2.velocity.x,
                "vy": self.state.player2.velocity.y,
            },
        }
