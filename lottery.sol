// The SPDX-License-Identifier specifies the license under which this contract is distributed.
// SPDX-License-Identifier: MIT

// This pragma statement specifies the Solidity compiler version range that is compatible with this contract.
pragma solidity >=0.7.0 <0.9.0;

// Declares the Lottery contract.
contract Lottery {
    // entities - manager, players, and winner
    // Declares a state variable 'manager' of type 'address' which will store the address of the manager of the contract.
    address public manager;
    // Declares a dynamic array 'players' that will store the addresses of participants. 'payable' indicates that these addresses can receive Ether.    
    address payable[] public players;
    // Declares a state variable 'winner' of type 'address payable' which will store the address of the winner of the lottery.    
    address payable public winner;

    // The constructor is a special function that initializes the contract. Here, it sets the 'manager' variable to the address of the contract deployer.
    constructor() {
        manager = msg.sender;
    }

    // Declares a public function 'participate' that allows anyone to participate by sending Ether.
    function participate() public payable {
        // Requires that the sender has sent exactly 10 wei, otherwise the function will revert with the given error message.
        require(msg.value == 10 wei, "Please pay 10 wei only");
        // Adds the sender's address to the 'players' array, converting it to a 'payable' address.
        players.push(payable(msg.sender));
    }

    // Declares a public view function 'getBalance' that returns the current balance of the contract.
    function getBalance() public view returns(uint) {
        // Requires that the sender is the manager; otherwise, the function will revert with the given error message.
        require(manager == msg.sender, "You are not the manager");
        // Returns the balance of the contract using 'address(this)' and '.balance'.
        return address(this).balance;
    }

    // Declares an internal view function 'random' that generates a pseudo-random number.
    function random() internal view returns(uint) {
        // Generates a random number using the hash of block properties and the current number of players.
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players.length)));
    }

    // Declares a public function 'pickWinner' that allows the manager to pick a winner.
    function pickWinner() public {
        // Requires that the sender is the manager; otherwise, the function will revert with the given error message.
        require(manager == msg.sender, "You are not the manager");
        // Requires that there are at least 3 players; otherwise, the function will revert with the given error message.
        require(players.length >= 3, "Players are less than 3");
        // Generates a random number 'r' using the 'random' function.
        uint r = random();
        // Computes an index within the range of the 'players' array based on 'r'.
        uint index = r % players.length;
        // Sets the 'winner' to the address at the computed index.
        winner = players[index];
        // Transfers the contract's balance to the winner's address.
        winner.transfer(getBalance());
        // Initializes the 'players' array as an empty array, effectively resetting it.
        players = new address payable[](0);
    }
}

/*
Important Keywords and Functions of Solidity that are used in above code:
contract: In Solidity, the "contract" keyword is used to declare the start of a smart contract's definition. It is followed by the name of the contract (in this case, "Lottery") and a set of curly braces {} that enclose the contract's code and state variables.
A Solidity contract typically includes state variables, functions, and modifiers. State variables represent the contract's state, functions define the behavior and logic of the contract, and modifiers provide access control and restrictions on function execution.
Contracts serve as the building blocks of decentralized applications (DApps) on the Ethereum blockchain. They allow developers to create self-contained, autonomous programs that can interact with other contracts and manage assets in a trustless and transparent manner.    
address: Data type used to store Ethereum addresses.
address payable: A type of address that can receive Ether and is used for storing participant addresses and the winner's address.
constructor(): Special function that is executed only once during contract deployment. It initializes contract state variables.
function participate(): A public function that allows participants to join the lottery by sending Ether. It's marked as payable to receive Ether.
msg.value: A global variable that represents the amount of Ether sent with a transaction.
require(): A statement used to require certain conditions to be met; otherwise, it reverts the transaction. In this code, it checks if the sent Ether is 10 wei and whether the sender is the manager.
function getBalance(): A public view function that retrieves the contract's balance without modifying state.
address(this): Refers to the current contract's address.
.balance: Retrieves the balance of an address or contract.
function random(): An internal view function that generates a pseudo-random number based on block data and the number of players.
block.difficulty: A built-in variable representing the difficulty of the current block.
block.timestamp: A built-in variable representing the timestamp of the current block.
players.length: Retrieves the number of participants in the lottery.
function pickWinner(): A public function that allows the manager to select a winner and transfer the contract's balance to them.
winner.transfer(): A method to transfer Ether from the contract to the "winner" address.
new address payable: Initializes the "players" array as a new empty array of type "address payable." This effectively clears the array, removing all previous participants.
keccak256(): A cryptographic hash function used to generate a hash value from the input data. In this code, it's used to create randomness by hashing together several pieces of data like block.difficulty, block.timestamp, and players.length.
abi.encodePacked(): A function used to encode data in a tightly packed format for hashing. It concatenates and encodes multiple values into a single byte array.
view: A function state mutability keyword. Functions marked as "view" indicate that they do not modify the contract's state. They can only read data and are used for querying the blockchain. In the code, getBalance() is marked as "view" because it only retrieves the balance without modifying state.
pure: Similar to "view," the "pure" keyword indicates that a function does not read or modify the contract's state. It is typically used for functions that perform computations and return values based solely on their input parameters. There are no "pure" functions in the provided code.
internal: A visibility modifier for functions and state variables. Functions marked as "internal" can only be accessed within the current contract and derived contracts. The random() function is marked as "internal" to restrict access to within the contract.
public: A visibility modifier for functions and state variables. Functions marked as "public" can be accessed from outside the contract. In the code, various functions like participate(), getBalance(), and pickWinner() are marked as "public" to allow external interaction with the contract.
*/

