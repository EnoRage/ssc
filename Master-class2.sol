pragma solidity ^0.4.18;


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

// every time when we are trying to add a new string 
// we need a new contract => it's not effective
// let's solve that

contract SimpleInfo2 {

    mapping (bytes32 => string) data;  // Array named data, with key type of bytes32 and string  
    
    function setData(string key, string info) { 

        data[keccak256(key)] = info; // we have key and we need to add string info into array by key 

    }
    
    function getData(string key) constant returns(string) {

        return data[keccak256(key)]; // return info by key

    }
} 