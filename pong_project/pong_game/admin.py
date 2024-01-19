from django.contrib import admin
from .models import Player
from .models import GameSession

admin.site.register(Player)
admin.site.register(GameSession)
