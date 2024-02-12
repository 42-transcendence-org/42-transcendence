import game_app.pong.constants as g


class Input:
    def __init__(self, id, input, time):
        self.id = id
        self.input = input
        self.timestamp = time


def apply_inputs(session, state):
    last_time = None
    for input in session.inputs:
        player = state.player1 if input.id == g.ID_PLAYER1 else state.player2
        if input.input == g.INPUT_NEUTRAL:
            player.velocity.x = 0
        elif input.input == g.INPUT_LEFT:
            player.velocity.x = -g.PADDLE_SPEED
        elif input.input == g.INPUT_RIGHT:
            player.velocity.x = g.PADDLE_SPEED
        elif input.input == g.INPUT_SPACE and state.status in [g.STATUS_BEGIN, g.STATUS_ENDED_1, g.STATUS_ENDED_2]:

            if input.id == g.ID_PLAYER1:
                session.ready1 = True
            else:
                session.ready2 = True

            if session.ready1 and session.ready2:
                state.status = g.STATUS_ACTIVE
                session.ready1 = False
                session.ready2 = False
            if state.status in [g.STATUS_ENDED_1, g.STATUS_ENDED_2]:
                pass
        elif input.input == g.INPUT_QUIT:
            if state.status in [g.STATUS_ENDED_1, g.STATUS_ENDED_2]:
                state.status = g.STATUS_QUIT
        last_time = input.timestamp
    return last_time
