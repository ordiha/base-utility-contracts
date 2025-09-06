// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract VotePoll {
    string public question;
    mapping(address => bool) public hasVoted;
    uint256 public yesVotes;
    uint256 public noVotes;

    constructor(string memory _question) {
        question = _question;
    }

    function vote(bool _yes) external {
        require(!hasVoted[msg.sender], "Already voted");
        hasVoted[msg.sender] = true;
        if (_yes) yesVotes++; else noVotes++;
    }

    function getResults() external view returns (uint256, uint256) {
        return (yesVotes, noVotes);
    }
}
