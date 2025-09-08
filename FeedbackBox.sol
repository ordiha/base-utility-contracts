// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract FeedbackBox {
    mapping(address => string) public feedback;

    function submitFeedback(string memory _feedback) external {
        feedback[msg.sender] = _feedback;
    }

    function getFeedback(address _user) external view returns (string memory) {
        return feedback[_user];
    }
}
