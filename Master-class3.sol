pragma solidity ^0.4.18; 

// возникает проблема того, что кто-то может изменить значения в нашем контракте. 
// Мы хотим, чтобы только мы или нужные нам люди могли это делать.
// давайте это решим:

contract MyInfo {

    mapping (bytes32 => string) data;

    address owner; // address - new type of variable 

    function MyInfo() {

        owner = msg.sender; // our variable have an address of contract creator 
        
    }

    function setData(string key, string info) {
        require(msg.sender == owner); // if we don't have true we go from function instantly 
        data[keccak256(key)] = info;

    }

    function getData(string key) constant returns(string) {
        return data[keccak256(key)];

    }

}
