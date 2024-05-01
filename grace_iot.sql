-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: iot
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `grace_device`
--

DROP TABLE IF EXISTS `grace_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grace_device` (
  `device_uid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`device_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grace_device`
--

LOCK TABLES `grace_device` WRITE;
/*!40000 ALTER TABLE `grace_device` DISABLE KEYS */;
INSERT INTO `grace_device` VALUES (1,'Sandra'),(2,'Allie'),(3,'Sarah'),(4,'Grace'),(5,'Alice'),(6,'Eden');
/*!40000 ALTER TABLE `grace_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grace_temperature_record`
--

DROP TABLE IF EXISTS `grace_temperature_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grace_temperature_record` (
  `id` int NOT NULL AUTO_INCREMENT,
  `temperature` int DEFAULT NULL,
  `device_ref` int NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `device_ref` (`device_ref`),
  CONSTRAINT `grace_temperature_record_ibfk_1` FOREIGN KEY (`device_ref`) REFERENCES `grace_device` (`device_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grace_temperature_record`
--

LOCK TABLES `grace_temperature_record` WRITE;
/*!40000 ALTER TABLE `grace_temperature_record` DISABLE KEYS */;
INSERT INTO `grace_temperature_record` VALUES (11,37,3,'2022-10-20 18:47:16'),(12,37,4,'2022-10-20 18:47:16'),(13,37,2,'2022-10-20 18:47:16'),(14,37,6,'2022-10-20 18:47:16'),(15,37,1,'2022-10-20 18:47:16'),(16,37,5,'2022-10-20 18:47:50');
/*!40000 ALTER TABLE `grace_temperature_record` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-21  7:59:01
