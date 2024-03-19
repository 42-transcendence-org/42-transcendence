from django.urls import path
from .views import LoginAPIView, RegisterAPIView, LogoutAPIView, EmailAPIView, UsernameAPIView, NicknameAPIView, PasswordAPIView, OAuthGetAppTokenAPIView, Login42APIView, OAuthVerifyStateAPIView, OAuthRedirectUrlAPIView, chatgpt
# from .views import MyLoginView
from . import views  # Adjust the import based on your view function or class
# from .views import get_user_profile
from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [

	# #Loading html
    # path('register_form/', views.register_form, name='register_form'),
    # path('login_form/', views.login_form, name='login_form'),
    # path('buttons/', views.login_buttons, name='buttons'),

	# #Send Form
    # path('register/', views.register, name='register'),
    # path('login/', views.login_user, name='login'),
    # path('logout/', views.logout_user, name='logout'),
    # path('home/', views.home, name='home'),

    path('login/', LoginAPIView.as_view(), name='api_login'),
    path('register/', RegisterAPIView.as_view(), name='api_register'),
    path('logout/', LogoutAPIView.as_view(), name='api_register'),

	#Check
    path('check-authentication/', views.check_authentication, name='check_authentication'),
    path("email/", EmailAPIView.as_view(), name="email"),
    path("nickname/", NicknameAPIView.as_view(), name="first_name"),
    path("username/", UsernameAPIView.as_view(), name="username"), 
    path('get_username/', views.get_username, name='get_username'),
    # path('get_nickname/', views.get_nickname, name='get_nickname'),
    path("password/", PasswordAPIView.as_view(), name="password"),



    #42OAuth
	path('login42/', Login42APIView.as_view(), name='Login42'),
	path('OAuthGetAppToken/', OAuthGetAppTokenAPIView.as_view(), name='OAuthGetAppToken'),
	path('OAuthVerifyState/', OAuthVerifyStateAPIView.as_view(), name='OAuthVerifyState'),
	path('OAuthRedirectUrl/', OAuthRedirectUrlAPIView.as_view(), name='OAuthRedirectUrl'),
	path('get42info/', views.get42info, name='get42info'),
	path('chatgpt/', chatgpt.as_view(), name='chatgpt'),
    path('update_profile_picture/', views.update_profile_picture, name='update_profile_picture'),
    path('send_friend_request/<int:userID>', views.send_friend_request, name='send_friend_request'),
    path('accept_friend_request/<int:requestID>', views.accept_friend_request, name='accept_friend_request'),
]

# urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
