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
    player1_score = models.IntegerField()
    player2_score = models.IntegerField()
    player1_x = models.IntegerField()
    player1_y = models.IntegerField()
    player1_w = models.IntegerField()
    player1_h = models.IntegerField()
    player1_dx = models.IntegerField()
    player2_x = models.IntegerField()
    player2_y = models.IntegerField()
    player2_w = models.IntegerField()
    player2_h = models.IntegerField()
    player2_dx = models.IntegerField()
    ball_x = models.IntegerField()
    ball_y = models.IntegerField()
    ball_w = models.IntegerField()
    ball_h = models.IntegerField()
    ball_dx = models.IntegerField()
    ball_dy = models.IntegerField()
