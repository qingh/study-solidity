// SPDX-License-Identifier: MIT;
pragma solidity ^0.8.7;


/* 
    require
    revert 
    assert
    自定义错误

 */

contract ErrorTest {

    function f1(uint n) external pure  returns (bool){
        return n % 2 == 0;
    }

    function f2(uint n) external pure {
        require(n % 2 == 0, 'n is odd');
    }
}