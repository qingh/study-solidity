// SPDX-License-Identifier: MIT;
pragma solidity ^0.8.7;

contract A {
    int public d1 = 10;
    int internal d2 = 20;
    int private d3 = 30;
}

contract B is A {
    function f1() public view returns (int) {
        return d1;
    }
}

contract C {
    A a = new A();
    function f1() public view returns (int) { 
        return a.d1();
    }
}