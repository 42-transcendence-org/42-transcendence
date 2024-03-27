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


#views






#CONNECTION.JS LOGIN/LOGOUT/REGISTER VIEWS

class LoginAPIView(APIView):
    def post(self, request, *args, **kwargs):
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
            print(e)
            return Response({'error': "Connection refused: " + e.args[0]})

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
            return Response({"message": "User registered successfully"}, status=status.HTTP_201_CREATED)
        except Exception as e:
            print(e)
            return Response({'error': "Registration refused: " + e.args[0]})

class LogoutAPIView(APIView):
    def get(self, request, *args, **kwargs):
        try:
            try:
                request.user.profile.online = False
                request.user.profile.save()
            except Exception as e:
                print(e)
                pass
            logout(request)
            return Response({"message": "User logged out successfully"})
        except Exception as e:
            print(e)
            return Response({'error': "Logout refused: " + e.args[0]})


def check_authentication(request):
    try:
        if request.user.is_authenticated:
            try:
                request.user.profile.online = True
                request.user.profile.save()
            except Exception as e:
                print(e)
                pass
            return JsonResponse({'isAuthenticated': True})
        else:
            return JsonResponse({'error': 'Not authenticated', 'isAuthenticated': False})
    except Exception as e:
        print(e)
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
        'nickname': user.profile.nickname,
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











#PROFILE.JS VIEWS GETINFO/CHANGEINFO/FRIENDLISTS

def getInfo(request):
    if request.user.is_authenticated:
        try :
            profile = request.user.profile
            token = generate_jwt_token(request.user)
            return JsonResponse({'img': profile.profile_picture, \
                                'correction_points': profile.correction_points, \
                                'username': request.user.username, \
                                'nickname': profile.nickname, \
                                'email': profile.email,
                                'notifications': Notifications.countNotifications(profile),
                                'token': token,
                                })
        except Exception as e:
            print(e)
            return JsonResponse({'error': 'No profile for this user'})
    return JsonResponse({'error': 'You are not authenticated'})

class getFriendInfoAPIView(APIView):
    def post(self, request, *args, **kwargs):
        try:
            if request.user.is_authenticated:
                friend_name = request.data.get('friend', 'no friend')
                if friend_name == 'no friend':
                    raise Exception("friend is required")
                try:
                    friend = Profile.objects.get(nickname=friend_name)
                except Profile.DoesNotExist:
                    raise Exception("No user has this nickname.")
                if (Friendship.friendshipExists(request.user.profile, friend) == True):
                    if Friendship.getFriendship(request.user.profile, friend).accepted == False:
                        raise Exception("Not friends yet, friend request is pending")
                    return JsonResponse({'img': friend.profile_picture, \
                                        'correction_points': friend.correction_points, \
                                        'nickname': friend.nickname, \
                                        'online_status': friend.online,
                                        })
                raise Exception("You are not friends with this user")
            raise Exception("You are not authenticated")
        except Exception as e:
            print(e)
            return Response({'error': e.args[0]})

class addFriendAPIView(APIView):
    def post(self, request, *args, **kwargs):
        try:
            if request.user.is_authenticated:
                myself = request.user.profile
                friend_name = request.data.get('friend', 'no friend')
                if friend_name == 'no friend':
                    raise Exception("friend is required")
                if (friend_name == myself.nickname):
                    raise Exception("You can't add yourself as a friend")
                try:
                    new_friend = Profile.objects.get(nickname=friend_name)
                except Profile.DoesNotExist:
                    raise Exception("No user has this nickname.")
                if (Friendship.friendshipExists(request.user.profile, new_friend) == True):
                    if Friendship.getFriendship(request.user.profile, new_friend).accepted == False:
                        raise Exception("Friend request already sent/pending")
                    raise Exception("Friendship already exists")
                new_friendship = Friendship.objects.create(friend1=request.user.profile, friend2=new_friend)
                Notifications.objects.create(profile=new_friend, friendship=new_friendship, content=myself.nickname + " sent you a friend request")
                return JsonResponse({'message': 'Friend request sent to ' + friend_name + " !"})
            raise Exception("You are not authenticated")
        except Exception as e:
            print(e)
            return Response({'error': e.args[0]})

class getMyFriendsAPIView(APIView):
    def get(self, request, *args, **kwargs):
        try:
            if request.user.is_authenticated:
                friendships = Friendship.getFriends(request.user.profile) #returns only those with accepted == true
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
                    print(friends)
                    return JsonResponse({'friends': friends, 'online_status': online_status})
                return JsonResponse({'error': 'no friends'})
            return JsonResponse({'error': 'not authenticated'})
        except Exception as e:
            print(e)
            return Response({'error': e.args[0]})

