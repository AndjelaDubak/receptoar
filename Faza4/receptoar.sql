CREATE DATABASE  IF NOT EXISTS `receptoar` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `receptoar`;
-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: receptoar
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `glas`
--

DROP TABLE IF EXISTS `glas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glas` (
  `ID_objava` int NOT NULL,
  `ID_korisnik` int NOT NULL,
  `Glasao` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_objava`,`ID_korisnik`),
  KEY `fk_Glas_Korisnik_idx` (`ID_korisnik`),
  CONSTRAINT `fk_Glas_Korisnik` FOREIGN KEY (`ID_korisnik`) REFERENCES `korisnik` (`ID_korisnik`) ON DELETE CASCADE,
  CONSTRAINT `fk_Glas_Objava1` FOREIGN KEY (`ID_objava`) REFERENCES `objava` (`ID_objava`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `komentar`
--

DROP TABLE IF EXISTS `komentar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `komentar` (
  `ID_komentar` int NOT NULL AUTO_INCREMENT,
  `ID_objava` int NOT NULL,
  `Tekst` varchar(255) DEFAULT NULL,
  `Broj_lajkova` int DEFAULT NULL,
  PRIMARY KEY (`ID_komentar`),
  KEY `fk_Komentar_Objava1_idx` (`ID_objava`),
  CONSTRAINT `fk_Komentar_Objava1` FOREIGN KEY (`ID_objava`) REFERENCES `objava` (`ID_objava`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `korisnik`
--

DROP TABLE IF EXISTS `korisnik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `korisnik` (
  `ID_korisnik` int NOT NULL AUTO_INCREMENT,
  `Ime` varchar(18) NOT NULL,
  `Prezime` varchar(18) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Korisnicko_ime` varchar(18) NOT NULL,
  `Lozinka` varchar(18) NOT NULL,
  `Broj_pobeda` int NOT NULL,
  `Kategorija_korisnika` char(1) NOT NULL,
  PRIMARY KEY (`ID_korisnik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lajk`
--

DROP TABLE IF EXISTS `lajk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lajk` (
  `ID_korisnik` int NOT NULL,
  `ID_komentar` int NOT NULL,
  `Lajkovao` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_korisnik`,`ID_komentar`),
  KEY `fk_lajk_komentar1_idx` (`ID_komentar`),
  CONSTRAINT `fk_lajk_komentar1` FOREIGN KEY (`ID_komentar`) REFERENCES `komentar` (`ID_komentar`) ON DELETE CASCADE,
  CONSTRAINT `fk_Lajk_Korisnik1` FOREIGN KEY (`ID_korisnik`) REFERENCES `korisnik` (`ID_korisnik`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `objava`
--

DROP TABLE IF EXISTS `objava`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objava` (
  `ID_objava` int NOT NULL AUTO_INCREMENT,
  `ID_korisnik` int NOT NULL,
  `ID_tema` int NOT NULL,
  `Fotografija` varchar(255) NOT NULL,
  `Opis` varchar(255) NOT NULL,
  `Broj_glasova` int NOT NULL,
  `Pobednicka` tinyint(1) NOT NULL,
  `Sastojci` varchar(255) NOT NULL,
  `Vreme` timestamp NOT NULL,
  PRIMARY KEY (`ID_objava`),
  UNIQUE KEY `ID_objava_UNIQUE` (`ID_objava`),
  KEY `fk_Objava_Korisnik1_idx` (`ID_korisnik`),
  KEY `fk_Objava_Tema1_idx` (`ID_tema`),
  CONSTRAINT `fk_Objava_Korisnik1` FOREIGN KEY (`ID_korisnik`) REFERENCES `korisnik` (`ID_korisnik`) ON DELETE CASCADE,
  CONSTRAINT `fk_Objava_Tema1` FOREIGN KEY (`ID_tema`) REFERENCES `tema` (`ID_tema`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tema`
--

DROP TABLE IF EXISTS `tema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tema` (
  `ID_tema` int NOT NULL AUTO_INCREMENT,
  `Naziv` varchar(50) NOT NULL,
  `Aktuelna` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID_tema`),
  UNIQUE KEY `ID_tema_UNIQUE` (`ID_tema`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'receptoar'
--

--
-- Dumping routines for database 'receptoar'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-27 12:13:57
