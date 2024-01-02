from django.db import models
from django.contrib.auth.models import User

class user(models.Model):
    username = models.CharField(max_length = 18, unique = True)
    email = models.EmailField(max_length = 100, unique = True, default = 'your@email.com')
    password = models.CharField(max_length = 24, unique = False)

    def __str__(self):
        return self.username

    class Meta:
        verbose_name = "Utilisateur"
        verbose_name_plural = "Utilisateurs"
