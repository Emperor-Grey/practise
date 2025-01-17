// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract string_test {
    string a = "hello world";

    function getStr() public view returns (string memory) {
        return a;
    }

    function changeA(string memory _change) public {
        a = _change;
    }

    // To get the length of the string you have to first convert them to the bytes
    // Because strings are expensive
    function getALength() public view returns (uint256) {
        bytes memory string_to_bytes = bytes(a);
        return string_to_bytes.length;
    }
}
