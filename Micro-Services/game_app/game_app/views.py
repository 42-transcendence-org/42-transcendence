import json, asyncio
from django.views.decorators.csrf import csrf_exempt, csrf_protect

import game_app.pong.constants as g
from game_app.pong.game_server import server


from asgiref.sync import sync_to_async

from django.http import JsonResponse, StreamingHttpResponse
from django.views.decorators.cache import never_cache
from django.views.decorators.http import require_http_methods

async def stream_generator(game_id):
    while True:
        try:
            data = server.get_latest_snap(game_id)
            yield f"data: {json.dumps(data)}\n\n".encode("utf-8")
            await asyncio.sleep(g.SENDRATE)
        except Exception as e:
            server.handle_disconnect(game_id)
            break

# @require_http_methods(["POST"])
@csrf_exempt
def game_create_view(request):
    username = getattr(request, 'username', None)

    has_session = server.player_has_active_session(username)
    if has_session:
        return JsonResponse({"id": has_session}, status=200)

    return JsonResponse({"id": server.matchmaker(username)}, status=201)

# @never_cache
# @require_http_methods(["GET", "PUT"])
@csrf_exempt
async def game_view(request, game_id):
    # username = await sync_to_async(request.session.get)("username")
    username = getattr(request, 'username', None)
    # FIXME Do we need sync_to_async for game_exists and player_is_in_session
    if username is None or not server.game_exists(game_id) or not server.player_is_in_session(game_id, username):
        return JsonResponse({"error": "Unauthorized access"}, status=403)

    if request.method == "GET":
        response = StreamingHttpResponse(stream_generator(game_id), content_type="text/event-stream")
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
