import uuid

from django.db.models import Q
from django.shortcuts import render, get_object_or_404
from django.contrib.auth import authenticate, login
from django.contrib.auth.models import User

from rest_framework import status
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from rest_framework.decorators import api_view, permission_classes, throttle_classes

from . import serializers
from .game import PongGame
from .models import GameModel
from .game_manager import GameManager
from .throttles import BurstRateThrottle


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
    print(request.data)
    user = request.user
    game_manager = GameManager.get_instance()
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
        game_manager.add_game(game_id, PongGame(game_type))
        GameModel.objects.create(
            id=game_id, type=game_type, status=game_status, player1=user
        )

    game_instance = GameModel.objects.get(id=game_id)
    game_serializer = serializers.GameModelSerializer(game_instance)
    return Response(game_serializer.data, status=status.HTTP_201_CREATED)


@api_view(["PUT"])
@permission_classes([IsAuthenticated])
@throttle_classes([BurstRateThrottle])
def updateGameState(request, gameId):
    user = request.user
    game_db = get_object_or_404(GameModel, id=gameId)
    game_manager = GameManager.get_instance()

    # Check if the user is part of the game
    if game_db.player1 != user and game_db.player2 != user:
        return Response(
            {"error": "User not part of the game"}, status=status.HTTP_403_FORBIDDEN
        )

    # Retrieve action from request data
    player_id = request.data.get("id")
    action = request.data.get("action")

    game_instance = game_manager.get_game(gameId)
    if game_instance is not None:
        game_instance.add_action(player_id, action)
    else:
        return Response(
            {"error": "No game with this id"}, status=status.HTTP_404_NOT_FOUND
        )

    # After updating the game state, serialize and return the updated game state
    updated_game_serializer = serializers.GameModelSerializer(game_db)
    return Response(updated_game_serializer.data, status=status.HTTP_200_OK)


@api_view(["GET"])
@permission_classes([IsAuthenticated])
@throttle_classes([BurstRateThrottle])
def getGameState(request, gameId):
    user = request.user
    game = get_object_or_404(GameModel, id=gameId)

    # Check if the user is part of the game
    if game.player1 != user and game.player2 != user:
        return Response(
            {"error": "User not part of the game"}, status=status.HTTP_403_FORBIDDEN
        )
    game_serializer = serializers.GameModelSerializer(game)
    return Response(game_serializer.data, status=status.HTTP_200_OK)


@api_view(["GET", "PUT"])
@permission_classes([IsAuthenticated])
def game_state(request, gameId):
    if request.method == "GET":
        return getGameState(request._request, gameId)
    elif request.method == "PUT":
        return updateGameState(request._request, gameId)
