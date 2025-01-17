// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract contructer_test {
    uint256 something;
    string name;

    constructor(string memory _name, uint256 _integer) {
        something = _integer;
        name = _name;
    }
}

contract Teacher is contructer_test("Tom & Jerry", 28) {
    function getName() public view returns (string memory) {
        return name;
    }
}

contract SomeOne is contructer_test {
    constructor(string memory _n, uint256 _a) contructer_test(_n, _a) {}

    function getData() public view returns (string memory _n, uint256 _a) {
        // we need to give the parent's name to get the data
        return (name, something);
    }
}

contract base is contructer_test {
    uint256 data;

    constructor(uint256 _data) contructer_test("something", data) {
        data = _data;
    }

    function getData() public view returns (uint256) {
        return data;
    }
}
