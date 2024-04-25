from web3 import Web3, HTTPProvider
from django.http import JsonResponse
import os
import json
from django.views.decorators.http import require_http_methods
from typing import Tuple
from pydantic import ValidationError
from ..models import TournamentData


TOURNAMENT_ADDRESS = os.getenv('CONTRACT_ADDRESS')
provider_url = os.getenv('PROVIDER_URL')
private_key = os.getenv('PRIVATE_KEY')
chainId = os.getenv('CHAIN_ID')
urlBlockchain = os.getenv('URL_BLOCKCHAIN')

tournament_abi =[
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "_tournamentOwner",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "_players",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "_winner",
				"type": "string"
			},
			{
				"internalType": "string[3]",
				"name": "_Match1",
				"type": "string[3]"
			},
			{
				"internalType": "string[3]",
				"name": "_Match2",
				"type": "string[3]"
			},
			{
				"internalType": "string[3]",
				"name": "_Finale",
				"type": "string[3]"
			}
		],
		"name": "saveTournament",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"stateMutability": "nonpayable",
		"type": "constructor"
	},
	{
		"anonymous": False,
		"inputs": [
			{
				"indexed": True,
				"internalType": "string",
				"name": "tournamentOwner",
				"type": "string"
			},
			{
				"indexed": False,
				"internalType": "string",
				"name": "players",
				"type": "string"
			},
			{
				"indexed": False,
				"internalType": "string",
				"name": "winner",
				"type": "string"
			},
			{
				"indexed": False,
				"internalType": "string[3]",
				"name": "Match1",
				"type": "string[3]"
			},
			{
				"indexed": False,
				"internalType": "string[3]",
				"name": "Match2",
				"type": "string[3]"
			},
			{
				"indexed": False,
				"internalType": "string[3]",
				"name": "Finale",
				"type": "string[3]"
			}
		],
		"name": "tournamentSaved",
		"type": "event"
	}
]
w3 = Web3(HTTPProvider(provider_url))
tournament_contract = w3.eth.contract(address=TOURNAMENT_ADDRESS, abi=tournament_abi)


@require_http_methods(["POST"])
def save_tournament(request):
	try:
		account = w3.eth.account.from_key(private_key)
		nonce = w3.eth.get_transaction_count(account.address)
		try:
			data = json.loads(request.body)
			if not isinstance(data, dict):
				return JsonResponse({"error": "Invalid data"}, status=400)
			validated_data = TournamentData(**data)
		except ValidationError as e:
			return JsonResponse({'error': "Invalid data"}, status=400)
		except json.JSONDecodeError as e:
			return JsonResponse({'error': "Invalid JSON"}, status=400)
		Players = (f" {data['player1']}, {data['player2']}, {data['player3']}, {data['player4']}.")
		if (data['Lang'] == "es"):
			Match1 = (f"Ganador: {data['game1_winner']}\n",f"Perdedora: {data['game1_loser']}\n", f"Puntaje: {data['game1_player1_score']}-{data['game1_player2_score']}\n\n")
			Match2 = (f"Ganador: {data['game2_winner']}\n",f"Perdedora: {data['game2_loser']}\n", f"Puntaje: {data['game2_player1_score']}-{data['game2_player2_score']}\n\n")
			Finale = (f"Ganador: {data['game3_winner']}\n",f"Perdedora: {data['game3_loser']}\n", f"Puntaje: {data['game3_player1_score']}-{data['game3_player2_score']}")
		elif (data['Lang'] == "fr"):
			Match1 = (f"Gagnant: {data['game1_winner']}\n",f"Perdant: {data['game1_loser']}\n", f"Score: {data['game1_player1_score']}-{data['game1_player2_score']}\n\n")
			Match2 = (f"Gagnant: {data['game2_winner']}\n",f"Perdant: {data['game2_loser']}\n", f"Score: {data['game2_player1_score']}-{data['game2_player2_score']}\n\n")
			Finale = (f"Gagnant: {data['game3_winner']}\n",f"Perdant: {data['game3_loser']}\n", f"Score: {data['game3_player1_score']}-{data['game3_player2_score']}")
		else:
			Match1 = (f"Winner: {data['game1_winner']}\n",f"Looser: {data['game1_loser']}\n", f"Score: {data['game1_player1_score']}-{data['game1_player2_score']}\n\n")
			Match2 = (f"Winner: {data['game2_winner']}\n",f"Looser: {data['game2_loser']}\n", f"Score: {data['game2_player1_score']}-{data['game2_player2_score']}\n\n")
			Finale = (f"Winner: {data['game3_winner']}\n",f"Looser: {data['game3_loser']}\n", f"Score: {data['game3_player1_score']}-{data['game3_player2_score']}")
		tx = tournament_contract.functions.saveTournament(data['tournamentOwner'], Players, data['game3_winner'], Match1, Match2, Finale).build_transaction({
			'from': account.address,
			'chainId': chainId,
			'gas': 2000000,
			'gasPrice': w3.to_wei('50', 'gwei'),
			'nonce': nonce,
		})

		signed_tx = account.sign_transaction(tx)
		try:
			tx_hash = w3.eth.send_raw_transaction(signed_tx.rawTransaction)
			receipt = w3.eth.wait_for_transaction_receipt(tx_hash)
		except Exception as e:
			return JsonResponse({'error': "Failed to save tournament in blockchain."})
		tx = receipt.transactionHash.hex()
		return JsonResponse({'message': 'success', 'tx': tx})
	except Exception as e:
		return JsonResponse({'error': "Failed to save tournament in blockchain: " + e.args[0]})

@require_http_methods(["POST"])
def get_tournament(request):
	try:
		data = json.loads(request.body)
		OwnerEncode = w3.keccak(text=data['tournamentOwner']).hex()
		Owner = OwnerEncode[2:]
		event = tournament_contract.events.tournamentSaved()
		event_signature = w3.keccak(text="tournamentSaved(string,string,string,string[3],string[3],string[3])").hex()
		event_filter = {'fromBlock': 0, 'toBlock': 'latest', 'address': TOURNAMENT_ADDRESS, 'topics': [event_signature, None, None, None]}
		logs = w3.eth.get_logs(event_filter)

		i = 0
		history = []
		for log in logs:
			if (i >=10):
				break
			event_data = event.process_log(log)
			tournament_Owner = event_data['args']['tournamentOwner'].hex()
			if tournament_Owner == Owner:
				args_dict = {k: v.hex() if isinstance(v, bytes) else v for k, v in dict(event_data['args']).items()}                
				args_dict['transactionHash'] = log.transactionHash.hex()
				history.append(args_dict)
				i += 1
		return JsonResponse({'history': history})
	except Exception as e:
		return JsonResponse({'error': "Failed to get tournament from blockchain: " + e.args[0]})

@require_http_methods(["GET"])
def get_url_blockchain(request):
	return JsonResponse({'url': urlBlockchain})