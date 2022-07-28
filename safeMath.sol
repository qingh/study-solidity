// SPDX-License-Identifier: MIT;
pragma solidity >= 0.7.0 < 0.9.0;

contract SafeMath {
    function test1() public pure returns (uint){
        uint x = 0;
        x--;
        return x;
    }

    function test2() public pure returns (uint){
        uint x = 0;
        unchecked { x--; }
        return x;
    }
}