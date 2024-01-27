from django.urls import path

from . import views

urlpatterns = [
    path("", views.game_create_view, name="game_create_view"),
    path(
        "<uuid:game_id>/get/",
        views.game_get_state_view,
        name="game_get_state_view",
    ),
    path(
        "<uuid:game_id>/update/",
        views.game_update_state_view,
        name="game_update_state_view",
    ),
]
