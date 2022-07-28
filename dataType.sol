// SPDX-License-Identifier: MIT;
pragma solidity >= 0.7.0 < 0.9.0;

contract DataType {
    bool public b = true;
    uint8 public u = 255;    //  2**8-1
    int8 public u1 = -128;  //  -2**7    2**7-1

    int public minInt = type(int).min;
    int public maxInt = type(int).max;
}