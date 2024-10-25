-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: bidding_system
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auctions`
--

DROP TABLE IF EXISTS `auctions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auctions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `starting_bid` decimal(10,2) DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `highest_bid` decimal(10,2) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auctions`
--

LOCK TABLES `auctions` WRITE;
/*!40000 ALTER TABLE `auctions` DISABLE KEYS */;
INSERT INTO `auctions` VALUES (1,'Vintage Car Auction','Bid on a classic vintage car from the 1950s.',5000.00,'2024-12-01 18:00:00',NULL,'https://www.shutterstock.com/shutterstock/photos/2520883323/display_1500/stock-photo-thessaloniki-greece-february-bmw-x-crossover-car-side-view-isolated-on-white-2520883323.jpg','1'),(2,'Art Collection Auction','Exclusive auction of modern art pieces.',1500.00,'2024-12-10 20:00:00',6005.00,'https://www.shutterstock.com/shutterstock/photos/2475956559/display_1500/stock-photo-grunge-texture-monochrome-retro-grunge-texture-illustration-abstract-background-with-aged-old-2475956559.jpg','1'),(3,'Luxury Watch Auction','Bid on luxury watches from renowned brands.',2000.00,'2024-11-20 19:00:00',2004.00,'https://www.shutterstock.com/shutterstock/photos/2500151059/display_1500/stock-photo-old-watch-vintage-pocket-watch-horology-2500151059.jpg','1'),(4,'Rare Coin Auction','A unique opportunity to own rare coins.',1000.00,'2024-11-15 17:00:00',NULL,'https://www.shutterstock.com/shutterstock/photos/2494841455/display_1500/stock-photo-united-states-gold-coin-two-and-half-dollars-coin-indian-head-gold-quarter-eagle-2494841455.jpg','1'),(5,'Collectible Sneakers Auction','Bid on limited edition sneakers.',300.00,'2024-12-05 16:00:00',NULL,'https://www.shutterstock.com/shutterstock/photos/1176388462/display_1500/stock-photo-mint-snekers-top-view-over-pink-background-1176388462.jpg','1'),(6,'Table','Download the perfect table pictures. Find over 100+ of the best free table images. Free for commercial use ✓ No attributio',4999.97,'2024-10-23 12:13:00',NULL,'https://media.istockphoto.com/id/900257448/photo/wooden-round-table.jpg?s=1024x1024&w=is&k=20&c=hd5ytV27_DYdAtGHZ9t8jS2c99ljM7lJLdYguOIARQI=',NULL),(12,'Chair','chair',50.00,'2024-10-24 22:15:00',51.00,'https://media.istockphoto.com/id/1490325659/photo/armchair.jpg?s=1024x1024&w=is&k=20&c=jevKoxjKNS2wFvToN6D3AJBTmIWxT6WSqV3ICMw5mrs=','13');
/*!40000 ALTER TABLE `auctions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bids`
--

DROP TABLE IF EXISTS `bids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bids` (
  `id` int NOT NULL AUTO_INCREMENT,
  `auction_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `bid_amount` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `auction_id` (`auction_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bids`
--

LOCK TABLES `bids` WRITE;
/*!40000 ALTER TABLE `bids` DISABLE KEYS */;
INSERT INTO `bids` VALUES (1,1,4,5000.00,'2024-10-23 08:53:29'),(2,1,4,5000.00,'2024-10-23 08:54:53'),(3,1,4,50000000.00,'2024-10-23 08:55:26'),(4,1,7,100000.00,'2024-10-23 09:17:13'),(5,1,7,100000.00,'2024-10-23 09:18:47'),(6,1,7,100000.00,'2024-10-23 09:19:21'),(7,1,7,99999999.99,'2024-10-23 09:20:41'),(8,1,7,99999999.99,'2024-10-23 09:22:13'),(9,1,7,99999999.99,'2024-10-23 09:23:00'),(10,1,7,99999999.99,'2024-10-23 09:29:37'),(11,1,7,99999999.99,'2024-10-23 09:31:22'),(12,1,7,99999999.99,'2024-10-23 09:32:32'),(13,3,7,2000.00,'2024-10-23 09:33:11'),(14,3,7,2001.00,'2024-10-23 09:35:54'),(15,1,8,5000.00,'2024-10-23 10:10:19'),(16,1,8,5001.00,'2024-10-23 10:10:28'),(17,1,8,5001.00,'2024-10-23 10:10:34'),(18,1,8,50006.00,'2024-10-23 10:11:16'),(19,1,8,50006.00,'2024-10-23 10:11:41'),(20,3,8,2004.00,'2024-10-23 10:12:00'),(21,2,8,1502.00,'2024-10-23 11:33:41'),(22,2,8,1503.00,'2024-10-24 08:21:18'),(23,2,NULL,6000.00,'2024-10-24 08:27:42'),(24,2,NULL,6004.00,'2024-10-24 08:28:30'),(25,2,10,6005.00,'2024-10-24 13:23:52'),(26,12,13,51.00,'2024-10-24 22:20:59'),(27,12,13,51.00,'2024-10-24 22:22:20');
/*!40000 ALTER TABLE `bids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'kmpreeti','kumaripreeti1412@gmail.com','Test@123'),(2,'Km  Preeti','kmpreeti@gmail.com','$2a$10$fKnDWdyznR2lXZm5AK66Oee33mDusTHFuIiNriJnJIqGoHFYMzPWq'),(3,'richa rau','r@mail.com','$2a$10$tqNEvXd8WbI/PKpYZJD0XugwHs2uV8QKa.unKLkxF1rBNII3XTZbu'),(4,'KM PKK','pk@mail.com','$2a$10$sJCsuQ3tu/ihsYR.qgaB9ux0vLWKQU0G6bnlMrcLf0UdjrjKd9LMa'),(5,'preeti kumari','pkk@mail.com','$2a$10$B9zyI5ZYAm7h7hmLpEVrpeYNwJgSQoiSY7LnGBFNcDzKzUR/OwWLa'),(6,'Krishna SIngh','ks@mail.com','$2a$10$xMijIakKqETLTCZxzYQTVeiwAKw8aWZLflw51MTiCWXYXi3u3DFAu'),(7,'Krishana Kumar','kk@mail.com','$2a$10$Lx9gaBGwJE9Bu6QF1uTrbutyhVpzGRQMTo4sj1uJiLf3RK7gMfYn6'),(8,'Atul k','Ak@mail.com','$2a$10$V163mON3raxAELpjjX4yneOY6zWnQjU3R0zI20DaQjf.Hy6b9uYeG'),(9,'Krishna kk','akk@mail.com','$2a$10$wzeDiF6GlXQi2r9HGYBAHOOHTAUaKm2J4vDv9d0SlpMDQQQK/T00m'),(10,'Pankaj Bhatt','pb@mail.com','$2a$10$Hzx9Ryw2OrAT74rZkUimbepWq5D14moklrCAd7anmL2C2vuxXea36'),(11,'Preeti Kumari','Ak@mail.com','$2a$10$ZUQJBWEebZCmhaDiPlQaT.OITdWdzouWgreBZ6e910vhhpzk2oPy2'),(12,'Preeti Singh','Pkk@gmail.com','$2a$10$R17HnX4XUPYFrAG4w92BBOSPywcXXOI7Wz6jRcSW0eTvHR2GYrO/q'),(13,'kk kk','ppkk@gmail.com','$2a$10$17WIY3fQiP2jm2B1lc.gQOBfsJlYVR2f0xVRkVZbdPb869Sek02P2');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-25 12:15:34
