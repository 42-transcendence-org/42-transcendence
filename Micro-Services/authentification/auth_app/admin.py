from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User
from .models import Profile, Friendship, Notifications, JankenGameCreation, JankenGameInProgress

class ProfileInline(admin.StackedInline):
    model = Profile
    can_delete = False
    verbose_name_plural = 'profiles'

class CustomUserAdmin(UserAdmin):
    # Customize the fields to be displayed in the list of allllll the users registered
    list_display = ('username', 'email', 'first_name', 'last_name', 'is_staff')
    # Customize the fields to be displayed in the detail of each user
    inlines = [ProfileInline]
    fieldsets = (
        (None, {'fields': ('username', 'password')}),
        # ('Profile', {'fields': (Profile.email, Profile.profile_picture, Profile.is42account)}),
        ('Permissions', {'fields': ('is_active', 'is_staff', 'is_superuser', 'groups', 'user_permissions')}),
        ('Important dates', {'fields': ('last_login', 'date_joined')}),
    )


admin.site.register(Profile)
admin.site.register(Friendship)
admin.site.register(Notifications)
admin.site.register(JankenGameCreation)
admin.site.register(JankenGameInProgress)
admin.site.unregister(User)
admin.site.register(User, CustomUserAdmin)
