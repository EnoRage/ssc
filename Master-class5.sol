pragma solidity ^4.0.18;


contract Own {

     address owner;

     function SimpleInfo2() {

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