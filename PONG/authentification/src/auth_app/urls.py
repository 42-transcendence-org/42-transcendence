from django.urls import path
from . import views  # Adjust the import based on your view function or class

urlpatterns = [
    path('auth_form/', views.auth_form, name='auth_form'),
    path('register/', views.register, name='register'),
]
