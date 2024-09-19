// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract SimpleStorage {
    uint256 public favoriteNumber; // The default visibility of the `favoriteNumber` variable is internal unless stated if it is private, public, extrenal or internal

    function store(uint256 _favoriteNumber) public virtual {
        // we add the virtual so that it can be overridable
        favoriteNumber = _favoriteNumber;
    }

    // view, pure
    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }

    // let's talk about array and struct
    uint256[] listOfFavoriteNumbers;
    // In solidity you can create your own favorite list by creating a struct
    struct person {
        uint256 myFavoriteNumber;
        string name;
    }

    // our type is person
    person public michael = person({myFavoriteNumber: 8, name: "michael"}); // when you are working with a custum type you have define on both the right and left side what type it is by adding person on both side
    // Assuming you have a friend you want to add, you can create another person
    person public sarah = person({myFavoriteNumber: 4, name: "sarah"});
    person public love = person({myFavoriteNumber: 9, name: "love"});

    // instead Of typing each of my friend, I can create a list/array(number 18) of persons

    person[] public listOfPeople;

    // The type of array above is a dynamic array; in which you can arbituary number pf people
    // we have static array; in which a number is added inbetween the bracket and what it means is that the listOfPerson is limited to the number added to the bracket

    function addPerson(string memory _name, uint256 _myFavoriteNumber) public {
        // The function "addPerson" is going to take the twovariables(number 20) i.e the name of the person we are going to add and the myFavorite we are going to add
        listOfPeople.push(person(_myFavoriteNumber, _name));
        // Arrays are can be built in with the fn "push" which allows us to add elements or add person to the listOfPeople array

        // to add someone to our mapping (number 47)
        nameToFavoriteNumber[_name] = _myFavoriteNumber;
    }

    // to find any person on the listOfPeople we can use mapping
    mapping(string => uint256) public nameToFavoriteNumber; // if we have a key that we haven't added the default is 0
}
