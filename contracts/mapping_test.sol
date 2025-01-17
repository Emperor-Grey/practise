// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract mapping_test {
    // key-value pairs basically
    // mapping(address => uint256) public myMap;

    // function setAddress(address _addr, uint256 _i) public {
    //     myMap[_addr] = _i;
    // }

    // function getMap(address _addr) public view returns (uint256) {
    //     return myMap[_addr];
    // }

    struct Movie {
        string title;
    }

    mapping(uint256 => Movie) movie;
    mapping(address => mapping(uint256 => Movie)) public userMovie;

    function addMovie(uint256 _movieId, string memory _title) public {
        movie[_movieId] = Movie(_title);
    }

    function getMovies(uint256 _movieId) public view returns (string memory) {
        return movie[_movieId].title;
    }

    function addUserMovie(uint256 _movieId, string memory _title) public {
        userMovie[msg.sender][_movieId] = Movie(_title);
    }

    function getUserMovie(uint256 _movieId)
        public
        view
        returns (string memory)
    {
        return userMovie[msg.sender][_movieId].title;
    }
}
