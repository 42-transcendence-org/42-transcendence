import uuid

from django.db import models
from django.contrib.auth.models import User


class GameModel(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    player1 = models.ForeignKey(
        User,
        on_delete=models.SET_NULL,
        null=True,
        related_name="games_as_player1",
    )
    player2 = models.ForeignKey(
        User,
        on_delete=models.SET_NULL,
        null=True,
        related_name="games_as_player2",
    )
    # type = models.CharField(max_length=32, choices=GAME_TYPES)
    # status = models.CharField(max_length=32, choices=GAME_STATUSES)
    score1 = models.IntegerField(default=0)
    score2 = models.IntegerField(default=0)
