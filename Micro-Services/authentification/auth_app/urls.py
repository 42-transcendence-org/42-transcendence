from django.urls import path
from .views import LoginAPIView, RegisterAPIView, LogoutAPIView
# from .views import MyLoginView
from . import views  # Adjust the import based on your view function or class

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

]
