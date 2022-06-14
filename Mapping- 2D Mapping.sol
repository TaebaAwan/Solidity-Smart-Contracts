// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
contract Mapps {

mapping (uint=> string) private Names;

//for(uint i=0 ; i< 5; i++ ){
 function setValue (uint _key, string memory _name) public {
    Names[_key] = _name;
} 
function getValue (uint _key) public view returns(string memory) {
    return Names[_key];
}
function delValue(uint _key) public{
    delete Names[_key];
}  

//nested mapping
mapping (uint=> mapping (uint=> string)) private Approved;

function setValue1 (uint _key, uint _key2, string memory _name) public {
    Approved[_key][_key2] = _name;
} 

function getValue1 (uint _key, uint _key2) public view returns(string memory) {
    return Approved[_key][_key2];
}
}
