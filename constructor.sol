// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract TestConstructor {
    address public owner;
    uint public x;

    constructor (uint _x){
        x = _x;
        owner = msg.sender;
    }
}