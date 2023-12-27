//SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract ExampleAddress {
    address public someAddress;

    function setAddress (address _newAddress) public {
        someAddress = _newAddress;
    }

    function getAddressBalance() public view returns(uint){
        return someAddress.balance;
    }
}