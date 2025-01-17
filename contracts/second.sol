// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract second{
    uint count  = 0;

    function setCount(uint _c) public {
        count = _c;
    }

    function getCount() public view returns (uint){
        return count;
    }
}