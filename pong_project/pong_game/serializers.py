from rest_framework import serializers

from django.contrib.auth.models import User

from . import constants as const


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


def game_to_dict(game):
    return {
        "type": game.type,
        "status": game.status,
        "player1_score": game.player1_score,
        "player2_score": game.player2_score,
        "player1": {
            "x": game.player1.x,
            "y": game.player1.y,
            "w": game.player1.w,
            "h": game.player1.h,
            "dx": game.player1.dx,
        },
        "player2": {
            "x": game.player2.x,
            "y": game.player2.y,
            "w": game.player2.w,
            "h": game.player2.h,
            "dx": game.player2.dx,
        },
        "ball": {
            "x": game.ball.x,
            "y": game.ball.y,
            "w": game.ball.w,
            "h": game.ball.h,
            "dx": game.ball.dx,
            "dy": game.ball.dy,
        },
    }


# {
# "status": string
# "player1_name": string
# "player2_name": string
# "player1_score": int
# "player2_score": int
# "player1_x": int
# "player2_x": int
# "ball_x": int
# "ball_y": int
# }
def gameStateReponse(game, session):
    return {
        "status": game.status,
        "player1_score": game.player1_score,
        "player2_score": game.player2_score,
        "player1": {
            "x": game.player1.x,
            "name": session.player1.username,
        },
        "player2": {
            "x": game.player2.x,
            "name": session.player2.username,
        },
        "ball": {
            "x": game.ball.x,
            "y": game.ball.y,
        },
    }
