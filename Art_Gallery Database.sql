-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: art_gallery
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `art_piece`
--

DROP TABLE IF EXISTS `art_piece`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `art_piece` (
  `ART_ID` char(5) NOT NULL,
  `ART_NAME` char(10) NOT NULL,
  `MAT_USED` char(10) NOT NULL,
  PRIMARY KEY (`ART_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `art_piece`
--

LOCK TABLES `art_piece` WRITE;
/*!40000 ALTER TABLE `art_piece` DISABLE KEYS */;
INSERT INTO `art_piece` VALUES ('AR01','WALL_DECOR','WOOD'),('AR02','SCULPTURE','PAPER'),('AR03','SCULPTURE','WOOD'),('AR04','SCULPTURE','METAL'),('AR05','PAINTING','CHARCOAL'),('AR06','SKETCH','GRAPHITE'),('AR07','RING','GOLD');
/*!40000 ALTER TABLE `art_piece` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist` (
  `ARTIST_NAME` char(10) NOT NULL,
  `ARTIST_ID` char(5) NOT NULL,
  `CONTACT_DETAIL` char(20) NOT NULL,
  PRIMARY KEY (`ARTIST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist`
--

LOCK TABLES `artist` WRITE;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;
INSERT INTO `artist` VALUES ('PRAJWAL','AT01','S-10,NAGPUR'),('BRIAN','AT02','P-07,LONDON'),('FRANKLIN','AT03','G-16,LA'),('ROGER','AT04','Q-18,AFRICA'),('MIKE','AT05','I-02,JAPAN');
/*!40000 ALTER TABLE `artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exhibition`
--

DROP TABLE IF EXISTS `exhibition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exhibition` (
  `EXH_DATE` date NOT NULL,
  `EXH_VENUE` char(10) NOT NULL,
  `RULES` char(10) NOT NULL,
  PRIMARY KEY (`EXH_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exhibition`
--

LOCK TABLES `exhibition` WRITE;
/*!40000 ALTER TABLE `exhibition` DISABLE KEYS */;
INSERT INTO `exhibition` VALUES ('2012-09-20','MUMBAI','WATCH+BUY'),('2013-06-17','NAGPUR','WATCH ONLY'),('2014-11-02','GOA','AUCTION'),('2015-04-06','PUNE','BUY'),('2016-02-28','INDORE','WATCH+BUY'),('2018-05-12','JAIPUR','WATCH ONLY');
/*!40000 ALTER TABLE `exhibition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rel_art_piece`
--

DROP TABLE IF EXISTS `rel_art_piece`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rel_art_piece` (
  `ART_ID` char(5) NOT NULL,
  `DATE` date NOT NULL,
  `SEC_NUM` int NOT NULL,
  KEY `ART_ID` (`ART_ID`),
  KEY `SEC_NUM` (`SEC_NUM`),
  KEY `DATE` (`DATE`),
  CONSTRAINT `rel_art_piece_ibfk_1` FOREIGN KEY (`ART_ID`) REFERENCES `art_piece` (`ART_ID`),
  CONSTRAINT `rel_art_piece_ibfk_2` FOREIGN KEY (`SEC_NUM`) REFERENCES `section` (`SEC_NUM`),
  CONSTRAINT `rel_art_piece_ibfk_3` FOREIGN KEY (`DATE`) REFERENCES `exhibition` (`EXH_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rel_art_piece`
--

LOCK TABLES `rel_art_piece` WRITE;
/*!40000 ALTER TABLE `rel_art_piece` DISABLE KEYS */;
INSERT INTO `rel_art_piece` VALUES ('AR01','2012-09-20',1),('AR02','2014-11-02',2),('AR03','2013-06-17',3),('AR04','2016-02-28',4),('AR05','2018-05-12',5),('AR06','2015-04-06',6),('AR07','2012-09-20',2);
/*!40000 ALTER TABLE `rel_art_piece` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rel_artist`
--

DROP TABLE IF EXISTS `rel_artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rel_artist` (
  `ART_ID` char(5) NOT NULL,
  `ARTIST_ID` char(5) NOT NULL,
  KEY `ART_ID` (`ART_ID`),
  KEY `ARTIST_ID` (`ARTIST_ID`),
  CONSTRAINT `rel_artist_ibfk_1` FOREIGN KEY (`ART_ID`) REFERENCES `art_piece` (`ART_ID`),
  CONSTRAINT `rel_artist_ibfk_2` FOREIGN KEY (`ARTIST_ID`) REFERENCES `artist` (`ARTIST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rel_artist`
--

LOCK TABLES `rel_artist` WRITE;
/*!40000 ALTER TABLE `rel_artist` DISABLE KEYS */;
INSERT INTO `rel_artist` VALUES ('AR01','AT01'),('AR02','AT02'),('AR03','AT02'),('AR04','AT03'),('AR05','AT04'),('AR06','AT04'),('AR07','AT05');
/*!40000 ALTER TABLE `rel_artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rel_exhibition`
--

DROP TABLE IF EXISTS `rel_exhibition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rel_exhibition` (
  `SEC_ID` char(5) NOT NULL,
  `VISIT_ID` char(5) NOT NULL,
  `ART_ID` char(5) NOT NULL,
  `ARTIST_ID` char(5) NOT NULL,
  `DATE` date NOT NULL,
  KEY `ART_ID` (`ART_ID`),
  KEY `ARTIST_ID` (`ARTIST_ID`),
  KEY `VISIT_ID` (`VISIT_ID`),
  KEY `DATE` (`DATE`),
  KEY `SEC_ID` (`SEC_ID`),
  CONSTRAINT `rel_exhibition_ibfk_1` FOREIGN KEY (`ART_ID`) REFERENCES `art_piece` (`ART_ID`),
  CONSTRAINT `rel_exhibition_ibfk_2` FOREIGN KEY (`ARTIST_ID`) REFERENCES `artist` (`ARTIST_ID`),
  CONSTRAINT `rel_exhibition_ibfk_3` FOREIGN KEY (`VISIT_ID`) REFERENCES `visitor` (`VST_ID`),
  CONSTRAINT `rel_exhibition_ibfk_4` FOREIGN KEY (`DATE`) REFERENCES `exhibition` (`EXH_DATE`),
  CONSTRAINT `rel_exhibition_ibfk_5` FOREIGN KEY (`SEC_ID`) REFERENCES `security_company` (`COM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rel_exhibition`
--

LOCK TABLES `rel_exhibition` WRITE;
/*!40000 ALTER TABLE `rel_exhibition` DISABLE KEYS */;
INSERT INTO `rel_exhibition` VALUES ('SEC01','VST01','AR01','AT01','2012-09-20'),('SEC01','VST01','AR01','AT01','2012-09-20'),('SEC04','VST04','AR03','AT02','2013-06-17'),('SEC05','VST05','AR04','AT03','2016-02-28'),('SEC05','VST06','AR04','AT03','2016-02-28'),('SEC03','VST07','AR05','AT04','2018-05-12'),('SEC02','VST08','AR06','AT04','2015-04-06'),('SEC04','VST09','AR07','AT05','2012-09-20');
/*!40000 ALTER TABLE `rel_exhibition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rel_section`
--

DROP TABLE IF EXISTS `rel_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rel_section` (
  `SEC_NUM` int NOT NULL,
  `STAFF_ID` char(5) NOT NULL,
  `ART_ID` char(5) NOT NULL,
  KEY `SEC_NUM` (`SEC_NUM`),
  KEY `STAFF_ID` (`STAFF_ID`),
  KEY `ART_ID` (`ART_ID`),
  CONSTRAINT `rel_section_ibfk_1` FOREIGN KEY (`SEC_NUM`) REFERENCES `section` (`SEC_NUM`),
  CONSTRAINT `rel_section_ibfk_2` FOREIGN KEY (`STAFF_ID`) REFERENCES `staff` (`ST_ID`),
  CONSTRAINT `rel_section_ibfk_3` FOREIGN KEY (`ART_ID`) REFERENCES `art_piece` (`ART_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rel_section`
--

LOCK TABLES `rel_section` WRITE;
/*!40000 ALTER TABLE `rel_section` DISABLE KEYS */;
INSERT INTO `rel_section` VALUES (1,'STP01','AR01'),(2,'STP01','AR02'),(3,'STP02','AR03'),(4,'STP02','AR04'),(5,'STP03','AR05'),(6,'STP03','AR06'),(2,'STP01','AR07');
/*!40000 ALTER TABLE `rel_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rel_staff`
--

DROP TABLE IF EXISTS `rel_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rel_staff` (
  `STAFF_ID` char(5) NOT NULL,
  `SEC_NUM` int NOT NULL,
  KEY `SEC_NUM` (`SEC_NUM`),
  KEY `STAFF_ID` (`STAFF_ID`),
  CONSTRAINT `rel_staff_ibfk_1` FOREIGN KEY (`SEC_NUM`) REFERENCES `section` (`SEC_NUM`),
  CONSTRAINT `rel_staff_ibfk_2` FOREIGN KEY (`STAFF_ID`) REFERENCES `staff` (`ST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rel_staff`
--

LOCK TABLES `rel_staff` WRITE;
/*!40000 ALTER TABLE `rel_staff` DISABLE KEYS */;
INSERT INTO `rel_staff` VALUES ('STP01',1),('STP01',2),('STP02',3),('STP02',4),('STP03',5),('STP03',6);
/*!40000 ALTER TABLE `rel_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section` (
  `SEC_NUM` int NOT NULL,
  `FLR_NUM` int NOT NULL,
  PRIMARY KEY (`SEC_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (1,1),(2,1),(3,2),(4,2),(5,3),(6,3);
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `security_company`
--

DROP TABLE IF EXISTS `security_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `security_company` (
  `COM_NAME` char(10) NOT NULL,
  `COM_ID` char(5) NOT NULL,
  `EMP_NUM` int NOT NULL,
  `DEPT` char(10) NOT NULL,
  PRIMARY KEY (`COM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_company`
--

LOCK TABLES `security_company` WRITE;
/*!40000 ALTER TABLE `security_company` DISABLE KEYS */;
INSERT INTO `security_company` VALUES ('CROWN','SEC01',63,'DOGSQUAD'),('KING','SEC02',55,'CAMERA'),('ROCK','SEC03',25,'GUARD_CAM'),('WORLD','SEC04',44,'GUARD'),('STRONGARM','SEC05',21,'CAMERA');
/*!40000 ALTER TABLE `security_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `ST_NAME` char(10) NOT NULL,
  `ST_ID` char(5) NOT NULL,
  `AGE` int NOT NULL,
  PRIMARY KEY (`ST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES ('PRATHAM','STP01',19),('ROHIT','STP02',23),('VARUN','STP03',25);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitor`
--

DROP TABLE IF EXISTS `visitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitor` (
  `NAME` char(10) NOT NULL,
  `VST_ID` char(5) NOT NULL,
  `BOOKING` char(10) NOT NULL,
  PRIMARY KEY (`VST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitor`
--

LOCK TABLES `visitor` WRITE;
/*!40000 ALTER TABLE `visitor` DISABLE KEYS */;
INSERT INTO `visitor` VALUES ('ABHINAV','VST01','COMFIRM'),('ROCHAK','VST02','COMFIRM'),('SHREYASH','VST03','WAITING'),('UJJWAL','VST04','DECLINE'),('SIDDHESH','VST05','COMFIRM'),('RAJ','VST06','WAITING'),('ADARSH','VST07','CONFIRM'),('ANURAG','VST08','WAITING'),('PRANAY','VST09','COMFIRM');
/*!40000 ALTER TABLE `visitor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-13 16:56:12
