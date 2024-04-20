import json, asyncio

import game_app.pong.constants as g
from game_app.pong.game_server import server
from django.http import JsonResponse
import json
from rest_framework.views import APIView
from django.http import JsonResponse
from django.http import JsonResponse, StreamingHttpResponse
from django.views.decorators.cache import never_cache
import time
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

@require_http_methods(["POST"])
def game_create_view(request):
    username = getattr(request, 'username', None)
    user_id = getattr(request, 'user_id', None)

    has_session = server.player_has_active_session(username)
    if has_session:
        return JsonResponse({"id": has_session}, status=200)

    return JsonResponse({"id": server.matchmaker(username, user_id)}, status=201)

@never_cache
@require_http_methods(["GET", "PUT"])
async def game_view(request, game_id):
    username = getattr(request, 'username', None)
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
            if not (isinstance(data, list) and len(data) == 2):
                raise ValueError("Input must be a pair of [input, timestamp]")
        except (json.JSONDecodeError, ValueError) as e:
            return JsonResponse({"error": str(e)}, status=400)

        input_id, timestamp = data
        if input_id not in g.INPUTS:
            return JsonResponse({"error": "Invalid value for 'input'"}, status=400)

        server.create_input(game_id, username, input_id, timestamp)
        return JsonResponse({}, status=200)



from .models import FinishedPongGames
from django.utils import timezone

class pongHistoryAPIView(APIView):
    def post(self, request, *args, **kwargs):
        try:
            game = FinishedPongGames.objects.create(
                owner=request.user_id, \
                player1=request.data.get('player1', 'undefined'), \
                game_type=request.data.get('game_type', 'undefined'), \
                opponent=request.data.get('opponent', 'undefined'), \
                player_score=request.data.get('player_score', 'undefined'), \
                opponent_score=request.data.get('opponent_score', 'undefined'), \
                winner=request.data.get('winner', 'undefined'), \
                result=request.data.get('result', 'undefined'), \
                tourney_game=request.data.get('tourney_game', False), \
                completion_day= timezone.now().astimezone(timezone.get_current_timezone()).strftime("%d/%m"), \
                completion_time= timezone.now().astimezone(timezone.get_current_timezone()).strftime("%H:%M:%S"), \
            )
            return JsonResponse({'message': 'success', 'game_id': game.id})
        except Exception as e:
            print(e)
            return JsonResponse({'error': e.args[0]})

    def get(self, request, *args, **kwargs):
        try:
            games = FinishedPongGames.objects.filter(owner=request.user_id)
            if games.exists() == False:
                raise Exception('You never played a game !')
            history = []
            for game in games:
                if game.game_type != 'tournament':
                    history.append({'owner': game.owner, \
                                'game_type': game.game_type, \
                                'opponent': game.opponent, \
                                'player_score': game.player_score, \
                                'opponent_score': game.opponent_score, \
                                'winner': game.winner, \
                                'result': game.result, \
                                'end_day': game.completion_day, \
                                'end_time': game.completion_time, \
                                        })
            return JsonResponse({'history': history, \
                                'wins': FinishedPongGames.countWins(request.user_id), \
                                'losses': FinishedPongGames.countLosses(request.user_id),
                                'winrate': "{:.1f}%".format(FinishedPongGames.getWinrate(request.user_id))})
        except Exception as e:
            print(e)
            return JsonResponse({'error': e.args[0]})

class getFriendStatsAPIView(APIView):
    def post(self, request, *args, **kwargs):
        try:
            friend_id = request.data.get('friend_id', 'undefined')
            if friend_id == 'undefined':
                raise Exception('Please provide a valid friend_id')
            games = FinishedPongGames.objects.filter(owner=friend_id)
            if games.exists() == False:
                raise Exception('You never played a game !')
            history = []
            for game in games:
                if game.game_type != 'tournament':
                    history.append({'owner': game.owner, \
                                'game_type': game.game_type, \
                                'opponent': game.opponent, \
                                'player_score': game.player_score, \
                                'opponent_score': game.opponent_score, \
                                'winner': game.winner, \
                                'result': game.result, \
                                'end_day': game.completion_day, \
                                'end_time': game.completion_time, \
                                        })
            return JsonResponse({'history': history,
                                'wins': FinishedPongGames.countWins(friend_id),
                                'losses': FinishedPongGames.countLosses(friend_id),
                                'winrate': "{:.1f}%".format(FinishedPongGames.getWinrate(friend_id))})
        except Exception as e:
            print(e)
            return JsonResponse({'error': e.args[0]})