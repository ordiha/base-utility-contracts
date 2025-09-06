// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TipJar {
    address payable public owner;
    uint256 public totalTips;

    constructor() {
        owner = payable(msg.sender);
    }

    function tip() external payable {
        require(msg.value > 0, "Send some ETH!");
        totalTips += msg.value;
    }

    function withdraw() external {
        require(msg.sender == owner, "Only owner");
        uint256 amount = address(this).balance;
        owner.transfer(amount);
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
