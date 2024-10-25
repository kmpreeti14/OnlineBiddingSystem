const db = require('../config');

const Auction = {
  getAll: (callback) => {
    db.query('SELECT * FROM auctions', callback);
  },
  getById: (id, callback) => {
    db.query('SELECT * FROM auctions WHERE id = ?', [id], callback);
  },
  create: (auction, callback) => {
    db.query('INSERT INTO auctions SET ?', auction, callback);
  },
  update: (id, auction, callback) => {
    console.log(auction);
    db.query('UPDATE auctions SET ? WHERE id = ?', [auction, id], callback);
  },
  delete: (id, callback) => {
    db.query('DELETE FROM auctions WHERE id = ?', [id], callback);
  }
  ,
  createBid:(auction, callback) => {
    db.query('INSERT INTO bids SET ?', auction, callback);
  }
,
  getHighestBid: (id, callback) => {
    db.query(
      'SELECT MAX(bid_amount) AS highestBid FROM bids WHERE auction_id = ?',
      [id],
      (err, results) => {
        if (err) {
          return callback(err);
        }
        const highestBid = results[0].highestBid || 0; 
        callback(null, highestBid);
      }
    );
  },
  updateHighestBid: (id, highest_bid, callback) => {
    db.query(
      'UPDATE auctions SET highest_bid = ? WHERE id = ?',
      [highest_bid, id],
      (err, result) => {
        if (err) {
          return callback(err);
        }
        callback(null, result);
      }
    );
  },
  getBidHistory: (id, callback) => {
    const query = `
        SELECT 
            bids.id AS bid_id,
            bids.bid_amount,
            bids.created_at,
            users.username
        FROM 
            bids
        JOIN 
            users ON bids.user_id = users.id
        WHERE 
            bids.auction_id = ?
        ORDER BY 
            bids.created_at DESC
    `;
    
    db.query(query, [id], (err, results) => {
        if (err) {
            return callback(err); // Handle any query error
        }
        callback(null, results); // Return results to the controller
    });
  },
  getAuctionByUser: (userId, callback) => {
    const query = `
        SELECT 
            auctions.id AS auction_id,
            auctions.title,
            auctions.description,
            auctions.starting_bid,
            auctions.end_date,
            auctions.image,
            bids.id AS bid_id,
            bids.bid_amount,
            bids.created_at AS bid_created_at,
            users.username AS bidder_username
        FROM 
            auctions
        LEFT JOIN 
            bids ON bids.auction_id = auctions.id
        LEFT JOIN 
            users ON bids.user_id = users.id
        WHERE 
            auctions.user_id = ?
        ORDER BY 
            auctions.id ASC, bids.created_at DESC
    `;

    db.query(query, [userId], (err, results) => {
        if (err) {
            return callback(err); // Handle any query error
        }
        callback(null, results); // Return results to the controller
    });
},

  
};

module.exports = Auction;
