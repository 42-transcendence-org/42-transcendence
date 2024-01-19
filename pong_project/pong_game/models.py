import uuid
from django.db import models


class Player(models.Model):
    session_id = models.CharField(max_length=100, unique=True)
    nickname = models.CharField(max_length=100, unique=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.nickname


class GameState(models.Model):
    GAME_STATUSES = [
        ("waiting", "Waiting for player..."),
        ("active", "Active"),
        ("paused", "Paused"),
        ("ended", "Ended"),
    ]
    game_status = models.CharField(max_length=8, choices=GAME_STATUSES)
    player1_score = models.IntegerField(default=0)
    player2_score = models.IntegerField(default=0)
    player1_x = models.IntegerField(default=0)
    player2_x = models.IntegerField(default=0)
    ball_x = models.IntegerField(default=0)
    ball_y = models.IntegerField(default=0)


class GameSession(models.Model):
    GAME_TYPES = [
        ("local", "Local"),
        ("remote", "Remote"),
        ("ai", "AI"),
    ]
    game_id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    game_type = models.CharField(max_length=6, choices=GAME_TYPES)
    start_time = models.DateTimeField(auto_now_add=True)
    last_updated = models.DateTimeField(auto_now=True)
    player1 = models.ForeignKey(
        Player, on_delete=models.SET_NULL, null=True, related_name="game_as_player1"
    )
    player2 = models.ForeignKey(
        Player, on_delete=models.SET_NULL, null=True, related_name="game_as_player2"
    )
    game_state = models.ForeignKey(GameState, on_delete=models.SET_NULL, null=True)

    def __str__(self):
        return f"Game ID: {self.game_id}, Type: {self.game_type}, Status: {self.game_state.game_status}"


from django.db import models


class GameResult(models.Model):
    game_id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    player1 = models.ForeignKey(
        Player, related_name="game_results_as_player1", on_delete=models.CASCADE
    )
    player2 = models.ForeignKey(
        Player,
        related_name="game_results_as_player2",
        on_delete=models.CASCADE,
        null=True,
        blank=True,
    )
    start_time = models.DateTimeField()
    end_time = models.DateTimeField()
    player1_score = models.IntegerField()
    player2_score = models.IntegerField()

    def __str__(self):
        return f"GameResult {self.game_id}: {self.player1.nickname} vs {self.player2.nickname} if self.player2 else 'AI'"


class Tournament(models.Model):
    TOURNAMENT_STATE = [
        ("ongoing", "Ongoing"),
        ("completed", "Completed"),
    ]
    organizer = models.ForeignKey(
        Player,
        on_delete=models.SET_NULL,
        null=True,
        related_name="organized_tournaments",
    )
    current_number_of_players = models.IntegerField(default=0)
    max_number_of_players = models.IntegerField()
    players = models.ManyToManyField(Player, related_name="tournaments", blank=True)
    start_date = models.DateTimeField()
    end_date = models.DateTimeField(null=True, blank=True)
    tournament_state = models.CharField(max_length=20, choices=TOURNAMENT_STATE)


class TournamentResult(models.Model):
    tournament = models.ForeignKey(
        Tournament, on_delete=models.CASCADE, related_name="results"
    )
    player = models.ForeignKey(Player, on_delete=models.CASCADE)
    victories = models.IntegerField(default=0)
    losses = models.IntegerField(default=0)

    class Meta:
        unique_together = ("tournament", "player")

    def __str__(self):
        return f"{self.player.nickname} in {self.tournament}: {self.victories} Wins, {self.losses} Losses"

    def __str__(self):
        return f"Tournament organized by {self.organizer.nickname}"
