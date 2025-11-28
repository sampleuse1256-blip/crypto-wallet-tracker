// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
 * @title Crypto Wallet Tracker
 * @dev Tracks wallet registrations and simple balance notes for users.
 */
contract Project {

    struct WalletInfo {
        address walletAddress;
        uint256 noteBalance;  // A user-defined balance tracker (not real crypto)
        bool isRegistered;
    }

    mapping(address => WalletInfo) public wallets;

    event WalletRegistered(address indexed wallet);
    event BalanceUpdated(address indexed wallet, uint256 newBalance);

    // Register a wallet in the tracker
    function registerWallet() external {
        require(!wallets[msg.sender].isRegistered, "Wallet already registered");

        wallets[msg.sender] = WalletInfo({
            walletAddress: msg.sender,
            noteBalance: 0,
            isRegistered: true
        });

        emit WalletRegistered(msg.sender);
    }

    // Update the wallet's tracked balance (not real crypto, just user-defined data)
    function updateNoteBalance(uint256 _newBalance) external {
        require(wallets[msg.sender].isRegistered, "Wallet not registered");

        wallets[msg.sender].noteBalance = _newBalance;

        emit BalanceUpdated(msg.sender, _newBalance);
    }

    // Fetch wallet info
    function getWalletInfo(address _wallet) external view returns (WalletInfo memory) {
        return wallets[_wallet];
    }
}
