// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract structs_tests {
    struct Movie {
        string title;
        uint256 movieId;
    }

    Movie movie;

    // constructor(Movie memory _m) {
    //     movie = _m;
    // }

    function setMovie() public {
        movie = Movie("The Great Redemption", 101);
    }

    function getMovie() public view returns (Movie memory) {
        return movie;
    }
}
