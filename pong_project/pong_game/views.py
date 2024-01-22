import uuid

from django.db.models import Q
from django.shortcuts import render, get_object_or_404
from django.contrib.auth import authenticate, login
from django.contrib.auth.models import User

from rest_framework import status
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from rest_framework.decorators import api_view, permission_classes

from . import serializers
from .game import PongGame
from .apps import game_manager as gm
from .models import GameModel


def index(request):
    return render(request, "index.html")


@api_view(["POST"])
def userRegistration(request):
    serializer = serializers.UserRegistrationSerializer(data=request.data)
    if serializer.is_valid():
        User.objects.create_user(**serializer.validated_data)
        return Response(
            {"message": "Registration successful"}, status=status.HTTP_201_CREATED
        )
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(["POST"])
def userLogin(request):
    serializer = serializers.UserLoginSerializer(data=request.data)
    if serializer.is_valid():
        user = authenticate(**serializer.validated_data)
        if user:
            login(request, user)
            return Response({"message": "Login successful"}, status=status.HTTP_200_OK)
        return Response(
            {"error": "Invalid credentials"}, status=status.HTTP_401_UNAUTHORIZED
        )
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(["POST"])
@permission_classes([IsAuthenticated])
def createGame(request):
    user = request.user
    serializer = serializers.GameCreationSerializer(data=request.data)

    # Check if data is valid
    if not serializer.is_valid():
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    # Check for an active game session for this user
    active_games = GameModel.objects.filter(
        (Q(player1=user) | Q(player2=user)),
        status__in=["waiting", "active", "paused"],
    )
    if active_games.exists():
        return Response(
            {"error": "User already has an active game session"},
            status=status.HTTP_400_BAD_REQUEST,
        )

    # Check if we have game sessions waiting for a second player
    waiting_game = GameModel.objects.filter(
        type="remote", player2__isnull=True, status="waiting"
    ).first()

    if waiting_game:
        waiting_game.player2 = user
        waiting_game.status = "active"
        waiting_game.save()
        game_id = waiting_game.id
    else:
        game_id = uuid.uuid4()
        game_type = serializer.validated_data["type"]
        game_status = "active"
        if game_type == "remote":
            game_status = "waiting"
        gm.add_game(game_id, PongGame(game_type))
        GameModel.objects.create(
            id=game_id, type=game_type, status=game_status, player1=user
        )

    game_instance = GameModel.objects.get(id=game_id)
    game_serializer = serializers.GameModelSerializer(game_instance)
    return Response(game_serializer.data, status=status.HTTP_201_CREATED)


@api_view(["PUT"])
@permission_classes([IsAuthenticated])  # Require user to be authenticated
def updateGameState(request, gameId):
    user = request.user
    game = get_object_or_404(GameModel, id=gameId)

    # Check if the user is part of the game
    if game.player1 != user and game.player2 != user:
        return Response(
            {"error": "User not part of the game"}, status=status.HTTP_403_FORBIDDEN
        )

    # Retrieve action from request data
    action = request.data.get("action")

    # Process the action (this depends on your game logic)
    # For example, handle 'left', 'right', 'pause', 'quit' actions
    # Update the game state accordingly

    # After updating the game state, serialize and return the updated game state
    updated_game_serializer = serializers.GameModelSerializer(game)
    return Response(updated_game_serializer.data, status=status.HTTP_200_OK)


# Add the path to your urls.py
# path('games/<uuid:gameId>/', views.updateGameState, name='update-game-state')


@api_view(["GET"])
def getGameState(request):
    pass
