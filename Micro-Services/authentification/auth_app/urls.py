
from django.urls import path
#connection.js
from .views import LoginAPIView, RegisterAPIView, LogoutAPIView, check_authentication
#42Oauth
from .views import Login42APIView, OAuthRedirectUrlAPIView, OAuthVerifyStateAPIView
#chatbot
from .views import chatbotAPIView


urlpatterns = [
    
    #connection.js
    path('login/', LoginAPIView.as_view(), name='api_login'),
    path('register/', RegisterAPIView.as_view(), name='api_register'),
    path('logout/', LogoutAPIView.as_view(), name='api_register'),
    path('check-authentication/', check_authentication, name='check_authentication'),

    #42OAuth
	path('login42/', Login42APIView.as_view(), name='Login42'),
	path('OAuthRedirectUrl/', OAuthRedirectUrlAPIView.as_view(), name='OAuthRedirectUrl'),
	path('OAuthVerifyState/', OAuthVerifyStateAPIView.as_view(), name='OAuthVerifyState'),
	
    #chatbot
	path('chatgpt/', chatbotAPIView.as_view(), name='chatgpt'),
	
]
