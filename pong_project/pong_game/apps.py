import signal

from django.apps import AppConfig

from .game import game_update_all_shutdown, game_update_all_thread


class PongGameConfig(AppConfig):
    default_auto_field = "django.db.models.BigAutoField"
    name = "pong_game"

    def ready(self):
        game_update_all_thread.start()
        signal.signal(signal.SIGINT, game_update_all_shutdown)
