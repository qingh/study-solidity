// SPDX-License-Identifier: MIT;
pragma solidity ^0.8.7;

contract TodoListData {
    struct Task {
        uint id;
        string value;
    }

    Task[] list;

    function addTask(uint _id, string memory _val) public {
        list.push(Task(_id,_val));
    }

    function getList () public view returns (Task[] memory) {
        return list;
    }
}

contract TodoList {
    TodoListData t;

    function addTask2(uint id, string memory val) public {
        t.addTask(id,val);
    }

    function getList2 () public view {
        t.getList();
    }
}