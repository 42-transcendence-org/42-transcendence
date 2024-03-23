from django.db import models
from django.contrib.auth.models import User

from django.db.models.signals import post_save
from django.dispatch import receiver
from django.utils import timezone

class Profile(models.Model):
    user = models.OneToOneField(User, on_delete = models.CASCADE)
    
    is42account = models.BooleanField(default=False)
    email = models.EmailField(max_length=100, blank=True, default="default@default.default")
    profile_picture = models.CharField(max_length=100, blank=True, default="avatar.jpg")
    nickname = models.CharField(max_length=100, blank=True, default="No Nickname Yet")
    correction_points = models.IntegerField(default=0)
    online = models.BooleanField(default=False)

    def __str__(self):
        return self.nickname

    class Meta:
        verbose_name = "Profile"
        verbose_name_plural = "Profiles"

    def getWinrateJanken(profile):
        wins = FinishedJankenGames.countWins(profile)
        losses = FinishedJankenGames.countLosses(profile)
        if wins == 0 and losses == 0:
            return 0
        else:
            return wins/(wins+losses)*100

@receiver(post_save, sender=User)
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance, nickname = "No Nick" + str(instance.id))

@receiver(post_save, sender=User)
def save_user_profile(sender, instance, **kwargs):
    instance.profile.save()

    
class Friendship(models.Model):
    friend1 = models.ForeignKey(Profile, on_delete = models.CASCADE, related_name='friend1')
    friend2 = models.ForeignKey(Profile, on_delete = models.CASCADE, related_name='friend2')
    accepted = models.BooleanField(default=False)

    def __str__(self):
        return self.friend1.nickname + " and " + self.friend2.nickname
    
    def getFriends(profile):
        return Friendship.objects.filter(friend1=profile, accepted=True) | Friendship.objects.filter(friend2=profile, accepted=True)
    
    def getFriendRequests(profile):
        return Friendship.objects.filter(friend1=profile, accepted=False) | Friendship.objects.filter(friend2=profile, accepted=False)
    
    def friendshipExists(friend1, friend2):
        return Friendship.objects.filter(friend1=friend1, friend2=friend2).exists() or Friendship.objects.filter(friend1=friend2, friend2=friend1).exists()
    
    def getFriendship(friend1, friend2):
        if Friendship.objects.filter(friend1=friend1, friend2=friend2).exists():
            return Friendship.objects.get(friend1=friend1, friend2=friend2)
        elif Friendship.objects.filter(friend1=friend2, friend2=friend1).exists():
            return Friendship.objects.get(friend1=friend2, friend2=friend1)
        else:
            return None

    class Meta:
        verbose_name = "Friendship"
        verbose_name_plural = "Friendships"

class Notifications(models.Model):
    profile = models.ForeignKey(Profile, on_delete = models.CASCADE)
    friendship = models.ForeignKey(Friendship, on_delete = models.CASCADE, blank=True, null=True)
    content = models.CharField(max_length=100)

    def __str__(self):
        return self.profile.nickname + " : " + self.content

    class Meta:
        verbose_name = "Notification"
        verbose_name_plural = "Notifications"

    def getNotifications(profile):
        return Notifications.objects.filter(profile=profile)
    
    def delMyNotifications(profile):
        Notifications.objects.filter(profile=profile).delete()

    def countNotifications(profile):
        return Notifications.objects.filter(profile=profile).count()

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



class FinishedPongGames(models.Model):
    owner = models.ForeignKey(Profile, on_delete = models.CASCADE, related_name='PongHistoryOwner')
    game_type = models.CharField(max_length=100, default="None")
    opponent = models.CharField(max_length=100, default="None")
    player_score = models.IntegerField(default=0)
    opponent_score = models.IntegerField(default=0)
    winner = models.CharField(max_length=100, default="None")
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
    