class FriendRequestsAPIView(APIView):
    def get(self, request, *args, **kwargs): #show all friend requests
        try:
            if request.user.is_authenticated:
                friendships = Friendship.getFriendRequests(request.user.profile) #returns only those with accepted == False
                if friendships:
                    friend_requests = []
                    for friendship in friendships:
                        if friendship.friend2 == request.user.profile:
                            friend_requests.append(friendship.friend1.nickname)
                    if friend_requests == []:
                        return JsonResponse({'error': 'There is no pending friend request'})
                    Notifications.delMyNotifications(request.user.profile)
                    return JsonResponse({'friend_requests': friend_requests})
                return JsonResponse({'error': 'There is no pending friend request'})
            return JsonResponse({'error': 'not authenticated'})
        except Exception as e:
            print(e)
            return Response({'error': e.args[0]})
        
    def post(self, request, *args, **kwargs): #accept a friend request
        try:
            if request.user.is_authenticated:
                friend_name = request.data.get('friend', 'no friend')
                if friend_name == 'no friend':
                    raise Exception("friend is required")
                try:
                    new_friend = Profile.objects.get(nickname=friend_name)
                except Profile.DoesNotExist:
                    raise Exception("No user has this nickname.")
                if (Friendship.friendshipExists(request.user.profile, new_friend) == True and Friendship.getFriendship(request.user.profile, new_friend).accepted == True):
                    raise Exception("Friendship already exists")
                friendship = Friendship.getFriendship(request.user.profile, new_friend)
                friendship.accepted = True
                friendship.save()
                return JsonResponse({'message': 'success', 'friend': friend_name})
            raise Exception("You are not authenticated")
        except Exception as e:
            print(e)
            return Response({'error': e.args[0]})

class RefuseFriendRequestAPIView(APIView):
    def post(self, request, *args, **kwargs):
        try:
            if request.user.is_authenticated:
                friend_name = request.data.get('friend', 'no friend')
                if friend_name == 'no friend':
                    raise Exception("Friend is required")
                friendship = Friendship.objects.filter(friend2=request.user.profile, friend1__nickname=friend_name).first()
                if friendship:
                    friendship.delete()
                    return JsonResponse({'success': True})
                else:
                    return JsonResponse({'error': 'Error: friend request not found'})
            raise Exception("You are not authenticated")
        except Exception as e:
            print(e)
            return Response({'error': e.args[0]})

class DeleteFriendAPIView(APIView):
    def post(self, request, *args, **kwargs):
        try:
            if request.user.is_authenticated:
                friend_name = request.data.get('friend', 'no friend')
                if friend_name == 'no friend':
                    raise Exception("Friend is required")
                friend_profile = Profile.objects.get(nickname=friend_name)
                if Friendship.friendshipExists(request.user.profile, friend_profile):
                    friendship = Friendship.getFriendship(request.user.profile, friend_profile)
                    friendship.delete()
                    return JsonResponse({'success': True})
                else:
                    return JsonResponse({'error': 'Friendship already ended'})
            raise Exception("You are not authenticated")
        except Exception as e:
            print(e)
            return JsonResponse({'error': e.args[0]})

def update_profile_picture(request):
    if request.method == 'POST':
        try:
            profile_picture = request.FILES.get('profile_picture')
            if profile_picture.content_type.startswith('image') == False:
                raise Exception("The file is not an image.")
            name = "profile_picture_" + request.user.username + ".jpg"
            if profile_picture:
                with open(os.path.join(settings.MEDIA_ROOT, name), 'wb') as f:
                    for chunk in profile_picture.chunks():
                        f.write(chunk)
                request.user.profile.profile_picture = name
                request.user.profile.save()
                request.user.save()
                return JsonResponse({'profile_picture': request.user.profile.profile_picture})
        except Exception as e:
            print(e)
            return JsonResponse({'error': e.args[0]})
    return JsonResponse({'error': 'Méthode non autorisée'}, status=405)

class EmailAPIView(APIView):
    def post(self, request, *args, **kwargs):
        try:
            email = request.data.get('email', 'no email')
            if email == 'no email':
                return (JsonResponse({"error": "email is required"}, status=400))
            if request.user.profile.is42account == True:
                return (JsonResponse({"error": "You can't change your email if you are a 42 account"}, status=400))
            request.user.profile.email = email
            request.user.profile.save()
            request.user.save()
            return (JsonResponse({"message": "success", "email": email}, status=200))
        except Exception as e:
            print(e)
            return JsonResponse({'error': e.args[0]})

