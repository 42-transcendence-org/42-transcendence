from rest_framework import serializers
from .models import Profile

class ProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = Profile
        fields = ['user', 'is42account', 'email', 'profile_picture', 'nickname', 'correction_points', 'online']
