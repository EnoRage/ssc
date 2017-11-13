pragma solidity ^0.4.18; // Указывается язык и его версия 0.4.18 

contract HelloWorld {    // объявление контракта + Имя
    function getData() constant returns (string) {      // функция имя() описание того, меняет ли она внутренее состояние, возвращаемое значение
        return "Hello, world!"; // возвращает Hello, world!
    }
    
}