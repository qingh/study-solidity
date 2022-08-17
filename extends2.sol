// SPDX-License-Identifier: MIT;
pragma solidity ^0.8.7;

//https://www.qikegu.com/docs/4991
contract Person {
    string  user;
    uint8  age;

    /* constructor(string memory _user,uint8 _age) {
        user = _user;
        age = _age;
    } */
    function Preson(string memory _user,uint8 _age) public {
        user = _user;
        age = _age;
    }

    function setUser(string memory _user) public {
        user = _user;
    }
    
    function setAge(uint8 _age) public {
        age = _age;
    }
}
//'liuqh',30
contract Man is Person() {
    function Man(string memory _user,uint8 _age) public {}

    function f1() public view returns (string memory,uint8) {
        return (user,age);
    }
}
