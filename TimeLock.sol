// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract TaebaToken is ERC20, Ownable {
     using SafeMath for uint256;

  uint public duration = 100;
  uint public immutable end;
  uint public nowTime = block.timestamp;

    constructor() ERC20("TaebaToken", "TTK") {
        end = block.timestamp + duration; }

uint256 public transferTokens;
uint256 public lockedTokens;

// This function locks 30% of the tokens being mined
    function mint(address to, uint256 amount) public onlyOwner {
            lockedTokens  = 3000/amount ; 
            transferTokens = amount - lockedTokens;
            _mint(to, transferTokens);    
    }

// This function release the locked assets when the timelock ends 
function withdraw(address to) public {
         require(block.timestamp > end, "Timelock is not ended yet");
                _mint(to, lockedTokens); 
 }
}

