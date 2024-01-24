"""
URL configuration for pong_project project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from pong_game import views

urlpatterns = [
    path("", views.index, name="index"),
    path("admin/", admin.site.urls),
    path("api/auth/register/", views.user_registration, name="user_registration"),
    path("api/auth/login/", views.user_login, name="user_login"),
    path("api/auth/logout/", views.user_logout, name="user_logout"),
    path("api/auth/check/", views.user_is_authenticated, name="user_is_authenticated"),
    path("api/games/", views.game_create, name="game_create"),
    path(
        "api/games/<uuid:game_id>/",
        views.game_state_dispatcher,
        name="game_state_dispatcher",
    ),
]
