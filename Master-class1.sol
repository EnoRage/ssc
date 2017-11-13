pragma solidity ^0.4.18; // Указывается язык и его версия 0.4.18 


contract HelloWorld {    // объявление контракта + Имя


    function getData() constant returns (string) {   // имя() описание того, меняет ли состояние и возвращаемое значение
        return "Hello, world!"; // возвращает Hello, world!
    }
}


contract Helloworld2 {

    string ourString = "Hello, world!"; // создание строки ourString и присваение значения по умолчению

    string ourString2;

    function getData() constant returns (string) {// имя() описание, меняет ли она состояние и возвращаемое значение
        return ourString2; // возвращает ourString
    }

    function setData(string newData) { // имя(тип данных название)
        ourString = newData; // присваиваем нашей переменной ourString значение входной строки newData
    }
}