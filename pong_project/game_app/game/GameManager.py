

import sys
import threading

from GameInstance import GameInstance

game_update_all_thread = threading.Thread(target=game_update_all)


class GameManager:
    def __init__(self):
        self.quit = False
        self.instances = []

def game_update_all():
    for i in instances:
        loop(i)
    def game_update_all_shutdown(signal, frame):
    global keep_updating
    with games_update_all_lock:
        keep_updating = False
    game_update_all_thread.join()
    sys.exit(0)


    def game_add(game_id: UUID, game_data: dict):
        with games_update_all_lock:
            active_games[game_id] = game_data


    def game_remove(game_id: UUID):
        with games_update_all_lock:
            if game_id in active_games:
                del active_games[game_id]










def game_add_input(game_id: UUID, player_input: Tuple[str, str]) -> bool:
    with games_update_all_lock:
        if game_id in active_games:
            active_games[game_id]["inputs"].put(player_input)
            return True
    return False


def game_check_for_session(username: str) -> Union[UUID, None]:
    """
    Check if the player identified by 'username' already has an active game
    session. Returns the id of the game is he has, else returns None.
    """
    with games_update_all_lock:
        for _, game_state in active_games.items():
            if (
                game_state["player1"]["name"] == username
                or game_state["player2"]["name"] == username
            ):
                return game_state["id"]
    return None


def game_check_for_waiting(username: str) -> Union[UUID, None]:
    """
    If an open game sessions is found, it is updated to include the change
    the status to 'active' and to add the username of the second player and
    its UUID is returned.
    If no open game sessions is found, None is
    returned.
    """
    with games_update_all_lock:
        for id, s in active_games.items():
            if (
                s["status"] == "waiting"
                and s["type"] == "remote"
                and s["player2"]["name"] == ""
            ):
                s["player2"]["name"] = username
                s["status"] = "active"
                return id
    return None
