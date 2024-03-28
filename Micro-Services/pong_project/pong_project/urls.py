from django.contrib import admin
from django.urls import path, include
from django.urls import include

from . import views

urlpatterns = [
    path("", views.index, name="index"),
	path("fr/", views.fr, name="fr"),
	path("es/", views.es, name="es"),
    path("admin/", admin.site.urls),
	path('prometheus/', include("django_prometheus.urls")),
	
]

