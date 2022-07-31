pragma solidity >=0.7.0 <0.9.0;
//SPDX-License-Identifier: MIT

contract LoginAuthentication {
    // storing hash of password against user instead of raw password
    mapping(string => bytes32) passwordHashOf;

    function addUser(string memory username, string memory password)public{
        require(
            passwordHashOf[username] == bytes32(0), // password hash should be unset
            "User is already added"
        );
        passwordHashOf[username] = keccak256(abi.encodePacked(password));
    }

    // return true if User entered the right password
    function login(string memory username, string memory password)view public returns(bool){
        return keccak256(abi.encodePacked(password)) == passwordHashOf[username];
    }

    function changePassword(
        string memory username,
        string memory oldPassword,
        string memory newPassword
    ) public {
        require(login(username, oldPassword), "Invalid Password!");
        passwordHashOf[username] = keccak256(abi.encodePacked(newPassword));
    }
}
