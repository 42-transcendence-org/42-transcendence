from django.apps import AppConfig
from .game_manager import GameManager, game_manager


# TODO If possible, move instantiation of game_manager out of here
class PongGameConfig(AppConfig):
    default_auto_field = "django.db.models.BigAutoField"
    name = "pong_game"

    def ready(self):
        global game_manager  # This line tells Python to use the global variable
        if game_manager == None:
            game_manager = GameManager()
