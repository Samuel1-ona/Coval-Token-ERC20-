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

   
}