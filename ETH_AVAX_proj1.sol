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

    function transfer(address _to,uint _amount) public{
        require(owner == msg.sender,"Can't make transaction");
        require(addressToBalance[owner]>=_amount,"Insufficient balance");
        addressToBalance[owner] -= _amount;
        addressToBalance[_to] += _amount;
        
        // assert(owner == msg.sender);
        // if(addressToBalance[owner]>=_amount){
        //     addressToBalance[owner] -= _amount;
        //     addressToBalance[_to] += _amount;
        // }
        // else{
        //     revert("Insufficient Balance");
        // }
    }
}
