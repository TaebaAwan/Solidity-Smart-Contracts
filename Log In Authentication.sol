pragma solidity >=0.7.0 <0.9.0;
//SPDX-License-Identifier: MIT

contract LoginAuthentication {

    string private username= "taeba";   //declaring state variables
    string private password = "HELLO";
    string newusername;
    string newpassword;

function USERNAME(string memory a) public {  //getting username from the user
    newusername = a;
}
function PASSWORD(string memory b) public { //getting password from the user
    newpassword = b;
}
function LOGIN() view public returns (string memory)
    {
        if (
            keccak256(abi.encodePacked(username)) == keccak256(abi.encodePacked(newusername)) && 
            keccak256(abi.encodePacked(password)) == keccak256(abi.encodePacked(newpassword))
        ) {
            return "Successfully LogIn";
        }
        else{
        return "Wrong credentials Plz Try Again";
        }
    }

}
