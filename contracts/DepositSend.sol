//SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract DepositSend{
    uint receivedBalance; 

    function Deposit() public payable {
        receivedBalance += msg.value;
    }

    function GetBalance() public view returns (uint){
        return address(this).balance;
    }

    function Withdraw() public {
        address payable to = payable (msg.sender);
        to.transfer(GetBalance());


    }

    function WithdrawtoAddress(address payable to) public {
        to.transfer(GetBalance());
    }


}