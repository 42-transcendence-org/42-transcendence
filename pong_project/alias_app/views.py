import re
import json

from django.http import JsonResponse
from django.contrib.sessions.models import Session


def alias_view(request):
    # Handle GET request
    if request.method == "GET":
        alias = request.session.get("alias")
        if alias is None:
            return JsonResponse({"error": "Please pick an alias first"}, status=400)
        return JsonResponse({"alias": alias}, status=200)

    # Handle POST and PUT requests
    elif request.method in ["POST", "PUT"]:
        try:
            data = json.loads(request.body)
        except json.JSONDecodeError:
            return JsonResponse({"error": "Invalid JSON"}, status=400)

        alias = data.get("alias")
        if not alias:
            return JsonResponse({"error": "'alias' is a required field"}, status=400)

        # Check the length of the alias
        if not (2 <= len(alias) <= 16):
            return JsonResponse(
                {"error": "Alias must be between 2 and 16 characters"}, status=400
            )

        # Check that the alias contains only US-ASCII characters
        if not re.match(r"^[\x00-\x7F]+$", alias):
            return JsonResponse(
                {"error": "Alias must contain only US-ASCII characters"}, status=400
            )

        # Check for uniqueness
        for session in Session.objects.all():
            session_data = session.get_decoded()
            if session_data.get("alias") == alias:
                return JsonResponse({"error": "Alias already in use"}, status=400)

        request.session["alias"] = alias
        return JsonResponse({"message": "Alias set successfully"}, status=200)

    else:
        # If the request method is not GET, POST, or PUT
        response = JsonResponse(
            {"error": "Invalid HTTP method: GET, POST, or PUT required"}, status=405
        )
        response["Allow"] = "GET, POST, PUT"
        return response
