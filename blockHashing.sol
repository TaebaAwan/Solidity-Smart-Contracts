//SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract blockchainHasing {
 
uint public currentBlock=0;

    struct blockInfo{
        bytes32 hashofPrevious;
        string transcation; 
    }

mapping (uint=> blockInfo ) blockData;

function addBlock(bytes32 _hashofPrevious, string memory tnx) public {
    blockData[currentBlock]= blockInfo(_hashofPrevious, tnx );
    currentBlock++;
}

bytes32 hash;
function getHashofBlock(bytes memory _hashofPrevious, string memory _trnx, uint _blockNum) 
    public returns (bytes32){
    hash= keccak256(abi.encodePacked( _hashofPrevious, _trnx, _blockNum)) ;
    return hash;
}

}
