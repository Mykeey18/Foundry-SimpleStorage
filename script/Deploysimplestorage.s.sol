// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {SimpleStorage} from "../src/Simplestorage.sol";

contract DeploySimpleStorage is
    Script // scripts are written to deploy and interact with contracts
{
    function run() external returns (SimpleStorage) {
        vm.startBroadcast(); // anything after this line should be send to the RPC
        SimpleStorage simpleStorage = new SimpleStorage(); // the "new" create a new contractin between 10 and 12
        // the new will send a transaction to create a new simplestorage contract
        vm.stopBroadcast();
        // (cast to-base "hex value" dec ) - help us to convert hex numbers to decimals easily
        return simpleStorage;
    }
    //* **Cast**: interacts with contracts that have been previously deployed.
    //**Forge**: compiles and interacts with our contracts.
    // **Anvil**: deploys a local blockchain, similar to another tool we used, Ganache
    // forge --init :reating a new Foundry project
    //`Cast send` to make transactions, then `Cast call` to read from those contracts
}
