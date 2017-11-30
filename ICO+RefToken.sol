pragma solidity ^0.4.18;
/* Let start */
/*Firstly we are creating interfaces of our token.
What does mean interface?
Interface is a stack of rules. 
The interface consists of functions and variables, which are not realised.
It is template of our token.

The first interface is ERC20Basic. 
1) It contains variable "totalSupply",which stores total token's supply.
2) Function balanceOf which returns balance of entered address.
3) Function called transfer which transmits some value to entered address.
4) And event Transfer which records the fact of transmission into blockchain.
*/
contract ERC20Basic {
  uint256 public totalSupply;
  function balanceOf(address who) public constant returns (uint256);
  function transfer(address to, uint256 value) public returns (bool);
  event Transfer(address indexed from, address indexed to, uint256 value);
}

/*
The next interface is ERC20. It's inherited from the interface ERC20Basic.
It's mean that this new interface contains all functions and veriables which we are writing in ERC20Basic interface.
ERC20 interface consists of 3 functions and one event.
This standard allows to give rights for third party people to use some amount of your tokens.
1) The first function called allowance. It allows to check: How much tokens can use spender on the owner's address.
2) If you use second function called "transferFrom", you send tokens from owner's address to which you have access, to entered address.
3) The third function called "Approval". It gives access for using entered amount of tokens which belong to your address another address.
4) And last is event called Approval. This event fixe fact of transfer of access rights.
*/
contract ERC20 is ERC20Basic {
  function allowance(address owner, address spender) public constant returns (uint256);
  function transferFrom(address from, address to, uint256 value) public returns (bool);
  function approve(address spender, uint256 value) public returns (bool);
  event Approval(address indexed owner, address indexed spender, uint256 value);
}

/*
Next we are writing library called SafeMath.
SafeMath helps us to check variables on negative values and variables overflow.
*/
library SafeMath {
  /*
  The first function is for multiply.
  The function works if the resulting number devided by first number equals to second number.
  Like this we are checking on variables overflow.
  But first number can be zero. If this is happened function will work too.
  */
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a * b;
    assert(a == 0 || c / a == b);
    return c;
  }

  /*
  The second is devision.
  We can check dividing by zero, but compiler do it himself.
  */
  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }

  /*
  Next is subtraction. Here we are checking second number. Function will be works if the result of subtraction will be not negative. 
  */
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a); 
    return a - b; 
  } 
  /*
  And last is addition. Here we are cheсking variables overflow. If the result of addition will more then first number the function will be work.
  */
  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b; 
    assert(c >= a);
    return c;
  }
}

/*
Let's try to use ERC20 interface to write our token.
Firstly we have to inherit from ERC20 interface to get list of functions and variables
which we have to use.
*/
contract BasicToken is ERC20 {
  // Use SafeMath labrary.
  using SafeMath for uint256;

  /* Define balances variable. This variable will be consists of mapping address and amount tokens. */
  mapping(address => uint256) balances;
  /* Define variable called "allowed". This variable will be consists of double mapping.
     Owner's address conforms to address third party person to whith provided access
     to use some tokens from owner address.
  */
  mapping(address => mapping (address => uint256) ) allowed;

  /*
  Next we are defining function called balanceOf which returns balans of tokens of entered address.
  */
  function balanceOf(address who) public constant returns (uint256) {
    return balances[who];
  }
  
  /*
  Let's define transfer function.
  */
  function transfer(address _to, uint256 _value) public returns (bool) {
    // This statement means exit from function if you won't enter sender's address.
    require(_to != address(0));
    // This statement don't allow to send tokens if your balance less than number of sending tokens.
    require(_value <= balances[msg.sender]);
    // Use SafeMath functions to subtract tokens from owner's address.
    balances[msg.sender] = balances[msg.sender].sub(_value);
    // Use SafeMath functions to adding tokens to receiver's address.
    balances[_to] = balances[_to].add(_value);
    // Write event in blockchain.
    Transfer(msg.sender, _to, _value);
    return true;
  }

  // Define function for transferring resources from another address.
  function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
    //Check address for zero value.
    require(_to != address(0));
    // If transferring resources more than balance THEN go out from the contract.
    require(_value <= balances[_from]);
    // If you don't have permissions on tokens which you own on another address - go out from the contract.
    require(_value <= allowed[_from][msg.sender]); 
    balances[_from] = balances[_from].sub(_value); 
    balances[_to] = balances[_to].add(_value); 
    // Subtract tokens from your access.
    allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value); 
    Transfer(_from, _to, _value); 
    return true; 
  } 

