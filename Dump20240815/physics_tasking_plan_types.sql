-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: 10.106.79.191    Database: physics_tasking
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.22.04.1

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
-- Table structure for table `plan_types`
--

DROP TABLE IF EXISTS `plan_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_types` (
  `plan_type_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `weight` float NOT NULL DEFAULT '1',
  `site_id` int NOT NULL,
  `no_of_plans` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`plan_type_id`),
  KEY `site_id` (`site_id`),
  KEY `idx_plan_type_name_and_site_id` (`site_id`,`name`),
  KEY `idx_plan_type_name` (`name`),
  KEY `idx_site_id` (`site_id`),
  CONSTRAINT `plan_types_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `sites` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_types`
--

LOCK TABLES `plan_types` WRITE;
/*!40000 ALTER TABLE `plan_types` DISABLE KEYS */;
INSERT INTO `plan_types` VALUES (1,'Chestwall (Tangents)',3,68,1),(2,'Chestwall + SC (Tangents)',5,68,2),(3,'Chestwall + SC + IM (Tangents)',6,68,2),(4,'Chestwall + IM (Tangents)',4,68,1),(5,'Breast (Tangents)',3,1,1),(6,'Breast + SC (Tangents)',5,1,2),(7,'Breast + Boost (Tangents)',5,1,2),(8,'Breast + SC + Boost (Tangents)',7,1,3),(9,'Breast + IM (Tangents)',4,1,1),(10,'Breast + SC + IM (Tangents)',6,1,2),(11,'Breast + SC + IM + Boost (Tangents)',8,1,3),(12,'Single Target (VMAT)',2,8,1),(13,'Single Target (VMAT)',2,9,1),(14,'Single Target (VMAT)',3,10,1),(15,'Electrons',1.5,11,1),(16,'Electrons',1.5,12,1),(17,'SBRT',5,13,1),(18,'Two Targets (VMAT)',4,6,1),(19,'Single Target (VMAT)',2,6,1),(20,'Single Target (VMAT)',3,14,1),(21,'Single Target (VMAT)',3,15,1),(22,'SBRT',5,16,1),(23,'Single Target (VMAT)',3,19,1),(24,'Single Target (VMAT)',3,18,1),(25,'Single Target (VMAT)',3,17,1),(26,'Multi-Target (VMAT)',4,4,1),(27,'Multi-Target (VMAT)',5,7,1),(28,'Single Target (VMAT)',3,7,1),(29,'Whole Brain',2,2,1),(30,'Single Target (VMAT)',3,2,1),(31,'SRT',5,2,1),(32,'Single Target (VMAT)',4,21,1),(33,'Single  Target (VMAT)',3,22,1),(34,'Single Target (VMAT)',3,5,1),(35,'Multi-Target (VMAT)',4.5,5,1),(36,'Single Target (VMAT)',3,23,1),(37,'Multi Target (VMAT)',4,23,1),(38,'Multi-Target (VMAT)',4,2,1),(39,'Single Target (VMAT)',3,24,1),(40,'Bilateral Neck (VMAT)',4,25,1),(41,'Single Target (VMAT)',3,4,1),(42,'Single Target (VMAT)',3,26,1),(43,'Single Target (VMAT)',3,3,1),(44,'Brachytherapy CT-Based',4,27,1),(45,'Brachytherapy Manual',1,27,1),(46,'Single Target (3D-CRT)',2,9,1),(47,'Single Target (3D-CRT)',2,6,1),(48,'Single Target (VMAT)',2.5,28,1),(49,'Single Target (3D-CRT)',2,28,1),(50,'Single Target (VMAT)',3,29,1),(51,'Single Target (VMAT)',3,25,1),(52,'Multi-Target (VMAT)',4,25,1),(53,'Single Target (VMAT)',3,30,1),(54,'Multi-Target (VMAT)',5,30,1),(55,'Single Target (3D-CRT)',2,31,1),(56,'Single Target (3D-CRT)',2.5,26,1),(57,'Single Target (VMAT)',3,32,1),(58,'SBRT',5,26,1),(59,'Single Target (VMAT)',3,33,1),(60,'SBRT',5,23,1),(61,'Single Target (VMAT)',2,34,1),(62,'Single Target (3D-CRT)',2,34,1),(63,'Breast + SC + IM + Boost (VMAT)',10,1,1),(64,'Single Target (3D-CRT)',2.5,35,1),(65,'Single Target (VMAT)',3,35,1),(66,'Single Target (VMAT)',10,36,3),(67,'Single Target (Electrons)',3,37,1),(68,'Single Target (3D-CRT)',2.5,37,1),(69,'Single Target (VMAT)',3,13,1),(70,'Single Target (3D-CRT)',2.5,13,1),(71,'Single Target (VMAT)',2,38,1),(72,'SBRT Single Target',5,3,1),(73,'Single Target (VMAT)',3,37,1),(74,'SIngle Target (VMAT)',3,16,1),(75,'Single Target (3D-CRT)',2,39,1),(76,'Single Target (VMAT)',3,40,1),(77,'Multi-Target (VMAT)',4,27,1),(78,'SBRT',6,32,1),(79,'Single Target (3D-CRT)',3,41,1),(80,'Single Target (VMAT)',4,41,1),(81,'Single Target (3D-CRT)',2.5,42,1),(82,'Single Target (VMAT)',3,43,1),(83,'Single Target(3D-CRT)',2.5,3,1),(84,'Multiple Targets (VMAT)',4,3,1),(85,'Single Target (VMAT)',3,44,1),(86,'Single Target (VMAT)',3,45,1),(87,'Electrons',2.5,46,1),(88,'Single Target (VMAT)',3,47,1),(89,'Single Target (VMAT)',3,12,1),(90,'Single Target (VMAT)',3.5,48,1),(91,'Electrons',3,41,1),(92,'Single Target (VMAT)',3,27,1),(93,'Single Target (VMAT)',3,49,1),(94,'Single Target (3D-CRT)',2,15,1),(95,'Single Target (VMAT)',3,50,1),(96,'Single Target (3D-CRT)',2.5,8,1),(97,'Single Target (VMAT)',3,51,1),(98,'Single Target (3D-CRT)',2.5,51,1),(99,'Electrons',3,51,1),(100,'Breast (VMAT)',5,1,1),(101,'Single Target (3D-CRT)',2.5,52,1),(102,'Single Target (VMAT)',3,52,1),(103,'Single Target (3D-CRT)',2.5,12,1),(104,'Single Target (3D-CRT)',2.5,47,1),(105,'Whole Lungs',5,3,1),(106,'SBRT',6,6,1),(107,'Single Target (VMAT)',3,53,1),(108,'Multi-Target (VMAT)',4,14,1),(109,'Single Target (VMAT)',3,54,1),(110,'Multi Target (VMAT)',4,53,1),(111,'SBRT',5,20,1),(112,'Single Target (3D-CRT)',2.5,55,1),(113,'Single Target (VMAT)',3,55,1),(114,'Single Target (Electrons)',2.5,55,1),(115,'Electrons',3,17,1),(116,'Single Target (VMAT)',3,20,1),(117,'Chestwall + SC (VMAT)',7,68,1),(118,'Single Target (VMAT)',3,31,1),(119,'Multi-Target (VMAT)',4,31,1),(120,'SBRT',5,25,1),(121,'Single target (3D-CRT)',2.5,18,1),(122,'Single Target (VMAT)',3,56,1),(123,'Single Target (Electrons)',3,56,1),(124,'Multi-Target (VMAT)',4,56,1),(125,'Single Target (3D-CRT)',2.5,48,1),(126,'Single Target (VMAT)',3,57,1),(127,'Single Target (3D-CRT)',2.5,57,1),(128,'Single Target (VMAT)',2,58,1),(129,'Electrons',2,58,1),(130,'Single Target (3D-CRT)',2.5,32,1),(131,'Single Target (VMAT)',3,59,1),(132,'Two Laterals',1,60,1),(133,'Multi-Target (VMAT)',4,26,1),(134,'Single Target (VMAT)',3,61,1),(135,'Breast Boost (Electron)',2,1,1),(136,'Mutiple Target (VMAT)',4,12,1),(137,'Single Target (VMAT)',3,62,1),(138,'Single Target (VMAT)',3,63,1),(139,'Multi Target (VMAT)',5,21,1),(140,'Whole Abdomen',3.5,32,1),(141,'Electrons',2.5,32,1),(142,'Single Target (VMAT)',3.5,64,1),(143,'Electrons',2.5,64,1),(144,'Breast Boost (VMAT)',2,1,1),(145,'Multiple Targets (VMAT)',3.5,28,1),(146,'SBRT',4,9,1),(147,'Multi-Target (VMAT)',11,36,3),(148,'SBRT',5,29,1),(149,'Single Target (VMAT)',2.5,65,1),(150,'Multiple Target (VMAT)',4,32,1),(151,'SRT',5,7,1),(152,'Single Target (VMAT)',3,66,1),(153,'Single Target (VMAT)',3.5,67,1),(154,'Single Target (3D-CRT)',2,49,1),(155,'Bilateral (VMAT)',8,68,1),(156,'Single Target (VMAT)',2.5,69,1),(157,'Single Target (VMAT)',3,46,1),(158,'Chestwall Boost (Electrons)',2,68,1),(159,'Chestwall Boost (Tangents)',3,68,1),(160,'Chestwall Boost (VMAT)',4,68,1),(161,'Multi-Target (VMAT)',5,41,1),(162,'SBRT',5,17,1),(163,'Electrons',2.5,70,1),(164,'SBRT',5,69,1),(165,'Single Target (3D-CRT)',3,64,1),(166,'Breast + SC + IM (VMAT)',8,1,1),(167,'Multi-Target (VMAT)',4,51,1),(168,'Breast + IM + Boost (Tangents)',6,1,2),(169,'SRT',5,31,1),(170,'Single Target (VMAT)',3,71,1),(171,'SBRT',5,18,1),(172,'Single Target (VMAT)',3,39,1),(173,'Single Target (3D-CRT)',2,65,1),(174,'Single Target (3D-CRT)',2,69,1),(175,'Multiple Targets (VMAT)',4,66,1),(176,'Multiple Targets (VMAT)',4,8,1),(177,'Electrons',2.5,15,1),(178,'Electrons',2.5,49,1),(179,'Single Target (3D-CRT)',2.5,7,1),(180,'Single Target (3DCRT)',2,30,1),(181,'Breast Prone (Tangents)',3,1,1),(182,'Chestwall (VMAT)',5,68,1),(183,'Electrons',2.5,25,1),(184,'Electrons',3,72,1),(185,'SRT',5,73,1),(186,'Single Target (VMAT)',3.5,74,1),(187,'Single Target (3D-CRT)',3,74,1),(188,'Multiple Target (VMAT)',4,74,1),(189,'Singel Target(3D-CRT)',2,19,1),(190,'Single Target (3D-CRT)',2,73,1),(191,'Single Target (VMAT)',3,73,1),(192,'Single Target (VMAT)',4,75,1),(193,'Single Target (VMAT)',3,70,1),(194,'Chestwall + SC + IM (VMAT)',8,68,1),(195,'Whole Brain with HA (VMAT)',6,2,1),(196,'Multi-Target (VMAT) (Ped.)',7,76,1),(197,'Single Target (VMAT)',3,76,1),(198,'Multi Target (VMAT)',5,76,1);
/*!40000 ALTER TABLE `plan_types` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-15 16:13:06
