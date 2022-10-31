// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {console} from "forge-std/console.sol";
import {stdStorage, StdStorage, Test} from "forge-std/Test.sol";

import "../src/VolcanoCoin.sol";

contract volcanoCoinTest is Test {
    volcanoCoin public volcano;

    function setUp() public {
        volcano = new volcanoCoin();
    }

    uint internal expectedSupply = 10000;

    function testTotalySupply() public {
        assertEq(volcano.totalSupply(), expectedSupply);
    }

    function testIncrement() public {
        volcano.increaseTotalSupply();
        assertEq(volcano.totalSupply(), expectedSupply + 1000);
    }

    function testOwner(address x) public {
        // counter.setNumber(x);
        // assertEq(counter.number(), x);
    }
}
