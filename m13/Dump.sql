-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: localhost    Database: devops
-- ------------------------------------------------------
-- Server version       8.0.25

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
-- Table structure for table `Result`
--
DROP TABLE IF EXISTS `Result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Result` (
  `id` mediumint NOT NULL AUTO_INCREMENT,
  `Student_id` int NOT NULL,
  `Task1` char(30) NOT NULL,
  `Task2` char(30) NOT NULL,
  `Task3` char(30) NOT NULL,
  `Task4` char(30) NOT NULL,
  `Task5` char(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Result`
--

LOCK TABLES `Result` WRITE;
/*!40000 ALTER TABLE `Result` DISABLE KEYS */;
INSERT INTO `Result` VALUES (1,1,'Done','Done+','Done+','Done+','Done'),(2,2,'Done+','Done+','Done+','Done+','Done+'),(3,3,'Done','Done+','Done+','Done+','Done+'),(4,4,'Done+','Done+','Done','Done','Done'),(5,5,'Done','Done','Done','Done','Not compleated'),(6,6,'Done+','Done+','Done+','Done+','Done+'),(7,7,'Done','Not compleated','Done','Done','Not compleated'),(8,8,'Done','Done+','Done','Done','Done'),(9,9,'Done+','Done+','Done+','Done','Done'),(10,10,'Done','Done','Done','Done','Done'),(11,11,'Done','Done+','Done+','Done+','Done+'),(12,12,'Done','Done+','Done','Done','Done+'),(13,13,'Done','Done+','Done+','Done+','Done+'),(14,14,'Done','Done+','Done+','Done+','Done'),(15,15,'Done','Done+','Done+','Done+','Done+'),(16,16,'Done+','Done+','Done+','Done+','Done+'),(17,17,'Done+','Done+','Done+','Done+','Done'),(18,18,'Done','Done','Done+','Done+','Done'),(19,19,'Done','Done','Done','Done','Not compleated'),(20,20,'Done','Done+','Done+','Done+','Done+'),(21,21,'Done+','Done+','Done+','Done+','Done+');
/*!40000 ALTER TABLE `Result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Students`
--

DROP TABLE IF EXISTS `Students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Students` (
  `id` mediumint NOT NULL AUTO_INCREMENT,
  `Student` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Student_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Students`
--

LOCK TABLES `Students` WRITE;
/*!40000 ALTER TABLE `Students` DISABLE KEYS */;
INSERT INTO `Students` VALUES (1,'Nazar Vinnyk',1),(2,'Alexandr Rekun',2),(3,'Oleh Bandrivsky',3),(4,'Vladimir Burdyko',4),(5,'Vadim Markov',5),(6,'Ihor Voytux',6),(7,'Dmitry Moshna',7),(8,'Eugeniy Kozlovsky',8),(9,'Ed Elensky',9),(10,'Ihor Zinchenko',10),(11,'Vitaliy Kostyukov',11),(12,'Evgeny Lactushin',12),(13,'Michail Lopaev',13),(14,'Michail Mostyka',14),(15,'Andrew Novgorodsky',15),(16,'Anna Sazonova',16),(17,'Dmitry Solovey',17),(18,'Artem Fortunatov',18),(19,'Ivan Khomenko',19),(20,'Alexey Shutov',20),(21,'Yuriy Shcherbina',21);
/*!40000 ALTER TABLE `Students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-02  9:54:27
