import uuid

from django.db import models
from django.contrib.auth.models import User

from . import constants as const


class GameModel(models.Model):
    # Session
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    player1 = models.ForeignKey(
        User,
        on_delete=models.SET_NULL,
        null=True,
        related_name="game_sessions_as_player1",
    )
    player2 = models.ForeignKey(
        User,
        on_delete=models.SET_NULL,
        null=True,
        related_name="game_sessions_as_player2",
    )

    # State
    type = models.CharField(max_length=32, choices=const.GAME_TYPES)
    status = models.CharField(max_length=32, choices=const.GAME_STATUSES)
    player1_score = models.IntegerField(default=0)
    player2_score = models.IntegerField(default=0)
    player1_x = models.IntegerField(default=0)
    player1_y = models.IntegerField(default=0)
    player1_w = models.IntegerField(default=0)
    player1_h = models.IntegerField(default=0)
    player1_dx = models.IntegerField(default=0)
    player2_x = models.IntegerField(default=0)
    player2_y = models.IntegerField(default=0)
    player2_w = models.IntegerField(default=0)
    player2_h = models.IntegerField(default=0)
    player2_dx = models.IntegerField(default=0)
    ball_x = models.IntegerField(default=0)
    ball_y = models.IntegerField(default=0)
    ball_w = models.IntegerField(default=0)
    ball_h = models.IntegerField(default=0)
    ball_dx = models.IntegerField(default=0)
    ball_dy = models.IntegerField(default=0)
