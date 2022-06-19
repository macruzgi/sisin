-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sisin
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acade_alumno_dato`
--

LOCK TABLES `acade_alumno_dato` WRITE;
/*!40000 ALTER TABLE `acade_alumno_dato` DISABLE KEYS */;
INSERT INTO `acade_alumno_dato` VALUES (1,'MAXIMILIANO','MAXIMILIANA','72581216','max@gmail.com','AVENIDA PERALTA','MAXIMILIANO','72581217','ave@gmail.com','AVENIDA LAS MAGNOLIAS',1,'2017-03-03 20:11:39',1),(2,'MARTA ALICIA','MARTA ALICIA','2225-0505','every@gmail.com','AVENIDA SHILTUPAN','MARTA ALICIA','2225-0505','every@gmail.com','AVENIDA SHILTUPAN',2,'2017-03-03 20:21:23',1),(3,'ESTAFA','ESTAFA','','','EVERTE','CARMELA','','','AVENDIA',3,'2017-03-03 20:26:02',1),(4,'camila','camila','','','del norte','camilia','','','del norte',4,'2017-03-06 17:48:29',1),(5,'olmedo','olmedo','','','alguna parte','jansel','','','norte',5,'2017-03-06 20:34:52',1),(6,'duvia','dunio','','','san salvador','camilia','','','del monte',6,'2017-03-06 20:36:02',1),(7,'MARIO ARNULFO','MARIA CARMEN RODRÍGUEZ','','','LA GARITA','CARLOS MONTIEL','','','SAN SALVADOR',7,'2017-03-14 17:03:09',1);
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
INSERT INTO `acade_arancel` VALUES (1,'MATRÍCURLA',1,'2017-03-24 21:29:41',1),(2,'INSCRIPCIÓN',1,'2017-03-24 21:29:41',1),(3,'MENSUALIDAD',1,'2017-03-24 21:29:41',1),(4,'MORA-MENSUALIDAD',1,'2017-03-24 21:29:41',1),(5,'MORA-BIBLIOTECA',1,'2017-03-24 21:29:41',1),(6,'DERECHO EXAMEN',1,'2017-03-24 21:54:22',1),(7,'prueba',1,'2017-03-24 22:35:50',1);
/*!40000 ALTER TABLE `acade_arancel` ENABLE KEYS */;
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
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL COMMENT 'usuario que creo el registro solo como referencia no constrain',
  PRIMARY KEY (`id_especialidad`),
  UNIQUE KEY `especialidad_nombre` (`especialidad_nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acade_especialidad`
--

LOCK TABLES `acade_especialidad` WRITE;
/*!40000 ALTER TABLE `acade_especialidad` DISABLE KEYS */;
INSERT INTO `acade_especialidad` VALUES (1,'INGENIERO EN SISTEMAS Y REDES INFORMÁTICAS','2017-03-01 17:25:21',1),(2,'CIENCIAS DE LA EDUCACIÓN','2017-03-01 17:25:21',1),(3,'FÍSICO-QUÍMICO','2017-03-01 17:25:21',1);
/*!40000 ALTER TABLE `acade_especialidad` ENABLE KEYS */;
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
INSERT INTO `acade_modalidad` VALUES (1,'EDUCACIÓN BÁSICA','',1,'2017-02-27 19:51:30',1),(2,'BACHILLERATO TÉCNICO VOCACIONAL','Bachillerato de 3 años con especialidad',1,'2017-02-27 19:56:43',1),(3,'BACHILLERATO GENERAL','',1,'2017-02-27 19:59:07',1),(4,'BACHILLERATO GENERAL NOCTURNO','Bachillerato nocturno 4 años',1,'2017-02-27 19:59:35',1),(5,'CURSO DE VERANO 2017','El curso tiene como objetivo cambiar todos los modos operandis',0,'2017-02-27 20:58:13',1);
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
INSERT INTO `acade_periodo` VALUES (1,1,'preuba para funcion que no permita desmatircular',1,1,'2017-03-11 17:04:39',1),(2,1,'preuba para funcion que no permita desmatircular',0,2,'2017-03-11 17:07:17',1),(3,2,'PERÍODO #2',0,2,'2017-03-13 22:04:46',1),(4,3,'PERÍODO #3',0,2,'2017-03-13 22:07:18',1),(5,4,'PERÍODO #4',0,2,'2017-03-13 22:16:13',1),(6,5,'PERÍODO #5',0,2,'2017-03-13 22:19:04',1),(7,6,'PERÍODO #6',0,2,'2017-03-14 16:42:16',1),(8,7,'PERÍODO #7',0,2,'2017-03-14 16:45:41',1),(9,9,'período extraordinario',1,2,'2017-03-24 19:24:26',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acade_periodo_nota_detalle`
--

