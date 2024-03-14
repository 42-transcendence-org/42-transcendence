from django.urls import path
from .views import LoginAPIView, RegisterAPIView, LogoutAPIView
# from .views import MyLoginView
from . import views  # Adjust the import based on your view function or class

urlpatterns = [
    
    path('login/', LoginAPIView.as_view(), name='api_login'),
    path('register/', RegisterAPIView.as_view(), name='api_register'),
    path('logout/', LogoutAPIView.as_view(), name='api_register'),

	#Check
    path('check-authentication/', views.check_authentication, name='check_authentication'),

]
