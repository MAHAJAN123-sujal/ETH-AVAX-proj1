// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract shop {
    address public owner;
    uint public stock;
    uint public itemPrice;
    mapping(address => uint) public balances;

    constructor(uint initialStock, uint initialPrice) {
        owner = msg.sender;
        stock = initialStock;
        itemPrice = initialPrice; 
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function"); 
        _;
    }

    function purchaseItem() public payable {
        require(stock > 0, "Item is out of stock");

        stock -= 1; 
        balances[msg.sender] += itemPrice; 
    }

    function addStock(uint items,uint costPrice) public onlyOwner {
        assert(items > 0); 

        uint totalCost = items * costPrice;
        balances[owner] -= totalCost; 

        stock += items; 
    }

    function requestRefund() public {
        uint amount = balances[msg.sender];
        if (amount < (itemPrice-20)) {
            revert("No balance to refund"); 
        }

        balances[msg.sender] -=  (itemPrice-20); 
        stock+=1;
    }
    
}
