// SPDX-License-Identifier: MIT;
pragma solidity ^0.8.7;

contract IfElse {
    function f1(uint x) external pure returns (bool){
        if(x<10){
            return true;
        }else{
            return false;
        }
    }
}