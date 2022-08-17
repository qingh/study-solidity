// SPDX-License-Identifier: MIT;
pragma solidity ^0.8.7;

contract StorageTest {
    int public  i;

    constructor() {
        f1();
    }

    function f1() public pure returns (int) {
        int n = 234;
        return n;
    }
}
/* 
storage 
以智能合约的状态方式永久存储、可以被合约中的所有函数访问、gas消耗量大

memory
临时存储，只能在函数中访问

calldata
calldata 不可修改


 */
