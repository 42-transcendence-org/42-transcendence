
from django.http import JsonResponse
import jwt
import datetime
from authentification import settings
import os
import json
import requests
from django.contrib.auth.forms import AuthenticationForm, UserCreationForm
from django.contrib.auth import login, authenticate
from django.contrib.auth import logout
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import Profile
from django.contrib.auth.models import User
from openai import OpenAI
from .forms import CustomUserCreationForm

class EmailAPIView(APIView):
    def post(self, request, *args, **kwargs):
        email = request.data.get('email', 'no email')
        if email == 'no email':
            return (JsonResponse({"error": "email is required"}, status=400))
        request.user.profile.email = email
        request.user.profile.save()
        request.user.save()
        return (JsonResponse({"message": "success", "email": email}, status=200))
    
    def get(self, request, *args, **kwargs):
        if request.user.is_authenticated:
            email = request.user.profile.email
            if email:
                return JsonResponse({'email': email})
            return JsonResponse({'error': 'no email'})
        return JsonResponse({'error': "not authenticated"})

class UsernameAPIView(APIView):
    def post(self, request, *args, **kwargs):
        username = request.data.get('username', 'no username')
        if username == 'no username':
            return (JsonResponse({"error": "username is required"}, status=400))
        request.user.username = username
        request.user.save()
        return (JsonResponse({"message": "success", "username": username}, status=200))
    
    def get(self, request, *args, **kwargs):
        if request.user.is_authenticated:
            username = request.user.username
            if username:
                return JsonResponse({'username': username})
            return JsonResponse({'error': 'no username'})
        return JsonResponse({'error': "not authenticated"})

class NicknameAPIView(APIView):
    def post(self, request, *args, **kwargs):
        first_name = request.data.get('first_name', 'no first_name')
        if first_name == 'no first_name':
            return (JsonResponse({"error": "nickname is required"}, status=400))
        request.user.profile.nickname = first_name
        request.user.profile.save()
        request.user.save()
        return (JsonResponse({"message": "success", "first_name": first_name}, status=200))
    
    def get(self, request, *args, **kwargs):
        if request.user.is_authenticated:
            first_name = request.user.profile.nickname
            if first_name:
                return JsonResponse({'first_name': first_name})
            return JsonResponse({'error': 'no nickname'})
        return JsonResponse({'error': "not authenticated"})


class PasswordAPIView(APIView):
    def post(self, request, *args, **kwargs):
        password = request.data.get('password', 'no password')
        if password == 'no password':
            return (JsonResponse({"error": "password is required"}, status=400))
        request.user.set_password(password)
        request.user.save()
        return (JsonResponse({"message": "success", "password": password}, status=200))


class LoginAPIView(APIView):
    def post(self, request, *args, **kwargs):
        try:
            form = AuthenticationForm(data=request.data)
            if not form.is_valid():
                raise Exception(joinErrForm(form.errors))
            user = authenticate(username=form.cleaned_data['username'], password=form.cleaned_data['password'])
            if user:
                login(request, user)
                token = generate_jwt_token(user),
                return JsonResponse({'token': token, 'username': user.username, 'message': 'Login successful'}, status=status.HTTP_200_OK)
        except Exception as e:
            print(e)
            return Response({'error': e.args[0]}, status=status.HTTP_400_BAD_REQUEST)

class RegisterAPIView(APIView):
    def post(self, request, *args, **kwargs):
        try:
            form = UserCreationForm(data=request.data)
            if not form.is_valid(): #if username taken or password don't match
                raise Exception(joinErrForm(form.errors))
            if request.data.get('username').endswith('@42'): #if username ends with @42
                raise Exception('username cannot end with @42. Its is reserved for 42 accounts')
            if request.data.get('first_name').endswith('@42'): #if nickname ends with @42
                raise Exception('nickname cannot end with @42. Its is reserved for 42 accounts')
            users = User.objects.all() #checks if the nickname is already taken
            for key in users:
                if hasattr(key, 'profile') and key.profile is not None and key.profile.nickname is not None:
                    if key.profile.nickname == request.data.get('first_name'):
                        raise Exception('nickname already taken')
            user = form.save() #creates the user
            user.profile = Profile() #creates the profile
            user.profile.is42account = False
            user.profile.nickname = request.data.get('first_name')
            user.profile.correction_points = -1
            user.profil_picture = "./moon.jpg"
            user.profile.email = request.data.get('email')
            user.profile.save() #saves the profile
            user.save() #saves the user
            return Response({"message": "User registered successfully"}, status=status.HTTP_201_CREATED)
        except Exception as e:
            print(e)
            return Response({'error': e.args[0]}, status=status.HTTP_400_BAD_REQUEST)

