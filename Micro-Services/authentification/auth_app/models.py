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