//SPDX-Licence-Identifier: MIT

pragma solidity 0.8.15; 

contract MappingStructExample{

    struct Transaction{
        uint amount;
        uint timestamp; 
    }

    struct Balance{
        uint totalBalance;
        uint numDeposits;
        mapping(uint =>Transaction) deposits; 
        uint numWithDrawals;
        mapping(uint=>Transaction) withDrawals; 
    }

    mapping(address=>Balance) public balances; 

    function depositMoney() public payable {
        balances[msg.sender].totalBalance+=msg.value;
        Transaction memory deposit=Transaction(msg.value,block.timestamp);
        balances[msg.sender].deposits[balances[msg.sender].numDeposits]=deposit;
        balances[msg.sender].numDeposits++;
    }

    function withDrawMoney(address payable _to,uint _amount) public payable {
        balances[msg.sender].totalBalance -=_amount;
        Transaction memory withDrawal=Transaction(msg.value,block.timestamp);
        balances[msg.sender].withDrawals[balances[msg.sender].numWithDrawals]=withDrawal;
        balances[msg.sender].numWithDrawals++; 

        _to.transfer(_amount);
    }

    function getDepositNum(address _from,uint _numDeposit)public view returns(Transaction memory){
        return balances[_from].deposits[_numDeposit];
    }
}
