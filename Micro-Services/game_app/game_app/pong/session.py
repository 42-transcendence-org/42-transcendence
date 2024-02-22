import time

import game_app.pong.state as state
import game_app.pong.input as input
import game_app.pong.constants as g

game_sessions = {}


class GameSession:
    def __init__(self, id, type, name1, name2) -> None:
        self.id = id
        self.type = type
        self.inputs = []
        self.last_input = 0
        self.t = 0.0
        self.saved_t = 0.0
        self.dt = 1.0 / 60.0
        self.accumulator = 0.0
        self.previous_time = 0
        self.name1 = name1
        self.name2 = name2
        self.ready1 = False
        self.ready2 = False
        self.state = state.GameState()


def session_loop(session):

    if session.state.status == g.STATUS_WAITING:
        return

    new_time = time.perf_counter()
    frame_time = new_time - session.previous_time
    session.previous_time = new_time

    # No need to divide since time.perf_counter() returns a time in seconds
    session.accumulator += frame_time

    while session.accumulator >= session.dt:
        session.last_input = input.apply_inputs(session, session.state)
        session.inputs = []
        state.state_update(session, session.state)
        session.accumulator -= session.dt
        session.t += session.dt

    # FIXME: Cleanup the game session when it is over
    if session.state.status == g.STATUS_QUIT:
        pass


def session_create(id, alias):
    game_sessions[id] = GameSession(id, g.TYPE_REMOTE, alias, "")


def session_exists(id):
    return id in game_sessions


def session_is_in(id, name):
    session = game_sessions[id]
    return name in [session.name1, session.name2]


def session_has(name):
    for id, session in game_sessions.items():
        if name in [session.name1, session.name2]:
            return id
    return None


def session_waiting(alias):
    for id, session in game_sessions.items():
        if session.name2 == "":
            session.name2 = alias
            session.state.status = g.STATUS_BEGIN
            return id
    return None


def session_add_input(game_id, alias, inpt, time):
    s = game_sessions[game_id]
    player_id = g.ID_PLAYER1 if s.name1 == alias else g.ID_PLAYER2
    s.inputs.append(input.Input(player_id, inpt, time))
    # Ensure inputs are in chronological order
    s.inputs.sort(key=lambda input: input.timestamp)


def session_update(id):
    session_loop(game_sessions[id])


def session_get_state(id):
    s = game_sessions[id]
    return {
        "id": str(s.id),
        "type": s.type,
        "status": s.state.status,
        "ball": {
            "x": s.state.ball.position.x,
            "y": s.state.ball.position.y,
            "w": s.state.ball.size.x,
            "h": s.state.ball.size.y,
            "vx": s.state.ball.velocity.x,
            "vy": s.state.ball.velocity.y,
        },
        "player1": {
            "name": s.name1,
            "score": s.state.score1,
            "x": s.state.player1.position.x,
            "y": s.state.player1.position.y,
            "w": s.state.player1.size.x,
            "h": s.state.player1.size.y,
            "vx": s.state.player1.velocity.x,
            "vy": s.state.player1.velocity.y,
        },
        "player2": {
            "name": s.name2,
            "score": s.state.score2,
            "x": s.state.player2.position.x,
            "y": s.state.player2.position.y,
            "w": s.state.player2.size.x,
            "h": s.state.player2.size.y,
            "vx": s.state.player2.velocity.x,
            "vy": s.state.player2.velocity.y,
        },
    }


# FIXME Send it in compact form
# FIXME Send only what is necessary during gameplay
def session_get_state_small(id):
    s = game_sessions[id]
    return {
        "ready1": s.ready1,
        "ready2": s.ready2,
        "last_input": s.last_input,
        "status": s.state.status,
        "ball": {
            "x": s.state.ball.position.x,
            "y": s.state.ball.position.y,
            "vx": s.state.ball.velocity.x,
            "vy": s.state.ball.velocity.y,
        },
        "player1": {
            "name": s.name1,
            "score": s.state.score1,
            "x": s.state.player1.position.x,
            "vx": s.state.player1.velocity.x,
        },
        "player2": {
            "name": s.name2,
            "score": s.state.score2,
            "x": s.state.player2.position.x,
            "vx": s.state.player2.velocity.x,
        },
    }
