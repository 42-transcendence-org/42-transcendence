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
from .models import Profile, Friendship
from django.contrib.auth.models import User
from openai import OpenAI
from django.http import JsonResponse
import requests

#views

#CONNECTION.JS LOGIN/LOGOUT/REGISTER VIEWS

class LoginAPIView(APIView):
    def post(self, request, *args, **kwargs):
        print("test")
        url = "http://localhost:8004/test/"
        response = requests.post(url)
        print(response)
        try:
            form = AuthenticationForm(data=request.data)
            if not form.is_valid():
                users = User.objects.all()
                for user in users:
                    if user.username == request.data.get('username'):
                        raise Exception('The password is incorrect')
                raise Exception("The username doesn't exist")
            user = authenticate(username=form.cleaned_data['username'], password=form.cleaned_data['password'])
            if user:
                login(request, user)
                token = generate_jwt_token(user)
                user.profile.online = True
                user.profile.save()
                return JsonResponse({'token': token, 'username': user.username, 'message': 'Login successful'}, status=status.HTTP_200_OK)
        except Exception as e:
            print("check ", e)
            return Response({'error': "Connection refused: " + e.args[0]}, status=status.HTTP_400_BAD_REQUEST)

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
            if (isNicknameUnique(request.data.get('first_name')) == False): #if nickname already taken
                raise Exception('nickname already taken')
            user = form.save() #creates the user
            user.profile.is42account = False
            user.profile.nickname = request.data.get('first_name')
            user.profile.correction_points = -1
            user.profile.profil_picture = "./avatar.jpg"
            user.profile.email = request.data.get('email')
            user.profile.save() #saves the profile
            user.save() #saves the user
            print("coucou2")
            user_data = {
                "user": user.id,  # Supposons que `user` est l'instance de l'utilisateur créé
                "is42account": False,
                "email": request.data.get('email'),
                "profile_picture": "./avatar.jpg",
                "nickname": request.data.get('first_name'),
                "correction_points": -1,
                "online": True
            }
            send_profile_to_user_service(user_data)
            return Response({"message": "User registered successfully"}, status=status.HTTP_201_CREATED)
        except Exception as e:
            print(e)
            return Response({'error': "Registration refused: " + e.args[0]}, status=status.HTTP_400_BAD_REQUEST)

class LogoutAPIView(APIView):
    def get(self, request, *args, **kwargs):
        try:
            request.user.profile.online = False
            request.user.profile.save()
            logout(request)
            return Response({"message": "User logged out successfully"})
        except Exception as e:
            print(e)
            return Response({'error': "Logout refused: " + e.args[0]}, status=status.HTTP_400_BAD_REQUEST)


def check_authentication(request):
    if request.user.is_authenticated:
        return JsonResponse({'isAuthenticated': True})
    else:
        return JsonResponse({'error': 'Not authenticated', 'isAuthenticated': False})

# CONNECTION.JS UTILS, NOT VIEWS BUT FUNCTIONS
def joinErrForm(dico):
    string = ""
    for field, id in dico.items():
        for elem in id:
            string += f"{field}: {elem}\n" 
    return string


def generate_jwt_token(user):
    dt = datetime.datetime.now() + datetime.timedelta(hours=1)
    token = jwt.encode({
        'user_id': user.id,
        'username': user.username,
        'exp': int(dt.strftime('%s'))
    }, settings.SECRET_KEY, algorithm="HS256")

    return token.decode('utf-8') if isinstance(token, bytes) else token





#NOT A VIEW, UTILS FOR NICKNAME IN REGISTRATION/PROFILE
def isNicknameUnique(nickname):
    users = User.objects.all() #checks if the nickname is already taken
    try:
        for user in users:
            if hasattr(user, 'profile') and user.profile is not None and user.profile.nickname is not None:
                if user.profile.nickname == nickname:
                    return False
    except Exception as e:
        print(e)
        return False
    return True



def send_profile_to_user_service(user_data):
    print("coucou1")
    url = "https://localhost:8443/user/api/profile/"
    response = requests.post(url, data=user_data)
    if response.status_code == 201:
        print("Profile created successfully in User Service")
    else:
        print("Failed to create profile in User Service")

