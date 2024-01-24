import sys
import signal
from django.apps import AppConfig


def graceful_shutdown(signal, frame):
    from .game_manager import GameManager

    if GameManager.instance_exists():
        game_manager = GameManager.get_instance()
        game_manager.stop()
    sys.exit(0)


class PongGameConfig(AppConfig):
    default_auto_field = "django.db.models.BigAutoField"
    name = "pong_game"

    def ready(self):
        signal.signal(signal.SIGINT, graceful_shutdown)
