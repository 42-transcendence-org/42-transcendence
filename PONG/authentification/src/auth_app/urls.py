from django.contrib import admin
from django.urls import path
from . import views  # Adjust the import based on your view function or class

urlpatterns = [
    path('register_form/', views.register_form, name='register_form'),
    path('login_form/', views.login_form, name='login_form'),
    path('register/', views.register, name='register'),
]
