const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const User = require('../models/userModel');

// Register a new user
exports.registerUser = (req, res) => {
  const { email, password, username} = req.body;
  const hashedPassword = bcrypt.hashSync(password, 10);
  const newUser = { email, password: hashedPassword,username };

  User.register(newUser, (err, result) => {
    if (err) return res.status(500).send(err);
    res.status(201).send({ message: 'User registered successfully' });
  });
};

// Login user
exports.loginUser = (req, res) => {
    const { email, password } = req.body;
  
    User.login(email, (err, user) => {
      if (err) return res.status(500).send(err);
  
      if (!user) {
        return res.status(404).send('User not found'); // Changed to 404
      }
      // Check if the password matches
      if (!bcrypt.compareSync(password, user[0].password)) {
        return res.status(401).send('Invalid credentials');
      }
  
      // Generate a JWT token if authentication is successful
      const token = jwt.sign({ id: user[0].id }, 'secret', { expiresIn: '1h' });
      
      // Send both token and user details in the response
      res.send({ token, user: user[0] }); 
    });
  };

exports.getBidsByUser = (req, res) => {
  const userId = req.params.userId;

  User.getBidsByUser(userId, (err, bids) => {
    if (err) {
      return res.status(500).send(err);
    }
    if (!bids.length) {
      return res.status(404).send({ message: 'No bids found for this user.' });
    }
    res.status(200).send(bids);
  });
};


  