// Next define function for assignment of rights to use some amount of tokens to another address.
  function approve(address _spender, uint256 _value) public returns (bool) { 
    // Assigment rights to use _value amount of tokens to _spender address.
    allowed[msg.sender][_spender] = _value; 
    // Registred this fact.
    Approval(msg.sender, _spender, _value); 
    return true; 
  }

  // Define function which checks available funds on another address.
  function allowance(address _owner, address _spender) public constant returns (uint256 remaining) { 
    return allowed[_owner][_spender]; 
  } 
  
  // Function for increasing value of authorized funds.
  function increaseApproval (address _spender, uint _addedValue) public returns (bool success) { 
      allowed[msg.sender][_spender] = allowed[msg.sender][_spender].add(_addedValue); 
      Approval(msg.sender, _spender, allowed[msg.sender][_spender]); 
      return true; 
  } 

  // Function for decreasing value of authorized funds.
  function decreaseApproval (address _spender, uint _subtractedValue) public returns (bool success) { 
      // Define variable which access actual data about access to someone else's tokens.
      uint oldValue = allowed[msg.sender][_spender]; 
      // If subtracted value more than actual value then the available tokens equals to zero. 
      if (_subtractedValue > oldValue) {
        allowed[msg.sender][_spender] = 0;
      // Else will be subtraction.
      } else {
        allowed[msg.sender][_spender] = oldValue.sub(_subtractedValue);
      }
      Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
      return true;
  }
}

/* Now we will write contract which give permissions to call a functions */
contract Ownable {
  // Define variable our owner of contract.
  address public owner;

  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

  // Define cunstructor of contract.
  function Ownable() public {
    // Owner is that person who call contract.
    owner = msg.sender;
  }

  // This modifier means that only owner can call functions which include that modifier.
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  // This function allows to transfer owner permissions.
  function transferOwnership(address newOwner) onlyOwner public {
    require(newOwner != address(0));
    OwnershipTransferred(owner, newOwner);
    owner = newOwner;
  }

}

// Create contract called "MintableToken" which inherit from BasicToken and Ownable contracts.
contract MintableToken is BasicToken, Ownable {
    
  event Mint(address indexed to, uint256 amount);

  // Function which allows to issue our tokens.
  function mint(address _to, uint256 _amount) public returns (bool) {
    totalSupply = totalSupply.add(_amount);
    balances[_to] = balances[_to].add(_amount);
    Mint(_to, _amount);
    return true;
  }
  
}

// Contract which contains name, symbol and decimals of our token.
contract SimpleTokenCoin is MintableToken {
    
    string public constant name = "Simple Coin Token";
    
    string public constant symbol = "SCT";
    
    uint32 public constant decimals = 18;
    
}

// The last contract is Crowdsale. It's our ICO.
contract Crowdsale {
    
    address owner;
    
    // Let's creat our token.
    SimpleTokenCoin public token = new SimpleTokenCoin();
    
    /*
    All ICO has period of sale.
    We'll nedd to define two variables.
    The first is the start of ICO. 
    We have to write time in seconds from first january nineteen seventy.
    */
    uint start = 1500379200;
    // And set period of 300 days.
    uint period = 300;
    
    // This cunstructor which define who is the owner of ICO.
    function Crowdsale() {
        owner = msg.sender;
    }
    
    //End last function is our crowdsale.
    function() external payable {
        // Check start and end of contract.
        require(now > start && now < start + period*24*60*60);
        // Transfer ethereum to contract owner.
        owner.transfer(msg.value);
        // And send tokens to address.
        token.mint(msg.sender, msg.value);
    }
    
}