LOCK TABLES `acade_periodo_nota_detalle` WRITE;
/*!40000 ALTER TABLE `acade_periodo_nota_detalle` DISABLE KEYS */;
INSERT INTO `acade_periodo_nota_detalle` VALUES (26,5.00,0.00,0.00,8,4,1,2,'2017-03-24 19:23:49',1),(27,7.00,0.00,0.00,8,1,1,2,'2017-03-24 19:23:49',1),(28,6.00,0.00,0.00,8,2,1,2,'2017-03-24 19:23:49',1),(29,10.00,0.00,0.00,9,4,1,2,'2017-03-24 19:37:15',1),(30,10.00,0.00,0.00,9,1,1,2,'2017-03-24 19:37:15',1),(31,10.00,0.00,0.00,9,2,1,2,'2017-03-24 19:37:16',1),(32,0.20,0.00,0.00,9,6,1,2,'2017-03-24 19:39:54',1);
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
INSERT INTO `adm_alumno` VALUES (1,'000517','CARLOS MARIO','MEDINA','LA USULUTECA','72581215','1970-01-01',NULL,'gmail@gmail.com',1,2,118,'2017-03-03 20:11:39',1),(2,'000217','MARIA DE LOS ANGELES','RUIZ MARTINEZ','AVENIDA SHILTUPAN','2225-0505','1987-02-12',NULL,'every@gmail.com',1,1,109,'2017-03-03 20:21:23',1),(3,'000317','MARTA','MEDINA','OVEROLTE','','1987-10-15',NULL,'',1,1,35,'2017-03-03 20:26:01',1),(4,'000417','karlos manuel','del monte','avenida peralta','','2017-06-03',NULL,'',1,2,179,'2017-03-06 17:48:28',1),(5,'000617','juan natanael','pulunte','de todos partes','','2017-06-03',NULL,'',1,2,172,'2017-03-06 20:34:52',1),(6,'000717','CARLOS MARIO','MEDINA','san salvador','','1970-01-01',NULL,'',1,2,143,'2017-03-06 20:36:02',1),(7,'000817','MARTA LIDIA','ULIEL','LA GARITA','','1970-01-01',NULL,'',1,1,14,'2017-03-14 17:03:09',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_alumno_detalle`
--

LOCK TABLES `adm_alumno_detalle` WRITE;
/*!40000 ALTER TABLE `adm_alumno_detalle` DISABLE KEYS */;
INSERT INTO `adm_alumno_detalle` VALUES (4,4,0,1,2,'2017-03-10 11:28:40',1),(6,2,0,1,2,'2017-03-10 11:30:48',1),(11,1,0,1,2,'2017-03-11 11:55:34',1),(12,5,0,3,2,'2017-03-13 10:02:21',1),(13,6,0,2,2,'2017-03-13 10:03:27',1);
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
  `curso_nivel` char(4) NOT NULL COMMENT 'nivel del curso o grado, 1º, 2º, 3º...I, II....',
  `curso_identificador` char(1) NOT NULL COMMENT 'identificador del grado con una letra del alfabeto',
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
INSERT INTO `adm_curso` VALUES (1,1,'1º','L',1,2,'2017-02-28 21:26:39',1),(2,1,'1º','B',1,2,'2017-02-28 21:38:17',1),(3,3,'1','A',1,2,'2017-02-28 21:39:53',1),(4,4,'1','A',1,2,'2017-02-28 22:18:23',1),(5,2,'3º','G',1,2,'2017-02-28 23:20:59',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_curso_detalle`
--

LOCK TABLES `adm_curso_detalle` WRITE;
/*!40000 ALTER TABLE `adm_curso_detalle` DISABLE KEYS */;
INSERT INTO `adm_curso_detalle` VALUES (2,2,4,22,1,'2017-03-07 22:08:16',1),(3,2,5,22,1,'2017-03-07 22:08:16',1),(6,2,3,22,1,'2017-03-07 22:56:50',1),(7,2,4,22,2,'2017-03-08 20:20:42',1),(8,2,2,22,3,'2017-03-08 20:30:51',1),(9,2,1,22,3,'2017-03-08 20:30:51',1),(12,2,3,5,4,'2017-03-08 21:47:31',1),(13,2,4,5,4,'2017-03-08 21:47:32',1),(14,2,2,5,4,'2017-03-08 21:47:32',1),(15,2,1,5,4,'2017-03-08 21:47:32',1),(16,2,5,5,4,'2017-03-08 21:47:32',1),(17,2,3,5,2,'2017-03-08 21:48:28',1),(18,2,1,5,3,'2017-03-08 21:54:05',1),(19,2,4,5,3,'2017-03-08 21:58:53',1),(20,2,5,5,3,'2017-03-08 21:58:54',1),(21,2,3,23,1,'2017-03-08 22:30:00',1),(22,2,4,23,1,'2017-03-08 22:30:00',1),(23,2,2,23,1,'2017-03-08 22:30:00',1),(24,2,1,23,1,'2017-03-08 22:30:00',1),(25,2,5,23,1,'2017-03-08 22:30:00',1),(26,2,3,23,2,'2017-03-08 22:30:23',1),(27,2,4,23,2,'2017-03-08 22:30:23',1),(28,2,2,23,2,'2017-03-08 22:30:24',1),(29,2,1,23,2,'2017-03-08 22:30:24',1),(30,2,5,23,2,'2017-03-08 22:30:24',1),(31,2,3,7,3,'2017-03-09 21:08:22',1),(32,2,2,7,1,'2017-03-14 17:48:06',1);
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
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_usuario, indice',
  `id_municipio` smallint(6) NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_municipio, indice',
  `id_especialidad` smallint(6) NOT NULL COMMENT 'llave foranea para relacionar con la tabla acade_especialidad',
  PRIMARY KEY (`id_docente`),
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
INSERT INTO `adm_docente` VALUES (2,'MARIA LUISA','VASQUEZ','MEJICANOS','2017-02-17 22:53:10',1,1,1),(3,'CARLOS MARIO','ROMERO','LA GARITA PALMERA, CIUDAD DELGADO','2017-02-17 22:53:10',1,1,1),(4,'MARVIN GIANCARLO','CRUZ','LA GARITA CIUDAD DELGADO','2017-02-22 15:41:03',3,1,1),(5,'maria luisa marta','CRUZ PERALTA','SANTIAGO DE MARÍA USULUTÁN','2017-02-22 15:48:17',4,1,1),(6,'MARVIN GIANCARLO','CRUZ','ALGÚN LUGAR DE LA TIERRA','2017-02-22 16:32:38',5,1,1),(7,'morlon ustiel','CRUZ','SAN SALADOR ever','2017-02-22 16:33:55',6,1,1),(8,'karlos de la garza','motoniel','SANTIAGO PERULAPILLA','2017-02-22 16:53:15',7,1,1),(9,'doromita eustacia','candida perez','SAN SALVADOR EL Salvaodor','2017-02-22 17:10:05',8,1,1),(10,'CARLOS MARIO ALEXANDER','ROMERO CRUZ MUÑOZ','DE SAN SALVADOR','2017-02-24 16:12:02',9,1,1),(11,'MARIA ANA','MONTIEL','SUCHITOTO','2017-02-24 16:15:35',10,1,1),(12,'CANDELARIO RUFINO','RUFIAN MONTIEL','CONDOMINIO','2017-02-24 16:16:35',11,1,1),(13,'JUAN KARLO','OTONIEL','GARITA','2017-02-24 16:19:04',12,1,1),(14,'JULIANA DEL PUCHUNTE','CRUZ','OLOCUILTA','2017-02-24 16:21:24',13,1,1),(15,'JHON CARLO','MURATALLO','TESTACUANGO','2017-02-24 16:31:08',14,1,1),(16,'DONOBAN','JULIEL','JIQUILISCO','2017-02-24 16:51:00',15,1,1),(17,'LILIAN DEL MONTE','DE JUPIANINI','SANTA ANA','2017-02-24 16:52:47',16,1,1),(18,'Ultimo usuario de prueba','usuario de apellidos','ciudad de prueba','2017-02-24 20:20:38',18,1,1),(19,'MARTA ELIZABETH','VENTURA AYALA','SOYAPANGO','2017-02-24 21:45:24',19,1,1),(20,'MARIA TIMOTEA EUSTAQUIA','DEL MONTE','MEJICANOS','2017-03-01 20:35:53',20,187,3),(21,'dolores de jesus','pineda','san salvador','2017-03-01 20:37:26',21,179,1),(22,'MARIA LUISA','canales','santiago de maría','2017-03-01 20:40:00',22,259,3),(23,'MIRIAN ADELINA','TURCIOS FLORES','SANTA MARÍA','2017-03-08 22:29:13',23,259,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_lista`
--

LOCK TABLES `adm_lista` WRITE;
/*!40000 ALTER TABLE `adm_lista` DISABLE KEYS */;
INSERT INTO `adm_lista` VALUES (1,'FEMENINO',1,'se ocupara en el registro de alumnos','2017-03-01 23:24:16'),(2,'MASCULINO',1,'se ocupara en el registro de alumnos','2017-03-01 23:24:16'),(3,'PUREBA',2,'PRUEBA','2017-03-02 17:41:46'),(4,'PRUEBA',2,'PUREBA','2017-03-02 17:41:46');
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
  `id_modulo` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_modulo, indice',
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_modulo_opcion`),
  KEY `id_modulo` (`id_modulo`),
  CONSTRAINT `fk_moduloopcion_modulo` FOREIGN KEY (`id_modulo`) REFERENCES `adm_modulo` (`id_modulo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_modulo_opcion`
--

LOCK TABLES `adm_modulo_opcion` WRITE;
/*!40000 ALTER TABLE `adm_modulo_opcion` DISABLE KEYS */;
INSERT INTO `adm_modulo_opcion` VALUES (1,'Docentes/Usuarios','Usuarios/DocentesUsuarios/',1,1,'2016-11-21 11:00:49'),(2,'Modalidades/Cursos','Modalidades/AdministrarModalidades/',1,1,'2016-11-21 11:00:49'),(3,'Secciones','Secciones/AdministrarSecciones/',1,1,'2016-11-21 11:03:01'),(5,'Materias','Materias/AdministrarMaterias/',1,1,'2016-11-21 11:05:44'),(6,'Alumnos','Alumnos/Administrar/',1,1,'2016-11-21 11:05:44'),(7,'Períodos','Periodos/Administrar/',1,1,'2016-11-21 11:05:44'),(8,'Aranceles','Aranceles/AdministrarAranceles/',1,1,'2016-11-21 11:05:44'),(9,'Ver Usuarios','',2,1,'2017-01-26 16:59:01'),(10,'Agregar Usuarios','',2,1,'2017-01-26 16:59:01'),(11,'Editar Usuarios','',2,1,'2017-01-26 16:59:01'),(12,'Eliminar Usuarios','',2,1,'2017-01-26 16:59:01'),(13,'Ver Año','',2,1,'2017-01-26 17:04:47'),(14,'Agregar Año','',2,1,'2017-01-26 17:04:47'),(15,'Editar Año','',2,1,'2017-01-26 17:04:47'),(16,'Eliminar Año','',2,1,'2017-01-26 17:04:47'),(17,'Reporte Usuarios','',1,4,'2017-01-27 14:48:05'),(18,'Reporte Secciones','',1,4,'2017-01-27 14:48:05'),(19,'Reporte Docentes','',1,4,'2017-01-27 14:48:05'),(20,'Reporte Materias','',1,4,'2017-01-27 14:48:05'),(21,'Mi Perfil','',1,2,'2017-01-27 15:00:26'),(22,'Secciones','Secciones/SeccionesDocente/',1,2,'2017-01-27 15:00:26'),(24,'Inscribir Alumnos','Inscripciones/Administrar/',1,7,'2017-03-06 15:14:21'),(25,'Asignaciones Docentes','Usuarios/AdministrarAsignaciones/',1,6,'2017-03-07 09:03:49'),(27,'Notas','Materias/AdministrarNotas/',1,2,'2017-03-14 13:38:06'),(28,'Cuotas','Aranceles/Cuotas/',1,6,'2017-03-24 16:56:41');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_modulo_opcion_usuario`
--

LOCK TABLES `adm_modulo_opcion_usuario` WRITE;
/*!40000 ALTER TABLE `adm_modulo_opcion_usuario` DISABLE KEYS */;
INSERT INTO `adm_modulo_opcion_usuario` VALUES (1,1,1,'\0','\0','\0','\0'),(2,1,2,'\0','\0','\0','\0'),(4,1,3,'\0','\0','\0','\0');
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
  `nombres` varchar(100) NOT NULL COMMENT 'nombre ompleto del usuario',
  `apellidos` varchar(100) NOT NULL COMMENT 'apellidos del usuario',
  `clave` varchar(100) NOT NULL COMMENT 'contraseña con el cual se logueara el usuario',
  `usuario_estado` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'estado del usaurio, true activo, false inactivo',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_rol` int(11) NOT NULL COMMENT 'llave foranera para relacionar con la tabla adm_rol, indice',
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `usuario` (`usuario`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`id_rol`) REFERENCES `adm_rol` (`id_rol`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_usuario`
--

LOCK TABLES `adm_usuario` WRITE;
/*!40000 ALTER TABLE `adm_usuario` DISABLE KEYS */;
INSERT INTO `adm_usuario` VALUES (1,'mcruz','MARVIN GIANCARLO','CRUZ','a47c973cdb475cec9ad0d26e0891c43f',1,'2016-11-21 10:50:42',1),(2,'giancarlos1029@hotmail.com','jovel','calin','1029',1,'2016-11-21 10:50:42',2),(3,'cisco1099@gmail.com','','','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-02-22 09:41:03',1),(4,'mari@gmail.com','','','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-02-22 09:48:17',2),(5,'jualia@hotmail.com','','','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-02-22 10:32:38',2),(6,'ustiel@hotmail.com','','','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-02-22 10:33:55',3),(7,'moto@gmail.com','','','a47c973cdb475cec9ad0d26e0891c43f',0,'2017-02-22 10:53:14',2),(8,'doromita@hotmail.com','','','a908fe24d47e1a411df45498b1459b26',1,'2017-02-22 11:10:05',2),(9,'karlos@gmail.com','','','a47c973cdb475cec9ad0d26e0891c43f',0,'2017-02-24 10:12:02',3),(10,'montiel@gmail.com','','','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-02-24 10:15:35',1),(11,'rufiel@gmil.com','','','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-02-24 10:16:35',2),(12,'krlo@gmail.com','','','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-02-24 10:19:04',2),(13,'juliana@gmail.com','','','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-02-24 10:21:24',2),(14,'mora@gmail.com','','','a47c973cdb475cec9ad0d26e0891c43f',0,'2017-02-24 10:31:08',1),(15,'donoban@gmail.com','','','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-02-24 10:51:00',2),(16,'delmonte@gmail.com','','','a47c973cdb475cec9ad0d26e0891c43f',0,'2017-02-24 10:52:47',2),(17,'katarina@gmail.com','','','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-02-24 10:53:43',1),(18,'prueba@gmail.com','','','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-02-24 14:20:38',1),(19,'eliza@gmail.com','','','a47c973cdb475cec9ad0d26e0891c43f',0,'2017-02-24 15:45:24',1),(20,'eustaquia@gmail.com','','','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-03-01 14:35:53',2),(21,'okok@gmail.com','','','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-03-01 14:37:26',2),(22,'jhil@gmail.com','','','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-03-01 14:40:00',3),(23,'adelina@gmil.com','','','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-03-08 16:29:13',2);
/*!40000 ALTER TABLE `adm_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sisin'
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
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'sisin'
--
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-25 16:30:41
