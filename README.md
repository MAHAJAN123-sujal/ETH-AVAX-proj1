# ETH_AVAX_proj1

This contract implements a simple shop where customers can purchase items, the owner can manage stock, and customers can request refunds. The contract includes functions with conditions checked using `require`, `assert`, and `revert` statements.

## Description

The `shop` contract is a basic implementation of a shop on the Ethereum blockchain. It includes the following functionalities:

- Purchasing items from the shop.
- Adding stock to the shop inventory.
- Requesting refunds for purchased items.
- A mapping to keep track of customer balances.

## Contract Details

The `shop` smart contract is written in Solidity and includes the following key components:

### State Variables

- `address public owner`: Stores the address of the shop owner.
- `uint public stock`: Stores the current stock of items in the shop.
- `uint public itemPrice`: Stores the price of each item in the shop.
- `mapping(address => uint) public balances`: A mapping to keep track of customer balances.

### Constructor

The constructor initializes the contract by setting the owner's address and initializing the stock and item price:

```solidity
constructor(uint initialStock, uint initialPrice) {
    owner = msg.sender;
    stock = initialStock;
    itemPrice = initialPrice; 
}
```

### Modifier

#### `onlyOwner`

The `onlyOwner` modifier restricts access to functions that can only be called by the shop owner:

```solidity
modifier onlyOwner() {
    require(msg.sender == owner, "Only owner can call this function"); 
    _;
}
```

### Functions

#### `purchaseItem`

The `purchaseItem` function allows customers to purchase items from the shop:

```solidity
function purchaseItem() public payable {
    require(stock > 0, "Item is out of stock");

    stock -= 1; 
    balances[msg.sender] += itemPrice; 
}
```

#### `addStock`

The `addStock` function allows the owner to add stock to the shop:

```solidity
function addStock(uint items, uint costPrice) public onlyOwner {
    assert(items > 0); 

    uint totalCost = items * costPrice;
    balances[owner] -= totalCost; 

    stock += items; 
}
```

#### `requestRefund`

The `requestRefund` function allows customers to request refunds for items purchased:

```solidity
function requestRefund() public {
    uint amount = balances[msg.sender];
    if (amount < (itemPrice - 20)) {
        revert("No balance to refund"); 
    }

    balances[msg.sender] -= (itemPrice - 20); 
    stock += 1;
}
```

## Deployment

To deploy the `shop` smart contract, you can use Remix IDE.

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

This README provides a comprehensive guide to understanding, deploying, and using the `shop` smart contract.
