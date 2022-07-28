// SPDX-License-Identifier: GPL-3.0;
pragma solidity >= 0.7.0 < 0.9.0;

contract Add {
    function add(int x,int y) public pure returns(int) {
        return x+y;
    }
}