import time
import threading

from uuid import UUID
from typing import Dict

from .game import Game
from .models import GameModel
from .serializers import GameSerializer


class GameManager:
    _instance = None

    def __init__(self):
        if GameManager._instance is not None:
            raise Exception("This class is a singleton!")
        else:
            GameManager._instance = self
            self.running = True
            self.game_sessions: Dict[UUID, Game] = {}
            self.load_active_games()
            self.update_thread = threading.Thread(target=self.update_games)
            self.update_thread.start()

    @classmethod
    def get_instance(cls):
        if cls._instance is None:
            cls._instance = GameManager()
        return cls._instance

    @classmethod
    def instance_exists(cls):
        return cls._instance is not None

    def update_games(self):
        update_interval = 1.0 / 30
        while self.running:
            start_time = time.time()

            for id, game in self.game_sessions.items():
                if game.game_type == "ai":
                    self.handle_ai_move(game)
                dt = time.time() - start_time  # Time elapsed since start of the loop
                game.update(dt)

            time_taken = time.time() - start_time
            sleep_time = max(0, update_interval - time_taken)
            time.sleep(sleep_time)

    def stop(self):
        # TODO Save all games to DB
        self.running = False
        self.update_thread.join()

    def load_active_games(self):
        active_games = GameModel.objects.filter(status="active")
        for game in active_games:
            self.add_game(game.id)

    def add_game(self, game_id):
        model = GameModel.objects.get(id=game_id)
        game = Game(model.type, model.status)
        game_serializer = GameSerializer(
            model,
            data={
                "type": game.type,
                "status": game.status,
                "player1_score": game.player1_score,
                "player2_score": game.player2_score,
                "player1_x": game.player1.x,
                "player2_x": game.player2.x,
                "ball_x": game.ball.x,
                "ball_y": game.ball.y,
            },
        )
        if game_serializer.is_valid():
            game_serializer.save()
            self.game_sessions[game_id] = game

    def get_game(self, game_id):
        return self.game_sessions.get(game_id)

    def delete_game(self, game_id):
        # TODO Add save state, then delete
        self.game_sessions.pop(game_id, None)

    def handle_ai_move(self, game):
        # AI logic implementation
        pass
