import uuid
from django.db import models
from django.contrib.auth.models import User

GAME_TYPES = [
    ("local", "Local"),
    ("remote", "Remote"),
    ("ai", "AI"),
    ("tournament", "TournamentSession"),
]

GAME_STATUSES = [
    ("waiting", "Waiting for player..."),
    ("active", "Active"),
    ("paused", "Paused"),
    ("ended", "Ended"),
]


class GameState(models.Model):
    game_status = models.CharField(max_length=8, choices=GAME_STATUSES)
    player1_score = models.IntegerField(default=0)
    player2_score = models.IntegerField(default=0)
    player1_x = models.IntegerField(default=0)
    player2_x = models.IntegerField(default=0)
    ball_x = models.IntegerField(default=0)
    ball_y = models.IntegerField(default=0)


class TournamentState(models.Model):
    current_round = models.IntegerField(default=1)
    total_rounds = models.IntegerField()
    is_active = models.BooleanField(default=True)

    def __str__(self):
        return f"Tournament State for {self.tournament.tournament_name}, Round {self.current_round}"


class GameSession(models.Model):
    game_id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    game_type = models.CharField(max_length=10, choices=GAME_TYPES)
    start_date = models.DateTimeField(auto_now_add=True)
    end_date = models.DateTimeField(null=True, blank=True)
    last_updated = models.DateTimeField(auto_now=True)
    player1 = models.ForeignKey(
        User, on_delete=models.SET_NULL, null=True, related_name="game_as_player1"
    )
    player2 = models.ForeignKey(
        User, on_delete=models.SET_NULL, null=True, related_name="game_as_player2"
    )
    game_state = models.ForeignKey(GameState, on_delete=models.SET_NULL, null=True)

    def __str__(self):
        return f"Game ID: {self.game_id}, Type: {self.game_type}, Status: {self.game_state.game_status}"


class TournamentSession(models.Model):
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
    players = models.ManyToManyField(User, related_name="tournaments", blank=True)
    start_date = models.DateTimeField(auto_now_add=True)
    end_date = models.DateTimeField(null=True, blank=True)
    last_updated = models.DateTimeField(auto_now=True)


class GameResult(models.Model):
    game_id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    player1 = models.ForeignKey(
        User, related_name="game_results_as_player1", on_delete=models.CASCADE
    )
    player2 = models.ForeignKey(
        User,
        related_name="game_results_as_player2",
        on_delete=models.CASCADE,
        null=True,
        blank=True,
    )
    game_type = models.CharField(max_length=10, choices=GAME_TYPES)
    start_time = models.DateTimeField()
    end_time = models.DateTimeField()
    player1_score = models.IntegerField()
    player2_score = models.IntegerField()

    def __str__(self):
        return f"GameResult {self.game_id}: {self.player1.nickname} vs {self.player2.nickname} if self.player2 else 'AI'"


class TournamentResult(models.Model):
    tournament = models.ForeignKey(TournamentSession, on_delete=models.CASCADE)
    players = models.ManyToManyField(User)
    games = models.ManyToManyField(GameResult)
    winner = models.ForeignKey(
        User,
        related_name="won_tournaments",
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
    )
    start_date = models.DateTimeField()
    end_date = models.DateTimeField()

    def __str__(self):
        return f"TournamentResult for {self.tournament}"