class NicknameAPIView(APIView):
    def post(self, request, *args, **kwargs):
        try:
            if request.user.is_authenticated:
                first_name = request.data.get('first_name', 'no first_name')
                if first_name == 'no first_name':
                    return (JsonResponse({"error": "nickname is required"}, status=400))
                if (isNicknameUnique(first_name) == False):
                    return (JsonResponse({"error": "This nickname is already taken !"}, status=400))
                request.user.profile.nickname = first_name
                request.user.profile.save()
                request.user.save()
                return (JsonResponse({"message": "success", "first_name": first_name}, status=200))
            return JsonResponse({'error': "not authenticated"})
        except Exception as e:
            print(e)
            return JsonResponse({'error': e.args[0]})

class PasswordAPIView(APIView): #FIXME: check les password, et les hash, faire plein de trucs liés aux password à demander aux copains du groupe
    def post(self, request, *args, **kwargs):
        try:
            password = request.data.get('password', 'no password')
            if password == 'no password':
                return (JsonResponse({"error": "password is required"}, status=400))
            if request.user.profile.is42account == True:
                return (JsonResponse({"error": "You can't change your password if you are a 42 account"}, status=400))
            request.user.set_password(password)
            request.user.save()
            return (JsonResponse({"message": "success", "password": password}, status=200))
        except Exception as e:
            print(e)
            return JsonResponse({'error': e.args[0]})

class getNicknameWithUserIdAPIView(APIView):
    def post(self, request, *args, **kwargs):
        try:
            user_id = request.data.get('user_id', 'no user_id')
            if user_id == 'no user_id':
                raise Exception("user_id is required")
            user = User.objects.get(id=user_id)
            return (JsonResponse({"nickname": user.profile.nickname}, status=200))
        except Exception as e:
            print(e)
            return JsonResponse({'error': e.args[0]})
















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
                'redirect_uri': os.environ.get("OAUTH_REDIRECT_URI"),
                'state': os.environ.get('OAUTH_STATE')
            }
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
        


























#PONG HISTORY

from .models import FinishedPongGames

class pongHistoryAPIView(APIView):
    def post(self, request, *args, **kwargs):
        try:
            if request.user.is_authenticated:
                FinishedPongGames.objects.create(
                    owner=request.user.profile, \
                    game_type=request.data.get('game_type', 'undefined'), \
                    opponent=request.data.get('opponent', 'undefined'), \
                    player_score=request.data.get('player_score', 'undefined'), \
                    opponent_score=request.data.get('opponent_score', 'undefined'), \
                    winner=request.data.get('winner', 'undefined'), \
                    result=request.data.get('result', 'undefined'), \
                    completion_day=timezone.now().astimezone(timezone.get_current_timezone()).strftime("%d/%m"), \
                    completion_time= timezone.now().astimezone(timezone.get_current_timezone()).strftime("%H:%M:%S"), \
                )
                return JsonResponse({'message': 'success'})
            raise Exception('You are not authenticated')
        except Exception as e:
            print(e)
            return JsonResponse({'error': e.args[0]})
        
    def get(self, request, *args, **kwargs):
        try:
            if request.user.is_authenticated:
                games = FinishedPongGames.objects.filter(owner=request.user.profile)
                if games.exists() == False:
                    raise Exception('You never played a game !')
                history = []
                for game in games:
                    history.append({'owner': game.owner.nickname, \
                                    'game_type': game.game_type, \
                                    'opponent': game.opponent, \
                                    'player_score': game.player_score, \
                                    'opponent_score': game.opponent_score, \
                                    'winner': game.winner, \
                                    'result': game.result, \
                                    'end_day': game.completion_day, \
                                    'end_time': game.completion_time, \
                                          })
                return JsonResponse({'history': history, \
                                     'wins': FinishedPongGames.countWins(request.user.profile), \
                                     'draws': FinishedPongGames.countDraws(request.user.profile), \
                                     'losses': FinishedPongGames.countLosses(request.user.profile)})
            raise Exception('You are not authenticated')
        except Exception as e:
            print(e)
            return JsonResponse({'error': e.args[0]})






























































#TOURNAMENT
class tournamentAPIView(APIView):
    def get(self, request, *args, **kwargs):
        try:
            if request.user.is_authenticated:
                # if (Tournament.objects.filter(creator=request.user.profile).exists() == True):
                #     raise Exception("You are already hosting a tournament")
                                
                # return JsonResponse({'tournament_id': tournament.id})
                return JsonResponse({'message': 'success'})
            raise Exception('You are not authenticated')
        except Exception as e:
            print(e)
            return JsonResponse({'error': e.args[0]})









































class createTournamentAPIView(APIView):
    def post(self, request, *args, **kwargs):
        try:
            if request.user.is_authenticated:
                print(request.data)
                return JsonResponse({'tournament_id': 'coucou'})
            raise Exception('You are not authenticated')
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

