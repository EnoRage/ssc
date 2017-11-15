pragma solidity ^0.4.18; 


contract Own {

    address owner;

    function Own() {

        owner = msg.sender;
    }

    modifier onlyOwner() {   
        require(msg.sender == owner);
        _;
    }

    function sendNewOwner(address newOwner) onlyOwner {
        
        owner = newOwner; 

    }

}


contract InfoSender is Own { // Inharitance  

    mapping (bytes32 => string) data;

    function setData(string key, string info) onlyOwner {

        data[keccak256(key)] = info; 

    }

    function getData(string key) constant returns(string) {

        return data[keccak256(key)];
    }
}