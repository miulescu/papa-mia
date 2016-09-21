-- MySQL dump 10.13  Distrib 5.5.52, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: my_first_schema
-- ------------------------------------------------------
-- Server version	5.5.52-0ubuntu0.14.04.1

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
-- Table structure for table `Adrese`
--

DROP TABLE IF EXISTS `Adrese`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Adrese` (
  `idAdrese` int(11) NOT NULL,
  `adr_strada` varchar(45) DEFAULT NULL,
  `adr_numar` tinyint(4) DEFAULT NULL,
  `adr_phone` varchar(45) DEFAULT NULL,
  `adr_website` varchar(45) DEFAULT NULL,
  `adr_email` varchar(45) DEFAULT NULL,
  `adr_lat` varchar(45) DEFAULT NULL,
  `adr_long` varchar(45) DEFAULT NULL,
  `adr_facebook` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idAdrese`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Adrese`
--

LOCK TABLES `Adrese` WRITE;
/*!40000 ALTER TABLE `Adrese` DISABLE KEYS */;
/*!40000 ALTER TABLE `Adrese` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Categorii`
--

DROP TABLE IF EXISTS `Categorii`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Categorii` (
  `cat_id` int(11) NOT NULL,
  `cat_nume` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categorii`
--

LOCK TABLES `Categorii` WRITE;
/*!40000 ALTER TABLE `Categorii` DISABLE KEYS */;
INSERT INTO `Categorii` VALUES (1,'Starters'),(2,'Specialitatea Bucatarului'),(3,'Cele mai populare'),(4,'Salate'),(5,'Carne'),(6,'Supe'),(7,'Gratare');
/*!40000 ALTER TABLE `Categorii` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Items`
--

DROP TABLE IF EXISTS `Items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Items` (
  `Items_id` int(11) NOT NULL,
  `item_name` varchar(45) DEFAULT NULL,
  `item_descriere` varchar(45) DEFAULT NULL,
  `item_veggie` tinyint(4) DEFAULT NULL,
  `item_img` blob,
  PRIMARY KEY (`Items_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Items`
--

LOCK TABLES `Items` WRITE;
/*!40000 ALTER TABLE `Items` DISABLE KEYS */;
/*!40000 ALTER TABLE `Items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Meniuri`
--

DROP TABLE IF EXISTS `Meniuri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Meniuri` (
  `meniu_id` int(11) NOT NULL,
  `meniu_nume` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`meniu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Meniuri`
--

LOCK TABLES `Meniuri` WRITE;
/*!40000 ALTER TABLE `Meniuri` DISABLE KEYS */;
/*!40000 ALTER TABLE `Meniuri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Restaurante`
--

DROP TABLE IF EXISTS `Restaurante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Restaurante` (
  `id_restaurants` int(11) NOT NULL,
  `nume` varchar(45) DEFAULT NULL,
  `calificativ` decimal(10,0) DEFAULT NULL,
  `logo` blob,
  `Adrese_idAdrese` int(11) NOT NULL,
  PRIMARY KEY (`id_restaurants`,`Adrese_idAdrese`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Restaurante`
--

LOCK TABLES `Restaurante` WRITE;
/*!40000 ALTER TABLE `Restaurante` DISABLE KEYS */;
/*!40000 ALTER TABLE `Restaurante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meniu_categorii_items`
--

DROP TABLE IF EXISTS `meniu_categorii_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meniu_categorii_items` (
  `mci_id` int(11) NOT NULL,
  `meniu_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `Item_id` int(11) NOT NULL,
  `item_price` double NOT NULL,
  `id_restaurant` int(11) NOT NULL,
  PRIMARY KEY (`mci_id`,`cat_id`,`Item_id`,`id_restaurant`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meniu_categorii_items`
--

LOCK TABLES `meniu_categorii_items` WRITE;
/*!40000 ALTER TABLE `meniu_categorii_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `meniu_categorii_items` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-21 11:24:20
