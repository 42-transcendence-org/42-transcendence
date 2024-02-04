from django.contrib import admin
from django.urls import path, include

from . import views

urlpatterns = [
    path("", views.index, name="index"),
    path("admin/", admin.site.urls),
    path("api/alias/", include("alias_app.urls")),
    path("api/games/", include("game_app.urls")),
]
