from django.http import JsonResponse
import jwt
import datetime
import os
import json
import requests
from django.contrib.auth.forms import AuthenticationForm, UserCreationForm
from django.contrib.auth import login, authenticate
from django.contrib.auth import logout
from rest_framework.views import APIView

from django.http import JsonResponse


class tournamentAPIView(APIView):
	def get(self, request):
		return JsonResponse({'username': request.username, 'user_id':request.user_id})