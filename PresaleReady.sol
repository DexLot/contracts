// SPDX-License-Identifier: None
pragma solidity ^0.8.0;

import "./Ownable.sol";
import "./ERC20.sol";

abstract contract PresaleReady is ERC20, Ownable {
    // This is required to track addresses that are whitelisted from the trade lock & fees
    mapping(address => bool) public whitelisted;
    bool public tradingOpen;

    constructor() {
        whitelisted[msg.sender] = true;
    }

    function setWhitelisted(address addr, bool isWhitelisted) external  onlyOwner {
        whitelisted[addr] = isWhitelisted;
    }

    // This function is deliberately irreversible to prevent the owner from locking trading again.
    function unlockTrading() external onlyOwner {
        require(!tradingOpen, "PresaleReady: TRADING_ALREADY_UNLOCKED");
        tradingOpen = true;
    }

    function _transfer(address from, address to, uint value) internal virtual override {
        require(tradingOpen || whitelisted[from], "PresaleReady: SENDER_NOT_WHITELISTED");

        super._transfer(from, to, value);
    }
}