# PresaleReady Contracts

The PresaleReady contract provide a simple extension to the OpenZepplin standard ERC20 and Ownable contracts, adding the ability to whitelist specific addresses. 
It also initializes such that trading is locked until the owner calls the unlockTrading function. This function is not reversable.

These functions are required for tokens that take fees, or require that tokens are given out before the presale has been finalized.
The PresaleReadyExample file provides an example token that takes a 2% fee on transfer. In this example, the correct process to create a presale would be:
- deploy token
- create presale
- whitelist presale address
- deposit tokens
- wait for contributions
- finalize
- unlock trading
- announce that trading has been unlocked

If you expand on the PresaleReady contract, be sure to check !whitelisted[from] in your transfer function before taking fees. Feel free to check the PresaleReadyExample token.
**You do not have to use these contracts to create a presale.** These files serve to provide an example token that meets the requirements for creating a presale. 
Tokens that do not take fees or do not need to tokens to be distributed before you finalize will not need the functionality provided by these contracts.
However, you are free to use these contracts for any project if you would like to.
