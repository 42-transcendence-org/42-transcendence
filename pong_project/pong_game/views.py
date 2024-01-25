from uuid import UUID

from django.db.models import Q
from django.shortcuts import render, get_object_or_404
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User

from rest_framework import status
from rest_framework.response import Response
from rest_framework.request import Request
from rest_framework.permissions import IsAuthenticated
from rest_framework.decorators import api_view, permission_classes, throttle_classes

from . import serializers
from .models import GameModel
from .throttles import BurstRateThrottle


def index(request):
    return render(request, "index.html")


@api_view(["POST"])
def user_registration(request: Request) -> Response:
    serializer = serializers.UserRegistrationSerializer(data=request.data)
    if serializer.is_valid():
        User.objects.create_user(**serializer.validated_data)
        return Response(
            {"message": "Registration successful"}, status=status.HTTP_201_CREATED
        )
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(["POST"])
def user_login(request: Request) -> Response:
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
def user_logout(request: Request) -> Response:
    logout(request)
    return Response({"message": "Successfully logged out"})


@api_view(["GET"])
def user_is_authenticated(request: Request) -> Response:
    user = request.user
    if user.is_authenticated:
        return Response({"isAuthenticated": True}, status=status.HTTP_200_OK)
    else:
        return Response({"isAuthenticated": False}, status=status.HTTP_200_OK)


@api_view(["POST"])
@permission_classes([IsAuthenticated])
def game_create(request: Request) -> Response:
    serializer = serializers.CreateGameSerializer(data=request.data)
    if not serializer.is_valid():
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    user = request.user

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

    # Check if we have a game session waiting for a second player
    waiting_game = GameModel.objects.filter(
        type="remote", player2__isnull=True, status="waiting"
    ).first()
    game_type = serializer.validated_data.get("type")

    if waiting_game:
        game_id = waiting_game.id
        waiting_game.player2 = user
        waiting_game.save()
    else:
        new_game = GameModel.objects.create(
            type=game_type, status="waiting", player1=user
        )
        game_id = new_game.id
    if waiting_game or game_type == "local" or game_type == "ai":
        game_manager = GameManager.get_instance()
        game_manager.add_game(game_id)
    return Response({"id": game_id}, status=status.HTTP_201_CREATED)


@api_view(["PUT"])
@permission_classes([IsAuthenticated])
@throttle_classes([BurstRateThrottle])
def game_state_update(request: Request, game_id: UUID) -> Response:
    serializer = serializers.CreateGameSerializer(data=request.data)
    if not serializer.is_valid():
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    user = request.user
    game_manager = GameManager.get_instance()
    game_db = get_object_or_404(GameModel, id=game_id)

    # Check if the user is part of the game
    if game_db.player1 != user and game_db.player2 != user:
        return Response(
            {"error": "User not part of the game"}, status=status.HTTP_403_FORBIDDEN
        )

    action = serializer.validated_data.get("action")
    player_id = serializer.validated_data.get("id")

    game_instance = game_manager.get_game(game_id)
    if game_instance is not None:
        game_instance.add_action(player_id, action)
    else:
        return Response(
            {"error": "No game with this id"}, status=status.HTTP_404_NOT_FOUND
        )
    return Response(
        {"message": "Action processed successfully"}, status=status.HTTP_200_OK
    )


@api_view(["GET"])
@permission_classes([IsAuthenticated])
@throttle_classes([BurstRateThrottle])
def game_state_get(request: Request, game_id: UUID) -> Response:
    user = request.user
    game = get_object_or_404(GameModel, id=game_id)

    if game.player1 != user and game.player2 != user:
        return Response(
            {"error": "User not part of the game"}, status=status.HTTP_403_FORBIDDEN
        )
    game_manager = GameManager.get_instance()
    return Response(
        game_to_dict(game_manager.get_game(game_id)), status=status.HTTP_200_OK
    )


@api_view(["GET", "PUT"])
@permission_classes([IsAuthenticated])
def game_state_dispatcher(request: Request, game_id: UUID) -> Response:
    if request.method == "GET":
        return game_state_get(request._request, game_id)
    elif request.method == "PUT":
        return game_state_update(request._request, game_id)
