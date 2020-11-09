-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cozimo
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `billinginfo`
--

DROP TABLE IF EXISTS `billinginfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billinginfo` (
  `Bid` int NOT NULL AUTO_INCREMENT,
  `Bdate` date DEFAULT NULL,
  `ccexp` date DEFAULT NULL,
  `ccnum` int DEFAULT NULL,
  `ccID` int DEFAULT NULL,
  `cid` int DEFAULT NULL,
  PRIMARY KEY (`Bid`),
  KEY `fk_cust_id` (`cid`),
  CONSTRAINT `fk_cust_id` FOREIGN KEY (`cid`) REFERENCES `customer` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billinginfo`
--

LOCK TABLES `billinginfo` WRITE;
/*!40000 ALTER TABLE `billinginfo` DISABLE KEYS */;
INSERT INTO `billinginfo` VALUES (1,'2020-11-07','2020-11-07',9,4,4),(12,'2020-11-09','2020-11-21',2020,4,4);
/*!40000 ALTER TABLE `billinginfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `BookID` int NOT NULL AUTO_INCREMENT,
  `BookName` varchar(100) DEFAULT NULL,
  `BookAuthor` varchar(20) NOT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `Rating` float DEFAULT NULL,
  `Book_img` varchar(100) DEFAULT NULL,
  `price` float NOT NULL,
  `quantity` int NOT NULL,
  `CategoryID` int DEFAULT NULL,
  `catID` int DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`BookID`),
  KEY `Cat_book` (`CategoryID`),
  CONSTRAINT `Cat_book` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`categoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'1Q84','amna','athhgfhfg hghfhf fghfghf fghfghf fghf ',3.5,'https://upload.wikimedia.org/wikipedia/en/b/b9/1Q84bookcover.jpg',5.5,26,26,NULL,'avaluable'),(2,'The Divine Comedy','Dante Alighieri','is a long Italian narrative poem by Dante Alighieri, begun',4.5,'https://prodimage.images-bn.com/pimages/9781848588783_p0_v5_s550x406.jpg',20,31,26,NULL,'avaluable'),(3,'Eloquent JavaScript, Second Edition','Marijn Haverbeke','JavaScript lies at the heart of almost every modern web application, from social apps to the newest browser-based games. Though simple for beginners to pick up and play with, JavaScript is a flexible, complex language that you can use to build full-scale applications',5,'https://images-na.ssl-images-amazon.com/images/I/51mvaK65SKL._SX376_BO1,204,203,200_.jpg',20,31,25,NULL,'avaluable'),(4,'Git Pocket Guide','Richard E. Silverman','This pocket guide is the perfect on-the-job companion to Git, the distributed version control system. It provides a compact, readable introduction to Git for new users, as well as a reference to common commands and procedures for those of you with Git experience',5,'https://images-na.ssl-images-amazon.com/images/I/41hZDooM2zL._SX302_BO1,204,203,200_.jpg',20,31,25,NULL,'avaluable'),(5,'Designing Evolvable Web APIs with ASP.NET','Glenn Block, et al','Design and build Web APIs for a broad range of clients—including browsers and mobile devices—that can adapt to change over time. This practical, hands-on guide takes you through the theory and tools you need to build evolvable HTTP services with Microsoft’s ASP.NET Web API framework. In the process, you’ll learn how design and implement a real-world Web API',5,'https://images-na.ssl-images-amazon.com/images/I/51iqz9lKK-L._SX379_BO1,204,203,200_.jpg',20,31,25,NULL,'avaluable'),(6,'Inferno','Dan Brow','Inferno is a 2013 mystery thriller novel by American author Dan Brown and the fourth book in his Robert Langdon series, following Angels & Demons, The Da Vinci Code and The Lost Symbol. The book was published on May 14, 2013, ten years after publication of The Da Vinci Code (2003), by Doubleday.[1] It was number one on the New York Times Best Seller list for hardcover fiction and Combined Print & E-book fiction for the first eleven weeks of its relea',5,'https://upload.wikimedia.org/wikipedia/en/b/bb/Inferno-cover.jpg',20,31,25,NULL,'avaluable'),(7,'Fairy tales','Hans Christian ','A fairy tale is a story, often intended for children, that features fanciful and wondrous characters such as elves, goblins, wizards, and even, but not necessarily, fairies. ... Fairy tales are often tradition',5,'https://images-na.ssl-images-amazon.com/images/I/51wsOt4IGeL._SX348_BO1,204,203,200_.jpg',20,31,25,NULL,'avaluable'),(8,'Unlocking Android','W. Frank Ableson ','Unlocking Android: A Developers Guide provides concise, hands-on instruction for the Android operating system and development tools. This book teaches important architectural concepts in a straightforward writing style and builds on this with practical and useful examples throughout',5,'https://images-na.ssl-images-amazon.com/images/I/51Z8+Z3n6IL._SX397_BO1,204,203,200_.jpg',20,31,25,NULL,'avaluable');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `CHECK_QUANTITY_THEN_CHANGE_STATUES` BEFORE UPDATE ON `books` FOR EACH ROW BEGIN
   if New.quantity =0 
then
set new.status = "sold out";
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cartID` int NOT NULL,
  `numBooks` int DEFAULT '0',
  `totalprice` float DEFAULT NULL,
  `bookID` int DEFAULT NULL,
  PRIMARY KEY (`cartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,NULL,NULL,NULL),(3,2,11,NULL),(4,3,249.5,NULL),(5,0,NULL,NULL),(6,0,NULL,NULL),(7,0,NULL,NULL),(8,0,NULL,NULL),(9,0,NULL,NULL),(10,0,NULL,NULL),(11,0,NULL,NULL),(12,0,NULL,NULL);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_books`
--

DROP TABLE IF EXISTS `cart_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_books` (
  `BookID` int DEFAULT NULL,
  `cartID` int DEFAULT NULL,
  `oid` int DEFAULT NULL,
  KEY `BookID` (`BookID`),
  KEY `cartID` (`cartID`),
  CONSTRAINT `cart_books_ibfk_1` FOREIGN KEY (`BookID`) REFERENCES `books` (`BookID`),
  CONSTRAINT `cart_books_ibfk_2` FOREIGN KEY (`cartID`) REFERENCES `cart` (`cartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_books`
--

LOCK TABLES `cart_books` WRITE;
/*!40000 ALTER TABLE `cart_books` DISABLE KEYS */;
INSERT INTO `cart_books` VALUES (2,4,5),(1,4,5),(5,4,5);
/*!40000 ALTER TABLE `cart_books` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TOTALPRICE_NUMBOOKS_CART` AFTER INSERT ON `cart_books` FOR EACH ROW BEGIN
if (select numBooks from cart where cartID = NEW.cartID) is null 
then
update  cart set numBooks=1 where cartID = NEW.cartID;

ELSEIF (select totalprice from cart where cartID = NEW.cartID) is null
then 
update cart set totalprice =
(select price from books where BookID = NEW.BookID) where cartID = NEW.cartID;

else 
update  cart set numBooks=numBooks+1 where cartID = NEW.cartID;
update cart set totalprice =(select price from books where BookID = NEW.BookID)+totalprice where cartID = NEW.cartID;
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `DEDUCE_BOOKNUM_ON_DELETE` AFTER DELETE ON `cart_books` FOR EACH ROW begin
update  cart set numBooks=numBooks-1 where cartID = old.cartID;
update cart set totalprice =(select price from books where BookID = old.BookID)-totalprice where cartID = old.cartID;
  end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `categoryID` int NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(20) NOT NULL,
  PRIMARY KEY (`categoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (24,'History'),(25,'Science'),(26,'Novel');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cus_orders`
--

DROP TABLE IF EXISTS `cus_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cus_orders` (
  `cid` int DEFAULT NULL,
  `oid` int DEFAULT NULL,
  KEY `cid` (`cid`),
  KEY `oid` (`oid`),
  CONSTRAINT `cus_orders_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `customer` (`cid`),
  CONSTRAINT `cus_orders_ibfk_2` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cus_orders`
--

LOCK TABLES `cus_orders` WRITE;
/*!40000 ALTER TABLE `cus_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `cus_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(20) DEFAULT NULL,
  `lname` varchar(20) DEFAULT NULL,
  `email` varchar(20) NOT NULL,
  `password` char(255) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (4,'amna','jasser','1Q84','$2b$10$WXdi0YsnGBBf/2RwEJ1zyeyyz8HI9VrkPjlSH6fQ/6WDiO3WOdSG6'),(5,'amna','jasser','aj26x@hotmail.com','$2b$10$KUpwsEMvdwOWQ08DMm9eb.AUlQC6cEJUzZWaF78kb3ZvNk.b3WZ0S'),(6,'amna','jasser','aj26x@hotmail.com','$2b$10$aJ2J3AvDQmt14zawyZSdwuclFuLg.wh.HnvRGLbsYXEEmkuB5Q8SW'),(7,'amna','jasser','aj26x@hotmail.com','$2b$10$CA8BfSWL0zPcA27wn1x9ruSmKeQl4P.1FkqlznQbw7.Vt/XBpB0UO'),(8,'amna','jasser','aj26x@hotmail.com','$2b$10$6AjkK9ULrZAe7hhH1hfQ/utZqnh67R7u/Xl5di4lX3n65STzv930.'),(9,'amna','jasser','aj26x@hotmail.com','$2b$10$YFGBuDeMLcfOlIiiMcJE0Omd./WCyRHtwEEceAPjGMvX7D13AXR66'),(10,'amna','jasser','aj26x@hotmail.com','$2b$10$2f2MS8EGdsJHfwgXu4VDM.S7MEfnpRvx9zSBsziaBgcBWfIwHA8dK'),(11,'amna','jasser','aj26x@hotmail.com','$2b$10$cvSQpsSZaMs64NSI9dnKSeMosOOlk0D499L4UYL7gbBJ2PEv0CAMW'),(12,'amna','jasser','amal@hotmail.com','$2b$10$Ul6a7n9PPACtZzE7BGQDPOmDw4iFV4RlltW.Mi73bOO4AQlOq3cdy');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ENTER_CART_WL_ID` AFTER INSERT ON `customer` FOR EACH ROW BEGIN

insert into wishlist(wishlistID) values(new.cid);
insert into cart(cartID) values(new.cid);
insert into customer_info(cid,wishlistID,cartID) values(new.cid,new.cid,new.cid);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `customer_info`
--

DROP TABLE IF EXISTS `customer_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_info` (
  `city` varchar(20) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `phnum` varchar(20) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `postalcoode` varchar(20) DEFAULT NULL,
  `wishlistID` int DEFAULT NULL,
  `cartID` int DEFAULT NULL,
  `cid` int DEFAULT NULL,
  KEY `wishlistID` (`wishlistID`),
  KEY `cartID` (`cartID`),
  CONSTRAINT `customer_info_ibfk_1` FOREIGN KEY (`wishlistID`) REFERENCES `wishlist` (`wishlistID`),
  CONSTRAINT `customer_info_ibfk_2` FOREIGN KEY (`cartID`) REFERENCES `cart` (`cartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_info`
--

LOCK TABLES `customer_info` WRITE;
/*!40000 ALTER TABLE `customer_info` DISABLE KEYS */;
INSERT INTO `customer_info` VALUES ('${newUser.city}','${newUser.address}','${newUser.PhoneNum}','${newUser.country}','000',3,3,3),('kuwait','undefined','0099009900','kuwait','undefined',4,4,4),(NULL,NULL,NULL,NULL,NULL,5,5,5),(NULL,NULL,NULL,NULL,NULL,6,6,6),(NULL,NULL,NULL,NULL,NULL,7,7,7),(NULL,NULL,NULL,NULL,NULL,8,8,8),(NULL,NULL,NULL,NULL,NULL,9,9,9),(NULL,NULL,NULL,NULL,NULL,10,10,10),(NULL,NULL,NULL,NULL,NULL,11,11,11),(NULL,NULL,NULL,NULL,NULL,12,12,12);
/*!40000 ALTER TABLE `customer_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `oid` int NOT NULL AUTO_INCREMENT,
  `odate` date DEFAULT NULL,
  `ccexp` date DEFAULT NULL,
  `cid` int DEFAULT NULL,
  `onum` int DEFAULT NULL,
  `Bid` int DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `fk_cus_order` (`cid`),
  KEY `fk_billing_info` (`Bid`),
  CONSTRAINT `fk_billing_info` FOREIGN KEY (`Bid`) REFERENCES `billinginfo` (`Bid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2020-01-01','2020-01-01',1,1,1),(5,'2020-11-09','2020-11-21',4,NULL,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ADD_OID_AFTER_INSERT_ON_ORDERS` AFTER INSERT ON `orders` FOR EACH ROW begin

update  cart_books set oid=new.oid  where cartID =new.cid;
  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `orders_books`
--

DROP TABLE IF EXISTS `orders_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_books` (
  `BookID` int DEFAULT NULL,
  `oid` int DEFAULT NULL,
  KEY `BookID` (`BookID`),
  KEY `oid` (`oid`),
  CONSTRAINT `orders_books_ibfk_1` FOREIGN KEY (`BookID`) REFERENCES `books` (`BookID`),
  CONSTRAINT `orders_books_ibfk_2` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_books`
--

LOCK TABLES `orders_books` WRITE;
/*!40000 ALTER TABLE `orders_books` DISABLE KEYS */;
INSERT INTO `orders_books` VALUES (1,1),(2,1),(1,1),(2,NULL),(1,NULL),(NULL,1),(2,NULL),(1,NULL),(NULL,1),(2,1),(1,1);
/*!40000 ALTER TABLE `orders_books` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `REDUCE_THEN_CHECK_QUANTITY` AFTER INSERT ON `orders_books` FOR EACH ROW BEGIN
   if (select quantity from books where BookID= new.bookID) >0 
then
update books set quantity = quantity -1
 where books.BookID = New.bookID;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `wishlistID` int NOT NULL,
  `numBooks` int DEFAULT NULL,
  `bookID` int DEFAULT NULL,
  PRIMARY KEY (`wishlistID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (3,NULL,NULL),(4,3,NULL),(5,NULL,NULL),(6,NULL,NULL),(7,NULL,NULL),(8,NULL,NULL),(9,NULL,NULL),(10,NULL,NULL),(11,NULL,NULL),(12,NULL,NULL);
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wl_books`
--

DROP TABLE IF EXISTS `wl_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wl_books` (
  `BookID` int DEFAULT NULL,
  `wishlistID` int DEFAULT NULL,
  KEY `BookID` (`BookID`),
  KEY `wishlistID` (`wishlistID`),
  CONSTRAINT `wl_books_ibfk_1` FOREIGN KEY (`BookID`) REFERENCES `books` (`BookID`),
  CONSTRAINT `wl_books_ibfk_2` FOREIGN KEY (`wishlistID`) REFERENCES `wishlist` (`wishlistID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wl_books`
--

LOCK TABLES `wl_books` WRITE;
/*!40000 ALTER TABLE `wl_books` DISABLE KEYS */;
INSERT INTO `wl_books` VALUES (1,4),(2,4),(3,4);
/*!40000 ALTER TABLE `wl_books` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TOTALPRICE_NUMBOOKS_WL` AFTER INSERT ON `wl_books` FOR EACH ROW BEGIN
if (select numBooks from wishlist where wishlistID = NEW.wishlistID) is null 
then
update  wishlist set numBooks=1 where wishlistID = NEW.wishlistID;

else 
update  wishlist set numBooks=numBooks+1 where wishlistID = NEW.wishlistID;
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `DEDUCE_BOOKNUM_ON_DELETE_WL` AFTER DELETE ON `wl_books` FOR EACH ROW begin

update  wishlist set numBooks=numBooks-1 where wishlistID = old.wishlistID;
  END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'cozimo'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-09 19:28:17
