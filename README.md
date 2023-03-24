# ScalingETH2023

Project SCALE is a standardized smart contract access logic designed for EVM-compatible blockchains. The project aims to simplify the development and deployment of smart contracts across multiple blockchain platforms by providing a flexible and extensible protocol that defines a set of standard functions and interfaces for requesting access to specific resources or performing privileged operations.

To achieve this, Project SCALE leverages the Molecule protocol, which provides anti-money laundering (AML) functionality that is updated by the Molecule oracle. Developers and smart contract owners can deploy their own Molecule Core smart contract and plug in necessary Logic Contracts that consist of an allowlist or blocklist, which can restrict access to a function based on the sender's credentials.

As an example, a demo smart contract named "Subscription.sol" has been created for the SCALE project, which is plugged into the Molecule Address AML smart contract. This smart contract checks for sanctioned addresses under each country, with the country code determined by the UN statistics country code (e.g., US 840). The Subscription smart contract has a require statement that calls check() with the msg.sender of the function to ensure that access is granted only to authorized parties. Custom molecule Address core contracts deployed by developers can also be integrated with Logic Contracts to gate the functions of the Subscription smart contract.

The Molecule Address smart contract for general sanctions and user-defined Molecule Address custom core contracts have been deployed on several L2 EVMs such as Polygon Mumbai, Scroll EVM, Base EVM, Filecoin EVM, and finally, the Goerli testnet. Gas prices for all the EVM transactions have been compared, and it has been observed that scaling Ethereum-based L2 for the Molecule protocol-based SCALE project can be leveraged with L1 security. This can help handle a huge set of data, data handling, access lists, and custom logic in L2.

To provide an in-depth comparison, a table has been prepared to highlight the details of the gas prices for different EVMs used in the project. Overall, the use of the Molecule protocol and the scalability of L2 EVMs make the SCALE project a promising solution for simplifying the development and deployment of smart contracts across multiple blockchain platforms while improving security and interoperability.


## Comparison 

| EVM | Batch count | Transaction Gas Amount | Gas price | Cost |
| --- | --- | --- | --- | --- |
| Goerli | 511 |  999,026  | 195.268257805 Gwei | 0.200000 ETH  |
| Scroll | 511 | 979,116  | 50 Gwei  | 0.0489558 ETH  |
| Base | 511 | 999,026  | 50 Gwei | 0.05485969674721 ETH |
| Polygon mumbai | 511 | 999,026 | 50 Gwei | 0.0499513 MATIC|
| Filecoin | 511 |      8,141,912  |      100 attoFIL  | 0.0254191 FIL  |


The comparison table shows the number of transactions, batch count, transaction gas amount, gas price, and cost for different EVMs, including Goerli, Scroll, Base, Polygon Mumbai, and Filecoin.

From the table, we can see that the number of transactions in Ethereum L1 (Goerli) is significantly higher compared to other EVMs such as Scroll, Base, and Polygon Mumbai. However, the cost of transactions in Ethereum L1 is also higher.

This highlights the potential benefits of using a powerful L2 solution like the Molecule-based access control for the SCALE project. With the help of L2 solutions, we can handle a large number of transactions efficiently, and also save costs in the process.

Moreover, the Molecule-based access control can be applicable for more complex logic beyond a simple subscription app. By using this access control logic, we can enhance security by restricting access to certain functionalities based on predefined rules, and also ensure compliance with AML regulations. This can be particularly useful in industries such as finance, healthcare, and government, where data security and regulatory compliance are of utmost importance.



## Deplyment details 

## Goerli 

### General sanction updated by Molecule oracle

