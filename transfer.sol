// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

contract ReceiveEher {

    receive() external payable {}
    fallback() external payable {}

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract SenderEther {
    function t(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function s(address payable _to) public payable {
        bool sent = _to.send(msg.value);
        require(sent,'Faild to send Ether');
    }

    function c(address payable _to) public payable {
        // (bool send,bytes memory data) = _to.call{value:msg.value}("");
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent,'Faild to send Ether');
    }
}
