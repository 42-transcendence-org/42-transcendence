import math

from physics import all as physics

CANVAS_WIDTH = 480
CANVAS_HEIGHT = 650

LEFT = -1
RIGHT = 1
NEUTRAL = 0

MARGIN = 16
CORRIDOR = 2 * MARGIN + 8
BALL_SPEED_MAX = 0.70
BALL_SPEED_MIN = 0.40

PADDLE_SPEED_MAX = 1.0
PADDLE_ACCELERATION = 1.0 / 8000
PADDLE_DECCELERATION = 1.0 / 5000

POINTS_TO_WIN = 10

MAX_ANGLE = math.pi / 6

g_inputs = [0, 0]

particles = []

who_scored = 0

state = {
    "type": "local",
    "status": "waiting",
    "ball": physics.Rectangle(0, 0, 16, 16, 0, 0),
    "player1": physics.Rectangle(0, 0, 64, 16, 0, 0),
    "player2": physics.Rectangle(0, 0, 64, 16, 0, 0),
    "player1_score": 0,
    "player2_score": 0,
    "player1_name": "Player 1",
    "player2_name": "Player 2",
}


def user_init():
    game_reset()


def reset_ball(direction):
    state["ball"].position.x = (CANVAS_WIDTH - state["ball"].size.x) / 2
    state["ball"].position.y = (CANVAS_HEIGHT - state["ball"].size.y) / 2
    state["ball"].velocity = physics.get_vector_in_range(direction, MAX_ANGLE)
    state["ball"].velocity.x *= BALL_SPEED_MIN
    state["ball"].velocity.y *= BALL_SPEED_MIN


def game_reset():
    state.player1.position.x = state.player2.position.x = (
        CANVAS_WIDTH - state.player1.size.x
    ) / 2
    state.player1.position.y = CANVAS_HEIGHT - (3 * MARGIN)
    state.player2.position.y = 2 * MARGIN
    state.player1_score = 0
    state.player2_score = 0

    reset_ball(physics.Vector(0, 1))


def update_paddle_velocity(n, p):
    if g_inputs[n] != NEUTRAL:
        dv = PADDLE_ACCELERATION * g_inputs[n]
        p.velocity.x += dv
        p.velocity.x = min(max(p.velocity.x, -PADDLE_SPEED_MAX), PADDLE_SPEED_MAX)
    else:
        sign = (p.velocity.x > 0) - (
            p.velocity.x < 0
        )  # Equivalent to Math.sign in JavaScript
        dv = -sign * PADDLE_DECCELERATION
        p.velocity.x += dv
        if abs(p.velocity.x) < PADDLE_DECCELERATION:
            p.velocity.x = 0


def update_ball_velocity(r1, r2, collision):
    r2_expanded = physics.Rectangle(
        r2.position.x - r1.size.x / 2,
        r2.position.y - r1.size.y / 2,
        r2.size.x + r1.size.x,
        r2.size.y + r1.size.y,
        0,
        0,
    )

    # Update velocity based on collision normal on the x-axis
    if collision.normal.x != 0:
        r1_center = r1.position.y + r1.size.y / 2
        r2_center = r2_expanded.position.y + r2_expanded.size.y / 2
        c = (r1_center - r2_center) / (r2_expanded.size.y / 2)
        c *= MAX_ANGLE
        r1.velocity.x = collision.normal.x * math.cos(c) * BALL_SPEED_MAX
        r1.velocity.y = math.sin(c) * BALL_SPEED_MAX

    # Update velocity based on collision normal on the y-axis
    if collision.normal.y != 0:
        r1_center = r1.position.x + r1.size.x / 2
        r2_center = r2_expanded.position.x + r2_expanded.size.x / 2
        c = (r1_center - r2_center) / (r2_expanded.size.x / 2)
        c *= MAX_ANGLE
        r1.velocity.x = math.sin(c) * BALL_SPEED_MAX
        r1.velocity.y = collision.normal.y * math.cos(c) * BALL_SPEED_MAX


def update_paddle_position(n, p, b, dt):
    if (
        g_inputs[n] != NEUTRAL
        and p.position.x + p.velocity.x * dt > CORRIDOR
        and p.position.x + p.size.x + p.velocity.x * dt < CANVAS_WIDTH - CORRIDOR
    ):
        coll = physics.aabb_continuous_detection(p, b, dt)
        if 0 < coll.time <= 1.0:
            physics.aabb_continuous_resolve(p, coll)
            coll.normal.x *= -1
            update_ball_velocity(state["ball"], state["player1"], coll)
            state["ball"].position.x += state["ball"].velocity.x * (1 - coll.time)
            state["ball"].position.y += state["ball"].velocity.y * (1 - coll.time)
        else:
            p.position.x += p.velocity.x * dt


def user_update(dt):
    global who_scored, particles  # Assuming these are global variables

    if state["status"] == "waiting":
        return

    update_paddle_velocity(0, state["player1"])
    update_paddle_velocity(1, state["player2"])
    update_paddle_position(0, state["player1"], state["ball"], dt)
    update_paddle_position(1, state["player2"], state["ball"], dt)

    if len(particles) > 0:
        physics.particles_update(particles, dt)
        if len(particles) > 0:
            return
        if who_scored == 1:
            reset_ball(physics.Vector(0, 1))
        else:
            reset_ball(physics.Vector(0, -1))

    # This allows for the particle effect to finish updating when the game is over
    if state["status"] == "ended1" or state["status"] == "ended2":
        return

    player = None
    collision = None

    c1 = physics.aabb_continuous_detection(state["ball"], state["player1"], dt)
    c2 = physics.aabb_continuous_detection(state["ball"], state["player2"], dt)
    if c1["time"] > 0:
        player = state["player1"]
        collision = c1
    elif c2["time"] > 0:
        player = state["player2"]
        collision = c2

    # Collision resolution
    if collision is not None and 0 < collision["time"] <= 1.0:
        physics.aabb_continuous_resolve(state["ball"], collision)
        update_ball_velocity(state["ball"], player, collision)
        state["ball"].position.x += state["ball"].velocity.x * (1 - collision["time"])
        state["ball"].position.y += state["ball"].velocity.y * (1 - collision["time"])
    else:
        state["ball"].position.x += state["ball"].velocity.x * dt
        state["ball"].position.y += state["ball"].velocity.y * dt

    if state["ball"].position.x <= MARGIN:
        # Left wall
        state["ball"].position.x = MARGIN
        state["ball"].velocity.x *= -1
    elif state["ball"].position.x + state["ball"].size.x >= CANVAS_WIDTH - MARGIN:
        # Right wall
        state["ball"].position.x = CANVAS_WIDTH - state["ball"].size.x - MARGIN
        state["ball"].velocity.x *= -1
    elif state["ball"].position.y <= MARGIN:
        # Top wall
        who_scored = 1
        state["player1_score"] += 1
        physics.particles_create(particles, state["ball"], 16)
    elif state["ball"].position.y + state["ball"].size.y >= CANVAS_HEIGHT - MARGIN:
        # Bottom wall
        who_scored = 2
        state["player2_score"] += 1
        physics.particles_create(particles, state["ball"], 16)

    if state["player1_score"] == POINTS_TO_WIN:
        state["status"] = "ended1"
    elif state["player2_score"] == POINTS_TO_WIN:
        state["status"] = "ended2"
