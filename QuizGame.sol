// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract QuizGame {
    uint256 public correctAnswers;

    function answer(bool _correct) external {
        if (_correct) correctAnswers++;
    }

    function getScore() external view returns (uint256) {
        return correctAnswers;
    }
}
