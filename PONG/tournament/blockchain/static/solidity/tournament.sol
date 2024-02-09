// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Tournament {
    address public owner;
    uint32 public nb_match;
    uint32 public nb_tournament;
    mapping(uint32 => match_result) public matches;
    mapping(uint32 => uint32[]) public tournaments;

    struct match_result {
        uint8 score;
        uint8 level;
        uint32 idWinner;
        uint32 idLooser;
        uint32 idMatch;
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

    assembly {
        let nbMatch := sload(nb_match.slot)
        nbMatch := add(nbMatch, 1)
        sstore(nb_match.slot, nbMatch)
    }
    
    return nb_match;
}

function saveTournament(uint32[] calldata matchIds) public onlyOwner returns (uint32) {
    tournaments[nb_tournament] = matchIds;

    assembly {
        let nbTournament := sload(nb_tournament.slot)
        nbTournament := add(nbTournament, 1)
        sstore(nb_tournament.slot, nbTournament)
    }
    
    return nb_tournament;
}

    function getWinner(uint32 idTournament) public view returns (uint32) {
        require(idTournament < nb_tournament, "This tournament doesn't exist");
        return getIdMatch(idTournament, 6);
    }

    function getIdMatch(uint32 idTournament, uint32 indice) public view returns (uint32) {
        return tournaments[idTournament][indice];
    }
    
    function getMatch(uint32 idMatch) public view returns (match_result memory) {
        return matches[idMatch];
    }
}