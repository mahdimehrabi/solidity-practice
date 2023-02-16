pragma solidity 0.8.15; 


contract TheBlockchainMessanger{
    uint public changeCounter; 

    address public owner; 

    string public theMessage;

    constructor(){
        owner=msg.sender;
    }

    function updateTheMessage(string memory newMessage) public {
        if (msg.sender==owner){
            theMessage=newMessage;
            changeCounter++;
        }
    }
}
