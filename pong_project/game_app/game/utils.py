import sys
import time
import threading

from physics import Rectangle

from uuid import UUID
from typing import Dict, Union, Tuple

keep_updating = True
active_games: Dict[UUID, dict] = {}
games_update_all_lock = threading.Lock()





def game_create(id: UUID, type: str, status: str, name1: str, name2: str) -> dict:
    return {
        "id": id,
        "type": type,
        "status": status,
        "inputs": [0, 0],
        "ball": physics.Rectangle(0, 0, 16, 16, 0, 0),
        "player1": physics.Rectangle(0, 0, 64, 16, 0, 0),
        "player2": physics.Rectangle(0, 0, 64, 16, 0, 0),
        "player1_score": 0,
        "player2_score": 0,
        "player1_name": name1,
        "player2_name": name2,
        "who_scored": 0,
    }


# TODO Double check the logic
# TODO Save the game state to the database if someone scored
# TODO Remove ended games
def game_update_all():
    pass


game_update_all_thread = threading.Thread(target=game_update_all)


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
