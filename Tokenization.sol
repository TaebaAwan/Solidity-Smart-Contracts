// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.13;

//functions/features of any general token
//transfer //mint //supply //burn //balanceOf //approve //allowance //transferFrom //price of token
interface IERC20{

function totalSupply() external view returns (uint);
function balanceOf(address account) external view returns (uint);
function transfer(address recipient, uint amount) external view returns (bool);
function allowance(address owner, address spender) external view returns (uint);
function approve(address spender, uint amount) external view returns (bool);
function transferFrom(address spender, address recipient, uint amount) external view returns (bool);

event Transfer(address from, address to, uint value);
event Approve(address owner, address spender, uint amount);

}

contract Token is IERC20{

address  public owner;
uint public totalSupply;
mapping (address => uint) public balanceOf;
mapping (address => mapping (address => uint)) public allowance;
string public name= "IEC Token";
string public symbol= "IT";

constructor (){
 owner=msg.sender;
}

function transfer(address recipient, uint amount) external view returns (bool){
    balanceOf[msg.sender] -= amount;
    balanceOf[recipient] += amount;
    emit Transfer(msg.sender, recipient, amount);
    return true;
}

function approve(address spender, uint amount) external view returns (bool){
    allowance[msg.sender][spender]= amount;
    emit Approve(msg.sender, spender, amount);
    return true;
}

function transferFrom(address spender, address recipient, uint amount) external view returns (bool){
    allowance[owner][spender]-= amount;
    balanceOf[spender] -= amount;
    balanceOf[recipient] += amount;
    emit Transfer(spender, recipient, amount);
    return true;
}

function mint(uint amount) external {
    balanceOf[msg.sender] += amount;
    totalSupply += amount;
}

function burn(uint amount) external {
    balanceOf[msg.sender] -= amount;
    totalSupply -= amount;
}
}
