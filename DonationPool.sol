// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract DonationPool {
    address payable public owner;
    uint256 public totalDonations;

    constructor() {
        owner = payable(msg.sender);
    }

    function donate() external payable {
        totalDonations += msg.value;
    }

    function withdraw() external {
        require(msg.sender == owner, "Only owner");
        owner.transfer(address(this).balance);
    }
}
