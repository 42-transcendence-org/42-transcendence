from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def welcome(request):
    return render(request, 'welcome.html')