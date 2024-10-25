const express = require('express');
const router = express.Router();
const auctionController = require('../controllers/auctionController');

router.get('/', auctionController.getAllAuctions);
router.post('/', auctionController.createAuction);
router.get('/:id', auctionController.getAuctionById);
router.put('/:id', auctionController.updateAuction);
router.delete('/:id', auctionController.deleteAuction);
router.post('/bid/:id', auctionController.placeBid);
router.get('/bidhistory/:id', auctionController.getBidHistory);
router.get('/my-auctions/:id', auctionController.getAuctionByUser);
module.exports = router;
