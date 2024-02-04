from django.urls import path

from . import views

urlpatterns = [
    path("", views.alias_view, name="alias_view"),
]
