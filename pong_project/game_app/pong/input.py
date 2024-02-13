import game_app.pong.constants as g
import game_app.pong.state as state


class Input:
    def __init__(self, id, input, time):
        self.id = id
        self.input = input
        self.timestamp = time


def apply_inputs(session):
    last_time = 0
    for input in session.inputs:
        player = session.state.player1 if input.id == g.ID_PLAYER1 else session.state.player2
        if input.input == g.INPUT_NEUTRAL:
            player.velocity.x = 0
        elif input.input == g.INPUT_LEFT:
            player.velocity.x = -g.PADDLE_SPEED
        elif input.input == g.INPUT_RIGHT:
            player.velocity.x = g.PADDLE_SPEED
        elif input.input == g.INPUT_SPACE and session.state.status in [g.STATUS_READY, g.STATUS_ENDED]:

            if input.id == g.ID_PLAYER1:
                session.ready1 = 1
            else:
                session.ready2 = 1

            if session.ready1 == 1 and session.ready2 == 1:
                session.ready1 = 0
                session.ready2 = 0
                if session.state.status == g.STATUS_READY:
                    session.state.status = g.STATUS_ACTIVE
                elif session.state.status == g.STATUS_ENDED:
                    state.reset_state(session.state)

        elif input.input == g.INPUT_QUIT and session.state.status == g.STATUS_ENDED:
            session.state.status = g.STATUS_QUIT
        last_time = input.timestamp
    return last_time
