// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract balancesOfUsers{

uint totalusers;
uint totalSum;

mapping (address => uint) public userBalances;

function registerUser(uint balance)
public{
        userBalances[msg.sender]= balance;
        totalusers++;
        totalSum += userBalances[msg.sender]= balance ;
    }

function getBalance() public view returns(uint){
    return userBalances[msg.sender];
}

function addBalances() public view returns(uint) {
return totalSum;
}
}
