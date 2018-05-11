pragma solidity ^0.4.22; // Указывается язык и его версия 0.4.22


contract HelloWorld {    // объявление контракта + Имя

  function getData() constant returns (string) {   // имя() описание того, меняет ли состояние и возвращаемое значение
    return "Hello, world!"; // возвращает Hello, world!
  }
}


contract Helloworld2 {

  string ourString = "Hello, world!"; // создание строки ourString и присваение значения по умолчению

  function getData() constant returns (string) {// имя() описание, меняет ли она состояние и возвращаемое значение
    return ourString; // возвращает ourString
  }

  function setData(string newData) { // имя(тип данных название)
    ourString = newData; // присваиваем нашей переменной ourString значение входной строки newData
  }
}

// создать контракт, который будет выводить информацию о 3 параметрах: товар, покупатель, продавец. Можно назначить продавца или покупателя, а товар определяется заранее.