import time
import threading

from uuid import UUID
from typing import Dict

from .game import Game
from .models import GameModel


def save_game_state(uuid: UUID, game: Game) -> None:
    """
    Saves the current state of a Game instance into the database.

    This function updates an existing GameModel instance with the specified UUID
    with the current state of the provided Game instance. If no GameModel instance
    with the given UUID exists, a new one is created and populated with the Game's state.

    Parameters:
    uuid (UUID): The unique identifier of the game session to update or create.
    game (Game): The Game instance whose state is to be saved.

    Returns:
    None

    Raises:
    TypeError: If 'game' is not an instance of Game.
    """

    game_model = GameModel.objects.get_or_create(id=uuid)

    game_model.type = game.type
    game_model.status = game.status
    game_model.player1_score = game.player1_score
    game_model.player2_score = game.player2_score
    game_model.player1_x = game.player1.x
    game_model.player1_y = game.player1.y
    game_model.player1_w = game.player1.w
    game_model.player1_h = game.player1.h
    game_model.player1_dx = game.player1.dx
    game_model.player2_x = game.player2.x
    game_model.player2_y = game.player2.y
    game_model.player2_w = game.player2.w
    game_model.player2_h = game.player2.h
    game_model.player2_dx = game.player2.dx
    game_model.ball_x = game.ball.x
    game_model.ball_y = game.ball.y
    game_model.ball_w = game.ball.w
    game_model.ball_h = game.ball.h
    game_model.ball_dx = game.ball.dx
    game_model.ball_dy = game.ball.dy

    game_model.save()


def load_game_state(uuid: UUID) -> Game:
    """
    Loads a Game instance from the database using the specified UUID.

    This function retrieves the state of a game session from the database
    and uses it to populate and return a new Game instance. The function
    looks for a GameModel instance with the provided UUID and initializes
    a Game instance with its state.

    Parameters:
    uuid (UUID): The unique identifier of the game session to load.

    Returns:
    Game: A new Game instance populated with the state from the database.

    Raises:
    ValueError: If no GameModel with the given UUID exists.
    """

    try:
        game_model = GameModel.objects.get(id=uuid)
    except GameModel.DoesNotExist:
        raise ValueError("GameModel with the given UUID does not exist.")

    game = Game()

    game.type = game_model.type
    game.status = game_model.status
    game.player1_score = game_model.player1_score
    game.player2_score = game_model.player2_score
    game.player1.x = game_model.player1_x
    game.player1.y = game_model.player1_y
    game.player1.w = game_model.player1_w
    game.player1.h = game_model.player1_h
    game.player1.dx = game_model.player1_dx
    game.player2.x = game_model.player2_x
    game.player2.y = game_model.player2_y
    game.player2.w = game_model.player2_w
    game.player2.h = game_model.player2_h
    game.player2.dx = game_model.player2_dx
    game.ball.x = game_model.ball_x
    game.ball.y = game_model.ball_y
    game.ball.w = game_model.ball_w
    game.ball.h = game_model.ball_h
    game.ball.dx = game_model.ball_dx
    game.ball.dy = game_model.ball_dy

    return game


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
        pass

    def get_game(self, game_id):
        return self.game_sessions.get(game_id)

    def delete_game(self, game_id):
        # TODO Add save state, then delete
        self.game_sessions.pop(game_id, None)

    def handle_ai_move(self, game):
        # AI logic implementation
        pass
