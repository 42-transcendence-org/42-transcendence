import sys
import json
import time
import queue
import threading

from uuid import UUID
from typing import Dict, Union, Tuple

BOARD_WIDTH = 600
BOARD_HEIGHT = 800
PADDLE_WIDTH = 64
PADDLE_HEIGHT = 16
PADDLE_DX = 10
BALL_SIDE = 16
BALL_DX = 0
BALL_DY = 1
MARGIN = 16

keep_updating = True
active_games: Dict[UUID, dict] = {}


def game_create(type: str, status: str, name1: str, name2: str) -> dict:
    return {
        "type": type,
        "status": status,
        "ball": {
            "x": (BOARD_WIDTH - BALL_SIDE) / 2,
            "y": (BOARD_HEIGHT - BALL_SIDE) / 2,
            "dx": BALL_DX,
            "dy": BALL_DY,
        },
        "player1": {
            "name": name1,
            "x": (BOARD_WIDTH - PADDLE_WIDTH) / 2,
            "y": BOARD_HEIGHT - (PADDLE_HEIGHT + MARGIN),
            "score": 0,
        },
        "player2": {
            "name": name2,
            "x": (BOARD_WIDTH - PADDLE_WIDTH) / 2,
            "y": MARGIN,
            "score": 0,
        },
        "inputs": queue.Queue(),  # Thread-safe queue of tuples representing inputs i.e ("1", "right"), ("2", "left"), ("1", "pause")
    }


def game_update(game_state: dict, dt: float) -> bool:
    s = game_state

    # Process inputs and move the paddles accordingly
    while not s["inputs"].empty():
        i = s["inputs"].get()
        if i[0] == "1":
            p = s["player1"]
        else:
            p = s["player2"]

        if i[1] == "left" and (p["x"] - p["dx"] * dt > 16):
            p["x"] -= p["dx"] * dt
        elif i[1] == "right" and (p["x"] + p["w"] + p["dx"] * dt < BOARD_WIDTH - 16):
            p["x"] += p["dx"] * dt

    # Move the ball and check for collisions with walls
    b = s["ball"]
    b["x"] += b["dx"] * dt
    b["y"] += b["dy"] * dt

    who_scored = 0
    score1 = s["player1"]["score"]
    score2 = s["player2"]["score"]

    # Left wall
    if b["x"] <= 0:
        b["x"] = 0
        b["dx"] *= -1
    # Right wall
    elif b["x"] + BALL_SIDE >= BOARD_WIDTH:
        b["x"] = BOARD_WIDTH - BALL_SIDE
        b["dx"] *= -1
    # Top wall
    elif b["y"] <= 0:
        score1 += 1
        who_scored = 1
    # Bottom wall
    elif b["y"] + BALL_SIDE >= BOARD_HEIGHT:
        score2 += 1
        who_scored = 2

    # A player won, end the game
    if score1 == 10 or score2 == 10:
        game_state["status"] = "ended"
        return
    # A player scored, reset the ball position
    elif who_scored != 0:
        b["x"] = BOARD_WIDTH - BALL_SIDE / 2
        b["y"] = BOARD_HEIGHT - BALL_SIDE / 2
        b["dx"] = BALL_DX
        if who_scored == 1:
            b["dy"] = BALL_DY
        else:
            b["dy"] = -BALL_DY

    # Check for collisions between the ball and the paddles
    p1 = s["player1"]
    p2 = s["player2"]
    if (
        b["y"] + BALL_SIDE >= p1["y"]
        and b["x"] + BALL_SIDE >= p1["x"]
        and b["x"] <= p1["x"] + PADDLE_WIDTH
    ) or (
        b["y"] <= p2["y"] + PADDLE_HEIGHT
        and b["x"] + BALL_SIDE >= p2["x"]
        and b["x"] <= p2["x"] + PADDLE_WIDTH
    ):
        b["dy"] *= -1


def game_ai_move(game_state: dict):
    pass


# TODO Handle locking
# TODO Double check the logic
# TODO Save the game state to the database if someone scored
def game_update_all():
    accumulator = 0.0
    update_interval = 1.0 / 60
    last_update_time = time.time()

    while keep_updating:
        current_time = time.time()
        frame_time = current_time - last_update_time
        last_update_time = current_time
        accumulator += frame_time

        while accumulator >= update_interval:
            for _, game_state in active_games.items():
                if game_state["type"] == "ai":
                    game_ai_move(game_state)
                if game_state["status"] != "waiting":
                    game_update(game_state, update_interval)
            accumulator -= update_interval

        # Calculate time to sleep to avoid spinning
        time_to_sleep = update_interval - (time.time() - current_time)
        if time_to_sleep > 0:
            time.sleep(time_to_sleep)


game_update_all_thread = threading.Thread(target=game_update_all)
games_update_all_lock = threading.Lock()


def game_update_all_shutdown(signal, frame):
    global keep_updating
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
        return active_games.get(game_id)


def game_add_input(game_id: UUID, player_input: Tuple[str, str]) -> bool:
    if game_id in active_games:
        active_games[game_id]["inputs"].put(player_input)
        return True
    return False


# TODO Use lock
def game_check_for_session(username: str) -> bool:
    for _, game_state in active_games.items():
        if (
            game_state["player1"]["name"] == username
            or game_state["player2"]["name"] == username
        ):
            return True
    return False


# TODO Use lock
def game_check_for_waiting(username: str) -> Union[UUID, None]:
    """
    If an open game sessions is found it is updated and its UUID is
    returned, else None is returned.
    """
    for id, s in active_games.items():
        if (
            s["status"] == "waiting"
            and s["type"] == "remote"
            and s["player2"]["name"] == ""
        ):
            s["player2"]["name"] == username
            s["status"] == "active"
            return id
    return None


class CustomJSONEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, queue.Queue):
            return []
        return json.JSONEncoder.default(self, obj)


# TODO Specify return type
def game_state_to_json(game_state: dict):
    return json.dumps(game_state, cls=CustomJSONEncoder)
