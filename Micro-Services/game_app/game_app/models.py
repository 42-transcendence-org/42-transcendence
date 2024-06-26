from django.db import models

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
    player1 = models.CharField(max_length=100, default="A")
    tourney_game = models.BooleanField(default=False)

    def __str__(self):
        return self.owner.nickname + " " + self.result

    class Meta:
        verbose_name = "Finished Pong Game"
        verbose_name_plural = "Finished Pong Games"

    def getMyHistory(user_id):
        return FinishedPongGames.objects.filter(owner=user_id, tourney_game=False)

    def countWins(user_id):
        return FinishedPongGames.objects.filter(owner=user_id, result="Victory", tourney_game=False).count()

    def countLosses(user_id):
        return FinishedPongGames.objects.filter(owner=user_id, result="Defeat", tourney_game=False).count()

    def getWinrate(user_id):
        if FinishedPongGames.objects.filter(owner=user_id, tourney_game=False).exists():
            return FinishedPongGames.objects.filter(owner=user_id, result="Victory", tourney_game=False).count() / FinishedPongGames.objects.filter(owner=user_id, tourney_game=False).count() * 100
        else:
            return 0

    def save(self, *args, **kwargs):
        self.full_clean()
        super().save(*args, **kwargs)
