// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Hash {
    function hash(string memory _text, uint _num, address _addr) public pure returns (bytes32)  {
        return keccak256(abi.encodePacked(_text, _num, _addr));
    }
}


contract GuessGame{

    bytes32 public answer;
    
    constructor(bytes32 memory _answer){
        answer = _answer;
    }

	function hash(string memory _text) public pure returns (bytes32)  {
        return keccak256(abi.encodePacked(_text));
    }
    
    function guess (string memory _word) public view returns (bool)  {
        return keccak256(abi.encodePacked(_word))== answer ;
    }
}
