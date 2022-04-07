// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Testament {
    address public _manager;
    mapping(address=>address) _heir;
    mapping(address=>uint) _balance;
    event Create(address indexed owner,address indexed heir,uint amount);
    event Report(address indexed owner,address indexed heir,uint amount );
    constructor(){
        _manager = msg.sender;
    }

    //owner create testament
    function create(address heir) public payable{
        require(msg.value>0,"Please enter money greater than 0");
        require(_balance[msg.sender]<=0,"Already Testament Exits");
        _heir[msg.sender] = heir;
        _balance[msg.sender] = msg.value;
        emit Create(msg.sender, heir, msg.value);
    }
    function getTestament(address owner) public view returns(address heir,uint amount){
        return (_heir[owner],_balance[owner]);
    }
    function reportOfDeath(address owner) public{
        require(msg.sender == _manager, "Unauthorized");
        require(_balance[owner] > 0,"No Testament");
        emit Report(owner, _heir[owner], _balance[owner]);
        
        payable(_heir[owner]).transfer(_balance[owner]);
        _balance[owner] = 0;
        _heir[owner] = address(0);
    }
}
