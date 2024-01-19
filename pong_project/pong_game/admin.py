from . import models
from django.contrib import admin

admin.site.register(models.GameSession)
admin.site.register(models.GameState)
admin.site.register(models.GameResult)
