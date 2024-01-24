import uuid
from django.db import models
from django.contrib.auth.models import User

from .game import (
    BOARD_WIDTH,
    BOARD_HEIGHT,
    PADDLE_WIDTH,
    PADDLE_HEIGHT,
    PADDLE_DX,
    BALL_WIDTH,
    BALL_HEIGHT,
)

GAME_TYPES = [
    ("local", "Local"),
    ("remote", "Remote"),
    ("ai", "AI"),
]

GAME_STATUSES = [
    ("waiting", "Waiting for player..."),
    ("active", "Active"),
    ("paused", "Paused"),
    ("ended", "Ended"),
]

GAME_ACTIONS = ["left", "right", "pause", "quit"]

PLAYER_ID = ["1", "2"]


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
    type = models.CharField(max_length=32, choices=GAME_TYPES)
    status = models.CharField(max_length=32, choices=GAME_STATUSES)
    player1_score = models.IntegerField(default=0)
    player2_score = models.IntegerField(default=0)
    player1_x = models.IntegerField(default=0)
    player1_y = models.IntegerField(default=0)
    player1_w = models.IntegerField(default=PADDLE_WIDTH)
    player1_h = models.IntegerField(default=PADDLE_HEIGHT)
    player1_dx = models.IntegerField(default=PADDLE_DX)
    player2_x = models.IntegerField(default=0)
    player2_y = models.IntegerField(default=0)
    player2_w = models.IntegerField(default=PADDLE_WIDTH)
    player2_h = models.IntegerField(default=PADDLE_HEIGHT)
    player2_dx = models.IntegerField(default=PADDLE_DX)
    ball_x = models.IntegerField(default=0)
    ball_y = models.IntegerField(default=0)
    ball_w = models.IntegerField(default=BALL_WIDTH)
    ball_h = models.IntegerField(default=BALL_HEIGHT)
    ball_dx = models.IntegerField(default=0)
    ball_dy = models.IntegerField(default=0)
