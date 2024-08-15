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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `family_name` varchar(50) NOT NULL,
  `hospital_id` varchar(10) NOT NULL,
  `initials` varchar(5) NOT NULL,
  `login` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `extension` varchar(10) DEFAULT NULL,
  `password` blob NOT NULL,
  `category_id` int NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `reset_password` tinyint(1) DEFAULT '0',
  `is_retired` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `hospital_id` (`hospital_id`),
  UNIQUE KEY `initials` (`initials`),
  UNIQUE KEY `login` (`login`),
  KEY `category_id` (`category_id`),
  KEY `idx_user_initials` (`initials`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','admin','ADMIN','admin','admin@myemail.com','','',_binary '±	Ûªº$N∏$Aë~\–maãê\›	≥æ˝^9LpjãπÄ±\◊x^Yv\ÏõF\ﬂ_&ØZ.¶\—˝\…SÖˇ´¨ºÜ',1,1,0,0),(2,'Mashaal','ALKHALDI','5038','MK','mshalkhaldi','mshalkhaldi@gmail.com','050-496-6166','5839',_binary '\\v≈∏%i#%\Â*a°ˆÚ7?\€.eß`{©¢r<ûˆ\ÏlS¸Ú\r¿\œ∞:ÙàXbŸ≥<\ﬁ?ÛS;∞Ü¡\·∑s\·¶',2,1,0,0),(3,'Wamied','ABDEL-RAHMAN','4023','WA','wabdel','wamied@me.com','056-112-3950','5824',_binary '=s[\€Oçîçô\«9m}*p◊ß\⁄fØÖ˝¨[~cq7û∑B\ÔHú\≈S *G60\ÀTLU(Ä\ngõáI´Òµ7ìd',2,1,0,0),(4,'Bassam','HOUSAWI','5039','BH','bassam','b.housawi@gmail.com','054-550-4455','5841',_binary 'í^¡ç\Á?\Ïò[Fe|∑Ø\„zß∑H\Ê\À:3†\›@÷à:πvajä˜Óúõã≥\',	\r˙9ä3Õñ\‡™*(ó6≠\⁄\Ì',2,0,0,0),(5,'Abdulraouf','ALGHUFAILI','6369','AG','alghufaili','ahmh222@hotmail.com','056-667-2844','5841',_binary '?¢Ñ_H\≈«∑Ä´ù\Í˚\Ÿ\\îıÄ•[\È1[\»+ç\n\‡Dª\Êç\›˜N©ô¥9i\·\‰ıY3=¨sËåΩz¨v!\ÿH∞_ä',3,1,0,0),(6,'Ismail','ALDAHLAWI','1540','IAD','ialdahlawi','ismail.dahlawi@kfsh.med.sa','050-467-8052','5829',_binary '®_E◊ÇB9≠˛\Ë∂+‹±/GKtE±)h•^\“\„R ô\–%¿\„khé\\|çí<tõë˘\¬{\÷#è∂',2,1,0,0),(7,'Bilal','jalal','5004','BJ','bilal','bilalo.jalal@kfsh.med.sa','055-578-6180','5804',_binary '\–07∞ˇ\Ï\»ø\“˜\…\‚\'\"˙€≥ø\ÓM∞Q\ÓS4ú\ﬂ\È£\Î}ïBîSfÅÒ¯W\‰\Ï\’9ô8	ëŸ†xªëô',2,0,0,1),(8,'Fatimah','ALMATOUQ','7222','FM','falmatou','x','054-944-2035','5841',_binary 'eºv\ ^ñ\Ÿ˚Ü9G.\‡\Ì#≤ínòÖ9d\’A\r∫N¸,N ë\'/>ª\'\·#aMu\Õ\≈cŒùÑ”ò¿\Õ∏É	u',3,1,0,0),(9,'Baderaldeen','al-tazi','5262','BT','baltazi','baderaldeen.tazi@kfsh.med.sa','059-980-9070','5863',_binary 'õ^\Z9˙Øe`ú\Ÿn´:[ˆr%_ã¿öës>.û\ÿBpy+~cØ2n†L3-Ø\‘\÷∞z˜;ˇ\‡¿P≤¡˘K\‡ ',2,0,0,1),(10,'Ibrahim','AL-OTAIN','1677','IO','iotain','','055-580-0310','2573',_binary '˙X]â\»Q\›3äp\‹ı5™*í˛\ÁÉm÷ØÒ\"eÉ\Ëé	ñ)?º\0úe(&\‡¸\\pfï†<\›\Œ7/ûˇMïù¶Òı\”\Íæ',5,1,1,0),(14,'Shakir','ALSHAKIR','1803','SS','sshakir','','055-572-3308','5838',_binary '˙X]â\»Q\›3äp\‹ı5™*í˛\ÁÉm÷ØÒ\"eÉ\Ëé	ñ)?º\0úe(&\‡¸\\pfï†<\›\Œ7/ûˇMïù¶Òı\”\Íæ',5,1,1,0),(15,'Hala','ELLAYTHY','4124','HL','hala','','054-036-7076','5826',_binary '˙X]â\»Q\›3äp\‹ı5™*í˛\ÁÉm÷ØÒ\"eÉ\Ëé	ñ)?º\0úe(&\‡¸\\pfï†<\›\Œ7/ûˇMïù¶Òı\”\Íæ',5,1,1,0),(16,'Fahad','ALROWAIS','4982','FR','frowase','','058-261-7071','5830',_binary '˙X]â\»Q\›3äp\‹ı5™*í˛\ÁÉm÷ØÒ\"eÉ\Ëé	ñ)?º\0úe(&\‡¸\\pfï†<\›\Œ7/ûˇMïù¶Òı\”\Íæ',5,0,1,0),(17,'Taghreed','ALHINDI','4319','TH','talhindi','','050-685-8309','5827',_binary '˙X]â\»Q\›3äp\‹ı5™*í˛\ÁÉm÷ØÒ\"eÉ\Ëé	ñ)?º\0úe(&\‡¸\\pfï†<\›\Œ7/ûˇMïù¶Òı\”\Íæ',5,1,1,0),(18,'Ahlam','DOHAL','6246','AD','adohal','','055-648-9888','2858',_binary '˙X]â\»Q\›3äp\‹ı5™*í˛\ÁÉm÷ØÒ\"eÉ\Ëé	ñ)?º\0úe(&\‡¸\\pfï†<\›\Œ7/ûˇMïù¶Òı\”\Íæ',5,1,1,0),(19,'Yasser','RAJAB','3409','YR','yrajab','','056-141-3535','5843',_binary '˙X]â\»Q\›3äp\‹ı5™*í˛\ÁÉm÷ØÒ\"eÉ\Ëé	ñ)?º\0úe(&\‡¸\\pfï†<\›\Œ7/ûˇMïù¶Òı\”\Íæ',5,1,1,0),(20,'Lulwah','ABDULJABBAR','4442','LA','labdul','','054-117-6977','5870',_binary '˙X]â\»Q\›3äp\‹ı5™*í˛\ÁÉm÷ØÒ\"eÉ\Ëé	ñ)?º\0úe(&\‡¸\\pfï†<\›\Œ7/ûˇMïù¶Òı\”\Íæ',5,1,1,0),(21,'Shamma','ALGHADHBAN','6352','SG','sghadhban','','050-344-3770','5861',_binary '*Û; \Ë¿i=f\‚zÑ≥Y|\–\ÿ\‡¥5\Ô\¬^ÉÜ¡ü†Ã≤≠_@5ºXG\÷C´.I\Œw\Ê;\Í\Ó\Ëæ:k\…pá\√',2,0,0,0),(22,'Ruqaya','ALDARWISH','51607817','RD','roaldarwish','ruqaya100@hotmail.com','050-587-4331','5815',_binary 'º\ƒ\ÌRCñ2-g∫=\Œt¯\Í∫$\∆§æ˜e%=\r\rÅù\‰-5vßLB\Ó\„Ø=§|ìJÜ 6øI@˝\“Dπ\–\“Y',2,1,0,0);
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

-- Dump completed on 2024-08-15 16:13:08
