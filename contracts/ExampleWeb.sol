
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;


contract ExampleWeb{
    string public myString;

    function setString (string memory _updateString) public {
        myString = _updateString;
    }
}