// SPDX-License-Identifier: MIT;
pragma solidity ^0.8.7;

contract addressTest {
    address account = msg.sender;

    function f1() public view returns (uint160){
        return uint160(account);
    }

    function f2() public view returns (address){
        uint160 u = f1();
        return address(u);
    }
}