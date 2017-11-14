pragma solidity ^0.4.18; 

// 1) Создать контракт, который будет выводить информацию о 3 параметрах: товар, покупатель, продавец. 
// Можно назначить продавца или покупателя, а товар определяется заранее.

contract Answer1 {

    address buyer;

    address seller;

    string stuffName;

    function Answer1() {

        seller = msg.sender;

    }

    modifier ownable() {
        require(msg.sender == seller);
        _;
    }
    
    function setBuyer(address inputByuer) ownable {

        buyer = inputByuer;

    }

    function getBuyer() constant returns(address) {

        return buyer;
    }
}