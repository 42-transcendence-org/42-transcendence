# auth_app/views.py
from django.contrib.auth.models import User  # or your custom user model
from django.shortcuts import render
from django.http import JsonResponse
from django.contrib.auth.models import User
import logging

logger = logging.getLogger(__name__)

def register(request):
    logger.info("register view is called")
    if request.method == 'POST':
        # Extract user data from request
        username = request.POST.get('username')
        password = request.POST.get('password')
        # Add validation as needed

        # Create user
        user = User.objects.create_user(username=username, password=password)
        return JsonResponse({'status': 'success', 'username': user.username})
    return JsonResponse({'status': 'error', 'message': 'Invalid request'}, status=400)



def auth_form(request):
    logger.info("auth_form view is called")
    try:
        # Your existing logic...
        return render(request, 'auth_form.html')
    except Exception as e:
        logger.error(f"Error in auth_form view: {e}")
        raise
