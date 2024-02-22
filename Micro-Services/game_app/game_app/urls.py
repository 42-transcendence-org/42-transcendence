from django.urls import path
from django.urls import include

from . import views

urlpatterns = [
    path("", views.game_create_view, name="game_create_view"),
    path("<uuid:game_id>/", views.game_view, name="game_view"),
	path('prometheus/', include("django_prometheus.urls")),
]