/*
Working of keccak256 and abi.encode with simple English examples:
keccak256:
keccak256 is a cryptographic hash function used in Ethereum to create a unique, fixed-size string (a hash) from any input data.
It takes the input data and processes it through a complex mathematical algorithm, resulting in a unique 256-bit (64-character) hexadecimal hash.
This hash is typically used for creating randomness or securely verifying the integrity of data.
Simple Example: Imagine you have a magic blender that can turn any combination of fruits into a unique smoothie. If you put in apples, bananas, and oranges, the blender produces a specific, unique smoothie that can't be replicated with the same ingredients in a different order. Similarly, keccak256 takes input data and produces a unique hash.
abi.encode:
abi.encode is a function used to encode data for use on the Ethereum blockchain, especially for passing data to and from smart contracts.
It takes multiple input values, encodes them in a specific format, and produces a single byte array.
This encoding ensures that data is structured in a way that the Ethereum Virtual Machine (EVM) can understand and interpret it correctly.
Simple Example: Think of sending a package with different items inside. To ensure the package is correctly assembled and understood by the recipient, you put each item in a specific order and wrap them all together. abi.encode is like the process of arranging and wrapping items before sending them, so they can be easily unwrapped and used on the other end.
In the provided code:
keccak256(abi.encodePacked(block.difficulty, block.timestamp, players.length)) is using abi.encodePacked to combine and encode the values of block.difficulty, block.timestamp, and players.length. Then, keccak256 is used to create a unique hash from this encoded data. This hash is used to generate randomness for picking a winner in the lottery contract.
*/

/*
Smart Contract: A self-executing, automated computer program that runs on a blockchain and enforces predefined rules and logic without the need for intermediaries.
MetaMask: A popular Ethereum wallet and browser extension that allows users to manage their Ethereum accounts, interact with decentralized applications (DApps), and securely store cryptocurrency.
Sepolia: Sepolia is a Proof-of-Stake (PoS) testnet. It was named after a neighborhood in Athens, Greece, where one of the Ethereum developers grew up. Currently, Sepolia is the recommended default testnet for smart contract development.
The Sepolia testnet is a proof-of-stake (PoS) testnet where Ethereum application developers can test their smart contracts without having to spend real ETH tokens.
*/

/*
Difference between Sepolia Testnet and Sepolia Faucet:
A Sepolia testnet faucet serves devs or anyone with an Ethereum address to obtain Sepolia ETH. Essentially, it is used to get test coins and allows developers to pay for transactions on the Sepolia testnet. This supports dapp and smart contract devs' ability to perform tests in an Ethereum-like environment.
*/

