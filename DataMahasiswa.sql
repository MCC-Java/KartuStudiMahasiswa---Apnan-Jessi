-- MariaDB dump 10.17  Distrib 10.4.11-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: mahasiswa
-- ------------------------------------------------------
-- Server version	10.4.11-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `datamhs`
--

DROP TABLE IF EXISTS `datamhs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datamhs` (
  `nim` varchar(10) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `fakultas` varchar(45) NOT NULL,
  `progdi` varchar(45) NOT NULL,
  PRIMARY KEY (`nim`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datamhs`
--

LOCK TABLES `datamhs` WRITE;
/*!40000 ALTER TABLE `datamhs` DISABLE KEYS */;
INSERT INTO `datamhs` VALUES ('672018079','Jessi Febria','12345','Teknologi Informasi','Teknik Informatika'),('672018080','Apnan Juanda','12345','Teknologi Informasi','Teknik Informatika');
/*!40000 ALTER TABLE `datamhs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kartustudi`
--

DROP TABLE IF EXISTS `kartustudi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kartustudi` (
  `nim` varchar(10) NOT NULL,
  `kodematkul` varchar(6) NOT NULL,
  KEY `FK_mhs_kst` (`nim`),
  KEY `FK_matkul_kst` (`kodematkul`),
  CONSTRAINT `FK_matkul_kst` FOREIGN KEY (`kodematkul`) REFERENCES `matkul` (`kode`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_mhs_kst` FOREIGN KEY (`nim`) REFERENCES `datamhs` (`nim`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kartustudi`
--

LOCK TABLES `kartustudi` WRITE;
/*!40000 ALTER TABLE `kartustudi` DISABLE KEYS */;
INSERT INTO `kartustudi` VALUES ('672018079','IN124B'),('672018080','in124b'),('672018080','IN123A');
/*!40000 ALTER TABLE `kartustudi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matkul`
--

DROP TABLE IF EXISTS `matkul`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matkul` (
  `kode` varchar(6) NOT NULL,
  `ruang` varchar(45) NOT NULL,
  `hari` varchar(45) NOT NULL,
  `jam` varchar(5) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `sks` int(11) NOT NULL,
  `dosen` varchar(45) NOT NULL,
  PRIMARY KEY (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matkul`
--

LOCK TABLES `matkul` WRITE;
/*!40000 ALTER TABLE `matkul` DISABLE KEYS */;
INSERT INTO `matkul` VALUES ('IN123A','FTI400','Selasa','9-12','Etika Profesi',2,'Albert Einstein'),('IN124B','FTI333','SELASA','10-13','Pemrograman Lanjut',2,'Stephen Hawking, S.Kom.'),('IN125C','FTI400','Senin','15-18','Rekayasa Perangkat Lunak',3,'Alan Turing'),('IN126D','FTI300','Rabu','15-18','Bahasa Indonesia',3,'Angela Atik');
/*!40000 ALTER TABLE `matkul` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mahasiswa'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-20 18:00:56
