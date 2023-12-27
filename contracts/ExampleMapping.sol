
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

struct personInfo{
    string name;
    uint age;
    string add;
    uint don;
}


contract ExampleMapping{
    mapping (address=>personInfo) public donnerDetails;

    function CollectDonnerInfo(string memory _name, string memory _add, uint _age, uint _don) public {
        
        donnerDetails[msg.sender]= personInfo(_name, _age, _add, donnerDetails[msg.sender].don + _don);

    }

    function DeleteInfo() public{
        delete donnerDetails[msg.sender];
    }
}