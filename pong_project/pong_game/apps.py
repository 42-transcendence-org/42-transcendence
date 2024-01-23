import sys
import signal
from django.apps import AppConfig

from .game_manager import GameManager


def graceful_shutdown(signal, frame):
    if GameManager.instance_exists():
        game_manager = GameManager.get_instance()
        game_manager.stop()
    sys.exit(0)


class PongGameConfig(AppConfig):
    default_auto_field = "django.db.models.BigAutoField"
    name = "pong_game"

    def ready(self):
        GameManager.get_instance()
        signal.signal(signal.SIGINT, graceful_shutdown)
