pragma solidity ^0.4.18; 


contract SimpleInfo {


    address owner;

    mapping (bytes32 => string) data;

    constructor() {

        owner = msg.sender;

    }

    function sendNewOwner(address newOwner) { // создаем функцию переопределения владельца 
        
        require(msg.sender == owner); // проверяем обладателя
        owner = newOwner; // меняем на адрес нового

    }

    function getData(string key) returns (string) {
        
        return data[keccak256(key)];
        
    }

    function setData(string key, string info) {

        require(msg.sender == owner);
        data[keccak256(key)] = info; 

    }

}


contract SimpleInfo2 {

    address owner;

    mapping (bytes32 => string) data;

    function SimpleInfo2() {

        owner = msg.sender;
    }

    modifier onlyOwner() {   // создали модификатор доступа
        require(msg.sender == owner);
        _;
    }

    function sendNewOwner(address newOwner) onlyOwner { // создаем функцию переопределения владельца 
        
        owner = newOwner; // меняем на адрес нового

    }

    function getData(string key) returns (string) {
        
        return data[keccak256(key)];
        
    }

    function setData(string key, string info) onlyOwner {

        require(msg.sender == owner);
        data[keccak256(key)] = info; 

    }

}
