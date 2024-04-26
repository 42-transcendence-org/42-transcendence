from django.utils import timezone
from django.http import JsonResponse

from rest_framework.views import APIView

from .models import JankenGameCreation, JankenGameInProgress, FinishedJankenGames


class createJankenGameAPIView(APIView):
    def get(self, request):
        if JankenGameCreation.objects.filter(creator=request.user_id).exists() == True:
            return JsonResponse({"error": "You are already waiting for an opponent"}, status=403)
        if JankenGameInProgress.myGame(request.user_id).exists() == True:
            return JsonResponse({"error": "You are already playing a game"}, status=403)
        game = JankenGameCreation.objects.create(creator=request.user_id)
        game.save()
        return JsonResponse({"game_id": game.id}, status=201)


class gameInProgressAPIView(APIView):
    def get(self, request):
        game = JankenGameInProgress.getMyGame(request.user_id)
        if game is None:
            if JankenGameCreation.objects.filter(creator=request.user_id).exists() == False:
                return JsonResponse({"error": "You are not part of a game, please create one or join one"}, status=403)
            return JsonResponse({"message": "waiting for opponent"}, status=200)
        if game.game_finished == True:
            return JsonResponse({"message": "game finished"}, status=200)
        if game.creator == request.user_id:
            if game.creator_choice != "None":
                return JsonResponse({"message": "already played", "opponent": game.opponent}, status=200)
            return JsonResponse({"message": "game in progress", "opponent": game.opponent}, status=200)
        if game.opponent == request.user_id:
            if game.opponent_choice != "None":
                return JsonResponse({"message": "already played", "opponent": game.creator}, status=200)
            return JsonResponse({"message": "game in progress", "opponent": game.creator}, status=200)


class jankenGameAPIView(APIView):
    def get(self, request):
        if JankenGameCreation.objects.filter(creator=request.user_id).exists() == True:
            return JsonResponse({"error": "You already have a game creation waiting for an opponent"}, status=403)
        if JankenGameInProgress.getMyGame(request.user_id) != None:
            return JsonResponse({"error": "You already have a game in progress"}, status=403)
        if JankenGameCreation.objects.all().exists() == False:
            return JsonResponse({"error": "No game available"}, status=404)
        game = JankenGameCreation.matchMaking(request.user_id)
        JankenGameInProgress.objects.create(creator=game.creator, opponent=request.user_id)
        game.delete()
        return JsonResponse({"game_id": game.id}, status=201)

    # TODO Test this
    def post(self, request):
        if not (isinstance(request.data, dict)):
            return JsonResponse({"error": 'Request must be of the form {"input":"rock | paper | scissor"}'}, status=400)
        input = request.data.get("input", None)
        if not (isinstance(input, str) and input in ["rock", "paper", "scissors"]):
            return JsonResponse({"error": 'Request must be of the form {"input":"rock | paper | scissor"}'}, status=400)
        game = JankenGameInProgress.getMyGame(request.user_id)
        if game is None:
            return JsonResponse({"error": "You are not part of a game"}, status=403)
        if game.creator == request.user_id and game.creator_choice != "None":
            return JsonResponse({"error": "You already gave your input"}, status=200)
        elif game.opponent == request.user_id and game.opponent_choice != "None":
            return JsonResponse({"error": "You already gave your input"}, status=200)
        JankenGameInProgress.giveInput(input, request.user_id)
        return JsonResponse({"message": "success"}, status=201)


class waitForResultsAPIView(APIView):
    def get(self, request):
        game = JankenGameInProgress.getMyGame(request.user_id)
        if game is None:
            return JsonResponse({"error": "You are not part of a game"}, status=200)
        if JankenGameInProgress.getMyGame(request.user_id).game_finished == False:
            return JsonResponse({"error": "The game is not finished yet"}, status=200)
        return JsonResponse({"message": "still waiting"}, status=200)


class waitForOpponentAPIView(APIView):
    def get(self, request):
        if JankenGameCreation.objects.filter(creator=request.user_id).exists() == True:
            if JankenGameCreation.objects.get(creator=request.user_id).isWaiting == True:
                return JsonResponse({"error": "You already have a game creation waiting for an opponent"}, status=403)
            JankenGameCreation.objects.get(creator=request.user_id).isWaiting = True
            JankenGameCreation.objects.get(creator=request.user_id).save()
        if JankenGameInProgress.myGame(request.user_id).exists() == False:
            return JsonResponse({"error": "No opponent found"}, status=200)
        game = JankenGameInProgress.objects.get(creator=request.user_id)
        return JsonResponse({"opponent": game.opponent}, status=200)


