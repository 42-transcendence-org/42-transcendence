from django.db import models
from django.contrib.auth.models import User

from django.db.models.signals import post_save
from django.dispatch import receiver

class Profile(models.Model):
    user = models.OneToOneField(User, on_delete = models.CASCADE)
    
    is42account = models.BooleanField(default=False)
    email = models.EmailField(max_length=100, blank=True)
    profile_picture = models.CharField(max_length=100, blank=True, default="avatar.jpg")
    nickname = models.CharField(max_length=100, blank=True)
    correction_points = models.IntegerField(default=0)

    def __str__(self):
        return self.nickname

    class Meta:
        verbose_name = "Profile"
        verbose_name_plural = "Profiles"

@receiver(post_save, sender=User)
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)

@receiver(post_save, sender=User)
def save_user_profile(sender, instance, **kwargs):
    instance.profile.save()

    
class Friendship(models.Model):
    friend1 = models.ForeignKey(Profile, on_delete = models.CASCADE, related_name='friend1')
    friend2 = models.ForeignKey(Profile, on_delete = models.CASCADE, related_name='friend2')
    accepted = models.BooleanField(default=False)

    def __str__(self):
        return self.friend1.nickname + " and " + self.friend2.nickname
    
    def getAcceptedFriendshipWithAnother(friend1, friend2):
        if Friendship.objects.filter(friend1=friend1, friend2=friend2).exists() and Friendship.objects.filter(friend1=friend1, friend2=friend2).accepted == True:
            return Friendship.objects.get(friend1=friend1, friend2=friend2)
        elif Friendship.objects.filter(friend1=friend2, friend2=friend1).exists() and Friendship.objects.filter(friend1=friend2, friend2=friend1).accepted == True:
            return Friendship.objects.get(friend1=friend2, friend2=friend1)
        else:
            return None
        
    def getAllMyFriendships(profile):
        return Friendship.objects.filter(friend1=profile, accepted=True) | Friendship.objects.filter(friend2=profile, accepted=True)
    
    def getAllMyFriendRequests(profile):
        return Friendship.objects.filter(friend1=profile, accepted=False) | Friendship.objects.filter(friend2=profile, accepted=False)
    
    def acceptFriendRequest(self):
        self.accepted = True
        self.save()

    def denyFriendRequest(self):
        self.delete()

    def isFriendshipAccepted(self):
        return self.accepted
    
    class Meta:
        verbose_name = "Friendship"
        verbose_name_plural = "Friendships"
