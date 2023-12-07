# auth_app/views.py
from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.contrib.auth.models import User  # or your custom user model
from django.shortcuts import render
import logging

logger = logging.getLogger(__name__)

@api_view(['POST'])
def register(request):
    if request.method == 'POST':
        try:
            data = json.loads(requestbody)
            username = data['username']
            password = data['password']

            if not username or not password:
                return JsonResponse({'error': 'Username and oassword are required.'}, status=400)
            if User.objects.filter(username=username).exists():
                return JsonResponse({'error': 'Username already taken.'}, status=400)
            
            user = User.objects.create(username=username, password=make_password(password))
            return JsonResponse({'success': 'User created successfully.'}, status=201)
            
        except KeyError as e:
            return JsonResponse({'error': f'Missing field: {str(e)}'}, status=400)
        except json.JSONDecodeError:
            return JsonResponse({'error': 'Invalid JSON'}, status=400)
    
    else:
        return JsonResponse({'error': 'Invalid request method.'}, status=405)



def auth_form(request):
    logger.info("auth_form view is called")
    try:
        # Your existing logic...
        return render(request, 'auth_form.html')
    except Exception as e:
        logger.error(f"Error in auth_form view: {e}")
        raise
