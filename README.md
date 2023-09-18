# SOLIDITY LOTTERY PROJECT: TESTING ON SEPOLIA TESTNET WITH METAMASK

The "Lottery" smart contract is an Ethereum-based lottery system designed to be deployed on the Sepolia testnet using the MetaMask wallet. Participants can join the lottery by sending 10 wei, with the manager 
overseeing the process. The contract features functions for participation, balance checking, and winner selection based on random number generation. It ensures that only the manager can pick a winner and that there 
are at least three participants. The chosen winner receives the contract's balance, and the participant list resets for the next round. The contract demonstrates key blockchain concepts such as participation, 
randomness, and access control, making it suitable for testing on the Sepolia testnet using the MetaMask wallet.

# OUTPUT

# DEPLOYING LOTTERY SMART CONTRACT ON REMIX IDE
Before Deploying on Remix IDE
![op1](https://github.com/Neeraja-Kallamadi/Blockchain_Solidity_Lottery_Smart_Contract_Sepolia_Testnet_Metamask_Wallet/assets/110168775/487c16fc-03b3-4f91-ae24-a2f4dc09bbc1)

After Deploying on Remix IDE, viewing all Public State Variables
![op2](https://github.com/Neeraja-Kallamadi/Blockchain_Solidity_Lottery_Smart_Contract_Sepolia_Testnet_Metamask_Wallet/assets/110168775/e776dbdf-fabe-4338-a26a-6e414616a373)

For Example, lets think three participants are participating in the lottery

Participant - 1 - Entering with an Entry Fee of 10 Wei
![op3](https://github.com/Neeraja-Kallamadi/Blockchain_Solidity_Lottery_Smart_Contract_Sepolia_Testnet_Metamask_Wallet/assets/110168775/95db0197-1b30-4f44-8fd8-fd63f462f58d)

Checking Updated Balance with 10 wei and Participant - 1 Account Address in Players Array[0]
![op4](https://github.com/Neeraja-Kallamadi/Blockchain_Solidity_Lottery_Smart_Contract_Sepolia_Testnet_Metamask_Wallet/assets/110168775/18394b4a-acf6-4380-8249-42ed674365a9)

Participant - 2 - Entering with an Entry Fee of 10 Wei
![op5](https://github.com/Neeraja-Kallamadi/Blockchain_Solidity_Lottery_Smart_Contract_Sepolia_Testnet_Metamask_Wallet/assets/110168775/439f1659-1b71-4771-ba27-5fb110a33bae)

Checking Updated Balance with 20 wei and Participant - 2 Account Address in Players Array[1]
![op6](https://github.com/Neeraja-Kallamadi/Blockchain_Solidity_Lottery_Smart_Contract_Sepolia_Testnet_Metamask_Wallet/assets/110168775/a075d350-8605-4646-831d-736827aaf406)

Participant - 3 - Entering with an Entry Fee of 10 Wei
![op7](https://github.com/Neeraja-Kallamadi/Blockchain_Solidity_Lottery_Smart_Contract_Sepolia_Testnet_Metamask_Wallet/assets/110168775/a11c7984-5ad4-4ea3-8e83-b4ff9dff7671)

Checking Updated Balance with 30 wei and Participant - 3 Account Address in Players Array[2]
![op8](https://github.com/Neeraja-Kallamadi/Blockchain_Solidity_Lottery_Smart_Contract_Sepolia_Testnet_Metamask_Wallet/assets/110168775/4f3f8e93-4707-4f89-a238-64dab7acec48)

Switching to the Contract Owners Account Address to Check Total Balance (by accessing "getBalance()" function) and to Pick the Winner (using "pickWinner()" function)
![op9](https://github.com/Neeraja-Kallamadi/Blockchain_Solidity_Lottery_Smart_Contract_Sepolia_Testnet_Metamask_Wallet/assets/110168775/084951cd-fff9-49d0-af42-c37e93190387)

Viewing Total Balance of "30" in the public state variable getBalance
![op10](https://github.com/Neeraja-Kallamadi/Blockchain_Solidity_Lottery_Smart_Contract_Sepolia_Testnet_Metamask_Wallet/assets/110168775/6190293f-eae9-4c42-bb55-97b6b808f63a)

Viewing Winners Account Address in public state variable winner and as whole balance got tranfered to winners account, Balance is reset to "0"
![op11](https://github.com/Neeraja-Kallamadi/Blockchain_Solidity_Lottery_Smart_Contract_Sepolia_Testnet_Metamask_Wallet/assets/110168775/ff5c5583-6e7a-4529-9b6e-da48e21fcd19)

# DEPLOYING LOTTERY SMART CONTRACT ON SEPOLIA TESTNET USING METATMASK WALLET
Selecting Environment to Deploy Lottery Smart Contract over Sepolia Testnet using Metamask Wallet
![op12](https://github.com/Neeraja-Kallamadi/Blockchain_Solidity_Lottery_Smart_Contract_Sepolia_Testnet_Metamask_Wallet/assets/110168775/caa80b58-378b-4b0a-88d5-aaed4288f739)

View Environment and Address how it looks before deploying
![op13](https://github.com/Neeraja-Kallamadi/Blockchain_Solidity_Lottery_Smart_Contract_Sepolia_Testnet_Metamask_Wallet/assets/110168775/a0be04f5-d11b-47e5-8dcc-e7bb8684a6bf)

To deploy on sepolia testnet, we need to pay some amount of ethers, so viewing that confirmation on metamask wallet
![op14](https://github.com/Neeraja-Kallamadi/Blockchain_Solidity_Lottery_Smart_Contract_Sepolia_Testnet_Metamask_Wallet/assets/110168775/6275ef52-ab01-4f18-ab27-b90f5a9d8ca0)

Transaction Details on Etherscan
![op15](https://github.com/Neeraja-Kallamadi/Blockchain_Solidity_Lottery_Smart_Contract_Sepolia_Testnet_Metamask_Wallet/assets/110168775/fab0a013-a411-4b99-a25e-2730df5d8f25)

Viewing all initial values of public state variables after deploying successfully on sepolia testnet
![op16](https://github.com/Neeraja-Kallamadi/Blockchain_Solidity_Lottery_Smart_Contract_Sepolia_Testnet_Metamask_Wallet/assets/110168775/b397e047-8ea6-4030-ac7b-c95c1f2721b3)

Each browser can have only one metamask wallet, so here for testing purpose, the manager and participants all are same, so same account address is viewed for both manager and all participants
![op17](https://github.com/Neeraja-Kallamadi/Blockchain_Solidity_Lottery_Smart_Contract_Sepolia_Testnet_Metamask_Wallet/assets/110168775/c3e62406-421c-49d2-bbb4-5a4225e9f343)

Confimation page to pay some amount of ethers to participate in lottery
![op18](https://github.com/Neeraja-Kallamadi/Blockchain_Solidity_Lottery_Smart_Contract_Sepolia_Testnet_Metamask_Wallet/assets/110168775/6471c2a1-ec01-4f24-8936-6065a62915d3)

Transaction Details on Etherscan
![op19](https://github.com/Neeraja-Kallamadi/Blockchain_Solidity_Lottery_Smart_Contract_Sepolia_Testnet_Metamask_Wallet/assets/110168775/483c9008-e767-49aa-ab26-40dc93d523df)

For example, lets think five participants have paritcipated in lottery, so now balance of "50" wei can be viewed here
![op20](https://github.com/Neeraja-Kallamadi/Blockchain_Solidity_Lottery_Smart_Contract_Sepolia_Testnet_Metamask_Wallet/assets/110168775/85715fbd-9532-4f7d-a5c4-6d3edaf6c5eb)

Again, we have to pay some amount of ethers, to pickWinner in the lottery, so this is the confirmation page asking to pay
![op21](https://github.com/Neeraja-Kallamadi/Blockchain_Solidity_Lottery_Smart_Contract_Sepolia_Testnet_Metamask_Wallet/assets/110168775/0510469d-97e8-4e11-95f6-d3fea147ddad)

Viewing the winner account address and as winner get all balance ("50" wei here), balance is reset to "0"
![op22](https://github.com/Neeraja-Kallamadi/Blockchain_Solidity_Lottery_Smart_Contract_Sepolia_Testnet_Metamask_Wallet/assets/110168775/0bb7c17d-2afe-470e-aa53-c03c053369d8)
