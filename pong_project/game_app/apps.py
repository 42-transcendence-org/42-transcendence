import sys
import signal

from django.apps import AppConfig

from .game.GameManager import g_manager


def sigint_handler(signal, frame):
    global g_manager

    g_manager.thread_stop()
    sys.exit(0)


class PongGameConfig(AppConfig):
    default_auto_field = "django.db.models.BigAutoField"
    name = "game_app"

    def ready(self):
        global g_manager

        g_manager.thread_start()
        signal.signal(signal.SIGINT, sigint_handler)
