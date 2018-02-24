-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: clothingstore
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `imagePath`
--

DROP TABLE IF EXISTS `imagePath`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagePath` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagePath`
--

LOCK TABLES `imagePath` WRITE;
/*!40000 ALTER TABLE `imagePath` DISABLE KEYS */;
INSERT INTO `imagePath` VALUES (1,'./images/plainPants.jpeg'),(2,'./images/plainShirt.jpeg'),(3,'./images/fancyPants.jpeg'),(4,'./images/fancyShirt.jpeg');
/*!40000 ALTER TABLE `imagePath` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'plainShirt'),(4,'fancyShirt'),(5,'plainPants'),(6,'fancyPants');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemImage`
--

DROP TABLE IF EXISTS `itemImage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemImage` (
  `item_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  KEY `fk_item_id_image` (`item_id`),
  KEY `fk_image_id` (`image_id`),
  CONSTRAINT `fk_image_id` FOREIGN KEY (`image_id`) REFERENCES `imagePath` (`image_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_item_id_image` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemImage`
--

LOCK TABLES `itemImage` WRITE;
/*!40000 ALTER TABLE `itemImage` DISABLE KEYS */;
INSERT INTO `itemImage` VALUES (1,2),(4,4),(5,1),(6,3);
/*!40000 ALTER TABLE `itemImage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemPantsSize`
--

DROP TABLE IF EXISTS `itemPantsSize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemPantsSize` (
  `item_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  KEY `fk_item_id` (`item_id`),
  KEY `fk_size_id` (`size_id`),
  CONSTRAINT `fk_item_id_pants` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_size_id_pants` FOREIGN KEY (`size_id`) REFERENCES `pantsSize` (`size_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemPantsSize`
--

LOCK TABLES `itemPantsSize` WRITE;
/*!40000 ALTER TABLE `itemPantsSize` DISABLE KEYS */;
INSERT INTO `itemPantsSize` VALUES (5,1),(5,2),(5,3),(6,1),(6,2);
/*!40000 ALTER TABLE `itemPantsSize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemShirtSize`
--

DROP TABLE IF EXISTS `itemShirtSize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemShirtSize` (
  `item_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  KEY `fk_item_id` (`item_id`),
  KEY `fk_size_id` (`size_id`),
  CONSTRAINT `fk_item_id` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_size_id` FOREIGN KEY (`size_id`) REFERENCES `shirtSize` (`size_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemShirtSize`
--

LOCK TABLES `itemShirtSize` WRITE;
/*!40000 ALTER TABLE `itemShirtSize` DISABLE KEYS */;
INSERT INTO `itemShirtSize` VALUES (1,1),(1,2),(1,3),(4,1),(4,2),(4,3);
/*!40000 ALTER TABLE `itemShirtSize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pantsSize`
--

DROP TABLE IF EXISTS `pantsSize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pantsSize` (
  `size_id` int(11) NOT NULL AUTO_INCREMENT,
  `size_name` int(11) DEFAULT NULL,
  PRIMARY KEY (`size_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pantsSize`
--

LOCK TABLES `pantsSize` WRITE;
/*!40000 ALTER TABLE `pantsSize` DISABLE KEYS */;
INSERT INTO `pantsSize` VALUES (1,30),(2,32),(3,34);
/*!40000 ALTER TABLE `pantsSize` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shirtSize`
--

DROP TABLE IF EXISTS `shirtSize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shirtSize` (
  `size_id` int(11) NOT NULL AUTO_INCREMENT,
  `size_name` char(1) NOT NULL,
  PRIMARY KEY (`size_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shirtSize`
--

LOCK TABLES `shirtSize` WRITE;
/*!40000 ALTER TABLE `shirtSize` DISABLE KEYS */;
INSERT INTO `shirtSize` VALUES (1,'S'),(2,'M'),(3,'L');
/*!40000 ALTER TABLE `shirtSize` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-23 20:12:18
