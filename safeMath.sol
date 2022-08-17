// SPDX-License-Identifier: MIT;
pragma solidity ^0.8.7;

contract SafeMath {
    function test1() public pure returns (uint){
        uint x = 0;
        x--;
        return x;
    }

    function test2() public pure returns (uint){
        uint x = 0;
        unchecked { x--; }
        return x;
    }

    // address payable owner = payable(msg.sender);
    address  owner = msg.sender;

    function test3 () public view returns (address,address){
        return (owner,msg.sender);
    }

    function test4() public view returns (uint){
        return address(this).balance;
    }

}