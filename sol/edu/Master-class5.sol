pragma solidity ^0.4.22; 

contract Own {

  address owner;

  constructor() {
    owner = msg.sender;
  }

  modifier onlyOwner() {   // создали модификатор доступа
    require(msg.sender == owner);
    _;
  }

  function sendNewOwner(address newOwner) onlyOwner { // создаем функцию переопределения владельца       
    owner = newOwner; // меняем на адрес нового
  }

}


contract InfoSender is Own { // наследуем контракт доступа 

  mapping (bytes32 => string) data;

  function setData(string key, string info) onlyOwner {
    data[keccak256(key)] = info; 
  }

  function getData(string key) constant returns(string) {
    return data[keccak256(key)];
  }
}