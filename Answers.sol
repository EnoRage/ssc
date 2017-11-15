pragma solidity ^0.4.18; 


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