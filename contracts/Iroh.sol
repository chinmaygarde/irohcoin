// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Iroh is ERC20 {
  address payable public immutable iroh;

  constructor() ERC20("Iroh", "IROH") {
    iroh = payable(msg.sender);
  }

  function mint(address account, uint256 value) public {
    require(msg.sender == iroh, "Only Iroh can mint.");
    _mint(account, value);
  }
}
