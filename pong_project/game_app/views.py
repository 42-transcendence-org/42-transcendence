import time
import uuid
import json

import game_app.pong.session as session
import game_app.pong.constants as g

from django.http import JsonResponse, StreamingHttpResponse


def game_create_view(request):
    # Check the HTTP method
    if request.method != "POST":
        response = JsonResponse({"error": "Invalid HTTP method: POST required"}, status=405)
        response["Allow"] = "POST"
        return response

    # Verify that the client has an alias
    alias = request.session.get("alias")
    if alias is None:
        return JsonResponse({"error": "Please pick an alias first"}, status=400)

    # Check if the player already has a game session
    has_session = session.session_has(alias)
    if has_session:
        return JsonResponse({"id": has_session}, status=200)

    # Check for a game session waiting for a second player
    waiting_game = session.session_waiting(alias)
    if waiting_game:
        return JsonResponse({"id": waiting_game}, status=200)

    # Create a new game
    game_id = uuid.uuid4()
    session.session_create(game_id, alias)
    return JsonResponse({"id": game_id}, status=201)


def game_view(request, game_id: uuid.UUID):

    # Verify that the client has an alias
    alias = request.session.get("alias")
    if alias is None:
        return JsonResponse({"error": "Please pick an alias first"}, status=400)

    # Check that the game exists
    if not session.session_exists(game_id):
        return JsonResponse({"error": "Invalid game ID"}, status=403)

    # Check that the client is part of that game
    if not session.session_is_in(game_id, alias):
        return JsonResponse({"error": "You are not part of this game"}, status=403)

    # Handle PUT request for updating game state
    if request.method == "PUT":
        try:
            data = json.loads(request.body)
            # Ensure data is a list with two elements
            if not (isinstance(data, list) and len(data) == 2):
                raise ValueError("Input must be a pair of [input, timestamp]")
        except (json.JSONDecodeError, ValueError) as e:
            return JsonResponse({"error": str(e)}, status=400)

        input, timestamp = data
        if input not in g.INPUTS:
            return JsonResponse({"error": "Invalid value for 'input'"}, status=400)

        session.session_add_input(game_id, alias, input, timestamp)
        return JsonResponse({}, status=200)

    # Handle GET request for streaming game state
    elif request.method == "GET":
        # FIXME Should this be async ?
        def event_stream():
            sleep_time = 1 / 10
            while True:
                try:
                    session.session_update(game_id)
                    data = session.session_get_state_small(game_id)
                    yield f"data: {json.dumps(data)}\n\n".encode("utf-8")
                    time.sleep(sleep_time)
                except GeneratorExit:
                    break
                except Exception as e:
                    yield f"event: error\ndata: {json.dumps({'error': str(e)})}\n\n".encode("utf-8")
                    break

        response = StreamingHttpResponse(event_stream(), content_type="text/event-stream")
        response["Cache-Control"] = "no-cache"
        return response

    else:
        response = JsonResponse({"error": "Invalid HTTP method: GET or PUT required"}, status=405)
        response["Allow"] = "GET, PUT"
        return response
