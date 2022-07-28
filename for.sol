// SPDX-License-Identifier: MIT;
pragma solidity ^0.8.7;

contract For {
    function f1() external pure {
        for(uint i = 0; i < 10; i++) {
            if( i == 3){
                continue;
            }
            if( i == 5){
                break;
            }
        }
    }

    function sum(uint n) external pure returns (uint){
        uint result = 0;
        for(uint i = 0; i <= n; i++) {
            result += i;
        }
        return result;
    }
}