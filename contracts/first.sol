// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract First{
    string public message = "Hello World";

    function setMessage(string memory _msg) public {
        message = _msg;
    }

    function getMessage() public view returns (string memory)  {
        return message;
    }

}