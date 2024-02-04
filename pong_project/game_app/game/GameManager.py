import threading

from uuid import UUID
from typing import Dict, Tuple, Union
from .GameInstance import GameInstance


class GameManager:
    def __init__(self):
        self.lock = threading.Lock()
        self.quit = False
        self.thread = threading.Thread(target=self.update_all)
        self.instances: Dict[UUID, GameInstance] = {}

    def thread_start(self):
        self.thread.start()

    def thread_stop(self):
        with self.lock:
            self.quit = True
        self.thread.join()

    def update_all(self):
        while self.quit == False:
            with self.lock:
                for _, i in self.instances.items():
                    i.update_state()

    def game_add(self, game_id: UUID, type: str, name1: str, name2: str):
        with self.lock:
            self.instances[game_id] = GameInstance(game_id, type, name1, name2)

    def game_remove(self, game_id: UUID):
        with self.lock:
            if game_id in self.instances:
                del self.instances[game_id]

    def game_exists(self, game_id: UUID) -> bool:
        with self.lock:
            if game_id in self.instances:
                return True
            else:
                return False

    def validate_player_id(self, game_id: UUID, name: str, player_id: int) -> bool:
        with self.lock:
            if game_id in self.instances:
                i = self.instances[game_id]
                if player_id == 0 and (i.name1 == name or i.name2 == name):
                    return True
                if (i.name1 == name and player_id == 1) or (
                    i.name2 == name and player_id == 2
                ):
                    return True
        return False

    def game_get_state(self, game_id: UUID) -> Union[Dict, None]:
        with self.lock:
            if game_id in self.instances:
                return self.instances[game_id].get_state()
        return None

    # FIXME Don't access the state directly
    def game_add_input(self, game_id: UUID, input: Tuple[int, int]):
        with self.lock:
            if game_id in self.instances:
                self.instances[game_id].state.input_handler(input)

    def game_check_for_session(self, username: str) -> Union[UUID, None]:
        """
        Check if the player identified by 'username' already has an active game
        session. Returns the id of the game is he has, else returns None.
        """
        with self.lock:
            for id, i in self.instances.items():
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
            for id, i in self.instances.items():
                if i.type == "remote" and i.name2 == "":
                    i.name2 = username
                    return id
        return None


g_manager = GameManager()
