// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;
//函数返回值的三种形式
contract testFunctionReturns {
    function f1() public pure returns (uint,bool){
        return (1,true);
    }

    function f2() public pure returns (uint u,bool b,string memory s){
        return (2,false,'qingh');
    }

    function f3() public pure returns (uint u,bool b){
        u = 3;
        b = true;
    }

    //接收所有值
    function f4() public pure returns (uint,bool){
        (uint n1,bool b1) = f1();
        return (n1,b1);
    }

    //接收部分值
    function f5() public pure returns (string memory) {
        (,,string memory str) = f2();
        return (str);
    }
}