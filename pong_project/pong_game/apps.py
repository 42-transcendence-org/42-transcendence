from django.apps import AppConfig
from .game_manager import GameManager


class PongGameConfig(AppConfig):
    default_auto_field = "django.db.models.BigAutoField"
    name = "pong_game"

    # def ready(self):
    #     # Instantiate and start the GameManager
    #     if not hasattr(self, "game_manager"):
    #         self.game_manager = GameManager()
