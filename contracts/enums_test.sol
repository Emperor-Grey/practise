// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract enums_test {
    enum Size {
        LARGE,
        MEDIUM,
        SMALL
    }

    Size s;
    Size constant defaultSize = Size.SMALL;

    function setSize(Size _s) public {
        s = _s;
    }

    function getSize() public view returns (Size) {
        return s;
    }

    function getDefaultSize() public pure returns (uint256) {
        return uint256(defaultSize);
    }
}
