// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/* Please note that this is mainnet */
// Also not working....

// UniswapV2Factory interface to get the pair address
interface UniswapV2Factory {
    function getPair(address tokenA, address tokenB)
        external
        view
        returns (address pair);
}

// UniswapV2Pair interface to interact with pair contracts
interface UniswapV2Pair {
    function getReserves()
        external
        view
        returns (
            uint112 reserve0,
            uint112 reserve1,
            uint32 blockTimestampLast
        );
}

contract UniSwap {
    address private factory = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
    address private dai_token = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address private wether_token = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;

    function getReserveTokens() external view returns (uint112, uint112) {
        address pair = UniswapV2Factory(factory).getPair(
            dai_token,
            wether_token
        );

        (uint112 reserve0, uint112 reserve1, ) = UniswapV2Pair(pair)
            .getReserves();

        return (reserve0, reserve1);
    }
}
