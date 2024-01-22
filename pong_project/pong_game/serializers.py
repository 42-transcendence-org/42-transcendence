from rest_framework import serializers
from django.contrib.auth.models import User

from .models import GAME_TYPES, GAME_ACTIONS, PLAYER_ID, GameModel


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


class GameUpdateSerializer(serializers.Serializer):
    id = serializers.ChoiceField(choices=PLAYER_ID)
    action = serializers.ChoiceField(choices=GAME_ACTIONS)

    def validate_id(self, value):
        # Custom validation for 'id'
        if value not in PLAYER_ID:
            raise serializers.ValidationError("Invalid player ID.")
        return value

    def validate_action(self, value):
        # Custom validation for 'action'
        if value not in GAME_ACTIONS:
            raise serializers.ValidationError("Invalid action.")
        return value


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ["username"]


class GameModelSerializer(serializers.ModelSerializer):
    player1 = UserSerializer(read_only=True)
    player2 = UserSerializer(read_only=True)

    class Meta:
        model = GameModel
        fields = [
            "id",
            "type",
            "status",
            "time_started",
            "time_ended",
            "last_updated",
            "player1",
            "player2",
            "player1_score",
            "player2_score",
            "player1_x",
            "player2_x",
            "ball_x",
            "ball_y",
        ]
