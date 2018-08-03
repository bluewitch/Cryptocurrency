// IronCoin.sol
// "We pay the Iron Price"
//  ~dwulf
// 76 lines of code

// The version of Solidity
pragma solidity ^0.4.19;


// The class of the IronCoin
contract IronCoin {
    
    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) approved;
    
    uint supply;
    
    // ERC-20
    // These 6 functions must be included to be ERC-20 compatable
    
    // The total supply of the available Iron Coin
    function totalSupply() constant returns (uint totalSupply){
        return supply;
    }
    
    
    function balanceOf(address _owner) constant returns (uint balance){
        return balances[_owner];
    }
    
    function transfer(address _to, uint _value) returns (bool success){
        
        if(balances[msg.sender] >= _value && _value > 0){
            
            balances[msg.sender]-=_value;
            balances[_to] += _value;
            
            // Successful Transaction
            return true;
            
        }
        else{
            // Failed Transaction
            return false;
            
        }
    }
    
    function approve(address _spender. uint _value) returns (bool success){
        
        if(balances[msg.sender] >= _value){
            approved[msg.sender][_spender] = _value;
            return true;
        }
        
        return false;
        
    }
    
    function allowance(address _owner, address _spender) constant returns (uint remaining){
        
        return approved[_owner][_spender];
        
    }

    
    // Our own functions not apart of the 6 ERC-20 standard functions
    function mint(uint numberOfCoins){
        balances[msg.sender] += numberOfCoins;
        supply += numberOfCoins;
    }
    
    function getMyBalance() returns (uint){
        return balances[msg.sender];
    }
}// end The class of the IronCoin
