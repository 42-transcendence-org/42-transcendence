from rest_framework import serializers
from django.contrib.auth.models import User
from .models import GameSession


class UserRegistrationSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ["username", "password"]
        extra_kwargs = {"password": {"write_only": True}}


class UserLoginSerializer(serializers.Serializer):
    username = serializers.CharField()
    password = serializers.CharField()


class GameSessionSerializer(serializers.ModelSerializer):
    class Meta:
        model = GameSession
        fields = [
            "game_id",
            "game_type",
            "game_status",
            "player1",
            "player2",
            "start_time",
            "last_updated",
            "player1_score",
            "player2_score",
            "player1_x",
            "player2_x",
            "ball_x",
            "ball_y",
        ]
