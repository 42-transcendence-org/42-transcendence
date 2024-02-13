/**
 *Submitted for verification at Sepolia.Arbiscan.io on 2024-02-12
*/

/**
 *Submitted for verification at Sepolia.Arbiscan.io on 2024-02-09
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DBTournamentV1 {
    address public owner;
    uint32 public nb_match;
    uint32 public nb_tournament;
    mapping(uint32 => match_result) public matches;
    mapping(uint32 => tournament) public tournaments;

    struct match_result {
        uint8 score;
        uint8 level;
        uint32 idWinner;
        uint32 idLooser;
        uint32 idMatch;
        uint32 idTournament;
    }

    struct tournament {
        uint32  quart1;
        uint32  quart2;
        uint32  quart3;
        uint32  quart4;
        uint32  demi1;
        uint32  demi2;
        uint32  finale;
    }

    constructor() {
        nb_match = 0;
        nb_tournament = 0;
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action.");
        _;
    }

    function saveMatch(match_result calldata matchData) public onlyOwner returns (uint32) {
        matches[nb_match] = matchData;
        return nb_match++;
    }

    function saveTournament(tournament calldata matchIds) public onlyOwner returns (uint32) {
        tournaments[nb_tournament] = matchIds;
        return nb_tournament++;
    }

    function getWinner(uint32 idTournament) public view returns (uint32) {
        require(idTournament < nb_tournament, "This tournament doesn't exist");
        return getIdMatch(idTournament);
    }

    function getIdMatch(uint32 idTournament) public view returns (uint32) {
        return tournaments[idTournament].finale;
    }
    
    function getMatch(uint32 idMatch) public view returns (match_result memory) {
        return matches[idMatch];
    }
}