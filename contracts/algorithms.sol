// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// Crypto-graphic hashing - maps message to bit array fixed size called hash

contract GeneratingRandomNumber {
    /*
     * keccake256(bytes memory) returns (bytes32)
     * sha256(bytes memory) returns (bytes32)
     * ripemd160(bytes memory) returns (bytes20)
     */

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
                        msg.sender
                    )
                )
            ) % range;
    }
}
