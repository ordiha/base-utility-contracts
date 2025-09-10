// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract WishList {
    mapping(address => string) public wishes;

    function addWish(string memory _wish) external {
        wishes[msg.sender] = _wish;
    }

    function getWish(address _user) external view returns (string memory) {
        return wishes[_user];
    }
}
