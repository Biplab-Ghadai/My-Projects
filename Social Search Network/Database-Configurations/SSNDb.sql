-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: gotdatsocialnetwork
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `gt_add_books`
--

DROP TABLE IF EXISTS `gt_add_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gt_add_books` (
  `id` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `profile_pic` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `book_name` varchar(100) DEFAULT NULL,
  `date1` varchar(100) DEFAULT NULL,
  `time1` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gt_add_books`
--

LOCK TABLES `gt_add_books` WRITE;
/*!40000 ALTER TABLE `gt_add_books` DISABLE KEYS */;
INSERT INTO `gt_add_books` VALUES ('1','vironika@gmail.com','Vironika','female.jpg','Chandigarh','The Secret','21:06:2020','14:42:10');
/*!40000 ALTER TABLE `gt_add_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gt_add_movies`
--

DROP TABLE IF EXISTS `gt_add_movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gt_add_movies` (
  `id` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `profile_pic` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `movie_name` varchar(100) DEFAULT NULL,
  `date1` varchar(100) DEFAULT NULL,
  `time1` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gt_add_movies`
--

LOCK TABLES `gt_add_movies` WRITE;
/*!40000 ALTER TABLE `gt_add_movies` DISABLE KEYS */;
INSERT INTO `gt_add_movies` VALUES ('1','deepak@gmail.com','Deepak Panwar','imageedit_3_5906472579.png','Chandigarh','Tanha Ji','01:09:2022','13:17:24');
/*!40000 ALTER TABLE `gt_add_movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gt_add_tv_serials`
--

DROP TABLE IF EXISTS `gt_add_tv_serials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gt_add_tv_serials` (
  `id` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `profile_pic` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `tv_serial_name` varchar(100) DEFAULT NULL,
  `date1` varchar(100) DEFAULT NULL,
  `time1` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gt_add_tv_serials`
--

LOCK TABLES `gt_add_tv_serials` WRITE;
/*!40000 ALTER TABLE `gt_add_tv_serials` DISABLE KEYS */;
/*!40000 ALTER TABLE `gt_add_tv_serials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gt_all_profile_pics`
--

DROP TABLE IF EXISTS `gt_all_profile_pics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gt_all_profile_pics` (
  `id` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `profile_pic` varchar(100) DEFAULT NULL,
  `date1` varchar(100) DEFAULT NULL,
  `time1` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gt_all_profile_pics`
--

LOCK TABLES `gt_all_profile_pics` WRITE;
/*!40000 ALTER TABLE `gt_all_profile_pics` DISABLE KEYS */;
INSERT INTO `gt_all_profile_pics` VALUES ('1','deepak@gmail.com','Deepak Panwar','imageedit_3_5906472579.png','21:06:2020','14:37:40'),('2','deepak@gmail.com','Deepak Panwar','imageedit_3_5906472579.png','01:09:2022','13:13:49');
/*!40000 ALTER TABLE `gt_all_profile_pics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gt_following`
--

DROP TABLE IF EXISTS `gt_following`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gt_following` (
  `unique_id` varchar(100) DEFAULT NULL,
  `kon_email` varchar(100) DEFAULT NULL,
  `kon_name` varchar(100) DEFAULT NULL,
  `kon_profile_pic` varchar(100) DEFAULT NULL,
  `kisko_email` varchar(100) DEFAULT NULL,
  `kisko_name` varchar(100) DEFAULT NULL,
  `kisko_profile_pic` varchar(100) DEFAULT NULL,
  `date1` varchar(100) DEFAULT NULL,
  `time1` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gt_following`
--

LOCK TABLES `gt_following` WRITE;
/*!40000 ALTER TABLE `gt_following` DISABLE KEYS */;
INSERT INTO `gt_following` VALUES ('1','vironika@gmail.com','Vironika','female.jpg','deepak@gmail.com','Deepak Panwar','male.png','21:06:2020','14:32:42','seen'),('2','deepak@gmail.com','Deepak Panwar','imageedit_3_5906472579.png','vironika@gmail.com','Vironika','female.jpg','21:06:2020','14:39:05','seen');
/*!40000 ALTER TABLE `gt_following` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gt_messages`
--

DROP TABLE IF EXISTS `gt_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gt_messages` (
  `unique_id` varchar(100) DEFAULT NULL,
  `kisne_bheja_email` varchar(100) DEFAULT NULL,
  `kisne_bheja_name` varchar(100) DEFAULT NULL,
  `kisne_bheja_profile_pic` varchar(100) DEFAULT NULL,
  `kisko_bheja_email` varchar(100) DEFAULT NULL,
  `kisko_bheja_name` varchar(100) DEFAULT NULL,
  `kisko_bheja_profile_pic` varchar(100) DEFAULT NULL,
  `message` varchar(3000) DEFAULT NULL,
  `date1` varchar(100) DEFAULT NULL,
  `time1` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gt_messages`
--

LOCK TABLES `gt_messages` WRITE;
/*!40000 ALTER TABLE `gt_messages` DISABLE KEYS */;
INSERT INTO `gt_messages` VALUES ('1','vironika@gmail.com','Vironika','female.jpg','deepak@gmail.com','Deepak Panwar','male.png','hi','21:06:2020','14:32:48','_seen'),('2','deepak@gmail.com','Deepak Panwar','imageedit_3_5906472579.png','vironika@gmail.com','Vironika','female.jpg','hello','21:06:2020','14:39:10','_seen');
/*!40000 ALTER TABLE `gt_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gt_register`
--

DROP TABLE IF EXISTS `gt_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gt_register` (
  `unique_id` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `birthday` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `profile_pic` varchar(100) DEFAULT NULL,
  `date1` varchar(100) DEFAULT NULL,
  `time1` varchar(100) DEFAULT NULL,
  `theme` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gt_register`
--

LOCK TABLES `gt_register` WRITE;
/*!40000 ALTER TABLE `gt_register` DISABLE KEYS */;
INSERT INTO `gt_register` VALUES ('1','Deepak Panwar','deepak@gmail.com','deepak123','Chandigarh','21-01-1994','Male','imageedit_3_5906472579.png','21:06:2020','14:29:23','#F0FFF0'),('2','Vironika','vironika@gmail.com','vironika123','Chandigarh','21-06-1996','Female','female.jpg','21:06:2020','14:32:28','#F0F7FF');
/*!40000 ALTER TABLE `gt_register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gt_status_update`
--

DROP TABLE IF EXISTS `gt_status_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gt_status_update` (
  `unique_id` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `profile_pic` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  `date1` varchar(100) DEFAULT NULL,
  `time1` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gt_status_update`
--

LOCK TABLES `gt_status_update` WRITE;
/*!40000 ALTER TABLE `gt_status_update` DISABLE KEYS */;
INSERT INTO `gt_status_update` VALUES ('1','vironika@gmail.com','Vironika','female.jpg','My new home....','1-about-gravity-pdhgqtthsh0xkpf5sjzl693xrud3n08dtv96637xfk.jpg','01:09:2022','13:11:51');
/*!40000 ALTER TABLE `gt_status_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gt_user_information`
--

DROP TABLE IF EXISTS `gt_user_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gt_user_information` (
  `unique_id` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `profile_pic` varchar(100) DEFAULT NULL,
  `date1` varchar(100) DEFAULT NULL,
  `time1` varchar(100) DEFAULT NULL,
  `interested_in` varchar(100) DEFAULT NULL,
  `relationship` varchar(100) DEFAULT NULL,
  `hobbies` varchar(100) DEFAULT NULL,
  `phone_no` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `college` varchar(100) DEFAULT NULL,
  `trade` varchar(100) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gt_user_information`
--

LOCK TABLES `gt_user_information` WRITE;
/*!40000 ALTER TABLE `gt_user_information` DISABLE KEYS */;
INSERT INTO `gt_user_information` VALUES ('1','Deepak Panwar','deepak@gmail.com','imageedit_3_5906472579.png','21:06:2020','14:29:23','--not updated--','--not updated--','--not updated--','--not updated--','--not updated--','--not updated--','--not updated--','--not updated--','--not updated--'),('2','Vironika','vironika@gmail.com','female.jpg','21:06:2020','14:32:28','--not updated--','--not updated--','--not updated--','--not updated--','--not updated--','--not updated--','--not updated--','--not updated--','--not updated--');
/*!40000 ALTER TABLE `gt_user_information` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


