pragma solidity ^0.4.18; 


contract SimpleInfo {

    address owner;

    mapping (bytes32 => string) data;

    function SimpleInfo() {

        owner = msg.sender;

    }

    function sendNewOwner(address newOwner) { // создаем функцию переопределения владельца 
        
        require(msg.sender == owner);
        owner = newOwner;


    }

    function getData(string key) returns (string) {
        
        return data[keccak256(key)];
        
    }

    function setData(string key, string info) {

        require(msg.sender == owner);
        data[keccak256(key)] = info; 

    }

}
