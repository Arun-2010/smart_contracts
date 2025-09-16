// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Inheritance {
    uint public startTime;
    uint public tenYears;
    uint public lastVisited;
    address public owner;
    address payable public recipient;

    constructor(address payable _recipient) {
        // tenYears = 10 * 365 days; // 10 years
        tenYears=10;
        startTime = block.timestamp;
        lastVisited = block.timestamp;
        owner = msg.sender;
        recipient = _recipient;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    modifier onlyRecipient() {
        require(msg.sender == recipient, "Not the recipient");
        _;
    }

    function deposit() public payable onlyOwner {
        lastVisited = block.timestamp;
    }

    function ping() public onlyOwner {
        lastVisited = block.timestamp;
    }

    function claim() external onlyRecipient {
        require(block.timestamp < block.timestamp-tenYears);
        recipient.transfer(address(this).balance);
    }
}
