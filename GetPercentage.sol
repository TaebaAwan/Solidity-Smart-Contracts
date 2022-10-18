// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract percentage{
    
 function getPercent(uint part, uint whole) public pure returns(uint percent) {
        uint numerator = part * 1000;
        require(numerator > part); // overflow. Should use SafeMath throughout if this was a real implementation especially on older versions of Solidity
        uint temp = numerator / whole + 5; // proper rounding up
        return temp / 10;
    }   
}
