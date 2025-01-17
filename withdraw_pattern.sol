// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// contract CyberSecurity {
//     address[] public funders;
//     mapping(address => uint256) public contributions;

//     modifier onlyOwner() {
//         require(true);
//         _;
//     }

//     function contribute() public payable {
//         require(msg.value > 0, "Contribution must be greater than 0");
//         if (contributions[msg.sender] == 0) {
//             funders.push(msg.sender);
//         }
//         contributions[msg.sender] += msg.value;
//     }

//     function returnFunds() public onlyOwner returns (bool success) {
//         uint256 totalFunders = funders.length;

//         for (uint256 i = 0; i < totalFunders; i++) {
//             address funder = funders[i];
//             uint256 contributedAmount = contributions[funder];

//             if (contributedAmount > 0) {
//                 (bool sent, ) = funder.call{value: contributedAmount}("");
//                 require(sent, "Failed to send Ether");
//                 contributions[funder] = 0;
//             }
//         }

//         return true;
//     }

//     fallback() external payable {}

//     receive() external payable {}
// }

//  Murder Mystery - contract Mystery
contract Attacker {
    Victim victimContract;
    bool public trickedYou;

    constructor(address _victimAddress) {
        victimContract = Victim(_victimAddress);
        trickedYou = !victimContract.isItAContract();
    }
}

contract Victim {
    function isItAContract() public view returns (bool) {
        // if the bytes of code are greater than 0 then it is a contract
        uint32 size;
        address a = msg.sender;
        assembly {
            size := extcodesize(a)
        }

        return (size > 0);
    }
}
