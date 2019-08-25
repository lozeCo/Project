-- MySQL dump 10.13  Distrib 5.7.24, for Win32 (AMD64)
--
-- Host: 172.17.90.24    Database: Projects
-- ------------------------------------------------------
-- Server version	5.7.19

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
-- Table structure for table `Boletos`
--

DROP TABLE IF EXISTS `Boletos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Boletos` (
  `blt_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `crr_id` int(10) unsigned NOT NULL,
  `ebl_id` int(10) unsigned NOT NULL,
  `blt_number` int(11) DEFAULT NULL,
  `blt_cliente` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`blt_id`),
  KEY `fk_Boletos_Corrida1_idx` (`crr_id`) USING BTREE,
  KEY `fk_Boletos_cat_EstadoBoleto1_idx` (`ebl_id`) USING BTREE,
  CONSTRAINT `Boletos_ibfk_1` FOREIGN KEY (`crr_id`) REFERENCES `Corrida` (`crr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Boletos_ibfk_2` FOREIGN KEY (`ebl_id`) REFERENCES `cat_EstadoBoleto` (`ebl_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=286 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Boletos`
--

LOCK TABLES `Boletos` WRITE;
/*!40000 ALTER TABLE `Boletos` DISABLE KEYS */;
INSERT INTO `Boletos` VALUES (115,7,1,1,''),(116,7,3,2,'Japhet MAta'),(117,7,1,3,''),(118,7,1,4,''),(119,7,3,5,'Soledad Lopexz'),(120,7,1,6,''),(121,7,1,7,''),(122,7,3,8,'Adriana Pacheco '),(123,7,1,9,''),(124,7,1,10,''),(125,7,1,11,''),(126,7,1,12,''),(127,7,1,13,''),(128,7,1,14,''),(129,7,1,15,''),(130,7,1,16,''),(131,7,1,17,''),(132,7,1,18,''),(133,7,3,19,'Adriana Morales'),(134,8,1,1,''),(135,8,3,2,'Japhet Mata Arellanes'),(136,8,3,3,'Soledad Lopez '),(137,8,1,4,''),(138,8,3,5,'Alejandro Jarquin'),(139,8,3,6,'Norberto Rivera'),(140,8,1,7,''),(141,8,1,8,''),(142,8,1,9,''),(143,8,1,10,''),(144,8,1,11,''),(145,8,1,12,''),(146,8,1,13,''),(147,8,1,14,''),(148,8,1,15,''),(149,8,1,16,''),(150,8,1,17,''),(151,8,1,18,''),(152,8,1,19,''),(153,9,1,1,''),(154,9,1,2,''),(155,9,1,3,''),(156,9,1,4,''),(157,9,1,5,''),(158,9,1,6,''),(159,9,1,7,''),(160,9,1,8,''),(161,9,1,9,''),(162,9,1,10,''),(163,9,1,11,''),(164,9,1,12,''),(165,9,1,13,''),(166,9,1,14,''),(167,9,1,15,''),(168,9,1,16,''),(169,9,1,17,''),(170,9,1,18,''),(171,9,1,19,''),(172,10,3,1,'Abuelita 90 años Jimena'),(173,10,3,2,'Japhet Mata Arellanes'),(174,10,1,3,''),(175,10,3,4,'Extranjero Willian Smith'),(176,10,1,5,''),(177,10,1,6,''),(178,10,3,7,'Extranjero Bryce Dallas Howard'),(179,10,3,8,'Adriana Morales'),(180,10,1,9,''),(181,10,1,10,''),(182,10,3,11,'Elias Pacheco'),(183,10,1,12,''),(184,10,1,13,''),(185,10,3,14,'Norma Gutierrez'),(186,10,1,15,''),(187,10,1,16,''),(188,10,1,17,''),(189,10,1,18,''),(190,10,1,19,''),(191,11,1,1,''),(192,11,1,2,''),(193,11,1,3,''),(194,11,1,4,''),(195,11,1,5,''),(196,11,1,6,''),(197,11,1,7,''),(198,11,1,8,''),(199,11,1,9,''),(200,11,1,10,''),(201,11,1,11,''),(202,11,1,12,''),(203,11,1,13,''),(204,11,1,14,''),(205,11,1,15,''),(206,11,1,16,''),(207,11,1,17,''),(208,11,1,18,''),(209,11,1,19,''),(210,12,1,1,''),(211,12,1,2,''),(212,12,1,3,''),(213,12,1,4,''),(214,12,1,5,''),(215,12,1,6,''),(216,12,1,7,''),(217,12,1,8,''),(218,12,1,9,''),(219,12,1,10,''),(220,12,1,11,''),(221,12,1,12,''),(222,12,1,13,''),(223,12,1,14,''),(224,12,1,15,''),(225,12,1,16,''),(226,12,1,17,''),(227,12,1,18,''),(228,12,1,19,''),(229,13,1,1,''),(230,13,1,2,''),(231,13,1,3,''),(232,13,1,4,''),(233,13,1,5,''),(234,13,1,6,''),(235,13,1,7,''),(236,13,1,8,''),(237,13,1,9,''),(238,13,1,10,''),(239,13,1,11,''),(240,13,1,12,''),(241,13,1,13,''),(242,13,1,14,''),(243,13,1,15,''),(244,13,1,16,''),(245,13,1,17,''),(246,13,1,18,''),(247,13,1,19,''),(248,14,1,1,''),(249,14,1,2,''),(250,14,1,3,''),(251,14,1,4,''),(252,14,1,5,''),(253,14,1,6,''),(254,14,1,7,''),(255,14,1,8,''),(256,14,1,9,''),(257,14,1,10,''),(258,14,1,11,''),(259,14,1,12,''),(260,14,1,13,''),(261,14,1,14,''),(262,14,1,15,''),(263,14,1,16,''),(264,14,1,17,''),(265,14,1,18,''),(266,14,1,19,''),(267,15,1,1,''),(268,15,3,2,'Japhet Mata Arellanes'),(269,15,1,3,''),(270,15,1,4,''),(271,15,3,5,'Blanca Estela Vega'),(272,15,1,6,''),(273,15,1,7,''),(274,15,1,8,''),(275,15,1,9,''),(276,15,1,10,''),(277,15,1,11,''),(278,15,1,12,''),(279,15,1,13,''),(280,15,1,14,''),(281,15,1,15,''),(282,15,1,16,''),(283,15,1,17,''),(284,15,1,18,''),(285,15,1,19,'');
/*!40000 ALTER TABLE `Boletos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Corrida`
--

DROP TABLE IF EXISTS `Corrida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Corrida` (
  `crr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rta_id` int(10) unsigned NOT NULL,
  `ecr_id` int(10) unsigned NOT NULL,
  `vhc_id` int(11) NOT NULL,
  `crr_fecha` date NOT NULL,
  PRIMARY KEY (`crr_id`),
  KEY `fk_Corrida_cat_Ruta_idx` (`rta_id`) USING BTREE,
  KEY `fk_Corrida_cat_EstadoCorrida1_idx` (`ecr_id`) USING BTREE,
  KEY `fk_Corrida_Vehiculos1_idx` (`vhc_id`) USING BTREE,
  CONSTRAINT `Corrida_ibfk_1` FOREIGN KEY (`vhc_id`) REFERENCES `Vehiculos` (`vhc_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Corrida_ibfk_2` FOREIGN KEY (`ecr_id`) REFERENCES `cat_EstadoCorrida` (`ecr_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Corrida_ibfk_3` FOREIGN KEY (`rta_id`) REFERENCES `cat_Ruta` (`rta_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Lista de Corridas';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Corrida`
--

LOCK TABLES `Corrida` WRITE;
/*!40000 ALTER TABLE `Corrida` DISABLE KEYS */;
INSERT INTO `Corrida` VALUES (7,1,1,1,'2019-08-09'),(8,1,1,1,'2019-08-22'),(9,1,1,1,'2019-08-25'),(10,1,1,1,'2019-08-24'),(11,2,1,1,'2019-08-25'),(12,2,1,1,'2019-08-25'),(13,1,1,1,'2019-08-25'),(14,2,1,1,'2019-08-25'),(15,2,1,1,'2019-08-25');
/*!40000 ALTER TABLE `Corrida` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`masterdba`@`%`*/ /*!50003 TRIGGER `Corrida_AFTER_INSERT` AFTER INSERT ON `Corrida` FOR EACH ROW BEGIN
	DECLARE var_asientos INT DEFAULT 0;
    DECLARE counter INT DEFAULT 1 ;
       
    SELECT vhc_pasajeros
    INTO var_asientos
    FROM Vehiculos
    WHERE vhc_id = NEW.vhc_id;
    SET var_asientos = var_asientos +1;
    
    WHILE counter < var_asientos  DO
		INSERT INTO Boletos (crr_id,ebl_id,blt_number,blt_cliente)
        VALUES(NEW.crr_id,1,counter,"");
		SET counter = counter + 1;
	END WHILE;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-25  9:12:39
