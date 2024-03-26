from django.http import JsonResponse
from authentification import settings
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import Profile, Friendship, Notifications
from .models import JankenGameCreation, JankenGameInProgress
from django.http import JsonResponse




#JANKEN GAME

class createJankenGameAPIView(APIView):
    def get(self, request, *args, **kwargs):
        try:
            if request.username == "none":
                if (JankenGameCreation.objects.filter(creator=request.username).exists() == True):
                    raise Exception("You are already waiting for an opponent")
                if (JankenGameInProgress.myGame(request.username).exists() == True):
                    raise Exception("You are already playing a game")
                game = JankenGameCreation.objects.create(creator=request.username)
                game.save()
                return JsonResponse({'game_id': game.id})
            raise Exception("You are not authenticated")
        except Exception as e:
            print(e)
            return JsonResponse({'error': e.args[0]})

class jankenGameAPIView(APIView):
    def get(self, request, *args, **kwargs):
        try:
            if request.username != "none":
                if (JankenGameCreation.objects.filter(creator=request.username).exists() == True):
                    raise Exception("You already have a game creation waiting for an opponent")
                if (JankenGameInProgress.getMyGame(request.username) != None):
                    raise Exception("You already have a game in progress")
                if (JankenGameCreation.objects.all().exists() == False):
                    raise Exception("No game available")
                game = JankenGameCreation.matchMaking(request.username)
                JankenGameInProgress.objects.create(creator=game.creator, opponent=request.username)
                game.delete()
                return JsonResponse({'game_id': game.id})
            raise Exception("You are not authenticated")
        except Exception as e:
            print(e)
            return JsonResponse({'error': e.args[0]})
        
    def post(self, request, *args, **kwargs):
        try:
            if request.username != "none":
                game = JankenGameInProgress.getMyGame(request.username)
                if game is None:
                    raise Exception("You are not part of a game")
                if game.creator == request.username and game.creator_choice != "None":
                    raise Exception("You already gave your input")
                if game.opponent == request.username and game.opponent_choice != "None":
                    raise Exception("You already gave your input")
                JankenGameInProgress.giveInput(request.data.get('input', 'rock'), request.username)
                return JsonResponse({'message': 'success'})
            raise Exception("You are not authenticated")
        except Exception as e:
            print(e)
            return JsonResponse({'error': e.args[0]})

class waitForResultsAPIView(APIView):
    def get(self, request, *args, **kwargs):
        try:
            if request.username != "none":
                game = JankenGameInProgress.getMyGame(request.username)
                if game is None:
                    raise Exception("You are not part of a game")
                if (JankenGameInProgress.getMyGame(request.username).game_finished == False):
                    raise Exception("The game is not finished yet")
                return JsonResponse({'message': 'still waiting'})
            raise Exception("You are not authenticated")
        except Exception as e:
            print(e)
            return JsonResponse({'error': e.args[0]})

import time

class waitForOpponentAPIView(APIView):
    def get(self, request, *args, **kwargs):
        try:
            if request.username != "none":
                if (JankenGameCreation.objects.filter(creator=request.username).exists() == True):
                    if (JankenGameCreation.objects.get(creator=request.username).isWaiting == True):
                        raise Exception("You already have a game creation waiting for an opponent")
                    JankenGameCreation.objects.get(creator=request.username).isWaiting = True
                    JankenGameCreation.objects.get(creator=request.username).save()
                if (JankenGameInProgress.myGame(request.username).exists() == False):
                    raise Exception("No opponent found")
                game = JankenGameInProgress.objects.get(creator=request.username)
                return JsonResponse({'opponent': game.opponent.nickname})
            raise Exception("You are not authenticated")
        except Exception as e:
            print(e)
            return JsonResponse({'error': e.args[0]})

class gameInProgressAPIView(APIView):
    def get(self, request, *args, **kwargs):
        try:
            if request.username != "none":
                game = JankenGameInProgress.getMyGame(request.username)
                if game is None:
                    if JankenGameCreation.objects.filter(creator=request.username).exists() == False:
                        raise Exception('You are not part of a game, please create one or join one')
                    return JsonResponse({'message': 'waiting for opponent'})
                if game.game_finished == True:
                    return JsonResponse({'message': 'game finished'})
                if game.creator == request.username:
                    if game.creator_choice != "None":
                        return JsonResponse({'message': 'already played', 'opponent': game.opponent.nickname})
                    return JsonResponse({'message': 'game in progress', 'opponent': game.opponent.nickname})
                if game.opponent == request.username:
                    if game.opponent_choice != "None":
                        return JsonResponse({'message': 'already played', 'opponent': game.creator.nickname}) 
                    return JsonResponse({'message': 'game in progress', 'opponent': game.creator.nickname})
                raise Exception('You are not part of a game')
            raise Exception('You are not authenticated')
        except Exception as e:
            print(e)
            return JsonResponse({'error': e.args[0]})


