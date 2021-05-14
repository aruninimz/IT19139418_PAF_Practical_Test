-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: fund_management
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
-- Table structure for table `fund_application`
--

DROP TABLE IF EXISTS `fund_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fund_application` (
  `Application_ID` varchar(45) NOT NULL,
  `Full_Name` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `Research_category` varchar(45) DEFAULT NULL,
  `purpose` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Application_ID`),
  UNIQUE KEY `Application_ID_UNIQUE` (`Application_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund_application`
--

LOCK TABLES `fund_application` WRITE;
/*!40000 ALTER TABLE `fund_application` DISABLE KEYS */;
INSERT INTO `fund_application` VALUES ('ap002','Aruni Rathnayaka','aruni@gmail.com','0772341234','Medical','Find the  information regarding the disease.');
/*!40000 ALTER TABLE `fund_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funds`
--

DROP TABLE IF EXISTS `funds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funds` (
  `idFunds` varchar(35) NOT NULL,
  `Title` varchar(45) DEFAULT NULL,
  `Relesed_Date` varchar(45) DEFAULT NULL,
  `Expire_Date` varchar(45) DEFAULT NULL,
  `Type_of_Reserch` varchar(100) DEFAULT NULL,
  `Anoucement_type` varchar(100) DEFAULT NULL,
  `Purpose_of_funding` varchar(100) DEFAULT NULL,
  `Applicant_Instruction` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idFunds`),
  UNIQUE KEY `idFunds_UNIQUE` (`idFunds`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funds`
--

LOCK TABLES `funds` WRITE;
/*!40000 ALTER TABLE `funds` DISABLE KEYS */;
INSERT INTO `funds` VALUES ('fu001','Human Fetal Tissue Research','02/04/2020','01/01/2021','Medical','Exclusive','Find the information regarding the disease ','Fill the form with required details before Deadline');
/*!40000 ALTER TABLE `funds` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-23 22:25:58
