from rest_framework import status
from rest_framework.response import Response
from rest_framework.request import Request
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated

from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout

from . import serializers

@api_view(["POST"])
def user_registration_view(request: Request) -> Response:
    serializer = serializers.UserRegistrationSerializer(data=request.data)
    if serializer.is_valid():
        User.objects.create_user(**serializer.validated_data)
        return Response(status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(["POST"])
def user_login_view(request: Request) -> Response:
    serializer = serializers.UserLoginSerializer(data=request.data)
    if serializer.is_valid():
        user = authenticate(**serializer.validated_data)
        if user:
            login(request, user)
            return Response(status=status.HTTP_200_OK)
        return Response(
            {"error": "Invalid credentials"}, status=status.HTTP_401_UNAUTHORIZED
        )
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(["POST"])
@permission_classes([IsAuthenticated])
def user_logout_view(request: Request) -> Response:
    logout(request)
    return Response({"message": "Successfully logged out"})


@api_view(["GET"])
def user_is_authenticated_view(request: Request) -> Response:
    user = request.user
    if user.is_authenticated:
        return Response({"is_authenticated": True}, status=status.HTTP_200_OK)
    else:
        return Response({"is_authenticated": False}, status=status.HTTP_200_OK)
