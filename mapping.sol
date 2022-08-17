// SPDX-License-Identifier: MIT;
pragma solidity ^0.8.7;

contract MappingTest {
/*     mapping(address => uint) balances;

    function updateBalance(uint newBalance) public {
        balances[msg.sender] = newBalance;
    }

    function getMsg() public view returns (address , uint) {
        return (msg.sender,balances[msg.sender]);
    }

    function testAddress() public pure returns (address) {
        return balances;
    } */

    address[] public addr;
    function getAll() public {
        address a = address(keccak256(abi.encodePacked(now)));
        addr.push(a);

        return addr;
    }
}