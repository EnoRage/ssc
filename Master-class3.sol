pragma solidity ^0.4.18; 

// возникает проблема того, что кто-то может изменить значения в нашем контракте. 
// Мы хотим, чтобы только мы или нужные нам люди могли это делать.
// давайте это решим:

contract MyInfo {

    mapping (bytes32 => string) data;

    address owner; // тип переменной адрес, создаем переменную обладатель

    function MyInfo() {

        owner = msg.sender; // присваиваем обладателю адрес создателя контракта, через структуру msg
        
    }

    function setData(string key, string info) {


    }



}
