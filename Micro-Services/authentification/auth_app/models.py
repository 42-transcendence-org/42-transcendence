from django.db import models
from django.contrib.auth.models import User

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
    