// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract unit_tests {
    function test() public pure {
        assert(1000000000000000000 wei == 1 ether); // 10^18 = 1 eth
        assert(1 wei == 1);

        assert(1 ether == 1e18);
    }
}
