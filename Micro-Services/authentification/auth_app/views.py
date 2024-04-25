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
from .models import Profile, Friendship, Notifications
from django.contrib.auth.models import User
from openai import OpenAI
from django.http import JsonResponse
from django.contrib.auth.password_validation import validate_password
from django.views.decorators.http import require_http_methods
from django.core.validators import validate_email
from django.core.exceptions import ValidationError

#views


#CONNECTION.JS LOGIN/LOGOUT/REGISTER VIEWS

class LoginAPIView(APIView):
    def post(self, request, *args, **kwargs):
        try:
            form = AuthenticationForm(data=request.data)
            if not form.is_valid():
                return JsonResponse({"error": "The username or the pasword are incorrect."}, status=status.HTTP_400_BAD_REQUEST)
            user = authenticate(username=form.cleaned_data['username'], password=form.cleaned_data['password'])
            if user:
                login(request, user)
                token = generate_jwt_token(user)
                if token is None:
                    return JsonResponse({"error: ": "Failed to generate token "}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
                user.profile.online = True
                user.profile.save()
                return JsonResponse({'token': token, 'username': user.username, 'message': 'Login successful'}, status=status.HTTP_200_OK)
        except Exception as e:
            print(e)
            return JsonResponse({'error': e.args[0]}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


class RegisterAPIView(APIView):
    def post(self, request, *args, **kwargs):
        try:
            form = UserCreationForm(data=request.data)
            if not form.is_valid(): #if username taken or password don't match
                return JsonResponse({'error': 'form incorrect'}, status=400)
            if (len(request.data.get('username')) > 14 or len(request.data.get('username')) < 3):
                return (JsonResponse({"error": "This username is too long or too short. Must be between 3 and 14 !"}, status=400))
            if request.data.get('username').endswith('@42'): #if username ends with @42
                return JsonResponse({'error':'username cannot end with @42. Its is reserved for 42 accounts'}, status=400)
            if (request.data.get('first_name') is None or request.data.get('first_name') == ''):
                return JsonResponse({'error': 'Nickname is required'}, status=400)
            if (len(request.data.get('first_name')) > 14 or len(request.data.get('first_name')) < 3):
                return (JsonResponse({"error": "This nickname is too long or too short. Must be between 3 and 14 !"}, status=400))
            if request.data.get('first_name').endswith('@42'): #if nickname ends with @42
                return JsonResponse({'error':'nickname cannot end with @42. Its is reserved for 42 accounts'}, status=400)
            if (Profile.objects.filter(nickname=request.data.get('first_name')).exists() == True): #if nickname already taken
                return JsonResponse({'error':'nickname already taken'}, status=400)
            if (len(request.data.get('first_name')) > 14):
                return (JsonResponse({"error": "This nickname is too long !"}, status=400))
            if (request.data.get('email') is None or request.data.get('email') == ''):
                return JsonResponse({'error': 'email is required'}, status=400)
            user = form.save() #creates the user
            user.profile.is42account = False
            user.profile.nickname = request.data.get('first_name')
            user.profile.correction_points = -1
            user.profile.profil_picture = "./avatar.jpg"
            user.profile.email = request.data.get('email')
            user.profile.save() #saves the profile
            user.save() #saves the user
            return JsonResponse({"message": "User registered successfully"}, status=status.HTTP_201_CREATED)
        except Exception as e:
            print(e)
            return JsonResponse({'error': e.args[0]}, status=500)
        
class LogoutAPIView(APIView):
    def get(self, request, *args, **kwargs):
        if request.user.is_authenticated:
            try:
                request.user.profile.online = False
                request.user.profile.save()
                logout(request)
            except Exception as e:
                print(e)
                return Response({'error': "Logout refused: " + e.args[0]})
            return Response({"message": "User logged out successfully"})
        return JsonResponse({'error': 'Not authenticated', 'isAuthenticated': False})

        

@require_http_methods(["GET"])
def check_authentication(request):
    if request.user.is_authenticated:
        try:
            request.user.profile.online = True
            request.user.profile.save()
            return JsonResponse({'isAuthenticated': True})
        except Exception as e:
            print(e)
            return JsonResponse({'error': 'Failed to save user status. User not shown as authenticated', 'isAuthenticated': False})
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
    try:
        token = jwt.encode({
            'user_id': user.id,
            'username': user.username,
            'nickname': user.profile.nickname,
            'secret': os.environ.get('JANKEN_SECRET'),
            'exp': int(dt.strftime('%s'))
        }, settings.SECRET_KEY, algorithm="HS256")
        return token.decode('utf-8') if isinstance(token, bytes) else token
    except Exception as e:
        print(e)
        return None























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











#PROFILE.JS VIEWS GETINFO/CHANGEINFO/FRIENDLISTS
@require_http_methods(["GET"])
def getInfo(request):
    if request.user.is_authenticated:
        try :
            profile = request.user.profile
            token = generate_jwt_token(request.user)
        except Exception as e:
            print(e)
            return JsonResponse({'error': 'No profile for this user'})
        return JsonResponse({'img': profile.profile_picture, \
                            'correction_points': profile.correction_points, \
                            'username': request.user.username, \
                            'nickname': profile.nickname, \
                            'email': profile.email, \
                            'default_language': profile.default_language,
                            'notifications': Notifications.countNotifications(profile),
                            'token': token,
                            })
    return JsonResponse({'error': 'You are not authenticated'})

class getFriendInfoAPIView(APIView):
    def post(self, request, *args, **kwargs):
        if request.user.is_authenticated:
            if not isinstance(request.data, dict):
                return JsonResponse({"error": "Invalid data"}, status=400)
            print(isinstance(request.data, dict))
            friend_name = request.data.get('friend', 'no friend')
            if friend_name == 'no friend':
                return JsonResponse({'error':"friend is required"}, status=404)
            exists = Profile.objects.filter(nickname=friend_name).exists()
            if not exists:
                return JsonResponse({"error": "No user has this nickname."}, status=404)
            friend = Profile.objects.get(nickname=friend_name)
            if (Friendship.friendshipExists(request.user.profile, friend) == True):
                if Friendship.getFriendship(request.user.profile, friend).accepted == False:
                    return JsonResponse({'error':"Not friends yet, friend request is pending"}, status=403)
                return JsonResponse({'img': friend.profile_picture, \
                                    'correction_points': friend.correction_points, \
                                    'nickname': friend.nickname, \
                                    'online_status': friend.online,
                                    })
            return JsonResponse({'error':"You are not friends with this user"}, status=403)
        return JsonResponse({'error':"You are not authenticated"}, status=403)

class addFriendAPIView(APIView):
    def post(self, request, *args, **kwargs):
        if request.user.is_authenticated:
            myself = request.user.profile
            friend_name = request.data.get('friend', 'no friend')
            if friend_name == 'no friend':
                return JsonResponse({"error": "friend is required"}, status=400)
            if (friend_name == myself.nickname):
                return JsonResponse({"error": "You can't add yourself as a friend"}, status=400)
            exists = Profile.objects.filter(nickname=friend_name).exists()
            if not exists:
                return JsonResponse({"error": "No user has this nickname."}, status=400)
            new_friend = Profile.objects.get(nickname=friend_name)
            if (Friendship.friendshipExists(request.user.profile, new_friend) == True):
                if Friendship.getFriendship(request.user.profile, new_friend).accepted == False:
                    return JsonResponse({"error": "Friend request already sent/pending"}, status=400)
                return JsonResponse({"error": "Friendship already exists"}, status=400)
            try:
                new_friendship = Friendship.objects.create(friend1=request.user.profile, friend2=new_friend)
                Notifications.objects.create(profile=new_friend, friendship=new_friendship, content=myself.nickname + " sent you a friend request")
            except Exception as e:
                print(e)
                return JsonResponse({'error': 'Failed to create friendship'}, status=500)
            return JsonResponse({'message': 'Friend request sent to ' + friend_name + " !"})
        return JsonResponse({"error": "You are not authenticated"}, status=400)

class getMyFriendsAPIView(APIView):
    def get(self, request, *args, **kwargs):
        if request.user.is_authenticated:
            try:
                friendships = Friendship.getFriends(request.user.profile) #returns only those with accepted == true
            except Exception as e:
                print(e)
                return Response({'error': e.args[0]}, status=500)
            if friendships:
                friends = []
                online_status = []
                for friendship in friendships:
                    if friendship.friend1 == request.user.profile:
                        friends.append(friendship.friend2.nickname)
                        online_status.append(friendship.friend2.online)
                    elif friendship.friend2 == request.user.profile:
                        friends.append(friendship.friend1.nickname)
                        online_status.append(friendship.friend1.online)
                return JsonResponse({'friends': friends, 'online_status': online_status})
            return JsonResponse({'error': 'no friends'})
        return JsonResponse({'error': 'not authenticated'}, status=403)

class FriendRequestsAPIView(APIView):
    def get(self, request, *args, **kwargs): #show all friend requests
        if request.user.is_authenticated:
            try:
                friendships = Friendship.getFriendRequests(request.user.profile) #returns only those with accepted == False
            except Exception as e:
                print(e)
                return Response({'error': e.args[0]}, status=500)
            if friendships:
                friend_requests = []
                for friendship in friendships:
                    if friendship.friend2 == request.user.profile:
                        friend_requests.append(friendship.friend1.nickname)
                if friend_requests == []:
                    return JsonResponse({'error': 'There is no pending friend request'})
                try:
                    Notifications.delMyNotifications(request.user.profile)
                except Exception as e:
                    print(e)
                    return JsonResponse({'error': 'Failed to delete the notifications'}, status=500)
                return JsonResponse({'friend_requests': friend_requests})
            return JsonResponse({'error': 'There is no pending friend request'})
        return JsonResponse({'error': 'not authenticated'}, status=403)
      
    def post(self, request, *args, **kwargs): #accept a friend request
        if request.user.is_authenticated:
            friend_name = request.data.get('friend', 'no friend')
            if friend_name == 'no friend' or friend_name is None:
                return JsonResponse({"error: ": "friend is required"}, status=400)
            exists = Profile.objects.filter(nickname=friend_name).exists()
            if not exists:
                return JsonResponse({"error": "No user has this nickname."}, status=400)
            new_friend = Profile.objects.get(nickname=friend_name)
            if (Friendship.friendshipExists(request.user.profile, new_friend) == True and Friendship.getFriendship(request.user.profile, new_friend).accepted == True):
                return JsonResponse({"error: ": "Friendship already exists"}, status=400)
            friendship = Friendship.getFriendship(request.user.profile, new_friend)
            friendship.accepted = True
            try:
                friendship.save()
            except Exception as e:
                print(e)
                return JsonResponse({'error': 'Failed to save the friendship'}, status=500)
            return JsonResponse({'message': 'success', 'friend': friend_name})
        return JsonResponse({"error: ": "You are not authenticated"})

class RefuseFriendRequestAPIView(APIView):
    def post(self, request, *args, **kwargs):
        if request.user.is_authenticated:
            friend_name = request.data.get('friend', 'no friend')
            if friend_name == 'no friend':
                return JsonResponse({"error:": "Friend is required"}, status=400)
            friendship = Friendship.objects.filter(friend2=request.user.profile, friend1__nickname=friend_name).first()
            if friendship:
                try:
                    friendship.delete()
                except Exception as e:
                    print(e)
                    return JsonResponse({'error': 'Failed to delete the friend request'}, status=500)
                return JsonResponse({'success': True})
            else:
                return JsonResponse({'error': 'Friend request not found'})
        return JsonResponse({"error:": "You are not authenticated"}, status=403)

class DeleteFriendAPIView(APIView):
    def post(self, request, *args, **kwargs):
        if request.user.is_authenticated:
            friend_name = request.data.get('friend', 'no friend')
            if friend_name == 'no friend':
                return JsonResponse({"error": "Friend is required"}, status=400)
            exists = Profile.objects.filter(nickname=friend_name).exists()
            if not exists:
                return JsonResponse({"error": "No user has this nickname."}, status=400)
            friend_profile = Profile.objects.get(nickname=friend_name)
            if Friendship.friendshipExists(request.user.profile, friend_profile):
                friendship = Friendship.getFriendship(request.user.profile, friend_profile)
                try:
                    friendship.delete()
                except Exception as e:
                    print(e)
                    return JsonResponse({'error': 'Failed to delete the friendship'}, status=500)
                return JsonResponse({'success': True})
            else:
                return JsonResponse({'error': 'Friendship already ended'})
        return JsonResponse({"error": "You are not authenticated"}, status=403)
        

import magic
@require_http_methods(["POST"])
def update_profile_picture(request):
    if request.method == 'POST':
        profile_picture = request.FILES.get('profile_picture')
        if profile_picture is None:
            return JsonResponse({"error: ": "No file was sent."}, status=400)
        if profile_picture.content_type.startswith('image') == False:
            return JsonResponse({"error: ": "The file is not an image."}, status=400)
        try:
            data = magic.Magic(mime=True)
            mime_type = data.from_buffer(profile_picture.read(1024))
            if not mime_type.startswith('image'):
                return JsonResponse({"error: ": "The file is not an image."}, status=400)
        except Exception as e:
            return JsonResponse({'error': 'Failed to get the mime type of the file'},status=500)
        profile_picture.seek(0)
        name = "profile_picture_" + request.user.username + ".jpg"
        if profile_picture:
            try:
                with open(os.path.join(settings.MEDIA_ROOT, name), 'wb') as f:
                    for chunk in profile_picture.chunks():
                        f.write(chunk)
            except Exception as e:
                return JsonResponse({'error': 'Failed to save the file'},status=500)
            try:
                request.user.profile.profile_picture = name
                request.user.profile.save()
                request.user.save()
            except Exception as e:
                return JsonResponse({'error': 'Failed to save the profile picture' + e.args[0]})
            return JsonResponse({'profile_picture': request.user.profile.profile_picture})
    return JsonResponse({'error': 'Méthode non autorisée'}, status=405)

class EmailAPIView(APIView):
    def post(self, request, *args, **kwargs):
        if request.user.is_authenticated:
            email = request.data.get('email', 'no email')
            if email == 'no email' or email is None:
                return (JsonResponse({"error": "email is required"}, status=400))
            if request.user.profile.is42account == True:
                return (JsonResponse({"error": "You can't change your email if you are a 42 account"}, status=400))
            if (len(email) > 50):
                return (JsonResponse({"error": "This email is too long !"}, status=400))
            try:
                request.user.profile.email = email
                request.user.profile.save()
                request.user.save()
            except Exception as e:
                return JsonResponse({'error': 'Failed to save the email'})
            return (JsonResponse({"message": "success", "email": email}, status=200))
        return JsonResponse({'error': "not authenticated"}, status=403)
        

class NicknameAPIView(APIView):
    def post(self, request, *args, **kwargs):
        if request.user.is_authenticated:
            first_name = request.data.get('first_name', 'no first_name')
            if first_name == 'no first_name':
                return (JsonResponse({"error": "nickname is required"}, status=400))
            if (request.data.get('first_name') is None or request.data.get('first_name') == ''):
                return JsonResponse({'error': 'Nickname is required'}, status=400)
            if (isNicknameUnique(first_name) == False):
                return (JsonResponse({"error": "This nickname is already taken !"}, status=400))
            if (len(first_name) > 14):
                return (JsonResponse({"error": "This nickname is too long !"}, status=400))
            if first_name.endswith('@42'): #if nickname ends with @42
                if (first_name != request.user.username):
                    return JsonResponse({"error:":'nickname cannot end with @42'}, status=400)
            try:
                request.user.profile.nickname = first_name
                request.user.profile.save()
                request.user.save()
            except Exception as e:
                return JsonResponse({'error': 'Failed to save the nickname'})
            return (JsonResponse({"message": "success", "first_name": first_name}, status=200))
        return JsonResponse({'error': "not authenticated"}, status=403)

class PasswordAPIView(APIView):
    def post(self, request, *args, **kwargs):
        password = request.data.get('password', 'no password')
        if password == 'no password':
            return (JsonResponse({"error": "password is required"}, status=400))
        if (len(password) > 14 or len(password) < 3 or password is None):
            return (JsonResponse({"error": "This password is too long or too short."}, status=400))
        if request.user.profile.is42account == True:
            return (JsonResponse({"error": "You can't change your password if you are a 42 account"}, status=400))
        try:
            validate_password(password, request.user)
        except Exception as e:
            errors = list(e.messages)
            return Response({"error": errors}, status=400)
        try:
            request.user.set_password(password)
            request.user.save()
        except Exception as e:
            print(e)
            return JsonResponse({'error': 'Failed to save the password'}, status=500)
        return (JsonResponse({"message": "success", "password": password}, status=200))

class getNicknameWithUserIdAPIView(APIView):
    def post(self, request, *args, **kwargs):
            user_id = request.data.get('user_id', 'no user_id')
            if user_id == 'no user_id' or user_id is None:
                return JsonResponse({'error': "user_id is required"}, status=400)
            exist = User.objects.filter(id=user_id).exists()
            if not exist:
                return JsonResponse({'error': 'No user with this id'}, status=400)
            try:
                user = User.objects.get(id=user_id)
            except Exception as e:
                print(e)
                return JsonResponse({'error': 'Failed to get the user with this id'}, status=500)
            return (JsonResponse({"nickname": user.profile.nickname}, status=200))
        
class getUserIdWithNicknameAPIView(APIView):
    def post(self, request, *args, **kwargs):
            nickname = request.data.get('nickname', 'no nickname')
            if nickname == 'no nickname':
                raise Exception("nickname is required")
            exist = User.objects.filter(profile__nickname=nickname).exists()
            if not exist:
                return JsonResponse({'error': 'No user with this nickname'}, status=400)
            try:
                user = User.objects.get(profile__nickname=nickname)
            except Exception as e:
                print(e)
                return JsonResponse({'error': 'Failed to get the user with this nickname'}, status=500)
            return (JsonResponse({"user_id": user.id}, status=200))

class SaveLanguageAPIView(APIView):
    def post(self, request, *args, **kwargs):
        if request.user.is_authenticated:
            language = request.data.get('language', 'no language')
            if language not in ["fr", "en", "es"]: 
                return (JsonResponse({"error": "language is not valid"}, status=400))
            request.user.profile.default_language = language
            try:
                request.user.profile.save()
                request.user.save()
            except Exception as e:
                return JsonResponse({'error': 'Failed to save the language'})
            return (JsonResponse({"message": "success", "language": language}, status=200))
        return JsonResponse({'error': "not authenticated"}, status=403)

















#OAUTH.JS VIEWS
class Login42APIView(APIView): #gets the access token from 42 for the user loggin with 42
    def post(self, request, *args, **kwargs):
        api_host = 'https://api.intra.42.fr/oauth/token'
        api_data = {
            'grant_type': 'authorization_code',
            'client_id': os.environ.get('OAUTH_CLIENT_ID'),
            'client_secret': os.environ.get('OAUTH_SECRET'),
            'code': request.data.get('code', 'no code'),
            'redirect_uri': os.environ.get("OAUTH_REDIRECT_URI"),
            'state': os.environ.get('OAUTH_STATE')
        }
        try:
            response = requests.post(api_host, data=api_data, headers={'Content-Type': 'application/x-www-form-urlencoded'})
            token = json.loads(response.text)
            request.session["Oauth_token"] = token.get('access_token')
            return JsonResponse({})
        except Exception as e:
            print(e)
            return Response({'error': e.args[0]})
        
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
            return Response({"message": "User registered successfully", 'username':userData['username'], 'password':password,}, status=status.HTTP_201_CREATED)
        except Exception as e:
            print(e)
            return Response({'error': e.args[0]})

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
class chatbotAPIView(APIView):
    client = None
    def post(self, request, *args, **kwargs):
        if (request.data.get('question') is None or request.data.get('question') == ''):
            return JsonResponse({'error': 'question is required'}, status=400)
        client = OpenAI()
        self.client = client
        try:
            completion = self.client.chat.completions.create(
                model="gpt-3.5-turbo",
                messages=[
                    {"role": "system", "content": "Tu parles anglais. Tu es le bot de notre app web pong, effectuée pour 42 dans le cadre du projet Transcendence."},
                    {"role": "user", "content": request.data.get('question', 'salut mon reuf ca va ?')},
                ],
            )
            return JsonResponse({'response': completion.choices[0].message.content}
            )
        except Exception as e:
            print(e)
            return JsonResponse({'error': e.args[0]})

