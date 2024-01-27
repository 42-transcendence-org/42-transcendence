from rest_framework import serializers

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
