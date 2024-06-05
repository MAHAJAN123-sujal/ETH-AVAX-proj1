# ETH_AVAX_proj1

This repository contains a Solidity smart contract named ETH_AVAX_proj1. The contract demonstrates a simple token transfer mechanism where the owner of the contract can transfer tokens to other addresses.

## Description

The ETH_AVAX_proj1 contract is a basic implementation of a token transfer system on the Ethereum blockchain. It includes the following functionalities:

- An initial token balance assigned to the contract owner.
- A method for the owner to transfer tokens to other addresses.
- A mapping to keep track of token balances for each address.

## Contract Details

The ETH_AVAX_proj1 smart contract is written in Solidity and includes the following key components:

### State Variables

- address public owner: Stores the address of the contract owner.
- uint tokens: Initial token balance set to 100.
- mapping(address => uint) public addressToBalance: A mapping to keep track of token balances for each address.

### Constructor

The constructor initializes the contract by setting the owner and assigning the initial token balance:

constructor(){ 
    owner = msg.sender; 
    addressToBalance[msg.sender] = tokens; 
}
### Transfer Function with require

The transfer function allows the owner to transfer tokens to another address, using require statements for validation:

function transfer(address _to,uint _amount) public{ 
    require(owner == msg.sender,"Can't make transaction"); 
    require(addressToBalance[owner]>=_amount,"Insufficient balance"); 
    addressToBalance[owner] -= _amount; 
    addressToBalance[_to] += _amount; 
}
### Transfer Function with assert and revert

An alternative implementation of the transfer function using assert and revert for validation:

function transfer(address _to,uint _amount) public{ 
    assert(owner == msg.sender); 
    if(addressToBalance[owner]>=_amount){ 
        addressToBalance[owner] -= _amount; 
        addressToBalance[_to] += _amount; 
    } 
    else{ 
        revert("Insufficient Balance"); 
    } 
}
## Deployment

### Prerequisites

To work with this smart contract, you need the following:

- Solidity compiler (version 0.8.7 or higher)
- An Ethereum development environment like Remix, Truffle, or Hardhat.

### Installation

Clone this repository to your local machine:

git clone https://github.com/yourusername/ETH_AVAX_proj1.git
### Compilation

To compile the smart contract, use the Solidity compiler. If you are using Remix, you can simply paste the contract code into the Remix editor and compile it there. If you are using Truffle or Hardhat, follow their respective instructions for compiling contracts.

### Deployment

Deploy the contract using your preferred Ethereum development environment. Here is an example using Truffle:

1. Navigate to your project directory:

cd ETH_AVAX_proj1
2. Create a migration script under migrations/2_deploy_contracts.js:

const ETH_AVAX_proj1 = artifacts.require("ETH_AVAX_proj1");

module.exports = function (deployer) {
  deployer.deploy(ETH_AVAX_proj1);
};
3. Deploy the contract to your local blockchain or any Ethereum testnet:

truffle migrate --network development
## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Authors

- [Your Name](https://github.com/yourusername)

Feel free to add more contributors as needed.

## Contributing

Feel free to submit issues, fork the repository, and send pull requests. For major changes, please open an issue first to discuss what you would like to change.

---

Feel free to customize this README file further to suit your specific needs or preferences.
