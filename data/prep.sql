-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: remotemysql.com    Database: qJAFjFrDlh
-- ------------------------------------------------------
-- Server version	8.0.13-4

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
-- Table structure for table `config`
--
CREATE DATABASE qJAFjFrDlh;
USE qJAFjFrDlh;
DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `API_gateway` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Browser_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Usernames` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `API_gateway_UNIQUE` (`API_gateway`),
  UNIQUE KEY `Browser_type_UNIQUE` (`Browser_type`),
  UNIQUE KEY `Usernames_UNIQUE` (`Usernames`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` (`id`, `API_gateway`, `Browser_type`, `Usernames`) VALUES (1,'http://localhost:5000/users/',NULL,NULL),(2,NULL,'Chrome',NULL),(3,NULL,'Firefox',NULL),(4,NULL,NULL,'Mark'),(5,NULL,NULL,'Mindy'),(6,NULL,NULL,'Mallory'),(7,NULL,NULL,'Matisiyahu'),(8,NULL,NULL,'Malcolm'),(9,NULL,NULL,'Melvin'),(10,NULL,NULL,'Marco'),(11,NULL,NULL,'Molly'),(12,NULL,NULL,'Michael'),(13,NULL,NULL,'Mike'),(14,NULL,NULL,'Mitnick'),(15,NULL,NULL,'Mordechai'),(16,NULL,NULL,'Mussles');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `creation_date` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`user_id`, `user_name`, `creation_date`) VALUES (1,'John McAvoy','2021-01-17 16:11:42'),(2,'Long John Silver','2021-01-17 15:45:48'),(3,'Cruela DVile','2021-01-17 16:14:31'),(5,'Kim','2021-01-23 17:23:10'),(10,'Changed Changingto','2021-01-18 14:16:27'),(11,'Buzz Lightyear','2021-01-18 13:53:59');
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

-- Dump completed on 2021-02-28 19:57:20
