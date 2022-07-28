// SPDX-License-Identifier: MIT;
pragma solidity ^0.8.7;

/* function f2() pure returns(uint) {
    uint u = 120;
    return u;
}

contract A {
    function f3() external pure returns (string memory) {
        string  memory str = 'haha';
        return str;
    }

    function f4() public pure {
        f3();
    }
}

contract B {

    function f1() internal pure returns(bool) {
        bool b = true;
        return b;
    }


    function callInternal() public pure returns (bool) {
        return f1();
    }


    function callExternal() public pure returns (uint) {
        return f2();
    }

    function callContractFn(A a) public pure {
        a.f3();
    }
} */

contract A {   
    function f1() external pure returns (string memory) {
        string memory str2 = 'hehe';
        return str2;
    }

    function f2() public view {
        // f1();//报错
        this.f1();//正确
    }
}

contract B {
    function callContractFn(A a) public pure {
        a.f1();
    }
}