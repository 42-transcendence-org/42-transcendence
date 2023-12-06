# auth_app/views.py
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.contrib.auth.models import User  # or your custom user model

@api_view(['POST'])
def register(request):
    name = request.data.get('name')
    nickname = request.data.get('nickname')
    # Implement your logic for user registration
    # For example, create a new user in the database
    User.objects.create_user(username=name, nickname=nickname)  # Adjust as per your model
    return Response({'status': 'success', 'message': 'User registered'})
