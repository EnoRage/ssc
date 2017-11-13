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