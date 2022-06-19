CREATE DATABASE  IF NOT EXISTS `db_sisin` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `db_sisin`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_sisin
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `acade_alumno_dato`
--

DROP TABLE IF EXISTS `acade_alumno_dato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acade_alumno_dato` (
  `id_alumno_dato` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave primaria incremental',
  `dato_nombres_padre` varchar(200) NOT NULL COMMENT 'nombres y apelldios del padre del alumno',
  `dato_nombres_madre` varchar(200) NOT NULL COMMENT 'nombres y apellidos de la madre del alumno',
  `dato_telefonos_contacto` varchar(80) DEFAULT NULL COMMENT 'algun telefono',
  `dato_correo` varchar(100) DEFAULT NULL COMMENT 'correo de los padres',
  `dato_lugar_trabajo` longtext,
  `dato_nombres_responsable` varchar(200) NOT NULL COMMENT 'nombre del responsable del alumno',
  `dato_telefono_responsable` varchar(80) DEFAULT NULL COMMENT 'telefono del responsable del alumno',
  `dato_correo_responsable` varchar(80) DEFAULT NULL COMMENT 'correo del responsable del alumno',
  `dato_lugar_trabajo_responsable` longtext,
  `id_alumno` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_alumno',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL COMMENT 'usuario que creo el registro solo como referencia no constrain',
  PRIMARY KEY (`id_alumno_dato`),
  KEY `id_alumno` (`id_alumno`),
  CONSTRAINT `fk_alumnodato_alumno` FOREIGN KEY (`id_alumno`) REFERENCES `adm_alumno` (`id_alumno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acade_alumno_dato`
--

LOCK TABLES `acade_alumno_dato` WRITE;
/*!40000 ALTER TABLE `acade_alumno_dato` DISABLE KEYS */;
INSERT INTO `acade_alumno_dato` VALUES (1,'MAXIMILIANO','MAXIMILIANA','72581216','max@gmail.com','AVENIDA PERALTA','MAXIMILIANO','72581217','ave@gmail.com','AVENIDA LAS MAGNOLIAS',1,'2017-03-03 20:11:39',1),(2,'MARTA ALICIA','MARTA ALICIA','2225-0505','every@gmail.com','AVENIDA SHILTUPAN','MARTA ALICIA','2225-0505','every@gmail.com','AVENIDA SHILTUPAN',2,'2017-03-03 20:21:23',1),(3,'ESTAFA','ESTAFA','','','EVERTE','CARMELA','','','AVENDIA',3,'2017-03-03 20:26:02',1),(4,'camila','camila','','','del norte','camilia','','','del norte',4,'2017-03-06 17:48:29',1),(5,'olmedo','olmedo','','','alguna parte','jansel','','','norte',5,'2017-03-06 20:34:52',1),(6,'duvia','dunio','','','san salvador','camilia','','','del monte',6,'2017-03-06 20:36:02',1),(7,'MARIO ARNULFO','MARIA CARMEN RODRÍGUEZ','','','LA GARITA','CARLOS MONTIEL','','','SAN SALVADOR',7,'2017-03-14 17:03:09',1),(13,'maria luisa','maria luisa','','','maria luisa','maria luisa','','','maria luisa',8,'2017-03-26 04:34:17',1),(14,'MARCOS ANTONIO PORTILLO','MARIA LUISA AYALA','555','maria@gmail.com','SAN JACINTO','MARCOS ANTONIO PORTILLO','555','portillo@gmail.com','SAN SALVADOR',9,'2017-03-31 00:18:45',3),(15,'MARLON BRANDON','ESTÁFANY NALILA','','','SANTO TOMAS','ESTÉFANY NATALILA','','','SANTO TOMAS',10,'2017-03-31 17:24:32',3),(16,'ROBERTO MANUEAL','KARLA EXTRADA','','','SAN SALVADOR','ROBERTO MANUEL','','','SAN SALVADOR',11,'2017-03-31 22:00:05',3),(17,'LUIS CARLOS MANUEL PÉREZ','SANDRA MORATALLA','','','SAN SALVADOR','LUIS CARLOS MANUEL PÉREZ','','moratalla@gmail.com','san salvador',12,'2017-03-31 22:02:37',3),(18,'EDENILSON CRUZ','MARTA DILIAN','','','SAN SALVADOR','EDENILSON CRUZ','','','SAN SALVADOR',13,'2017-03-31 22:04:43',3),(19,'LUIS CARLOS MANUEL PÉREZ','LUIS CARLOS MANUEL PÉREZ','25','lopez@gmail.com','LUIS CARLOS MANUEL PÉREZ','LUIS CARLOS MANUEL PÉREZ','','','san salvador',14,'2017-03-31 22:37:31',3),(20,'marchal','marchal','','','marchal','marchal','','','marchal',15,'2017-04-18 15:41:46',2),(21,'avenida peralta','avenida peralta','','','avenida peralta','avenida peralta','','','avenida peralta',16,'2017-04-18 16:08:14',2),(22,'avenida peralta','avenida peralta','','','avenida peralta','avenida peralta','','','avenida peralta',17,'2017-04-18 16:17:11',2),(23,'alumno_nombre_foto','alumno_nombre_foto','','','alumno_nombre_foto','alumno_nombre_foto','','','alumno_nombre_foto',18,'2017-04-18 16:25:50',2),(24,'AVENIDA NULMA','AVENIDA NULMA','','','AVENIDA NULMA','AVENIDA NULMA','','','AVENIDA NULMA',19,'2017-04-18 17:11:01',2),(25,'AVENIDA PERALTA','AVENIDA PERALTA','','','AVENIDA PERALTA','AVENIDA PERALTA','','','AVENIDA PERALTA',20,'2017-04-18 17:45:18',2),(26,'CARLOS MANUEL SANCHEZ','MONTOLLA ELINTILA','','','avenida eunices','MONTOLLA ELINTILIA','','','avenida eunices',21,'2017-04-18 19:51:11',2);
/*!40000 ALTER TABLE `acade_alumno_dato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acade_arancel`
--

DROP TABLE IF EXISTS `acade_arancel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acade_arancel` (
  `id_arancel` tinyint(4) NOT NULL COMMENT 'llave primaria no incremental',
  `arancel_nombre` varchar(150) NOT NULL COMMENT 'nombre o descripcion del arancel a cobrar',
  `arancel_estado` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'estado del alumno 1=acitvo, true, 0=inactivo,false',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL COMMENT 'usuario que crea el registro',
  PRIMARY KEY (`id_arancel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acade_arancel`
--

LOCK TABLES `acade_arancel` WRITE;
/*!40000 ALTER TABLE `acade_arancel` DISABLE KEYS */;
INSERT INTO `acade_arancel` VALUES (1,'MATRÍCURLA',1,'2017-03-24 21:29:41',1),(2,'INSCRIPCIÓN',1,'2017-03-24 21:29:41',1),(3,'MENSUALIDAD',1,'2017-03-24 21:29:41',1),(4,'MORA-MENSUALIDAD',1,'2017-03-24 21:29:41',1),(5,'MORA-BIBLIOTECA',1,'2017-03-24 21:29:41',1),(6,'DERECHO EXAMEN',1,'2017-03-24 21:54:22',1),(7,'prueba-45',0,'2017-03-24 22:35:50',1);
/*!40000 ALTER TABLE `acade_arancel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acade_calendario_pago`
--

DROP TABLE IF EXISTS `acade_calendario_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acade_calendario_pago` (
  `id_calendario_pago` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave primaria incremental',
  `calendario_mes` tinyint(2) NOT NULL COMMENT 'numero de mes al cual corresponde la cuota del 1 al 12',
  `calendario_annio` int(4) NOT NULL COMMENT 'año a al que pertenece la cuota, servira para identificar, \n  ya que se pondra el id del año lectivo para la relacion',
  `calendario_fecha_mes_cuota` date NOT NULL COMMENT 'ultimo dia de cada mes en el que vence la cuota',
  `calendaria_valor_cuota` double DEFAULT NULL COMMENT 'valor en dolares de la cuota cancelada',
  `calendario_cuota_pagada` int(1) DEFAULT '0' COMMENT 'si es 1 la cuota ya se pago 0 esta pendiente de pagar',
  `calendario_fecha_pago` date NOT NULL DEFAULT '0000-00-00' COMMENT 'fecha en la que realamente se pago la cuota',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL COMMENT 'usaurio que crea el registro o modifica si aplicase, solo sera relacion imaginaria de refencia',
  `id_annio_lectivo` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_annio_lectivo, indice',
  `id_alumno` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_alumno, indice',
  PRIMARY KEY (`id_calendario_pago`),
  UNIQUE KEY `calendario_annio_lectivo_alumno` (`calendario_mes`,`calendario_annio`,`id_annio_lectivo`,`id_alumno`),
  KEY `id_annio_lectivo` (`id_annio_lectivo`),
  KEY `id_alumno` (`id_alumno`),
  CONSTRAINT `fk_calendariopago_alumno` FOREIGN KEY (`id_alumno`) REFERENCES `adm_alumno` (`id_alumno`) ON UPDATE CASCADE,
  CONSTRAINT `fk_calendariopago_anniolectivo` FOREIGN KEY (`id_annio_lectivo`) REFERENCES `adm_annio_lectivo` (`id_annio_lectivo`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=489 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acade_calendario_pago`
--

LOCK TABLES `acade_calendario_pago` WRITE;
/*!40000 ALTER TABLE `acade_calendario_pago` DISABLE KEYS */;
INSERT INTO `acade_calendario_pago` VALUES (202,30,2017,'2017-01-31',NULL,1,'2017-03-28','2017-03-27 03:23:23',1,2,8),(203,1,2017,'2017-01-31',NULL,0,'0000-00-00','2017-03-27 03:23:23',1,2,8),(204,2,2017,'2017-02-28',NULL,0,'0000-00-00','2017-03-27 03:23:23',1,2,8),(205,3,2017,'2017-03-31',NULL,0,'0000-00-00','2017-03-27 03:23:23',1,2,8),(206,4,2017,'2017-04-30',NULL,0,'0000-00-00','2017-03-27 03:23:23',1,2,8),(207,5,2017,'2017-05-31',NULL,0,'0000-00-00','2017-03-27 03:23:23',1,2,8),(208,6,2017,'2017-06-30',NULL,0,'0000-00-00','2017-03-27 03:23:23',1,2,8),(209,7,2017,'2017-07-31',NULL,0,'0000-00-00','2017-03-27 03:23:23',1,2,8),(210,8,2017,'2017-08-31',NULL,0,'0000-00-00','2017-03-27 03:23:23',1,2,8),(211,9,2017,'2017-09-30',NULL,0,'0000-00-00','2017-03-27 03:23:23',1,2,8),(212,10,2017,'2017-10-31',NULL,0,'0000-00-00','2017-03-27 03:23:23',1,2,8),(213,11,2017,'2017-11-30',NULL,0,'0000-00-00','2017-03-27 03:23:23',1,2,8),(214,12,2017,'2017-12-31',NULL,0,'0000-00-00','2017-03-27 03:23:23',1,2,8),(216,30,2017,'2017-01-31',NULL,1,'2017-04-01','2017-03-27 03:31:33',1,2,1),(217,1,2017,'2017-01-31',NULL,1,'2017-04-10','2017-03-27 03:31:33',1,2,1),(218,2,2017,'2017-02-28',NULL,1,'2017-04-10','2017-03-27 03:31:33',1,2,1),(219,3,2017,'2017-03-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,1),(220,4,2017,'2017-04-30',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,1),(221,5,2017,'2017-05-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,1),(222,6,2017,'2017-06-30',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,1),(223,7,2017,'2017-07-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,1),(224,8,2017,'2017-08-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,1),(225,9,2017,'2017-09-30',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,1),(226,10,2017,'2017-10-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,1),(227,11,2017,'2017-11-30',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,1),(228,12,2017,'2017-12-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,1),(229,30,2017,'2017-01-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,2),(230,1,2017,'2017-01-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,2),(231,2,2017,'2017-02-28',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,2),(232,3,2017,'2017-03-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,2),(233,4,2017,'2017-04-30',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,2),(234,5,2017,'2017-05-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,2),(235,6,2017,'2017-06-30',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,2),(236,7,2017,'2017-07-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,2),(237,8,2017,'2017-08-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,2),(238,9,2017,'2017-09-30',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,2),(239,10,2017,'2017-10-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,2),(240,11,2017,'2017-11-30',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,2),(241,12,2017,'2017-12-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,2),(242,30,2017,'2017-01-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,3),(243,1,2017,'2017-01-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,3),(244,2,2017,'2017-02-28',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,3),(245,3,2017,'2017-03-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,3),(246,4,2017,'2017-04-30',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,3),(247,5,2017,'2017-05-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,3),(248,6,2017,'2017-06-30',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,3),(249,7,2017,'2017-07-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,3),(250,8,2017,'2017-08-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,3),(251,9,2017,'2017-09-30',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,3),(252,10,2017,'2017-10-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,3),(253,11,2017,'2017-11-30',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,3),(254,12,2017,'2017-12-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,3),(255,30,2017,'2017-01-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,4),(256,1,2017,'2017-01-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,4),(257,2,2017,'2017-02-28',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,4),(258,3,2017,'2017-03-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,4),(259,4,2017,'2017-04-30',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,4),(260,5,2017,'2017-05-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,4),(261,6,2017,'2017-06-30',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,4),(262,7,2017,'2017-07-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,4),(263,8,2017,'2017-08-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,4),(264,9,2017,'2017-09-30',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,4),(265,10,2017,'2017-10-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,4),(266,11,2017,'2017-11-30',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,4),(267,12,2017,'2017-12-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,4),(268,30,2017,'2017-01-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,5),(269,1,2017,'2017-01-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,5),(270,2,2017,'2017-02-28',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,5),(271,3,2017,'2017-03-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,5),(272,4,2017,'2017-04-30',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,5),(273,5,2017,'2017-05-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,5),(274,6,2017,'2017-06-30',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,5),(275,7,2017,'2017-07-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,5),(276,8,2017,'2017-08-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,5),(277,9,2017,'2017-09-30',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,5),(278,10,2017,'2017-10-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,5),(279,11,2017,'2017-11-30',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,5),(280,12,2017,'2017-12-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,5),(281,30,2017,'2017-01-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,6),(282,1,2017,'2017-01-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,6),(283,2,2017,'2017-02-28',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,6),(284,3,2017,'2017-03-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,6),(285,4,2017,'2017-04-30',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,6),(286,5,2017,'2017-05-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,6),(287,6,2017,'2017-06-30',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,6),(288,7,2017,'2017-07-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,6),(289,8,2017,'2017-08-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,6),(290,9,2017,'2017-09-30',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,6),(291,10,2017,'2017-10-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,6),(292,11,2017,'2017-11-30',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,6),(293,12,2017,'2017-12-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,6),(294,30,2017,'2017-01-31',NULL,1,'2017-03-29','2017-03-27 03:31:33',1,2,7),(295,1,2017,'2017-01-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,7),(296,2,2017,'2017-02-28',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,7),(297,3,2017,'2017-03-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,7),(298,4,2017,'2017-04-30',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,7),(299,5,2017,'2017-05-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,7),(300,6,2017,'2017-06-30',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,7),(301,7,2017,'2017-07-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,7),(302,8,2017,'2017-08-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,7),(303,9,2017,'2017-09-30',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,7),(304,10,2017,'2017-10-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,7),(305,11,2017,'2017-11-30',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,7),(306,12,2017,'2017-12-31',NULL,0,'0000-00-00','2017-03-27 03:31:33',1,2,7),(307,30,2018,'2018-01-31',NULL,0,'0000-00-00','2017-03-27 17:35:13',1,2,8),(308,1,2018,'2018-01-31',NULL,0,'0000-00-00','2017-03-27 17:35:13',1,2,8),(309,2,2018,'2018-02-28',NULL,0,'0000-00-00','2017-03-27 17:35:13',1,2,8),(310,3,2018,'2018-03-31',NULL,0,'0000-00-00','2017-03-27 17:35:13',1,2,8),(311,4,2018,'2018-04-30',NULL,0,'0000-00-00','2017-03-27 17:35:13',1,2,8),(312,5,2018,'2018-05-31',NULL,0,'0000-00-00','2017-03-27 17:35:13',1,2,8),(313,6,2018,'2018-06-30',NULL,0,'0000-00-00','2017-03-27 17:35:13',1,2,8),(314,7,2018,'2018-07-31',NULL,0,'0000-00-00','2017-03-27 17:35:13',1,2,8),(315,8,2018,'2018-08-31',NULL,0,'0000-00-00','2017-03-27 17:35:13',1,2,8),(316,9,2018,'2018-09-30',NULL,0,'0000-00-00','2017-03-27 17:35:13',1,2,8),(317,10,2018,'2018-10-31',NULL,0,'0000-00-00','2017-03-27 17:35:13',1,2,8),(318,11,2018,'2018-11-30',NULL,0,'0000-00-00','2017-03-27 17:35:13',1,2,8),(319,12,2018,'2018-12-31',NULL,0,'0000-00-00','2017-03-27 17:35:13',1,2,8),(320,12,2016,'2016-12-31',0,0,'0000-00-00','2017-03-27 17:52:27',1,1,8),(321,30,2017,'2017-01-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,9),(322,1,2017,'2017-01-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,9),(323,2,2017,'2017-02-28',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,9),(324,3,2017,'2017-03-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,9),(325,4,2017,'2017-04-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,9),(326,5,2017,'2017-05-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,9),(327,6,2017,'2017-06-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,9),(328,7,2017,'2017-07-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,9),(329,8,2017,'2017-08-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,9),(330,9,2017,'2017-09-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,9),(331,10,2017,'2017-10-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,9),(332,11,2017,'2017-11-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,9),(333,12,2017,'2017-12-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,9),(334,30,2017,'2017-01-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,10),(335,1,2017,'2017-01-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,10),(336,2,2017,'2017-02-28',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,10),(337,3,2017,'2017-03-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,10),(338,4,2017,'2017-04-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,10),(339,5,2017,'2017-05-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,10),(340,6,2017,'2017-06-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,10),(341,7,2017,'2017-07-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,10),(342,8,2017,'2017-08-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,10),(343,9,2017,'2017-09-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,10),(344,10,2017,'2017-10-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,10),(345,11,2017,'2017-11-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,10),(346,12,2017,'2017-12-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,10),(347,30,2017,'2017-01-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,11),(348,1,2017,'2017-01-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,11),(349,2,2017,'2017-02-28',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,11),(350,3,2017,'2017-03-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,11),(351,4,2017,'2017-04-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,11),(352,5,2017,'2017-05-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,11),(353,6,2017,'2017-06-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,11),(354,7,2017,'2017-07-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,11),(355,8,2017,'2017-08-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,11),(356,9,2017,'2017-09-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,11),(357,10,2017,'2017-10-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,11),(358,11,2017,'2017-11-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,11),(359,12,2017,'2017-12-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,11),(360,30,2017,'2017-01-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,12),(361,1,2017,'2017-01-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,12),(362,2,2017,'2017-02-28',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,12),(363,3,2017,'2017-03-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,12),(364,4,2017,'2017-04-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,12),(365,5,2017,'2017-05-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,12),(366,6,2017,'2017-06-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,12),(367,7,2017,'2017-07-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,12),(368,8,2017,'2017-08-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,12),(369,9,2017,'2017-09-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,12),(370,10,2017,'2017-10-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,12),(371,11,2017,'2017-11-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,12),(372,12,2017,'2017-12-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,12),(373,30,2017,'2017-01-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,13),(374,1,2017,'2017-01-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,13),(375,2,2017,'2017-02-28',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,13),(376,3,2017,'2017-03-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,13),(377,4,2017,'2017-04-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,13),(378,5,2017,'2017-05-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,13),(379,6,2017,'2017-06-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,13),(380,7,2017,'2017-07-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,13),(381,8,2017,'2017-08-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,13),(382,9,2017,'2017-09-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,13),(383,10,2017,'2017-10-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,13),(384,11,2017,'2017-11-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,13),(385,12,2017,'2017-12-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,13),(386,30,2017,'2017-01-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,14),(387,1,2017,'2017-01-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,14),(388,2,2017,'2017-02-28',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,14),(389,3,2017,'2017-03-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,14),(390,4,2017,'2017-04-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,14),(391,5,2017,'2017-05-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,14),(392,6,2017,'2017-06-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,14),(393,7,2017,'2017-07-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,14),(394,8,2017,'2017-08-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,14),(395,9,2017,'2017-09-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,14),(396,10,2017,'2017-10-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,14),(397,11,2017,'2017-11-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,14),(398,12,2017,'2017-12-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,14),(399,30,2017,'2017-01-31',NULL,1,'2017-04-18','2017-04-18 19:28:32',1,2,15),(400,1,2017,'2017-01-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,15),(401,2,2017,'2017-02-28',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,15),(402,3,2017,'2017-03-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,15),(403,4,2017,'2017-04-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,15),(404,5,2017,'2017-05-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,15),(405,6,2017,'2017-06-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,15),(406,7,2017,'2017-07-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,15),(407,8,2017,'2017-08-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,15),(408,9,2017,'2017-09-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,15),(409,10,2017,'2017-10-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,15),(410,11,2017,'2017-11-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,15),(411,12,2017,'2017-12-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,15),(412,30,2017,'2017-01-31',NULL,1,'2017-04-18','2017-04-18 19:28:32',1,2,16),(413,1,2017,'2017-01-31',NULL,1,'2017-04-28','2017-04-18 19:28:32',1,2,16),(414,2,2017,'2017-02-28',NULL,1,'2017-04-28','2017-04-18 19:28:32',1,2,16),(415,3,2017,'2017-03-31',NULL,1,'2017-04-28','2017-04-18 19:28:32',1,2,16),(416,4,2017,'2017-04-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,16),(417,5,2017,'2017-05-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,16),(418,6,2017,'2017-06-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,16),(419,7,2017,'2017-07-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,16),(420,8,2017,'2017-08-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,16),(421,9,2017,'2017-09-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,16),(422,10,2017,'2017-10-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,16),(423,11,2017,'2017-11-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,16),(424,12,2017,'2017-12-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,16),(425,30,2017,'2017-01-31',NULL,1,'2017-04-18','2017-04-18 19:28:32',1,2,17),(426,1,2017,'2017-01-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,17),(427,2,2017,'2017-02-28',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,17),(428,3,2017,'2017-03-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,17),(429,4,2017,'2017-04-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,17),(430,5,2017,'2017-05-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,17),(431,6,2017,'2017-06-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,17),(432,7,2017,'2017-07-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,17),(433,8,2017,'2017-08-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,17),(434,9,2017,'2017-09-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,17),(435,10,2017,'2017-10-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,17),(436,11,2017,'2017-11-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,17),(437,12,2017,'2017-12-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,17),(438,30,2017,'2017-01-31',NULL,1,'2017-04-18','2017-04-18 19:28:32',1,2,18),(439,1,2017,'2017-01-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,18),(440,2,2017,'2017-02-28',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,18),(441,3,2017,'2017-03-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,18),(442,4,2017,'2017-04-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,18),(443,5,2017,'2017-05-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,18),(444,6,2017,'2017-06-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,18),(445,7,2017,'2017-07-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,18),(446,8,2017,'2017-08-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,18),(447,9,2017,'2017-09-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,18),(448,10,2017,'2017-10-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,18),(449,11,2017,'2017-11-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,18),(450,12,2017,'2017-12-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,18),(451,30,2017,'2017-01-31',NULL,1,'2017-04-18','2017-04-18 19:28:32',1,2,19),(452,1,2017,'2017-01-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,19),(453,2,2017,'2017-02-28',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,19),(454,3,2017,'2017-03-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,19),(455,4,2017,'2017-04-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,19),(456,5,2017,'2017-05-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,19),(457,6,2017,'2017-06-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,19),(458,7,2017,'2017-07-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,19),(459,8,2017,'2017-08-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,19),(460,9,2017,'2017-09-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,19),(461,10,2017,'2017-10-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,19),(462,11,2017,'2017-11-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,19),(463,12,2017,'2017-12-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,19),(464,30,2017,'2017-01-31',NULL,1,'2017-04-18','2017-04-18 19:28:32',1,2,20),(465,1,2017,'2017-01-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,20),(466,2,2017,'2017-02-28',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,20),(467,3,2017,'2017-03-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,20),(468,4,2017,'2017-04-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,20),(469,5,2017,'2017-05-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,20),(470,6,2017,'2017-06-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,20),(471,7,2017,'2017-07-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,20),(472,8,2017,'2017-08-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,20),(473,9,2017,'2017-09-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,20),(474,10,2017,'2017-10-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,20),(475,11,2017,'2017-11-30',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,20),(476,12,2017,'2017-12-31',NULL,0,'0000-00-00','2017-04-18 19:28:32',1,2,20),(479,30,2017,'2017-04-30',NULL,1,'2017-04-18','2017-04-18 19:51:11',2,2,21),(480,4,2017,'2017-04-30',NULL,0,'0000-00-00','2017-04-18 19:51:11',2,2,21),(481,5,2017,'2017-05-31',NULL,0,'0000-00-00','2017-04-18 19:51:11',2,2,21),(482,6,2017,'2017-06-30',NULL,0,'0000-00-00','2017-04-18 19:51:11',2,2,21),(483,7,2017,'2017-07-31',NULL,0,'0000-00-00','2017-04-18 19:51:11',2,2,21),(484,8,2017,'2017-08-31',NULL,0,'0000-00-00','2017-04-18 19:51:11',2,2,21),(485,9,2017,'2017-09-30',NULL,0,'0000-00-00','2017-04-18 19:51:11',2,2,21),(486,10,2017,'2017-10-31',NULL,0,'0000-00-00','2017-04-18 19:51:11',2,2,21),(487,11,2017,'2017-11-30',NULL,0,'0000-00-00','2017-04-18 19:51:11',2,2,21),(488,12,2017,'2017-12-31',NULL,0,'0000-00-00','2017-04-18 19:51:11',2,2,21);
/*!40000 ALTER TABLE `acade_calendario_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acade_detalle_orientador`
--

DROP TABLE IF EXISTS `acade_detalle_orientador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acade_detalle_orientador` (
  `id_orientador` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave primaria incremental',
  `id_docente` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_dcoente, indice',
  `id_curso` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_curso, indice',
  `id_annio_lectivo` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_annio_lectivo, indice',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL COMMENT 'usuario que creo el registro solo com referencia, relacion imaginaria',
  PRIMARY KEY (`id_orientador`),
  UNIQUE KEY `curso_annio_lectivo` (`id_curso`,`id_annio_lectivo`),
  KEY `id_docente` (`id_docente`),
  KEY `id_curso` (`id_curso`),
  KEY `id_annio_lectivo` (`id_annio_lectivo`),
  CONSTRAINT `fk_detalleorientador_anniolectivo` FOREIGN KEY (`id_annio_lectivo`) REFERENCES `adm_alumno_detalle` (`id_annio_lectivo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_detalleorientador_curso` FOREIGN KEY (`id_curso`) REFERENCES `adm_curso` (`id_curso`) ON UPDATE CASCADE,
  CONSTRAINT `fk_detalleorientador_docente` FOREIGN KEY (`id_docente`) REFERENCES `adm_docente` (`id_docente`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acade_detalle_orientador`
--

LOCK TABLES `acade_detalle_orientador` WRITE;
/*!40000 ALTER TABLE `acade_detalle_orientador` DISABLE KEYS */;
INSERT INTO `acade_detalle_orientador` VALUES (32,22,1,2,'2017-04-06 21:44:26',3),(48,22,3,2,'2017-04-08 17:50:10',3),(49,22,5,2,'2017-04-08 17:50:17',3),(51,21,4,2,'2017-04-08 17:50:41',3),(54,27,2,2,'2017-04-10 22:03:05',2);
/*!40000 ALTER TABLE `acade_detalle_orientador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acade_especialidad`
--

DROP TABLE IF EXISTS `acade_especialidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acade_especialidad` (
  `id_especialidad` smallint(6) NOT NULL COMMENT 'llave primaria no incremental',
  `especialidad_nombre` varchar(80) NOT NULL COMMENT 'nombre o descripcion de la especialidad del docente',
  `especialidad_estado` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'estado de la especialidad 1=activo,  0=inactivo',
  `id_lista` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_lista, indice',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL COMMENT 'usuario que creo el registro solo como referencia no constrain',
  PRIMARY KEY (`id_especialidad`),
  UNIQUE KEY `especialidad_nombre` (`especialidad_nombre`),
  UNIQUE KEY `nombre_especialidad_lista` (`especialidad_nombre`,`id_lista`),
  KEY `id_lista` (`id_lista`),
  CONSTRAINT `fk_especialidad_lista` FOREIGN KEY (`id_lista`) REFERENCES `adm_lista` (`id_lista`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acade_especialidad`
--

LOCK TABLES `acade_especialidad` WRITE;
/*!40000 ALTER TABLE `acade_especialidad` DISABLE KEYS */;
INSERT INTO `acade_especialidad` VALUES (1,'INGENIERO EN SISTEMAS Y REDES INFORMÁTICAS',1,8,'2017-03-01 17:25:21',1),(2,'CIENCIAS DE LA EDUCACIÓN',1,7,'2017-03-01 17:25:21',1),(3,'FÍSICO-QUÍMICO',1,8,'2017-03-01 17:25:21',1),(4,'Enfermeria',1,6,'2017-04-12 20:03:34',0),(5,'Educación secundaria',1,6,'2017-04-12 20:05:09',0),(6,'Matématicas',1,11,'2017-04-12 20:09:00',0),(7,'Inglés II',1,9,'2017-04-12 20:30:05',0),(8,'EN ELECTRÓNICA',1,8,'2017-04-12 21:42:16',0);
/*!40000 ALTER TABLE `acade_especialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acade_informacion_general`
--

DROP TABLE IF EXISTS `acade_informacion_general`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acade_informacion_general` (
  `informacion_nombre_institucion` varchar(100) NOT NULL COMMENT 'nombre completo de la institucion',
  `informacion_siglas` varchar(10) NOT NULL COMMENT 'siglas del nombre de la isntitucion',
  `informacion_codigo_infraestructura` varchar(10) NOT NULL COMMENT 'codigo de infraestructura legalizado',
  `informacion_distrito` varchar(10) NOT NULL COMMENT 'numero de distrito asignado',
  `informacion_direccion` varchar(100) NOT NULL,
  `informacion_telefonos` varchar(250) DEFAULT NULL,
  `informacion_correo` varchar(50) DEFAULT NULL,
  `informacion_mision` longtext,
  `informacion_vision` longtext,
  `informacion_valores` longtext,
  `informacion_nombre_logo` varchar(80) DEFAULT NULL COMMENT 'nombre de la imagen, no la ruta porquque ya sesabe donde se almacenara',
  `informacion_url` varchar(100) DEFAULT NULL COMMENT 'direccion web de la intitucion',
  `id_municipio` smallint(6) NOT NULL DEFAULT '1' COMMENT 'llave foranea para relacionar con la tabla adm_municipio, indice',
  KEY `id_municipio` (`id_municipio`),
  CONSTRAINT `fk_informaciongeneral_municipio` FOREIGN KEY (`id_municipio`) REFERENCES `adm_municipio` (`id_municipio`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acade_informacion_general`
--

LOCK TABLES `acade_informacion_general` WRITE;
/*!40000 ALTER TABLE `acade_informacion_general` DISABLE KEYS */;
INSERT INTO `acade_informacion_general` VALUES ('INSTITUTO NACIONAL DE ALGÚN LUGAR DE EL SALVADOR','INLUS','1500','11-16','SANTIAGO DE MARÍA','2925-000, 2526-0205','inlus@gmail.com','ALGUNA MISIÓN','SUSTITUIR','ALGUNOS VALORES','Logo_TV_2015.png','http://www.inlus.com',260);
/*!40000 ALTER TABLE `acade_informacion_general` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acade_modalidad`
--

DROP TABLE IF EXISTS `acade_modalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acade_modalidad` (
  `id_modalidad` int(11) NOT NULL COMMENT 'llave primaria no incremental',
  `modalidad_nombre` varchar(200) NOT NULL COMMENT 'nombre o descripcion de la modalidad o curso',
  `modalidad_duracion` tinyint(4) NOT NULL COMMENT 'tiempo en años lo que dura la carrera o la modalidad',
  `modalidad_comentario` varchar(400) DEFAULT NULL COMMENT 'algun comentario extra al curso',
  `modalidad_estado` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'almacena el estado de la modalida o curso true = activo, false = inactivo',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL COMMENT 'usuario que creo el registro solo como referencia no constrain',
  PRIMARY KEY (`id_modalidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acade_modalidad`
--

LOCK TABLES `acade_modalidad` WRITE;
/*!40000 ALTER TABLE `acade_modalidad` DISABLE KEYS */;
INSERT INTO `acade_modalidad` VALUES (1,'EDUCACIÓN BÁSICA',3,'',1,'2017-02-27 19:51:30',1),(2,'BACHILLERATO TÉCNICO VOCACIONAL',3,'Bachillerato de 3 años con especialidad',1,'2017-02-27 19:56:43',1),(3,'BACHILLERATO GENERAL',3,'',1,'2017-02-27 19:59:07',1),(4,'BACHILLERATO GENERAL NOCTURNO',4,'Bachillerato nocturno 4 años',1,'2017-02-27 19:59:35',1),(5,'CURSO DE VERANO 2017',3,'El curso tiene como objetivo cambiar todos los modos operandis',0,'2017-02-27 20:58:13',1),(6,'MODALIDAD PRUEBA PA',2,'NINGUNA',1,'2017-03-30 16:29:24',3),(7,'PRUEBA DOS PA',3,'PRUEBA DE MODIFICACIÓN CON PA',0,'2017-03-30 16:32:12',3),(8,'CURSO DE VERANO 2017',1,'CURSO DE VERANO DURACIÓN 6 MESES',1,'2017-03-30 17:09:48',3);
/*!40000 ALTER TABLE `acade_modalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acade_periodo`
--

DROP TABLE IF EXISTS `acade_periodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acade_periodo` (
  `id_periodo` int(11) NOT NULL COMMENT 'llave primaria no incremental',
  `periodo_numero` tinyint(4) NOT NULL COMMENT 'numero del periodo en numeros arabigos',
  `periodo_nombre` varchar(50) DEFAULT NULL,
  `periodo_estado` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'estado del del periodo 1=true activo, 0=false inactivo',
  `id_annio_lectivo` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_annio_lectivo, indice',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL COMMENT 'usuario que crea el registro',
  PRIMARY KEY (`id_periodo`),
  UNIQUE KEY `anniolectivo_periodos_unico` (`id_annio_lectivo`,`periodo_numero`),
  KEY `id_annio_lectivo` (`id_annio_lectivo`),
  CONSTRAINT `fk_periodo_anniolectivo` FOREIGN KEY (`id_annio_lectivo`) REFERENCES `adm_annio_lectivo` (`id_annio_lectivo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acade_periodo`
--

LOCK TABLES `acade_periodo` WRITE;
/*!40000 ALTER TABLE `acade_periodo` DISABLE KEYS */;
INSERT INTO `acade_periodo` VALUES (1,1,'preuba para funcion que no permita desmatircular',0,1,'2017-03-11 17:04:39',1),(2,1,'PERÍODO I',0,2,'2017-04-18 20:40:44',1),(3,2,'Segundo período',0,2,'2017-04-18 21:58:44',1),(4,3,'Tercer período',1,2,'2017-04-18 22:00:15',1);
/*!40000 ALTER TABLE `acade_periodo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acade_periodo_nota_detalle`
--

DROP TABLE IF EXISTS `acade_periodo_nota_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acade_periodo_nota_detalle` (
  `id_nota_detalle` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave primaria incremental',
  `N_1` decimal(4,2) DEFAULT NULL COMMENT 'nota uno para el periodo cualesquiera',
  `N_2` decimal(2,2) NOT NULL COMMENT 'nota dos para el periodo cualesquiera',
  `N_3` decimal(2,2) NOT NULL COMMENT 'nota tres para el periodo cualesquiera',
  `id_periodo` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabla acade_periodo, indice',
  `id_alumno` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_alumno, indice',
  `id_materia` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_materia, indice',
  `id_annio_lectivo` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_annio_lectivo, indice',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL COMMENT 'usuario que crea el registro',
  PRIMARY KEY (`id_nota_detalle`),
  UNIQUE KEY `periodo_alumno_materia_annio_lectivo` (`id_periodo`,`id_alumno`,`id_materia`,`id_annio_lectivo`),
  KEY `id_periodo` (`id_periodo`),
  KEY `id_alumno` (`id_alumno`),
  KEY `id_materia` (`id_materia`),
  KEY `id_annio_lectivo` (`id_annio_lectivo`),
  CONSTRAINT `fk_periodonotadetalle_alumno` FOREIGN KEY (`id_alumno`) REFERENCES `adm_alumno` (`id_alumno`) ON UPDATE CASCADE,
  CONSTRAINT `fk_periodonotadetalle_anniolectivo` FOREIGN KEY (`id_annio_lectivo`) REFERENCES `adm_annio_lectivo` (`id_annio_lectivo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_periodonotadetalle_materia` FOREIGN KEY (`id_materia`) REFERENCES `adm_materia` (`id_materia`) ON UPDATE CASCADE,
  CONSTRAINT `fk_periodonotadetalle_periodo` FOREIGN KEY (`id_periodo`) REFERENCES `acade_periodo` (`id_periodo`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acade_periodo_nota_detalle`
--

LOCK TABLES `acade_periodo_nota_detalle` WRITE;
/*!40000 ALTER TABLE `acade_periodo_nota_detalle` DISABLE KEYS */;
INSERT INTO `acade_periodo_nota_detalle` VALUES (68,2.00,0.00,0.00,2,21,1,2,'2017-04-18 21:53:28',1),(69,5.00,0.00,0.00,2,5,1,2,'2017-04-18 21:53:28',1),(70,8.00,0.00,0.00,2,20,1,2,'2017-04-18 21:53:28',1),(71,4.00,0.00,0.00,2,19,1,2,'2017-04-18 21:53:28',1),(72,0.00,0.00,0.00,2,8,1,2,'2017-04-18 21:56:57',1),(73,0.00,0.00,0.00,2,1,1,2,'2017-04-18 21:56:58',1),(74,0.00,0.00,0.00,2,4,1,2,'2017-04-18 21:56:58',1),(75,9.25,0.00,0.00,2,2,1,2,'2017-04-18 21:56:58',1),(76,10.00,0.00,0.00,2,21,2,2,'2017-04-18 21:57:40',1),(77,10.00,0.00,0.00,2,5,2,2,'2017-04-18 21:57:40',1),(78,10.00,0.00,0.00,2,20,2,2,'2017-04-18 21:57:40',1),(79,10.00,0.00,0.00,2,19,2,2,'2017-04-18 21:57:40',1),(80,5.00,0.00,0.00,3,21,1,2,'2017-04-18 21:59:04',1),(81,5.00,0.00,0.00,3,5,1,2,'2017-04-18 21:59:04',1),(82,5.00,0.00,0.00,3,20,1,2,'2017-04-18 21:59:04',1),(83,5.00,0.00,0.00,3,19,1,2,'2017-04-18 21:59:05',1),(84,9.00,0.00,0.00,3,21,2,2,'2017-04-18 21:59:51',1),(85,9.00,0.00,0.00,3,5,2,2,'2017-04-18 21:59:52',1),(86,9.00,0.00,0.00,3,20,2,2,'2017-04-18 21:59:52',1),(87,9.00,0.00,0.00,3,19,2,2,'2017-04-18 21:59:52',1),(88,3.60,0.00,0.00,4,21,1,2,'2017-04-18 22:00:35',1),(89,6.00,0.00,0.00,4,5,1,2,'2017-04-18 22:00:36',1),(90,2.50,0.00,0.00,4,20,1,2,'2017-04-18 22:00:36',1),(91,7.40,0.00,0.00,4,19,1,2,'2017-04-18 22:00:36',1),(92,8.50,0.00,0.00,4,21,2,2,'2017-04-18 22:00:54',1),(93,8.50,0.00,0.00,4,5,2,2,'2017-04-18 22:00:54',1),(94,8.50,0.00,0.00,4,20,2,2,'2017-04-18 22:00:54',1),(95,8.50,0.00,0.00,4,19,2,2,'2017-04-18 22:00:55',1),(96,9.25,0.00,0.00,4,21,3,2,'2017-04-22 17:32:33',1),(97,9.25,0.00,0.00,4,5,3,2,'2017-04-22 17:32:33',1),(98,9.25,0.00,0.00,4,20,3,2,'2017-04-22 17:32:34',1),(99,9.25,0.00,0.00,4,19,3,2,'2017-04-22 17:32:34',1),(100,9.25,0.00,0.00,2,5,3,2,'2017-04-22 17:32:34',1),(101,9.25,0.00,0.00,2,20,3,2,'2017-04-22 17:32:34',1),(102,9.25,0.00,0.00,2,19,3,2,'2017-04-22 17:32:34',1),(103,9.25,0.00,0.00,2,21,3,2,'2017-04-22 17:32:34',1),(104,9.25,0.00,0.00,3,5,3,2,'2017-04-22 17:32:34',1),(105,9.25,0.00,0.00,3,20,3,2,'2017-04-22 17:32:34',1),(106,9.25,0.00,0.00,3,19,3,2,'2017-04-22 17:32:34',1),(107,9.25,0.00,0.00,3,21,3,2,'2017-04-22 17:32:34',1);
/*!40000 ALTER TABLE `acade_periodo_nota_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adm_alumno`
--

DROP TABLE IF EXISTS `adm_alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_alumno` (
  `id_alumno` int(11) NOT NULL COMMENT 'llave primaria no incremental',
  `alumno_codigo` varchar(6) NOT NULL COMMENT 'codigo del alumno, unico',
  `alumno_nombre` varchar(175) NOT NULL COMMENT 'nombres de los alumnos',
  `alumno_apellido` varchar(175) NOT NULL COMMENT 'apellidos de los alumnos',
  `alumno_direccion` longtext NOT NULL COMMENT 'direccion completa del alumno',
  `alumno_telefonos` varchar(100) DEFAULT NULL COMMENT 'multiples telefonos',
  `alumno_fecha_nacimiento` date NOT NULL COMMENT 'fecha de nacimiento del alumno',
  `alumno_nombre_foto` varchar(80) DEFAULT NULL COMMENT 'nombre de la foto unica no puede repertirse sera la combinacion de el id del alumno mas el nombre de la foto',
  `alumno_correo` varchar(90) DEFAULT NULL COMMENT 'correo del alumno',
  `alumno_estado` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'estado del alumno 1=acitvo, true, 0=inactivo,false',
  `id_lista` int(11) NOT NULL COMMENT 'llave foranera para relacionar con la tabla adm_lista, donde habran multiples registros para armar los combobox en esta caso indica el genero, indice',
  `id_municipio` smallint(6) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL COMMENT 'usuario que crea el registro',
  PRIMARY KEY (`id_alumno`),
  UNIQUE KEY `alumno_codigo` (`alumno_codigo`),
  KEY `id_municipio` (`id_municipio`),
  KEY `id_lista` (`id_lista`),
  CONSTRAINT `fk_alumno_lista` FOREIGN KEY (`id_lista`) REFERENCES `adm_lista` (`id_lista`) ON UPDATE CASCADE,
  CONSTRAINT `fk_alumno_municipio` FOREIGN KEY (`id_municipio`) REFERENCES `adm_municipio` (`id_municipio`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_alumno`
--

LOCK TABLES `adm_alumno` WRITE;
/*!40000 ALTER TABLE `adm_alumno` DISABLE KEYS */;
INSERT INTO `adm_alumno` VALUES (1,'000517','CARLOS MARIO','MEDINA','LA USULUTECA','72581215','1970-01-01',NULL,'gmail@gmail.com',1,2,118,'2017-03-03 20:11:39',1),(2,'000217','MARIA DE LOS ANGELES','RUIZ MARTINEZ','AVENIDA SHILTUPAN','2225-0505','1987-02-12',NULL,'every@gmail.com',1,1,109,'2017-03-03 20:21:23',1),(3,'000317','MARTA','MEDINA','OVEROLTE','','1987-10-15',NULL,'',1,1,35,'2017-03-03 20:26:01',1),(4,'000417','CARLOS MANUEL','MOLINA','avenida peralta','','2017-06-03',NULL,'',1,2,179,'2017-03-06 17:48:28',1),(5,'000617','CARLOS EDUARDO','MOLINA','de todos partes','','2017-06-03',NULL,'',1,2,172,'2017-03-06 20:34:52',1),(6,'000717','CARLOS MARIO','MEDINA','san salvador','','1970-01-01',NULL,'',1,2,143,'2017-03-06 20:36:02',1),(7,'000817','MARTA LIDIA','ULIEL','LA GARITA','','1970-01-01',NULL,'',1,1,14,'2017-03-14 17:03:09',1),(8,'000917','CARLOS ESRNESTO','CRUZ pinedaa','okdeadfa','','1970-01-01',NULL,'',1,1,187,'2017-03-26 04:34:17',1),(9,'001017','YESENIA MISAELA','PORTILLO AYALA','SAN JACINTO','22356978','1989-01-03',NULL,'misaela@gmail.com',1,1,193,'2017-03-31 00:18:45',3),(10,'001117','MARTA SARAÍ','LÓPEZ ARGUETA','LA SULTANA','','1999-01-01','001117','',1,1,2,'2017-03-31 17:24:32',3),(11,'001217','CARLOS MANUEL MATIAS','URRUTIA','SAN SALVADOR22','','1970-01-01',NULL,'',1,2,1,'2017-03-31 22:00:05',3),(12,'001317','DANIEL CARLOS','MORATALLA','SAN SALVADOR','','1970-01-01',NULL,'',1,2,193,'2017-03-31 22:02:37',3),(13,'001417','CARLOS MANUEL MATIAS','RUIZ MELÉNDEZ','SAN SALVADOR','','1970-01-01',NULL,'',1,2,193,'2017-03-31 22:04:43',3),(14,'001517','YESENIA MISAELA','PORTILLO AYALA','AFASDADSFDS','25','1987-12-21',NULL,'',1,1,260,'2017-03-31 22:37:31',3),(15,'001617','YESENIA MISAELA','PORTILLO AYALA MORATAYA','AVENIDA PERALTA','','1987-01-25','0016171.jpg','',1,1,15,'2017-04-18 15:41:45',2),(16,'001717','CARLOS MANUEL MATIAS','PORTILLO AYALA del monte','avenida peralta','','2017-04-18','0017171.jpg','',1,1,58,'2017-04-18 16:08:14',2),(17,'001817','CARLOS MANUEL MATIAS','URRUTIA ondilina','avenida peralta','','2017-04-27','0018172.jpg','',1,1,108,'2017-04-18 16:17:11',2),(18,'001917','CARLOS MANUEL MATIAS','URRUTIA delimate','alumno_nombre_foto','','2017-04-28','001917.png','',1,1,120,'2017-04-18 16:25:50',2),(19,'002017','YESENIA MISAELA','URBINA','AVENIDA NULMA','','2017-03-30','002017.png','',1,1,93,'2017-04-18 17:11:01',2),(20,'002117','CARLOS MARIO NOEL','SANDOVAL','AVENIDA PERALTA','','2017-04-26','002117.jpg','',1,2,36,'2017-04-18 17:45:18',2),(21,'002217','MARCO ANTONIO','BONILLA POLANCO','avenida eunices','','2009-01-01','002217.jpg','',1,2,260,'2017-04-18 19:51:11',2);
/*!40000 ALTER TABLE `adm_alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adm_alumno_detalle`
--

DROP TABLE IF EXISTS `adm_alumno_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_alumno_detalle` (
  `id_detalle_alumno` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave primaria incremental',
  `id_alumno` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_alumno, indice',
  `id_materia` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_materia, indice',
  `id_curso` int(11) NOT NULL COMMENT 'llave foranea para relacionar con al tabla adm_annio_lectivo, indice',
  `id_annio_lectivo` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_annio_lectivo, indice',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL COMMENT 'para saber el usuario que creo el registro o modifica, relacion imaginaria fk',
  PRIMARY KEY (`id_detalle_alumno`),
  UNIQUE KEY `alumno_curso_aniolectivo` (`id_alumno`,`id_annio_lectivo`),
  KEY `id_alumno` (`id_alumno`),
  KEY `id_curso` (`id_curso`),
  KEY `id_annio_lectivo` (`id_annio_lectivo`),
  CONSTRAINT `fk_alumnodetalle_alumno` FOREIGN KEY (`id_alumno`) REFERENCES `adm_alumno` (`id_alumno`) ON UPDATE CASCADE,
  CONSTRAINT `fk_alumnodetalle_anniolectivo` FOREIGN KEY (`id_annio_lectivo`) REFERENCES `adm_annio_lectivo` (`id_annio_lectivo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_alumnodetalle_curso` FOREIGN KEY (`id_curso`) REFERENCES `adm_curso` (`id_curso`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_alumno_detalle`
--

LOCK TABLES `adm_alumno_detalle` WRITE;
/*!40000 ALTER TABLE `adm_alumno_detalle` DISABLE KEYS */;
INSERT INTO `adm_alumno_detalle` VALUES (4,4,0,1,2,'2017-03-10 11:28:40',1),(6,2,0,1,2,'2017-03-10 11:30:48',1),(11,1,0,1,2,'2017-03-11 11:55:34',1),(12,5,0,3,2,'2017-03-13 10:02:21',1),(13,6,0,2,2,'2017-03-13 10:03:27',1),(15,8,0,1,2,'2017-03-28 22:04:47',1),(16,21,0,3,2,'2017-04-18 19:55:28',1),(17,20,0,3,2,'2017-04-18 19:56:25',1),(18,19,0,3,2,'2017-04-18 19:57:12',1),(19,18,0,5,2,'2017-04-18 19:57:40',1),(20,17,0,5,2,'2017-04-18 19:58:09',1),(21,16,0,5,2,'2017-04-18 19:58:35',1),(22,15,0,5,2,'2017-04-18 19:59:07',1);
/*!40000 ALTER TABLE `adm_alumno_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adm_annio_lectivo`
--

DROP TABLE IF EXISTS `adm_annio_lectivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_annio_lectivo` (
  `id_annio_lectivo` int(11) NOT NULL COMMENT 'llave primaria no incremental',
  `annio` int(11) NOT NULL COMMENT 'año lectivo creado',
  `estado` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'estado del año lectivo en curso 1=true, 0= fasle',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL COMMENT 'usuario que creo el registro',
  PRIMARY KEY (`id_annio_lectivo`),
  UNIQUE KEY `annio` (`annio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_annio_lectivo`
--

LOCK TABLES `adm_annio_lectivo` WRITE;
/*!40000 ALTER TABLE `adm_annio_lectivo` DISABLE KEYS */;
INSERT INTO `adm_annio_lectivo` VALUES (1,2016,1,'2017-02-25 17:50:07',1),(2,2017,1,'2017-02-27 16:57:00',1);
/*!40000 ALTER TABLE `adm_annio_lectivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adm_curso`
--

DROP TABLE IF EXISTS `adm_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_curso` (
  `id_curso` int(11) NOT NULL COMMENT 'llave primaria no incremental',
  `id_modalidad` int(11) NOT NULL COMMENT 'llave forarean para relacionar con la tabla acade_modalidad, indice',
  `curso_nivel` tinyint(2) NOT NULL COMMENT 'nivel del curso o grado en numero arabigo',
  `curso_identificador` char(1) NOT NULL COMMENT 'identificador del grado con una letra del alfabeto',
  `curso_turno` varchar(15) NOT NULL COMMENT 'para identificar si es matutino, vespertino o nocturno',
  `curso_estado` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=activo, 0=false inactivo',
  `id_annio_lectivo` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_annio_lectivo, indice',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL COMMENT 'usuario que crea el registro',
  PRIMARY KEY (`id_curso`),
  UNIQUE KEY `moda_curso_nivel_iden_lectivo` (`id_modalidad`,`curso_nivel`,`curso_identificador`,`id_annio_lectivo`),
  KEY `id_modalidad` (`id_modalidad`),
  KEY `id_annio_lectivo` (`id_annio_lectivo`),
  CONSTRAINT `fk_curso_anniolectivo` FOREIGN KEY (`id_annio_lectivo`) REFERENCES `adm_annio_lectivo` (`id_annio_lectivo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_curso_modalidad` FOREIGN KEY (`id_modalidad`) REFERENCES `acade_modalidad` (`id_modalidad`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_curso`
--

LOCK TABLES `adm_curso` WRITE;
/*!40000 ALTER TABLE `adm_curso` DISABLE KEYS */;
INSERT INTO `adm_curso` VALUES (1,1,1,'L','Matutino',1,2,'2017-02-28 21:26:39',1),(2,1,1,'B','Matutino',1,2,'2017-02-28 21:38:17',1),(3,3,1,'A','Matutino',1,2,'2017-02-28 21:39:53',1),(4,4,1,'A','Matutino',1,2,'2017-02-28 22:18:23',1),(5,2,3,'G','Matutino',1,2,'2017-02-28 23:20:59',1),(6,1,4,'L','Vespertino',1,2,'2017-03-30 21:38:03',1),(7,1,5,'L','Vespertino',1,1,'2017-03-30 21:49:12',3),(8,1,1,'L','Matutino',1,1,'2017-03-30 22:26:19',3),(9,1,3,'M','Matutino',1,2,'2017-03-30 22:38:25',3),(10,1,3,'L','Matutino',1,2,'2017-03-30 22:48:54',3),(11,1,3,'Z','Matutino',1,2,'2017-05-02 16:50:29',2);
/*!40000 ALTER TABLE `adm_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adm_curso_detalle`
--

DROP TABLE IF EXISTS `adm_curso_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_curso_detalle` (
  `id_detalle` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave primaria incremental',
  `id_annio_lectivo` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_annio_lectivo, indice',
  `id_curso` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_curso, indice',
  `id_docente` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_docente, indice',
  `id_materia` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_materia, indice',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL COMMENT 'usuario que crea el registro',
  PRIMARY KEY (`id_detalle`),
  UNIQUE KEY `indice_compuesto_unico` (`id_annio_lectivo`,`id_curso`,`id_docente`,`id_materia`),
  KEY `id_annio_lectivo` (`id_annio_lectivo`),
  KEY `id_curso` (`id_curso`),
  KEY `id_docente` (`id_docente`),
  KEY `id_materia` (`id_materia`),
  CONSTRAINT `fk_cursodetalle_anniolectivo` FOREIGN KEY (`id_annio_lectivo`) REFERENCES `adm_annio_lectivo` (`id_annio_lectivo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_cursodetalle_curso` FOREIGN KEY (`id_curso`) REFERENCES `adm_curso` (`id_curso`) ON UPDATE CASCADE,
  CONSTRAINT `fk_cursodetalle_docente` FOREIGN KEY (`id_docente`) REFERENCES `adm_docente` (`id_docente`) ON UPDATE CASCADE,
  CONSTRAINT `fk_cursodetalle_materia` FOREIGN KEY (`id_materia`) REFERENCES `adm_materia` (`id_materia`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_curso_detalle`
--

LOCK TABLES `adm_curso_detalle` WRITE;
/*!40000 ALTER TABLE `adm_curso_detalle` DISABLE KEYS */;
INSERT INTO `adm_curso_detalle` VALUES (2,2,4,21,1,'2017-03-07 22:08:16',1),(3,2,5,21,1,'2017-03-07 22:08:16',1),(6,2,3,21,1,'2017-03-07 22:56:50',1),(7,2,4,21,2,'2017-03-08 20:20:42',1),(8,2,2,21,3,'2017-03-08 20:30:51',1),(9,2,1,21,3,'2017-03-08 20:30:51',1),(21,2,3,22,1,'2017-03-08 22:30:00',1),(22,2,4,22,1,'2017-03-08 22:30:00',1),(23,2,2,22,1,'2017-03-08 22:30:00',1),(24,2,1,22,1,'2017-03-08 22:30:00',1),(25,2,5,22,1,'2017-03-08 22:30:00',1),(26,2,3,22,2,'2017-03-08 22:30:23',1),(27,2,4,22,2,'2017-03-08 22:30:23',1),(29,2,1,22,2,'2017-03-08 22:30:24',1),(30,2,5,22,2,'2017-03-08 22:30:24',1),(32,2,2,6,1,'2017-03-14 17:48:06',1),(37,2,2,27,3,'2017-03-31 23:44:49',1),(38,2,2,26,1,'2017-04-10 16:15:05',1),(39,2,3,27,3,'2017-04-22 17:24:40',1);
/*!40000 ALTER TABLE `adm_curso_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adm_departamento`
--

DROP TABLE IF EXISTS `adm_departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_departamento` (
  `id_departamento` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT 'llave primaria incremental',
  `departamento_nombre` varchar(150) NOT NULL COMMENT 'nombreo o descripcion del departamento',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL COMMENT 'usuario que crea el registro',
  PRIMARY KEY (`id_departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_departamento`
--

LOCK TABLES `adm_departamento` WRITE;
/*!40000 ALTER TABLE `adm_departamento` DISABLE KEYS */;
INSERT INTO `adm_departamento` VALUES (1,'Ahuachapán','2017-03-01 16:28:35',1),(2,'Cabañas','2017-03-01 16:28:35',1),(3,'Chalatenango','2017-03-01 16:28:35',1),(4,'Cuscatlán','2017-03-01 16:28:36',1),(5,'La Libertad','2017-03-01 16:28:36',1),(6,'La Paz','2017-03-01 16:28:36',1),(7,'La Unión','2017-03-01 16:28:36',1),(8,'Morazán','2017-03-01 16:28:36',1),(9,'San Miguel','2017-03-01 16:28:36',1),(10,'San Salvador','2017-03-01 16:28:36',1),(11,'San Vicente','2017-03-01 16:28:36',1),(12,'Santa Ana','2017-03-01 16:28:36',1),(13,'Sonsonate','2017-03-01 16:28:36',1),(14,'Usulután','2017-03-01 16:28:36',1);
/*!40000 ALTER TABLE `adm_departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adm_docente`
--

DROP TABLE IF EXISTS `adm_docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_docente` (
  `id_docente` int(11) NOT NULL COMMENT 'llave primari no incremental',
  `docente_nombre` varchar(150) NOT NULL,
  `docente_apellido` varchar(150) NOT NULL,
  `docente_direccion` longtext NOT NULL,
  `docente_fecha_nacimiento` date NOT NULL COMMENT 'fecha de nacimiento del docente',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_usuario, indice',
  `id_municipio` smallint(6) NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_municipio, indice',
  `id_especialidad` smallint(6) NOT NULL COMMENT 'llave foranea para relacionar con la tabla acade_especialidad',
  PRIMARY KEY (`id_docente`),
  UNIQUE KEY `id_usuario_unico` (`id_usuario`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_municipio` (`id_municipio`),
  KEY `id_especialidad` (`id_especialidad`),
  CONSTRAINT `fk_docente_especialidad` FOREIGN KEY (`id_especialidad`) REFERENCES `acade_especialidad` (`id_especialidad`) ON UPDATE CASCADE,
  CONSTRAINT `fk_docente_municipio` FOREIGN KEY (`id_municipio`) REFERENCES `adm_municipio` (`id_municipio`) ON UPDATE CASCADE,
  CONSTRAINT `fk_docente_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `adm_usuario` (`id_usuario`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_docente`
--

LOCK TABLES `adm_docente` WRITE;
/*!40000 ALTER TABLE `adm_docente` DISABLE KEYS */;
INSERT INTO `adm_docente` VALUES (1,'MARIA LUISA','VASQUEZ','MEJICANOS','1987-01-05','2017-02-17 22:53:10',1,1,1),(2,'CARLOS MARIO','ROMERO','LA GARITA PALMERA, CIUDAD DELGADO','1987-02-05','2017-02-17 22:53:10',2,1,1),(3,'MARVIN GIANCARLO','CRUZ','LA GARITA CIUDAD DELGADO','1987-01-05','2017-02-22 15:41:03',3,1,1),(4,'maria luisa marta','CRUZ PERALTA','SANTIAGO DE MARÍA USULUTÁN','1987-01-05','2017-02-22 15:48:17',4,1,1),(5,'MARVIN GIANCARLO','CRUZ','ALGÚN LUGAR DE LA TIERRA','1987-01-05','2017-02-22 16:32:38',5,1,1),(6,'morlon ustiel','CRUZ','SAN SALADOR ever','1987-01-05','2017-02-22 16:33:55',6,1,1),(7,'karlos de la garza','motoniel','SANTIAGO PERULAPILLA','1962-04-28','2017-02-22 16:53:15',7,1,1),(8,'doromita eustacia','candida perez','SAN SALVADOR EL Salvaodor','1962-04-29','2017-02-22 17:10:05',8,1,1),(9,'CARLOS MARIO ALEXANDER','ROMERO CRUZ MUÑOZ','DE SAN SALVADOR','1962-04-12','2017-02-24 16:12:02',9,1,1),(10,'MARIA ANA','MONTIEL','SUCHITOTO','1962-04-28','2017-02-24 16:15:35',10,1,1),(11,'CANDELARIO RUFINO','RUFIAN MONTIEL','CONDOMINIO','1962-04-28','2017-02-24 16:16:35',11,1,1),(12,'JUAN KARLO','OTONIEL','GARITA','1962-04-06','2017-02-24 16:19:04',12,1,1),(13,'JULIANA DEL PUCHUNTE','CRUZ','OLOCUILTA','1945-11-01','2017-02-24 16:21:24',13,1,1),(14,'JHON CARLO','MURATALLO','TESTACUANGO','1945-11-01','2017-02-24 16:31:08',14,1,1),(15,'DONOBAN','JULIEL','JIQUILISCO','1945-11-01','2017-02-24 16:51:00',15,1,1),(16,'LILIAN DEL MONTE','DE JUPIANINI','SANTA ANA','1945-11-01','2017-02-24 16:52:47',16,1,1),(17,'Ultimo usuario de prueba','usuario de apellidos','ciudad de prueba','1945-11-01','2017-02-24 20:20:38',17,1,1),(18,'MARTA ELIZABETH','VENTURA AYALA','SOYAPANGO','1945-11-01','2017-02-24 21:45:24',18,1,1),(19,'MARIA TIMOTEA EUSTAQUIA','DEL MONTE','MEJICANOS','1945-11-03','2017-03-01 20:35:53',19,187,3),(20,'dolores de jesus','pineda','san salvador','1945-11-03','2017-03-01 20:37:26',20,179,1),(21,'MARIA LUISA','canales','santiago de maría','1945-11-10','2017-03-01 20:40:00',21,259,3),(22,'MIRIAN ADELINA','TURCIOS FLORES','SANTA MARÍA','1945-12-03','2017-03-08 22:29:13',22,259,1),(23,'prueba','prueba','prueba','1945-12-18','2017-03-29 21:14:29',23,1,1),(24,'MARIA LUISA','ORDEÑES','AVENIDA PERALTA','1945-12-13','2017-03-29 22:09:08',24,25,3),(25,'MARIA LUISA','hernadnes','AVENIDA PERALTA','1945-12-24','2017-03-29 22:10:39',25,25,3),(26,'MARIA LUISA','CANALES DOMILITA','AVENIDA PERALTA SAN DIEGO','1945-12-29','2017-03-29 22:11:51',26,25,2),(27,'MARTA SANDRA','CASTILLO DEL SOCORRO DE HERNÁNDEZ','SAN MARTÍN','1945-12-30','2017-03-30 20:29:12',27,192,2),(28,'MARIA LUISA','ORDEÑES','fsdafsdfsd','1945-12-31','2017-04-17 20:18:01',28,3,7),(29,'MARIA LUISA AURORA','CANALES DOMILITA','AVENIDA PERALTA','1945-12-30','2017-04-17 20:37:52',29,57,8),(30,'JUAN CARLOS DANIEL','MONTIEL CORNIEL','AVENIDA OLOCUILTA','1989-10-05','2017-05-02 16:19:46',30,193,3);
/*!40000 ALTER TABLE `adm_docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adm_lista`
--

DROP TABLE IF EXISTS `adm_lista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_lista` (
  `id_lista` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave primaria incremental',
  `lista_valor` varchar(60) NOT NULL COMMENT 'volor que contendra la lista',
  `lista_id_opcion` tinyint(4) NOT NULL COMMENT 'valor para indicar en que opcion o mudolo del sitema se ocupara',
  `lista_comentario` varchar(100) DEFAULT NULL COMMENT 'comentario para indicar donde se ocupara',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_lista`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_lista`
--

LOCK TABLES `adm_lista` WRITE;
/*!40000 ALTER TABLE `adm_lista` DISABLE KEYS */;
INSERT INTO `adm_lista` VALUES (1,'FEMENINO',1,'se ocupara en el registro de alumnos','2017-03-01 23:24:16'),(2,'MASCULINO',1,'se ocupara en el registro de alumnos','2017-03-01 23:24:16'),(3,'PUREBA',2,'PRUEBA','2017-03-02 17:41:46'),(4,'PRUEBA',2,'PUREBA','2017-03-02 17:41:46'),(5,'Bachi.',3,'se ocupara en el registro de especialidades','2017-04-12 17:49:58'),(6,'Tec.',3,'se ocupara en el registro de especialidades','2017-04-12 17:49:58'),(7,'Lic.',3,'se ocupara en el registro de especialidades','2017-04-12 17:49:58'),(8,'Ing.',3,'se ocupara en el registro de especialidades','2017-04-12 17:49:58'),(9,'Máster.',3,'se ocupara en el registro de especialidades','2017-04-12 17:49:58'),(10,'Dr.',3,'se ocupara en el registro de especialidades','2017-04-12 17:49:58'),(11,'Prof.',3,'se ocupara en el registro de especialidades','2017-04-12 17:49:58');
/*!40000 ALTER TABLE `adm_lista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adm_materia`
--

DROP TABLE IF EXISTS `adm_materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_materia` (
  `id_materia` int(11) NOT NULL COMMENT 'llave primaria no incremental',
  `materia_nombre` varchar(150) NOT NULL COMMENT 'nombre o descripcion de la materia',
  `materia_unidades_valorativas` tinyint(4) DEFAULT '0' COMMENT 'numero de unidades valorativas de la materia, si aplicase',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL COMMENT 'usuario que crea el registro',
  PRIMARY KEY (`id_materia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_materia`
--

LOCK TABLES `adm_materia` WRITE;
/*!40000 ALTER TABLE `adm_materia` DISABLE KEYS */;
INSERT INTO `adm_materia` VALUES (1,'MATEMÁTICA I',5,'2017-03-01 21:37:33',1),(2,'MATEMÁTICA GENERAL',0,'2017-03-01 21:38:15',1),(3,'CIENCIAS NATURALES',8,'2017-03-01 21:38:40',1),(4,'CIENCIA SALUD Y MEDIO AMBIENTE',0,'2017-03-01 21:38:58',1),(5,'MATEMÁTICA',0,'2017-03-01 22:29:10',1);
/*!40000 ALTER TABLE `adm_materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adm_materia_detalle`
--

DROP TABLE IF EXISTS `adm_materia_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_materia_detalle` (
  `id_materia_detalle` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave primaria incremental',
  `id_materia` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_materia, indice',
  `id_annio_lectivo` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabal adm_anio_lectivo, indice',
  `id_docente` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_docente, indice',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL COMMENT 'usuario que crea el registro',
  PRIMARY KEY (`id_materia_detalle`),
  UNIQUE KEY `id_materia` (`id_materia`,`id_annio_lectivo`,`id_docente`),
  KEY `fk_materiadetalle_anniolectivo` (`id_annio_lectivo`),
  KEY `fk_materiadetalle_docente` (`id_docente`),
  CONSTRAINT `fk_materiadetalle_anniolectivo` FOREIGN KEY (`id_annio_lectivo`) REFERENCES `adm_annio_lectivo` (`id_annio_lectivo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_materiadetalle_docente` FOREIGN KEY (`id_docente`) REFERENCES `adm_docente` (`id_docente`) ON UPDATE CASCADE,
  CONSTRAINT `fk_materiadetalle_materia` FOREIGN KEY (`id_materia`) REFERENCES `adm_materia` (`id_materia`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_materia_detalle`
--

LOCK TABLES `adm_materia_detalle` WRITE;
/*!40000 ALTER TABLE `adm_materia_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `adm_materia_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adm_modulo`
--

DROP TABLE IF EXISTS `adm_modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_modulo` (
  `id_modulo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_modulo` varchar(100) NOT NULL,
  `modulo_descripcion` varchar(180) NOT NULL COMMENT 'descripcion del modulo',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_rol` int(11) NOT NULL COMMENT 'llave foranea apra relacionar con la tabla rol, indice',
  PRIMARY KEY (`id_modulo`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `fk_modulo_rol` FOREIGN KEY (`id_rol`) REFERENCES `adm_rol` (`id_rol`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_modulo`
--

LOCK TABLES `adm_modulo` WRITE;
/*!40000 ALTER TABLE `adm_modulo` DISABLE KEYS */;
INSERT INTO `adm_modulo` VALUES (1,'CATÁLOGOS','pertenece al rol administradores','2016-11-21 10:59:27',1),(2,'PROCESOS','pertenece al rol de docentes','2016-11-21 10:59:27',2),(3,'REPORTES','pertenece al rol de usuarios','2017-01-26 16:35:10',3),(4,'REPORTES','pertenece al rol de administradores','2017-01-26 16:35:10',1),(5,'REPORTES','pertenece al rol de docentes','2017-01-26 16:35:24',2),(6,'INSCRIPCIONES','pertenece al rol administradores','2017-03-06 15:02:17',1),(7,'INSCRIPCIONES','pertenece al rol DOCENTES','2017-03-14 11:06:35',2);
/*!40000 ALTER TABLE `adm_modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adm_modulo_opcion`
--

DROP TABLE IF EXISTS `adm_modulo_opcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_modulo_opcion` (
  `id_modulo_opcion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_opcion` varchar(250) NOT NULL,
  `nombre_controlador_opcion` char(100) DEFAULT NULL,
  `opcion_nivel` tinyint(4) NOT NULL COMMENT 'nivel de la opcion, 1 opcion del menu raiz, 2 opcion del submenu raiz 1,  3 opcion del submenu 2, etc..',
  `opcion_estado` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'estado de la opcion 1=activo 0=inactiva',
  `id_modulo` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_modulo, indice',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_modulo_opcion`),
  KEY `id_modulo` (`id_modulo`),
  CONSTRAINT `fk_moduloopcion_modulo` FOREIGN KEY (`id_modulo`) REFERENCES `adm_modulo` (`id_modulo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_modulo_opcion`
--

LOCK TABLES `adm_modulo_opcion` WRITE;
/*!40000 ALTER TABLE `adm_modulo_opcion` DISABLE KEYS */;
INSERT INTO `adm_modulo_opcion` VALUES (1,'Docentes/Usuarios','Usuarios/DocentesUsuarios/',1,1,1,'2016-11-21 11:00:49'),(2,'Modalidades/Cursos','Modalidades/AdministrarModalidades/',1,1,1,'2016-11-21 11:00:49'),(3,'Secciones','Secciones/AdministrarSecciones/',1,1,1,'2016-11-21 11:03:01'),(5,'Materias','Materias/AdministrarMaterias/',1,1,1,'2016-11-21 11:05:44'),(6,'Alumnos','Alumnos/Administrar/',1,1,1,'2016-11-21 11:05:44'),(7,'Períodos','Periodos/Administrar/',1,1,1,'2016-11-21 11:05:44'),(8,'Aranceles','Aranceles/AdministrarAranceles/',1,0,1,'2016-11-21 11:05:44'),(9,'Ver Usuarios','',2,1,1,'2017-01-26 16:59:01'),(10,'Agregar Usuarios','',2,1,1,'2017-01-26 16:59:01'),(11,'Editar Usuarios','',2,1,1,'2017-01-26 16:59:01'),(12,'Eliminar Usuarios','',2,1,1,'2017-01-26 16:59:01'),(13,'Ver Año','',2,1,1,'2017-01-26 17:04:47'),(14,'Agregar Año','',2,1,1,'2017-01-26 17:04:47'),(15,'Editar Año','',2,1,1,'2017-01-26 17:04:47'),(16,'Eliminar Año','',2,1,1,'2017-01-26 17:04:47'),(17,'Reporte Alumnos en mora','Reportesnotas/ReporteAlumnosEnMora/',1,1,4,'2017-01-27 14:48:05'),(18,'Reporte Secciones','',1,0,4,'2017-01-27 14:48:05'),(19,'Reporte Docentes','Reportesnotas/ReporteDocentes/',1,1,4,'2017-01-27 14:48:05'),(20,'Reporte Materias','',1,0,4,'2017-01-27 14:48:05'),(21,'Mi Perfil','',1,0,2,'2017-01-27 15:00:26'),(22,'Secciones','Secciones/SeccionesDocente/',1,1,2,'2017-01-27 15:00:26'),(24,'Inscribir Alumnos','Inscripciones/Administrar/',1,1,7,'2017-03-06 15:14:21'),(25,'Asignaciones Docentes','Usuarios/AdministrarAsignaciones/',1,1,6,'2017-03-07 09:03:49'),(27,'Notas','Materias/AdministrarNotas/',1,1,2,'2017-03-14 13:38:06'),(28,'Cuotas','Aranceles/Cuotas/',1,1,6,'2017-03-24 16:56:41'),(29,'Especialidades','Especialidades/AdministrarEspecialidades/',1,1,1,'2017-04-12 17:03:00'),(30,'Configuraciones Grales.','Inicio/ConfiguracionesGenerales/',1,1,1,'2017-04-11 17:17:41'),(31,'Reporte Notas (Sección, Materia, Año Lectivo)','Reportesnotas/ReporteNotas/',1,1,5,'2017-04-19 15:52:54'),(32,'Reporte Notas por Sección','Reportesnotas/ReporteNotasPorSeccion/',1,1,5,'2017-04-24 19:43:42'),(33,'Reporte Nómina de Alumnos','Reportesnotas/ReportesNominaAlumnos/',1,1,5,'2017-04-25 23:31:31'),(34,'Reporte Cumpleañeros','Reportesnotas/ReporteDocentesCumpleannieros/',1,1,4,'2017-04-28 22:16:54'),(35,'Reporte Cumpleañeros','Reportesnotas/ReporteAlumnosCumpleannieros/',1,1,5,'2017-04-29 18:25:57');
/*!40000 ALTER TABLE `adm_modulo_opcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adm_modulo_opcion_usuario`
--

DROP TABLE IF EXISTS `adm_modulo_opcion_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_modulo_opcion_usuario` (
  `id_opcion_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL COMMENT 'llave foranea pra relacionar la tabla adm_usuarios, indice',
  `id_modulo_opcion` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_modulos_opcion, indice',
  `puede_ver` bit(1) NOT NULL DEFAULT b'0' COMMENT 'indica si el usuario tiene permisos para visualizar o no, 1=true, 0=false',
  `puede_agregar` bit(1) NOT NULL DEFAULT b'0' COMMENT 'indica si el usuario tiene permisos para agregar informacion o no, 1=true, 0=false',
  `puede_editar` bit(1) NOT NULL DEFAULT b'0' COMMENT 'indica si el usuario tiene permisos para editar informacion o no, 1=true, 0=false',
  `puede_eliminar` bit(1) NOT NULL DEFAULT b'0' COMMENT 'indica si el usuario tiene permisos para eliminar informacion o no, 1=true, 0=false',
  PRIMARY KEY (`id_opcion_usuario`),
  UNIQUE KEY `id_usuario` (`id_usuario`,`id_modulo_opcion`),
  KEY `fk_moduloopcionusuario_opcionesmodulo` (`id_modulo_opcion`),
  CONSTRAINT `fk_moduloopcionusuario_opcionesmodulo` FOREIGN KEY (`id_modulo_opcion`) REFERENCES `adm_modulo_opcion` (`id_modulo_opcion`) ON UPDATE CASCADE,
  CONSTRAINT `fk_moduloopcionusuario_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `adm_usuario` (`id_usuario`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_modulo_opcion_usuario`
--

LOCK TABLES `adm_modulo_opcion_usuario` WRITE;
/*!40000 ALTER TABLE `adm_modulo_opcion_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `adm_modulo_opcion_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adm_municipio`
--

DROP TABLE IF EXISTS `adm_municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_municipio` (
  `id_municipio` smallint(6) NOT NULL,
  `municipio_nombre` varchar(150) NOT NULL COMMENT 'nombre o descripcion del municipio',
  `id_departamento` tinyint(4) NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_departamento, indice',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL COMMENT 'usuario que crea el registro',
  PRIMARY KEY (`id_municipio`),
  KEY `id_departamento` (`id_departamento`),
  CONSTRAINT `fk_municipio_departamento` FOREIGN KEY (`id_departamento`) REFERENCES `adm_departamento` (`id_departamento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_municipio`
--

LOCK TABLES `adm_municipio` WRITE;
/*!40000 ALTER TABLE `adm_municipio` DISABLE KEYS */;
INSERT INTO `adm_municipio` VALUES (1,'Ahuachapán',1,'2017-03-01 17:15:28',1),(2,'Jujutla',1,'2017-03-01 17:15:28',1),(3,'Atiquizaya',1,'2017-03-01 17:15:28',1),(4,'Concepción de Ataco',1,'2017-03-01 17:15:28',1),(5,'El Refugio',1,'2017-03-01 17:15:28',1),(6,'Guaymango',1,'2017-03-01 17:15:28',1),(7,'Apaneca',1,'2017-03-01 17:15:28',1),(8,'San Francisco Menéndez',1,'2017-03-01 17:15:28',1),(9,'San Lorenzo',1,'2017-03-01 17:15:28',1),(10,'San Pedro Puxtla',1,'2017-03-01 17:15:28',1),(11,'Tacuba',1,'2017-03-01 17:15:28',1),(12,'Turín',1,'2017-03-01 17:15:28',1),(13,'Cinquera',2,'2017-03-01 17:15:28',1),(14,'Villa Dolores',2,'2017-03-01 17:15:28',1),(15,'Guacotecti',2,'2017-03-01 17:15:28',1),(16,'Ilobasco',2,'2017-03-01 17:15:28',1),(17,'Jutiapa',2,'2017-03-01 17:15:28',1),(18,'San Isidro',2,'2017-03-01 17:15:28',1),(19,'Sensuntepeque',2,'2017-03-01 17:15:28',1),(20,'Ciudad de Tejutepeque',2,'2017-03-01 17:15:28',1),(21,'Victoria',2,'2017-03-01 17:15:28',1),(22,'Agua Caliente',3,'2017-03-01 17:15:28',1),(23,'Arcatao',3,'2017-03-01 17:15:28',1),(24,'Azacualpa',3,'2017-03-01 17:15:28',1),(25,'Chalatenango',3,'2017-03-01 17:15:28',1),(26,'Citalá',3,'2017-03-01 17:15:28',1),(27,'Comalapa',3,'2017-03-01 17:15:28',1),(28,'Concepción Quezaltepeque',3,'2017-03-01 17:15:28',1),(29,'Dulce Nombre de María',3,'2017-03-01 17:15:28',1),(30,'El Carrizal',3,'2017-03-01 17:15:28',1),(31,'El Paraíso',3,'2017-03-01 17:15:28',1),(32,'La Laguna',3,'2017-03-01 17:15:28',1),(33,'La Palma',3,'2017-03-01 17:15:28',1),(34,'La Reina',3,'2017-03-01 17:15:28',1),(35,'Las Vueltas',3,'2017-03-01 17:15:28',1),(36,'Nombre de Jesús',3,'2017-03-01 17:15:28',1),(37,'Nueva Concepción',3,'2017-03-01 17:15:28',1),(38,'Nueva Trinidad',3,'2017-03-01 17:15:28',1),(39,'Ojos de Agua',3,'2017-03-01 17:15:28',1),(40,'Potonico',3,'2017-03-01 17:15:28',1),(41,'San Antonio de la Cruz',3,'2017-03-01 17:15:28',1),(42,'San Antonio Los Ranchos',3,'2017-03-01 17:15:28',1),(43,'San Fernando',3,'2017-03-01 17:15:28',1),(44,'San Francisco Lempa',3,'2017-03-01 17:15:28',1),(45,'San Francisco Morazán',3,'2017-03-01 17:15:28',1),(46,'San Ignacio',3,'2017-03-01 17:15:28',1),(47,'San Isidro Labrador',3,'2017-03-01 17:15:28',1),(48,'San José Cancasque',3,'2017-03-01 17:15:28',1),(49,'San José Las Flores',3,'2017-03-01 17:15:28',1),(50,'San Luis del Carmen',3,'2017-03-01 17:15:28',1),(51,'San Miguel de Mercedes',3,'2017-03-01 17:15:28',1),(52,'San Rafael',3,'2017-03-01 17:15:28',1),(53,'Santa Rita',3,'2017-03-01 17:15:28',1),(54,'Tejutla',3,'2017-03-01 17:15:28',1),(55,'Candelaria',4,'2017-03-01 17:15:28',1),(56,'Cojutepeque',4,'2017-03-01 17:15:28',1),(57,'El Carmen',4,'2017-03-01 17:15:28',1),(58,'El Rosario',4,'2017-03-01 17:15:28',1),(59,'Monte San Juan',4,'2017-03-01 17:15:28',1),(60,'Oratorio de Concepción',4,'2017-03-01 17:15:28',1),(61,'San Bartolomé Perulapía',4,'2017-03-01 17:15:28',1),(62,'San Cristóbal',4,'2017-03-01 17:15:28',1),(63,'San José Guayabal',4,'2017-03-01 17:15:28',1),(64,'San Pedro Perulapán',4,'2017-03-01 17:15:28',1),(65,'San Rafael Cedros',4,'2017-03-01 17:15:28',1),(66,'San Ramón',4,'2017-03-01 17:15:28',1),(67,'Santa Cruz Analquito',4,'2017-03-01 17:15:28',1),(68,'Santa Cruz Michapa',4,'2017-03-01 17:15:28',1),(69,'Suchitoto',4,'2017-03-01 17:15:28',1),(70,'Tenancingo',4,'2017-03-01 17:15:28',1),(71,'Antiguo Cuscatlán',5,'2017-03-01 17:15:28',1),(72,'Chiltiupán',5,'2017-03-01 17:15:28',1),(73,'Ciudad Arce',5,'2017-03-01 17:15:28',1),(74,'Colón',5,'2017-03-01 17:15:28',1),(75,'Comasagua',5,'2017-03-01 17:15:28',1),(76,'Huizúcar',5,'2017-03-01 17:15:28',1),(77,'Jayaque',5,'2017-03-01 17:15:28',1),(78,'Jicalapa',5,'2017-03-01 17:15:28',1),(79,'La Libertad',5,'2017-03-01 17:15:28',1),(80,'Nueva San Salvador',5,'2017-03-01 17:15:28',1),(81,'Nuevo Cuscatlán',5,'2017-03-01 17:15:28',1),(82,'Opico',5,'2017-03-01 17:15:28',1),(83,'Quezaltepeque',5,'2017-03-01 17:15:28',1),(84,'Sacacoyo',5,'2017-03-01 17:15:28',1),(85,'San José Villanueva',5,'2017-03-01 17:15:28',1),(86,'San Matías',5,'2017-03-01 17:15:28',1),(87,'San Pablo Tacachico',5,'2017-03-01 17:15:28',1),(88,'Talnique',5,'2017-03-01 17:15:28',1),(89,'Tamanique',5,'2017-03-01 17:15:28',1),(90,'Teotepeque',5,'2017-03-01 17:15:28',1),(91,'Tepecoyo',5,'2017-03-01 17:15:28',1),(92,'Zaragoza',5,'2017-03-01 17:15:28',1),(93,'Cuyultitán',6,'2017-03-01 17:15:28',1),(94,'El Rosario',6,'2017-03-01 17:15:28',1),(95,'Jerusalén',6,'2017-03-01 17:15:28',1),(96,'Mercedes La Ceiba',6,'2017-03-01 17:15:28',1),(97,'Olocuilta',6,'2017-03-01 17:15:28',1),(98,'Paraíso de Osorio',6,'2017-03-01 17:15:28',1),(99,'San Antonio Masahuat',6,'2017-03-01 17:15:28',1),(100,'San Emigdio',6,'2017-03-01 17:15:28',1),(101,'San Francisco Chinameca',6,'2017-03-01 17:15:28',1),(102,'San Juan Nonualco',6,'2017-03-01 17:15:28',1),(103,'San Juan Talpa',6,'2017-03-01 17:15:28',1),(104,'San Juan Tepezontes',6,'2017-03-01 17:15:28',1),(105,'San Luis La Herradura',6,'2017-03-01 17:15:28',1),(106,'San Luis Talpa',6,'2017-03-01 17:15:28',1),(107,'San Miguel Tepezontes',6,'2017-03-01 17:15:28',1),(108,'San Pedro Masahuat',6,'2017-03-01 17:15:28',1),(109,'San Pedro Nonualco',6,'2017-03-01 17:15:28',1),(110,'San Rafael Obrajuelo',6,'2017-03-01 17:15:28',1),(111,'Santa María Ostuma',6,'2017-03-01 17:15:28',1),(112,'Santiago Nonualco',6,'2017-03-01 17:15:28',1),(113,'Tapalhuaca',6,'2017-03-01 17:15:28',1),(114,'Zacatecoluca',6,'2017-03-01 17:15:28',1),(115,'Anamorós',7,'2017-03-01 17:15:28',1),(116,'Bolívar',7,'2017-03-01 17:15:28',1),(117,'Concepción de Oriente',7,'2017-03-01 17:15:28',1),(118,'Conchagua',7,'2017-03-01 17:15:28',1),(119,'El Carmen',7,'2017-03-01 17:15:28',1),(120,'El Sauce',7,'2017-03-01 17:15:28',1),(121,'Intipucá',7,'2017-03-01 17:15:28',1),(122,'La Unión',7,'2017-03-01 17:15:28',1),(123,'Lislique',7,'2017-03-01 17:15:28',1),(124,'Meanguera del Golfo',7,'2017-03-01 17:15:28',1),(125,'Nueva Esparta',7,'2017-03-01 17:15:28',1),(126,'Pasaquina',7,'2017-03-01 17:15:28',1),(127,'Polorós',7,'2017-03-01 17:15:28',1),(128,'San Alejo',7,'2017-03-01 17:15:28',1),(129,'San José',7,'2017-03-01 17:15:28',1),(130,'Santa Rosa de Lima',7,'2017-03-01 17:15:28',1),(131,'Yayantique',7,'2017-03-01 17:15:28',1),(132,'Yucuayquín',7,'2017-03-01 17:15:28',1),(133,'Arambala',8,'2017-03-01 17:15:28',1),(134,'Cacaopera',8,'2017-03-01 17:15:28',1),(135,'Chilanga',8,'2017-03-01 17:15:28',1),(136,'Corinto',8,'2017-03-01 17:15:28',1),(137,'Delicias de Concepción',8,'2017-03-01 17:15:28',1),(138,'El Divisadero',8,'2017-03-01 17:15:28',1),(139,'El Rosario',8,'2017-03-01 17:15:28',1),(140,'Gualococti',8,'2017-03-01 17:15:28',1),(141,'Guatajiagua',8,'2017-03-01 17:15:28',1),(142,'Joateca',8,'2017-03-01 17:15:28',1),(143,'Jocoaitique',8,'2017-03-01 17:15:28',1),(144,'Jocoro',8,'2017-03-01 17:15:28',1),(145,'Lolotiquillo',8,'2017-03-01 17:15:28',1),(146,'Meanguera',8,'2017-03-01 17:15:28',1),(147,'Osicala',8,'2017-03-01 17:15:28',1),(148,'Perquín',8,'2017-03-01 17:15:28',1),(149,'San Carlos',8,'2017-03-01 17:15:28',1),(150,'San Fernando',8,'2017-03-01 17:15:28',1),(151,'San Francisco Gotera',8,'2017-03-01 17:15:28',1),(152,'San Isidro',8,'2017-03-01 17:15:28',1),(153,'San Simón',8,'2017-03-01 17:15:28',1),(154,'Sensembra',8,'2017-03-01 17:15:28',1),(155,'Sociedad',8,'2017-03-01 17:15:28',1),(156,'Torola',8,'2017-03-01 17:15:28',1),(157,'Yamabal',8,'2017-03-01 17:15:28',1),(158,'Yoloaiquín',8,'2017-03-01 17:15:28',1),(159,'Carolina',9,'2017-03-01 17:15:28',1),(160,'Chapeltique',9,'2017-03-01 17:15:28',1),(161,'Chinameca',9,'2017-03-01 17:15:28',1),(162,'Chirilagua',9,'2017-03-01 17:15:28',1),(163,'Ciudad Barrios',9,'2017-03-01 17:15:28',1),(164,'Comacarán',9,'2017-03-01 17:15:28',1),(165,'El Tránsito',9,'2017-03-01 17:15:28',1),(166,'Lolotique',9,'2017-03-01 17:15:28',1),(167,'Moncagua',9,'2017-03-01 17:15:28',1),(168,'Nueva Guadalupe',9,'2017-03-01 17:15:28',1),(169,'Nuevo Edén de San Juan',9,'2017-03-01 17:15:28',1),(170,'Quelepa',9,'2017-03-01 17:15:28',1),(171,'San Antonio',9,'2017-03-01 17:15:28',1),(172,'San Gerardo',9,'2017-03-01 17:15:28',1),(173,'San Jorge',9,'2017-03-01 17:15:28',1),(174,'San Luis de la Reina',9,'2017-03-01 17:15:28',1),(175,'San Miguel',9,'2017-03-01 17:15:28',1),(176,'San Rafael',9,'2017-03-01 17:15:28',1),(177,'Sesori',9,'2017-03-01 17:15:28',1),(178,'Uluazapa',9,'2017-03-01 17:15:28',1),(179,'Aguilares',10,'2017-03-01 17:15:28',1),(180,'Apopa',10,'2017-03-01 17:15:28',1),(181,'Ayutuxtepeque',10,'2017-03-01 17:15:28',1),(182,'Cuscatancingo',10,'2017-03-01 17:15:28',1),(183,'Delgado',10,'2017-03-01 17:15:28',1),(184,'El Paisnal',10,'2017-03-01 17:15:28',1),(185,'Guazapa',10,'2017-03-01 17:15:28',1),(186,'Ilopango',10,'2017-03-01 17:15:28',1),(187,'Mejicanos',10,'2017-03-01 17:15:28',1),(188,'Nejapa',10,'2017-03-01 17:15:28',1),(189,'Panchimalco',10,'2017-03-01 17:15:28',1),(190,'Rosario de Mora',10,'2017-03-01 17:15:28',1),(191,'San Marcos',10,'2017-03-01 17:15:28',1),(192,'San Martín',10,'2017-03-01 17:15:28',1),(193,'San Salvador',10,'2017-03-01 17:15:28',1),(194,'Santiago Texacuangos',10,'2017-03-01 17:15:28',1),(195,'Santo Tomás',10,'2017-03-01 17:15:28',1),(196,'Soyapango',10,'2017-03-01 17:15:28',1),(197,'Tonacatepeque',10,'2017-03-01 17:15:28',1),(198,'Apastepeque',11,'2017-03-01 17:15:28',1),(199,'Guadalupe',11,'2017-03-01 17:15:28',1),(200,'San Cayetano Istepeque',11,'2017-03-01 17:15:28',1),(201,'San Esteban Catarina',11,'2017-03-01 17:15:28',1),(202,'San Ildefonso',11,'2017-03-01 17:15:28',1),(203,'San Lorenzo',11,'2017-03-01 17:15:28',1),(204,'San Sebastián',11,'2017-03-01 17:15:28',1),(205,'Santa Clara',11,'2017-03-01 17:15:28',1),(206,'Santo Domingo',11,'2017-03-01 17:15:28',1),(207,'San Vicente',11,'2017-03-01 17:15:28',1),(208,'Tecoluca',11,'2017-03-01 17:15:28',1),(209,'Tepetitán',11,'2017-03-01 17:15:28',1),(210,'Verapaz',11,'2017-03-01 17:15:28',1),(211,'Candelaria de la Frontera',12,'2017-03-01 17:15:28',1),(212,'Chalchuapa',12,'2017-03-01 17:15:28',1),(213,'Coatepeque',12,'2017-03-01 17:15:28',1),(214,'El Congo',12,'2017-03-01 17:15:28',1),(215,'El Porvenir',12,'2017-03-01 17:15:28',1),(216,'Masahuat',12,'2017-03-01 17:15:28',1),(217,'Metapán',12,'2017-03-01 17:15:28',1),(218,'San Antonio Pajonal',12,'2017-03-01 17:15:28',1),(219,'San Sebastián Salitrillo',12,'2017-03-01 17:15:28',1),(220,'Santa Ana',12,'2017-03-01 17:15:28',1),(221,'Santa Rosa Guachipilín',12,'2017-03-01 17:15:28',1),(222,'Santiago de la Frontera',12,'2017-03-01 17:15:28',1),(223,'Texistepeque',12,'2017-03-01 17:15:28',1),(224,'Acajutla',13,'2017-03-01 17:15:28',1),(225,'Armenia',13,'2017-03-01 17:15:28',1),(226,'Caluco',13,'2017-03-01 17:15:28',1),(227,'Cuisnahuat',13,'2017-03-01 17:15:28',1),(228,'Izalco',13,'2017-03-01 17:15:28',1),(229,'Juayúa',13,'2017-03-01 17:15:28',1),(230,'Nahuizalco',13,'2017-03-01 17:15:28',1),(231,'Nahulingo',13,'2017-03-01 17:15:28',1),(232,'Salcoatitán',13,'2017-03-01 17:15:28',1),(233,'San Antonio del Monte',13,'2017-03-01 17:15:28',1),(234,'San Julián',13,'2017-03-01 17:15:28',1),(235,'Santa Catarina Masahuat',13,'2017-03-01 17:15:28',1),(236,'Santa Isabel Ishuatán',13,'2017-03-01 17:15:28',1),(237,'Santo Domingo',13,'2017-03-01 17:15:28',1),(238,'Sonsonate',13,'2017-03-01 17:15:28',1),(239,'Sonzacate',13,'2017-03-01 17:15:28',1),(240,'Alegría',14,'2017-03-01 17:15:28',1),(241,'Berlín',14,'2017-03-01 17:15:28',1),(242,'California',14,'2017-03-01 17:15:28',1),(243,'Concepción Batres',14,'2017-03-01 17:15:28',1),(244,'El Triunfo',14,'2017-03-01 17:15:28',1),(245,'Ereguayquín',14,'2017-03-01 17:15:28',1),(246,'Estanzuelas',14,'2017-03-01 17:15:28',1),(247,'Jiquilisco',14,'2017-03-01 17:15:28',1),(248,'Jucuapa',14,'2017-03-01 17:15:28',1),(249,'Jucuarán',14,'2017-03-01 17:15:28',1),(250,'Mercedes Umaña',14,'2017-03-01 17:15:28',1),(251,'Nueva Granada',14,'2017-03-01 17:15:28',1),(252,'Ozatlán',14,'2017-03-01 17:15:28',1),(253,'Puerto El Triunfo',14,'2017-03-01 17:15:28',1),(254,'San Agustín',14,'2017-03-01 17:15:28',1),(255,'San Buenaventura',14,'2017-03-01 17:15:28',1),(256,'San Dionisio',14,'2017-03-01 17:15:28',1),(257,'San Francisco Javier',14,'2017-03-01 17:15:28',1),(258,'Santa Elena',14,'2017-03-01 17:15:28',1),(259,'Santa María',14,'2017-03-01 17:15:28',1),(260,'Santiago de María',14,'2017-03-01 17:15:28',1),(261,'Tecapán',14,'2017-03-01 17:15:28',1),(262,'Usulután',14,'2017-03-01 17:15:28',1);
/*!40000 ALTER TABLE `adm_municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adm_rol`
--

DROP TABLE IF EXISTS `adm_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_rol` (
  `id_rol` int(11) NOT NULL COMMENT 'llave primaria no incremental',
  `rol_nombre` varchar(200) NOT NULL COMMENT 'nombre del roll',
  `rol_comentario` varchar(250) DEFAULT NULL COMMENT 'algun comentario para el rol',
  `rol_fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabla usuario, indice, usuario que creo el registro',
  PRIMARY KEY (`id_rol`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_rol`
--

LOCK TABLES `adm_rol` WRITE;
/*!40000 ALTER TABLE `adm_rol` DISABLE KEYS */;
INSERT INTO `adm_rol` VALUES (1,'ADMINISTRADORES','NINGUNO','2017-01-18 21:22:24',1),(2,'DONCENTES','NINGUNO','2017-01-26 22:30:40',1),(3,'USUARIOS','NINGUNO','2017-01-26 22:31:28',1);
/*!40000 ALTER TABLE `adm_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adm_usuario`
--

DROP TABLE IF EXISTS `adm_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL COMMENT 'usuario con el cual se logueara',
  `clave` varchar(100) NOT NULL COMMENT 'contraseña con el cual se logueara el usuario',
  `usuario_estado` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'estado del usaurio, true activo, false inactivo',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_rol` int(11) NOT NULL COMMENT 'llave foranera para relacionar con la tabla adm_rol, indice',
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `usuario` (`usuario`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`id_rol`) REFERENCES `adm_rol` (`id_rol`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_usuario`
--

LOCK TABLES `adm_usuario` WRITE;
/*!40000 ALTER TABLE `adm_usuario` DISABLE KEYS */;
INSERT INTO `adm_usuario` VALUES (1,'giancarlos1029@hotmail.com','1029',1,'2016-11-21 10:50:42',2),(2,'cisco1099@gmail.com','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-02-22 09:41:03',1),(3,'mari@gmail.com','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-02-22 09:48:17',2),(4,'jualia@hotmail.com','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-02-22 10:32:38',2),(5,'ustiel@hotmail.com','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-02-22 10:33:55',3),(6,'moto@gmail.com','a47c973cdb475cec9ad0d26e0891c43f',0,'2017-02-22 10:53:14',2),(7,'doromita@hotmail.com','a908fe24d47e1a411df45498b1459b26',1,'2017-02-22 11:10:05',2),(8,'karlos@gmail.com','a47c973cdb475cec9ad0d26e0891c43f',0,'2017-02-24 10:12:02',3),(9,'montiel@gmail.com','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-02-24 10:15:35',1),(10,'rufiel@gmil.com','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-02-24 10:16:35',2),(11,'krlo@gmail.com','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-02-24 10:19:04',2),(12,'juliana@gmail.com','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-02-24 10:21:24',2),(13,'mora@gmail.com','a47c973cdb475cec9ad0d26e0891c43f',0,'2017-02-24 10:31:08',1),(14,'donoban@gmail.com','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-02-24 10:51:00',2),(15,'delmonte@gmail.com','a47c973cdb475cec9ad0d26e0891c43f',0,'2017-02-24 10:52:47',2),(16,'katarina@gmail.com','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-02-24 10:53:43',1),(17,'prueba@gmail.com','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-02-24 14:20:38',1),(18,'eliza@gmail.com','a47c973cdb475cec9ad0d26e0891c43f',0,'2017-02-24 15:45:24',1),(19,'eustaquia@gmail.com','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-03-01 14:35:53',2),(20,'okok@gmail.com','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-03-01 14:37:26',2),(21,'jhil@gmail.com','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-03-01 14:40:00',3),(22,'adelina@gmil.com','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-03-08 16:29:13',2),(23,'prueba1@gmail.com','clave',1,'2017-03-29 21:14:29',1),(24,'luisa@gmail.com','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-03-29 22:09:08',2),(25,'luisah@gmail.com','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-03-29 22:10:39',2),(26,'luisac@gmail.com','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-03-29 22:11:51',2),(27,'sandra@gmail.com','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-03-30 20:29:12',2),(28,'dres@gmail.com','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-04-17 20:18:00',2),(29,'domitila@gmail.com','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-04-17 20:37:52',2),(30,'juan@gmail.com','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-05-02 16:19:46',2);
/*!40000 ALTER TABLE `adm_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_prueba`
--

DROP TABLE IF EXISTS `tbl_prueba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_prueba` (
  `id` int(11) NOT NULL,
  `valor` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_prueba`
--

LOCK TABLES `tbl_prueba` WRITE;
/*!40000 ALTER TABLE `tbl_prueba` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_prueba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_sisin'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `evento_EjectuarPACrearAnnioLectivo` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `evento_EjectuarPACrearAnnioLectivo` ON SCHEDULE EVERY 1 YEAR STARTS '2017-02-27 10:57:00' ON COMPLETION NOT PRESERVE ENABLE COMMENT 'Evento que ejecuta cada año el 31 de diciembre' DO begin
		  declare v_id_annio_lectivo int;
         select ifnull(max(id_annio_lectivo), 0) + 1 into v_id_annio_lectivo from adm_annio_lectivo;
		 insert into adm_annio_lectivo(id_annio_lectivo, annio, id_usuario)
         values (v_id_annio_lectivo, year(now()), 1); 
         
         -- actualizo el año anterior y lo pongo inactivo
         update adm_annio_lectivo set estado = 0 where annio = year(now()) - 1;
		 
	end */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `evento_GenerarCalendarioPago` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `evento_GenerarCalendarioPago` ON SCHEDULE EVERY 1 YEAR STARTS '2017-03-25 16:00:00' ON COMPLETION NOT PRESERVE ENABLE COMMENT 'evento que se ejecuta cada 1 de enero de cada año' DO BEGIN
	/*
		evento que se ejecuta cada 1 de enero de cada año ejecutando el PA para generar el calendario de pago para cada lumno registrado
    */
	CALL pa_GenerarCalendarioPago();
END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'db_sisin'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_TraerIdAnioLectivo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_TraerIdAnioLectivo`() RETURNS int(11)
BEGIN

/*
	la funcion devolvera el id del annio lectivo
    
*/


	DECLARE v_id_annio_lectivo INT;

	-- asigno a la variable v_annio el annio lectivo corresspondiente
	SELECT id_annio_lectivo
		INTO v_id_annio_lectivo FROM adm_annio_lectivo WHERE estado = 1 
			ORDER BY id_annio_lectivo DESC LIMIT 1; /*simpre me devolvera una fila*/
	return v_id_annio_lectivo;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_TraerIdPeriodoEnCurso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_TraerIdPeriodoEnCurso`() RETURNS int(11)
BEGIN
/*
	la funcion devolvera el id del period en curso activo actualmente
    - si la funccion devuelve null significa no hay periodos activos para el año en curso, hay que revisar
    
*/
DECLARE v_valor_devolver int;
DEClARE v_id_annio_lectivo int;
-- asigno a la variable v_id_annio_lectivo el id_annio_lectivo lectivo corresspondiente
select id_annio_lectivo
	into v_id_annio_lectivo from adm_annio_lectivo where estado = 1 order by id_annio_lectivo desc limit 1; /*simpre me devolvera una fila*/
	select pe.id_periodo into v_valor_devolver from acade_periodo pe
		inner join adm_annio_lectivo a on(a.id_annio_lectivo = pe.id_annio_lectivo)
        where a.estado = 1 and pe.periodo_estado = 1 and a.id_annio_lectivo = v_id_annio_lectivo order by pe.id_periodo desc limit 1;
return v_valor_devolver;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_VerSiAlumnoYaPagoCuota` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_VerSiAlumnoYaPagoCuota`(p_id_alumno int, p_calendario_mes int) RETURNS int(11)
BEGIN

/*
	la procedimiento devolvera un 0 o 1, si devuelve un 1 significa que ya pago la insecripcion
    de lo contrario no
    
*/

DECLARE v_encontrado INT;
DECLARE v_annio INT;

-- asigno a la variable v_annio el annio lectivo corresspondiente
SELECT annio
	INTO v_annio FROM adm_annio_lectivo WHERE estado = 1 ORDER BY id_annio_lectivo DESC LIMIT 1; /*simpre me devolvera una fila*/

	SELECT count(*) INTO v_encontrado FROM acade_calendario_pago 
     where id_alumno = p_id_alumno and calendario_annio = v_annio and calendario_mes = p_calendario_mes and calendario_cuota_pagada = 1 LIMIT 1;
     /*
		si el valor de la variable v_encontrado es 1 ya pago la cuota de inscripcion
	*/
    if v_encontrado = 1 then
		return 1;
	else	
		return 0;
	end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_VerSiDocenteIngresoNotasAmateria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_VerSiDocenteIngresoNotasAmateria`(p_id_docente int, p_id_materia int, p_id_curso int) RETURNS tinyint(1)
BEGIN
	/*
	  la funcion devolvera un false (0)  el docente no a ha asigando notas a su materia asiganda
      y podra quitar la materia al docente, de lo contrario no podrá desasignarse la materia
	*/
	DECLARE v_cantidad_notas int;
	DEClARE v_id_annio_lectivo int;
	-- asigno a la variable v_id_annio_lectivo el id_annio_lectivo lectivo corresspondiente
	select id_annio_lectivo
		into v_id_annio_lectivo from adm_annio_lectivo where estado = 1 order by id_annio_lectivo desc limit 1; /*simpre me devolvera una fila*/
	-- tarigo el la cuenta de las notas del año lectivo actual
	select count(*) into v_cantidad_notas 
	from acade_periodo_nota_detalle pnd
	inner join adm_curso_detalle cd
		on(cd.id_materia = pnd.id_materia)
	inner join adm_alumno_detalle ad
		on(ad.id_curso = cd.id_curso and ad.id_alumno = pnd.id_alumno)
	where pnd.id_materia = p_id_materia  and cd.id_docente = p_id_docente and cd.id_curso = p_id_curso and pnd.id_annio_lectivo = v_id_annio_lectivo;
	if v_cantidad_notas = 0 then
		return 0;
	else
        return 1;
	end If;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GenerarCodigoAlumno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GenerarCodigoAlumno`() RETURNS varchar(6) CHARSET utf8
BEGIN
/*si la funcion retorno un NULL sigunifica que ya no hay codigos disponibles*/
DECLARE v_maximo_codigo int;
DECLARE v_valor_devolver VARCHAR(6);
DEClARE v_annio_lectivo int;
-- asigno a la variable v_annio_lectivo el año lectivo corresspondiente
select substr(annio, 3,2) /*desde la poscion 3 quiero 2 posiciones*/ 
	into v_annio_lectivo from adm_annio_lectivo where estado = 1   order by annio desc limit 1;
-- tarigo el maximo codigo mas uno asignando a la variable v_maximo_codigo
select  max(substring(alumno_codigo, 1, 4)) +1 into v_maximo_codigo from adm_alumno;
 select 
	case 
		when v_maximo_codigo <= 9 then concat('000', cast(v_maximo_codigo as char), v_annio_lectivo)
        when v_maximo_codigo <= 99 then concat('00', cast(v_maximo_codigo as char), v_annio_lectivo)
        when v_maximo_codigo <= 999 then concat('0', cast(v_maximo_codigo as char), v_annio_lectivo)
		else null 
        end into v_valor_devolver from adm_alumno LIMIT 1;
return v_valor_devolver;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `VerifcarAlumnoSiTieneNotasLectivo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `VerifcarAlumnoSiTieneNotasLectivo`(p_id_alumno int) RETURNS tinyint(1)
BEGIN
/*si la funcion retorno un true(1) sigunifica que el alumno puede desmatricurlarse de la seccion 
elegida, de lo contrario es que ya tiene notas del año lectivo
actual y no puede quitarse se la seccion inscrito(no se puede desmatricular)*/
DECLARE v_cantidad_notas int;
DEClARE v_id_annio_lectivo int;
-- asigno a la variable v_id_annio_lectivo el id_annio_lectivo lectivo corresspondiente
select id_annio_lectivo
	into v_id_annio_lectivo from adm_annio_lectivo where estado = 1 order by annio desc limit 1; /*simpre me devolvera una fila*/
-- tarigo el la cuenta de las notas del año lectivo actual
select count(*) into v_cantidad_notas 
from acade_periodo_nota_detalle where id_alumno = p_id_alumno and id_annio_lectivo = v_id_annio_lectivo ;
	if v_cantidad_notas = 0 then
		return true;
	else
        return false;
	end If;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_ActualizarCuotasAlumno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_ActualizarCuotasAlumno`(p_id_alumno int, p_id_calendario_pago int)
begin
	
	 declare exit handler for sqlexception
		begin
         -- hubieron errores
         rollback;
		end;
		
        -- inicio la transaccion
        start transaction;
				/*
					actualizo las cuotas correspondientes
				*/
                update acade_calendario_pago set calendario_cuota_pagada = 1, calendario_fecha_pago = DATE_FORMAT(NOW(),'%Y-%m-%d')
					where id_calendario_pago <= p_id_calendario_pago and id_alumno = p_id_alumno and calendario_cuota_pagada = 0;

        commit;
     
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_AgregarDocenteUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_AgregarDocenteUsuario`(
`p_usuario` varchar(50),
`p_clave` varchar(100),
`p_id_rol` int(11),
 `p_docente_nombre` varchar(150),
  `p_docente_apellido` varchar(150),
  `p_docente_direccion` longtext,
  p_docente_fecha_nacimiento date,
  `p_id_municipio` smallint(6),
  `p_id_especialidad` smallint(6)
)
begin
	/*
		procedimiento que inserta un usuario y docente
    */
    
	declare exit handler for sqlexception
		begin
			-- hubieron errores
			rollback;
			select 'NO' AS MENSAJE;
			resignal; -- muestra el error que genero la exepcion
         end;
		
        -- inicio la transaccion
       start transaction;
			-- variable de sesion para traer el siguiete primary key y enviarlas el PA que trae el sigueitne id
			SET @tabla = 'adm_usuario';
			SET @primary_key = 'id_usuario';
			SET @resultadoID = NULL;
            call pa_TraerSiguietneId(@tabla, @primary_key, @resultadoID);
		    
		
			-- inserto en la tabla adm_usuario
			insert into adm_usuario(id_usuario, usuario, clave, id_rol)
				values((SELECT @resultadoID), p_usuario, p_clave, p_id_rol);
           -- inserto en la tabla adm_docente
           insert into adm_docente(id_docente, docente_nombre, docente_apellido, docente_direccion, docente_fecha_nacimiento, id_usuario, id_municipio, id_especialidad)
			values((SELECT @resultadoID), p_docente_nombre, p_docente_apellido, p_docente_direccion, 
				p_docente_fecha_nacimiento, (SELECT @resultadoID), p_id_municipio, p_id_especialidad);
            select 'OK' AS MENSAJE;
      commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_AgregarModalidad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_AgregarModalidad`(
p_modalidad_nombre varchar(200),
p_modalidad_duracion tinyint(4),
p_modalidad_comentario varchar(400),
p_id_usuario int(11)
)
begin
	/*
		PA que inserta modalidades
    */
    
	declare exit handler for sqlexception
		begin
			-- hubieron errores
			rollback;
			select 'NO' AS MENSAJE;
			-- SHOW ERRORS LIMIT 1;
         end;
		
        -- inicio la transaccion
       start transaction;
			-- variable de sesion para traer el siguiete primary key y enviarlas el PA que trae el sigueitne id
			SET @tabla = 'acade_modalidad';
			SET @primary_key = 'id_modalidad';
			SET @resultadoID = NULL;
            call pa_TraerSiguietneId(@tabla, @primary_key, @resultadoID);
            -- inserto la modalidad
            insert into acade_modalidad(id_modalidad, modalidad_nombre, modalidad_duracion, modalidad_comentario, id_usuario)
				values((select @resultadoID), p_modalidad_nombre, p_modalidad_duracion, p_modalidad_comentario, p_id_usuario);
			select 'OK' AS MENSAJE;
				
	   commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_alumno_AgregarAlumno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_alumno_AgregarAlumno`(
p_alumno_codigo varchar(6), 
p_alumno_nombre varchar(175),
p_alumno_apellido varchar(175), 
p_alumno_direccion longtext,
p_alumno_telefonos varchar(100), 
p_alumno_fecha_nacimiento date,
p_alumno_nombre_foto varchar(80),
p_alumno_correo varchar(90),
p_id_lista int(11), 
p_id_municipio smallint(6), 
p_id_usuario int,
p_dato_nombres_padre varchar(200),
p_dato_nombres_madre varchar(200),
p_dato_telefonos_contacto varchar(80),
p_dato_correo varchar(100),
p_dato_lugar_trabajo longtext,
p_dato_nombres_responsable varchar(200), 
p_dato_telefono_responsable varchar(80),
p_dato_correo_responsable varchar(80),
p_dato_lugar_trabajo_responsable longtext 
)
begin
	/*
		PA que inserta un alumno
	*/
	-- variable de control de transaccion
    declare exit handler for sqlexception
		begin
			-- hubieron errores
            select 'NO' as MENSAJE;
            rollback;
            resignal; -- MUESTRA EL QUE SE GENERO
		END;
	-- INICIO TRANSACCION
    start transaction;
		-- variables de sesion para traer el proximo id de la tabla respectiva
        SET @tabla = 'adm_alumno';
			SET @primary_key = 'id_alumno';
			SET @resultadoID = NULL;
            call pa_TraerSiguietneId(@tabla, @primary_key, @resultadoID);
		-- inserto en la tabla adm_alumno
        insert into adm_alumno(id_alumno, alumno_codigo, alumno_nombre, alumno_apellido, alumno_direccion, alumno_telefonos, 
			alumno_fecha_nacimiento, alumno_nombre_foto, alumno_correo, id_lista, id_municipio, id_usuario)
			values((select @resultadoID), p_alumno_codigo, p_alumno_nombre, p_alumno_apellido, p_alumno_direccion, p_alumno_telefonos, 
			p_alumno_fecha_nacimiento, p_alumno_nombre_foto, p_alumno_correo, p_id_lista, p_id_municipio, p_id_usuario);
		-- inserto en la tabla acade_alumno_dato
        insert into acade_alumno_dato(dato_nombres_padre, dato_nombres_madre, dato_telefonos_contacto, dato_correo, dato_lugar_trabajo,
			dato_nombres_responsable, dato_telefono_responsable, dato_correo_responsable, dato_lugar_trabajo_responsable, id_alumno, id_usuario)
            values(p_dato_nombres_padre, p_dato_nombres_madre, p_dato_telefonos_contacto, p_dato_correo, p_dato_lugar_trabajo,
			p_dato_nombres_responsable, p_dato_telefono_responsable, p_dato_correo_responsable, p_dato_lugar_trabajo_responsable, 
            (select @resultadoID), p_id_usuario);
            
			/*
				invoco al PA que genera el calendario de pago
			*/
            call pa_GenerarCalendarioPagoPorAlumno((select @resultadoID), DATE_FORMAT(NOW(),'%Y-%m-%d'), p_id_usuario);
            
            
		select 'OK' as MENSAJE;
        
    COMMIT;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_alumno_ModificarAlumno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_alumno_ModificarAlumno`(
p_id_alumno int,
p_alumno_nombre varchar(175),
p_alumno_apellido varchar(175), 
p_alumno_direccion longtext,
p_alumno_telefonos varchar(100), 
p_alumno_fecha_nacimiento date,
p_alumno_nombre_foto varchar(80),
p_alumno_correo varchar(90),
p_id_lista int(11), 
p_id_municipio smallint(6), 
p_dato_nombres_padre varchar(200),
p_dato_nombres_madre varchar(200),
p_dato_telefonos_contacto varchar(80),
p_dato_correo varchar(100),
p_dato_lugar_trabajo longtext,
p_dato_nombres_responsable varchar(200), 
p_dato_telefono_responsable varchar(80),
p_dato_correo_responsable varchar(80),
p_dato_lugar_trabajo_responsable longtext 
)
begin
	/*
		PA que modifica un alumno
	*/
	-- variable de control de transaccion
    declare exit handler for sqlexception
		begin
			-- hubieron errores
            select 'NO' as MENSAJE;
            rollback;
            resignal; -- MUESTRA EL QUE SE GENERO
		END;
	-- INICIO TRANSACCION
    start transaction;
		
		-- actualizo en la tabla adm_alumno
        update adm_alumno set alumno_nombre = p_alumno_nombre, alumno_apellido = p_alumno_apellido, alumno_direccion = p_alumno_direccion,
			alumno_telefonos = p_alumno_telefonos, alumno_fecha_nacimiento = p_alumno_fecha_nacimiento, alumno_nombre_foto = p_alumno_nombre_foto,
            alumno_correo = p_alumno_correo, id_lista = p_id_lista, id_municipio = p_id_municipio
		where id_alumno = p_id_alumno;
			
		-- actualiza en la tabla acade_alumno_dato
        update acade_alumno_dato set dato_nombres_padre = p_dato_nombres_padre, dato_nombres_madre = p_dato_nombres_madre, 
			dato_telefonos_contacto = p_dato_telefonos_contacto, dato_correo = p_dato_correo, dato_lugar_trabajo = p_dato_lugar_trabajo,
			dato_nombres_responsable = p_dato_nombres_responsable, dato_telefono_responsable = p_dato_telefono_responsable, 
            dato_correo_responsable = p_dato_correo_responsable, dato_lugar_trabajo_responsable = p_dato_lugar_trabajo_responsable
		where id_alumno = p_id_alumno;
          
		select 'OK' as MENSAJE;
        
    COMMIT;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_curso_AgregarSeccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_curso_AgregarSeccion`(
p_id_modalidad int,
p_curso_nivel char(4),
p_curso_identificador char(1),
p_curso_turno varchar(15),
p_id_annio_lectivo int(11), 
p_id_usuario int
)
begin
	/*
		PA que inserta una seccion
	*/
    -- variable de control de transaccion
    declare exit handler for sqlexception
		begin
			-- hubieron errores
            rollback;
             SELECT 'NO' AS MENSAJE;
            RESIGNAL; -- muestar el error generado
           
		end;
	-- incicio transaccion
    start transaction;
		-- variable de sesion para traer el siguiete primary key y enviarlas el PA que trae el sigueitne id
			SET @tabla = 'adm_curso';
			SET @primary_key = 'id_curso';
			SET @resultadoID = NULL;
            call pa_TraerSiguietneId(@tabla, @primary_key, @resultadoID);
			insert into adm_curso(id_curso, id_modalidad, curso_nivel, curso_identificador, curso_turno, id_annio_lectivo, id_usuario)
				values((select @resultadoID), p_id_modalidad, p_curso_nivel, p_curso_identificador, p_curso_turno, p_id_annio_lectivo, p_id_usuario);
			select 'OK' AS MENSAJE;
	COMMIT;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_curso_ModificarSeccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_curso_ModificarSeccion`(
p_id_curso int,
p_id_modalidad int,
p_curso_nivel char(4),
p_curso_identificador char(1),
p_curso_turno varchar(15)
)
begin
	-- variable de control de trnasaccion
    declare exit handler for sqlexception
		begin
			-- hubieron errores
            select 'NO' as MENSAJE;
            rollback;
            resignal; -- muestra el error generado
		end;
	-- empiesa transaccion
    start transaction;
		update adm_curso set id_modalidad = p_id_modalidad, curso_nivel = p_curso_nivel, curso_identificador = p_curso_identificador,
			curso_turno = p_curso_turno
			where id_curso = p_id_curso;
		select 'OK' AS MENSAJE;
    commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_curso_TraerSecciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_curso_TraerSecciones`()
begin
	
	select c.id_curso, c.id_modalidad, c.curso_nivel, c.curso_identificador, c.fecha_creacion, m.modalidad_nombre, c.curso_turno
					from adm_curso c
					inner join acade_modalidad m
					on(c.id_modalidad = m.id_modalidad)
					INNER JOIN adm_annio_lectivo an
					ON(an.id_annio_lectivo = c.id_annio_lectivo)
					WHERE c.curso_estado = 1 AND an.id_annio_lectivo = (select fn_TraerIdAnioLectivo()) order by c.curso_nivel, m.id_modalidad;
			
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_departamento_TaerDepartamentos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_departamento_TaerDepartamentos`()
begin
	select id_departamento, departamento_nombre from adm_departamento;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_detalle_orientadorInsertarOrientador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_detalle_orientadorInsertarOrientador`(p_id_docente int, p_id_curso int, p_id_usuario int)
begin
	/*
		PA que inserte los docentes orientadores de cuales quiera y cuantas quiera de secciones
	*/
    -- varible para controlar la tranasccion
    declare exit handler for sqlexception
		begin
			-- hubieron errores
            select 'NO' AS MENSAJE;
            ROLLBACK;
            RESIGNAL; -- MUESTRA EL ERROR QUE PROVOCO LA EXECEPCION
        end;
	-- inicio transaccion
    start transaction;
    		-- select * from tbl_errro;
		insert into acade_detalle_orientador(id_docente, id_curso, id_annio_lectivo, id_usuario)
			values(p_id_docente, p_id_curso, (select fn_TraerIdAnioLectivo()) , p_id_usuario);
		select 'OK' as MENSAJE;
	commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_detelle_orientador_EliminarDocenteOrientador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_detelle_orientador_EliminarDocenteOrientador`(p_id_docente int, p_id_curso int)
begin
	/*
		PA que se ejecutara cada para eliminar un docente de orientador
        no se podra quitar un docente orientador si el docente ya ha asignado notas a esa seccion
	*/
    DECLARE v_cantidad_notas int;
     
	-- inicio transaccion
	select count(*) into v_cantidad_notas
	from acade_periodo_nota_detalle pnd
	inner join adm_curso_detalle cd
		on(cd.id_materia = pnd.id_materia)
	inner join adm_alumno_detalle ad
		on(ad.id_curso = cd.id_curso and ad.id_alumno = pnd.id_alumno)
	where /*pnd.id_materia = 1  and*/ cd.id_docente = p_id_docente and cd.id_curso = p_id_curso
		and pnd.id_annio_lectivo = (select fn_TraerIdAnioLectivo());

		if v_cantidad_notas = 0 then
			
			delete from acade_detalle_orientador where id_docente = p_id_docente and id_curso = p_id_curso;
            select  'OK' AS MENSAJE;
		else
			select  'NO' AS MENSAJE;
		end if;
	
	
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_docente_TraerDocenteUsuarioPorID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_docente_TraerDocenteUsuarioPorID`(p_id_docente int)
begin
	SELECT d.id_docente, d.docente_nombre, d.docente_apellido, d.docente_direccion, d.docente_fecha_nacimiento, d.fecha_creacion,
						u.usuario, r.rol_nombre, u.id_rol, depto.id_departamento, depto.departamento_nombre,
                        d.id_municipio, muni.municipio_nombre, espe.id_especialidad,
                        espe.especialidad_nombre
						from adm_docente d 
						inner join adm_usuario u
						on(d.id_usuario = u.id_usuario)
						inner join adm_rol r
						on(r.id_rol = u.id_rol)
                        inner join adm_municipio muni on(muni.id_municipio = d.id_municipio)
                        inner join adm_departamento depto on(depto.id_departamento = muni.id_departamento)
                        inner join acade_especialidad espe on(espe.id_especialidad = d.id_especialidad)
						where d.id_docente=p_id_docente;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_EliminarDocenteUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_EliminarDocenteUsuario`(p_id_docente int)
begin
	/*
		procedimiento que elimina un usuario realmente solo lo pone inactivo
    */
    
	declare exit handler for sqlexception
		begin
			-- hubieron errores
			rollback;
			select 'NO' AS MENSAJE;
			-- SHOW ERRORS LIMIT 1;
         end;
		
        -- inicio la transaccion
       start transaction;
		
           -- actualizo en la tabla adm_docente
          update adm_usuario u 
				inner join adm_docente d on(u.id_usuario = d.id_usuario)
				set u.usuario_estado = false 
			where d.id_docente = p_id_docente; 
		select 'OK' AS MENSAJE;
      commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_EliminarModalidad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_EliminarModalidad`(p_id_modalidad int)
begin
	/*
		PA que pone a estado inactivo la modalidad
    */
    -- variable de control de transacciones
    declare exit handler for sqlexception
		begin
			-- hubieron errores
            rollback;
            select 'NO' as MENSAJE;
        end;
        
	-- inicio transaccion
    start transaction;
		update acade_modalidad set modalidad_estado = 0 where id_modalidad =p_id_modalidad;
        select 'OK' as MENSAJE;
	commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_especialidad_TraerEspecialidades` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_especialidad_TraerEspecialidades`()
begin
	/*
		PA que trae todas las especialidades activas
	*/
    select es.id_especialidad, concat(lis.lista_valor, ' ', es.especialidad_nombre) as ESPECIALIDAD,
     es.fecha_creacion
    from acade_especialidad es 
		inner join adm_lista lis on(lis.id_lista = es.id_lista)
	where es.especialidad_estado = 1 order by es.id_especialidad desc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_GenerarCalendarioPago` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_GenerarCalendarioPago`()
BEGIN
	/*
		PA que se invocara desde un Evente MySQL que no recibira parametros
        este se ejecutara cada año el 1 de enero para crear el calendario respectivo
        para cada alumno sin insertar la inscripcion
	*/

	 declare v_id_alumno int; -- variable para el recorrido del cursor
	 DECLARE v_id_annio_lectivo INT;
	 DECLARE v_annio_lectivo INT;
	 DECLARE meses INT;
	 DECLARE v_el_nuevo_mes VARCHAR(3);
	 -- Variable para controlar el fin del bucle del cursor
	 DECLARE fin INTEGER DEFAULT 0;
	/*
		cursor que me trae todos los alumnos
		que en la tabla acade_calendario_pago no se haya creado el calendario para el año lectivo en curso
		estos por si ya alumnos pagaron cuotras por adelantados y se tuvo que generar un calendario fortuito
		con el PA pa_GenerarCalendarioPagoPorAlumnoFortuito
	*/
	DECLARE cursor_alumnos CURSOR FOR
		select id_alumno from adm_alumno where alumno_estado = 1
				and id_alumno not in(select id_alumno from acade_calendario_pago where calendario_annio = v_annio_lectivo);
	-- Condición de salida
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin=1;

	 declare exit handler for sqlexception
		begin
         -- hubieron errores  
         rollback;
         select 'NO' as MENSAJE;
         resignal; -- muestra el mensaje de error si es que hubiese
		end;
		
        -- inicio la transaccion
        start transaction;
			-- asigno a la variable v_id_annio_lectivo el id_annio_lectivo del año lectivo corresspondiente
			SELECT id_annio_lectivo
				INTO v_id_annio_lectivo FROM adm_annio_lectivo WHERE estado = 1 ORDER BY id_annio_lectivo DESC LIMIT 1; /*simpre me devolvera una fila*/

			SELECT annio
				INTO v_annio_lectivo FROM adm_annio_lectivo WHERE estado = 1 ORDER BY id_annio_lectivo DESC LIMIT 1; /*simpre me devolvera una fila*/

			/*
				abro el cursor y lo recorro, si da erro que se salga controlado con la variable fin
			*/
			OPEN cursor_alumnos;
			  recorrer_cursor: LOOP
				FETCH cursor_alumnos INTO v_id_alumno;
				IF fin = 1 THEN
				   LEAVE recorrer_cursor;
				END IF;
				-- inserto la inscripcion
				
				INSERT INTO acade_calendario_pago(calendario_mes, calendario_annio, calendario_fecha_mes_cuota,
							id_usuario, id_annio_lectivo, id_alumno)
							VALUES(30, v_annio_lectivo, CONCAT(v_annio_lectivo, '-01-01' ), /*simpre sera enero*/
							1, v_id_annio_lectivo, v_id_alumno);

				SET meses = 1; -- 1 porque seimpre se ejecutara en enero
					WHILE meses<= 12 DO
						IF(meses <= 9) THEN
							SET v_el_nuevo_mes = '0'+meses;
						ELSE
							SET v_el_nuevo_mes = meses;
						END IF;
						INSERT INTO acade_calendario_pago(calendario_mes, calendario_annio, calendario_fecha_mes_cuota,
							id_usuario, id_annio_lectivo, id_alumno)
							VALUES(meses, v_annio_lectivo, CONCAT(v_annio_lectivo, '-',  v_el_nuevo_mes, '-', '01' ),
							1, v_id_annio_lectivo, v_id_alumno);
					  SET meses = meses + 1;
					END WHILE;

				-- le sumo un mes a la fecha_mes_cuota y luego le resto un día para que me de la última fecha de pagao
				UPDATE acade_calendario_pago SET calendario_fecha_mes_cuota =  ADDDATE(calendario_fecha_mes_cuota, INTERVAL 1 MONTH) 
					WHERE calendario_annio = v_annio_lectivo and id_alumno =v_id_alumno;
				UPDATE acade_calendario_pago SET calendario_fecha_mes_cuota =  ADDDATE(calendario_fecha_mes_cuota, INTERVAL -1 DAY) 
					WHERE calendario_annio = v_annio_lectivo and id_alumno =v_id_alumno;
			 END LOOP recorrer_cursor;
              select 'OK' as MENSAJE;
		commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_GenerarCalendarioPagoPorAlumno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_GenerarCalendarioPagoPorAlumno`(p_id_alumno INT, p_fecha_ingreso date, p_id_usuario int)
BEGIN
	/*
		PA que se ejecutara cuando se ejecute el PA pa_alumno_AgregarAlumno, es decir, cada vez que se registre un alumno
	*/
	 DECLARE v_id_annio_lectivo INT;
	 DECLARE v_annio_lectivo INT;
	 DECLARE meses INT;
	 DECLARE v_el_nuevo_mes VARCHAR(3);
     -- variable para controlar la transaccion
     declare exit handler for sqlexception
		begin
			rollback; -- hubieron errores
            select 'NO' as MENSAJE;
			resignal; -- mostrara el mensaje de error
		end;
        
	-- inicio la transaccion
    start transaction;
	
	-- asigno a la variable v_id_annio_lectivo el id_annio_lectivo lectivo corresspondiente
	SELECT id_annio_lectivo
		INTO v_id_annio_lectivo FROM adm_annio_lectivo WHERE estado = 1 ORDER BY id_annio_lectivo DESC LIMIT 1; /*simpre me devolvera una fila*/

	SELECT annio
		INTO v_annio_lectivo FROM adm_annio_lectivo WHERE estado = 1 ORDER BY id_annio_lectivo DESC LIMIT 1; /*simpre me devolvera una fila*/

	-- inserto la inscripcion
	
	INSERT INTO acade_calendario_pago(calendario_mes, calendario_annio, calendario_fecha_mes_cuota,
				id_usuario, id_annio_lectivo, id_alumno)
				VALUES(30, v_annio_lectivo, CONCAT(v_annio_lectivo, '-',  month(p_fecha_ingreso), '-', '01' ),
				p_id_usuario, v_id_annio_lectivo, p_id_alumno);

	SET meses = month(p_fecha_ingreso);
	    WHILE meses<= 12 DO
			IF(meses <= 9) THEN
				SET v_el_nuevo_mes = '0'+meses;
			ELSE
				SET v_el_nuevo_mes = meses;
			END IF;
			INSERT INTO acade_calendario_pago(calendario_mes, calendario_annio, calendario_fecha_mes_cuota,
				id_usuario, id_annio_lectivo, id_alumno)
				VALUES(meses, v_annio_lectivo, CONCAT(v_annio_lectivo, '-',  v_el_nuevo_mes, '-', '01' ),
				p_id_usuario, v_id_annio_lectivo, p_id_alumno);
	      SET meses = meses + 1;
	    END WHILE;

	-- le sumo un mes a la fecha_mes_cuota y luego le resto un día para que me de la última fecha de pagao
	UPDATE acade_calendario_pago SET calendario_fecha_mes_cuota =  ADDDATE(calendario_fecha_mes_cuota, INTERVAL 1 MONTH) 
		WHERE calendario_annio = v_annio_lectivo and id_alumno =p_id_alumno;
	UPDATE acade_calendario_pago SET calendario_fecha_mes_cuota =  ADDDATE(calendario_fecha_mes_cuota, INTERVAL -1 DAY) 
		WHERE calendario_annio = v_annio_lectivo and id_alumno =p_id_alumno;
	
    select 'OK' as MENSAJE;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_GenerarCalendarioPagoPorAlumnoFortuito` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_GenerarCalendarioPagoPorAlumnoFortuito`(p_id_alumno INT, p_fecha_ingreso date, p_annio_lectivo_generar int,
 p_id_modalidad int, p_id_usuario int)
BEGIN
/*
proceimiento que se ejecutara manualmente por un dba para que genere un plan de calendario
extendido, es decir si el alumno cancelara todos los años respectivos a sus estudios
*/
	 DECLARE v_id_annio_lectivo INT;
	 DECLARE meses INT;
	 DECLARE v_el_nuevo_mes VARCHAR(3);
	 DECLARE v_modalidad_duracion int;
     DECLARE v_cantidad_annios_generados int;
	 declare exit handler for sqlexception
		begin
         -- hubieron errores
         rollback;
         SELECT 'NO' AS MENSAJE;
         resignal; -- MUSTRA EL MENSAJE DE ERROR SI HUBIESE
		end;
		
        -- inicio la transaccion
        start transaction;
	/*
		traigo la duracion de la modalidad para compararla con los años creados en el calendario 
		asi si la modadlidad dura 3 año y se encuntran ya esos tres años que ya no permita
		generar mas plan de pagos porque no puede pagarse lo que ya no se estudia
	*/
	select modalidad_duracion into v_modalidad_duracion from acade_modalidad where id_modalidad = p_id_modalidad;
	/*
		traigo la cantidad de años que dura la modadalidad del alumno
		y compararla con la v_modalidad_duracion
	*/
	select count(*) into v_cantidad_annios_generados from
		( 
		select distinct calendario_annio from acade_calendario_pago where id_alumno = p_id_alumno
		) as resultado;
	if v_cantidad_annios_generados  <  v_modalidad_duracion then


				-- asigno a la variable v_id_annio_lectivo el id_annio_lectivo lectivo corresspondiente
				SELECT id_annio_lectivo
					INTO v_id_annio_lectivo FROM adm_annio_lectivo WHERE estado = 1 ORDER BY id_annio_lectivo DESC LIMIT 1; /*simpre me devolvera una fila*/

				
				-- inserto la inscripcion
				
				INSERT INTO acade_calendario_pago(calendario_mes, calendario_annio, calendario_fecha_mes_cuota,
							id_usuario, id_annio_lectivo, id_alumno)
							VALUES(30, p_annio_lectivo_generar, CONCAT(p_annio_lectivo_generar, '-01-', '01' ),
							p_id_usuario, v_id_annio_lectivo, p_id_alumno);

				SET meses = 1;
					WHILE meses<= 12 DO
						IF(meses <= 9) THEN
							SET v_el_nuevo_mes = '0'+meses;
						ELSE
							SET v_el_nuevo_mes = meses;
						END IF;
						INSERT INTO acade_calendario_pago(calendario_mes, calendario_annio, calendario_fecha_mes_cuota,
							id_usuario, id_annio_lectivo, id_alumno)
							VALUES(meses, p_annio_lectivo_generar, CONCAT(p_annio_lectivo_generar, '-',  v_el_nuevo_mes, '-', '01' ),
							p_id_usuario, v_id_annio_lectivo, p_id_alumno);
					  SET meses = meses + 1;
					END WHILE;

				-- le sumo un mes a la fecha_mes_cuota y luego le resto un día para que me de la última fecha de pagao
				UPDATE acade_calendario_pago SET calendario_fecha_mes_cuota =  ADDDATE(calendario_fecha_mes_cuota, INTERVAL 1 MONTH) 
					WHERE calendario_annio = p_annio_lectivo_generar and id_alumno =p_id_alumno;
				UPDATE acade_calendario_pago SET calendario_fecha_mes_cuota =  ADDDATE(calendario_fecha_mes_cuota, INTERVAL -1 DAY) 
					WHERE calendario_annio = p_annio_lectivo_generar and id_alumno =p_id_alumno;
		SELECT 'OK' AS MENSAJE;
	 else
		select 'MENSAJE: SEGÚN LA MODALIDAD DEL ALUMNO YA NO PUEDE GENERAR MÁS CALENDARIO DE PAGO' AS ERROR_GENERADO;
	 end if;
	commit; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_GenerarReporteAlumnosCumpleannieros` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_GenerarReporteAlumnosCumpleannieros`(p_fecha date, p_id_curso int)
begin
/*
	PA que lista todos los alumnos que cumplen años en el mes que se elija
*/
	SELECT a.alumno_codigo, CONCAT(a.alumno_apellido, ', ', a.alumno_nombre) as ALUMNO, a.alumno_fecha_nacimiento, day(a.alumno_fecha_nacimiento) as DIA,
		case 
				 when MONTH(a.alumno_fecha_nacimiento)  = 1 then 'ENERO'
				 when MONTH(a.alumno_fecha_nacimiento)  = 2 then 'FEBRERO'
				 when MONTH(a.alumno_fecha_nacimiento)  = 3 then 'MARZO'
				 when MONTH(a.alumno_fecha_nacimiento)  = 4 then 'ABRIL'
				 when MONTH(a.alumno_fecha_nacimiento)  = 5 then 'MAYO'
				 when MONTH(a.alumno_fecha_nacimiento)  = 6 then 'JUNIO'
				 when MONTH(a.alumno_fecha_nacimiento)  = 7 then 'JULIO'
				 when MONTH(a.alumno_fecha_nacimiento)  = 8 then 'AGOSTO'
				 when MONTH(a.alumno_fecha_nacimiento)  = 9 then 'SEPTIEMBRE'
				 when MONTH(a.alumno_fecha_nacimiento)  = 10 then 'OCTUBRE'
				 when MONTH(a.alumno_fecha_nacimiento)  = 11 then 'NOVIEMBRE'
				 when MONTH(a.alumno_fecha_nacimiento)  = 12 then 'DICIEMBRE'
			END AS MES, concat(c.curso_nivel, ' ', moda.modalidad_nombre, ' ', c.curso_identificador) as SECCION, c.curso_turno
		 FROM adm_alumno a
         inner join adm_alumno_detalle ad on(ad.id_alumno = a.id_alumno and ad.id_curso = p_id_curso)
         inner join adm_curso c on(c.id_curso = ad.id_curso and c.id_annio_lectivo = (select fn_TraerIdAnioLectivo()))
         inner join acade_modalidad moda on(moda.id_modalidad = c.id_curso)
		 WHERE   /*MONTH(a.alumno_fecha_nacimiento) = MONTH(DATE_ADD(CURDATE(),INTERVAL 1 MONTH)) */
		  MONTH(a.alumno_fecha_nacimiento) = MONTH(p_fecha)  -- AND DAY( d.docente_fecha_nacimiento ) > month('2017-12-01')
		 order by  day(a.alumno_fecha_nacimiento) asc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_GenerarReporteDocentesCumpleannieros` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_GenerarReporteDocentesCumpleannieros`(p_fecha date)
begin
/*
	PA que lista todos los docentes que cumplen años en el mes actual
*/
	SELECT d.id_docente, CONCAT(d.docente_apellido, ', ', docente_nombre) as DOCENTE, d.docente_fecha_nacimiento, day(d.docente_fecha_nacimiento) as DIA,
		case 
				 when MONTH(d.docente_fecha_nacimiento)  = 1 then 'ENERO'
				 when MONTH(d.docente_fecha_nacimiento)  = 2 then 'FEBRERO'
				 when MONTH(d.docente_fecha_nacimiento)  = 3 then 'MARZO'
				 when MONTH(d.docente_fecha_nacimiento)  = 4 then 'ABRIL'
				 when MONTH(d.docente_fecha_nacimiento)  = 5 then 'MAYO'
				 when MONTH(d.docente_fecha_nacimiento)  = 6 then 'JUNIO'
				 when MONTH(d.docente_fecha_nacimiento)  = 7 then 'JULIO'
				 when MONTH(d.docente_fecha_nacimiento)  = 8 then 'AGOSTO'
				 when MONTH(d.docente_fecha_nacimiento)  = 9 then 'SEPTIEMBRE'
				 when MONTH(d.docente_fecha_nacimiento)  = 10 then 'OCTUBRE'
				 when MONTH(d.docente_fecha_nacimiento)  = 11 then 'NOVIEMBRE'
				 when MONTH(d.docente_fecha_nacimiento)  = 12 then 'DICIEMBRE'
			END AS MES
		 FROM adm_docente d
		 WHERE MONTH(d.docente_fecha_nacimiento) = MONTH(DATE_ADD(CURDATE(),INTERVAL 1 MONTH)) 
		 OR MONTH(d.docente_fecha_nacimiento) = MONTH(p_fecha) -- AND DAY( d.docente_fecha_nacimiento ) > month('2017-12-01')
		 order by  day(d.docente_fecha_nacimiento) asc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_GenerarReporteNotasPorSeccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_GenerarReporteNotasPorSeccion`(p_id_curso int, p_annio int)
begin
	/*
		PA que trae todas las notas del año seleccionadao para la seccion que es orientador o secciones que orienta
        el docente para mostarar las notas de la seccion en conglomerado
	*/
     select a.id_alumno, a.alumno_codigo, concat( a.alumno_apellido, ', ', a.alumno_nombre) as NOMBRE, ad.id_detalle_alumno,
			ad.id_curso, pnd.id_nota_detalle, pnd.N_1, pnd.id_materia, pnd.id_nota_detalle, pnd.id_periodo,
			 concat(pe.periodo_numero,'-', pe.periodo_nombre) as PERIODO,
             concat(doce.docente_apellido, ', ', doce.docente_nombre) as DOCENTE,
             concat(cur.curso_nivel, ' ', moda.modalidad_nombre, ' ',  cur.curso_identificador) as SECCION, cur.curso_turno,
             mate.materia_nombre, al.annio
	from adm_alumno a
	inner join adm_alumno_detalle ad on(ad.id_alumno = a.id_alumno)
	inner join adm_annio_lectivo al on(al.id_annio_lectivo = ad.id_annio_lectivo)
	inner join adm_curso cur on(cur.id_curso = ad.id_curso)
    inner join acade_periodo_nota_detalle pnd on(pnd.id_alumno = a.id_alumno /*and pnd.id_materia = p_id_materia*/)
    inner join acade_periodo pe on(pe.id_periodo = pnd.id_periodo)
    inner join adm_curso_detalle cd on(cd.id_curso = cur.id_curso and cd.id_materia = pnd.id_materia)
    inner join adm_docente doce on(doce.id_docente = cd.id_docente)
    inner join acade_modalidad moda on(moda.id_modalidad = cur.id_modalidad)
    inner join adm_materia mate on(mate.id_materia = pnd.id_materia)
	where ad.id_curso = p_id_curso  /*and cd.id_docente = 22*/ and al.annio = p_annio 
    group by pe.id_periodo, a.id_alumno, mate.id_materia
    order by mate.id_materia, a.alumno_apellido, a.alumno_nombre, pnd.id_periodo;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_informacciongeneralConfigurar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_informacciongeneralConfigurar`(
`p_informacion_nombre_institucion` varchar(100),
  `p_informacion_siglas` varchar(10),
  `p_informacion_codigo_infraestructura` varchar(10),
  `p_informacion_distrito` varchar(10),
  `p_informacion_direccion` varchar(100),
  `p_informacion_telefonos` varchar(250),
  `p_informacion_correo` varchar(50),
  `p_informacion_mision` longtext,
  `p_informacion_vision` longtext,
  `p_informacion_valores` longtext,
  p_informacion_nombre_logo varchar(80),
  p_informacion_url varchar(100),
  `p_id_municipio` smallint
  )
begin
	/*
		PA que actualiza la informacion general de la institucion
	*/
	update acade_informacion_general set informacion_nombre_institucion = p_informacion_nombre_institucion, 
		 `informacion_siglas`=p_informacion_siglas,
		  `informacion_codigo_infraestructura`=p_informacion_codigo_infraestructura,
		  `informacion_distrito`=p_informacion_distrito,
		  `informacion_direccion`=p_informacion_direccion,
		  `informacion_telefonos`=p_informacion_telefonos,
		  `informacion_correo`=p_informacion_correo,
		  `informacion_mision`=p_informacion_mision,
		  `informacion_vision` =p_informacion_vision,
		  `informacion_valores`=p_informacion_valores,
		  informacion_nombre_logo=p_informacion_nombre_logo,
          informacion_url=p_informacion_url,
		  `id_municipio`=p_id_municipio;
		SELECT 'OK' as MENSAJE;
  end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_IniciarSesion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_IniciarSesion`(p_usuario varchar(50), p_clave varchar(100))
begin
	/*
		PA que verifica si el usuario ha ingresado las credenciales correctas y si esta activo
        si todo va bien, retornara datos respectivos de lo contrario enviara datos de error
	*/
    -- variable para verificar si el usuario esta activo y si ha ingresado credenciales correctas
    declare v_verificacion int;
    
    select count(*) into v_verificacion from adm_usuario where usuario = p_usuario and clave = p_clave and usuario_estado = 1;
    if v_verificacion = 1 then
		 select u.id_usuario, u.usuario, u.id_rol, 
			 doc.docente_nombre, doc.docente_apellido, (select informacion_siglas from acade_informacion_general limit 1) as SIGLAS,
             (select informacion_url from acade_informacion_general limit 1) as url
			 from adm_usuario u 
			 inner join adm_docente doc on(doc.id_usuario = u.id_usuario)
			 where u.usuario = p_usuario;
	else
		select  'Credenciales incorrectas o usuario está inactivo.' AS id_usuario, 'NO' AS usuario, 'NO' AS id_rol, 
			 'NO' AS docente_nombre, 'NO' AS docente_apellido;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_InsertaryDesactivarPeriodoAcademico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_InsertaryDesactivarPeriodoAcademico`(p_id_periodo int, p_periodo_numero tinyint, 
p_periodo_nombre varchar(50), p_id_annio_lectivo int, p_id_usuario int)
begin
	declare v_id_periodo_actual int;
    declare exit handler for sqlexception
		begin
         -- hubieron errores
         rollback;
		end;
		
        -- inicio la transaccion
        start transaction;
        
			-- traigo el perido actual
			-- siempre devolvera un valor el periodo actual
			select id_periodo into v_id_periodo_actual from acade_periodo where periodo_estado = 1 order by id_periodo desc limit 1;
			-- inactivo el periodo actual
			update acade_periodo set periodo_estado = 0 where id_periodo = v_id_periodo_actual;
			-- inserto el nuevo periodo
			insert into acade_periodo(id_periodo, periodo_numero, periodo_nombre, id_annio_lectivo, id_usuario)
				values(p_id_periodo,  p_periodo_numero, p_periodo_nombre, p_id_annio_lectivo, p_id_usuario);
		commit;     
    
    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_mensajes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_mensajes`(p_mensaje longtext)
begin
	create temporary table temporal_mensajes(id_menasje int not null primary key auto_increment, mensaje longtext not null);
    insert into temporal_mensajes(mensaje) values(p_mensaje);
	-- select p_mensaje as MENSARJE;
    drop table temporal_mensajes;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_ModificarDocenteUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_ModificarDocenteUsuario`(
	p_id_docente int,
 `p_docente_nombre` varchar(150),
  `p_docente_apellido` varchar(150),
  `p_docente_direccion` longtext,
   p_docente_fecha_nacimiento date,
  `p_id_municipio` smallint(6),
  `p_id_especialidad` smallint(6)
)
begin
	/*
		procedimiento que actualiza un usuario y docente
    */
    
	declare exit handler for sqlexception
		begin
			-- hubieron errores
			rollback;
			select 'NO' AS MENSAJE;
			resignal; -- muestra el error que geenero la excepcion
         end;
		
        -- inicio la transaccion
       start transaction;
		
           -- actualizo en la tabla adm_docente
           update adm_docente set docente_nombre = p_docente_nombre, docente_apellido = p_docente_apellido, 
			docente_direccion = p_docente_direccion, docente_fecha_nacimiento = p_docente_fecha_nacimiento, id_municipio =  p_id_municipio, id_especialidad =p_id_especialidad
			where id_docente = p_id_docente; 
		select 'OK' AS MENSAJE;
      commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_ModificarModalidad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_ModificarModalidad`(
p_id_modalidad int,
p_modalidad_nombre varchar(200),
p_modalidad_duracion tinyint(4),
p_modalidad_comentario varchar(400)
)
begin
	/*
		PA que actualiza una modalidad
    */
    -- varibles de control de transacciones
    declare exit handler for sqlexception
		begin
			-- hubieron errores
            rollback;
            select 'NO' AS MENSAJE;
		end;
	-- inicio transaccion
    start transaction;
		update acade_modalidad set modalidad_nombre = p_modalidad_nombre, modalidad_duracion = p_modalidad_duracion,
			modalidad_comentario = p_modalidad_comentario where id_modalidad = p_id_modalidad;
		select 'OK' as MENSAJE;
	COMMIT;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_modulo_TraerPermisosUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_modulo_TraerPermisosUsuario`(p_id_usuario int)
begin
	/*
		PA que lista todas las opciones del usuario respectivo
        para armar el menu principal, esto dependiendo a su rol
	*/
	select u.id_usuario, 
		m.id_modulo, m.nombre_modulo, mo.id_modulo_opcion, mo.nombre_opcion, mo.nombre_controlador_opcion
	from adm_usuario u
	inner join adm_rol r on(u.id_rol = r.id_rol)
	-- inner join adm_modulo_opcion mo on(mo.id_modulo_opcion = mou.id_modulo_opcion)
	inner join adm_modulo m on(m.id_rol = r.id_rol)
	inner join adm_modulo_opcion mo on(mo.id_modulo=m.id_modulo)
	where u.id_usuario = p_id_usuario and mo.opcion_nivel =1 and mo.opcion_estado = 1
		and u.usuario_estado = 1
    order by m.id_modulo, mo.id_modulo_opcion;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_municipio_TraerMunicipioPorDepto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_municipio_TraerMunicipioPorDepto`(p_id_departamento tinyint)
begin
	select id_municipio, municipio_nombre from adm_municipio where id_departamento = p_id_departamento;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_rol_TaerRolesUsuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_rol_TaerRolesUsuarios`()
begin
	select id_rol, rol_nombre from adm_rol;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_TaerCalendarioPagoPorAlumno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_TaerCalendarioPagoPorAlumno`(p_id_alumno int)
begin
	select cp.id_calendario_pago, cp.calendario_mes, cp.calendario_annio,
		case 
		 when cp.calendario_mes  = 1 then 'ENERO'
		 when cp.calendario_mes  = 2 then 'FEBRERO'
		 when cp.calendario_mes  = 3 then 'MARZO'
		 when cp.calendario_mes  = 4 then 'ABRIL'
		 when cp.calendario_mes  = 5 then 'MAYO'
		 when cp.calendario_mes  = 6 then 'JUNIO'
		 when cp.calendario_mes  = 7 then 'JULIO'
		 when cp.calendario_mes  = 8 then 'AGOSTO'
		 when cp.calendario_mes  = 9 then 'SEPTIEMBRE'
		 when cp.calendario_mes  = 10 then 'OCTUBRE'
		 when cp.calendario_mes  = 11 then 'NOVIEMBRE'
		 when cp.calendario_mes  = 12 then 'DICIEMBRE'
		 ELSE 'INSCRIPCIÓN' END AS MES,
		 case 
			when cp.calendario_annio < year(now()) then 'VENCIDA'
			 else
				CASE 
					when cp.calendario_annio = year(now()) then 
							case 
								/*
								  el if es para ponerle siempre 1 al mes si este es 30 la inscripcion
								  y asi poder validar si la inscripcion ya esta vencida
								*/
								WHEN if(cp.calendario_mes = 30, 1, cp.calendario_mes) < month(now()) then 'VENCIDO'
								ELSE 'OK'
							END
					when cp.calendario_annio > year(now()) then  'OK'
				END
		END AS ESTADO_CUOTA
	FROM acade_calendario_pago cp where cp.id_alumno = p_id_alumno and cp.calendario_cuota_pagada = 0 order by cp.id_calendario_pago asc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_TaerModalidaPorID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_TaerModalidaPorID`(p_id_modalidad int)
begin
	select m.id_modalidad, m.modalidad_nombre, m.modalidad_duracion, m.modalidad_comentario, m.fecha_creacion
					from acade_modalidad m where m.id_modalidad = p_id_modalidad;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_TraerAlumnosEnMoraPorSeccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_TraerAlumnosEnMoraPorSeccion`(p_id_curso int, p_id_annio_lectivo int)
begin
/*
PA que lista todos los alumnos en mora del año seleccionado y del curso seleccionado
*/
	select a.alumno_codigo, concat(a.alumno_apellido, ', ', a.alumno_nombre) as ALUMNO, 
concat(c.curso_nivel, ' ', m.modalidad_nombre, ' ', c.curso_identificador) as SECCION, c.curso_turno,
cp.id_alumno, cp.id_calendario_pago, cp.calendario_mes, cp.calendario_annio,
		case 
		 when cp.calendario_mes  = 1 then 'ENERO'
		 when cp.calendario_mes  = 2 then 'FEBRERO'
		 when cp.calendario_mes  = 3 then 'MARZO'
		 when cp.calendario_mes  = 4 then 'ABRIL'
		 when cp.calendario_mes  = 5 then 'MAYO'
		 when cp.calendario_mes  = 6 then 'JUNIO'
		 when cp.calendario_mes  = 7 then 'JULIO'
		 when cp.calendario_mes  = 8 then 'AGOSTO'
		 when cp.calendario_mes  = 9 then 'SEPTIEMBRE'
		 when cp.calendario_mes  = 10 then 'OCTUBRE'
		 when cp.calendario_mes  = 11 then 'NOVIEMBRE'
		 when cp.calendario_mes  = 12 then 'DICIEMBRE'
		 ELSE 'INSCRIPCIÓN' END AS MES,
		 case 
			when cp.calendario_annio < year(now()) then 'VENCIDA'
			 else
				CASE 
					when cp.calendario_annio = year(now()) then 
							case 
								/*
								  el if es para ponerle siempre 1 al mes si este es 30 la inscripcion
								  y asi poder validar si la inscripcion ya esta vencida
								*/
								WHEN if(cp.calendario_mes = 30, 1, cp.calendario_mes) < month(now()) then 'VENCIDA'
								ELSE 'OK'
							END
					when cp.calendario_annio > year(now()) then  'OK'
				END
		END AS ESTADO_CUOTA
	FROM acade_calendario_pago cp
    inner join adm_alumno a on(a.id_alumno = cp.id_alumno)
    inner join adm_alumno_detalle ad on(ad.id_alumno = cp.id_alumno and ad.id_curso = p_id_curso)
    inner join adm_curso c on(c.id_curso = ad.id_curso and ad.id_curso = p_id_curso)
    inner join acade_modalidad m on(m.id_modalidad = c.id_modalidad)
    where cp.calendario_annio < year(now()) and cp.calendario_fecha_pago = '0000-00-00'
		
        or(
			/* el if es para ponerle 1 a la inscripcion y simule que es enero para poder 
            evaluar si esta vencida o no*/
			cp.calendario_annio = year(now()) and if(cp.calendario_mes = 30, 1, cp.calendario_mes) < month(now()) and cp.calendario_fecha_pago = '0000-00-00'
            )
            and cp.id_annio_lectivo = p_id_annio_lectivo

    order by a.alumno_apellido, cp.calendario_annio, cp.calendario_mes asc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_TraerDatosGenerales` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_TraerDatosGenerales`()
begin
	/*
		PA que trae la informacion general de la instaitucion
	*/
		select ig.*, muni.municipio_nombre, depto.departamento_nombre, depto.id_departamento
			from acade_informacion_general ig	
				inner join adm_municipio muni on(muni.id_municipio = ig.id_municipio)
                inner join adm_departamento depto on(depto.id_departamento = muni.id_departamento);
  end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_TraerDocentesParaAsiganarMaterias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_TraerDocentesParaAsiganarMaterias`()
begin
	/*
		PA que trae todos los docentes pero solo los usaurios con rol docentes
        estos para evitar asignarle materias a los administradores y a los usuarios comunes
        id_rol = 2 (profesores)
    */
	SELECT d.id_docente, d.docente_nombre, d.docente_apellido, d.docente_direccion, d.fecha_creacion,
						u.usuario, r.rol_nombre
						from adm_docente d 
						inner join adm_usuario u
						on(d.id_usuario = u.id_usuario)
						inner join adm_rol r
						on(r.id_rol = u.id_rol)
						where u.usuario_estado = true and r.id_rol = 2 order by d.docente_apellido, d.docente_nombre;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_TraerDocentesUsuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_TraerDocentesUsuarios`()
begin
	/*
		PA que trae todos los usuarios pero solo los usaurios
    */
	SELECT d.id_docente, d.docente_nombre, d.docente_apellido, d.docente_direccion, d.fecha_creacion,
						u.usuario, r.rol_nombre
						from adm_docente d 
						inner join adm_usuario u
						on(d.id_usuario = u.id_usuario)
						inner join adm_rol r
						on(r.id_rol = u.id_rol)
						where u.usuario_estado = true   order by d.docente_apellido, d.docente_nombre;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_TraerMateriasDelDocentenById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_TraerMateriasDelDocentenById`(p_id_docente int)
begin
	/*
		PA que traera el listado de las secciones a las cual es orientador el docente
        este PA se utiliza en varias controlers Inscripciones/Administrar/ y en Reportesnotas/ReporteAlumnosCumpleannieros
        si se modifica este PA tener cuidado que no afecte el resultado para ambas vistas
	*/
    select c.id_curso, concat(c.curso_nivel, ' ', m.modalidad_nombre, ' ', c.curso_identificador) as SECCION, c.curso_turno
		FROM adm_curso c
		inner join acade_modalidad m on(c.id_modalidad = m.id_modalidad)
		inner join adm_curso_detalle cd on(cd.id_curso = c.id_curso)
		INNER JOIN adm_annio_lectivo an
		ON(an.id_annio_lectivo = c.id_annio_lectivo and c.id_annio_lectivo = (select fn_TraerIdAnioLectivo()))
		inner join acade_detalle_orientador dori on(dori.id_curso = c.id_curso and dori.id_docente = p_id_docente)
		where c.curso_estado = 1 AND an.estado = 1 and cd.id_docente = p_id_docente group by c.id_curso;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_TraerModalidades` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_TraerModalidades`()
begin
	select m.id_modalidad, m.modalidad_nombre, m.modalidad_comentario, m.fecha_creacion
					from acade_modalidad m where m.modalidad_estado = 1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_TraerNotasPorDocenteMateriaCursoYannio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_TraerNotasPorDocenteMateriaCursoYannio`(p_id_docente int, p_id_materia int, p_id_curso int, p_annio int)
begin
	/*
		PA que lista las notas de la seccion por materia con el docente respectivo
	*/
    
    select a.id_alumno, a.alumno_codigo, concat( a.alumno_apellido, ', ', a.alumno_nombre) as NOMBRE, ad.id_detalle_alumno,
			ad.id_curso, pnd.id_nota_detalle, pnd.N_1, pnd.id_materia, pnd.id_nota_detalle, pnd.id_periodo,
			 concat(pe.periodo_numero,'-', pe.periodo_nombre) as PERIODO,
             concat(doce.docente_apellido, ', ', doce.docente_nombre) as DOCENTE,
             concat(cur.curso_nivel, ' ', moda.modalidad_nombre, ' ',  cur.curso_identificador) as SECCION, cur.curso_turno,
             mate.materia_nombre
	from adm_alumno a
	inner join adm_alumno_detalle ad on(ad.id_alumno = a.id_alumno)
	inner join adm_annio_lectivo al on(al.id_annio_lectivo = ad.id_annio_lectivo)
	inner join adm_curso cur on(cur.id_curso = ad.id_curso)
    inner join acade_periodo_nota_detalle pnd on(pnd.id_alumno = a.id_alumno and pnd.id_materia = p_id_materia)
    inner join acade_periodo pe on(pe.id_periodo = pnd.id_periodo)
    inner join adm_curso_detalle cd on(cd.id_curso = cur.id_curso and cd.id_materia = pnd.id_materia)
    inner join adm_docente doce on(doce.id_docente = cd.id_docente)
    inner join acade_modalidad moda on(moda.id_modalidad = cur.id_modalidad)
    inner join adm_materia mate on(mate.id_materia = pnd.id_materia)
	where ad.id_curso = p_id_curso  and cd.id_docente = p_id_docente and al.annio = p_annio 
    order by a.alumno_apellido, a.alumno_nombre, pnd.id_periodo;
    
    /*
     select  pnd.id_periodo,
			 concat(pe.periodo_numero,'-', pe.periodo_nombre) as PERIODO,
             case when pnd.id_periodo = pe.id_periodo then  concat(pe.periodo_numero,'-', pe.periodo_nombre)
             end as ok
	from adm_alumno a
	inner join adm_alumno_detalle ad on(ad.id_alumno = a.id_alumno)
	inner join adm_annio_lectivo al on(al.id_annio_lectivo = ad.id_annio_lectivo)
	inner join adm_curso cur on(cur.id_curso = ad.id_curso)
    inner join acade_periodo_nota_detalle pnd on(pnd.id_alumno = a.id_alumno and pnd.id_materia = p_id_materia)
    inner join acade_periodo pe on(pe.id_periodo = pnd.id_periodo)
    inner join adm_curso_detalle cd on(cd.id_curso = cur.id_curso and cd.id_materia = pnd.id_materia)
	where ad.id_curso = p_id_curso  and cd.id_docente = p_id_docente and al.annio = p_annio group by pnd.id_periodo
    order by pnd.id_periodo;
    */
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_TraerSeccionesDelDocenteAsiganadasPorMaterias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_TraerSeccionesDelDocenteAsiganadasPorMaterias`(p_id_docente int)
begin
	/*
		PA que trae las las secciones asigandas con materias al docente para ver cual se le asigna como 
        orientador
	*/
	SELECT d.id_docente, concat(d.docente_apellido, ' ',d.docente_nombre) as NOMBRE,
		concat(c.curso_nivel, ' ', moda.modalidad_nombre, ' ',  c.curso_identificador) as SECCION, cd.id_detalle, c.id_curso, c.curso_turno,
        ifnull(id_orientador, 0) as id_orientador
		from adm_docente d 
		inner join adm_curso_detalle cd on(cd.id_docente = d.id_docente)
		inner join adm_curso c on(c.id_curso = cd.id_curso)
		inner join acade_modalidad moda on(moda.id_modalidad = c.id_modalidad)
        left join acade_detalle_orientador dori on(dori.id_curso = c.id_curso and dori.id_docente = p_id_docente)
		where d.id_docente = p_id_docente and moda.modalidad_estado = 1
		and c.curso_estado = 1 and c.id_annio_lectivo = (select fn_TraerIdAnioLectivo())
		 group by c.id_curso order by c.curso_nivel, moda.id_modalidad, c.curso_identificador;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_TraerSeccionesDelDocentePorMateria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_TraerSeccionesDelDocentePorMateria`(p_id_docente int)
begin
	/*
		PA que trae todas las secciones a las cuales el docente da clase, secciion por materia
	*/
	SELECT d.id_docente, concat(d.docente_apellido, ' ',d.docente_nombre) as NOMBRE,
		concat(c.curso_nivel, ' ', moda.modalidad_nombre, ' ',  c.curso_identificador) as SECCION, mate.id_materia, mate.materia_nombre, cd.id_detalle, c.id_curso,
        c.curso_turno
		from adm_docente d 
		inner join adm_curso_detalle cd on(cd.id_docente = d.id_docente)
		inner join adm_curso c on(c.id_curso = cd.id_curso and c.id_annio_lectivo= (select fn_TraerIdAnioLectivo()))
		inner join adm_materia mate on(mate.id_materia = cd.id_materia)
		inner join acade_modalidad moda on(moda.id_modalidad = c.id_modalidad)
		where d.id_docente = p_id_docente and c.curso_estado = 1 and moda.modalidad_estado = 1
        order by c.curso_nivel, moda.id_modalidad, c.curso_identificador, mate.id_materia;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_TraerSiguietneId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_TraerSiguietneId`(p_nombre_tabla varchar(100), p_primary_key varchar(100), out resultado int)
BEGIN

/*
	PA devolvera el siguiente primary key de la tabla respectiva
    
*/

DECLARE v_encontrado INT;

	-- SELECT max(p_primary_key) + 1 INTO v_encontrado FROM p_nombre_tabla;
  	SET @armarSQL = CONCAT('SELECT ifnull(max(' , p_primary_key , '), 0) +1 INTO @v_encontrado FROM ' , p_nombre_tabla);
	PREPARE stmt FROM @armarSQL;
	EXECUTE stmt;

	SET resultado = @v_encontrado;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_traer_roles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_traer_roles`()
begin
	select id_rol, rol_nombre from adm_rol;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_usuarioResetearClave` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_usuarioResetearClave`(p_id_docente int, p_clave varchar(100))
begin
	/*
		PA para resetear la clave
	*/
    -- variables para controlar la transaccion
    declare exit handler for sqlexception
		begin
			
            select 'NO' as MENSAJE;
            rollback; -- hubiero errores
            resignal; -- MUESTRA EL ERROR QUE DA
		END;
        -- INICIO TRANSCCION
		start transaction;
			update adm_usuario u 
				inner join adm_docente d on(u.id_usuario = d.id_usuario)
				set u.clave = p_clave
				where d.id_docente = p_id_docente;
			select 'OK' as MENSAJE;
		commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_VerSiAlumnoYaPagoCuota` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_VerSiAlumnoYaPagoCuota`(p_id_alumno int, p_calendario_mes int)
BEGIN

/*
	la procedimiento devolvera un 0 o 1, si devuelve un 1 significa que ya pago la insecripcion
    de lo contrario no
    
*/

DECLARE v_encontrado INT;
DECLARE v_annio INT;

-- asigno a la variable v_annio el annio lectivo corresspondiente
SELECT annio
	INTO v_annio FROM adm_annio_lectivo WHERE estado = 1 ORDER BY id_annio_lectivo DESC LIMIT 1; /*simpre me devolvera una fila*/

	SELECT count(*) INTO v_encontrado FROM acade_calendario_pago 
     where id_alumno = p_id_alumno and calendario_annio = v_annio and calendario_mes = p_calendario_mes and calendario_cuota_pagada = 1 LIMIT 1;
     /*
		si el valor de la variable v_encontrado es 1 ya pago la cuota de inscripcion
	*/
    if v_encontrado = 1 then
		select 1 as MENSAJE;
	else	
		select 0 as MENSAJE;
	end if;

END ;;
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

-- Dump completed on 2017-05-04 11:58:22
