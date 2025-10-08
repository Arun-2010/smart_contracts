
//1.create a twitter contract
//2.create a mapping between user and tweet
//3.add function to create a tweet and save it mapping
//4.create  a fucntion to get tweet
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


//create struct define a tweet with author ,content,timestamp,likes
//add struct to array
//test tweets


contract Twitter{

   struct Tweet{
    address author;
    string content;
    uint256 timestamp;
    uint256 likes;  
   }
   
    mapping(address=>Tweet[]) public tweets;

    function createTweet(string memory _tweet)public{
        Tweet memory newTweet=Tweet({
          author:msg.sender,
          content:_tweet,
          timestamp:block.timestamp,
          likes:0

        });
        tweets[msg.sender].push(newTweet);
    }

    function getTweet(address _owner,uint _i)public view returns(Tweet memory){
        return tweets[_owner][_i];
    }

    function getAllTweets(address _owner)public view returns(Tweet[] memory){
          return tweets[_owner];
   
}
}