- Molecule Address AML contract :[0x08988259F08876e26Bd356D4207a340d2BFd76f4](https://goerli.etherscan.io/address/0x08988259F08876e26Bd356D4207a340d2BFd76f4)

- Molecule Logic Address US sanction list : [0x3EEe2631Ce8bD11879DedBCAbA96a0aC3b730bfc](https://goerli.etherscan.io/address/0x3EEe2631Ce8bD11879DedBCAbA96a0aC3b730bfc) ----  ID : 840

- Molecule Logic Address UK sanction list : [0xe9d451ec88B4503219D889B3415eDAeAeE406E3D](https://goerli.etherscan.io/address/0xe9d451ec88B4503219D889B3415eDAeAeE406E3D) ---- ID : 826

Molecule Logic Address China sanction list : [0x2Bd642FED344D36272306b6aE0F1c9104479e217](https://goerli.etherscan.io/address/0x2Bd642FED344D36272306b6aE0F1c9104479e217) ----- ID : 156

Molecule Logic Address Russia sanction List : [0xF1AD957f2846c1050e61582b01CEff1A7f74dD7D](https://goerli.etherscan.io/address/0x2Bd642FED344D36272306b6aE0F1c9104479e217) ---- ID : 643


### Custom AllowList details 

Molecule Address Custom Allowlist contract : [0xCac17b1e829D03676FA8046b8ac3e31F8790d97B](https://goerli.etherscan.io/address/0xCac17b1e829D03676FA8046b8ac3e31F8790d97B)

Logic Address user Allowlist contract :  [0x05139F63F7EcEf8EFF61E6933A8408c2ddC287f9](https://goerli.etherscan.io/address/0x05139F63F7EcEf8EFF61E6933A8408c2ddC287f9)

Subscription App contract : [0x445F89C5555eb652b993dbA9f118acDE6C65d5D2](https://goerli.etherscan.io/address/0x445F89C5555eb652b993dbA9f118acDE6C65d5D2)


## Scroll EVM 


### General sanction AML  updated by Molecule oracle

- Molecule Address AML contract : [0x66b85bF393736B38Ae3fD79B14A008008cC7349C](https://blockscout.scroll.io/address/0x66b85bF393736B38Ae3fD79B14A008008cC7349C)

- Molecule Logic Address US sanction list :[0x49C2c9835d00bbfa18d2CA976588F0b12BCD652c](https://blockscout.scroll.io/address/0x49C2c9835d00bbfa18d2CA976588F0b12BCD652c) ---- 840

- Molecule Logic Address UK sanction list :[0x8cba906e8c1E1C4154ca7FFd79aEE1B0c9a904c0](https://blockscout.scroll.io/address/0x8cba906e8c1E1C4154ca7FFd79aEE1B0c9a904c0) ---- 826

- Molecule Logic Address China sanction list : ----- 156

- Molecule Logic Address Russia sanction List : ---- 643


### Custom AllowList details 

- Molecule Address Custom Allowlist contract : [0x073ebeA4186482d1F36BbF97b840391d109EC7cF](https://blockscout.scroll.io/address/0x073ebeA4186482d1F36BbF97b840391d109EC7cF)

- Logic Address user Allowlist contract : [0xe88B431066D3613C6D7f6b0d1Cb8ce64Fd7F367A](https://blockscout.scroll.io/address/0xe88B431066D3613C6D7f6b0d1Cb8ce64Fd7F367A)


- Subscription App contract : [0xd8025d89e9B25582f805Da42c8c58936394EA12F](https://blockscout.scroll.io/address/0xd8025d89e9B25582f805Da42c8c58936394EA12F)



## Polygon Mumbai EVM 


### General sanction AML 

- Molecule Address AML contract : [0x4e394fe5e9237764F2Da3DCE209776Ee2e5f8E74](https://mumbai.polygonscan.com/address/0x4e394fe5e9237764F2Da3DCE209776Ee2e5f8E74)

- Molecule Logic Address US sanction list : [0xCd8d3b8d15475341a343c6552050161d15d5Ae58](https://mumbai.polygonscan.com/address/0xCd8d3b8d15475341a343c6552050161d15d5Ae58) ---- 840

- Molecule Logic Address UK sanction list : [0xfc2F177239711F7B7Db6F87C7D9f6192384A1F80](https://mumbai.polygonscan.com/address/0xfc2F177239711F7B7Db6F87C7D9f6192384A1F80) ---- 826

- Molecule Logic Address China sanction list : ----- 156

- Molecule Logic Address Russia sanction List : ---- 643


### Custom AllowList details 

- Molecule Address Custom Allowlist contract : [0x6ff3F2DAa62e11D6fEC233410d2151948234d496](https://mumbai.polygonscan.com/address/0x6ff3F2DAa62e11D6fEC233410d2151948234d496)

- Logic Address user Allowlist contract : [0x3daD441A8C07eF64AA22e6114c39d690a098783F](https://mumbai.polygonscan.com/address/0x3daD441A8C07eF64AA22e6114c39d690a098783F)



## Base EVM 


### General sanction AML 

- Molecule Address AML contract : [0xa944660A9cc7D77836F44955Afa11b0730699487](https://goerli.basescan.org/address/0xa944660A9cc7D77836F44955Afa11b0730699487)

- Molecule Logic Address US sanction list : [0xBF864B1b8C151C6C5b8ED5104cb6D4a238Edb7B4](https://goerli.basescan.org/address/0xBF864B1b8C151C6C5b8ED5104cb6D4a238Edb7B4) ---- 840

- Molecule Logic Address UK sanction list : [0xf5FCAe2210EFe5B35804ACc11D4Ca34dF8F637C4](https://goerli.basescan.org/address/0xf5FCAe2210EFe5B35804ACc11D4Ca34dF8F637C4) ---- 826

- Molecule Logic Address China sanction list : ----- 156

- Molecule Logic Address Russia sanction List : ---- 643


### Custom AllowList details 

- Molecule Address Custom Allowlist contract : [0x971b3fE9d46f0F54e8C3ab3fdeA5fdfC9d2C5C30](https://goerli.basescan.org/address/0x971b3fE9d46f0F54e8C3ab3fdeA5fdfC9d2C5C30)

- Logic Address user Allowlist contract : [0x46A3C9C08a250AfdaeD679addc50bF61C8F8Be37](https://goerli.basescan.org/address/0x46a3c9c08a250afdaed679addc50bf61c8f8be37)



## File coin EVM 


### General sanction AML 

- Molecule Address AML contract : [0x3d0fBc6CD02Afe1C0887001933125cFe18B3d9F4](https://hyperspace.filfox.info/en/address/0x3d0fBc6CD02Afe1C0887001933125cFe18B3d9F4)

- Molecule Logic Address US sanction list :[0x129D78f1fE1E78b7E2A812a13C1Edb23612D5eC0](https://hyperspace.filfox.info/en/address/0x129D78f1fE1E78b7E2A812a13C1Edb23612D5eC0) ---- 840

- Molecule Logic Address UK sanction list : [0x7861fC9E205F0E06cF32295DeE6cE9f7faf78B9D](https://hyperspace.filfox.info/en/address/0x7861fC9E205F0E06cF32295DeE6cE9f7faf78B9D) ---- 826

- Molecule Logic Address China sanction list : ----- 156

- Molecule Logic Address Russia sanction List : ---- 643


### Custom AllowList details 

- Molecule Address Custom Allowlist contract : [0x66b85bF393736B38Ae3fD79B14A008008cC7349C](https://hyperspace.filfox.info/en/address/0x66b85bF393736B38Ae3fD79B14A008008cC7349C)

- Logic Address user Allowlist contract : [0x49C2c9835d00bbfa18d2CA976588F0b12BCD652c](https://hyperspace.filfox.info/en/address/0x49C2c9835d00bbfa18d2CA976588F0b12BCD652c)






