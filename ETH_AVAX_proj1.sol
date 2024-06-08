// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ETH_AVAX_proj1{
    address public owner;
    uint tokens=100;
    mapping (address => uint) public addressToBalance;

    constructor(){
        owner = msg.sender;
        addressToBalance[msg.sender] = tokens;
    }

    function deposit(uint256 _amount) public {
        uint256 previousBalance = addressToBalance[msg.sender];
        addressToBalance[msg.sender] += _amount;

    // Here I used assert function to check if the deposited amount is reflected to his account
        assert(addressToBalance[msg.sender] == previousBalance + _amount);
    }

    function transfer(address _to,uint _amount) public{
    // Use of require to check for owner and present balance
        require(owner == msg.sender,"Can't make transaction");
        require(addressToBalance[owner]>=_amount,"Insufficient balance");
        addressToBalance[owner] -= _amount;
        addressToBalance[_to] += _amount;
    }

    function withdraw(uint _amount) public{
    //  Here, I used assert function to make sure that only owner is able to withdraw money
        assert(owner == msg.sender);
        if(addressToBalance[owner]>=_amount){
            addressToBalance[owner] -= _amount;
        }
        else{
        // Here, I used revert function to revert back in case, he is asking for more amount
        // than he has in his account
            revert("Insufficient Balance to withdraw money");
        }
    }
}
