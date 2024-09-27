-- MySQL dump 10.19  Distrib 10.3.35-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db_lem_system
-- ------------------------------------------------------
-- Server version	10.3.35-MariaDB-1:10.3.35+maria~focal

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `canales`
--

DROP TABLE IF EXISTS `canales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canales` (
  `id` int(10) NOT NULL,
  `tipoPlaca` varchar(100) DEFAULT NULL,
  `firmware` varchar(100) DEFAULT NULL,
  `alturaMaxima` float DEFAULT NULL,
  `alturaSensor` float DEFAULT NULL,
  `alturaAgua` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canales`
--

LOCK TABLES `canales` WRITE;
/*!40000 ALTER TABLE `canales` DISABLE KEYS */;
INSERT INTO `canales` VALUES (24,'CN2','2.2.4',3.5,2.9,2.5);
/*!40000 ALTER TABLE `canales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canales_hist`
--

DROP TABLE IF EXISTS `canales_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canales_hist` (
  `id_hist` int(10) NOT NULL AUTO_INCREMENT,
  `id_equipo` int(10) NOT NULL,
  `tipoPlaca` varchar(100) DEFAULT NULL,
  `firmware` varchar(100) DEFAULT NULL,
  `alturaMaxima` float DEFAULT NULL,
  `alturaSensor` float DEFAULT NULL,
  `alturaAgua` float DEFAULT NULL,
  PRIMARY KEY (`id_hist`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canales_hist`
--

LOCK TABLES `canales_hist` WRITE;
/*!40000 ALTER TABLE `canales_hist` DISABLE KEYS */;
INSERT INTO `canales_hist` VALUES (1,24,'CN2','2.2.0',3.5,2.8,2.5),(2,24,'CN2','2.2.4',3.5,2.9,2.5),(3,24,'CN2','2.2.4',3.5,2.9,2.5);
/*!40000 ALTER TABLE `canales_hist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coordinador`
--

DROP TABLE IF EXISTS `coordinador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coordinador` (
  `id` int(10) NOT NULL,
  `tipoPlaca` varchar(100) DEFAULT NULL,
  `firmware` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coordinador`
--

LOCK TABLES `coordinador` WRITE;
/*!40000 ALTER TABLE `coordinador` DISABLE KEYS */;
INSERT INTO `coordinador` VALUES (25,'asd','asd');
/*!40000 ALTER TABLE `coordinador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coordinador_hist`
--

DROP TABLE IF EXISTS `coordinador_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coordinador_hist` (
  `id_hist` int(10) NOT NULL AUTO_INCREMENT,
  `id_equipo` int(10) NOT NULL,
  `tipoPlaca` varchar(100) DEFAULT NULL,
  `firmware` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_hist`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coordinador_hist`
--

LOCK TABLES `coordinador_hist` WRITE;
/*!40000 ALTER TABLE `coordinador_hist` DISABLE KEYS */;
INSERT INTO `coordinador_hist` VALUES (16,25,'asd','asd'),(17,25,'asd','asd');
/*!40000 ALTER TABLE `coordinador_hist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meteorologica`
--

DROP TABLE IF EXISTS `meteorologica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meteorologica` (
  `id` int(10) NOT NULL,
  `tipoPlaca` varchar(100) DEFAULT NULL,
  `firmware` varchar(100) DEFAULT NULL,
  `compania3G` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meteorologica`
--

LOCK TABLES `meteorologica` WRITE;
/*!40000 ALTER TABLE `meteorologica` DISABLE KEYS */;
/*!40000 ALTER TABLE `meteorologica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meteorologica_hist`
--

DROP TABLE IF EXISTS `meteorologica_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meteorologica_hist` (
  `id_hist` int(10) NOT NULL AUTO_INCREMENT,
  `id_equipo` int(10) NOT NULL,
  `tipoPlaca` varchar(100) DEFAULT NULL,
  `firmware` varchar(100) DEFAULT NULL,
  `compania3G` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_hist`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meteorologica_hist`
--

LOCK TABLES `meteorologica_hist` WRITE;
/*!40000 ALTER TABLE `meteorologica_hist` DISABLE KEYS */;
/*!40000 ALTER TABLE `meteorologica_hist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pozos`
--

DROP TABLE IF EXISTS `pozos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pozos` (
  `id` int(10) NOT NULL,
  `tipoPlaca` varchar(100) DEFAULT NULL,
  `firmware` varchar(100) DEFAULT NULL,
  `profundidadPozo` float DEFAULT NULL,
  `nivelEstatico` float DEFAULT NULL,
  `nivelDinamico` float DEFAULT NULL,
  `distanciaSensor` float DEFAULT NULL,
  `factorPulsos` float DEFAULT NULL,
  `3G` tinyint(1) DEFAULT NULL,
  `compania3G` varchar(100) DEFAULT NULL,
  `tipoEnergia` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pozos`
--

LOCK TABLES `pozos` WRITE;
/*!40000 ALTER TABLE `pozos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pozos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pozos_hist`
--

DROP TABLE IF EXISTS `pozos_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pozos_hist` (
  `id_hist` int(10) NOT NULL AUTO_INCREMENT,
  `id_equipo` int(10) NOT NULL,
  `tipoPlaca` varchar(100) DEFAULT NULL,
  `firmware` varchar(100) DEFAULT NULL,
  `profundidadPozo` float DEFAULT NULL,
  `nivelEstatico` float DEFAULT NULL,
  `nivelDinamico` float DEFAULT NULL,
  `distanciaSensor` float DEFAULT NULL,
  `factorPulsos` float DEFAULT NULL,
  `3G` tinyint(1) DEFAULT NULL,
  `compania3G` varchar(100) DEFAULT NULL,
  `tipoEnergia` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_hist`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pozos_hist`
--

LOCK TABLES `pozos_hist` WRITE;
/*!40000 ALTER TABLE `pozos_hist` DISABLE KEYS */;
/*!40000 ALTER TABLE `pozos_hist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sonda`
--

DROP TABLE IF EXISTS `sonda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sonda` (
  `id` int(10) NOT NULL,
  `tipoPlaca` varchar(100) DEFAULT NULL,
  `largoSonda` varchar(100) DEFAULT NULL,
  `companiaComunicacion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sonda`
--

LOCK TABLES `sonda` WRITE;
/*!40000 ALTER TABLE `sonda` DISABLE KEYS */;
/*!40000 ALTER TABLE `sonda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sonda_hist`
--

DROP TABLE IF EXISTS `sonda_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sonda_hist` (
  `id_hist` int(10) NOT NULL AUTO_INCREMENT,
  `id_equipo` int(10) NOT NULL,
  `tipoPlaca` varchar(100) DEFAULT NULL,
  `largoSonda` varchar(100) DEFAULT NULL,
  `companiaComunicacion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_hist`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sonda_hist`
--

LOCK TABLES `sonda_hist` WRITE;
/*!40000 ALTER TABLE `sonda_hist` DISABLE KEYS */;
/*!40000 ALTER TABLE `sonda_hist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhistory`
--

DROP TABLE IF EXISTS `tblhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhistory` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `action` varchar(100) DEFAULT NULL,
  `date_history` date DEFAULT NULL,
  `instalationid` int(10) NOT NULL,
  `position` varchar(100) DEFAULT NULL,
  `date_instalation` date DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `tecnicoid` int(10) DEFAULT NULL,
  `clientid` int(10) DEFAULT NULL,
  `id_equipo_asociado` int(10) NOT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhistory`
--

LOCK TABLES `tblhistory` WRITE;
/*!40000 ALTER TABLE `tblhistory` DISABLE KEYS */;
INSERT INTO `tblhistory` VALUES (29,'Created','2022-07-11',24,'-33.036703, -71.595293','2022-07-20','Revisando',1,1,1,'canales'),(30,'Modified','2022-07-11',24,'-33.036703, -71.595293','2022-07-20','Revisando',2,1,2,'canales'),(31,'Modified','2022-07-11',24,'-33.036703, -71.595293','2022-07-20','Verificada',2,1,3,'canales'),(32,'Created','2022-07-11',25,'test1','2022-07-19','Revisando',2,2,16,'coordinador'),(33,'Modified','2022-07-11',25,'test1','2022-07-19','Verificada',2,2,17,'coordinador');
/*!40000 ALTER TABLE `tblhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblinstalations`
--

DROP TABLE IF EXISTS `tblinstalations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblinstalations` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `position` varchar(100) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `tecnicoid` int(10) DEFAULT NULL,
  `clientid` int(10) DEFAULT NULL,
  `nombreEquipo` varchar(100) DEFAULT NULL,
  `frecuenciaEnvio` float DEFAULT NULL,
  `observaciones` varchar(1000) DEFAULT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblinstalations`
--

LOCK TABLES `tblinstalations` WRITE;
/*!40000 ALTER TABLE `tblinstalations` DISABLE KEYS */;
INSERT INTO `tblinstalations` VALUES (24,'-33.036703, -71.595293','2022-07-20 00:00:00','Verificada',2,1,NULL,NULL,NULL,'canales'),(25,'test1','2022-07-19 00:00:00','Verificada',2,2,NULL,NULL,NULL,'coordinador');
/*!40000 ALTER TABLE `tblinstalations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-11  6:53:35
