import time

import pong_project.game_app.pong.input as state
import pong_project.game_app.pong.input as input
import pong_project.game_app.pong.constants as g


class GameSession:
    def __init__(self, id, type, name1, name2) -> None:
        self.id = id
        self.type = type
        self.inputs = []
        self.t = 0.0
        self.dt = 1.0 / 60.0
        self.accumulator = 0.0
        self.old_time = time.perf_counter()
        self.name1 = name1
        self.name2 = name2
        self.state = GameState()


async def loop(session):
    new_time = time.perf_counter()
    frame_time = new_time - session.old_time
    session.old_time = new_time

    # No need to divide since time.perf_counter() returns a time in seconds
    session.accumulator += frame_time

    while session.accumulator >= session.dt:
        await input.apply_inputs(session.state, session.inputs)
        if session.state.type != g.TYPE_REMOTE:
            session.inputs = []
        state.state_update(session.state, session.dt, session.t)
        session.accumulator -= session.dt
        session.t += session.dt

    # FIXME: Cleanup the game session when it is over
    if session.state.status == g.STATUS_QUIT:
        pass
