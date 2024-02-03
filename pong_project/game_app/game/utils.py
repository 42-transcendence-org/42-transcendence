import sys
import time
import queue
import threading

from uuid import UUID
from typing import Dict, Union, Tuple

BOARD_WIDTH = 600
BOARD_HEIGHT = 800
PADDLE_WIDTH = 64
PADDLE_HEIGHT = 16
PADDLE_DX = 1000
BALL_SIDE = 16
BALL_DX = 0
BALL_DY = 100
MARGIN = 16

keep_updating = True
active_games: Dict[UUID, dict] = {}
games_update_all_lock = threading.Lock()


def game_create(id: UUID, type: str, status: str, name1: str, name2: str) -> dict:
    return {
        "id": id,
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

        if i[1] == "left" and (p["x"] - PADDLE_DX * dt > 16):
            p["x"] -= PADDLE_DX * dt
        elif i[1] == "right" and (
            p["x"] + PADDLE_WIDTH + PADDLE_DX * dt < BOARD_WIDTH - 16
        ):
            p["x"] += PADDLE_DX * dt

    # Move the ball and check for collisions with walls
    b = s["ball"]
    b["x"] += b["dx"] * dt
    b["y"] += b["dy"] * dt

    who_scored = 0
    score1 = s["player1"]["score"]
    score2 = s["player2"]["score"]


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
        b["x"] = (BOARD_WIDTH - BALL_SIDE) / 2
        b["y"] = (BOARD_HEIGHT - BALL_SIDE) / 2
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


# TODO Double check the logic
# TODO Save the game state to the database if someone scored
# TODO Remove ended games
def game_update_all():
    accumulator = 0.0
    update_interval = 1.0 / 60
    last_update_time = time.time()

    while True:
        with games_update_all_lock:
            if not keep_updating:
                break
        current_time = time.time()
        frame_time = current_time - last_update_time
        last_update_time = current_time
        accumulator += frame_time

        while accumulator >= update_interval:
            with games_update_all_lock:
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
