from django.urls import path

from . import views

urlpatterns = [
    path(
        "register/",
        views.user_registration_view,
        name="user_registration_view",
    ),
    path("login/", views.user_login_view, name="user_login_view"),
    path("logout/", views.user_logout_view, name="user_logout_view"),
    path(
        "status/",
        views.user_is_authenticated_view,
        name="user_is_authenticated_view",
    ),
]
