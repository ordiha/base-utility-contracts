// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract EventReminder {
    address public eventContract;
    mapping(uint256 => bool) public remindersSet;
    uint256 public reminderInterval = 1 days;

    constructor(address _eventContract) {
        eventContract = _eventContract;
    }

    function setReminder(uint256 _eventId) external {
        require(!remindersSet[_eventId], "Reminder already set");
        remindersSet[_eventId] = true;
    }

    function getEvent(uint256 _eventId) external view returns (string memory) {
        return IEvent(eventContract).getEvent(_eventId);
    }
}

interface IEvent {
    function getEvent(uint256 _id) external view returns (string memory);
}
