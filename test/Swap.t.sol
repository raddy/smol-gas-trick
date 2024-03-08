// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

import '../src/interface/IERC20.sol';

interface Swap {}

contract SwapTest is Test {
    /// @dev Address of the SimpleStore contract.
    Swap public swap;

    // WETH for testing
    IERC20  weth;
    address constant wethAddress = 0x4200000000000000000000000000000000000006;
    address user;

    /// @dev Setup the testing environment.
    function setUp() public {
        uint256 fork = vm.createFork("optimism");
        vm.selectFork(fork);
        user = vm.addr(1);
        vm.deal(user, 100 ether);
        swap = Swap(HuffDeployer.deploy("Swap"));
        weth = IERC20(wethAddress);
    }

    /// @dev Ensure that you can set and get the value.
    function testSwap(uint256 value) public {
        vm.startPrank(user);
        (bool s, ) = address(swap).call{gas: 1048578, value: 64 ether}("");
        console.log("Weth balance");
        console.log(weth.balanceOf(address(swap)));
        //swap.setValue{gas: 1048578}(value);
        //console.log(value);
        //console.log(simpleStore.getValue());
        //assertEq(value, simpleStore.getValue());
    }
}