class getResultsAPIView(APIView):
    def get(self, request):
        game = JankenGameInProgress.getMyGame(request.user_id)
        if game is None:
            return JsonResponse({"error": "You are not part of a game"}, status=403)
        if game.creator_choice == game.opponent_choice:
            game.result = "draw"
        elif game.creator_choice == "rock":
            if game.opponent_choice == "scissors":
                game.result = game.creator
            elif game.opponent_choice == "paper":
                game.result = game.opponent
        elif game.creator_choice == "paper":
            if game.opponent_choice == "rock":
                game.result = game.creator
            elif game.opponent_choice == "scissors":
                game.result = game.opponent
        elif game.creator_choice == "scissors":
            if game.opponent_choice == "paper":
                game.result = game.creator
            elif game.opponent_choice == "rock":
                game.result = game.opponent
        if game.result == game.creator:
            game.winner = game.creator
            game.loser = game.opponent
        if game.result == game.opponent:
            game.winner = game.opponent
            game.loser = game.creator
        if game.result != "draw" and game.result != "won by forfeit":
            game.result = "won"
        game.save()
        results = {
            "message": "success",
            "creator": game.creator,
            "opponent": game.opponent,
            "creator_choice": game.creator_choice,
            "opponent_choice": game.opponent_choice,
            "result": game.result,
            "loser": game.loser,
            "winner": game.winner,
            "myself": request.user_id,
        }
        if request.user_id == game.creator:
            game.to_delete_creator = True
            game.save()
        if request.user_id == game.opponent:
            game.to_delete_opponent = True
            game.save()
        if game.to_delete_creator == True and game.to_delete_opponent == True:
            game.addToHistory()
        return JsonResponse(results, status=200)


class deleteMyJankenGameCreationAPIView(APIView):
    def get(self, request):
        game = JankenGameCreation.getMyGameCreation(request.user_id)
        if game:
            game.delete()
        return JsonResponse({"message": "success"}, status=200)


class amIPlayingAPIView(APIView):
    def get(self, request):
        game = JankenGameInProgress.getMyGame(request.user_id)
        if game is not None:
            if game.game_finished == True:
                if (timezone.now() - game.completion_time).total_seconds() > 20:
                    game.addToHistory()
                    return JsonResponse({"error": "You are not playing"}, status=201)
                return JsonResponse({"message": "The game is finished"}, status=200)
            if game.first_input_time != None:
                if (timezone.now() - game.first_input_time).total_seconds() > 300:
                    game.completion_time = timezone.now()
                    game.game_finished = True
                    game.result = "won by forfeit"
                    game.winner = game.first_input_nickname
                    game.loser = game.creator
                    if game.winner == game.creator:
                        game.loser = game.opponent
                    game.save()
                    return JsonResponse({"error": "You are not playing"}, status=201)
            if game.creator == request.user_id:
                if game.creator_choice == "None":
                    return JsonResponse({"message": "Waiting for your input"}, status=200)
                return JsonResponse({"message": "Waiting for your opponent to play"}, status=200)
            if game.opponent == request.user_id:
                if game.opponent_choice == "None":
                    return JsonResponse({"message": "Waiting for your input"})
                return JsonResponse({"message": "Waiting for your opponent to play"}, status=200)
        if JankenGameCreation.getMyGameCreation(request.user_id) is not None:
            return JsonResponse({"message": "You are waiting for an opponent"}, status=200)
        return JsonResponse({"error": "You are not playing"}, status=201)


class jankenHistoryAPIView(APIView):
    def get(self, request):
        games = FinishedJankenGames.objects.filter(owner=request.user_id)
        if games.exists() == False:
            return JsonResponse({"error": "You never played a game !"}, status=200)
        history = []
        for game in games:
            history.append(
                {
                    "opponent": game.opponent,
                    "opponent_choice": game.opponent_choice,
                    "owner": game.owner,
                    "owner_choice": game.owner_choice,
                    "result": game.result,
                    "end_day": game.completion_time.astimezone(timezone.get_current_timezone()).strftime("%d/%m"),
                    "end_time": game.completion_time.astimezone(timezone.get_current_timezone()).strftime("%H:%M:%S"),
                    "winner": game.winner,
                }
            )
        return JsonResponse(
            {
                "history": history,
                "wins": FinishedJankenGames.countWins(request.user_id),
                "draws": FinishedJankenGames.countDraws(request.user_id),
                "losses": FinishedJankenGames.countLosses(request.user_id),
                "winrate": "{:.1f}%".format(FinishedJankenGames.getWinrate(request.user_id)),
                "most_played": FinishedJankenGames.getMostPlayed(request.user_id),
            },
            status=200,
        )

# TODO Test this
class getFriendStatsAPIView(APIView):
    def post(self, request):
        if not (isinstance(request.data, dict)):
            return JsonResponse({"error": 'Request must be of the form {"friend_id":id}'}, status=400)
        friend_id = request.data.get("friend_id", None)
        if not (isinstance(friend_id, int) and friend_id >= 1):
            return JsonResponse({"error": 'Request must be of the form {"friend_id":id}'}, status=400)
        games = FinishedJankenGames.objects.filter(owner=friend_id)
        if games.exists() == False:
            return JsonResponse({"error": "You never played a game !"}, status=200)
        history = []
        for game in games:
            history.append(
                {
                    "opponent": game.opponent,
                    "opponent_choice": game.opponent_choice,
                    "owner": game.owner,
                    "owner_choice": game.owner_choice,
                    "result": game.result,
                    "end_day": game.completion_time.astimezone(timezone.get_current_timezone()).strftime("%d/%m"),
                    "end_time": game.completion_time.astimezone(timezone.get_current_timezone()).strftime(
                        "%H:%M:%S"
                    ),
                    "winner": game.winner,
                }
            )
        return JsonResponse(
            {
                "history": history,
                "wins": FinishedJankenGames.countWins(friend_id),
                "losses": FinishedJankenGames.countLosses(friend_id),
                "draws": FinishedJankenGames.countDraws(friend_id),
                "winrate": "{:.1f}%".format(FinishedJankenGames.getWinrate(friend_id)),
            },
            status=200,
        )
