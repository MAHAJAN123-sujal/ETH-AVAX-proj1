Certainly! Here is the updated README file for your new contract:

# ETH_AVAX_proj1

This contract implements a basic token transfer mechanism where the owner of the contract can transfer tokens to other addresses. It also includes functions for depositing and withdrawing tokens with conditions checked using `require`, `assert`, and `revert` statements.

## Description

The `ETH_AVAX_proj1` contract is a simple implementation of a token management system on the Ethereum blockchain. It includes the following functionalities:

- An initial token balance assigned to the contract owner.
- A method for depositing tokens.
- A method for the owner to transfer tokens to other addresses.
- A method for the owner to withdraw tokens.
- A mapping to keep track of token balances for each address.

## Contract Details

The `ETH_AVAX_proj1` smart contract is written in Solidity and includes the following key components:

### State Variables

- `address public owner`: Stores the address of the contract owner.
- `uint tokens`: Initial token balance set to 100.
- `mapping(address => uint) public addressToBalance`: A mapping to keep track of token balances for each address.

### Constructor

The constructor initializes the contract by setting the owner and assigning the initial token balance:

```solidity
constructor(){
    owner = msg.sender;
    addressToBalance[msg.sender] = tokens;
}
```

### Deposit Function with assert

The `deposit` function allows users to deposit a specified amount of tokens into their account, using `assert` to ensure the balance is correctly updated:

```solidity
function deposit(uint256 _amount) public {
    uint256 previousBalance = addressToBalance[msg.sender];
    addressToBalance[msg.sender] += _amount;

    // Using assert to ensure the balance is correctly updated
    assert(addressToBalance[msg.sender] == previousBalance + _amount);
}
```

### Transfer Function with require

The `transfer` function allows the owner to transfer tokens to another address, using `require` statements for validation:

```solidity
function transfer(address _to, uint _amount) public {
    require(owner == msg.sender, "Can't make transaction");
    require(addressToBalance[owner] >= _amount, "Insufficient balance");
    addressToBalance[owner] -= _amount;
    addressToBalance[_to] += _amount;
}
```

### Withdraw Function with assert and revert

The `withdraw` function allows the owner to withdraw tokens, using `assert` to check ownership and `revert` for validation:

```solidity
function withdraw(uint _amount) public {
    // Using assert to ensure only the owner can withdraw
    assert(owner == msg.sender);
    if (addressToBalance[owner] >= _amount) {
        addressToBalance[owner] -= _amount;
    } else {
        // Using revert to revert the transaction in case of insufficient balance
        revert("Insufficient Balance to withdraw money");
    }
}
```

## Deployment

To deploy the `ETH_AVAX_proj1` smart contract, we can use Remix IDE.

### Using Remix

1. Open [Remix](https://remix.ethereum.org/).
2. In the Contracts folder, create a new file and paste the contract code into the editor.
3. Compile the contract using Ctrl+S.
4. Deploy the contract to the desired Ethereum network.

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.

## Authors

Sujal Mahajan

## Contributing

Contributions are welcome! Feel free to submit changes or improvements.

---

This README provides a comprehensive guide to understanding, deploying, and using the `ETH_AVAX_proj1` smart contract.
