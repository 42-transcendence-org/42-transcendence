from django.db import models

from django.db import models

class Game(models.Model):
    player1 = models.CharField(max_length=100)
    player2 = models.CharField(max_length=100)
    score = models.CharField(max_length=50)
    # ... additional fields as needed ...

