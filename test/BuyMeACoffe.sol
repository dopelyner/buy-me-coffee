// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/BuyMeACoffee.sol";

contract BuyMeACoffeeTest is Test {

    BuyMeACoffee buyCoffeeContract;

    function setUp() public {
        buyCoffeeContract = new BuyMeACoffee();
    }

    // function testBuyACoffee () public {
    // }
}