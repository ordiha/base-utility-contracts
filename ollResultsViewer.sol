// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract PollResultsViewer {
    address public pollContract;
    mapping(uint256 => uint256) public totalVotes; // Poll ID => Total votes

    constructor(address _pollContract) {
        pollContract = _pollContract;
    }

    function updateResults(uint256 _pollId) external {
        (uint256 yesVotes, uint256 noVotes) = IPoll(pollContract).getResults();
        totalVotes[_pollId] = yesVotes + noVotes;
    }

    function getTotalVotes(uint256 _pollId) external view returns (uint256) {
        return totalVotes[_pollId];
    }
}

interface IPoll {
    function getResults() external view returns (uint256, uint256);
}
