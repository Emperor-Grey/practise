// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract variables {
    // uint256 chocolate_bar = 10;
    // uint256 store_owner = 300;
    // bool lie_detector = false;
    // string error_message = "You are not authorized to access this contract";

    // uint256 wallet = 500;
    // bool spent = false;
    // string notify_spent = "You have spent money";
    uint256[] numbers = [1, 26, 6, 3, 6, 1];

    function getTotalSum() public view returns (uint256) {
        uint256 total = 0;
        for (uint256 i = 0; i < numbers.length; ++i) {
            total = total + numbers[i];
        }

        return total;
    }
}
