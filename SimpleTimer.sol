// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleTimer {
    uint256 public endTime;
    uint256 public duration = 1 days;

    constructor() {
        endTime = block.timestamp + duration;
    }

    function getTimeLeft() external view returns (uint256) {
        if (block.timestamp >= endTime) return 0;
        return endTime - block.timestamp;
    }

    function resetTimer() external {
        endTime = block.timestamp + duration;
    }
}
