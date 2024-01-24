from rest_framework import serializers
from django.contrib.auth.models import User

from .models import GAME_TYPES, GAME_ACTIONS, PLAYER_ID, GameModel
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


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ["username"]


class BallSerializer(serializers.Serializer):
    x = serializers.IntegerField()
    y = serializers.IntegerField()


class PaddleSerializer(serializers.Serializer):
    x = serializers.IntegerField()
    y = serializers.IntegerField()  # TODO Could be removed


class GameSerializer(serializers.Serializer):
    id = serializers.UUIDField()
    type = serializers.CharField(max_length=32)
    status = serializers.CharField(max_length=32)
    ball = BallSerializer()
    player1 = PaddleSerializer()
    player2 = PaddleSerializer()
    player1_user = UserSerializer(read_only=True)
    player2_user = UserSerializer(read_only=True)
    player1_score = serializers.IntegerField()
    player2_score = serializers.IntegerField()
    player1_x = serializers.IntegerField()
    player2_x = serializers.IntegerField()
    ball_x = serializers.IntegerField()
    ball_y = serializers.IntegerField()

    def create(self, validated_data):
        game = Game(
            game_type=validated_data.get("type"),
            game_status=validated_data.get("status"),
        )
        game.player1_score = validated_data.get("player1_score")
        game.player2_score = validated_data.get("player2_score")
        game.player1.x = validated_data.get("player1_x")
        game.player2.x = validated_data.get("player2_x")
        game.ball.x = validated_data.get("ball_x")
        game.ball.y = validated_data.get("ball_y")
        return game

    def update(self, instance, validated_data):
        # Update Game instance with validated data
        instance.type = validated_data.get("type", instance.type)
        instance.status = validated_data.get("status", instance.status)
        instance.player1_score = validated_data.get(
            "player1_score", instance.player1_score
        )
        instance.player2_score = validated_data.get(
            "player2_score", instance.player2_score
        )
        instance.player1.x = validated_data.get("player1_x", instance.player1.x)
        instance.player2.x = validated_data.get("player2_x", instance.player2.x)
        instance.ball.x = validated_data.get("ball_x", instance.ball.x)
        instance.ball.y = validated_data.get("ball_y", instance.ball.y)
        return instance
