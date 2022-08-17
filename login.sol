// SPDX-License-Identifier: MIT;
pragma solidity ^0.8.7;

/* contract UserReg {
    struct User {
        uint id;
        string name;
        string password;
    }

    User[] userList;
    uint count = 0;

    function reg (string memory _name,string memory _password) public payable {
        count++;
        userList.push(User({id:count,name:_name,password:_password}));
    }

    function getUserList() public view returns (User[] memory){
        return userList;
    }
}

contract Login {
    function reg(UserReg u,string memory _name,string memory _password) public payable {
        u.reg(_name,_password);
    }

    function getUserList(UserReg u) public view {
        u.getUserList();
    }
} */

/* contract Deployed {
    uint a = 1;
    function setA(uint _a) public returns (uint) {
        a = _a;
        return a;
    }
}

interface IDeployed {
    function setA(uint) external returns (uint);
    // function a() public pure returns (uint) {}
}

contract Call {
    
} */

interface ICalculator {
    function getResult () external view returns(uint);
}

contract Test is ICalculator {

    // constructor () public {}

    function getResult() external pure override returns (uint) {
        uint a = 1;
        uint b = 2;
        uint c = a + b;
        return c;
    }
}