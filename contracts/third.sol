// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract third {
    constructor() {}

    function getResult() public pure returns (uint256) {
        uint256 a = 2;
        uint256 b = 3;
        uint256 c = a + b;
        return c;
    }
}
