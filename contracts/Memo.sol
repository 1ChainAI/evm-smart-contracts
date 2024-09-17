// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract MemoContract {
    struct Memo {
        address sender;
        uint256 timestamp;
        string message;
    }

    uint256 public memoCounter;
    mapping(uint256 => Memo) public memos;

    constructor() {
        memoCounter = 0;
    }

    function sendMemo(string memory _message) public {
        memoCounter++;

        memos[memoCounter] = Memo(msg.sender, block.timestamp, _message);
    }
}
