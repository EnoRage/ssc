pragma solidity ^0.4.22;


contract SimpleInfo {

  string name;
  string email;
  uint age;

  function getName() constant returns(string) {
    return name;
  }

  function setName(string input) {
    name = input;
  }

  function getEmail() constant returns(string) {
    return email;
  }

  function setEmail(string input) {
    email = input;
  }

  function getAge() constant returns(uint) {
    return age;
  }

  function setAge(uint input) {
    age = input;
  }
}

// Каждый раз при добавлени новых данных - требуется новый контракт => создавать новый контракт =>  плохая идея
// Поэтому решили создать специальный массив, который позволяет по идентификатору (ключу) добавлять новые переменные
// Ну и вот демонстрация

contract SimpleInfo2 {

  mapping (bytes32 => string) data;  // массив data, в котором  по ключу тип bytes32 существует строка 
    
  function setData(string key, string info) { 
    data[keccak256(key)] = info; // присваиваем по ключу значение 
  }
    
  function getData(string key) constant returns(string) {
    return data[keccak256(key)]; // возвращаем по ключу значение
  }
}