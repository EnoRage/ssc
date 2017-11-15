pragma solidity ^0.4.18; // Language and version 0.4.18 


contract HelloWorld {    // conatract + Name


    function getData() constant returns (string) {   // name(), inside condition, return parameter
        return "Hello, world!"; // returns Hello, world!
    }
}


contract Helloworld2 {

    string ourString = "Hello, world!"; // create ourString 

    function getData() constant returns (string) {// name(), inside condition, return parameter
        return ourString; // возвращает ourString
    }

    function setData(string newData) { // name(input parameters)
        ourString = newData; // ourString is newData now
    }
}

