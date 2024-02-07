import time
import threading

from uuid import UUID
from typing import Dict, Union

from game_app.game.GameState import STATUS_ACTIVE, SPACE
from game_app.game.GameSession import GameSession

class GameManager:
    def __init__(self):
        self.lock = threading.Lock()
        self.quit = False
        self.thread = threading.Thread(target=self.update_all)
        self.sessions: Dict[UUID, GameSession] = {}
        self.t = 0.0
        self.dt = 1.0 / 60.0
        self.accumulator = 0.0
        self.current_time = time.perf_counter()

    def thread_start(self):
        self.thread.start()

    def thread_stop(self):
        with self.lock:
            self.quit = True
        self.thread.join()

    def update_all(self):
        while not self.quit:
            new_time = time.perf_counter()
            frame_time = new_time - self.current_time
            self.current_time = new_time

            self.accumulator += frame_time
            while self.accumulator >= self.dt:
                with self.lock:
                    for _, session in self.sessions.items():
                        session.state.update(self.dt)
                self.accumulator -= self.dt
                self.t += self.dt

            remaining_time = self.dt - self.accumulator
            sleep_time = max(0, remaining_time - (time.perf_counter() - new_time))
            if sleep_time > 0:
                time.sleep(sleep_time)

    def game_add(self, game_id: UUID, type: str, name1: str, name2: str):
        with self.lock:
            self.sessions[game_id] = GameSession(game_id, type, name1, name2)

    def game_remove(self, game_id: UUID):
        with self.lock:
            if game_id in self.sessions:
                del self.sessions[game_id]

    def game_exists(self, game_id: UUID) -> bool:
        with self.lock:
            if game_id in self.sessions:
                return True
            else:
                return False

    def validate_player_id(self, game_id: UUID, name: str, player_id: int) -> bool:
        with self.lock:
            if game_id in self.sessions:
                if self.sessions[game_id].name1 == name or self.sessions[game_id].name2 == name:
                    return True
        return False

    def game_get_state(self, game_id: UUID) -> Union[Dict, None]:
        with self.lock:
            if game_id in self.sessions:
                return self.sessions[game_id].get_state()
        return None

    def game_add_input(self, game_id: UUID, player_id: int, player_input: int):
        with self.lock:
            if game_id in self.sessions:
                if player_input != SPACE:
                    self.sessions[game_id].state.input_handler(player_id, player_input)
                else:
                    self.sessions[game_id].state.status = STATUS_ACTIVE

    def game_check_for_session(self, username: str) -> Union[UUID, None]:
        """
        Check if the player identified by 'username' already has an active game
        session. Returns the id of the game is he has, else returns None.
        """
        with self.lock:
            for id, i in self.sessions.items():
                if i.name1 == username or i.name2 == username:
                    return id
        return None

    def game_check_for_waiting(self, username: str) -> Union[UUID, None]:
        """
        If an open game sessions is found, it is updated to include the change
        the status to 'active' and to add the username of the second player and
        its UUID is returned.
        If no open game sessions is found, None is
        returned.
        """
        with self.lock:
            for id, i in self.sessions.items():
                if i.type == "remote" and i.name2 == "":
                    i.name2 = username
                    return id
        return None


g_manager = GameManager()
