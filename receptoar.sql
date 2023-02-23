CREATE DATABASE  IF NOT EXISTS `receptoar` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
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
CREATE TABLE IF NOT EXISTS `glas` (
  `ID_objava` int NOT NULL,
  `ID_korisnik` int NOT NULL,
  `Glasao` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_objava`,`ID_korisnik`),
  KEY `fk_Glas_Korisnik_idx` (`ID_korisnik`),
  CONSTRAINT `fk_Glas_Korisnik` FOREIGN KEY (`ID_korisnik`) REFERENCES `korisnik` (`ID_korisnik`) ON DELETE CASCADE,
  CONSTRAINT `fk_Glas_Objava1` FOREIGN KEY (`ID_objava`) REFERENCES `objava` (`ID_objava`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `glas` (`ID_objava`, `ID_korisnik`, `Glasao`) VALUES
(1, 6, 1),
(2, 2, 1),
(2, 3, 1),
(2, 5, 1),
(4, 2, 1),
(4, 3, 1),
(4, 4, 1),
(4, 5, 1),
(5, 4, 1);

--
-- Table structure for table `komentar`
--

DROP TABLE IF EXISTS `komentar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `komentar` (
  `ID_komentar` int NOT NULL AUTO_INCREMENT,
  `ID_objava` int NOT NULL,
  `Tekst` varchar(255) DEFAULT NULL,
  `Broj_lajkova` int DEFAULT NULL,
  PRIMARY KEY (`ID_komentar`),
  KEY `fk_Komentar_Objava1_idx` (`ID_objava`),
  CONSTRAINT `fk_Komentar_Objava1` FOREIGN KEY (`ID_objava`) REFERENCES `objava` (`ID_objava`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `komentar` (`ID_komentar`, `ID_objava`, `Tekst`, `Broj_lajkova`) VALUES
(1, 2, 'Koliko vremena za pripremu?', 1),
(2, 1, 'Lepo :)', 0),
(3, 5, 'Ukusno!', 0);

--
-- Table structure for table `korisnik`
--

DROP TABLE IF EXISTS `korisnik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `korisnik` (
  `ID_korisnik` int NOT NULL AUTO_INCREMENT,
  `Ime` varchar(18) NOT NULL,
  `Prezime` varchar(18) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Korisnicko_ime` varchar(18) NOT NULL,
  `Lozinka` varchar(18) NOT NULL,
  `Broj_pobeda` int NOT NULL,
  `Kategorija_korisnika` char(1) NOT NULL,
  PRIMARY KEY (`ID_korisnik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


INSERT INTO `korisnik` (`ID_korisnik`, `Ime`, `Prezime`, `Email`, `Korisnicko_ime`, `Lozinka`, `Broj_pobeda`, `Kategorija_korisnika`) VALUES
(1, 'Andjela', 'Dubak', 'andjela@gmail.com', 'andjela', '123456789', 0, 'A'),
(2, 'Aleksandar', 'Dopudja', 'dop@gmail.com', 'aleksandar', '123456789', 0, 'M'),
(3, 'Petar', 'Petrovic', 'petar@gmail.com', 'petar', '123456789', 0, 'M'),
(4, 'Marko', 'Markovic', 'marko@gmail.com', 'marko', '123456789', 0, 'K'),
(5, 'Ana', 'Davidovic', 'ana@gmail.com', 'ana', '123456789', 0, 'K'),
(6, 'Nikola', 'Nikolic', 'nikola@gmail.com', 'nikola', '123456789', 0, 'K');
--
-- Table structure for table `lajk`
--

DROP TABLE IF EXISTS `lajk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `lajk` (
  `ID_korisnik` int NOT NULL,
  `ID_komentar` int NOT NULL,
  `Lajkovao` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_korisnik`,`ID_komentar`),
  KEY `fk_lajk_komentar1_idx` (`ID_komentar`),
  CONSTRAINT `fk_lajk_komentar1` FOREIGN KEY (`ID_komentar`) REFERENCES `komentar` (`ID_komentar`) ON DELETE CASCADE,
  CONSTRAINT `fk_Lajk_Korisnik1` FOREIGN KEY (`ID_korisnik`) REFERENCES `korisnik` (`ID_korisnik`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `lajk` (`ID_korisnik`, `Lajkovao`, `ID_komentar`) VALUES
(6, 1, 1);
--
-- Table structure for table `objava`
--

DROP TABLE IF EXISTS `objava`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `objava` (
  `ID_objava` int NOT NULL AUTO_INCREMENT,
  `ID_korisnik` int NOT NULL,
  `ID_tema` int NOT NULL,
  `Naziv` varchar(255) NOT NULL,
  `Fotografija` varchar(255) NOT NULL,
  `Opis` varchar(255) NOT NULL,
  `Broj_glasova` int NOT NULL,
  `Pobednicka` tinyint(1) NOT NULL,
  `Sastojci` varchar(255) NOT NULL,
  `Vreme` timestamp NOT NULL,
  `Broj_komentara` int NOT NULL,
  PRIMARY KEY (`ID_objava`),
  UNIQUE KEY `ID_objava_UNIQUE` (`ID_objava`),
  KEY `fk_Objava_Korisnik1_idx` (`ID_korisnik`),
  KEY `fk_Objava_Tema1_idx` (`ID_tema`),
  CONSTRAINT `fk_Objava_Korisnik1` FOREIGN KEY (`ID_korisnik`) REFERENCES `korisnik` (`ID_korisnik`) ON DELETE CASCADE,
  CONSTRAINT `fk_Objava_Tema1` FOREIGN KEY (`ID_tema`) REFERENCES `tema` (`ID_tema`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


INSERT INTO `objava` (`ID_objava`, `ID_tema`, `ID_korisnik`,`Naziv`, `Fotografija`, `Vreme`, `Opis`, `Broj_glasova`, `Pobednicka`, `Broj_komentara`, `Sastojci`) VALUES
(1, 1, 4, 'Garniamo piletina','http://localhost/receptoar/uploads/1.jpg', '2021-06-07 19:16:53', 'Prvo na puteru propržite pileći karabatak sa svih strana. Nalijte vodom 2 prsta preko piletine. Od momenta kada provri pustite da krčka 10 minuta. Dodajte isečenu na kolutove šargarepu i grašak. Dodajte soli i kuvajte 20 minuta na tihoj vatri. Od mlevene paprike i brašna napravite klasičnu zapršku, dodajte harista pastu, biber, beli luk, kari i ulje susama. Sve sjedinite i dodajte šargarepu, grašak i piletinu. Dobro izmešajte pa uz mešanje kuvajte na tihoj vatri 5 minuta. Servirajte uz posut susam i kašiku pavlake.', 1, 0, 1, 
'1 pileci karabatak,150 g mlade sargarepe,100 g mladog graska,2 kasicice otopljenog putera,1 kasicica susamovog ulja,1 kasicica mlevene zacinske paprike,1 kasika brasna
po ukusu soli i bibera,1/2 kasicice karija,1 cen belog luka,1/2 kasicice harisa paste,1 kasicica susama,1 kasika kisele pavlake'),
(2, 1, 5, 'Leksovacka muckalica', 'http://localhost/receptoar/uploads/2.jpg', '2021-06-07 19:17:32', 'U tiganj stavite iseckanu slaninu. Kada slanina pocne da se topi dodajte na rezance isecen crni luk. Kada luk zastakli, dodajte na isti nacin isecenu papriku i paradajz. Sve posolite pobiberite i kuvajte poklopljeno na laganoj vatri desetak minuta, nakon tog vremena dodajte meso iseceno na rezance i kuvajte sve zajedno jos desetak minuta ili dok se sos ne zgusne.', 3, 0, 1,
'500 g svinjskog vrata pecenog na rostilju,1 veci crveni luk,2 sveze paprike,1 ljuta sveza paprika,1 kg svezeg paradajza,ulje,so i biber po ukusu.'),
(4, 1, 6, 'Grasak', 'http://localhost/receptoar/uploads/3.jpg', '2021-06-07 19:18:54', 'Meso lepo oprati i iseci na kocke srednje velicine. Luk oljustiti i sitno iseckati. U dublju serpu sipati ulje staviti meso i crni luk, lovorov list i malo vode i dinstati uz povremeno mesanje. Povremeno dodavati po malo vode kada ispari. Kada se meso lepo izdinsta, dodati grasak, naliti vodom i ostaviti da se krcka na srednjoj temperaturi. Dodati zacine po ukusu i sitno iseckan beli luk. Kada se grasak skuva napraviti zaprsku od ulja, brasna i aleve paprike i dodati u grasak. Tako zaprzeno ostaviti da krcka jos 5 minuta na najnizoj temperaturi i dodati sitno iseckano sveže lisce persuna.', 4, 0, 0,
'400 g svinjskog mesa,300 g mladog graska,2 glavice crnog luka,2 cena belog luka,2 sargarepe,2 kasike brasna,1 kasicica aleve paprike,so,suvi biljni zacin,mleveni biber,lovorov list,persun'),
(5, 1, 5, 'Supa sa curecim mesom', 'http://localhost/receptoar/uploads/4.jpg', '2021-06-07 19:22:36', 'Curece meso iseci na komade velicine zalogaja. Naliti vodom malo posoliti i kuvati na umerenoj temperaturi oko 30 minuta. Skidati penu. Naseckati zelen za supu i dodati mesu. Po ukusu dodati i zacine i nastaviti sa kuvanjem dok povrce omeksa.', 1, 0, 1,
'300 g cureceg belog mesa,po potrebi voda,2 cena belog luka,1/2 pakovanja zeleni za supu,po ukusu so,suvi biljni zacin,beli biber');
--
-- Table structure for table `tema`
--

DROP TABLE IF EXISTS `tema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `tema` (
  `ID_tema` int NOT NULL AUTO_INCREMENT,
  `Naziv` varchar(50) NOT NULL,
  `Aktuelna` tinyint(1) NOT NULL,
  `Vreme` int(11) NOT NULL,
  PRIMARY KEY (`ID_tema`),
  UNIQUE KEY `ID_tema_UNIQUE` (`ID_tema`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


INSERT INTO `tema` (`ID_tema`, `Naziv`, `Aktuelna`, `Vreme`) VALUES
(1, 'Kuvano', 2, 1560124800),
(2, 'Brza hrana', 3, 1560729600);
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
