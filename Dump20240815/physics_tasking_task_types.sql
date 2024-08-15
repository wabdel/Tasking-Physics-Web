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
-- Table structure for table `task_types`
--

DROP TABLE IF EXISTS `task_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_types` (
  `task_type_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `task_group_id` int NOT NULL,
  `weight` float NOT NULL DEFAULT '1',
  `has_multiplier` tinyint(1) DEFAULT '0',
  `instructions` text,
  `is_schedulable` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`task_type_id`),
  KEY `task_group_id` (`task_group_id`),
  KEY `idx_task_type_name_and_group_id` (`task_group_id`,`name`),
  KEY `idx_task_type_name` (`name`),
  KEY `idx_task_group_id` (`task_group_id`),
  CONSTRAINT `task_types_ibfk_1` FOREIGN KEY (`task_group_id`) REFERENCES `task_groups` (`task_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_types`
--

LOCK TABLES `task_types` WRITE;
/*!40000 ALTER TABLE `task_types` DISABLE KEYS */;
INSERT INTO `task_types` VALUES (1,'Assign plan or task',3,0.08,0,'Entering patient info, selecting plan type, and assigning a planner.',0),(2,'Patient: Portal Dosimetry',9,0.2,1,'Conducting Patient Specific Quality Assurance with Linac MV EPID.\n**Countable[Number of plans]',0),(3,'Patient: Chamber dosimetry',9,0.5,1,'Conducting Patient Specific Quality Assurance with ionization chamber.\n**Countable[number of plans]',0),(4,'A02/05 (D): Relative Dosimetry - Water Scan Of PDD And Profile',13,1,1,'Scanning of PDD\'s and profiles using a 3D water scanner inculding processing and documentation.\n**Countable [Number of beams (photons/electrons)]',1),(5,'A01/04 (D): Reference Dosimetry - Water TRS-398 calibration',13,1,1,'Water calibration of output and establishing factors for chambers in Solid Water.\n**Countable [Number of beam energies (photons/electrons)]',1),(6,'M06 (M): Lasers alignment test +- adjustment',1,0.15,1,'testing laser alignment  of any of the wall lasers. If adjusted & re-checked, count as x2\n**Countable [Number of laser beams]',1),(7,'Wiki: Initiat a page',6,1,0,'Start a wiki page on the wiki server.',0),(8,'Contouring',2,0.5,1,'Contouring of patient CT including Body, Couch, and OARs.',0),(9,'Physics check',2,0.15,1,'Checking of plan parameters, prescriptions, shifts, and naming.',0),(10,'Software coding',6,1,1,'Hours spent on developing/modifying a clinically used applicaton.',0),(11,'Brachytherapy delivery',5,0.5,1,'Attended delivery of a brachytherapy session.',0),(12,'Department purchases',3,0.25,1,'Requesting, receiving, and following a purchase request.',0),(13,'Continue Education Session: Attendance',4,1,0,'Attending an educational workshop, seminar  etc',0),(14,'(D) : Analyze photon beam output portals',15,0.03,1,'Import daily portal films from portal dosimetry and imorting them in the physics_qa application. Countable [Number of photon beams]',0),(15,'QATrack+: Reviewing/Approving QA Testlist',10,0.03,1,'review and approve a QA test or testlist; e.g. in QATrack+ software.',0),(16,'Documenting QA test',10,0.2,1,'documenting a QA test or testlist; e.g. in QATrack+ software.',0),(17,'Equipment support',5,0.25,1,'hardware equibment support including Linac/CT/Dosimetry devices testing/fixing/inventory locating etc.',0),(18,'IT Support',5,0.25,1,'IT-related support including server, aria, network, devices, dosimetry software etc\nCountable per 15 min',0),(19,'Wiki: Edit a page',6,0.08,1,'Editing or adding information to an existing wiki page. (increments of 5 mins.)',0),(20,'Meeting Attendance ( Physics )',3,1,0,'Attending Physics meetings.',0),(21,'Patient: Electrons cutout output factor measurment',9,0.5,1,'Measuring an electron cutout factor with an ion chamber and documenting the results.\n** Countable[Number of plans]',0),(22,'Plan Modification',2,0.3,0,'Minor plan modifications that DO NOT require recalculation. Example: changing of dose rate, small field size change.',0),(23,'M04 (IMG): MV Image Quality Test',1,0.3,1,'performing an MV image Quality test using the MV-QA phantom and analyzing the resutls.\n**Countable [Number of Linacs]',1),(24,'Q01 (IMG): CBCT Image Quality Test',14,0.6,1,'performing a CBCT image Quality test using the Catphan phantom and analyzing the resutls.\n**Countable [Number of Linacs]',1),(25,'M03 (IMG): kV image Quality Test',1,0.3,1,'performing a kV image Quality test using the kV-QA phantom and analyzing the resutls.\n**Countable [Number of Linacs]',1),(26,'Planning Consultation',2,0.25,0,'Consultation for planning with the MD or planner.',0),(27,'M01 (D): Photons Solid water Output Measurement',1,0.2,1,'in solid water with chamber; includes documentation in QATrack+\n\n**Countable [Number of beams]',1),(28,'M02 (D): Electron Solid water Output Measurement',1,0.2,1,'in solid water with chamber; QATrack+\n\n**Countable [Number of beams]',1),(29,'Linac: Import output images',1,0.15,0,NULL,0),(30,'Import/Export a DICOM image set',2,0.25,1,'importing or exporting a DICOM image set from PACs/CD.',0),(31,'Retrieve/Import an RPM pattern',2,0.2,1,'Retrieve, convert and/or import an RPM breathing pattern.',0),(32,'Training Session: Trainer',4,1,1,'Training a group or an individual.( per hour)',0),(33,'Continue Education Session: Presenting',4,2,0,'Preparing and presenting an educational session.',0),(34,'RadOnc Review: Presenter',3,2,0,'Loading up the review cases and completing the RadOnc Review tasks.',0),(35,'RadOnc Review: Preparing patient list',3,0.5,0,'Preparing & distributing the patient list to be presented in the RadOnc Review.',0),(36,'Q03 (M): Field Junction Test',14,0.4,1,'taking the filed junction images and importing it to PhysicsQA software for analysis.\n**Countable [Number of Linacs]',1),(37,'Linac (M): Field Size (Light vs Radiation)',1,0.2,1,'Performing and analyzing the field size light vs radiation test with a film or the FS-QA phantom. Countable [number of fields]',0),(38,'A07 (M): Mechanical isocenter',13,0.5,0,'Quality assurance of Linac mechanical isocenter with repect to gantry, collimator and couch rotations.',1),(39,'SA01 (D): Photon beam energy quality',16,0.2,1,'per beam; mesauring beam energy quality (TPR or PDD) per linac; includes documentation form and QATrack+\n**Countable [No of beams]',1),(40,'ECLIPSE Scripts',6,1.25,1,'Hours spent in developing/modifying Ecllips scripts.',0),(41,'ARIA Reports',6,1.25,1,'Hours spent in developing/modifying ARIA reports.',0),(42,'(SNC) SunMachine: Reviewing a QA task',10,0.1,1,'reviewing a QA task in SNC Machine and approving it.',0),(43,'Accepting or disposing HDR source bucket(s)',8,0.2,0,'disposing or accepting a bucket containing the Ir-192 source with the RSO, storing it in the RadOnce Radioactive waste room, and keeping a copy of the signed Source Delivery Note in the designated file (Source Delivery Note in Brachtherapy Console Cabinet)',0),(44,'Ir-192 source activity measurment',8,1,0,'Performing an Ir-192 source activity measurment (e.g. after source exchange with a new source) and documenting the measurment results.',0),(45,'New exchanged Ir-192 source QA tests',8,1,0,'Performing a QA for the newly exchanged Ir-192 source (excluding the source activity measurment), documenting the results, and printing out the decay table.',0),(46,'M01 (D): Output Photons with BEAMChecker+ device',1,0.1,1,'includes importing in software\n\n**Countable [Number of beams]',1),(47,'M02 (D) Output Electrons with BEAMChecker+ device',1,0.1,1,' includes importing in software\n**Countable [Number of beams]',1),(48,'Q07 (M): Winston-Lutz Cube QA',14,0.5,0,'performing the WL test with the WL-QA cube (SunNuclear) and analyzing/documenting the results',1),(49,'Patient Treatment Support',5,0.25,1,'supporting patient treatment at the Linac ',0),(50,'Prepare department\'s monthly statistics',3,0.25,0,'Monthly statistics to be submitted to QSPA and oncology centre',0),(51,'Progress Report',3,1,1,'Wrting department progress report',0),(52,'Achievements report',3,3,0,'Writing department achievements',0),(53,'A15 (D): EPID Portal Dosimetry calibration',13,0.25,1,'Calibrate portal dosimetry for the EPID. Includes acquiring reference output images.\n**Countable [Number of beams]',1),(54,'Template Settings for Plans/Clinical Protocols/Planning Objectives',6,0.5,1,'Setting up a template for plans/clinical protocols/planning objectives in Eclipse',0),(55,'CT: Laser Alignment test +- adjusting',7,0.15,1,'per laser, testing laser alignment  of any of the wall lasers. If adjusted & re-checked, count as x2\n**Countable [Number of laser beams]',0),(56,'CT: Image Quality Test',7,1.5,0,'testing image qualiy of CT using Catphan or equiv. phantom. Including analysis and documentation ',1),(57,'CT: HU curve measurment verification',7,2,0,'measurment of HU curve of CT using Catphan/CIRS or equiv. phantom. Including analysis and documentation ',1),(58,'QA Reviewing/Reporting/Documentation',10,0.2,1,'per 0.25 hr; review or document a QA test  digitally or as a printout',0),(59,'Develop a Quality Program Test',6,1,1,'develop QA program list with tolerances and frequencies (daily, monthly, quartely, semi-annually or annually)',0),(60,'Develop a QA QATrack+ list or sheet for documentation',6,1,1,'develop a QA sheet/QATrack+ test list for documentation',0),(61,'W1) Linac: Perform/ Review MPC test',15,0.5,1,'per machine; performing Varian\'s machine performance check (MPC) test and reviewing the results',0),(62,'Q02 (M): ODI check test',14,0.2,1,'check the optical distance indicator of a Linac.\n**Countable [Number of Linac]',1),(63,'SA07 (img): Calibrate MV imager',16,0.5,1,'calibrate MV imager all protocols (Low dose, High Quality, Conti.)\n**Countable [No of machine]',1),(64,'SA08 (img): Calibrate kV imager',16,0.5,1,'calibrate kV image all protocols; or kV collimator calibration\n**Countable [No of machine]',1),(65,'SA09 (img): Calibrate CBCT Imaging',16,1,1,'calibrate CBCT imaging all protocols\n**Countable [No of machines]',1),(66,'Develop Training Materials',6,0.5,1,'develop training materials, regulations, instructions etc\n**Multipler by 0.5 hours',0),(67,'Importing or exporting patient data from/to Eclipse',2,0.5,1,'per 0.5 hr; importing or exporting patient data (dicom format) from or to Eclipse system',0),(68,'TLD exchange',12,3,0,'Exchange of TLD for Radiation Oncology Department Staff ',0),(69,'Brachytherapy source documentation',3,0.75,0,'per 0.75 hr; documinting source exchange and filing in folders and/or updating radioactive source inventory sheet and sharing it with RSO.',0),(70,'Minor Plan modification during Physics 2nd Check',2,0.08,1,'per 0.15 hr; minor plan modifications during 2nd check including any of creating DRR/ bone layers; re-printing documents; adding gating pattern; deleting reference points and re-approving; creating varification plans',0),(71,'Meeting Attendance ( RadOnc Review )',3,1,0,'Attending RadOnc Review Meeting.',0),(72,'Meeting Attendance ( Departmental )',3,1,0,'Attending Departmental Meeting.',0),(73,'Meeting Attendance ( Other )',3,1,0,'All other unspecified meeting (e.g. radiation safety, Collobration with another department etc)  ( add notes)',0),(74,'Commissioning',6,1,1,'Log of time spent in commissioning software or hardware.',0),(75,'Q05 (D): EDW test',14,0.5,0,' preforming EDW factor and EDW recovery test. Includes documentation\n',1),(76,'Q04 (M) MLC Test Pattern',14,0.5,0,'performing MLC test patternt (e.g. picker fence). Includes analysis and documentation\n',1),(77,'A08/09/10 (D): Output vs Gantry or MU or Dose Rate',13,0.25,1,'Using EPID or chamber. Includes documentation.\n**Countable [No of beam energies]',1),(78,'Q06 (IMG): Image Match & Shift test',14,0.6,0,'imaging a shifted cube and checking system ability to match and perform proper couch shifting.',1),(79,'SA05/06 (M): Collimator or Gantry Angle readout Test',16,0.3,1,'per test; checking the colimator or gantry rotaion; includes documentation\nCountable [per test i.e. Collimator angle / Gantry angle / Table angle]',1),(80,'SA04 (M): Couch motion Test',16,0.44,0,'per machine; testing couch vertical, lateral, and langitudinal motion; including documentation',1),(81,'SA04 (M): Jaws Positions Test',16,0.44,0,'per machine; testing X and Y jaws positions including documentation',1),(82,'SA02 (M): MLC Skewness test',16,0.44,0,'per machine; testing X and Y jaws vs MLC skewness\n',1),(83,'A11 (M): Starshot pattern tests',13,0.5,1,'Performing a startshot test with EPID or films for collimator, or couch, or gantry and Includes analysis and documentation. \nCountable [number of tests]',1),(84,'Contact Biomed//Manufacturer/Maintenance for Support',5,0.25,1,'per 0.25 hr; contacting to report an issue or request a service from biomed, manufacturer or maintenance.',0),(85,'Q04 (M/D): RapidArc QA Tests',14,0.5,0,'RapidArc QA test (any of RapidArc PicketFence - with or without error; leaf speed; dose rate  and gantry speed; DMLC Dosimetry\n',1),(86,'Software: Install, test, or upgrade',6,1,1,'The number of hours spent in installing,  testing, or upgrade of software.',0),(87,'Prepare Monthly QA To-Do List Schedual',10,0.2,0,' preparing a schedual for Monthly QA to-do list and share it with the Physics team ',0),(88,'GafChromic films dosimetry',9,0.5,1,'Points represent time spent in hrs in preparation, irradiation, reading, and analysis of dosimetry with GafChromic films. (Calibration or measurement)\n** Countable[hours spent]',0),(89,'Develop IPP/Radiation Safety/ QA material',6,1,1,'',0),(90,'Trainees/Voulnteers relatd admin tasks',3,0.25,1,'ex. communication; coordinating; interviews; preparing reports',0),(91,'Equipment inventory',3,0.25,1,'Check, document, or investigate department\'s inventory (per item)',0),(92,'Software: Admin configuration',6,0.15,1,'Admin configuration for (Adding/Editing Entries, users, Area, Servers , Physics QA, Planning Distribution and etc) 0.15 point per 15 minures',0),(93,'Q08 (M): Isocenter Calibration or Verification',14,1,0,'verifying or calibrating the Linac\'s MV/kV isoCenter with IsoCal according to Varian\'s protocol',1),(94,'Logging/Documenting a service report',3,0.5,1,'Document a service report (e.g. in QATRack+)',0),(95,'Add/Edit carepath, activity, or encounter',6,0.2,1,'',0),(96,'Reviewing/approving service report',10,0.1,1,'',0),(97,'A16 (D): CBCT CTDI Measurment',13,2,0,'performing CTDI measurment for CBCT, including analysis and documentation',1),(98,'Committee-related tasks',3,0.5,1,'Tasks related to internal/external committee work outside of meetings',0),(99,'M05 (D):  Beam Profiles Constancy',1,0.15,1,'using the FS-QA phantom and SunCheck for analysis or QACheckPlus beam profiler device\n**Countable [Number of beams]',1),(100,'SA03 (M): Crosswire centering',16,0.4,0,'',1),(101,'A13 (D) MLC leakage and leaf gap',13,1,1,'Measure leaf trasmission and dosimetric leaf gap.\n**Countable[photon beams]',1),(102,'A14) End-to-End Test',13,4,0,'includes scanning, planning, delivering, analaysis and documentation',1),(103,'A17: Radiation Survey',12,3,0,'Conduct a radiation survey including documentation.',1),(104,'Monthly TPS QA',11,0.5,1,'monthly QA on TPS per linac',1),(105,'(D) Acquiring Daily Photon beam outputs using portals.',15,0.05,1,'Aquire EPID photon output images. Countable [Number of fields]',0),(106,'Swapping Server Back-up Tapes',5,0.15,0,'Exchanging the back-up tapes on Varian\'s Server.',0),(107,'BED/EQD2 calculations per organ',2,0.08,1,'',0),(108,'Fixing Carepath',3,0.2,1,'Fixing a patient whose carepath is messed up. e.g. in brachytherapy or a re-plan with the wrong carepath template. ',0),(109,'TBI treatment dosimetry & delivery',5,1.25,0,'per fraction, includes attendance of setup, delivery and in-vivo mesurments and analysis',0),(110,'Flatness/Symmetry/Output using a 2D array',1,0.25,1,'per energy; e.g using SNC IC Profiler; includes analysis and documentation. ',1),(111,'Add 3D Bolus',2,0.2,1,'Creating 3D Bolus and link it to field per plan!',0),(112,'Teaching a formal class or workshop',4,1,1,'Amount of time spent on teaching, preparing and grading of a formal class or workshop.',0),(113,'BeamChecker+: Acquairing new baseline - per energy',1,0.2,1,'per energy. Acquire a new basline for BeamChecker+ device while connected to its software',0),(114,'Incident reporting',3,0.5,1,'Writing a new departmental incident report (per report)',0),(115,'RPM/4D gating support at CT / Machine',5,0.5,1,'',0),(116,'re-calculate a Plan on CBCT/CT',2,0.5,1,'recalcuating a plan on CBCT or CT including matching/structures copying and discuessing with RadOnc ',0),(117,'PC Monitor QA Test',11,0.2,1,'performing a QA test for PC monitor using TG270 pattern(s)',0),(118,'Regulatory bodies related tasks',3,1,0,'meeting or communicating (verbal or written) or completing documents related to regulatory body requirment ',0),(119,'Administrative related task',3,0.5,1,'All unlisted admin task performed. internal/external of the department (Training/Course arrangment,  courses, software licensing, meeting arrangment, logistical assitance, etc)',0),(120,'Presenting a plan to Radonc on behalf of another planner.',2,0.5,0,'Plans presented to physician on behalf of another planner.',0),(121,'CT: CTDI measurment',7,1.5,0,'performing CTDI measurment for CT, including analysis and documentation',1),(122,'Patient simulation support',5,0.25,1,'Countable per 15 min',0),(123,'ARIA Appliations',5,0.25,1,'Showing ARIA related features (contouring, carepath, etc.)\n\n** countable[time multiplicity of 15 min]',0),(124,'Annual TPS QA',11,1,1,'annual TPS QA test per linac',1),(125,'Shielding calculation',12,1,1,'Calculation of bunkers shielding.\n**countable [multiplicity of time of 1.0 hrs]',0),(126,'A03/06 (D): Relative Dosimetry - Output factors (RDF/Cone)',13,0.5,1,'measurment of output factor for photon beams (RDF) or electron beams (applicator factor)\n**Countable [Number of beams]',1),(127,'A12 (M): Coincidence of Isocentres with Radiation (ME Test)',13,2,0,'ask wamied how to do this test!',1),(128,'Conference: Oral presentation',6,15,0,'Presenting an oral talk in a national or internation conference',0),(129,'Conference: Poster presentation',6,10,0,'Presention of aposter in a national or international conference. Add event name in notes.',0),(130,'Research',6,1,1,'Time in hrs spent in research (clinical or dosimetric)',0),(131,'Produce a report / statistics',3,0.5,1,'produce a report / script for statistics or reserach',0),(132,'Appraisal report',3,1,1,'No. of appraisal reports',0),(133,'Shielding assesment measurement',9,2,1,'Asseccing adequacey of shielding through measurement with chamber or film, with documentation.\n**Countable( per plan)',0),(134,'3D-ArcCheck',9,0.5,1,'',0),(135,'Hospital: Oral presentation',4,6,0,'Giving an oral presentation at a hospital department other than radiation oncology.',0);
/*!40000 ALTER TABLE `task_types` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-15 16:13:07