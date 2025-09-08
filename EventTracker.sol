// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract EventTracker {
    mapping(address => bool) public attendees;

    function attend() external {
        attendees[msg.sender] = true;
    }

    function isAttending(address _user) external view returns (bool) {
        return attendees[_user];
    }
}
