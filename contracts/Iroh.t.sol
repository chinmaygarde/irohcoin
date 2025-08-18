// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import {Iroh} from "./Iroh.sol";
import {Test} from "forge-std/Test.sol";

contract IrohTest is Test {
  Iroh coin;

  address iroh = address(0x1305);
  address alice = address(0xa11ce);

  function setUp() public {
    vm.prank(iroh);
    coin = new Iroh();
  }

  function test_IrohIsOwner() public view {
    assertEq(coin.iroh(), iroh);
  }

  function test_InitialSupplyIsZero() public view {
    assertEq(coin.totalSupply(), 0);
  }

  function test_TryMintingAsNonIroh() public {
    vm.prank(alice);
    vm.expectRevert();
    coin.mint(alice, 1);
  }

  function test_TryMintingAsIroh() public {
    assertEq(coin.totalSupply(), 0);
    vm.prank(iroh);
    coin.mint(alice, 1);
    assertEq(coin.balanceOf(alice), 1);
    assertEq(coin.totalSupply(), 1);
  }

  function test_IrohCanMintForIroh() public {
    assertEq(coin.totalSupply(), 0);
    vm.prank(iroh);
    coin.mint(iroh, 1);
    assertEq(coin.balanceOf(iroh), 1);
    assertEq(coin.totalSupply(), 1);
  }
}
