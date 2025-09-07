// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
 * @dev Provides multiplication with overflow check.
 */
library Math {
    function mulDiv(
        uint256 x,
        uint256 y,
        uint256 denominator
    ) internal pure returns (uint256 result) {
        unchecked {
            result = x * y / denominator;
        }
    }

    function mod(uint256 x, uint256 y, string memory errorMessage) internal pure returns (uint256) {
        require(y != 0, errorMessage);
        return x % y;
    }
}

contract RandomPicker {
    address[] public voters;
    address public winner;

    function vote() external {
        voters.push(msg.sender);
    }

    function pickWinner() external {
        require(voters.length > 0, "No voters");
        uint256 random = uint256(keccak256(abi.encodePacked(block.timestamp, block.prevrandao)));
        winner = voters[Math.mod(random, voters.length, "RandomPicker: modulo failed")];
    }

    function getWinner() external view returns (address) {
        return winner;
    }
}
