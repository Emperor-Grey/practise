// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// abstract contract are contract's that contains atlest one function without impl
// this is a base contract and derived contract will make use of this

abstract contract x {
    // mark the unimpl functions as virtual
    function y() public view virtual returns (string memory);
}

contract z is x {
    function y() public pure override returns (string memory) {
        return "hello";
    }
}

contract Counter {
    uint256 public count;

    function increment() external {
        count++;
    }
}

interface ICounter {
    function count() external view returns (uint256);

    function increment() external;
}

// Note that are passing the address of counter when running so that's why it knows
contract MyContract {
    function incrementCounter(address _counter) external {
        ICounter(_counter).increment();
    }

    function getCount(address _counter) external view returns (uint256) {
        return ICounter(_counter).count();
    }
}
