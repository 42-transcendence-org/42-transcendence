import sys
import signal
from django.apps import AppConfig
from .game_manager import GameManager, game_manager


def graceful_shutdown(signal, frame):
    game_manager.stop()
    sys.exit(0)


class PongGameConfig(AppConfig):
    default_auto_field = "django.db.models.BigAutoField"
    name = "pong_game"

    def ready(self):
        signal.signal(signal.SIGINT, graceful_shutdown)
        global game_manager  # This line tells Python to use the global variable declared in game_manager.py
        if game_manager == None:
            game_manager = GameManager()
        game_manager.load_active_games()
