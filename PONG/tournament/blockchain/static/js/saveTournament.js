const { ethers } = require("hardhat");

const TOURNAMENT_ADDRESS = "0xb918f3B4bA3B549A4fa5B01851d290eB88D0a8C8"

const MY_ADDRESS = "0xDaF0D262b2781eF844b900A3a6C4C94d8E35C143"


async function saveTournament(dataTournament) {
	const Tournament = await ethers.getContractFactory("Tournament");

		const tournament = await Tournament.attach(TOURNAMENT_ADDRESS);

		await tournament.saveTournament(dataTournament);
}

saveTournament().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});