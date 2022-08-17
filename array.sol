// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

//动态数组
contract ArrayTest {
    
    uint[] arr1;

    //动态数组push
    function push(uint n) public {
        arr1.push(n);
    }

    //删除最后一个
    function pop() public {
        arr1.pop();
    }

    //删除指定索引元素
    function deleteElement(uint index) public {
        delete arr1[index];
    }

    function edit(uint index,uint value) public {
        arr1[index] = value;
    }

    function getArr1() public view returns (uint,uint[] memory){
        return (arr1.length,arr1);
    }

    //动态数组中的元素，如果被删除，长度是不变的，现需要实现，删除元素后，数组长度也发生改变
    function remove(uint index) public {
        require(index < arr1.length,'index out of bound');
        for(uint i = index;i<arr1.length-1;i++){
            arr1[i] = arr1[i+1];
        }
        arr1.pop();
    }
}