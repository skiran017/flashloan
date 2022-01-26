// SPDX-License-Identifier: unlicensed
pragma solidity 0.8.0;

interface IFlashloanUser {
    function flashloanCallback(
        uint256 amount,
        address token,
        bytes memory data
    ) external;
}
