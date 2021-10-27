-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: gestionenchere
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `acheterprestat`
--

DROP TABLE IF EXISTS `acheterprestat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acheterprestat` (
  `idMembreAP` int DEFAULT NULL,
  `idPrestationAP` int DEFAULT NULL,
  KEY `idMembreAP_idx` (`idMembreAP`),
  KEY `idPrestationAP_idx` (`idPrestationAP`),
  CONSTRAINT `idMembreAP` FOREIGN KEY (`idMembreAP`) REFERENCES `membre` (`idMembre`),
  CONSTRAINT `idPrestationAP` FOREIGN KEY (`idPrestationAP`) REFERENCES `prestation` (`idPromotion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acheterprestat`
--

LOCK TABLES `acheterprestat` WRITE;
/*!40000 ALTER TABLE `acheterprestat` DISABLE KEYS */;
/*!40000 ALTER TABLE `acheterprestat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent`
--

DROP TABLE IF EXISTS `agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agent` (
  `idagent` int NOT NULL AUTO_INCREMENT,
  `budget` double DEFAULT NULL,
  PRIMARY KEY (`idagent`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent`
--

LOCK TABLES `agent` WRITE;
/*!40000 ALTER TABLE `agent` DISABLE KEYS */;
INSERT INTO `agent` VALUES (1,400),(2,NULL),(3,NULL);
/*!40000 ALTER TABLE `agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `benefice`
--

DROP TABLE IF EXISTS `benefice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `benefice` (
  `montantBenefice` double DEFAULT NULL,
  `idagent1` int DEFAULT NULL,
  `idStock` int DEFAULT NULL,
  KEY `idStock_idx` (`idagent1`,`idStock`),
  KEY `idagent_idx` (`idagent1`),
  KEY `idStock_idx1` (`idStock`),
  CONSTRAINT `idagent1` FOREIGN KEY (`idagent1`) REFERENCES `agent` (`idagent`),
  CONSTRAINT `idStock` FOREIGN KEY (`idStock`) REFERENCES `stock` (`idStock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benefice`
--

LOCK TABLES `benefice` WRITE;
/*!40000 ALTER TABLE `benefice` DISABLE KEYS */;
/*!40000 ALTER TABLE `benefice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorie` (
  `idCategorie` int NOT NULL AUTO_INCREMENT,
  `libelleC` varchar(45) NOT NULL,
  PRIMARY KEY (`idCategorie`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorie`
--

LOCK TABLES `categorie` WRITE;
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
INSERT INTO `categorie` VALUES (1,'Alimentation'),(2,'Alimentation'),(3,'Alimentation'),(4,'Alimentation'),(5,'Alimentation'),(6,'Alimentation'),(7,'Alimentation'),(8,'Alimentation'),(9,'Alimentation'),(10,'Alimentation'),(11,'Alimentation'),(12,'Alimentation'),(13,'Alimentation'),(14,'Alimentation'),(15,'Alimentation'),(16,'Alimentation'),(17,'Alimentation'),(18,'Alimentation'),(19,'Alimentation'),(20,'Alimentation'),(21,'Alimentation'),(22,'Alimentation'),(23,'Alimentation'),(24,'Alimentation'),(25,'Alimentation'),(26,'Alimentation'),(27,'Alimentation'),(28,'Alimentation');
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enchere`
--

DROP TABLE IF EXISTS `enchere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enchere` (
  `idEnchere` int NOT NULL AUTO_INCREMENT,
  `libelleE` varchar(45) NOT NULL,
  `modele` varchar(45) DEFAULT NULL,
  `descriptionE` varchar(200) DEFAULT NULL,
  `PrixDep` double DEFAULT NULL,
  `PrixRes` double DEFAULT NULL,
  `PrixAchatIm` double DEFAULT NULL,
  `FraisTransport` double DEFAULT NULL,
  `etatEnchere` varchar(45) DEFAULT NULL,
  `idMembrePlus` int DEFAULT NULL,
  `idMembre` int DEFAULT NULL,
  `idCategorieE` int DEFAULT NULL,
  PRIMARY KEY (`idEnchere`),
  UNIQUE KEY `idEnchere_UNIQUE` (`idEnchere`),
  KEY `idMembrePlus_idx` (`idMembrePlus`),
  KEY `idMembre_idx` (`idMembre`),
  KEY `idCategorieE_idx` (`idCategorieE`),
  CONSTRAINT `idCategorieE` FOREIGN KEY (`idCategorieE`) REFERENCES `categorie` (`idCategorie`),
  CONSTRAINT `idMembre` FOREIGN KEY (`idMembre`) REFERENCES `membre` (`idMembre`),
  CONSTRAINT `idMembrePlus` FOREIGN KEY (`idMembrePlus`) REFERENCES `membreplus` (`idmembreplus`)
) ENGINE=InnoDB AUTO_INCREMENT=368886 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enchere`
--

LOCK TABLES `enchere` WRITE;
/*!40000 ALTER TABLE `enchere` DISABLE KEYS */;
INSERT INTO `enchere` VALUES (1,'portable','iphone 12',NULL,100,NULL,500,NULL,NULL,NULL,NULL,NULL),(2,'portable','iphone 12',NULL,100,NULL,600,NULL,NULL,NULL,NULL,NULL),(3,'portable','iphone 12',NULL,100,NULL,450,NULL,NULL,NULL,NULL,NULL),(246,'Ancien nuclaire bomb','Japenese',NULL,40,NULL,20,NULL,NULL,NULL,NULL,NULL),(23467,'Ancien nuclaire bomb','Russie',NULL,40,NULL,20,NULL,NULL,NULL,NULL,NULL),(368809,'Ancien nuclaire bomb','American',NULL,NULL,NULL,40,NULL,NULL,NULL,NULL,NULL),(368819,'Ancienne bomb nuclaire','Russian',NULL,NULL,NULL,400,NULL,NULL,NULL,NULL,NULL),(368820,'Ancienne bomb nuclaire','Russian',NULL,NULL,NULL,500,NULL,NULL,NULL,NULL,NULL),(368821,'Ancienne bomb nuclaire','Russian',NULL,NULL,NULL,400,NULL,NULL,NULL,NULL,NULL),(368822,'Ancienne bomb nuclaire','Russian',NULL,NULL,NULL,400,NULL,NULL,NULL,NULL,NULL),(368823,'Ancienne bomb nuclaire','Russian',NULL,NULL,NULL,400,NULL,NULL,NULL,NULL,NULL),(368824,'Ancienne bomb nuclaire','Russian',NULL,NULL,NULL,423,NULL,NULL,NULL,NULL,NULL),(368826,'Ancienne bomb nuclaire','Russian',NULL,NULL,NULL,466,NULL,NULL,NULL,NULL,NULL),(368827,'Ancien nuclaire bomb','American',NULL,NULL,NULL,40,NULL,NULL,NULL,NULL,NULL),(368828,'Ancien nuclaire bomb','American',NULL,NULL,NULL,54,NULL,NULL,NULL,NULL,NULL),(368829,'Ancien nuclaire bomb','American',NULL,NULL,NULL,40,NULL,NULL,NULL,NULL,NULL),(368843,'Ancien nuclaire bomb','American',NULL,NULL,NULL,123,NULL,NULL,NULL,NULL,NULL),(368845,'Ancien nuclaire bomb','American',NULL,NULL,NULL,345,NULL,NULL,NULL,NULL,NULL),(368855,'Ancien nuclaire bomb','American',NULL,NULL,NULL,23,NULL,NULL,NULL,NULL,NULL),(368861,'Ancien nuclaire bomb','American',NULL,NULL,NULL,12,NULL,NULL,NULL,NULL,NULL),(368863,'Ancien nuclaire bomb','American',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL),(368867,'Ancien nuclaire bomb','American',NULL,NULL,NULL,122,NULL,NULL,NULL,NULL,NULL),(368868,'Ancien nuclaire bomb','American',NULL,NULL,NULL,80,NULL,NULL,NULL,NULL,NULL),(368869,'Ancien nuclaire bomb','American',NULL,NULL,NULL,67,NULL,NULL,NULL,NULL,NULL),(368870,'Ancien nuclaire bomb','American',NULL,NULL,NULL,78,NULL,NULL,NULL,NULL,NULL),(368871,'Ancien nuclaire bomb','American',NULL,NULL,NULL,45,NULL,NULL,NULL,NULL,NULL),(368872,'Ancien nuclaire bomb','American',NULL,NULL,NULL,30,NULL,NULL,NULL,NULL,NULL),(368873,'Ancien nuclaire bomb','American',NULL,NULL,NULL,35,NULL,NULL,NULL,NULL,NULL),(368874,'Ancien nuclaire bomb','American',NULL,NULL,NULL,40,NULL,NULL,NULL,NULL,NULL),(368875,'Ancien nuclaire bomb','American',NULL,NULL,NULL,20,NULL,NULL,NULL,NULL,NULL),(368876,'Ancien nuclaire bomb','American',NULL,NULL,NULL,20,NULL,NULL,NULL,NULL,NULL),(368877,'Ancien nuclaire bomb','American',NULL,NULL,NULL,20,NULL,NULL,NULL,NULL,NULL),(368878,'Ancien nuclaire bomb','American',NULL,NULL,NULL,20,NULL,NULL,NULL,NULL,NULL),(368879,'Ancien nuclaire bomb','American',NULL,NULL,NULL,20,NULL,NULL,NULL,NULL,NULL),(368880,'Ancien nuclaire bomb','American',NULL,NULL,NULL,20,NULL,NULL,NULL,NULL,NULL),(368881,'Ancien nuclaire bomb','American',NULL,NULL,NULL,20,NULL,NULL,NULL,NULL,NULL),(368882,'Ancien nuclaire bomb','American',NULL,NULL,NULL,24,NULL,NULL,NULL,NULL,NULL),(368883,'Ancienne bomb nuclaire','Russian',NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,NULL),(368884,'Ancien nuclaire bomb','Russian',NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,NULL),(368885,'Ancien nuclaire bomb','Russian',NULL,NULL,NULL,30,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `enchere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etatenchere`
--

DROP TABLE IF EXISTS `etatenchere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etatenchere` (
  `idetatEnchere` int NOT NULL AUTO_INCREMENT,
  `etatEnchere` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idetatEnchere`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etatenchere`
--

LOCK TABLES `etatenchere` WRITE;
/*!40000 ALTER TABLE `etatenchere` DISABLE KEYS */;
INSERT INTO `etatenchere` VALUES (1,'EN_ATTENTE'),(2,'EN_COURS'),(3,'TERMINEE'),(4,'ANNULEE');
/*!40000 ALTER TABLE `etatenchere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluer`
--

DROP TABLE IF EXISTS `evaluer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluer` (
  `idMembreEnvoi` int DEFAULT NULL,
  `idMembreRecoi` int DEFAULT NULL,
  `evaluation` varchar(200) DEFAULT NULL,
  KEY `idMembreEnvoi_idx` (`idMembreEnvoi`),
  KEY `idMembreRecoi_idx` (`idMembreRecoi`),
  CONSTRAINT `idMembreEnvoi` FOREIGN KEY (`idMembreEnvoi`) REFERENCES `membre` (`idMembre`),
  CONSTRAINT `idMembreRecoi` FOREIGN KEY (`idMembreRecoi`) REFERENCES `membre` (`idMembre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluer`
--

LOCK TABLES `evaluer` WRITE;
/*!40000 ALTER TABLE `evaluer` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membre`
--

DROP TABLE IF EXISTS `membre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membre` (
  `idMembre` int NOT NULL AUTO_INCREMENT,
  `pseudoMembre` varchar(45) NOT NULL,
  `MotDePasse` varchar(45) NOT NULL,
  `nomMembre` varchar(45) NOT NULL,
  `prenomMembre` varchar(45) NOT NULL,
  `AdresseMail` varchar(45) DEFAULT NULL,
  `AdressePostale` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMembre`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membre`
--

LOCK TABLES `membre` WRITE;
/*!40000 ALTER TABLE `membre` DISABLE KEYS */;
INSERT INTO `membre` VALUES (1,'DSB1123','password','Seb','JERK','332253@qq.com','6 rue du 33 rosel 1233'),(2,'DSB1123','password','Seb','JERK','332253@qq.com','6 rue du 33 rosel 1233'),(16,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(17,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(18,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(19,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(20,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(21,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(22,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(23,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(24,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(25,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(26,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(27,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(28,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(29,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(30,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(31,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(32,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(33,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(34,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(35,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(36,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(37,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(38,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(39,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(40,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(41,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(42,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(43,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(44,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(45,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(46,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(47,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(48,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(49,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(50,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(51,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(52,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(53,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(54,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(55,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(56,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(57,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(58,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(59,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(60,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(61,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(62,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(63,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(64,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(65,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(66,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(67,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(68,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(69,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(70,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(71,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(72,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(73,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(74,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(75,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(76,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(77,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(78,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(79,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(80,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(81,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(82,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(83,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(84,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(85,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(86,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(87,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(88,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(89,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(90,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(91,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(92,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(93,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(94,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(95,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(96,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(97,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(98,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(99,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(100,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(101,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(102,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(103,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(104,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(105,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(106,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(107,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(108,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(109,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(110,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(111,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(112,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(113,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(114,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(115,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(116,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(117,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(118,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(119,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(120,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(121,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(122,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(123,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(124,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(125,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(126,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(127,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(128,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(129,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(130,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(131,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(132,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(133,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(134,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(135,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(136,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(137,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(138,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(139,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(140,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(141,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(142,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(143,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(144,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(145,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(146,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(147,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(148,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(149,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(150,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(151,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(152,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(153,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(154,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(155,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(156,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(157,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(158,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(159,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(160,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(161,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(162,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(163,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(164,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(165,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(166,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(167,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(168,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(169,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(170,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(171,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(172,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(173,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(174,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(175,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(176,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(177,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(178,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(179,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(180,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(181,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(182,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(183,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(184,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(185,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(186,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(187,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(188,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(189,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(190,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(191,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(192,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(193,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(194,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(195,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(196,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(197,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(198,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(199,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(200,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(201,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(202,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(203,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(204,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(205,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(206,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(207,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(208,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(209,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(210,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(211,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(212,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(213,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(214,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt'),(215,'HGDSB','nmsl','Ologe','DICK','3322@qqq.com','3 rue du er nov'),(216,'james1124','12345','Cruce','THOMAS','12334@126.com','9 rue du prisident Rosvolt');
/*!40000 ALTER TABLE `membre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membreplus`
--

DROP TABLE IF EXISTS `membreplus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membreplus` (
  `idmembreplus` int NOT NULL AUTO_INCREMENT,
  `nomMP` varchar(45) DEFAULT NULL,
  `AdresseMailMP` varchar(45) DEFAULT NULL,
  `AdressePostalMP` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idmembreplus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membreplus`
--

LOCK TABLES `membreplus` WRITE;
/*!40000 ALTER TABLE `membreplus` DISABLE KEYS */;
/*!40000 ALTER TABLE `membreplus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestation`
--

DROP TABLE IF EXISTS `prestation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestation` (
  `idPromotion` int NOT NULL AUTO_INCREMENT,
  `nomP` varchar(45) NOT NULL,
  `PrixP` double DEFAULT NULL,
  `PrixPMP` double DEFAULT NULL,
  PRIMARY KEY (`idPromotion`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestation`
--

LOCK TABLES `prestation` WRITE;
/*!40000 ALTER TABLE `prestation` DISABLE KEYS */;
INSERT INTO `prestation` VALUES (1,'En gras titre',0.5,0.3),(2,'Top l\'enchere',1,0.8),(3,'Ajoute un photo supplementaire',0.4,0.2),(4,'Description detail',3.5,2),(5,'titre plus haut',3,1),(6,'titre en gras',1,0.8),(7,'photo supplementaire',0.4,0.2),(8,'Description detail',3.5,2),(9,'titre plus haut',3,1),(10,'titre en gras',1,0.8),(11,'photo supplementaire',0.4,0.2),(12,'Description detail',3.5,2),(13,'titre plus haut',3,1),(14,'titre en gras',1,0.8),(15,'photo supplementaire',0.4,0.2),(16,'Description detail',3.5,2),(17,'titre plus haut',3,1),(18,'titre en gras',1,0.8),(19,'photo supplementaire',0.4,0.2),(20,'Description detail',3.5,2),(21,'titre plus haut',3,1),(22,'titre en gras',1,0.8),(23,'photo supplementaire',0.4,0.2),(24,'Description detail',3.5,2),(25,'titre plus haut',3,1),(26,'titre en gras',1,0.8),(27,'photo supplementaire',0.4,0.2),(28,'Description detail',3.5,2),(29,'titre plus haut',3,1),(30,'titre en gras',1,0.8),(31,'photo supplementaire',0.4,0.2),(32,'Description detail',3.5,2),(33,'titre plus haut',3,1),(34,'titre en gras',1,0.8),(35,'photo supplementaire',0.4,0.2),(36,'Description detail',3.5,2),(37,'titre plus haut',3,1),(38,'titre en gras',1,0.8),(39,'photo supplementaire',0.4,0.2),(40,'Description detail',3.5,2),(41,'titre plus haut',3,1),(42,'titre en gras',1,0.8),(43,'photo supplementaire',0.4,0.2),(44,'Description detail',3.5,2),(45,'titre plus haut',3,1),(46,'titre en gras',1,0.8),(47,'photo supplementaire',0.4,0.2),(48,'Description detail',3.5,2),(49,'titre plus haut',3,1),(50,'titre en gras',1,0.8),(51,'photo supplementaire',0.4,0.2),(52,'Description detail',3.5,2),(53,'titre plus haut',3,1),(54,'titre en gras',1,0.8),(55,'photo supplementaire',0.4,0.2),(56,'Description detail',3.5,2),(57,'titre plus haut',3,1),(58,'titre en gras',1,0.8),(59,'photo supplementaire',0.4,0.2),(60,'Description detail',3.5,2),(61,'titre plus haut',3,1),(62,'titre en gras',1,0.8),(63,'photo supplementaire',0.4,0.2),(64,'Description detail',3.5,2),(65,'titre plus haut',3,1),(66,'titre en gras',1,0.8),(67,'photo supplementaire',0.4,0.2),(68,'Description detail',3.5,2),(69,'titre plus haut',3,1),(70,'titre en gras',1,0.8),(71,'photo supplementaire',0.4,0.2),(72,'Description detail',3.5,2),(73,'titre plus haut',3,1),(74,'titre en gras',1,0.8),(75,'photo supplementaire',0.4,0.2),(76,'Description detail',3.5,2),(77,'titre plus haut',3,1),(78,'titre en gras',1,0.8),(79,'photo supplementaire',0.4,0.2),(80,'Description detail',3.5,2),(81,'titre plus haut',3,1),(82,'titre en gras',1,0.8),(83,'photo supplementaire',0.4,0.2),(84,'Description detail',3.5,2),(85,'titre plus haut',3,1),(86,'titre en gras',1,0.8),(87,'photo supplementaire',0.4,0.2),(88,'Description detail',3.5,2),(89,'titre plus haut',3,1),(90,'titre en gras',1,0.8),(91,'photo supplementaire',0.4,0.2),(92,'Description detail',3.5,2),(93,'titre plus haut',3,1),(94,'titre en gras',1,0.8),(95,'photo supplementaire',0.4,0.2),(96,'Description detail',3.5,2),(97,'titre plus haut',3,1),(98,'titre en gras',1,0.8),(99,'photo supplementaire',0.4,0.2),(100,'Description detail',3.5,2),(101,'titre plus haut',3,1),(102,'titre en gras',1,0.8),(103,'photo supplementaire',0.4,0.2),(104,'Description detail',3.5,2),(105,'titre plus haut',3,1),(106,'titre en gras',1,0.8),(107,'photo supplementaire',0.4,0.2),(108,'Description detail',3.5,2),(109,'titre plus haut',3,1),(110,'titre en gras',1,0.8),(111,'photo supplementaire',0.4,0.2),(112,'Description detail',3.5,2),(113,'titre plus haut',3,1),(114,'titre en gras',1,0.8),(115,'photo supplementaire',0.4,0.2),(116,'Description detail',3.5,2),(117,'titre plus haut',3,1),(118,'titre en gras',1,0.8),(119,'photo supplementaire',0.4,0.2),(120,'Description detail',3.5,2),(121,'titre plus haut',3,1),(122,'titre en gras',1,0.8),(123,'photo supplementaire',0.4,0.2),(124,'Description detail',3.5,2),(125,'titre plus haut',3,1),(126,'titre en gras',1,0.8),(127,'photo supplementaire',0.4,0.2),(128,'Description detail',3.5,2),(129,'titre plus haut',3,1),(130,'titre en gras',1,0.8),(131,'photo supplementaire',0.4,0.2),(132,'Description detail',3.5,2),(133,'titre plus haut',3,1),(134,'titre en gras',1,0.8),(135,'photo supplementaire',0.4,0.2),(136,'Description detail',3.5,2),(137,'titre plus haut',3,1),(138,'titre en gras',1,0.8),(139,'photo supplementaire',0.4,0.2),(140,'Description detail',3.5,2),(141,'titre plus haut',3,1),(142,'titre en gras',1,0.8),(143,'photo supplementaire',0.4,0.2),(144,'Description detail',3.5,2),(145,'titre plus haut',3,1),(146,'titre en gras',1,0.8),(147,'photo supplementaire',0.4,0.2),(148,'Description detail',3.5,2),(149,'titre plus haut',3,1),(150,'titre en gras',1,0.8),(151,'photo supplementaire',0.4,0.2),(152,'Description detail',3.5,2),(153,'titre plus haut',3,1),(154,'titre en gras',1,0.8),(155,'photo supplementaire',0.4,0.2),(156,'Description detail',3.5,2),(157,'titre plus haut',3,1),(158,'titre en gras',1,0.8),(159,'photo supplementaire',0.4,0.2),(160,'Description detail',3.5,2),(161,'titre plus haut',3,1),(162,'titre en gras',1,0.8),(163,'photo supplementaire',0.4,0.2),(164,'Description detail',3.5,2),(165,'titre plus haut',3,1),(166,'titre en gras',1,0.8),(167,'photo supplementaire',0.4,0.2),(168,'Description detail',3.5,2),(169,'titre plus haut',3,1),(170,'titre en gras',1,0.8),(171,'photo supplementaire',0.4,0.2),(172,'Description detail',3.5,2),(173,'titre plus haut',3,1),(174,'titre en gras',1,0.8),(175,'photo supplementaire',0.4,0.2),(176,'Description detail',3.5,2),(177,'titre plus haut',3,1),(178,'titre en gras',1,0.8),(179,'photo supplementaire',0.4,0.2),(180,'Description detail',3.5,2),(181,'titre plus haut',3,1),(182,'titre en gras',1,0.8),(183,'photo supplementaire',0.4,0.2),(184,'Description detail',3.5,2),(185,'titre plus haut',3,1),(186,'titre en gras',1,0.8),(187,'photo supplementaire',0.4,0.2),(188,'Description detail',3.5,2),(189,'titre plus haut',3,1),(190,'titre en gras',1,0.8),(191,'photo supplementaire',0.4,0.2),(192,'Description detail',3.5,2),(193,'titre plus haut',3,1),(194,'titre en gras',1,0.8),(195,'photo supplementaire',0.4,0.2),(196,'Description detail',3.5,2),(197,'titre plus haut',3,1),(198,'titre en gras',1,0.8),(199,'photo supplementaire',0.4,0.2),(200,'Description detail',3.5,2),(201,'titre plus haut',3,1),(202,'titre en gras',1,0.8),(203,'photo supplementaire',0.4,0.2),(204,'Description detail',3.5,2),(205,'titre plus haut',3,1),(206,'titre en gras',1,0.8),(207,'photo supplementaire',0.4,0.2),(208,'Description detail',3.5,2),(209,'titre plus haut',3,1),(210,'titre en gras',1,0.8),(211,'photo supplementaire',0.4,0.2),(212,'Description detail',3.5,2),(213,'titre plus haut',3,1),(214,'titre en gras',1,0.8),(215,'photo supplementaire',0.4,0.2),(216,'Description detail',3.5,2),(217,'titre plus haut',3,1),(218,'titre en gras',1,0.8),(219,'photo supplementaire',0.4,0.2),(220,'Description detail',3.5,2),(221,'titre plus haut',3,1),(222,'titre en gras',1,0.8),(223,'photo supplementaire',0.4,0.2),(224,'Description detail',3.5,2),(225,'titre plus haut',3,1),(226,'titre en gras',1,0.8),(227,'photo supplementaire',0.4,0.2),(228,'Description detail',3.5,2),(229,'titre plus haut',3,1),(230,'titre en gras',1,0.8),(231,'photo supplementaire',0.4,0.2),(232,'Description detail',3.5,2),(233,'titre plus haut',3,1),(234,'titre en gras',1,0.8),(235,'photo supplementaire',0.4,0.2),(236,'Description detail',3.5,2),(237,'titre plus haut',3,1),(238,'titre en gras',1,0.8),(239,'photo supplementaire',0.4,0.2),(240,'Description detail',3.5,2),(241,'titre plus haut',3,1),(242,'titre en gras',1,0.8),(243,'photo supplementaire',0.4,0.2);
/*!40000 ALTER TABLE `prestation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotion` (
  `idPromotion` int NOT NULL AUTO_INCREMENT,
  `NomPromotion` varchar(45) NOT NULL,
  `DescriptionP` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPromotion`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
INSERT INTO `promotion` VALUES (1,'BIG PAPA ET MAMA',' MYSY'),(2,'BIG PAPA ET MAMA',' MYSY'),(3,'BIG PAPA ET MAMA ','mysy'),(4,'BIG PAPA ET MAMA ','mysy'),(5,'BIG PAPA ET MAMA ','mysy'),(6,'BIG PAPA ET MAMA ','mysy'),(7,'null','MYS2'),(8,'BIG PAPA ET MAMA',' MYSY'),(9,'BIG PAPA ET MAMA',' MYSY'),(10,'BIG PAPA ET MAMA',' MYSY'),(11,'BIG PAPA ET MAMA',' MYSY'),(12,'BIG PAPA ET MAMA',' MYSY'),(13,'BIG PAPA ET MAMA',' MYSY'),(14,'BIG PAPA ET MAMA',' MYSY'),(15,'BIG PAPA ET MAMA',' MYSY'),(16,'BIG PAPA ET MAMA','null'),(17,'BIG PAPA ET MAMA','null'),(18,'BIG PAPA ET MAMA','MYSY'),(19,'BIG PAPA ET MAMA','MYSY'),(20,'BIG PAPA ET MAMA','MYSY'),(21,'BIG PAPA ET MAMA','MYSY'),(22,'BIG PAPA ET MAMA','MYSY'),(23,'BIG PAPA ET MAMA','MYSY'),(24,'BIG PAPA ET MAMA','MYSY'),(25,'BIG PAPA ET MAMA','MYSY'),(26,'BIG PAPA ET MAMA','MYSY'),(27,'BIG PAPA ET MAMA','MYSY'),(28,'BIG PAPA ET MAMA','MYSY'),(29,'BIG PAPA ET MAMA','MYSY'),(30,'BIG PAPA ET MAMA','MYSY'),(31,'BIG PAPA ET MAMA','MYSY'),(32,'BIG PAPA ET MAMA','MYSY'),(33,'BIG PAPA ET MAMA','MYSY'),(34,'BIG PAPA ET MAMA','MYSY'),(35,'BIG PAPA ET MAMA','MYSY'),(36,'BIG PAPA ET MAMA','MYSY'),(37,'BIG PAPA ET MAMA','MYSY'),(38,'BIG PAPA ET MAMA','MYSY'),(39,'BIG PAPA ET MAMA','MYSY'),(40,'BIG PAPA ET MAMA','MYSY'),(41,'BIG PAPA ET MAMA','MYSY'),(42,'BIG PAPA ET MAMA','MYSY'),(43,'BIG PAPA ET MAMA','MYSY'),(44,'BIG PAPA ET MAMA','MYSY'),(45,'BIG PAPA ET MAMA','MYSY'),(46,'BIG PAPA ET MAMA','MYSY'),(47,'BIG PAPA ET MAMA','MYSY'),(48,'BIG PAPA ET MAMA','MYSY'),(49,'BIG PAPA ET MAMA','MYSY'),(50,'BIG PAPA ET MAMA','MYSY'),(51,'BIG PAPA ET MAMA','MYSY'),(52,'BIG PAPA ET MAMA','MYSY'),(53,'BIG PAPA ET MAMA','MYSY'),(54,'BIG PAPA ET MAMA','MYSY'),(55,'BIG PAPA ET MAMA','MYSY'),(56,'BIG PAPA ET MAMA','MYSY'),(57,'BIG PAPA ET MAMA','MYSY'),(58,'BIG PAPA ET MAMA','MYSY');
/*!40000 ALTER TABLE `promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `idService` int NOT NULL AUTO_INCREMENT,
  `NomService` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idService`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,'ServiceInformatique'),(2,'ServiceCommercial'),(3,'ServiceJuridique');
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `souscategorie`
--

DROP TABLE IF EXISTS `souscategorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `souscategorie` (
  `idSousCategorie` int NOT NULL AUTO_INCREMENT,
  `libelleSC` varchar(45) NOT NULL,
  `idCategorieSC` int DEFAULT NULL,
  PRIMARY KEY (`idSousCategorie`),
  KEY `idCategorieSC_idx` (`idCategorieSC`),
  CONSTRAINT `idCategorieSC` FOREIGN KEY (`idCategorieSC`) REFERENCES `categorie` (`idCategorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `souscategorie`
--

LOCK TABLES `souscategorie` WRITE;
/*!40000 ALTER TABLE `souscategorie` DISABLE KEYS */;
/*!40000 ALTER TABLE `souscategorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `idStock` int NOT NULL AUTO_INCREMENT,
  `libelleS` varchar(45) DEFAULT NULL,
  `modeleS` varchar(45) DEFAULT NULL,
  `dateAchat` date DEFAULT NULL,
  `prixAchat` double DEFAULT NULL,
  `idagent` int DEFAULT NULL,
  PRIMARY KEY (`idStock`),
  KEY `idagent_idx` (`idagent`),
  CONSTRAINT `idagent` FOREIGN KEY (`idagent`) REFERENCES `agent` (`idagent`)
) ENGINE=InnoDB AUTO_INCREMENT=249 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,'portable','iphone 12','2021-10-21',500,NULL),(18,'Ancien nuclaire bomb','French','2021-10-26',30,NULL),(19,'Ancien nuclaire bomb','Japanese','2021-10-26',30,NULL),(20,'Ancien nuclaire bomb','Japanese','2021-10-26',20,NULL),(21,'Ancien nuclaire bomb','French','2021-10-26',10,NULL),(22,'Ancien nuclaire bomb','Japanese','2021-10-26',30,NULL),(23,'Ancien nuclaire bomb','Japanese','2021-10-26',10,NULL),(24,'Ancien nuclaire bomb','Japanese','2021-10-26',10,NULL),(26,'Ancien nuclaire bomb','British','2021-10-26',20,NULL),(27,'Ancien nuclaire bomb','TEST','2021-10-26',10,NULL),(28,'Ancien nuclaire bomb','Japanese','2021-10-26',10,NULL),(30,'Ancien nuclaire bomb','test','2021-10-26',20,NULL),(32,'Ancien nuclaire bomb','test','2021-10-26',20,NULL),(34,'Ancien nuclaire bomb','SAHAUC','2021-10-26',10,NULL),(35,'Ancien nuclaire bomb','17','2021-10-26',20,NULL),(38,'Ancien nuclaire bomb','American','2021-10-27',10,NULL),(234,'Ancien nuclaire bombT','American','2021-10-27',20,1);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temps`
--

DROP TABLE IF EXISTS `temps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temps` (
  `Semaine` int NOT NULL,
  PRIMARY KEY (`Semaine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temps`
--

LOCK TABLES `temps` WRITE;
/*!40000 ALTER TABLE `temps` DISABLE KEYS */;
/*!40000 ALTER TABLE `temps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traitermembre`
--

DROP TABLE IF EXISTS `traitermembre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `traitermembre` (
  `idServiceTM` int DEFAULT NULL,
  `idMembreTM` int DEFAULT NULL,
  KEY `idServiceTM_idx` (`idServiceTM`),
  KEY `idMembreTM_idx` (`idMembreTM`),
  CONSTRAINT `idMembreTM` FOREIGN KEY (`idMembreTM`) REFERENCES `membre` (`idMembre`),
  CONSTRAINT `idServiceTM` FOREIGN KEY (`idServiceTM`) REFERENCES `service` (`idService`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traitermembre`
--

LOCK TABLES `traitermembre` WRITE;
/*!40000 ALTER TABLE `traitermembre` DISABLE KEYS */;
/*!40000 ALTER TABLE `traitermembre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traiterpromo`
--

DROP TABLE IF EXISTS `traiterpromo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `traiterpromo` (
  `idServiceCP` int DEFAULT NULL,
  `idPromotionCP` int DEFAULT NULL,
  `traitement` varchar(45) DEFAULT NULL,
  KEY `idServiceCP_idx` (`idServiceCP`),
  KEY `idPromotionCP_idx` (`idPromotionCP`),
  CONSTRAINT `idPromotionCP` FOREIGN KEY (`idPromotionCP`) REFERENCES `promotion` (`idPromotion`),
  CONSTRAINT `idServiceCP` FOREIGN KEY (`idServiceCP`) REFERENCES `service` (`idService`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traiterpromo`
--

LOCK TABLES `traiterpromo` WRITE;
/*!40000 ALTER TABLE `traiterpromo` DISABLE KEYS */;
/*!40000 ALTER TABLE `traiterpromo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-27 14:47:04
