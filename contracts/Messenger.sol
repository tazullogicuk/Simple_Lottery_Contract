//SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract Messenger{
    string public message;
    address public owner; 
    int public counter; 

    uint public balance;

    function setOwner() public {
        owner = msg.sender;
    }

    function updateMessage (string memory _newMessage) public{
        if ( owner == msg.sender){
            message = _newMessage;
            counter++;
            

        }
    }

    function viewBalanceOwner () public view returns (uint){
        return owner.balance;
    }

}