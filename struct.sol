// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract TestStruct {
    struct Car {
        string model;
        uint year;
        address owner;
    }

    Car[] list;

    function f1() public returns (Car[] memory) {
        Car memory toyota = Car('Toyota',2000,msg.sender);
        Car memory tesla = Car({model:'Tesla',year:2010,owner:msg.sender});
        Car memory bmw;
        bmw.model = 'BMW';
        bmw.year = 2022;
        bmw.owner = msg.sender;

        list.push(toyota);
        list.push(tesla);
        list.push(bmw);
        return list;
    }
}