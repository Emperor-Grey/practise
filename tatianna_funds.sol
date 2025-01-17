// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Tatianna {
    address public owner;
    mapping(address => uint256) public balance;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    // Function to send refund to 'tatiana' (or some other address)
    function sendRefund(address payable recipient, uint256 amount)
        public
        onlyOwner
    {
        require(
            address(this).balance >= amount,
            "Insufficient contract balance"
        );

        // Transfer the amount to the recipient
        recipient.transfer(amount);
    }

    // Withdraw function for users to withdraw their balance
    function withdraw() public {
        uint256 userBalance = balance[msg.sender];
        require(userBalance > 0, "Insufficient balance to withdraw");

        // Reset the user's balance before transfer to prevent re-entrancy attacks
        balance[msg.sender] = 0;

        // Transfer the balance to the user
        payable(msg.sender).transfer(userBalance);
    }

    // Function for users to claim refunds if eligible
    function claimRefunds() public {
        uint256 userBalance = balance[msg.sender];
        require(userBalance > 0, "No balance to claim");

        // Transfer the balance to the user
        balance[msg.sender] = 0; // Prevent re-entrancy
        payable(msg.sender).transfer(userBalance);
    }

    // Fallback function to accept ether sent directly to the contract
    receive() external payable {
        balance[msg.sender] += msg.value;
    }

    // Helper function to get contract balance
    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
