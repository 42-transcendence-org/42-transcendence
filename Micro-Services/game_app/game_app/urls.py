from . import views

from django.urls import include, path

urlpatterns = [
    path("", views.game_create_view, name="game_create_view"),
    path("<uuid:game_id>/", views.game_view, name="game_view"),
    path("<uuid:game_id>/aliases/", views.get_player_names, name="get_player_names"),
	path('prometheus/', include("django_prometheus.urls")),
	path('pongHistory/', views.pongHistoryAPIView.as_view(), name='pongHistory'),
	path('getFriendStats/', views.getFriendStatsAPIView.as_view(), name='getFriendStats'),
]