class getResultsAPIView(APIView):
    def get(self, request, *args, **kwargs):
        try:
            if not request.user.is_authenticated:
                raise Exception('You are not authenticated')
            game = JankenGameInProgress.getMyGame(request.username)
            if game is None:
                raise Exception('You are not part of a game')
            #get winner
            if game.creator_choice == game.opponent_choice:
                game.result = "draw"
            elif game.creator_choice == "rock":
                if game.opponent_choice == "scissors":
                    game.result = game.creator.nickname
                elif game.opponent_choice == "paper":
                    game.result = game.opponent.nickname
            elif game.creator_choice == "paper":
                if game.opponent_choice == "rock":
                    game.result = game.creator.nickname
                elif game.opponent_choice == "scissors":
                    game.result = game.opponent.nickname
            elif game.creator_choice == "scissors":
                if game.opponent_choice == "paper":
                    game.result = game.creator.nickname
                elif game.opponent_choice == "rock":
                    game.result = game.opponent.nickname
            if game.result == game.creator.nickname:
                game.winner = game.creator.nickname
                game.loser = game.opponent.nickname
            if game.result == game.opponent.nickname:
                game.winner = game.opponent.nickname
                game.loser = game.creator.nickname
            if game.result != "draw" and game.result != "won by forfeit":
                game.result = "won"
            print(game.result + " and " + game.winner)
            game.save()
            results = {'message': 'success', 'creator': game.creator.nickname, 'opponent': game.opponent.nickname, 'creator_choice': game.creator_choice, \
                    'opponent_choice': game.opponent_choice, 'result': game.result, 'loser': game.loser, 'winner': game.winner, 'myself':request.username.nickname}
            if request.username.nickname == game.creator.nickname:
                game.to_delete_creator = True
                game.save()
            if request.username.nickname == game.opponent.nickname:
                game.to_delete_opponent = True
                game.save()
            if game.to_delete_creator == True and game.to_delete_opponent == True:
                game.addToHistory()
            return JsonResponse(results)
        except Exception as e:
            print(e)
            return JsonResponse({'error': e.args[0]})

class deleteMyJankenGameCreationAPIView(APIView):
    def get(self, request, *args, **kwargs):
        try:
            game = JankenGameCreation.getMyGameCreation(request.username)
            if game:
                game.delete()
            return JsonResponse({'message': 'success'})
        except Exception as e:
            print(e)
            return JsonResponse({'error': e.args[0]})

from django.utils import timezone

class amIPlayingAPIView(APIView):
    def get(self, request, *args, **kwargs):
        try:
            if request.username != "none":
                game = JankenGameInProgress.getMyGame(request.username)
                if game is not None:
                    if game.game_finished == True:
                        if (timezone.now() - game.completion_time).total_seconds() > 20:
                            game.addToHistory()
                            raise Exception('You are not playing a game')
                        return JsonResponse({'message': 'The game is finished'})
                    if game.first_input_time != None:
                        if (timezone.now() - game.first_input_time).total_seconds() > 300:
                            game.completion_time = timezone.now()
                            game.game_finished = True
                            game.result = "won by forfeit"
                            game.winner = game.first_input_nickname
                            game.loser = game.creator.nickname
                            if game.winner == game.creator.nickname:
                                game.loser = game.opponent.nickname
                            game.save()
                            raise Exception('You are not playing a game')
                    if game.creator == request.username:
                        if game.creator_choice == "None":
                            return JsonResponse({'message': 'Waiting for your input'})
                        return JsonResponse({'message': 'Waiting for your opponent to play'})
                    if game.opponent == request.username:
                        if game.opponent_choice == "None":
                            return JsonResponse({'message': 'Waiting for your input'})
                        return JsonResponse({'message': 'Waiting for your opponent to play'})
                if JankenGameCreation.getMyGameCreation(request.username) is not None:
                    return JsonResponse({'message': 'You are waiting for an opponent'})
                raise Exception('You are not playing a game')
            raise Exception('You are not authenticated')
        except Exception as e:
            print(e)
            return JsonResponse({'error': e.args[0]})










from .models import FinishedJankenGames

class jankenHistoryAPIView(APIView):
    def get(self, request, *args, **kwargs):
        try:
            if request.username != "none":
                games = FinishedJankenGames.objects.filter(owner=request.username)
                if games.exists() == False:
                    raise Exception('You never played a game !')
                history = []
                for game in games:
                    history.append({'opponent': game.opponent.nickname,\
                                    'opponent_choice': game.opponent_choice, \
                                    'owner': game.owner.nickname, \
                                    'owner_choice': game.owner_choice, \
                                    'result': game.result, \
                                    'end_day': game.completion_time.astimezone(timezone.get_current_timezone()).strftime("%d/%m"), \
                                    'end_time': game.completion_time.astimezone(timezone.get_current_timezone()).strftime("%H:%M:%S"), \
                                    'winner': game.winner, \
                                          })
                return JsonResponse({'history': history, \
                                     'wins': FinishedJankenGames.countWins(request.username), \
                                     'draws': FinishedJankenGames.countDraws(request.username), \
                                     'losses': FinishedJankenGames.countLosses(request.username)})
            raise Exception('You are not authenticated')
        except Exception as e:
            print(e)
            return JsonResponse({'error': e.args[0]})

from .models import FinishedPongGames

class pongHistoryAPIView(APIView):
    def post(self, request, *args, **kwargs):
        try:
            if request.username != "none":
                FinishedPongGames.objects.create(
                    owner=request.username, \
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
            if request.username != "none":
                games = FinishedPongGames.objects.filter(owner=request.username)
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
                                     'wins': FinishedPongGames.countWins(request.username), \
                                     'draws': FinishedPongGames.countDraws(request.username), \
                                     'losses': FinishedPongGames.countLosses(request.username)})
            raise Exception('You are not authenticated')
        except Exception as e:
            print(e)
            return JsonResponse({'error': e.args[0]})



