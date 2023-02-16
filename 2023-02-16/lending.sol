//SPDX-License-Identifier: MIT


//every one can deposit and withdraw amount that they deposited
pragma solidity 0.8.15;

contract Lending{
    mapping(address=>uint) public dps;
    address public owner; 

    constructor(){
        owner=msg.sender;
    }
    
    function deposit() public payable{
        dps[msg.sender]=msg.value;
    }

    function withdraw() public{
        if (msg.sender==owner){
            payable(msg.sender).transfer(address(this).balance);
            return;
        }
        uint amount=dps[msg.sender];
        if (amount>0){
            payable(msg.sender).transfer(amount);
            delete dps[msg.sender];
        }
    }


    function send(address recipient) public{
        if (msg.sender==owner){
            payable(recipient).transfer(1000000);
        }
    }
}
