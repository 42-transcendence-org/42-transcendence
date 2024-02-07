import uuid
import json
import time

from pong_project.game_app.pong.manager import g_manager
from pong_project.game_app.pong.main import INPUTS

from django.http import JsonResponse, StreamingHttpResponse

def game_create_view(request):
    # Check the HTTP method
    if request.method != "POST":
        response = JsonResponse(
            {"error": "Invalid HTTP method: POST required"}, status=405
        )
        response["Allow"] = "POST"
        return response

    # Verify that the client has an alias
    alias = request.session.get("alias")
    if alias is None:
        return JsonResponse({"error": "Please pick an alias first"}, status=400)

    global g_manager

    # Check for an active game session for this user
    has_session = g_manager.game_check_for_session(alias)
    if has_session:
        data = g_manager.game_get_state(has_session)
        return JsonResponse(
            {
                "id": data["id"],
                "type": data["type"],
                "name1": data["player1"]["name"],
                "name2": data["player2"]["name"],
            },
            status=200,
        )

    # Check if we have a game session waiting for a second player
    waiting_game = g_manager.game_check_for_waiting(alias)
    if waiting_game:
        data = g_manager.game_get_state(waiting_game)
        return JsonResponse(
            {
                "id": data["id"],
                "type": data["type"],
                "name1": data["player1"]["name"],
                "name2": data["player2"]["name"],
            },
            status=200,
        )

    # Create a new game
    game_id = uuid.uuid4()
    g_manager.game_create(game_id, alias)
    return JsonResponse({"id": game_id, "name1": alias}, status=201)


def game_view(request, game_id: uuid.UUID):
    global g_manager

    # Verify that the client has an alias
    alias = request.session.get("alias")
    if alias is None:
        return JsonResponse({"error": "Please pick an alias first"}, status=400)

    # Handle PUT request for updating game state
    if request.method == "PUT":
        try:
            data = json.loads(request.body)
        except json.JSONDecodeError:
            return JsonResponse({"error": "Invalid JSON"}, status=400)

        input, time = data.get("input"), data.get("time")
        if time is None or input is None:
            return JsonResponse({"error": "'input' and 'time' are required fields"}, status=400)
        if input not in INPUTS:
            return JsonResponse({"error": "Invalid value for 'input'"}, status=400)

        # Check that the game exists
        if not g_manager.game_exists(game_id):
            return JsonResponse({"error": "Invalid game ID"}, status=403)

        # Check if the player is part of that game
        if not g_manager.validate_player_id(game_id, alias):
            return JsonResponse({"error": "You are not part of this game"}, status=403)

        g_manager.game_add_input(game_id, input, time)
        return JsonResponse(status=200)

    # Handle GET request for streaming game state
    elif request.method == "GET":
        # Check that the game exists
        if not g_manager.game_exists(game_id):
            return JsonResponse({"error": "Invalid game ID"}, status=403)

        # Check if the player is part of that game
        if not g_manager.validate_player_id(game_id, alias):
            return JsonResponse({"error": "You are not part of this game"}, status=403)

        def event_stream():
            sleep_time = 1 / 10
            while True:
                try:
                    data = g_manager.game_get_state(game_id)
                    yield f"data: {json.dumps(data)}\n\n".encode("utf-8")
                    time.sleep(sleep_time)  
                except GeneratorExit:
                    break
                except Exception as e:
                    yield f"event: error\ndata: {json.dumps({'error': str(e)})}\n\n".encode(
                        "utf-8"
                    )
                    break

        response = StreamingHttpResponse(event_stream(), content_type="text/event-stream")
        response["Cache-Control"] = "no-cache"
        return response

    else:
        response = JsonResponse({"error": "Invalid HTTP method: GET or PUT required"}, status=405)
        response["Allow"] = "GET, PUT"
        return response
