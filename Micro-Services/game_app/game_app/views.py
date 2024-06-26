import json, asyncio

import game_app.pong.constants as g
from game_app.pong.game_server import server

from .models import FinishedPongGames

from django.utils import timezone

from rest_framework.views import APIView

from django.http import JsonResponse, StreamingHttpResponse
from django.views.decorators.cache import never_cache
from django.views.decorators.http import require_http_methods


async def stream_generator(game_id):
    while True:
        try:
            data = server.get_latest_snap(game_id)
            yield f"data: {json.dumps(data)}\n\n".encode("utf-8")
            await asyncio.sleep(g.SENDRATE)
        except asyncio.CancelledError:
            server.handle_disconnect(game_id)
            raise


@require_http_methods(["GET"])
def get_player_names(request, game_id):
    username = getattr(request, "username", None)
    if username is None or not server.game_exists(game_id) or not server.player_is_in_session(game_id, username):
        return JsonResponse({"error": "Unauthorized access"}, status=403)
    aliases = server.get_names(game_id)
    if aliases:
        aliases_dict = {"p1": aliases[0], "p2": aliases[1]}
        return JsonResponse(aliases_dict, status=200)
    else:
        return JsonResponse({}, status=404)


@require_http_methods(["POST"])
def game_create_view(request):
    username = getattr(request, "username", None)
    user_id = getattr(request, "user_id", None)

    has_session = server.player_has_active_session(username)
    if has_session:
        return JsonResponse({"id": has_session}, status=200)

    return JsonResponse({"id": server.matchmaker(username, user_id)}, status=201)

@never_cache
@require_http_methods(["GET", "PUT"])
async def game_view(request, game_id):
    username = getattr(request, "username", None)
    if username is None or not server.game_exists(game_id) or not server.player_is_in_session(game_id, username):
        return JsonResponse({"error": "Unauthorized access"}, status=403)

    if request.method == "GET":
        try:
            response = StreamingHttpResponse(stream_generator(game_id), content_type="text/event-stream")
        except asyncio.CancelledError:
            server.handle_disconnect(game_id)
            return JsonResponse({"error": "Game has ended."}, status=400)
        return response

    elif request.method == "PUT":
        try:
            data = json.loads(request.body)
        except:
            return JsonResponse({"error": "Input must be a pair of ints"}, status=400)

        if not (isinstance(data, list) and len(data) == 2 and isinstance(data[0], int) and isinstance(data[1], int)):
            return JsonResponse({"error": "Input must be a pair of ints"}, status=400)

        input_id, timestamp = data
        if input_id not in g.INPUTS:
            return JsonResponse({"error": "Invalid value for 'input'"}, status=400)

        server.create_input(game_id, username, input_id, timestamp)
        return JsonResponse({}, status=200)

class pongHistoryAPIView(APIView):
    def post(self, request):
        if not validate_finished_game_dict(request.data):
            return JsonResponse({"error": "Bad Data"}, status=400)
        game = FinishedPongGames.objects.create(
            owner=request.user_id,
            player1=request.data.get("player1"),
            game_type=request.data.get("game_type"),
            opponent=request.data.get("opponent"),
            player_score=request.data.get("player_score"),
            opponent_score=request.data.get("opponent_score"),
            winner=request.data.get("winner"),
            result=request.data.get("result"),
            tourney_game=request.data.get("tourney_game"),
            completion_day=timezone.now().astimezone(timezone.get_current_timezone()).strftime("%d/%m"),
            completion_time=timezone.now().astimezone(timezone.get_current_timezone()).strftime("%H:%M:%S"),
        )
        return JsonResponse({"message": "success", "game_id": game.id}, status=201)

    def get(self, request):
        games = FinishedPongGames.objects.filter(owner=request.user_id)
        if games.exists() == False:
            return JsonResponse({"error": "You never played a game !"}, status=200)
        history = []
        for game in games:
            if game.game_type != "tournament":
                history.append(
                    {
                        "owner": game.owner,
                        "game_type": game.game_type,
                        "opponent": game.opponent,
                        "player_score": game.player_score,
                        "opponent_score": game.opponent_score,
                        "winner": game.winner,
                        "result": game.result,
                        "end_day": game.completion_day,
                        "end_time": game.completion_time,
                    }
                )
        return JsonResponse(
            {
                "history": history,
                "wins": FinishedPongGames.countWins(request.user_id),
                "losses": FinishedPongGames.countLosses(request.user_id),
                "winrate": "{:.1f}%".format(FinishedPongGames.getWinrate(request.user_id)),
            },
            status=200,
        )


class getFriendStatsAPIView(APIView):
    def post(self, request):
        if not (isinstance(request.data, dict)):
            return JsonResponse({"error": 'Request must be of the form {"friend_id":id}'}, status=400)
        friend_id = request.data.get("friend_id")
        if not (isinstance(friend_id, int) and friend_id >= 1 and friend_id <= 10000):
            return JsonResponse({"error": 'Request must be of the form {"friend_id":id} with id between 1 and 10000'}, status=400)
        games = FinishedPongGames.objects.filter(owner=friend_id)
        if games.exists() == False:
            return JsonResponse({"error": "You never played a game !"}, status=200)
        history = []
        for game in games:
            if game.game_type != "tournament":
                history.append(
                    {
                        "owner": game.owner,
                        "game_type": game.game_type,
                        "opponent": game.opponent,
                        "player_score": game.player_score,
                        "opponent_score": game.opponent_score,
                        "winner": game.winner,
                        "result": game.result,
                        "end_day": game.completion_day,
                        "end_time": game.completion_time,
                    }
                )
        return JsonResponse(
            {
                "history": history,
                "wins": FinishedPongGames.countWins(friend_id),
                "losses": FinishedPongGames.countLosses(friend_id),
                "winrate": "{:.1f}%".format(FinishedPongGames.getWinrate(friend_id)),
            },
            status=200,
        )


def validate_finished_game_dict(to_check):
    if not isinstance(to_check, dict):
        return False
    if not all(
        key in to_check
        for key in [
            "player1",
            "game_type",
            "opponent",
            "player_score",
            "opponent_score",
            "winner",
            "loser",
            "result",
            "tourney_game",
        ]
    ):
        return False
    if not all(
        isinstance(to_check[key], str) and to_check[key] != ""
        for key in [
            "player1",
            "game_type",
            "opponent",
            "winner",
            "loser",
            "result",
        ]
    ):
        return False
    if not all(
        isinstance(to_check[key], int) and to_check[key] >= 0 and to_check[key] <= 100
        for key in [
            "player_score",
            "opponent_score",
        ]
    ):
        return False
    if not isinstance(to_check["tourney_game"], bool):
        return False
    if to_check["game_type"] not in ["local", "ai"]:
        return False
    if not (to_check["winner"] == to_check["player1"] or to_check["winner"] == to_check["opponent"]):
        return False
    return True
