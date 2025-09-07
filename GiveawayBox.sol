// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract GiveawayBox {
    address payable public owner;
    uint256 public claimAmount = 0.00001 ether;
    mapping(address => bool) public hasClaimed;

    constructor() {
        owner = payable(msg.sender);
    }

    function claim() external {
        require(!hasClaimed[msg.sender], "Already claimed");
        require(address(this).balance >= claimAmount, "Not enough ETH in box");
        hasClaimed[msg.sender] = true;
        payable(msg.sender).transfer(claimAmount);
    }

    function addFunds() external payable {
        require(msg.sender == owner, "Only owner");
    }
}
