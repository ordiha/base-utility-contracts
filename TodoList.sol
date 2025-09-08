// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TodoList {
    mapping(address => string) public tasks;

    function addTask(string memory _task) external {
        tasks[msg.sender] = _task;
    }

    function getTask(address _user) external view returns (string memory) {
        return tasks[_user];
    }
}
