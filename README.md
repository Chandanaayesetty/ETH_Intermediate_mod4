# DegenToken

DegenToken is a smart contract built on the Ethereum blockchain using Solidity. It implements a custom ERC20 token with additional functionality for token burning, token locking, and ownership management. This token can be used in various applications, including gaming, where token locking and burning might be essential features.

## Features

- **ERC20 Standard Compliance**: DegenToken follows the ERC20 token standard, ensuring compatibility with various wallets and exchanges.
- **Ownership**: The contract includes ownership management, allowing the owner to mint new tokens.
- **Burnable Tokens**: Users can burn their tokens, reducing the total supply.
- **Token Transfer**: Users can transfer tokens to other addresses.
- **Token Approval**: Users can approve tokens for specific addresses, allowing contracts to transfer tokens on their behalf.
- **Token Locking**: Users can lock their tokens for a specified duration. Locked tokens cannot be transferred until the lock period expires.
- **Token Unlocking**: After the lock period expires, users can unlock their tokens and transfer them freely.
- **Locked Token Information**: Users can check the amount of tokens locked and the unlock time for any address.

## Functions

1. **mint**: Allows the owner to mint new tokens.
2. **transferTokens**: Allows users to transfer tokens to other addresses.
3. **approveTokens**: Allows users to approve tokens for a specific address.
4. **transferFromTokens**: Allows an approved address to transfer tokens on behalf of the user.
5. **lockTokens**: Allows users to lock tokens for a specified duration (in seconds).
6. **unlockTokens**: Allows users to unlock their tokens after the lock period has expired.
7. **getLockedTokens**: Allows users to check the amount of tokens locked and their unlock time for a specific address.

## Getting Started

### Prerequisites

- [Node.js](https://nodejs.org/)
- [npm](https://www.npmjs.com/)
- [Truffle](https://www.trufflesuite.com/truffle)
- [Ganache](https://www.trufflesuite.com/ganache)

### Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/Chandanaayesetty/ETH_Intermediate_mod4/tree/main
    ```
2. Navigate to the project directory:
    ```sh
    cd DegenToken
    ```
3. Install the dependencies:
    ```sh
    npm install
    ```

### Deployment

1. Start Ganache:
    ```sh
    ganache-cli
    ```
2. Compile the smart contracts:
    ```sh
    truffle compile
    ```
3. Migrate the smart contracts to the local blockchain:
    ```sh
    truffle migrate
    ```

### Testing

Run the tests to ensure the smart contract behaves as expected:

```sh
truffle test
```

## Usage

### Minting Tokens

The owner can mint new tokens to a specified address.

### Transferring Tokens

Users can transfer tokens to other addresses using the `transferTokens` function.

### Approving Tokens

Users can approve a specific amount of tokens for an address, allowing that address to spend the tokens on their behalf.

### Locking Tokens

Users can lock a specified amount of tokens for a certain duration. The tokens will be transferred to the contract and cannot be moved until the lock period expires.

### Unlocking Tokens

Once the lock period expires, users can unlock their tokens and transfer them as needed.

### Checking Locked Tokens

Users can check the amount of tokens locked and the unlock time for any address using the `getLockedTokens` function.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
