-- MySQL dump 10.13  Distrib 8.0.20, for Linux (x86_64)
--
-- Host: localhost    Database: new_test_db
-- ------------------------------------------------------
-- Server version	8.0.20

CREATE DATABASE IF NOT EXISTS new_test_db;
use new_test_db;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `As_account`
--

DROP TABLE IF EXISTS `As_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `As_account` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Company_id` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Company_id` (`Company_id`),
  CONSTRAINT `As_account_ibfk_1` FOREIGN KEY (`Company_id`) REFERENCES `As_company` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `As_account`
--

LOCK TABLES `As_account` WRITE;
/*!40000 ALTER TABLE `As_account` DISABLE KEYS */;
INSERT INTO `As_account` VALUES (1,'Prodaction system',1),(2,'Dev system',1);
/*!40000 ALTER TABLE `As_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `As_company`
--

DROP TABLE IF EXISTS `As_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `As_company` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `As_company`
--

LOCK TABLES `As_company` WRITE;
/*!40000 ALTER TABLE `As_company` DISABLE KEYS */;
INSERT INTO `As_company` VALUES (1,'company_A');
/*!40000 ALTER TABLE `As_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `As_project`
--

DROP TABLE IF EXISTS `As_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `As_project` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Account_id` int NOT NULL,
  `Status` tinyint NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Account_id` (`Account_id`),
  CONSTRAINT `As_project_ibfk_1` FOREIGN KEY (`Account_id`) REFERENCES `As_account` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `As_project`
--

LOCK TABLES `As_project` WRITE;
/*!40000 ALTER TABLE `As_project` DISABLE KEYS */;
INSERT INTO `As_project` VALUES (1,'Upgrade',1,1),(2,'Testing',1,0),(3,'Clansing',1,2),(4,'Restore',2,1);
/*!40000 ALTER TABLE `As_project` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-25 17:50:18
