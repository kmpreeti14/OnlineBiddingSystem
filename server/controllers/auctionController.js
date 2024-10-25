const Auction = require('../models/auctionModel');

exports.getAllAuctions = (req, res) => {
  Auction.getAll((err, results) => {
    if (err) return res.status(500).send(err);
    res.send(results);
  });
};

exports.createAuction = (req, res) => {
  Auction.create(req.body, (err, result) => {
    if (err) return res.status(500).send(err);
    res.status(201).send(result);
  });
};

exports.getAuctionById = (req, res) => {
  Auction.getById(req.params.id, (err, result) => {
    if (err) return res.status(500).send(err);
    res.send(result);
  });
};

exports.updateAuction = (req, res) => {
    const {title,description, starting_bid, end_date,image} = req.body
    const auction =  {
    title,
    description, 
    starting_bid,
    end_date,
    image,   }
  Auction.update(req.params.id,auction, (err, result) => {
    if (err) return res.status(500).send(err);
    res.send(result);
  });
};

exports.deleteAuction = (req, res) => {
  Auction.delete(req.params.id, (err, result) => {
    if (err) return res.status(500).send(err);
    res.send(result);
  });
};

exports.placeBid = (req, res) => {
    const { auction_id, user_id, bid_amount } = req.body;
    const bid = {
        auction_id,
        user_id,
        bid_amount,
        created_at: new Date(), // Set created_at to current date and time
      };
    Auction.createBid(bid, (err, result) => {
        if (err) return res.status(500).send(err);
        Auction.getHighestBid(auction_id, (err, highestBid) => {
            if (err) {
              return res.status(500).send(err);
            }
            // If the new bid is higher than the current highest bid, update the auction
            if (bid_amount > highestBid) {
              Auction.updateHighestBid(auction_id, bid_amount, (err) => {
                if (err) {
                  return res.status(500).send(err);
                }
                res.status(201).send({ success: true, message: 'Bid placed and auction updated!' });
              });
            } else {
              res.status(201).send({ success: true, message: 'Bid placed but not the highest bid.' });
            }
          });
    });
  };

  exports.getBidHistory = (req, res) => {
    const auctionId = req.params.id; // Get auction_id from request parameters

    // Assuming you have a method in your Auction model to fetch bid history
    Auction.getBidHistory(auctionId, (err, bids) => {
        if (err) {
            return res.status(500).send(err); // Handle error
        }
        if (bids.length === 0) {
            return res.status(200).send({ message: 'No bids found for this auction.' });
        }
        res.status(200).send(bids); // Send bids as response
    });
};

exports.getAuctionByUser = (req, res) => {
  const userId = req.params.id;
  Auction.getAuctionByUser(userId, (err, auction) => {
    if (err) {
      return res.status(500).send(err);
    }
    if (!auction) {
      return res.status(404).send({ message: 'No auction found for this user.' });
    }
    res.status(200).send(auction);
  });
};