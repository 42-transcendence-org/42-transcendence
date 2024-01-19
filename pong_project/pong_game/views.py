from django.contrib.auth import authenticate, login
from django.contrib.auth.models import User
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .serializers import UserRegistrationSerializer, UserLoginSerializer
from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import render


class UserRegistrationView(APIView):
    def post(self, request):
        serializer = UserRegistrationSerializer(data=request.data)
        if serializer.is_valid():
            User.objects.create_user(**serializer.validated_data)
            return Response(
                {"message": "Registration successful"}, status=status.HTTP_201_CREATED
            )
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class UserLoginView(APIView):
    def post(self, request):
        serializer = UserLoginSerializer(data=request.data)
        if serializer.is_valid():
            user = authenticate(**serializer.validated_data)
            if user:
                login(request, user)
                return Response(
                    {"message": "Login successful"}, status=status.HTTP_200_OK
                )
            return Response(
                {"error": "Invalid credentials"}, status=status.HTTP_401_UNAUTHORIZED
            )
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# def get_next_nickname():
#     # Find the highest number used in nicknames
#     last_player = (
#         Player.objects.filter(nickname__startswith="user").order_by("nickname").last()
#     )
#     if last_player:
#         last_number = int(last_player.nickname.replace("user", ""))
#         return f"user{last_number + 1}"
#     else:
#         return "user1"


# def index(request):
#     if not request.session.session_key:
#         request.session.create()

#     sessionId = request.session.session_key
#     player, created = Player.objects.get_or_create(session_id=sessionId)

#     if created:
#         player.nickname = get_next_nickname()
#         player.save()

#     return render(request, "index.html")


def index(request):
    return render(request, "index.html")


# @api_view(["POST"])
# @csrf_exempt
# def create_game(request):
#     serializer = GameSessionSerializer(data=request.data)
#     if serializer.is_valid():
#         serializer.save()
#         return Response(serializer.data)
#     return Response(serializer.errors, status=400)


# TODO This decorator is so that Postman doesn't get a 403, remove it in production
# @csrf_exempt
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

# def create_game(request):

def game_action(request, game_id):
    if request.method == "PUT":
        # Process player action for the game session
        # ...
        return JsonResponse({"message": "Action processed"})


def get_game_state(request, game_id):
    if request.method == "GET":
        # Retrieve the state of the game session
        # ...
        return JsonResponse({"game_state": game_state})
