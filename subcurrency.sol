// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// this contract should allows the creator to create coins
// we need address and amount
contract Coin {
    address public minter;
    mapping(address => uint256) public balances;

    constructor() {
        minter = msg.sender;
    }

    event Sent(address _from, address _to, uint256 _amount);
    error insufficientBalance(uint256 request, uint256 available);

    // we want to make new coins and send to address
    // Only the owner can send
    function mint(address _reciever, uint256 amount) public {
        require(msg.sender == minter, "need owner only");
        balances[_reciever] += amount;
    }

    function send(address _reciever, uint256 _amount) public {
        if (_amount > balances[msg.sender]) {
            revert insufficientBalance({
                request: _amount,
                available: balances[msg.sender]
            });
        }

        balances[msg.sender] -= _amount;
        balances[_reciever] += _amount;

        emit Sent(msg.sender, _reciever, _amount);
    }
}
