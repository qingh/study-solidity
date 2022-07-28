// SPDX-License-Identifier: MIT;
pragma solidity ^0.8.7;


contract Variable {
    uint public a1 = 11;
    uint internal a2 = 22;
    uint private a3 = 33;  
}

contract Call {
    Variable v = new Variable();    
}