// SPDX-License-Identifier: unlicensed
pragma solidity 0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./FlashloanProvider.sol";
import "./IFlashloanUser.sol";

contract FlashloanUser is IFlashloanUser {
    function startFlashloan(
        address flashloan,
        uint256 amount,
        address token
    ) external {
        FlashloanProvider(flashloan).executeFlashloan(
            address(this),
            amount,
            token,
            bytes("")
        );
    }

    function flashloanCallback(
        uint256 amount,
        address token,
        bytes memory data
    ) external override {
        //do some arbitrage, liquidation, etc..

        //Reimburse borrowed tokens
        IERC20(token).transfer(msg.sender, amount);
    }
}
