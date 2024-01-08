"""
URL configuration for frontend project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
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
from .views import welcome
from .settings import STATIC_URL
from django.conf.urls.static import static

urlpatterns = [
    path('', welcome, name='welcome'),
    path('admin/', admin.site.urls),
	path('metrics', lambda request: HttpResponse(django_prometheus_exports.export_to_django_view(), content_type='text/plain')),
] + static(STATIC_URL)
