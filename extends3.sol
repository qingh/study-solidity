// SPDX-License-Identifier: MIT;
pragma solidity ^0.8.7;

contract Person {
    uint age = 20;
}

contract Man is Person {
    function f1() public {
        age = 50;
    }
}