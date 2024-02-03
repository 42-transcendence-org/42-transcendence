import uuid
import time
import json

from game.GameManager import g_manager

from django.http import JsonResponse, StreamingHttpResponse

GAME_TYPES = ["local", "remote", "ai"]

def game_add_alias(request):
    if request.method != "POST":
        response = JsonResponse(
            {"error": "Invalid HTTP method: POST required"}, status=405
        )
        response["Allow"] = "POST"
        return response

    try:
        data = json.loads(request.body)
    except json.JSONDecodeError:
        return JsonResponse({"error": "Invalid JSON"}, status=400)

    alias = data.get("alias")
    if not alias:
        return JsonResponse({"error": "'alias' is a required field"}, status=400)

    # TODO Check for uniqueness and validity of alias if necessary

    request.session["alias"] = alias
    return JsonResponse({"message": "Alias set successfully"}, status=200)


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
        return JsonResponse(
            {"error": "Please pick an alias before creating a game"}, status=400
        )

    global g_manager

    # Check for an active game session for this user
    has_session = g_manager.game_check_for_session(alias)
    if has_session:
        return JsonResponse(
            {"error": "You already have an active game session"}, status=403
        )

    # Check if we have a game session waiting for a second player
    waiting_game = g_manager.game_check_for_waiting(alias)
    if waiting_game:
        return JsonResponse({"id": waiting_game}, status=200)

    # Create a new game
    game_id = uuid.uuid4()
    g_manager.game_add(game_id, game_type, alias, "")
    return JsonResponse({"id": game_id}, status=201)


# TODO Add security like checking that the player is part of the game
# TODO Add security to prevent taking control of the other player paddle
@api_view(["PUT"])
@permission_classes([IsAuthenticated])
@throttle_classes([BurstRateThrottle])
def game_update_state_view(request: Request, game_id: uuid.UUID) -> Response:
    serializer = serializers.UpdateGameStateSerializer(data=request.data)
    if not serializer.is_valid():
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    if g.game_add_input(
        game_id,
        (serializer.validated_data.get("id"), serializer.validated_data.get("action")),
    ):
        return Response(status=status.HTTP_200_OK)
    return Response(status=status.HTTP_404_NOT_FOUND)


# TODO Add security like checking the game_id exists or that the player is part of the game
@permission_classes([IsAuthenticated])
def game_get_state_view(_, game_id: uuid.UUID):
    sleep_time = 1 / 10

    def event_stream():
        while True:
            try:
                s = g.game_get_state(game_id)
                data = {
                    "ball": {
                        "x": s["ball"]["x"],
                        "y": s["ball"]["y"],
                        "dx": s["ball"]["dx"],
                        "dy": s["ball"]["dy"],
                    },
                    "player1": {"x": s["player1"]["x"], "score": s["player1"]["score"]},
                    "player2": {"x": s["player2"]["x"], "score": s["player2"]["score"]},
                }
                yield f"data: {json.dumps(data)}\n\n"
                time.sleep(sleep_time)  # Adjust the frequency of updates as needed
            except GeneratorExit:
                # Handle case where client disconnects
                break
            except Exception as e:
                # Handle any other exceptions
                yield f"event: error\ndata: {json.dumps({'error': str(e)})}\n\n"
                break

    response = StreamingHttpResponse(event_stream(), content_type="text/event-stream")
    response["Cache-Control"] = "no-cache"
    return response
