-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: gymmgt
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Temporary view structure for view `coach_summary`
--

DROP TABLE IF EXISTS `coach_summary`;
/*!50001 DROP VIEW IF EXISTS `coach_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `coach_summary` AS SELECT 
 1 AS `coach_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `assigned_members`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `coaches`
--

DROP TABLE IF EXISTS `coaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coaches` (
  `coach_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `specialization` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `hire_date` date NOT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`coach_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coaches`
--

LOCK TABLES `coaches` WRITE;
/*!40000 ALTER TABLE `coaches` DISABLE KEYS */;
INSERT INTO `coaches` VALUES (1,'John','Doe','Strength Training','0712345678','john.doe@gym.com','2023-06-15',75000.00),(2,'Jane','Smith','Yoga','0723456789','jane.smith@gym.com','2023-07-01',68000.00),(3,'David','Brown','CrossFit','0734567890','david.brown@gym.com','2022-11-20',80000.00),(4,'Emma','Wilson','Cardio Workouts','0745678901','emma.wilson@gym.com','2024-01-10',72000.00),(5,'Michael','Johnson','Bodybuilding','0756789012','michael.johnson@gym.com','2021-05-12',90000.00),(6,'Sarah','Davis','Aerobics','0767890123','sarah.davis@gym.com','2022-03-22',67000.00),(7,'James','Miller','HIIT','0778901234','james.miller@gym.com','2023-09-30',78000.00),(8,'Olivia','Garcia','Pilates','0789012345','olivia.garcia@gym.com','2022-12-05',71000.00),(9,'William','Martinez','Functional Fitness','0790123456','william.martinez@gym.com','2023-08-25',73000.00),(10,'Sophia','Anderson','Calisthenics','0701234567','sophia.anderson@gym.com','2024-02-14',76000.00),(11,'Clara','Connor','Strength Training','0738987652','connor@gmail.com','0001-01-01',70000.00),(13,'Clara','Connor','Strength Training','0768574905','connorC@gmail.com','0001-01-01',70000.00);
/*!40000 ALTER TABLE `coaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_coach`
--

DROP TABLE IF EXISTS `member_coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_coach` (
  `member_coach_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `coach_id` int NOT NULL,
  `assigned_date` date NOT NULL DEFAULT (curdate()),
  PRIMARY KEY (`member_coach_id`),
  KEY `member_id` (`member_id`),
  KEY `coach_id` (`coach_id`),
  CONSTRAINT `member_coach_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE,
  CONSTRAINT `member_coach_ibfk_2` FOREIGN KEY (`coach_id`) REFERENCES `coaches` (`coach_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_coach`
--

LOCK TABLES `member_coach` WRITE;
/*!40000 ALTER TABLE `member_coach` DISABLE KEYS */;
INSERT INTO `member_coach` VALUES (1,1,2,'2024-02-05'),(2,1,3,'2024-02-05'),(3,2,4,'2024-01-10'),(4,3,5,'2023-12-20'),(5,4,1,'2024-03-15'),(6,5,6,'2024-02-01'),(7,6,7,'2023-11-28'),(8,7,8,'2024-02-21'),(9,8,9,'2024-01-17'),(10,9,10,'2023-10-14'),(11,10,1,'2024-03-10'),(12,15,4,'0024-01-01');
/*!40000 ALTER TABLE `member_coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `join_date` date NOT NULL DEFAULT (curdate()),
  `membership_status` enum('Active','Inactive','Suspended') DEFAULT 'Active',
  `coach_id` int DEFAULT NULL,
  `plan_id` int NOT NULL,
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `email` (`email`),
  KEY `coach_id` (`coach_id`),
  KEY `plan_id` (`plan_id`),
  CONSTRAINT `members_ibfk_1` FOREIGN KEY (`coach_id`) REFERENCES `coaches` (`coach_id`) ON DELETE SET NULL,
  CONSTRAINT `members_ibfk_2` FOREIGN KEY (`plan_id`) REFERENCES `membership_plans` (`plan_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'Ethan','Walker','ethan.walker@mail.com','0721111111','1995-08-15','Male','2024-01-05','Active',1,1),(2,'Ava','Moore','ava.moore@mail.com','0722222222','1998-04-25','Female','2023-12-10','Active',2,2),(3,'Liam','White','liam.white@mail.com','0723333333','2000-06-12','Male','2023-11-20','Active',3,3),(4,'Sophia','Hall','sophia.hall@mail.com','0724444444','1993-07-30','Female','2023-10-15','Active',4,1),(5,'Benjamin','Allen','benjamin.allen@mail.com','0725555555','1997-12-01','Male','2024-02-01','Active',5,2),(6,'Emma','Young','emma.young@mail.com','0726666666','2001-05-18','Female','2023-09-28','Active',6,3),(7,'Noah','Harris','noah.harris@mail.com','0727777777','1996-09-09','Male','2023-08-21','Active',7,1),(8,'Olivia','Clark','olivia.clark@mail.com','0728888888','1994-03-11','Female','2023-07-17','Active',8,2),(9,'Lucas','Lewis','lucas.lewis@mail.com','0729999999','1999-11-22','Male','2023-06-14','Active',9,3),(10,'Mia','Robinson','mia.robinson@mail.com','0730000000','1992-02-05','Female','2023-05-10','Active',10,1),(11,'Alice','Walker','awalker@gmail.com','07123456','0001-03-03','Female','0023-12-01','Active',1,1),(12,'James','Blake','jblake@gmail.com','0787654321','0098-04-02','Male','0015-02-02','Active',2,2),(13,'Mary','Diaz','mdiaz@gmail.com','0738364927','0005-01-01','Female','0025-01-02','Active',6,3),(14,'Mary','Ingrid','mary@gmail.com','0712987467','0003-08-01','Female','0024-10-09','Active',7,2),(15,'alice','james','aj@gmail.com','0734509782','0001-01-01','Female','0024-01-01','Active',4,1);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membership_plans`
--

DROP TABLE IF EXISTS `membership_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membership_plans` (
  `plan_id` int NOT NULL AUTO_INCREMENT,
  `plan_name` enum('Monthly','Quarterly','Annual') NOT NULL,
  `duration` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`plan_id`),
  UNIQUE KEY `plan_name` (`plan_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership_plans`
--

LOCK TABLES `membership_plans` WRITE;
/*!40000 ALTER TABLE `membership_plans` DISABLE KEYS */;
INSERT INTO `membership_plans` VALUES (1,'Monthly',30,5000.00),(2,'Quarterly',90,13000.00),(3,'Annual',365,45000.00);
/*!40000 ALTER TABLE `membership_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL DEFAULT (curdate()),
  `status` enum('Paid','Pending','Failed') DEFAULT 'Paid',
  PRIMARY KEY (`payment_id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (41,1,5000.00,'2024-02-05','Paid'),(42,2,13000.00,'2024-01-10','Paid'),(43,3,45000.00,'2023-12-20','Paid'),(44,4,5000.00,'2024-03-15','Pending'),(45,5,13000.00,'2024-02-01','Paid'),(46,6,45000.00,'2023-11-28','Paid'),(47,7,5000.00,'2024-02-21','Pending'),(48,8,13000.00,'2024-01-17','Paid'),(49,9,45000.00,'2023-10-14','Failed'),(50,10,5000.00,'2024-03-10','Paid'),(51,1,5000.00,'0025-01-01','Paid');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin123');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `coach_summary`
--

/*!50001 DROP VIEW IF EXISTS `coach_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `coach_summary` AS select `c`.`coach_id` AS `coach_id`,`c`.`first_name` AS `first_name`,`c`.`last_name` AS `last_name`,count(`mc`.`member_id`) AS `assigned_members` from (`coaches` `c` left join `member_coach` `mc` on((`c`.`coach_id` = `mc`.`coach_id`))) group by `c`.`coach_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-02 17:09:52
