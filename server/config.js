const mysql = require('mysql2');

// MySQL connection setup
const db = mysql.createConnection({
  host: 'localhost',
  user: 'biduser',
  password: 'password123',  // Replace with your actual DB password
  database: 'bidding_system', // Replace with your actual DB name
});

db.connect(err => {
  if (err) {
    console.error('Error connecting to MySQL:', err);
    return;
  }
  console.log('Connected to MySQL');
});

module.exports = db;
