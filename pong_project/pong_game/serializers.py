from rest_framework import serializers

from django.contrib.auth.models import User


PLAYER_ID = ["1", "2"]
GAME_ACTIONS = ["left", "right", "pause", "quit"]
GAME_TYPES = [
    ("local", "Local"),
    ("remote", "Remote"),
    ("ai", "AI"),
]
GAME_STATUSES = [
    ("waiting", "Waiting for player..."),
    ("active", "Active"),
    ("paused", "Paused"),
    ("ended", "Ended"),
]


class UserRegistrationSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ["username", "password"]
        extra_kwargs = {"password": {"write_only": True}}


class UserLoginSerializer(serializers.Serializer):
    username = serializers.CharField()
    password = serializers.CharField()


class CreateGameSerializer(serializers.Serializer):
    type = serializers.ChoiceField(choices=GAME_TYPES)

    def validate_type(self, value):
        if value not in dict(GAME_TYPES).keys():
            raise serializers.ValidationError("Invalid game type.")
        return value


class UpdateGameStateSerializer(serializers.Serializer):
    id = serializers.ChoiceField(choices=PLAYER_ID)
    action = serializers.ChoiceField(choices=GAME_ACTIONS)

    def validate_id(self, value):
        if value not in PLAYER_ID:
            raise serializers.ValidationError("Invalid player ID.")
        return value

    def validate_action(self, value):
        if value not in GAME_ACTIONS:
            raise serializers.ValidationError("Invalid action.")
        return value
