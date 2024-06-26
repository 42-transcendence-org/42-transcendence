// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DBTournament {
    address private owner;

    constructor() {
        owner = msg.sender;
    }

    event tournamentSaved(string indexed tournamentOwner, string players, string winner, string[3] Match1, string[3] Match2, string[3] Finale);


    function saveTournament(string calldata _tournamentOwner, string calldata _players, string calldata _winner, string[3] calldata _Match1, string[3] calldata _Match2, string[3] calldata _Finale) public onlyOwner {
        emit tournamentSaved(_tournamentOwner, _players, _winner, _Match1, _Match2, _Finale);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action.");
        _;
    }

}