class LogoutAPIView(APIView):
    def get(self, request, *args, **kwargs):
        logout(request)
        return Response({"message": "User logged out successfully"})

class Login42APIView(APIView): #gets the access token from 42 for the user loggin with 42
    def post(self, request, *args, **kwargs):
        try:
            api_host = 'https://api.intra.42.fr/oauth/token'
            api_data = {
                'grant_type': 'authorization_code',
                'client_id': 'u-s4t2ud-5e7e4a91d71b25aa41be7416b66b5e707d70b920b1c6521d6dfaa920a5ee8eb2',
                'client_secret': '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',
                'code': request.data.get('code', 'no code'),
                'redirect_uri': os.environ.get('OAUTH_REDIRECT_URI'),
                'state': os.environ.get('OAUTH_STATE')
            }
            response = requests.post(api_host, data=api_data, headers={'Content-Type': 'application/x-www-form-urlencoded'})
            token = json.loads(response.text)
            request.session["Oauth_token"] = token.get('access_token')
            return JsonResponse({})
        except Exception as e:
            print(e)
            return Response({'error': e.args[0]}, status=status.HTTP_400_BAD_REQUEST)

    def get(self, request, *args, **kwargs): #gets the user info from 42 and creates a user in the database
        try:
            headers = {
                'Authorization': f'Bearer {request.session["Oauth_token"]}',
            }
            request.session["Oauth_token"] = None
            response = requests.get('https://api.intra.42.fr/v2/me', headers=headers)
            userData = json.loads(response.text)
            userData['username'] = userData['login'] + '@42' #create the keys for UserCreationForm
            password = '42password'
            userData['password1'] = password
            userData['password2'] = password
            print(password)
            form = UserCreationForm(data=userData)
            if not form.is_valid(): #if username taken (user already registered)
                return Response({'message': 'User already registered', 'username':userData['username'], 'password':password}, status=status.HTTP_200_OK)
                raise Exception(joinErrForm(form.errors))
            user = form.save()
            user.profile = Profile()
            user.profile.is42account = True
            user.profile.nickname = userData['login'] + '@42'
            user.profile.correction_points = userData['correction_point']
            image42 = auth42ProfilePicture(userData['image']['versions']['large'], userData['login'] + '@42')
            user.profile.profile_picture = image42
            user.profile.email = userData['email']
            user.profile.save()
            user.save()
            return Response({"message": "User registered successfully", 'username':userData['username'], 'password':password}, status=status.HTTP_201_CREATED)
        except Exception as e:
            print(e)
            return Response({'error': e.args[0]}, status=status.HTTP_400_BAD_REQUEST)

class OAuthRedirectUrlAPIView(APIView): #returns the uri to redirect to 42's oauth page
    def get(self, request, *args, **kwargs):
        uri = 'https://api.intra.42.fr/oauth/authorize?'
        uri += f'client_id={os.environ.get("OAUTH_CLIENT_ID")}'
        uri += f'&redirect_uri={os.environ.get("OAUTH_REDIRECT_URI")}'
        uri += '&scope=public'
        uri += f'&state={os.environ.get("OAUTH_STATE")}'
        uri += '&response_type=code'
        return JsonResponse({'uri': uri})


def get42info(request):
    if request.user.is_authenticated:
            profile = request.user.profile
            return JsonResponse({'img': profile.profile_picture, \
                                'correction_points': profile.correction_points, \
                                'username': request.user.username, \
                                'nickname': profile.nickname, \
                                'email': profile.email})
    return JsonResponse({'error': 'You are not authenticated'})

class OAuthVerifyStateAPIView(APIView): #verifies the state received by the client is the right state
    def post(self, request, *args, **kwargs):
        if (os.environ.get('OAUTH_STATE') == request.data.get('state', 'no state')):
            return JsonResponse({'isValidState': True})
        return JsonResponse({'isValidState': False})

def joinErrForm(dico):
    string = ""
    for field, id in dico.items():
        for elem in id:
            string += f"{field}: {elem}\n" 
    return string

import random
import string

def random_string(length):
    letters_and_digits = string.ascii_letters + string.digits
    return ''.join(random.choice(letters_and_digits) for _ in range(length))



#poubelle
        


