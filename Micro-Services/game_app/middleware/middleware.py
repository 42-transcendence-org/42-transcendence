import jwt
from django.http import JsonResponse
from game_app import settings
import logging

logger = logging.getLogger(__name__)

class JWTAuthenticationMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        token = self.get_token(request)
        if token:
            try:
                payload = jwt.decode(token, settings.SECRET_KEY, algorithms=["HS256"])
                request.user_id = payload.get('user_id')
            except (jwt.ExpiredSignatureError, jwt.InvalidTokenError, ValueError) as e:
                # Decide how you want to handle errors: log, set request.user_id to None, or return an error response
                pass
        return self.get_response(request)
    
    @staticmethod
    def get_token(request):
        authorization_header = request.META.get('HTTP_AUTHORIZATION')
        if authorization_header:
            try:
                prefix, token = authorization_header.split(' ')
                if prefix.lower() == 'bearer':
                    return token
                
            except ValueError:
                pass
        # logger("Hello there")
        return request.GET.get('token')