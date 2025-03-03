// SPDX-License-Identifier: MIT
pragma solidity >=0.8.1;

contract Subasta{
    address payable public beneficiary;
    uint public auctionEndtime;

    address public highestBidder;
    uint public highestBid;
    bool ended;
    mapping(address=>uint)pendingReturns;

    event highestBidIncreased(address bidder,uint amount);
    event auctionEnded(address winner,uint amount);

    constructor(uint _biddingTime,address payable _beneficiary){
        beneficiary=_beneficiary;
        auctionEndtime=block.timestamp+_biddingTime;
    }

    function bid()public payable{
        if(block.timestamp>auctionEndtime) revert('ya termino papi');
        if(msg.value<=highestBid) revert('cante masalto');

        if(highestBid!=0){
            pendingReturns[highestBidder]+=highestBid;
        }
        highestBidder=msg.sender;
        highestBid=msg.value;
        emit highestBidIncreased(msg.sender, msg.value);
    }

    function withDraw()public  payable returns (bool){
        uint amount = pendingReturns[msg.sender];
        if(amount>0){
            pendingReturns[msg.sender]=0;
        }
        if(!payable(msg.sender).send(amount)){
            pendingReturns[msg.sender]=amount;
        }
        return true;
    }

    function auctionEnd() public{
        if(block.timestamp<auctionEndtime)revert('no termino todavia');
        if(ended) revert("ya termino");
        ended=true;
        emit auctionEnded(highestBidder, highestBid);
        beneficiary.transfer(highestBid);
    }
}