// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract LearnEvents {
    event NewTrade(
        uint256 indexed date,
        address from,
        address indexed to,
        uint256 indexed amount
    );

    function trade(address to, uint256 amount) external {
        // the outside web3.js can get the event
        emit NewTrade(block.timestamp, msg.sender, to, amount);
    }
}
