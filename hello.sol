// SPDX-License-Identifier: MIT;
pragma solidity ^0.8.7;

contract Hello {
    string public myString = 'hello qingh';

    function setHello(string memory _hi) public {
        myString = _hi;
    }
}