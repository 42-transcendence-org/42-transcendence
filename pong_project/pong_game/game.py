from uuid import UUID

BOARD_WIDTH = 600
BOARD_HEIGHT = 800
PADDLE_WIDTH = 64
PADDLE_HEIGHT = 16
PADDLE_DX = 10
BALL_SIDE = 16
MARGIN = 16


def game_create(id: UUID, type: str, status: str, name1: str, name2: str) -> dict:
    return {
        "id": id,
        "type": type,
        "status": status,
        "dt": 0,
        "ball": {
            "x": (BOARD_WIDTH - BALL_SIDE) / 2,
            "y": (BOARD_HEIGHT - BALL_SIDE) / 2,
            "dx": 10,
            "dy": 10,
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
        "inputs": [],  # List[Tuple[str, str]] i.e ("1", "right"), ("2", "left"), ("1", "pause")
    }


def game_update(game_state: dict):
    # Update dt
    dt = game_state["dt"]

    # Process inputs and move the paddles accordingly
    for i in game_state["inputs"]:
        if i[0] == "1":
            p = game_state["player1"]
        else:
            p = game_state["player2"]

        if i[1] == "left" and (p["x"] - p["dx"] * dt > 16):
            p["x"] -= p["dx"] * dt
        elif i[1] == "right" and (p["x"] + p["w"] + p["dx"] * dt < BOARD_WIDTH - 16):
            p["x"] += p["dx"] * dt

    # TODO Empty the list
    # Move the ball and check for collisions with walls
    b = game_state["ball"]
    b["x"] += b["dx"] * dt
    b["y"] += b["dy"] * dt

    if b["x"] <= 0:
        b["x"] = 0
        b["dx"] *= -1
    elif b["x"] + BALL_SIDE >= BOARD_WIDTH:
        b["x"] = BOARD_WIDTH - BALL_SIDE
        b["dx"] *= -1
    # Check for collisions
    # Update the scores
