import sys
import signal

from django.apps import AppConfig

from game.GameManager import GameManager

manager = None


def sigint_handler(signal, frame):
    global manager

    if manager is not None:
        manager.thread_stop()
    sys.exit(0)


class PongGameConfig(AppConfig):
    default_auto_field = "django.db.models.BigAutoField"
    name = "game_app"

    def ready(self):
        global manager

        if manager is None:
            manager = GameManager()
        manager.thread_start()
        signal.signal(signal.SIGINT, sigint_handler)
