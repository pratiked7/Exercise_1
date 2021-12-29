pragma solidity >=0.5.9;

contract Bank {

    address public owner;
    uint balance;

    constructor() payable{
        require(msg.value == 1 wei);
        owner = msg.sender;
    }

    function deposit() public payable returns(uint){
        balance += msg.value;
        return balance;
    }

    function withdraw(uint amt) public returns(uint bal) {
       
        if(amt <= balance){
            balance -= amt;
            msg.sender.transfer(amt);
        }

        return balance;
    }
}