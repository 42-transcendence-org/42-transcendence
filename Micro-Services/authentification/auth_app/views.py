# auth_app/views.py
# from django.contrib.auth.models import User  # or your custom user model
# from django.shortcuts import render
from django.http import JsonResponse
# from django.contrib.auth.forms import AuthenticationForm, UserCreationForm
# from django.contrib.auth import authenticate, login, logout
# import json
import jwt
import datetime
from authentification import settings

from django.contrib.auth.forms import AuthenticationForm, UserCreationForm
from django.contrib.auth import login, authenticate
from django.contrib.auth import logout
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.contrib.auth.models import User


class LoginAPIView(APIView):
    def post(self, request, *args, **kwargs):
        form = AuthenticationForm(data=request.data)
        print(form)
        if form.is_valid():
            user = authenticate(username=form.cleaned_data['username'], password=form.cleaned_data['password'])
            print(form.cleaned_data['username'])
            if user:
                login(request, user)
                token = generate_jwt_token(user),
                return JsonResponse({'token': token, 'username': user.username, 'message': 'Login successful'}, status=status.HTTP_200_OK)
            else:
                errors = {}
                errors['Authentication'] = 'Username or password are incorrect'
        return Response(form.errors, status=status.HTTP_400_BAD_REQUEST)

class RegisterAPIView(APIView):
    def post(self, request, *args, **kwargs):
        form = UserCreationForm(data=request.data)
        print(request.data)
        if form.is_valid():
            form.save()
            return Response({"message": "User registered successfully"}, status=status.HTTP_201_CREATED)
        else:
            errors = {}
            if 'username' in form.errors and User.objects.filter(username=request.data['username']).exists():
                errors['username'] = 'Username already exists'
            if 'password2' in form.errors:
                errors['password2'] = 'Passwords do not match'
        return Response(form.errors, status=status.HTTP_400_BAD_REQUEST)

class LogoutAPIView(APIView):
    def get(self, request, *args, **kwargs):
        logout(request)
        return Response({"message": "User logged out successfully"})

def check_authentication(request):
    if request.user.is_authenticated:
        return JsonResponse({'isAuthenticated': True})
    else:
        return JsonResponse({'isAuthenticated': False})

def generate_jwt_token(user):
    dt = datetime.datetime.now() + datetime.timedelta(hours=1)
    token = jwt.encode({
        'user_id': user.id,
        'username': user.username,
        'exp': int(dt.strftime('%s'))
    }, settings.SECRET_KEY, algorithm="HS256")

    return token.decode('utf-8') if isinstance(token, bytes) else token