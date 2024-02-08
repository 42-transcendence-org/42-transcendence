import pong_project.game_app.pong.constants as g


class Input:
    def __init__(self, id, input, time):
        self.id = id
        self.input = input
        self.timestamp = time


def apply_inputs(state, inputs):
    for input in inputs:
        player = state.player1 if input.id == g.ID_PLAYER1 else state.player2
        if input.input == g.INPUT_NEUTRAL:
            player.velocity.x = 0
        elif input.input == g.INPUT_LEFT:
            player.velocity.x = -g.PADDLE_SPEED
        elif input.input == g.INPUT_RIGHT:
            player.velocity.x = g.PADDLE_SPEED
        elif input.input == g.INPUT_SPACE:
            if state.status == g.STATUS_WAITING:
                state.status = g.STATUS_ACTIVE
            elif state.status in [g.STATUS_ACTIVE, g.STATUS_PAUSED]:
                state.status = g.STATUS_PAUSED if state.status == g.STATUS_ACTIVE else g.STATUS_ACTIVE
            elif state.status in [g.STATUS_ENDED_1, g.STATUS_ENDED_2]:
                state.status = g.STATUS_ACTIVE
                g.reset_state(state)
        elif input.input == g.INPUT_QUIT:
            if state.status in [g.STATUS_ENDED_1, g.STATUS_ENDED_2]:
                state.status = g.STATUS_QUIT
