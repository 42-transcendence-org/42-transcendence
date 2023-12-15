# auth_app/views.py
from django.contrib.auth.models import User  # or your custom user model
from django.shortcuts import render
from django.http import JsonResponse
from django.contrib.auth.models import User
from django.views.decorators.csrf import csrf_exempt
import json
import logging

logger = logging.getLogger(__name__)

@csrf_exempt
def register(request):
    logger.info("register view is called")
    if request.method == 'POST':
        try:
            data = json.loads(request.body)
            user = User.objects.create_user(username=data['username'], email=data['email'], password=data['password'])
            print("User created:", user.username)
            # return JsonResponse({"status": "success", "username": user.username})
            return JsonResponse({'message': 'User created successfully'})
        except Exception as e:
            return JsonResponse({"status": "error", "message": str(e)})
    else:
        return JsonResponse({"status": "error", "message": "Only POST requests are allowed"})



def auth_form(request):
    logger.info("auth_form view is called")
    try:
        return render(request, 'auth_form.html')
    except Exception as e:
        logger.error(f"Error in auth_form view: {e}")
        raise


def index(request):
    return render(request, 'test.html') 