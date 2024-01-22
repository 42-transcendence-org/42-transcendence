import uuid
from django.db import models
from django.contrib.auth.models import User

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
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    type = models.CharField(max_length=10, choices=GAME_TYPES)
    status = models.CharField(max_length=8, choices=GAME_STATUSES, default="waiting")
    time_started = models.DateTimeField(auto_now_add=True)
    time_ended = models.DateTimeField(null=True, blank=True)
    last_updated = models.DateTimeField(auto_now=True)
    player1 = models.ForeignKey(
        User, on_delete=models.SET_NULL, null=True, related_name="game_as_player1"
    )
    player2 = models.ForeignKey(
        User, on_delete=models.SET_NULL, null=True, related_name="game_as_player2"
    )
    player1_score = models.IntegerField(default=0)
    player2_score = models.IntegerField(default=0)
    player1_x = models.IntegerField(default=0)
    player2_x = models.IntegerField(default=0)
    ball_x = models.IntegerField(default=0)
    ball_y = models.IntegerField(default=0)


class TournamentModel(models.Model):
    tournament_id = models.UUIDField(
        primary_key=True, default=uuid.uuid4, editable=False
    )
    tournament_name = models.CharField(max_length=64)
    organizer = models.ForeignKey(
        User,
        on_delete=models.SET_NULL,
        null=True,
        related_name="organized_tournaments",
    )
    current_number_of_players = models.IntegerField(default=0)
    max_number_of_players = models.IntegerField()
    current_round = models.IntegerField(default=1)
    total_rounds = models.IntegerField(default=1)
    is_active = models.BooleanField(default=True)
    players = models.ManyToManyField(User, related_name="tournaments", blank=True)
    games = models.ManyToManyField(GameModel)
    winner = models.ForeignKey(
        User,
        related_name="won_tournaments",
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
    )
    start_date = models.DateTimeField(auto_now_add=True)
    end_date = models.DateTimeField(null=True, blank=True)
    last_updated = models.DateTimeField(auto_now=True)
