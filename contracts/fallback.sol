// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

contract FallBack {
    event log(uint256 gas);

    fallback() external payable {
        // Special solidity function gasleft returns how much gas is left
        emit log(gasleft());
    }

    // The receive function is explicitly for handling plain Ether transfers.
    receive() external payable {
        emit log(gasleft());
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}

//  we need to send ether to fallback
contract SendToFallBack {
    function transferToFallBack(address payable _to) public payable {
        // send ether to it
        // it will automatically transfer 2300 gas
        _to.transfer(msg.value);
    }

    function callFallBack(address payable _to) public payable {
        // Call method will send the ether to the fallback 
        (bool sent, ) = _to.call{value: msg.value}("");  // we have more gas...
        require(sent, "Failed to send!");
    }
}
