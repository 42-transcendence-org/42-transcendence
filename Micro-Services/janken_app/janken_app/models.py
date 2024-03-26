from django.db import models
from django.utils import timezone


class FinishedJankenGames(models.Model):
    owner = models.ForeignKey(Profile, on_delete = models.CASCADE, related_name='JankenHistoryOwner')
    opponent = models.ForeignKey(Profile, on_delete = models.CASCADE, related_name='JankenHistoryOpponent')
    owner_choice = models.CharField(max_length=100)
    opponent_choice = models.CharField(max_length=100)
    result = models.CharField(max_length=100)
    completion_time = models.DateTimeField()
    loser = models.CharField(max_length=100)
    winner = models.CharField(max_length=100)

    def __str__(self):
        return self.owner.nickname + " " + self.result
    
    class Meta:
        verbose_name = "Finished Janken Game"
        verbose_name_plural = "Finished Janken Games"
    
    def getMyHistory(profile):
        return FinishedJankenGames.objects.filter(owner=profile)
    
    def countWins(profile):
        return FinishedJankenGames.objects.filter(owner=profile, result="Victory").count()
    
    def countLosses(profile):
        return FinishedJankenGames.objects.filter(owner=profile, result="Defeat").count()
    
    def countDraws(profile): #return 0 if no game found
        return FinishedJankenGames.objects.filter(owner=profile, result="draw").count()
    

class JankenGameCreation(models.Model):
    creator = models.ForeignKey(Profile, on_delete = models.CASCADE, related_name='creator_creation')
    isWaiting = models.BooleanField(default=False)

    def __str__(self):
        return self.creator.nickname + " created a Janken Game"
    
    def findGame():
        return JankenGameCreation.objects.all().first() | None
    
    def getMyGameCreation(profile):
        if JankenGameCreation.objects.filter(creator=profile).exists():
            return JankenGameCreation.objects.get(creator=profile)
        else:
            return None
        
    def matchMaking(profile):
        if JankenGameCreation.objects.all().exists():
            myWinrate = profile.getWinrateJanken()
            for margin in range(0, 101, 5):
                for game in JankenGameCreation.objects.all():
                    if game.creator.getWinrateJanken() >= myWinrate - margin and game.creator.getWinrateJanken() <= myWinrate + margin:
                        return game
            return JankenGameCreation.objects.all().first()
    
    class Meta:
        verbose_name = "Janken Game Creation"
        verbose_name_plural = "Janken Game Creations"
    
class JankenGameInProgress(models.Model):
    creator = models.ForeignKey(Profile, on_delete = models.CASCADE, related_name='creator')
    opponent = models.ForeignKey(Profile, on_delete = models.CASCADE, related_name='opponent')
    creator_choice = models.CharField(max_length=100, default="None")
    opponent_choice = models.CharField(max_length=100, default="None")
    game_finished = models.BooleanField(default=False)
    to_delete_creator = models.BooleanField(default=False)
    to_delete_opponent = models.BooleanField(default=False)
    result = models.CharField(max_length=100, default="None")
    completion_time = models.DateTimeField(null=True, blank=True)
    loser = models.CharField(max_length=100, default="None")
    winner = models.CharField(max_length=100, default="None")
    first_input_time = models.DateTimeField(default=None, null=True, blank=True)
    first_input_nickname = models.CharField(max_length=100, default="None")

    def __str__(self):
        return self.creator.nickname + " vs " + self.opponent.nickname
    
    class Meta:
        verbose_name = "Janken Game In Progress"
        verbose_name_plural = "Janken Games In Progress"
    
    def myGame(profile):
        return JankenGameInProgress.objects.filter(creator=profile) | JankenGameInProgress.objects.filter(opponent=profile)
    
    def getMyGame(profile):
        if JankenGameInProgress.objects.filter(creator=profile).exists():
            return JankenGameInProgress.objects.get(creator=profile)
        elif JankenGameInProgress.objects.filter(opponent=profile).exists():
            return JankenGameInProgress.objects.get(opponent=profile)
        else:
            return None
    
    def giveInput(choice, Profile):
        if JankenGameInProgress.objects.filter(creator=Profile).exists():
            game = JankenGameInProgress.objects.get(creator=Profile)
            game.creator_choice = choice
            if game.opponent_choice != "None":
                game.game_finished = True
                game.completion_time = timezone.now()
            else:
                game.first_input_time = timezone.now()
                game.first_input_nickname = Profile.nickname
            game.save()
        elif JankenGameInProgress.objects.filter(opponent=Profile).exists():
            game = JankenGameInProgress.objects.get(opponent=Profile)
            game.opponent_choice = choice
            if game.creator_choice != "None":
                game.game_finished = True
                game.completion_time = timezone.now()
            else:
                game.first_input_time = timezone.now()
                game.first_input_nickname = Profile.nickname
            game.save()
        else:
            return None
        
    def addToHistory(self):
        if self.result == "draw":
            FinishedJankenGames.objects.create(owner=self.creator, opponent=self.opponent, owner_choice=self.creator_choice, opponent_choice=self.opponent_choice, result=self.result, completion_time=self.completion_time, loser=self.loser, winner=self.winner)
            FinishedJankenGames.objects.create(owner=self.opponent, opponent=self.creator, owner_choice=self.opponent_choice, opponent_choice=self.creator_choice, result=self.result, completion_time=self.completion_time, loser=self.loser, winner=self.winner)
        elif self.winner == self.creator.nickname:
            FinishedJankenGames.objects.create(owner=self.creator, opponent=self.opponent, owner_choice=self.creator_choice, opponent_choice=self.opponent_choice, result="Victory", completion_time=self.completion_time, loser=self.loser, winner=self.winner)
            FinishedJankenGames.objects.create(owner=self.opponent, opponent=self.creator, owner_choice=self.opponent_choice, opponent_choice=self.creator_choice, result="Defeat", completion_time=self.completion_time, loser=self.loser, winner=self.winner)
        elif self.winner == self.opponent.nickname:
            FinishedJankenGames.objects.create(owner=self.creator, opponent=self.opponent, owner_choice=self.creator_choice, opponent_choice=self.opponent_choice, result="Defeat", completion_time=self.completion_time, loser=self.loser, winner=self.winner)
            FinishedJankenGames.objects.create(owner=self.opponent, opponent=self.creator, owner_choice=self.opponent_choice, opponent_choice=self.creator_choice, result="Victory", completion_time=self.completion_time, loser=self.loser, winner=self.winner)
        self.delete()