//SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract Lottery{
    address public manager;

    address payable [] public players;

    constructor(){
        manager = msg.sender;
    }

    function AlreadyRegistered() view private returns (bool){
        for (uint i = 0; i < players.length; i++){
            if (players[i] == msg.sender){
                return true;
            }
        }
        return false;
    }

    function Enter()public payable {
        require(msg.sender != manager, "Managers are not allowed");
        require(AlreadyRegistered() == false, "You already registered");
        require(msg.value >= 1 ether, "Minimum payment is 1 Ether");

        players.push(payable(msg.sender));
    }

    function Random()view private returns(uint){
        return uint(sha256(abi.encodePacked(block.difficulty, block.number, players)));
    }

    function PickWinner() view public returns (address payable ){
        require(players.length > 0, "Minimum two players have to register to select a winner");
        require(msg.sender == manager, "Only Manager can access this");
        uint winnerIndex = Random() % players.length;
        address payable winner = players[winnerIndex];
        return winner;

    }

    function PayWinner() public payable{
        PickWinner().transfer(address(this).balance);
    }

    function WinningAmount() public view returns(uint){
        return address(this).balance;
    }

    function RegPlayers()view public returns(address payable [] memory){
        return players;
    }

    function ResetLottery() public{
        require(msg.sender == manager, "Only manager can reset the Lottery");
        require(address(this).balance == 0, "Current Lottery winner is not declared");
        players = new address payable [](0);

    }
}