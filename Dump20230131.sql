-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: giame
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `party`
--

DROP TABLE IF EXISTS `party`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `party` (
  `id` int NOT NULL,
  `winner` int DEFAULT NULL,
  `date` timestamp NOT NULL,
  `max_player` int NOT NULL,
  `tipe_game` varchar(20) NOT NULL,
  `state` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `party`
--

LOCK TABLES `party` WRITE;
/*!40000 ALTER TABLE `party` DISABLE KEYS */;
/*!40000 ALTER TABLE `party` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stadistics`
--

DROP TABLE IF EXISTS `stadistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stadistics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `losses` int NOT NULL,
  `victories` int NOT NULL,
  `hours` double NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`,`user_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_stadistics_user_idx` (`user_id`),
  CONSTRAINT `fk_stadistics_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadistics`
--

LOCK TABLES `stadistics` WRITE;
/*!40000 ALTER TABLE `stadistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `stadistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token` (
  `id` int NOT NULL,
  `token` varchar(200) DEFAULT NULL,
  `caducity` timestamp NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`,`user_id`),
  KEY `fk_token_user1_idx` (`user_id`),
  CONSTRAINT `fk_token_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turn`
--

DROP TABLE IF EXISTS `turn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turn` (
  `id` int NOT NULL,
  `info` varchar(200) NOT NULL,
  `party_id` int NOT NULL,
  `user_id` int NOT NULL,
  `end` tinyint NOT NULL,
  `next_turn_id` int NULL,
  `num_turn` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_turno_party1_idx` (`party_id`),
  KEY `fk_turno_user1_idx` (`user_id`),
  KEY `fk_turn_turn1_idx` (`next_turn_id`),
  CONSTRAINT `fk_turn_turn1` FOREIGN KEY (`next_turn_id`) REFERENCES `turn` (`party_id`),
  CONSTRAINT `fk_turno_party1` FOREIGN KEY (`party_id`) REFERENCES `party` (`id`),
  CONSTRAINT `fk_turno_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turn`
--

LOCK TABLES `turn` WRITE;
/*!40000 ALTER TABLE `turn` DISABLE KEYS */;
/*!40000 ALTER TABLE `turn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `description` varchar(240) DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `user_UNIQUE` (`user`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (4,'Maamoeg','Manuel@gmail.com','1234',NULL,NULL,NULL,NULL),(5,'Rapago','Ramon@gmail.com','2345',NULL,NULL,NULL,NULL),(6,'Jujogova','Juanjo@gmail.com','4567',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_has_party`
--

DROP TABLE IF EXISTS `user_has_party`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_has_party` (
  `user_id` int NOT NULL,
  `party_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`party_id`),
  KEY `fk_user_has_party_party1_idx` (`party_id`),
  KEY `fk_user_has_party_user1_idx` (`user_id`),
  CONSTRAINT `fk_user_has_party_party1` FOREIGN KEY (`party_id`) REFERENCES `party` (`id`),
  CONSTRAINT `fk_user_has_party_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_party`
--

LOCK TABLES `user_has_party` WRITE;
/*!40000 ALTER TABLE `user_has_party` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_has_party` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-10 15:52:00
