// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Ownable {
 address public _owner;

 constructor ()  {
 _owner = msg.sender;
 }


 modifier onlyOwner() {
 require(isOwner(), "Ownable: caller is not the owner");
 _;
 }

 function isOwner() public view returns (bool) {
 return (msg.sender == _owner);
 }
}
