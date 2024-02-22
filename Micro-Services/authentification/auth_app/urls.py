from django.contrib import admin
from django.urls import path
# from .views import MyLoginView
from . import views  # Adjust the import based on your view function or class

urlpatterns = [

	#Loading html
    path('register_form/', views.register_form, name='register_form'),
    path('login_form/', views.login_form, name='login_form'),
    path('buttons/', views.login_buttons, name='buttons'),

	#Send Form
    path('register/', views.register, name='register'),
    path('login/', views.login_user, name='login'),
    path('logout/', views.logout_user, name='logout'),
    path('home/', views.home, name='home'),

	#Check
    path('check-authentication/', views.check_authentication, name='check_authentication'),

]
