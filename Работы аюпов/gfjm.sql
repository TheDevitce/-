-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: utmz
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `access`
--

DROP TABLE IF EXISTS `access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `access` (
  `access_id` int NOT NULL AUTO_INCREMENT,
  `access_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`access_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access`
--

LOCK TABLES `access` WRITE;
/*!40000 ALTER TABLE `access` DISABLE KEYS */;
/*!40000 ALTER TABLE `access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blacklist`
--

DROP TABLE IF EXISTS `blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blacklist` (
  `blacklist_id` int NOT NULL AUTO_INCREMENT,
  `blacklist_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`blacklist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blacklist`
--

LOCK TABLES `blacklist` WRITE;
/*!40000 ALTER TABLE `blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `breakdown`
--

DROP TABLE IF EXISTS `breakdown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `breakdown` (
  `breakdown_id` int NOT NULL AUTO_INCREMENT,
  `breakdown_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`breakdown_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `breakdown`
--

LOCK TABLES `breakdown` WRITE;
/*!40000 ALTER TABLE `breakdown` DISABLE KEYS */;
/*!40000 ALTER TABLE `breakdown` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `blacklist_id` int DEFAULT NULL,
  `namecom` varchar(45) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `inn` varchar(10) DEFAULT NULL,
  `login` varchar(16) DEFAULT NULL,
  `pass` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `blacklist_id` (`blacklist_id`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`blacklist_id`) REFERENCES `blacklist` (`blacklist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inspection`
--

DROP TABLE IF EXISTS `inspection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inspection` (
  `inspection_id` int NOT NULL AUTO_INCREMENT,
  `ordermark_id` int DEFAULT NULL,
  `problem` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`inspection_id`),
  KEY `ordermark_id` (`ordermark_id`),
  CONSTRAINT `inspection_ibfk_1` FOREIGN KEY (`ordermark_id`) REFERENCES `ordermark` (`ordermark_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inspection`
--

LOCK TABLES `inspection` WRITE;
/*!40000 ALTER TABLE `inspection` DISABLE KEYS */;
/*!40000 ALTER TABLE `inspection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `machine`
--

DROP TABLE IF EXISTS `machine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `machine` (
  `machine_id` int NOT NULL AUTO_INCREMENT,
  `typeof_id` int DEFAULT NULL,
  `photo` longblob,
  `nameof` varchar(35) DEFAULT NULL,
  `descrip` varchar(255) DEFAULT NULL,
  `price` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`machine_id`),
  KEY `typeof_id` (`typeof_id`),
  CONSTRAINT `machine_ibfk_1` FOREIGN KEY (`typeof_id`) REFERENCES `typeof` (`typeof_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `machine`
--

LOCK TABLES `machine` WRITE;
/*!40000 ALTER TABLE `machine` DISABLE KEYS */;
/*!40000 ALTER TABLE `machine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `machmark`
--

DROP TABLE IF EXISTS `machmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `machmark` (
  `machmark_id` int NOT NULL AUTO_INCREMENT,
  `ordermark_id` int DEFAULT NULL,
  `machine_id` int DEFAULT NULL,
  `cnt` int DEFAULT NULL,
  `totalcost` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`machmark_id`),
  KEY `ordermark_id` (`ordermark_id`),
  KEY `machine_id` (`machine_id`),
  CONSTRAINT `machmark_ibfk_1` FOREIGN KEY (`ordermark_id`) REFERENCES `ordermark` (`ordermark_id`),
  CONSTRAINT `machmark_ibfk_2` FOREIGN KEY (`machine_id`) REFERENCES `machine` (`machine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `machmark`
--

LOCK TABLES `machmark` WRITE;
/*!40000 ALTER TABLE `machmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `machmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation`
--

DROP TABLE IF EXISTS `operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operation` (
  `operation_id` int NOT NULL AUTO_INCREMENT,
  `operation_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`operation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation`
--

LOCK TABLES `operation` WRITE;
/*!40000 ALTER TABLE `operation` DISABLE KEYS */;
/*!40000 ALTER TABLE `operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordermark`
--

DROP TABLE IF EXISTS `ordermark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordermark` (
  `ordermark_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `stuff_id` int DEFAULT NULL,
  `operation_id` int DEFAULT NULL,
  `state_id` int DEFAULT NULL,
  `ordate` datetime DEFAULT NULL,
  `sadate` datetime DEFAULT NULL,
  PRIMARY KEY (`ordermark_id`),
  KEY `customer_id` (`customer_id`),
  KEY `stuff_id` (`stuff_id`),
  KEY `operation_id` (`operation_id`),
  KEY `state_id` (`state_id`),
  CONSTRAINT `ordermark_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `ordermark_ibfk_2` FOREIGN KEY (`stuff_id`) REFERENCES `stuff` (`stuff_id`),
  CONSTRAINT `ordermark_ibfk_3` FOREIGN KEY (`operation_id`) REFERENCES `operation` (`operation_id`),
  CONSTRAINT `ordermark_ibfk_4` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordermark`
--

LOCK TABLES `ordermark` WRITE;
/*!40000 ALTER TABLE `ordermark` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordermark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repairs`
--

DROP TABLE IF EXISTS `repairs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repairs` (
  `repairs_id` int NOT NULL AUTO_INCREMENT,
  `inspection_id` int DEFAULT NULL,
  `breakdown_id` int DEFAULT NULL,
  `totalcost` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`repairs_id`),
  KEY `inspection_id` (`inspection_id`),
  KEY `breakdown_id` (`breakdown_id`),
  CONSTRAINT `repairs_ibfk_1` FOREIGN KEY (`inspection_id`) REFERENCES `inspection` (`inspection_id`),
  CONSTRAINT `repairs_ibfk_2` FOREIGN KEY (`breakdown_id`) REFERENCES `breakdown` (`breakdown_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repairs`
--

LOCK TABLES `repairs` WRITE;
/*!40000 ALTER TABLE `repairs` DISABLE KEYS */;
/*!40000 ALTER TABLE `repairs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `state_id` int NOT NULL AUTO_INCREMENT,
  `state_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stuff`
--

DROP TABLE IF EXISTS `stuff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stuff` (
  `stuff_id` int NOT NULL AUTO_INCREMENT,
  `access_id` int DEFAULT NULL,
  `post` varchar(25) DEFAULT NULL,
  `fio` varchar(100) DEFAULT NULL,
  `passport` varchar(10) DEFAULT NULL,
  `login` varchar(16) DEFAULT NULL,
  `pass` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`stuff_id`),
  KEY `access_id` (`access_id`),
  CONSTRAINT `stuff_ibfk_1` FOREIGN KEY (`access_id`) REFERENCES `access` (`access_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stuff`
--

LOCK TABLES `stuff` WRITE;
/*!40000 ALTER TABLE `stuff` DISABLE KEYS */;
/*!40000 ALTER TABLE `stuff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typeof`
--

DROP TABLE IF EXISTS `typeof`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `typeof` (
  `typeof_id` int NOT NULL AUTO_INCREMENT,
  `typeof_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`typeof_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typeof`
--

LOCK TABLES `typeof` WRITE;
/*!40000 ALTER TABLE `typeof` DISABLE KEYS */;
/*!40000 ALTER TABLE `typeof` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-06 21:31:26
