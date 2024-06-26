"""
URL configuration for tournament project.

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
from django.urls import include, path
from .blockchain.blockchain import save_tournament, get_tournament, get_url_blockchain

urlpatterns = [
	path('prometheus/', include("django_prometheus.urls")),

    path('saveTournament/', save_tournament, name='saveTournament'),
    path('getTournament/', get_tournament, name='getTournament'),
    path('getUrlBlockchain/', get_url_blockchain, name='getUrlBlockchain')
]