class chatgpt(APIView): #verifies the state received by the client is the right state
    client = OpenAI()
    def post(self, request, *args, **kwargs):
        completion = self.client.chat.completions.create(
            model="gpt-3.5-turbo",
            messages=[
                {"role": "system", "content": "On parle francais, on fait une app web hébergée en localhost. Le front end est en vanilla js, et le back end en django. Tu peux nous aider ? :)) On essaye de créer une classe user \
                 basée sur celle existante dans django, on veut pouvoir ajouter un avatar dans notre classe, mais encore utiliser les fct login/logout/userregistrationform et tout le tralala. "},
                {"role": "user", "content": request.data.get('question', 'salut mon reuf ca va ?')},
            ],
        )
        return JsonResponse({'response': completion.choices[0].message.content}
        )


class OAuthGetAppTokenAPIView(APIView):
    def get(self, request, *args, **kwargs):
        try:
            api_host = 'https://api.intra.42.fr/oauth/token'
            api_data = os.environ.get('OAUTH_APP_TOKEN_REQUEST')

            response = requests.post(api_host, data=api_data)
            token = json.loads(response.text)
            request.session["MyAppOauth_token"] = token.get('access_token')
            return JsonResponse({'token': token})
        except Exception as e:
            print(e)
            return JsonResponse({'error': 'The token couldn\'t be fetched. Check the parameters !'})


def check_authentication(request):
    if request.user.is_authenticated:
        return JsonResponse({'isAuthenticated': True})
    else:
        return JsonResponse({'isAuthenticated': False})

def get_username(request):
    if request.user.is_authenticated:
        username = request.user.username
        if username:
            return JsonResponse({'username': username})
        return JsonResponse({'error': 'no username'})
    else:
        return JsonResponse({'error': 'not authenticated'})

def generate_jwt_token(user):
    dt = datetime.datetime.now() + datetime.timedelta(hours=1)
    token = jwt.encode({
        'user_id': user.id,
        'username': user.username,
        'exp': int(dt.strftime('%s'))
    }, settings.SECRET_KEY, algorithm="HS256")

    return token.decode('utf-8') if isinstance(token, bytes) else token


def update_profile_picture(request):
    if request.method == 'POST':
        # Récupérer l'image depuis la requête
        profile_picture = request.FILES.get('profile_picture')
        name = "profile_picture_" + request.user.username + ".jpg"
        if profile_picture:
            # Traitement de l'image et stockage
            # Assurez-vous que MEDIA_ROOT est configuré dans vos paramètres Django pour indiquer le répertoire où stocker les fichiers
            with open(os.path.join(settings.MEDIA_ROOT, name), 'wb') as f:
                for chunk in profile_picture.chunks():
                    f.write(chunk)
            
            # Mettre à jour le chemin de l'image dans la base de données ou où vous stockez les informations de l'utilisateur
            # Exemple:
            request.user.profile.profile_picture = name
            request.user.profile.save()
            request.user.save()

            # Retourner une réponse JSON avec le chemin de l'image mise à jour
            return JsonResponse({'profile_picture': request.user.profile.profile_picture})

    # Si la méthode de requête n'est pas POST, retourner une réponse d'erreur
    return JsonResponse({'error': 'Méthode non autorisée'}, status=405)

def auth42ProfilePicture(image_url, login):
     if image_url:
         # Télécharger l'image depuis l'URL
         response = requests.get(image_url)
         name = 'profile_picture_' + login + '.jpg'
         if response.status_code == 200:
             # Assurez-vous que MEDIA_ROOT est configuré dans vos paramètres Django pour indiquer le répertoire où stocker les fichiers
             with open(os.path.join(settings.MEDIA_ROOT, name), 'wb') as f:
                 f.write(response.content)
             return (name)
     return ('avatar.jpg')


def send_friend_request(request, userID):
    from_user = request.user
    to_user = User.objects.get(id=userID)
    friend_request, created = Friend_Request.objects.get_or_create(
        from_user=from_user,
        to_user=to_user
    )
    if created:
        return JsonResponse({'message': 'Friend request sent'})
    else:
        return JsonResponse({'message': 'Friend request already sent'})


def accept_friend_request(request, requestID):
    friend_request = Friend_Request.objects.get(id=requestID)
    if friend_request.to_user == request.user:
        friend_request.to_user.friends.add(friend_request.from_user)
        friend_request.from_user.friends.add(friend_request.to_user)
        friend_request.delete()
        return JsonResponse({'message': 'Friend request accepted'})
    else:
        return JsonResponse({'message': 'Friend request not found'})