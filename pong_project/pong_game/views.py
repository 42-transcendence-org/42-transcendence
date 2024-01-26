import uuid

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
from . import game as g
from .models import GameModel
from .throttles import BurstRateThrottle


def index(request):
    return render(request, "index.html")


@api_view(["POST"])
def user_registration_view(request: Request) -> Response:
    serializer = serializers.UserRegistrationSerializer(data=request.data)
    if serializer.is_valid():
        User.objects.create_user(**serializer.validated_data)
        return Response(
            {"message": "Registration successful"}, status=status.HTTP_201_CREATED
        )
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(["POST"])
def user_login_view(request: Request) -> Response:
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
def user_logout_view(request: Request) -> Response:
    logout(request)
    return Response({"message": "Successfully logged out"})


@api_view(["GET"])
def user_is_authenticated_view(request: Request) -> Response:
    user = request.user
    if user.is_authenticated:
        return Response({"isAuthenticated": True}, status=status.HTTP_200_OK)
    else:
        return Response({"isAuthenticated": False}, status=status.HTTP_200_OK)


@api_view(["POST"])
@permission_classes([IsAuthenticated])
def game_create_view(request: Request) -> Response:
    serializer = serializers.CreateGameSerializer(data=request.data)
    if not serializer.is_valid():
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    user = request.user

    # Check for an active game session for this user
    has_session = g.game_check_for_session(user.username)
    if has_session:
        return Response(
            {"error": "User already has an active game session"},
            status=status.HTTP_400_BAD_REQUEST,
        )

    # Check if we have a game session waiting for a second player
    waiting_game = g.game_check_for_waiting(user.username)
    if waiting_game:
        return Response({"id": waiting_game}, status=status.HTTP_200_OK)

    # Create a new game
    game_id = uuid.uuid4()
    game_type = serializer.validated_data.get("type")
    g.game_add(
        game_id,
        g.game_create(
            game_type,
            "active" if game_type != "remote" else "waiting",
            user.username,
            "",
        ),
    )
    return Response({"id": game_id}, status=status.HTTP_201_CREATED)


# TODO Add security like checking that the player is part of the game
@api_view(["PUT"])
@permission_classes([IsAuthenticated])
@throttle_classes([BurstRateThrottle])
def game_update_state_view(request: Request, game_id: uuid.UUID) -> Response:
    serializer = serializers.CreateGameSerializer(data=request.data)
    if not serializer.is_valid():
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    if g.game_add_input(
        game_id,
        (serializer.validated_data.get("id"), serializer.validated_data.get("action")),
    ):
        return Response(
            {"message": "Action processed successfully"}, status=status.HTTP_200_OK
        )
    return Response({"error": "No game with this id"}, status=status.HTTP_404_NOT_FOUND)


# TODO Add security like checking the game_id exists or that the player is part of the game
@api_view(["GET"])
@permission_classes([IsAuthenticated])
@throttle_classes([BurstRateThrottle])
def game_get_state_view(request: Request, game_id: uuid.UUID) -> Response:
    s = g.game_get_state(game_id)
    return Response(
        {
            "ball": {
                "x": s["ball"]["x"],
                "y": s["ball"]["y"],
            },
            "player1": {
                "x": s["player1"]["x"],
                "score": s["player1"]["score"],
            },
            "player2": {
                "x": s["player2"]["x"],
                "score": s["player2"]["score"],
            },
        },
        status=status.HTTP_200_OK,
    )


@api_view(["GET", "PUT"])
@permission_classes([IsAuthenticated])
def game_state_dispatcher_view(request: Request, game_id: uuid.UUID) -> Response:
    if request.method == "GET":
        return game_get_state_view(request._request, game_id)
    elif request.method == "PUT":
        return game_update_state_view(request._request, game_id)
