from rest_framework import serializers
from django.contrib.auth.models import User

from .models import GAME_TYPES


class UserRegistrationSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ["username", "password"]
        extra_kwargs = {"password": {"write_only": True}}


class UserLoginSerializer(serializers.Serializer):
    username = serializers.CharField()
    password = serializers.CharField()


class GameCreationSerializer(serializers.Serializer):
    type = serializers.ChoiceField(choices=GAME_TYPES)

    def validate_type(self, value):
        # Check if the provided type is in the list of allowed types
        if value not in dict(GAME_TYPES).keys():
            raise serializers.ValidationError("Invalid game type.")
        return value
