import uuid
import time
import json

from game_app.game.GameManager import g_manager

from django.http import JsonResponse, StreamingHttpResponse

PLAYER_ID = [0, 1]
GAME_INPUTS = [-1, 0, 1]
GAME_TYPES = ["local", "remote", "ai"]


def game_create_view(request):
    # Check the HTTP method
    if request.method != "POST":
        response = JsonResponse(
            {"error": "Invalid HTTP method: POST required"}, status=405
        )
        response["Allow"] = "POST"
        return response

    # Serialize the request's body to a dict
    try:
        data = json.loads(request.body)
    except json.JSONDecodeError:
        return JsonResponse({"error": "Invalid JSON"}, status=400)

    # Validate the data
    game_type = data.get("type")
    if game_type is None:
        return JsonResponse({"error": "'type' is a required field"}, status=400)
    if game_type not in GAME_TYPES:
        return JsonResponse({"error": "Invalid value for field 'type'"}, status=400)

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
    name2 = ""
    if game_type == "ai":
        name2 = "Computer"
    elif game_type == "local":
        name2 = "Player 2"
    g_manager.game_add(game_id, game_type, alias, name2)
    return JsonResponse(
        {"id": game_id, "type": game_type, "name1": alias, "name2": name2}, status=201
    )


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

        player_id = data.get("id")
        player_input = data.get("input")
        if player_id is None or player_input is None:
            return JsonResponse(
                {"error": "'id' and 'input' are required fields"}, status=400
            )
        if player_id not in PLAYER_ID or player_input not in GAME_INPUTS:
            return JsonResponse({"error": "Invalid 'id' or 'input'"}, status=400)

        # Check that the game exists and the player is part of that game
        if not g_manager.game_exists or not g_manager.validate_player_id(
            game_id, alias, player_id
        ):
            return JsonResponse(
                {"error": "Invalid game ID or player not part of the game"}, status=403
            )

        g_manager.game_add_input(game_id, (player_id, player_input))
        return JsonResponse({"message": "Input processed successfully"}, status=200)

    # Handle GET request for streaming game state
    elif request.method == "GET":
        # Check that the game exists and the player is part of that game
        if not g_manager.game_exists or not g_manager.validate_player_id(
            game_id, alias, 0
        ):
            return JsonResponse(
                {"error": "Invalid game ID or player not part of the game"}, status=403
            )

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

        response = StreamingHttpResponse(
            event_stream(), content_type="text/event-stream"
        )
        response["Cache-Control"] = "no-cache"
        return response

    else:
        response = JsonResponse(
            {"error": "Invalid HTTP method: GET or PUT required"}, status=405
        )
        response["Allow"] = "GET, PUT"
        return response
