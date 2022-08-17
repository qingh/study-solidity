// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;


contract Data {
    uint supply;

    function getSupply() public view returns (uint) {
        return supply;
    }

    function setSupply(uint _amount) public {
        supply = _amount;
    }

   function setValue(address _contract,string memory _method) public {
        (bool success,bytes memory data) = _contract.delegatecall(abi.encodeWithSignature(_method));
    }
}

contract Upgrade {
    uint supply;
    function pow() public {
        supply = supply * supply;
    }

    function add() public {
        supply += 10;
    }

    function reset() public {
        supply = 0;
    }

}
