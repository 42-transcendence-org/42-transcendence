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
        elif input.input == g.INPUT_SPACE and state.status in [g.STATUS_READY, g.STATUS_ENDED]:

            if input.id == g.ID_PLAYER1:
                session.ready1 = 1
            else:
                session.ready2 = 1

            if session.ready1 == 1 and session.ready2 == 1:
                state.status = g.STATUS_ACTIVE
                session.ready1 = 0
                session.ready2 = 0
            if state.status == g.STATUS_ENDED:
                pass
        elif input.input == g.INPUT_QUIT:
            if state.status == g.STATUS_ENDED:
                state.status = g.STATUS_QUIT
        last_time = input.timestamp
    return last_time
