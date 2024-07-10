-- MySQL dump 10.13  Distrib 8.0.37, for Win64 (x86_64)
--
-- Host: localhost    Database: gestionbibliotheque
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `auteurs`
--

DROP TABLE IF EXISTS `auteurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auteurs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `nationalite` varchar(50) NOT NULL,
  `date_naiss` date NOT NULL,
  `biographie` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auteurs`
--

LOCK TABLES `auteurs` WRITE;
/*!40000 ALTER TABLE `auteurs` DISABLE KEYS */;
/*!40000 ALTER TABLE `auteurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editeurs`
--

DROP TABLE IF EXISTS `editeurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editeurs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `adresse` varchar(100) NOT NULL,
  `site_web` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `un_tel` (`site_web`),
  UNIQUE KEY `un_mail` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editeurs`
--

LOCK TABLES `editeurs` WRITE;
/*!40000 ALTER TABLE `editeurs` DISABLE KEYS */;
/*!40000 ALTER TABLE `editeurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emprunts`
--

DROP TABLE IF EXISTS `emprunts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emprunts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_emprunt` date NOT NULL,
  `membre_id` int NOT NULL,
  `livre_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_emp_m` (`membre_id`),
  KEY `fk_emp_l` (`livre_id`),
  CONSTRAINT `fk_emp_l` FOREIGN KEY (`livre_id`) REFERENCES `livres` (`ISBN`),
  CONSTRAINT `fk_emp_m` FOREIGN KEY (`membre_id`) REFERENCES `membres` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emprunts`
--

LOCK TABLES `emprunts` WRITE;
/*!40000 ALTER TABLE `emprunts` DISABLE KEYS */;
/*!40000 ALTER TABLE `emprunts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livres`
--

DROP TABLE IF EXISTS `livres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livres` (
  `ISBN` varchar(50) NOT NULL,
  `titre` varchar(50) NOT NULL,
  `date_pub` date NOT NULL,
  `nbre_pages` int NOT NULL,
  `localisation` decimal(15,2) NOT NULL,
  `statut` varchar(30) NOT NULL,
  `editeur_id` int NOT NULL,
  `auteur_id` int NOT NULL,
  PRIMARY KEY (`ISBN`),
  KEY `fk_livre_e` (`editeur_id`),
  KEY `fk_livre_a` (`auteur_id`),
  CONSTRAINT `fk_livre_a` FOREIGN KEY (`auteur_id`) REFERENCES `auteurs` (`id`),
  CONSTRAINT `fk_livre_e` FOREIGN KEY (`editeur_id`) REFERENCES `editeurs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livres`
--

LOCK TABLES `livres` WRITE;
/*!40000 ALTER TABLE `livres` DISABLE KEYS */;
/*!40000 ALTER TABLE `livres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membres`
--

DROP TABLE IF EXISTS `membres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `adresse` varchar(100) NOT NULL,
  `num_tel` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `genre` char(3) NOT NULL,
  `date_inscrip` date NOT NULL,
  `date_exp_ad` date NOT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `ck_genre` CHECK (((`genre` = _cp850'M') or (`genre` = _cp850'F'))),
  CONSTRAINT `ck_type` CHECK (((`type` = _cp850'adulte') or (`type` = _cp850'enfant') or (`type` = _cp850'etudiant')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membres`
--

LOCK TABLES `membres` WRITE;
/*!40000 ALTER TABLE `membres` DISABLE KEYS */;
/*!40000 ALTER TABLE `membres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retours`
--

DROP TABLE IF EXISTS `retours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `retours` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_retour` date NOT NULL,
  `retard` int NOT NULL,
  `amende` decimal(15,3) NOT NULL,
  `membre_id` int NOT NULL,
  `livre_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ret_m` (`membre_id`),
  KEY `fk_ret_l` (`livre_id`),
  CONSTRAINT `fk_ret_l` FOREIGN KEY (`livre_id`) REFERENCES `livres` (`ISBN`),
  CONSTRAINT `fk_ret_m` FOREIGN KEY (`membre_id`) REFERENCES `membres` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retours`
--

LOCK TABLES `retours` WRITE;
/*!40000 ALTER TABLE `retours` DISABLE KEYS */;
/*!40000 ALTER TABLE `retours` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-10 10:32:07
