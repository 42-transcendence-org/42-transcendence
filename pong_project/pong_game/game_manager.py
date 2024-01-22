import time
import threading

from uuid import UUID
from typing import Dict

from .game import PongGame

game_manager = None


# TODO Implement a mechanism to restore game sessions from the database i.e take all game with status 'active'
class GameManager:
    def __init__(self):
        self.game_sessions: Dict[UUID, PongGame] = {}
        self.running = True
        self.update_thread = threading.Thread(target=self.update_games)
        self.update_thread.start()

    def update_games(self):
        update_interval = 1.0 / 60  # Desired update rate (e.g., 60 times per second)
        while self.running:
            start_time = time.time()

            for _, game in self.game_sessions.items():
                if game.game_type == "ai":
                    self.handle_ai_move(game)
                dt = time.time() - start_time  # Time elapsed since start of the loop
                game.update(dt)

            time_taken = time.time() - start_time
            sleep_time = max(0, update_interval - time_taken)
            time.sleep(sleep_time)

    def stop(self):
        self.running = False
        self.update_thread.join()

    def add_game(self, game_id, game_instance):
        self.game_sessions[game_id] = game_instance

    def get_game(self, game_id):
        return self.game_sessions.get(game_id)

    def delete_game(self, game_id):
        self.game_sessions.pop(game_id, None)

    def handle_ai_move(self, game):
        # AI logic implementation
        pass
