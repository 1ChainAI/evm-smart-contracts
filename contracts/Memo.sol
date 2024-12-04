// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.24;

import "@openzeppelin/contracts/access/AccessControl.sol";

contract MemoContract is AccessControl {

    bytes32 public constant ADMIN_ROLE = keccak256("ADMIN_ROLE");
    bytes32 public constant MEMO_ROLE = keccak256("MEMO_ROLE");

    event MemoSent(uint256 indexed memoId, address indexed sender, uint64 timestamp, string message);

    uint256 memoCounter;

    constructor() {
        _grantRole(DEFAULT_ADMIN_ROLE, _msgSender());
        _grantRole(ADMIN_ROLE, _msgSender());
    }

    function sendMemo(string memory _message) external onlyRole(MEMO_ROLE) {
        emit MemoSent(memoCounter++, _msgSender(), uint64(block.timestamp), _message);
        renounceRole(MEMO_ROLE, _msgSender());
    }

    function setMemoRole(address newSender) external onlyRole(ADMIN_ROLE) {
        grantRole(MEMO_ROLE, newSender);
    }
}