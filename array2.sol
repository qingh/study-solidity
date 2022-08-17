// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;


//固定长度的数组，不能使用会修改数组长度的方法，如：push、pop
contract ArrayTest {
    struct User {
        string name;
        uint age;
        uint gender;//0:woman;  1:man
    }

    User[] list;
    mapping(uint => User[]) Obj;

    function add(string memory _name,uint _age,uint _gender) public {
        list.push(User({name:_name,age:_age,gender:_gender}));
        Obj[_gender].push(User({name:_name,age:_age,gender:_gender}));
    }

    function getAllUser(uint x) public view returns (User[] memory) {
        return Obj[x];
    }
}