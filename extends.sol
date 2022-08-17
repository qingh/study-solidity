// SPDX-License-Identifier: MIT;
pragma solidity ^0.8.7;

contract Person {
    string  user;
    uint8  age;

    constructor(string memory _user,uint8 _age) {
        user = _user;
        age = _age;
    }

    function setInfo(string memory _user,uint8 _age) public {
        user = _user;
        age = _age;
    }

}

contract Man is Person('liuqh',30) {
    function f1() public view returns (string memory,uint8) {
        return (user,age);
    }
}

contract Woman is Person {
    constructor(string memory _user,uint8 _age) Person(_user, _age) {

    }
}
