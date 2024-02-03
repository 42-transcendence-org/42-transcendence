import time
import threading

from uuid import UUID

from GameState import GameState

dt = 1.0 / 60.0


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



def game_get_state(game_id: UUID):
    with games_update_all_lock:
        if game_id in active_games:
            return active_games.get(game_id)


def game_get_state_json(game_id: UUID):
    with games_update_all_lock:
        if game_id in active_games:
            s = active_games.get(game_id)
            return {
                "id": str(s["id"]),
                "type": s["type"],
                "status": s["status"],
                "ball": {
                    "x": s["ball"]["x"],
                    "y": s["ball"]["y"],
                    "dx": s["ball"]["dx"],
                    "dy": s["ball"]["dy"],
                },
                "player1": {
                    "name": s["player1"]["name"],
                    "x": s["player1"]["x"],
                    "y": s["player1"]["y"],
                    "score": s["player1"]["score"],
                },
                "player2": {
                    "name": s["player2"]["name"],
                    "x": s["player2"]["x"],
                    "y": s["player2"]["y"],
                    "score": s["player2"]["score"],
                },
            }
