// SPDX-License-Identifier: MIT;
pragma solidity ^0.8.7;

/* 
    require
    revert 
    assert
    自定义错误
 */

contract ErrorTest {
    /* string sex; 
    function f1(uint n) public {
        if(n > 20){
            sex = 'man';
            revert("age cant't rather than 20");
        }else {
            sex = 'woman';
        }
    } */

    uint public num = 0;

    function addNum(uint n) public {
        num +=1;
        require(n<10);
    }

    error MyError();
    function testCustomError(uint _i) public pure {
        
    }
}