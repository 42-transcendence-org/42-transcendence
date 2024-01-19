from rest_framework import serializers
from .models import GameSession


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