/*
What is Faucet and Testnet with an example?
Faucet:
In the context of cryptocurrencies and blockchain networks, a "faucet" is a service or application that provides free tokens or cryptocurrency to users. Faucets are often used for testing and experimentation, as well as for distributing small amounts of cryptocurrency to new users for educational purposes or to bootstrap a network.
Faucets typically dispense a small amount of cryptocurrency to user addresses without requiring payment. They are commonly used on testnets to help developers and users acquire test tokens for testing smart contracts and applications.
Example: Imagine you are a developer working on a blockchain-based game, and you need test tokens to simulate in-game purchases and interactions. You visit a testnet faucet website, enter your testnet wallet address, and request some test tokens. The faucet then sends you a small amount of test cryptocurrency (e.g., test Ether on the Ethereum Rinkeby testnet) to your address. You can use these tokens to test your game's functionality without spending real money.
Testnet:
A "testnet" is a separate blockchain network that is nearly identical to the mainnet (the live or production blockchain) but is used for testing and development purposes. It allows developers and users to experiment with blockchain applications and smart contracts without using real cryptocurrency.
Testnets provide a sandbox environment where you can interact with the blockchain, create and test smart contracts, and perform transactions without the financial risks associated with the mainnet. Testnet tokens, often obtained from faucets, have no real-world value and are used exclusively for testing.
Example: Suppose you are building a decentralized application (DApp) that allows users to trade digital collectibles. Before deploying your DApp to the Ethereum mainnet, you deploy and test it on the Ethereum Ropsten testnet. You acquire test Ether from a faucet on the Ropsten testnet, use it to perform transactions and smart contract interactions, and ensure that your DApp functions correctly. This way, you can identify and fix any issues or bugs before launching on the mainnet, where real Ether is involved.
*/

/*
What is Consensus Algorithm PoS with an example?
Consensus Algorithm: Proof of Stake (PoS)
In a blockchain network, a consensus algorithm is a method used to agree on the state of the blockchain and validate transactions. Proof of Stake (PoS) is one such algorithm, and it works differently from the more commonly known Proof of Work (PoW) algorithm, which is used in Bitcoin.
How PoS Works with a Real-Life Example:
Imagine you and your friends are planning a weekend camping trip. You need to decide who should be the leader and make important decisions for the group. In a PoS-style decision-making process:
Ownership of Resources: Each friend needs to own some camping gear, like tents, cooking equipment, or hiking boots. The more gear they own, the more "stake" they have in the camping trip's success. This gear represents their "stake" in the decision-making process.
Selecting the Leader: Instead of competing in a race (like in PoW), you and your friends decide to select the leader based on their stake in camping gear. The friend with the most camping gear is chosen as the leader for this trip.
Decision-Making: As the leader, this friend is responsible for making decisions during the trip, such as where to set up camp, what to cook, and when to go hiking. Their decisions should be in the best interest of the group because they have a significant stake in the success of the trip.
Validation of Decisions: The group trusts the leader's decisions because they have a lot to lose (their valuable camping gear) if they make bad choices. If the leader makes good decisions and the trip goes smoothly, everyone benefits, and their camping gear retains its value.
In this camping trip analogy:
"Stake" represents the ownership of resources (in a blockchain, it's the cryptocurrency held by participants).
The friend with the most camping gear (the highest stake) is like a validator in a PoS blockchain network.
Validators are responsible for proposing and validating blocks of transactions, and they are incentivized to act honestly because they have a significant stake (cryptocurrency) at risk.
PoS reduces the energy and computational power needed for decision-making (compared to PoW), as the decision is based on ownership and not on solving complex puzzles.
Overall, PoS encourages participants to act in the best interest of the network because they have something valuable (their cryptocurrency stake) to lose if they act maliciously. This way, blockchain transactions can be validated and added to the blockchain without the need for energy-intensive mining, making PoS more energy-efficient.

Stake: Ownership of a cryptocurrency or digital assets in a Proof of Stake (PoS) blockchain network, representing a participant's influence or control over the network's decision-making.
Gear: Physical camping equipment, such as tents, cooking gear, or hiking boots, symbolizing a participant's "stake" in the leadership decision for a camping trip in a PoS-style selection process.
*/

/*
What is PoW with an example?
PoW (Proof of Work):
PoW is a consensus algorithm used in blockchain networks where participants, known as miners, solve complex mathematical puzzles (proof of work) to validate transactions and add blocks to the blockchain.
Example: Miners compete to solve math problems, and the first one to solve it gets to add a new block of transactions to the blockchain and is rewarded with cryptocurrency (e.g., Bitcoin) for their efforts.
*/