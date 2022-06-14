// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract ArrayPop {

string[][]  names;
string[]  boysname= ["ahmed", "mohammed"];
string[]  girlsname= ["fiza", "sarah"];

 function addArray() external {
     names.push(boysname);
     names.push(girlsname);  
 }

function getArray() public view returns (string[][] memory) {
return names;
}

string[] public testarray = ["talha", "amna", "taeba", "mohammed", "sara", "jawad", "majid"];


function PoptheElementfromArray(uint _name) public {
     for(uint i=_name ; i< testarray.length-1; i++ )
            {
                testarray[i] = testarray[i+1];
            }
        testarray.pop();

}

function getLength() public view returns (uint)
{
return testarray.length;
}

}


