from django.shortcuts import render

# Create your views here.
from django.http import JsonResponse
from user import settings
import os

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from userManagement.models import Profile, Friendship
from django.http import JsonResponse

from .serializers import ProfileSerializer


from django.http import HttpResponse

def test(request):
    print ("succeed")
    return HttpResponse('Ceci est une réponse de test.')


class ProfileCreateAPIView(APIView):
    def post(self, request, *args, **kwargs):
        serializer = ProfileSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

#PROFILE.JS VIEWS GETINFO/CHANGEINFO/FRIENDLISTS

def getInfo(request):
    if request.user.is_authenticated:
        profile = request.user.profile
        return JsonResponse({'img': profile.profile_picture, \
                            'correction_points': profile.correction_points, \
                            'username': request.user.username, \
                            'nickname': profile.nickname, \
                            'email': profile.email,
                            })
    return JsonResponse({'error': 'You are not authenticated'})

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
                Friendship.objects.create(friend1=request.user.profile, friend2=new_friend)
                return JsonResponse({'message': 'success', 'friend': friend_name})
        except Exception as e:
            print(e)
            return Response({'error': e.args[0]}, status=status.HTTP_400_BAD_REQUEST)

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
            return Response({'error': e.args[0]}, status=status.HTTP_400_BAD_REQUEST)

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
                    return JsonResponse({'friend_requests': friend_requests})
                return JsonResponse({'error': 'There is no pending friend request'})
            return JsonResponse({'error': 'not authenticated'})
        except Exception as e:
            print(e)
            return Response({'error': e.args[0]}, status=status.HTTP_400_BAD_REQUEST)
        
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
        except Exception as e:
            print(e)
            return Response({'error': e.args[0]}, status=status.HTTP_400_BAD_REQUEST)


class RefuseFriendRequestAPIView(APIView):
    def post(self, request, *args, **kwargs):
        try:
            if request.user.is_authenticated:
                friend_name = request.data.get('friend', 'no friend')
                print("ALLOOOOO")
                if friend_name == 'no friend':
                    raise Exception("Friend is required")
                friendship = Friendship.objects.filter(friend2=request.user.profile, friend1__nickname=friend_name).first()
                print("JSUIS LAAAAA")
                if friendship:
                    friendship.delete()
                    print("tas suppr ?????????")
                    return JsonResponse({'success': True})
                else:
                    return JsonResponse({'error': 'Error: friend request not found'})
        except Exception as e:
            print(e)
            return Response({'error': e.args[0]}, status=status.HTTP_400_BAD_REQUEST)

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
        except Exception as e:
            print(e)
            return JsonResponse({'error': e.args[0]}, status=status.HTTP_400_BAD_REQUEST)

def update_profile_picture(request):
    if request.method == 'POST':
        profile_picture = request.FILES.get('profile_picture')
        name = "profile_picture_" + request.user.username + ".jpg"
        if profile_picture:
            with open(os.path.join(settings.MEDIA_ROOT, name), 'wb') as f:
                for chunk in profile_picture.chunks():
                    f.write(chunk)
            request.user.profile.profile_picture = name
            request.user.profile.save()
            request.user.save()
            return JsonResponse({'profile_picture': request.user.profile.profile_picture})
    return JsonResponse({'error': 'Méthode non autorisée'}, status=405)

class EmailAPIView(APIView):
    def post(self, request, *args, **kwargs):
        email = request.data.get('email', 'no email')
        if email == 'no email':
            return (JsonResponse({"error": "email is required"}, status=400))
        request.user.profile.email = email
        request.user.profile.save()
        request.user.save()
        return (JsonResponse({"message": "success", "email": email}, status=200))

class NicknameAPIView(APIView):
    def post(self, request, *args, **kwargs):
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

class PasswordAPIView(APIView): #FIXME: check les password, et les hash, faire plein de trucs liés aux password à demander aux copains du groupe
    def post(self, request, *args, **kwargs):
        password = request.data.get('password', 'no password')
        if password == 'no password':
            return (JsonResponse({"error": "password is required"}, status=400))
        request.user.set_password(password)
        request.user.save()
        return (JsonResponse({"message": "success", "password": password}, status=200))



