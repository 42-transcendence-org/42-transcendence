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
    score1 = models.IntegerField(default=0)
    score2 = models.IntegerField(default=0)



class FinishedPongGames(models.Model):
    owner = models.IntegerField(default=-1)
    game_type = models.CharField(max_length=100, default="None")
    opponent = models.CharField(max_length=100, default="Player 2")
    player_score = models.IntegerField(default=0)
    opponent_score = models.IntegerField(default=0)
    winner = models.CharField(max_length=100, default="Player 2")
    result = models.CharField(max_length=100, default="None")
    completion_day = models.CharField(max_length=100, default="None")
    completion_time = models.CharField(max_length=100, default="None")

    def __str__(self):
        return self.owner.nickname + " " + self.result
    
    class Meta:
        verbose_name = "Finished Pong Game"
        verbose_name_plural = "Finished Pong Games"
    
    def getMyHistory(profile):
        return FinishedPongGames.objects.filter(owner=profile)
    
    def countWins(profile):
        return FinishedPongGames.objects.filter(owner=profile, result="Victory").count()
    
    def countLosses(profile):
        return FinishedPongGames.objects.filter(owner=profile, result="Defeat").count()
    
    def countDraws(profile): #return 0 if no game found
        return FinishedPongGames.objects.filter(owner=profile, result="draw").count()
    