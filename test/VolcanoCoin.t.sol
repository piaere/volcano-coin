// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {console} from "forge-std/console.sol";
import {stdStorage, StdStorage, Test} from "forge-std/Test.sol";

import "../src/VolcanoCoin.sol";

contract volcanoCoinTest is Test {
    volcanoCoin private volcano;

    uint private expectedSupply = 10000;
    address private owner;
    address private alice;
    address private bob;

    function setUp() public {
        volcano = new volcanoCoin();
        owner = volcano.Owner();
        bob = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
        alice = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
    }

    function testTotalySupply() public {
        uint supply = volcano.totalSupply();
        assertEq(supply, expectedSupply);
        emit log_named_uint("Total supply is", supply);
    }

    function testIncrement() public {
        uint PreviousSupply = volcano.getTotalSupply();
        volcano.increaseTotalSupply();
        uint NewSupply = volcano.getTotalSupply();
        uint increment = NewSupply - PreviousSupply;
        assertEq(increment, 1000);
        emit log_named_uint("Increment is", increment);
    }

    function testOwner() public {
        vm.prank(owner);
        volcano.increaseTotalSupply();
    }

    function testBob() public {
        vm.prank(bob);
        volcano.increaseTotalSupply();
    }

    function testAlice() public {
        vm.prank(alice);
        volcano.increaseTotalSupply();
    }
}
