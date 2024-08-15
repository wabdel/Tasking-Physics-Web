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
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sites` (
  `site_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `is_uppercase` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`site_id`),
  UNIQUE KEY `name` (`name`),
  KEY `idx_site_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (1,'breast',0),(2,'brain',0),(3,'lung',0),(4,'rectum',0),(5,'prostate',0),(6,'spine',0),(7,'head & neck',0),(8,'Femur',0),(9,'Iliac',0),(10,'Larynx',0),(11,'Back',0),(12,'Chest',0),(13,'Adrenal',0),(14,'Mediastinum',0),(15,'Arm',0),(16,'Liver',0),(17,'Sternum',0),(18,'Ribs',0),(19,'Acetabulum',0),(20,'Pancreas',0),(21,'Bladder',0),(22,'Maxilla',0),(23,'Uterus',0),(24,'Thyroid',0),(25,'Neck',0),(26,'pelvis',0),(27,'GYN',1),(28,'Hip',0),(29,'Thorax',0),(30,'Axilla',0),(31,'Shoulder',0),(32,'Abdomen',0),(33,'Hilus',0),(34,'Humerus',0),(35,'Sacrum',0),(36,'CSI',1),(37,'Scrotum',0),(38,'Gluteal',0),(39,'Flank',0),(40,'Mandible',0),(41,'Leg',0),(42,'Hand',0),(43,'Kidney',0),(44,'Perianal',0),(45,'Stomach',0),(46,'Face',0),(47,'Skull',0),(48,'Inguinal',0),(49,'Thigh',0),(50,'Spleen',0),(51,'Orbit',0),(52,'Foot',0),(53,'Anal Canal',0),(54,'Esophagus',0),(55,'Head',0),(56,'Scalp',0),(57,'Knee',0),(58,'IMN',1),(59,'Pituitary',0),(60,'TBI',1),(61,'Ethmoid',0),(62,'Nasal',0),(63,'Parotids',0),(64,'Eye',0),(65,'scapula',0),(66,'paraspine',0),(67,'vulva',0),(68,'chestwall',0),(69,'supraclav',0),(70,'cheek',0),(71,'colon',0),(72,'testicles',0),(73,'clav',0),(74,'buttock',0),(75,'brainstem',0),(76,'neck & mediastinum',0);
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-15 16:13:08
