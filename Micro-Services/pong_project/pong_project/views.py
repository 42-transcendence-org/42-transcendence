from django.shortcuts import render

from django.utils.translation import activate


def index(request):
    lang = request.GET.get('lang', 'en')
    activate(lang)
    return render(request, "index.html")

def fr(request):
    activate('fr')
    return render(request, "index.html")

def es(request):
    activate('es')
    return render(request, "index.html")
