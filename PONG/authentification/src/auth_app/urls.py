from django.contrib import admin
from django.urls import path
from .views import MyLoginView
from . import views  # Adjust the import based on your view function or class

urlpatterns = [
    path('register_form/', views.register_form, name='register_form'),
    # path('register/', views.register, name='register'),
    path('register/', views.register_user, name='register'),
    path('login_form/', MyLoginView.as_view(), name='login_form'),
    # path('login/', MyLoginView.as_view(), name='login'),
    path('login/', views.login_user, name='login'),
    # path('logout/', LogoutView.as_view(), name='logout'),
    path('login/', views.logout_user, name='logout'),
    path('home/', views.home, name='home'),
]
