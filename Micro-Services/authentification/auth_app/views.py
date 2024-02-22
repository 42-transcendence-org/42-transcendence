# auth_app/views.py
from django.contrib.auth.models import User  # or your custom user model
from django.shortcuts import render, redirect
from django.http import JsonResponse
from django.contrib.auth.models import User
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.views import LoginView
from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import AuthenticationForm, UserCreationForm
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from .forms import CustomUserCreationForm
import json
import logging
import jwt
import datetime
from authentification import settings


logger = logging.getLogger(__name__)

def register_form(request):
    logger.info("register_form view is called")
    try:
        return render(request, 'register_form.html')
    except Exception as e:
        logger.error(f"Error in register_form view: {e}")
        raise

def login_form(request):
    logger.info("login_form view is called")
    try:
        return render(request, 'login_form.html')
    except Exception as e:
        logger.error(f"Error in login_form view: {e}")
        raise

def login_buttons(request):
    logger.info("login_form view is called")
    try:
        return render(request, 'loginButtons.html')
    except Exception as e:
        logger.error(f"Error in login_buttons view: {e}")
        raise


def home(request):
    return render(request, 'home.html', {'user': request.user})

def login_user(request):
    if request.method == 'POST':
        if not request.body:
            return JsonResponse({'error': 'Empty request body'}, status=400)
        try:
            data = json.loads(request.body)
        except json.JSONDecodeError:
            return JsonResponse({'error': 'Invalid JSON'}, status=400)
        username = data.get('username')
        password = data.get('password')

        if not username or not password:
            return JsonResponse({'error': 'Veuillez remplir tous les champs'}, status=400)

        user = authenticate(request, username = username, password = password)

        if user is not None:
            login(request, user)
            token = generate_jwt_token(user),
            return JsonResponse({'token': token, 'message': 'Login successful'})
        else:
            return JsonResponse({'error': 'Invalid username or password'}, status=401)
    form = AuthenticationForm()
    return render(request, "login.html", {"form": form})

def logout_user(request):
    logout(request)
    return JsonResponse({'status': 'logged out'})

def register(request):
    print(request.body)
    if request.method == 'POST':
        if not request.body:
            return JsonResponse({'error': 'Empty request body'}, status=400)
        try:
            data = json.loads(request.body)
        except json.JSONDecodeError:
            return JsonResponse({'error': 'Invalid JSON'}, status=400)
        form = UserCreationForm(data)
        if form.is_valid():
            form.save()
            return JsonResponse({'register': True, 'message': 'Register successful'})
        else:
            print(form.errors)
    else:
        form = UserCreationForm()
    return render(request, "register.html", {"form": form})

def check_authentication(request):
    if request.user.is_authenticated:
        return JsonResponse({'isAuthenticated': True})
    else:
        return JsonResponse({'isAuthenticated': False})

def generate_jwt_token(user):
    dt = datetime.datetime.now() + datetime.timedelta(hours=1)
    token = jwt.encode({
        'user_id': user.id,  # Use user ID or any other user identifier
        'exp': int(dt.strftime('%s'))  # Expiry date
    }, settings.SECRET_KEY, algorithm="HS256")

    return token.decode('utf-8') if isinstance(token, bytes) else token