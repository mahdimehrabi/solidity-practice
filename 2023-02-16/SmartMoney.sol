pragma solidity 0.8.15; 

contract SampleContract{
      uint public balanceRecieved;
      address public owner; 

      constructor(){
          owner=(msg).sender;
      }

      function getContractBalance() public view returns(uint){
        return address(this).balance;
      }


      function SendWithdrawMoney(address to,uint amount) public{
          if (msg.sender==owner){
              payable(to).transfer(amount);
          }
      }

      function deposit() public payable{
          balanceRecieved+=msg.value;
      }

      function withDrawAll() public payable{
          if(msg.sender==owner){
              payable(owner).transfer(getContractBalance());
          }
      }
}
