from web3 import Web3, HTTPProvider
from web3.middleware import geth_poa_middleware
from django.http import JsonResponse
from dotenv import load_dotenv
import os
import json
from django.views.decorators.http import require_http_methods


TOURNAMENT_ADDRESS = os.getenv('CONTRACT_ADDRESS')
provider_url = os.getenv('PROVIDER_URL')
private_key = os.getenv('PRIVATE_KEY')
chainId = os.getenv('CHAIN_ID')


w3 = Web3(HTTPProvider(provider_url))

tournament_abi =[
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "_tournamentOwner",
				"type": "string"
			},
			{
				"internalType": "string[4]",
				"name": "_players",
				"type": "string[4]"
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
				"internalType": "string[4]",
				"name": "players",
				"type": "string[4]"
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
tournament_contract = w3.eth.contract(address=TOURNAMENT_ADDRESS, abi=tournament_abi)


@require_http_methods(["POST"])
def save_tournament(request):
    try:
        account = w3.eth.account.from_key(private_key)
        nonce = w3.eth.get_transaction_count(account.address)

        data = json.loads(request.body)
        Players = (f" {data['player1']},", f" {data['player2']},", f" {data['player3']},", f" {data['player4']}.")
        Match1 = (f"Winner: {data['game1_winner']}\n",f"Looser: {data['game1_loser']}\n", f"Score: {data['game1_player1_score']}-{data['game1_player2_score']}\n\n")
        Match2 = (f"Winner: {data['game2_winner']}\n",f"Looser: {data['game2_loser']}\n", f"Score: {data['game2_player1_score']}-{data['game2_player2_score']}\n\n")
        Finale = (f"Winner: {data['game3_winner']}\n",f"Looser: {data['game3_loser']}\n", f"Score: {data['game3_player1_score']}-{data['game3_player2_score']}")

        tournamentOwner = "test"

        tx = tournament_contract.functions.saveTournament(tournamentOwner, Players, Match1, Match2, Finale).build_transaction({
            'from': account.address,
            'chainId': chainId,
            'gas': 2000000,
            'gasPrice': w3.to_wei('50', 'gwei'),
            'nonce': nonce,
        })

        signed_tx = account.sign_transaction(tx)
        tx_hash = w3.eth.send_raw_transaction(signed_tx.rawTransaction)

        print(f"Transaction soumise : {tx_hash.hex()}")
        receipt = w3.eth.wait_for_transaction_receipt(tx_hash)
        tx = receipt.transactionHash.hex()
        print(f"Transaction confirmée : ", tx)
        get_tournament(request)
        return JsonResponse({'message': 'success', 'tx': tx})
    except Exception as e:
            print(e)
            return JsonResponse({'error': "Failed to save tournament un blockchain: " + e.args[0]})


def get_tournament(request):
    # tournamentOwner = request.get

    event = tournament_contract.events.tournamentSaved()
    event_signature = w3.keccak(text="tournamentSaved(string,string[3],string[3],string[3])").hex()
    event_filter = {'fromBlock': 0, 'toBlock': 'latest', 'address': TOURNAMENT_ADDRESS, 'topics': [event_signature, None, None, None]}
    logs = w3.eth.get_logs(event_filter)

    i = 0
    history = []
    for log in logs:
        if (i >=10):
            break
        # Décoder le log
        event_data = event.process_log(log)
        # Vérifier si l'ID du tournoi correspond
        tournament_Owner = event_data['args']['tournamentOwner']
        if tournament_Owner == w3.keccak(text="test"):
            args_dict = dict(event_data['args'])
            history.append(args_dict)
            i += 1

    print("\n\n\n\n")
    print(history)
    
