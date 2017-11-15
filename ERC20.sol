pragma solidity ^0.4.18;

contract Ownable {
    
    address owner;
    
    function Ownable() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address newOwner) onlyOwner {
        owner = newOwner;
    }
    
}

contract SimpleTokenCoin is Ownable {
    
    string public constant name = "Simple Coin Token";
    
    string public constant symbol = "SCT";
    
    uint32 public constant decimals = 18;
    
    uint public totalSupply = 0; // Basic amount of money
    
    mapping (address => uint) balances; // list of balances of our token
    
    mapping (address => mapping(address => uint)) allowed; // list if accounts who are allowed to make operation with account 
    
    function mint(address _to, uint _value) onlyOwner {
        assert(totalSupply + _value >= totalSupply && balances[_to] + _value >= balances[_to]); //assert do the same as require but for internal errors
        balances[_to] += _value; 
        totalSupply += _value;
    }
    
    function balanceOf(address _owner) constant returns (uint balance) {
        return balances[_owner];
    }

    function transfer(address _to, uint _value) returns (bool success) {
        if(balances[msg.sender] >= _value && balances[_to] + _value >= balances[_to]) { // check that accouts have that money and there aren't any problems with negative balances on both sides
            balances[msg.sender] -= _value; 
            balances[_to] += _value;
            Transfer(msg.sender, _to, _value);
            return true;
        } 
        return false;
    }
    
    function transferFrom(address _from, address _to, uint _value) returns (bool success) {
        if( allowed[_from][msg.sender] >= _value &&
            balances[_from] >= _value 
            && balances[_to] + _value >= balances[_to]) {
            allowed[_from][msg.sender] -= _value;
            balances[_from] -= _value; 
            balances[_to] += _value;
            Transfer(_from, _to, _value);
            return true;
        } 
        return false;
    }
    
    function approve(address _spender, uint _value) returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
    }
    
    function allowance(address _owner, address _spender) constant returns (uint remaining) {
        return allowed[_owner][_spender];
    }
    
    event Transfer(address indexed _from, address indexed _to, uint _value);
    
    event Approval(address indexed _owner, address indexed _spender, uint _value);
    
}