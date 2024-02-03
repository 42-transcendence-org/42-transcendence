import threading

from uuid import UUID
from GameInstance import GameInstance


class GameInstance:
    def __init__(self, id: UUID, type: str, name1: str, name2: str) -> None:
        id = id
        type = type
        t = 0.0
        accumulator = 0.0
        current_time = 0.0
        player1_name = name1
        player2_name = name2
        state = GameInstance()
        state_lock = threading.Lock()
