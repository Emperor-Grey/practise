// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Oracle {
    uint256 public rand;
    address public admin;

    constructor() {
        admin = msg.sender;
    }

    function setRand(uint256 _num) external {
        require(msg.sender == admin, "Not authorized, must be the owner");
        rand = _num;
    }
}

contract GeneratingRandomNumber {
    /*
     * keccake256(bytes memory) returns (bytes32)
     * sha256(bytes memory) returns (bytes32)
     * ripemd160(bytes memory) returns (bytes20)
     */

    Oracle public o;

    constructor(address oracleAddress) {
        o = Oracle(oracleAddress);
    }

    //  Building a random number generator which takes an input range and uses cryptographic hashing
    function randMod(uint256 range) external view returns (uint256) {
        require(range > 0, "Range must be positive");

        // Grab info from the block chain
        // abi.encodePacked concatinates arguments
        return
            uint256(
                keccak256(
                    abi.encodePacked(
                        block.timestamp,
                        block.prevrandao, // difficulty was replaced by this in this version
                        msg.sender,
                        o.rand
                    )
                )
            ) % range;
    }
}
