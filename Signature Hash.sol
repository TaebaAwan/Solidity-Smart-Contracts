// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Hash {

function hash(string memory _text, uint _num, address _addr) public pure returns (bytes32)  {
    return keccak256(abi.encodePacked(_text, _num, _addr));
}
}


contract GuessGame{

function hash(string memory _text) public pure returns (bytes32)  {
    return keccak256(abi.encodePacked(_text));
}
bytes32 public answer= 0x063013b39cc5e4a19e9ace4dd77100f8c5748105409d6f28aa5a40e8132b33f5  ;
  function guess (string memory _word) public view returns (bool)  {
    return keccak256(abi.encodePacked(_word))== answer ;
}

}
