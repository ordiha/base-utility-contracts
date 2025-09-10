// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ProfileBadge {
    mapping(address => string) public badges;

    function earnBadge(string memory _badge) external {
        badges[msg.sender] = _badge;
    }

    function getBadge(address _user) external view returns (string memory) {
        return badges[_user];
    }
}
