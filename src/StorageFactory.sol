// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18; // we are suppose to use 0.8.24 but ^ symbol means that we can use version greater than 0.8.18

import {SimpleStorage} from "./Simplestorage.sol"; // it is the same as copying the code from Simplestorage2 and pasting inbetween pragma and contract

contract StorageFactory {
    // we do have a way of writing a variable i.e "type visibility name" just as we did in number(7)

    SimpleStorage[] public listOfSimpleContracts; // SimpleStorage is type, public is visibilty and simpleStorage is name
        // assuming we have many Simplestorage2 contracts we can create a list/array of Simplestorage contracts by creating variable `listOfSimpleStorageContracts`

    // to create a function that can deploy or craete simpleStorage contract
    // function createSimpleStorageContract () public {
    // simpleStorage = new SimpleStorage(); // the 'new' is telling solidity to deploy a new contract for SimpleStorage

    //We can then modify the function `createSimpleStorageContract`, pushing the newly deployed contract to this variable
    function createSimpleStorageContract() public {
        //to create a new simpleStoageContract from storageFactory contract(no 7) and it's possible because we are importing from SimpleStorage2
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleContracts.push(newSimpleStorageContract);
    }

    //StorageFactory can interact with the deployed contracts by calling their `store` function. To do this we need to create a `sfStore` to store a new number one the simpleStorage usind the index in our array
    function sfstore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
        // for it to interact with the contract we need Address and ABI(Application Binary Interface)
        listOfSimpleContracts[_simpleStorageIndex].store(_newSimpleStorageNumber);
    }

    //We can then retrieve/read the stored value with a _get_ function
    function sfget(uint256 _simpleStorageIndex) public view returns (uint256) {
        return listOfSimpleContracts[_simpleStorageIndex].retrieve();
    }
}
