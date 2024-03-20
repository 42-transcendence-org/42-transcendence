from django.contrib import admin
from .models import Profile, Friendship

#THIS matters
admin.site.register(Profile)
admin.site.register(Friendship)