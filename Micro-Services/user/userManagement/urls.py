from django.urls import path
#profile
from userManagement.views import getInfo, addFriendAPIView, getMyFriendsAPIView, FriendRequestsAPIView, update_profile_picture, EmailAPIView, NicknameAPIView, PasswordAPIView, RefuseFriendRequestAPIView, DeleteFriendAPIView, ProfileCreateAPIView, test


from . import views

urlpatterns = [
    
    path('api/profile/', ProfileCreateAPIView.as_view(), name='create_profile'),
        
    path('test', test, name='test'),

    
    #profile
	path('getInfo/', getInfo, name='get42info'),
	path('addFriend/', addFriendAPIView.as_view(), name='addFriend'),
	path('getMyFriends/', getMyFriendsAPIView.as_view(), name='getmyFriends'),
	path('FriendRequests/', FriendRequestsAPIView.as_view(), name='FriendRequests'),
    path('RefuseFriendRequest/', RefuseFriendRequestAPIView.as_view(), name='RefuseFriendRequest'),
    path('DeleteFriend/', DeleteFriendAPIView.as_view(), name='DeleteFriend'),
    path('update_profile_picture/', update_profile_picture, name='update_profile_picture'),
    path("email/", EmailAPIView.as_view(), name="email_change"),
    path("nickname/", NicknameAPIView.as_view(), name="nickname_change"),
    path("password/", PasswordAPIView.as_view(), name="password"),

]
