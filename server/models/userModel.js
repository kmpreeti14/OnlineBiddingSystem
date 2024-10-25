const db = require('../config');

const User = {
  register: (user, callback) => {
    db.query('INSERT INTO users SET ?', user, callback);
  },
  login: (email, callback) => {
    db.query('SELECT * FROM users WHERE email = ?', [email], callback);
  },
  getBidsByUser :(userId, callback) => {
    db.query(
      'SELECT bids.*, auctions.title,auctions.image,auctions.description,auctions.highest_bid ,auctions.starting_bid, auctions.end_date FROM bids JOIN auctions ON bids.auction_id = auctions.id WHERE bids.user_id = ?',
      [userId],
      (err, results) => {
        if (err) {
          return callback(err);
        }
        callback(null, results);
      }
    );
  }
};

module.exports = User;
