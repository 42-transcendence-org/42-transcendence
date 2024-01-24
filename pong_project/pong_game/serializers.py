from rest_framework import serializers

from django.contrib.auth.models import User

from . import constants as const
from .game import Game


class UserRegistrationSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ["username", "password"]
        extra_kwargs = {"password": {"write_only": True}}


class UserLoginSerializer(serializers.Serializer):
    username = serializers.CharField()
    password = serializers.CharField()


class CreateGameSerializer(serializers.Serializer):
    type = serializers.ChoiceField(choices=const.GAME_TYPES)

    def validate_type(self, value):
        if value not in dict(const.GAME_TYPES).keys():
            raise serializers.ValidationError("Invalid game type.")
        return value


class UpdateGameStateSerializer(serializers.Serializer):
    id = serializers.ChoiceField(choices=const.PLAYER_ID)
    action = serializers.ChoiceField(choices=const.GAME_ACTIONS)

    def validate_id(self, value):
        if value not in const.PLAYER_ID:
            raise serializers.ValidationError("Invalid player ID.")
        return value

    def validate_action(self, value):
        if value not in const.GAME_ACTIONS:
            raise serializers.ValidationError("Invalid action.")
        return value
