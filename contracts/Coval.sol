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


   
   
}