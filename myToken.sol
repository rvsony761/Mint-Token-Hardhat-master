// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Token {

    
    string public tokenname = "Rohit ";
    string public tokensymbol = "Roh";
    uint8 public Decimals = 18;
    uint256 public totalSupply;
    address public tokenowner;

  constructor() {
    tokenowner = msg.sender;
  }

  mapping(address => uint256) public balances;

  //function that are used to mint the token from a particular address
  function mint(address to, uint256 amount) public {
    require(msg.sender == tokenowner, "tokens are only minted by ower");
    require(amount > 0, "greater that Zero must specify");

    balances[to] += amount;
    totalSupply += amount;
  }

  //function that are used to burn the token from a particular address
  function burn(address from, uint256 amount) public {
    require(amount <= balances[from], "balances are exceded by total amount present");

    balances[from] -= amount;
    totalSupply -= amount;
  }

  //function that are used to transfer the token from a particular address
  function transfer(address to, uint256 amount) public {
    require(amount <= balances[msg.sender], "balances are exceded by total amount present");
    balances[msg.sender] -= amount;
    balances[to] += amount;
  }
}