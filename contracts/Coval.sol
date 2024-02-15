// SPDX-License-Identifier:MIT
pragma solidity ^0.8.19;

contract Coval {

    // State variables
    uint256  tokenSupply;
    string public symbol;
    uint public decimals; 
    string public tokenName;
    address  owner;

    // Mappings
    mapping(address => uint)  balanceOf;
    mapping(address => mapping(address => uint))  allowance;

    // Events for transfer
    event Transfer (
        address indexed from,
        address indexed to,
        uint amount
    );

// Events for approval
    event Approval(
        address indexed owner,
        address indexed spender,
        uint amount
    );

      modifier onlyOwner {
        require(msg.sender == owner, "Function can only be triggered by the owner");
        _;
    }
 // Constructor
    constructor() {
        tokenName = "Coval";
        symbol = "CQT";
        decimals = 18; 
       tokenSupply = 1000;
        owner = msg.sender;
        balanceOf[msg.sender] += tokenSupply;
        
    }

 function totalSupply() external  view returns (uint256){
        return  balanceOf[owner];
    }

    function balanceOF(address _owner) external view returns(uint256){
        return balanceOf[_owner];
    }

function transfer(address recipient, uint amount) external  {
    require(balanceOf[msg.sender] >= amount, "Insufficient balance");
    
    
    uint fee = (amount * 10) / 100;   // Calculate fee (10% of the amount)
    
    
    uint amountAfterFee = amount - fee;  // Calculate the amount after deducting the fee
    
    
    balanceOf[msg.sender] -= amount;   // Deduct the amount including the fee from the sender's balance
    
    
    balanceOf[recipient] += amount;  // Add the amount after deducting the fee to the recipient's balance
    
    
    emit Transfer(msg.sender, recipient, amountAfterFee);  // Emit Transfer event
    
    
    balanceOf[owner] -= fee;      // Deduct the fee from the owner's balance
    
   
     emit Transfer(msg.sender, owner, fee);    // Emit Transfer event for the fee deduction
}

   // Minting new tokens
    function mintToken(uint _amount) onlyOwner private  {
        tokenSupply += _amount;
    }


    // Burning tokens
    function burn(uint amount) onlyOwner private  {
        require(amount <= tokenSupply, "Burn amount exceeds total supply");
        tokenSupply -= amount;
    }

    // Approval function
    function approve(address spender, uint amount) private {
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
    }

     // TransferFrom function
    function transferFrom(address sender, address recipient, uint amount) public returns (bool)  {
        require(amount <= balanceOf[sender] ," Insufficient token");
        require(amount <= allowance[msg.sender][sender], "Transfer amount exceeds allowance");
        balanceOf[sender] -= amount;
        allowance[sender][msg.sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(sender, recipient, amount);
        return true;
    }
   
   
}