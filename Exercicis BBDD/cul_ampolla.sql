-- MySQL dump 10.13  Distrib 8.0.1-dmr, for Win64 (x86_64)
--
-- Host: localhost    Database: cul_ampolla
-- ------------------------------------------------------
-- Server version	8.0.1-dmr-log

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
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand` (
  `idBrand` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `supplierId` int(11) NOT NULL,
  PRIMARY KEY (`idBrand`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `supplierId_idx` (`supplierId`),
  CONSTRAINT `supplierId` FOREIGN KEY (`supplierId`) REFERENCES `supplier` (`idSupplier`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Ray-Ban',1),(2,'Oakley',2),(3,'Police',3),(4,'Hawkers',4),(5,'Arnette',5);
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `idCustomer` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `postalAddress` varchar(15) NOT NULL,
  `phone` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  `registryDate` datetime DEFAULT NULL,
  `recomBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCustomer`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Concepció','Dalmau','89089',634534555,'dalmauc@gmail.com','2020-06-01 00:00:00',NULL),(2,'Andrés','Giménez','23423',690879322,'gimeneza@gmail.com','2020-06-06 00:00:00',NULL),(3,'Francesc','López','23455',645094683,'lopezf@hotmail.com','2020-06-08 00:00:00',NULL),(4,'John','Hamilton','98466',689847622,'hjohn@gmail.com','2020-06-10 00:00:00',NULL),(5,'Juan','Lobo','08924',613586586,'loboj@hotmail.com','2020-06-11 00:00:00',1),(6,'Pere','Matas','78983',654647888,'matasp@gmail.com','2020-06-12 00:00:00',NULL),(7,'Mercè','Ginesta','84654',654747891,'ginestam@hotmail.com','2020-06-16 00:00:00',1),(8,'Maria ','Girbau','43255',698745121,'girbaum@gmail.com','2020-06-16 00:00:00',NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `idEmployee` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `dni` varchar(10) NOT NULL,
  `adress` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `postalCode` int(8) DEFAULT NULL,
  PRIMARY KEY (`idEmployee`),
  UNIQUE KEY `dni_UNIQUE` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Marina','González','56589766L','c/ Xiprer, 43','Viladecans','Espanya',8975),(2,'Antoni','Bassols','40345423T','Avinguda Can Sucarrats, 49 3º 2ª','Sant Cugat del Vallés','Espanya',8196),(3,'Dario','Claudio','X7897809E','Avda Electricitat, 8 5º 3º','L\'Hospitalet del Llobregat','Espanya',8298),(4,'Esther','Losada','53434322W','c/ Einstein, 25','Rubí','Espanya',8191);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glasses`
--

DROP TABLE IF EXISTS `glasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `glasses` (
  `idGlasses` int(11) NOT NULL AUTO_INCREMENT,
  `brandId` int(11) NOT NULL,
  `modelName` varchar(45) NOT NULL,
  `gradLeft` varchar(20) NOT NULL,
  `gradRight` varchar(20) NOT NULL,
  `frameType` enum('metal','floating','paste') NOT NULL,
  `frameColor` varchar(20) NOT NULL,
  `glassColor` varchar(20) NOT NULL,
  `price` int(6) NOT NULL,
  PRIMARY KEY (`idGlasses`),
  KEY `brandId_idx` (`brandId`),
  CONSTRAINT `brandId` FOREIGN KEY (`brandId`) REFERENCES `brand` (`idBrand`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glasses`
--

LOCK TABLES `glasses` WRITE;
/*!40000 ALTER TABLE `glasses` DISABLE KEYS */;
INSERT INTO `glasses` VALUES (1,1,'Flyer','0','0','metal','gold','green',100),(2,1,'Trucker','+1,20, -2,15','+2,25, -1,75','floating','red','orange',150),(3,1,'Custom','0','0','floating','green','white',150),(4,2,'Penguin','+2,25, -1,75','+1,50, -2,15','paste','black','yellow',200),(5,2,'Polar','+4,50, -0,75','+0,50, -3,75','paste','white','blue',200),(6,3,'Authority','+1,50, -2,25','+1,20, -2,15','floating','black','black',180),(7,3,'Refrac','+2,50, -0,75','+1,20, -2,15','metal','blue','red',150),(8,4,'Destroy','0','0','paste','yellow','green',120),(9,4,'Ambient','0','0','metal','orange','blue',120),(10,5,'Mountain','+0.20, -2,00','+1,20, -2,15','paste','black','grey',250),(11,5,'Valley','+1,20, -2,15','+1,20, -0,15','paste','white','green',220),(12,5,'Sea','+2,25, -1,75','+1,75, -2,75','floating','black','green',280);
/*!40000 ALTER TABLE `glasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice` (
  `idInvoice` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `customerId` int(11) NOT NULL,
  `employeeId` int(4) NOT NULL,
  PRIMARY KEY (`idInvoice`),
  KEY `customerId_idx` (`customerId`),
  KEY `employeeId_idx` (`employeeId`),
  CONSTRAINT `customerId` FOREIGN KEY (`customerId`) REFERENCES `customer` (`idCustomer`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `employeeId` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`idEmployee`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (1,'2020-06-20 00:00:00',4,1),(2,'2020-06-20 00:00:00',3,2),(3,'2020-06-20 00:00:00',1,3),(4,'2020-06-20 00:00:00',2,4);
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_detail`
--

DROP TABLE IF EXISTS `invoice_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice_detail` (
  `invoice_DetailId` int(12) NOT NULL AUTO_INCREMENT,
  `glassesId` int(11) NOT NULL,
  `amount` int(4) NOT NULL,
  `price` double NOT NULL,
  `invoiceId` int(11) NOT NULL,
  PRIMARY KEY (`invoice_DetailId`),
  KEY `invoiceId_idx` (`invoiceId`),
  KEY `glassesId_idx` (`glassesId`),
  CONSTRAINT `glassesId` FOREIGN KEY (`glassesId`) REFERENCES `glasses` (`idGlasses`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `invoiceId` FOREIGN KEY (`invoiceId`) REFERENCES `invoice` (`idInvoice`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_detail`
--

LOCK TABLES `invoice_detail` WRITE;
/*!40000 ALTER TABLE `invoice_detail` DISABLE KEYS */;
INSERT INTO `invoice_detail` VALUES (1,10,1,250,1),(2,2,1,150,2),(3,11,1,220,2),(4,10,1,250,3),(5,3,1,150,4),(6,8,1,120,4);
/*!40000 ALTER TABLE `invoice_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `idSupplier` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `address` varchar(80) NOT NULL,
  `city` varchar(45) NOT NULL,
  `postalCode` int(8) NOT NULL,
  `country` varchar(25) NOT NULL,
  `phone` int(11) NOT NULL,
  `fax` int(11) NOT NULL,
  `nif` varchar(11) NOT NULL,
  PRIMARY KEY (`idSupplier`),
  UNIQUE KEY `nif_UNIQUE` (`nif`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'American Trades','Avenue Fourth, 68','New York',98654,'United States of America',658963232,7822858,'T9876545R'),(2,'Australian & CO','Road to the Green Valley, 99','Sidney',52646,'Australia',622345899,7654656,'P4324545W'),(3,'Paris Agency Glasses','Rue 13, 55','Paris',74589,'France',897987654,6589879,'N8646846E'),(4,'Tracked Glasses','Avenue Long','Los Angeles',89874,'United States of America',687987687,7894333,'T9879874Y'),(5,'Company of Glasse','Rue Paris, 88','London',98798,'England',654989944,4654968,'L4568999U');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-21 13:38:20
