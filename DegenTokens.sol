// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {

    struct LockedTokens {
        uint256 amount;
        uint256 unlockTime;
    }

    mapping(address => LockedTokens) private lockedTokens;

    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function transferTokens(address to, uint256 amount) public {
        _transfer(_msgSender(), to, amount);
    }

    function approveTokens(address spender, uint256 amount) public {
        _approve(_msgSender(), spender, amount);
    }

    function transferFromTokens(address from, address to, uint256 amount) public {
        _transfer(from, to, amount);
        uint256 currentAllowance = allowance(from, _msgSender());
        require(currentAllowance >= amount, "ERC20: transfer amount exceeds allowance");
        _approve(from, _msgSender(), currentAllowance - amount);
    }

    function lockTokens(uint256 amount, uint256 lockDuration) public {
        require(balanceOf(_msgSender()) >= amount, "Insufficient balance to lock");
        uint256 unlockTime = block.timestamp + lockDuration;
        require(unlockTime > block.timestamp, "Unlock time must be in the future");
        lockedTokens[_msgSender()].amount += amount;
        lockedTokens[_msgSender()].unlockTime = unlockTime;
        _transfer(_msgSender(), address(this), amount);
    }

    function unlockTokens() public {
        require(block.timestamp >= lockedTokens[_msgSender()].unlockTime, "Tokens are still locked");
        uint256 amount = lockedTokens[_msgSender()].amount;
        require(amount > 0, "No tokens to unlock");
        lockedTokens[_msgSender()].amount = 0;
        lockedTokens[_msgSender()].unlockTime = 0;
        _transfer(address(this), _msgSender(), amount);
    }

    function getLockedTokens(address account) public view returns (uint256, uint256) {
        return (lockedTokens[account].amount, lockedTokens[account].unlockTime);
    }
}
