import math

import game_app.pong.constants as g
import game_app.pong.physics as physics


class GameState:
    def __init__(self):
        self.status = g.STATUS_WAITING
        self.particles = []
        self.ball = physics.Rectangle(
            (g.BOARD_WIDTH - g.BALL_SIDE) / 2,
            (g.BOARD_HEIGHT - g.BALL_SIDE) / 2,
            g.BALL_SIDE,
            g.BALL_SIDE,
            0,
            g.BALL_SPEED_MIN,
        )
        self.player1 = physics.Rectangle(
            (g.BOARD_WIDTH - g.PADDLE_WIDTH) / 2,
            g.BOARD_HEIGHT - (3 * g.BOARD_MARGIN),
            g.PADDLE_WIDTH,
            g.BALL_SIDE,
            0,
            0,
        )
        self.player2 = physics.Rectangle(
            (g.BOARD_WIDTH - g.PADDLE_WIDTH) / 2, 2 * g.BOARD_MARGIN, g.PADDLE_WIDTH, g.BALL_SIDE, 0, 0
        )
        self.score1 = 0
        self.score2 = 0
        self.who_serves = True


def reset_ball(ball, who_serves):
    ball.position.x = (g.BOARD_WIDTH - ball.size.x) / 2
    ball.position.y = (g.BOARD_HEIGHT - ball.size.y) / 2
    ball.velocity.x = 0
    ball.velocity.y = g.BALL_SPEED_MIN if who_serves else -g.BALL_SPEED_MIN


def reset_state(state):
    state.status = g.STATUS_ACTIVE
    state.particles = []
    state.ball = physics.Rectangle(
        (g.BOARD_WIDTH - g.BALL_SIDE) / 2,
        (g.BOARD_HEIGHT - g.BALL_SIDE) / 2,
        g.BALL_SIDE,
        g.BALL_SIDE,
        0,
        g.BALL_SPEED_MIN,
    )
    state.player1 = physics.Rectangle(
        (g.BOARD_WIDTH - g.PADDLE_WIDTH) / 2, g.BOARD_HEIGHT - (3 * g.BOARD_MARGIN), g.PADDLE_WIDTH, g.BALL_SIDE, 0, 0
    )
    state.player2 = physics.Rectangle(
        (g.BOARD_WIDTH - g.PADDLE_WIDTH) / 2, 2 * g.BOARD_MARGIN, g.PADDLE_WIDTH, g.BALL_SIDE, 0, 0
    )
    state.score1 = 0
    state.score2 = 0


def update_ball_velocity(ball, paddle, normal):
    expanded = physics.Rectangle(
        paddle.position.x - ball.size.x / 2,
        paddle.position.y - ball.size.y / 2,
        paddle.size.x + ball.size.x,
        paddle.size.y + ball.size.y,
        0,
        0,
    )
    b_center = physics.Vector(ball.position.x + ball.size.x / 2, ball.position.y + ball.size.y / 2)
    p_center = physics.Vector(expanded.position.x + expanded.size.x / 2, expanded.position.y + expanded.size.y / 2)

    if normal.x != 0:
        c = ((b_center.y - p_center.y) / (expanded.size.y / 2)) * g.BALL_MAX_ANGLE
        ball.velocity.x = normal.x * math.cos(c) * g.BALL_SPEED_MAX
        ball.velocity.y = math.sin(c) * g.BALL_SPEED_MAX
    elif normal.y != 0:
        c = ((b_center.x - p_center.x) / (expanded.size.x / 2)) * g.BALL_MAX_ANGLE
        ball.velocity.x = math.sin(c) * g.BALL_SPEED_MAX
        ball.velocity.y = normal.y * math.cos(c) * g.BALL_SPEED_MAX


def update_paddle_position(ball, paddle, dt):
    c_ball = physics.aabb_continuous_detection(paddle, ball, dt)
    if c_ball.time > 0 and c_ball.time <= 1.0:
        v = physics.aabb_continuous_resolve(paddle, c_ball)
        paddle.position.x += v.x * dt
        c_ball.normal.x *= -1
        update_ball_velocity(ball, paddle, c_ball.normal)
    elif (
        paddle.position.x + paddle.velocity.x * dt > g.BOARD_CORRIDOR
        and paddle.position.x + paddle.size.x + paddle.velocity.x * dt < g.BOARD_WIDTH - g.BOARD_CORRIDOR
    ):
        paddle.position.x += paddle.velocity.x * dt


def update_ball_position(state, dt):
    player = None
    collision = None

    c1 = physics.aabb_continuous_detection(state.ball, state.player1, dt)
    c2 = physics.aabb_continuous_detection(state.ball, state.player2, dt)

    if c1.time > 0:
        player = state.player1
        collision = c1
    elif c2.time > 0:
        player = state.player2
        collision = c2

    if collision is not None and player is not None and collision.time > 0 and collision.time <= 1.0:
        v = physics.aabb_continuous_resolve(state.ball, collision)
        state.ball.position.x += v.x * dt
        state.ball.position.y += v.y * dt
        update_ball_velocity(state.ball, player, collision.normal)
    else:
        state.ball.position.x += state.ball.velocity.x * dt
        state.ball.position.y += state.ball.velocity.y * dt

    if (
        state.ball.position.x <= g.BOARD_MARGIN
        or state.ball.position.x + state.ball.size.x >= g.BOARD_WIDTH - g.BOARD_MARGIN
    ):
        # Left and right walls
        state.ball.position.x = (
            g.BOARD_MARGIN
            if state.ball.position.x <= g.BOARD_MARGIN
            else g.BOARD_WIDTH - state.ball.size.x - g.BOARD_MARGIN
        )
        state.ball.velocity.x *= -1
    elif (
        state.ball.position.y <= g.BOARD_MARGIN
        or state.ball.position.y + state.ball.size.y >= g.BOARD_HEIGHT - g.BOARD_MARGIN
    ):
        # Top and bottom wall
        if state.ball.position.y <= g.BOARD_MARGIN:
            state.score1 += 1
        else:
            state.score2 += 1
        state.status = g.STATUS_SCORE


def state_update(session, state):
    if state.status in [g.STATUS_BEGIN, g.STATUS_PAUSED, g.STATUS_QUIT]:
        return

    update_paddle_position(state.ball, state.player1, session.dt)
    update_paddle_position(state.ball, state.player2, session.dt)

    if state.status in [g.STATUS_SCORE, g.STATUS_ENDED_1, g.STATUS_ENDED_2]:
        if session.t - session.saved_t < 1.5:
            return
        elif state.status == g.STATUS_SCORE:
            state.status = g.STATUS_ACTIVE
            state.who_serves = not state.who_serves
            reset_ball(state.ball, state.who_serves)

    session.saved_t = session.t
    # This allows for the particle effect to finish updating when the game is over
    if state.status in [g.STATUS_ENDED_1, g.STATUS_ENDED_2]:
        return

    update_ball_position(state, session.dt)

    if state.score1 == g.POINTS_TO_WIN or state.score2 == g.POINTS_TO_WIN:
        state.status = g.STATUS_ENDED_1 if state.score1 == g.POINTS_TO_WIN else g.STATUS_ENDED_2
