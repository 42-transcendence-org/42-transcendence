from django.urls import path
from .views import LoginAPIView, RegisterAPIView, LogoutAPIView #basic auth
from .views import OAuthGetAppTokenAPIView, Login42APIView, OAuthVerifyStateAPIView, OAuthRedirectUrlAPIView, chatgpt #42 auth
from . import views  # Adjust the import based on your view function or class
from .views import EmailAPIView, NicknameAPIView, UsernameAPIView, PasswordAPIView, addFriendAPIView

urlpatterns = [
    
    path('login/', LoginAPIView.as_view(), name='api_login'),
    path('register/', RegisterAPIView.as_view(), name='api_register'),
    path('logout/', LogoutAPIView.as_view(), name='api_register'),

	#Check
    path('check-authentication/', views.check_authentication, name='check_authentication'),

    #profile
	
    path("email/", EmailAPIView.as_view(), name="email"),
    path("nickname/", NicknameAPIView.as_view(), name="first_name"),
    path("username/", UsernameAPIView.as_view(), name="username"), 
    path('get_username/', views.get_username, name='get_username'),
    path("password/", PasswordAPIView.as_view(), name="password"),

    #42OAuth
	path('OAuthRedirectUrl/', OAuthRedirectUrlAPIView.as_view(), name='OAuthRedirectUrl'),
	path('OAuthVerifyState/', OAuthVerifyStateAPIView.as_view(), name='OAuthVerifyState'),
	path('login42/', Login42APIView.as_view(), name='Login42'),
	path('OAuthGetAppToken/', OAuthGetAppTokenAPIView.as_view(), name='OAuthGetAppToken'),
	path('getInfo/', views.getInfo, name='get42info'),
	path('chatgpt/', chatgpt.as_view(), name='chatgpt'),
	
    path('update_profile_picture/', views.update_profile_picture, name='update_profile_picture'),
	path('addFriend/', addFriendAPIView.as_view(), name='addFriend'),

]
