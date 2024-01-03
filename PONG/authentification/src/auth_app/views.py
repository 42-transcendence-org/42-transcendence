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
import json
import logging


logger = logging.getLogger(__name__)

@csrf_exempt
def register(request):
    pass
    # logger.info("register view is called")
    # if request.method == 'POST':
    #     try:
    #         data = json.loads(request.body)
    #         user = User.objects.create_user(password=data['username'], email=data['email'], password=data['password'])
    #         print("User created:", user.username)
    #         # return JsonResponse({"status": "success", "username": user.username})
    #         return JsonResponse({'message': 'User created successfully'})
    #     except Exception as e:
    #         return JsonResponse({"status": "error", "message": str(e)})
    # else:
    #     return JsonResponse({"status": "error", "message": "Only POST requests are allowed"})



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

class MyLoginView(LoginView):
    template_name = 'login_form.html'

# @login_required
def home(request):
    return render(request, 'home.html', {'user': request.user})

def login_user(request):
    print(request.body)
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
            return render(request, 'home.html')
        else:
            messages.info(request, "Indentifiant ou mot de passe incorrect.")

    form = AuthenticationForm()
    return render(request, "login.html", {"form": form})

def logout_user(request):
    logout(request)
    return redirect("home")

def register_user(request):
    print(request.body)
    if request.method == 'POST':
        if not request.body:
            return JsonResponse({'error': 'Empty request body'}, status=400)
        try:
            data = json.loads(request.body)
        except json.JSONDecodeError:
            return JsonResponse({'error': 'Invalid JSON'}, status=400)
        form = UserCreationForm(data)
        print('coucou1')
        if form.is_valid():
            print('coucou3')
            form.save()
            return render(request, 'home.html')
        else:
            print(form.errors)

    else:
        print('coucou2')
        form = UserCreationForm()

    return render(request, "register.html", {"form": form})
