const TOURNAMENT_ADDRESS = "0xb918f3B4bA3B549A4fa5B01851d290eB88D0a8C8"

const MY_ADDRESS = "0xDaF0D262b2781eF844b900A3a6C4C94d8E35C143"


//Test
const { ethers } = require("ethers");

// Remplacer par les valeurs réelles dans un fichier .env
const providerUrl = "https://arbitrum-sepolia.infura.io/v3/"
const privateKey = 

// Créer un fournisseur à partir de l'URL RPC
const provider = new ethers.providers.JsonRpcProvider(providerUrl);

// Créer un signataire (wallet) à partir de la clé privée et connecter au fournisseur
const signer = new ethers.Wallet(privateKey, provider);

// Charger le contrat intelligent

const tournamentAbi = [{"inputs":[],"stateMutability":"nonpayable","type":"constructor"},{"inputs":[{"internalType":"uint32","name":"idTournament","type":"uint32"},
						{"internalType":"uint32","name":"indice","type":"uint32"}],"name":"getIdMatch","outputs":[{"internalType":"uint32","name":"","type":"uint32"}],
						"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint32","name":"idMatch","type":"uint32"}],
						"name":"getMatch","outputs":[{"components":[{"internalType":"uint8","name":"score","type":"uint8"},{"internalType":"uint8","name":"level","type":"uint8"},
						{"internalType":"uint32","name":"idWinner","type":"uint32"},{"internalType":"uint32","name":"idLooser","type":"uint32"},{"internalType":"uint32","name":"idMatch","type":"uint32"}],
						"internalType":"struct DBTournamentV1.match_result","name":"","type":"tuple"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint32","name":"idTournament","type":"uint32"}],
						"name":"getWinner","outputs":[{"internalType":"uint32","name":"","type":"uint32"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint32","name":"","type":"uint32"}],
						"name":"matches","outputs":[{"internalType":"uint8","name":"score","type":"uint8"},{"internalType":"uint8","name":"level","type":"uint8"},{"internalType":"uint32","name":"idWinner","type":"uint32"},
						{"internalType":"uint32","name":"idLooser","type":"uint32"},{"internalType":"uint32","name":"idMatch","type":"uint32"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"nb_match","outputs":[{"internalType":"uint32","name":"","type":"uint32"}],
						"stateMutability":"view","type":"function"},{"inputs":[],"name":"nb_tournament","outputs":[{"internalType":"uint32","name":"","type":"uint32"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"owner","outputs":[{"internalType":"address","name":"","type":"address"}],
						"stateMutability":"view","type":"function"},{"inputs":[{"components":[{"internalType":"uint8","name":"score","type":"uint8"},{"internalType":"uint8","name":"level","type":"uint8"},{"internalType":"uint32","name":"idWinner","type":"uint32"},{"internalType":"uint32","name":"idLooser","type":"uint32"},
						{"internalType":"uint32","name":"idMatch","type":"uint32"}],"internalType":"struct DBTournamentV1.match_result","name":"matchData","type":"tuple"}],"name":"saveMatch","outputs":[{"internalType":"uint32","name":"","type":"uint32"}],"stateMutability":"nonpayable","type":"function"},
						{"inputs":[{"internalType":"uint32[]","name":"matchIds","type":"uint32[]"}],"name":"saveTournament","outputs":[{"internalType":"uint32","name":"","type":"uint32"}],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint32","name":"","type":"uint32"},{"internalType":"uint256","name":"","type":"uint256"}],
						"name":"tournaments","outputs":[{"internalType":"uint32","name":"","type":"uint32"}],"stateMutability":"view","type":"function"}]
const tournament = new ethers.Contract(TOURNAMENT_ADDRESS, tournamentAbi, signer);

async function saveMatch(dataMatch) {
    // Appeler la fonction `saveMatch` du contrat
    const tx = await tournament.saveMatch(dataMatch);
    console.log(`Transaction soumise : ${tx.hash}`);

    // Attendre que la transaction soit minée
    const receipt = await tx.wait();
    console.log(`Transaction confirmée : ${receipt.transactionHash}`);
}

// Exemple d'utilisation
const dataMatch = {
    score: 1,
    level: 2,
    idWinner: 100,
    idLooser: 200,
    idMatch: 300,
};

(async () => {
    try {
        await saveMatch(dataMatch);
    } catch (error) {
        console.error('Erreur lors de l’exécution de saveMatch:', error);
    }
})();


//

// async function saveMatch(dataMatch) {
// 	const Tournament = await ethers.getContractFactory("Tournament");

// 		const tournament = await Tournament.attach(TOURNAMENT_ADDRESS);

// 		await tournament.saveMatch(dataMatch);
// }

// saveMatch().catch((error) => {
//   console.error(error);
//   process.exitCode = 1;
// });