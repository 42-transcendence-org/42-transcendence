import time

import game_app.pong.game as game
import game_app.pong.constants as g
import game_app.pong.input as input

class GameManager:
    def __init__(self) -> None:
        self.tick = 0
        self.accumulator = 0
        self.old_time = time.perf_counter()
        self.game = game.Game()
        self.aliases = ["", ""]
        self.snapshot = None
        self.input = input.InputManager()

    def update(self, dt):
        new_time = time.perf_counter()
        time_delta = new_time - self.old_time
        self.old_time = new_time

        if time_delta > 0.25:
            time_delta = 0.25

        self.accumulator += time_delta

        while self.accumulator >= dt:
            self.tick += 1

            self.input.process_inputs(self.game)

            self.game.update(dt)

            self.accumulator -= dt

        self.serialize()

    def create_input(self, alias, input_id, timestamp):
        player_id = g.ID_PLAYER1 if self.aliases[g.ID_PLAYER1] == alias else g.ID_PLAYER2
        self.input.create_input(player_id, input_id, timestamp)

    def get_latest_snap(self):
        return self.snapshot

    def serialize(self):
        active_particles = self.game.particle_pool.get()
        score_arr = [self.game.scores[g.ID_PLAYER1], self.game.scores[g.ID_PLAYER2]]
        ready_arr = [self.game.players_ready[g.ID_PLAYER1], self.game.players_ready[g.ID_PLAYER2]]
        position_arr = [self.game.ball.position.x, self.game.ball.position.y, self.game.player1.position.x, self.game.player2.position.x]
        particle_arr = [(particle.rectangle.position.x, particle.rectangle.position.y) for particle in active_particles]
        sound_arr = [] # [(event.sound, event.timestamp) for event in self.sound_events]

        len_sound_arr = 0 # len(self.sound_events)
        len_particle_arr = len(active_particles)

        self.snapshot = [
            self.tick, # 0
            self.game.status, # 1
            score_arr, # 2
            ready_arr, # 3
            position_arr, # 4
            sound_arr, # 5
            particle_arr, # 6
            len_sound_arr, # 7
            len_particle_arr, # 8
        ]
