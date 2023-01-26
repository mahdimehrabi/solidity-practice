pragma solidity 0.8.14;

contract ExampleUint {
    uint public myInt;

    uint8 public myUint8=250; 

    int public myint=-10;

    function setMyUint(uint _myUint) public{
        myInt=_myUint;
    }

    function incrementMyUint8() public{
        myUint8++;
    }

    function incrementInt() public{
        myint++;
    }
}
