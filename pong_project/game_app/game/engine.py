import time



from utils import game_create

dt = 1.0 / 60.0

render = None
integrate = None

instances = []





def game_update_all():
    for i in instances:
        loop(i)


def loop(game_instance):
    new_time = time.perf_counter()
    frame_time = new_time - game_instance["current_time"]
    game_instance["current_time"] = new_time

    game_instance["accumulator"] += frame_time

    while game_instance["accumulator"] >= dt:
        integrate(game_instance["state"], dt)
        game_instance["accumulator"] -= dt
        t += dt


def start_loop(user_init, user_update, user_draw):
    user_init()
    render = user_draw
    integrate = user_update
    current_time = performance.now()
    requestAnimationFrame(loop)
