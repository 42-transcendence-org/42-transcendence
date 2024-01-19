from django.contrib.auth import authenticate, login
from django.contrib.auth.models import User
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework import status
from django.shortcuts import render

from .serializers import UserRegistrationSerializer, UserLoginSerializer


def index(request):
    return render(request, "index.html")


@api_view(["POST"])
def userRegistration(request):
    serializer = UserRegistrationSerializer(data=request.data)
    if serializer.is_valid():
        User.objects.create_user(**serializer.validated_data)
        return Response(
            {"message": "Registration successful"}, status=status.HTTP_201_CREATED
        )

    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(["POST"])
def userLogin(request):
    serializer = UserLoginSerializer(data=request.data)
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
    pass


@api_view(["PUT"])
def updateGameState(request):
    pass


@api_view(["GET"])
def getGameState(request):
    pass


# def create_game(request):
#     if request.method == "POST":
#         try:
#             data = json.loads(request.body)
#             game_type = data.get("gameType")

#             if game_type not in [g[0] for g in GameSession.GAME_TYPES]:
#                 print(game_type)
#                 return HttpResponseBadRequest("Invalid game type")

#             # Create a new game session with the specified type
#             game_session = GameSession.objects.create(
#                 game_type=game_type, game_status="active"
#             )
#             return JsonResponse(
#                 {"message": "Game created", "game_id": str(game_session.game_id)}
#             )

#         except json.JSONDecodeError:
#             return HttpResponseBadRequest("Invalid JSON")

#     return HttpResponseBadRequest("Invalid request method")