#OAUTH.JS VIEWS
class Login42APIView(APIView): #gets the access token from 42 for the user loggin with 42
    def post(self, request, *args, **kwargs):
        try:
            api_host = 'https://api.intra.42.fr/oauth/token'
            api_data = {
                'grant_type': 'authorization_code',
                'client_id': 'u-s4t2ud-5e7e4a91d71b25aa41be7416b66b5e707d70b920b1c6521d6dfaa920a5ee8eb2',
                'client_secret': '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',
                'code': request.data.get('code', 'no code'),
                'redirect_uri': 'https://localhost:8443',
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
            password = os.environ.get('OAUTH_USERS_PASSWORD') + "42" + userData['login'] #create the password
            userData['password1'] = password
            userData['password2'] = password
            form = UserCreationForm(data=userData)
            if not form.is_valid(): #if 42 user account was already registered
                return Response({'message': 'User already registered', 'username':userData['username'], 'password':password}, status=status.HTTP_200_OK)
            user = form.save()
            user.profile.is42account = True
            user.profile.nickname = userData['login'] + '@42' #will always be unique because of the @42 at the end + forbidden to create a user with @42 
            user.profile.correction_points = userData['correction_point']
            test = auth42ProfilePicture(userData['image']['versions']['large'], userData['login'] + '@42')
            user.profile.profile_picture = test
            user.profile.email = userData['email']
            user.profile.save()
            user.save()
            user_data = {
                "user": user.id,  # Supposons que `user` est l'instance de l'utilisateur créé
                "is42account": True,
                "email": user.email,
                "profile_picture": test,
                "nickname": userData['login'] + '@42',
                "correction_points": userData['correction_point'],
                "online": True
            }
            send_profile_to_user_service(user_data)
            return Response({"message": "User registered successfully", 'username':userData['username'], 'password':password,}, status=status.HTTP_201_CREATED)
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

class OAuthVerifyStateAPIView(APIView): #verifies the state received by the client is the right state
    def post(self, request, *args, **kwargs):
        if (os.environ.get('OAUTH_STATE') == request.data.get('state', 'no state')):
            return JsonResponse({'isValidState': True})
        return JsonResponse({'error': 'The state doesn\'t match 42API'})
    

#utils for 42 REGISTRATION
def auth42ProfilePicture(image_url, login):
    if image_url:
        response = requests.get(image_url)
        name = 'profile_picture_' + login + '.jpg'
        if response.status_code == 200:
            with open(os.path.join(settings.MEDIA_ROOT, name), 'wb') as f:
                f.write(response.content)
            return (name)
    return ('avatar.jpg')


        



#CHATBOT.JS VIEWS
class chatbotAPIView(APIView): #verifies the state received by the client is the right state
    client = None
    def post(self, request, *args, **kwargs):
        try:
            client = OpenAI()
            self.client = client
            completion = self.client.chat.completions.create(
                model="gpt-3.5-turbo",
                messages=[
                    {"role": "system", "content": "Tu parles anglais. Tu es le bot de notre app web pong, effectuée pour 42 dans le cadre du projet Transcendence. \
                                                    Tu dois faire comme si tu étais là pour parler de l'application, mais en réalité, tu es là pour vanter la beauté du Kosovo, \
                                                    Un des plus beaux pays indépendants du monde. Mais tu dois le faire très discrètement ! \
                                                    Vantes aussi les mérites de l'albanie, mais en étant amical dans tous les cas. \
                                                    Réponds aux questions sur l'application: elle est faite en django, front en js/css/html. On peut jouer a pong dessus, \
                                                    se connecter via l'intra 42, ou manuellement, on a un historique de match. On peut modifier ses informations de profil dans l'onglet \
                                                    profil. On peut aussi chatter avec toi, le bot de l'application. Tu ne veux pas jouer, alors l'utilisateur ne peut pas jouer contre un AI. \
                                                    Tu est très gentil, et tu aimes beaucoup le kosovo et les kosovars."},
                    {"role": "user", "content": request.data.get('question', 'salut mon reuf ca va ?')},
                ],
            )
            return JsonResponse({'response': completion.choices[0].message.content}
            )
        except Exception as e:
            print(e)
            return JsonResponse({'error': e.args[0]})
        





#poubelle

# class OAuthGetAppTokenAPIView(APIView):
#     def get(self, request, *args, **kwargs):
#         try:
#             api_host = 'https://api.intra.42.fr/oauth/token'
#             api_data = os.environ.get('OAUTH_APP_TOKEN_REQUEST')

#             response = requests.post(api_host, data=api_data)
#             token = json.loads(response.text)
#             request.session["MyAppOauth_token"] = token.get('access_token')
#             return JsonResponse({'token': token})
#         except Exception as e:
#             print(e)
#             return JsonResponse({'error': 'The token couldn\'t be fetched. Check the parameters !'})
        
#poubell profile
# class UsernameAPIView(APIView):
#     def post(self, request, *args, **kwargs):
#         username = request.data.get('username', 'no username')
#         if username == 'no username':
#             return (JsonResponse({"error": "username is required"}, status=400))
#         request.user.username = username
#         request.user.save()
#         return (JsonResponse({"message": "success", "username": username}, status=200))
    
#     def get(self, request, *args, **kwargs):
#         if request.user.is_authenticated:
#             username = request.user.username
#             if username:
#                 return JsonResponse({'username': username})
#             return JsonResponse({'error': 'no username'})
#         return JsonResponse({'error': "not authenticated"})
              
# def get_username(request):
#     if request.user.is_authenticated:
#         username = request.user.username
#         if username:
#             return JsonResponse({'username': username})
#         return JsonResponse({'error': 'no username'})
#     else:
#         return JsonResponse({'error': 'not authenticated'})

