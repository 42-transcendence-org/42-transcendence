import uuid

from django.db.models import Q
from django.shortcuts import render
from django.contrib.auth import authenticate, login
from django.contrib.auth.models import User

from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import api_view

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
def createGame(request):
    user = request.user
    serializer = serializers.GameCreationSerializer(data=request.data)
    # Check if the user is authenticated
    if not user.is_authenticated:
        return Response(
            {"error": "User not authenticated"}, status=status.HTTP_401_UNAUTHORIZED
        )
    # Check if data is valid
    if not serializer.is_valid():
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    # Check for existing active game sessions for this user
    active_games = GameModel.objects.filter(
        (Q(player1=user) | Q(player2=user)),
        status__in=["waiting", "active", "paused"],
    )
    if active_games.exists():
        return Response(
            {"error": "User already has an active game session"},
            status=status.HTTP_400_BAD_REQUEST,
        )

    # Check if we have games waiting for a player
    waiting_game = GameModel.objects.filter(
        type="remote", player2__isnull=True, status="waiting"
    ).first()

    if waiting_game:
        # Join the waiting game
        waiting_game.player2 = user
        waiting_game.status = "active"  # Update status as the game is now active
        waiting_game.save()
        game_id = waiting_game.id
        # Update or retrieve the game instance in GameManager as needed
        # gm.update_game(game_id, ...) or gm.get_game(game_id)
    else:
        # Create a new game session
        game_id = uuid.uuid4()
        gm.add_game(game_id, PongGame("local"))
        GameModel.objects.create(id=game_id, player1=user)

    return Response({"game_id": game_id}, status=status.HTTP_201_CREATED)


@api_view(["PUT"])
def updateGameState(request):
    pass


@api_view(["GET"])
def getGameState(request):
    pass
