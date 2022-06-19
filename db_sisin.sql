/*
SQLyog Trial v12.4.1 (32 bit)
MySQL - 5.7.16-log : Database - db_sisin
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_sisin` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_sisin`;

/*Table structure for table `acade_alumno_dato` */

DROP TABLE IF EXISTS `acade_alumno_dato`;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `acade_alumno_dato` */

insert  into `acade_alumno_dato`(`id_alumno_dato`,`dato_nombres_padre`,`dato_nombres_madre`,`dato_telefonos_contacto`,`dato_correo`,`dato_lugar_trabajo`,`dato_nombres_responsable`,`dato_telefono_responsable`,`dato_correo_responsable`,`dato_lugar_trabajo_responsable`,`id_alumno`,`fecha_creacion`,`id_usuario`) values 
(1,'MAXIMILIANO','MAXIMILIANA','72581216','max@gmail.com','AVENIDA PERALTA','MAXIMILIANO','72581217','ave@gmail.com','AVENIDA LAS MAGNOLIAS',1,'2017-03-03 14:11:39',1),
(2,'MARTA ALICIA','MARTA ALICIA','2225-0505','every@gmail.com','AVENIDA SHILTUPAN','MARTA ALICIA','2225-0505','every@gmail.com','AVENIDA SHILTUPAN',2,'2017-03-03 14:21:23',1),
(3,'ESTAFA','ESTAFA','','','EVERTE','CARMELA','','','AVENDIA',3,'2017-03-03 14:26:02',1),
(4,'camila','camila','','','del norte','camilia','','','del norte',4,'2017-03-06 11:48:29',1),
(5,'olmedo','olmedo','','','alguna parte','jansel','','','norte',5,'2017-03-06 14:34:52',1),
(6,'duvia','dunio','','','san salvador','camilia','','','del monte',6,'2017-03-06 14:36:02',1);

/*Table structure for table `acade_arancel` */

DROP TABLE IF EXISTS `acade_arancel`;

CREATE TABLE `acade_arancel` (
  `id_arancel` tinyint(4) NOT NULL COMMENT 'llave primaria no incremental',
  `arancel_nombre` varchar(150) NOT NULL COMMENT 'nombre o descripcion del arancel a cobrar',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL COMMENT 'usuario que crea el registro',
  PRIMARY KEY (`id_arancel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `acade_arancel` */

/*Table structure for table `acade_especialidad` */

DROP TABLE IF EXISTS `acade_especialidad`;

CREATE TABLE `acade_especialidad` (
  `id_especialidad` smallint(6) NOT NULL COMMENT 'llave primaria no incremental',
  `especialidad_nombre` varchar(80) NOT NULL COMMENT 'nombre o descripcion de la especialidad del docente',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL COMMENT 'usuario que creo el registro solo como referencia no constrain',
  PRIMARY KEY (`id_especialidad`),
  UNIQUE KEY `especialidad_nombre` (`especialidad_nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `acade_especialidad` */

insert  into `acade_especialidad`(`id_especialidad`,`especialidad_nombre`,`fecha_creacion`,`id_usuario`) values 
(1,'INGENIERO EN SISTEMAS Y REDES INFORMÁTICAS','2017-03-01 11:25:21',1),
(2,'CIENCIAS DE LA EDUCACIÓN','2017-03-01 11:25:21',1),
(3,'FÍSICO-QUÍMICO','2017-03-01 11:25:21',1);

/*Table structure for table `acade_modalidad` */

DROP TABLE IF EXISTS `acade_modalidad`;

CREATE TABLE `acade_modalidad` (
  `id_modalidad` int(11) NOT NULL COMMENT 'llave primaria no incremental',
  `modalidad_nombre` varchar(200) NOT NULL COMMENT 'nombre o descripcion de la modalidad o curso',
  `modalidad_comentario` varchar(400) DEFAULT NULL COMMENT 'algun comentario extra al curso',
  `modalidad_estado` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'almacena el estado de la modalida o curso true = activo, false = inactivo',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL COMMENT 'usuario que creo el registro solo como referencia no constrain',
  PRIMARY KEY (`id_modalidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `acade_modalidad` */

insert  into `acade_modalidad`(`id_modalidad`,`modalidad_nombre`,`modalidad_comentario`,`modalidad_estado`,`fecha_creacion`,`id_usuario`) values 
(1,'EDUCACIÓN BÁSICA','',1,'2017-02-27 13:51:30',1),
(2,'BACHILLERATO TÉCNICO VOCACIONAL','Bachillerato de 3 años con especialidad',1,'2017-02-27 13:56:43',1),
(3,'BACHILLERATO GENERAL','',1,'2017-02-27 13:59:07',1),
(4,'BACHILLERATO GENERAL NOCTURNO','Bachillerato nocturno 4 años',1,'2017-02-27 13:59:35',1),
(5,'CURSO DE VERANO 2017','El curso tiene como objetivo cambiar todos los modos operandis',0,'2017-02-27 14:58:13',1);

/*Table structure for table `acade_periodo` */

DROP TABLE IF EXISTS `acade_periodo`;

CREATE TABLE `acade_periodo` (
  `id_periodo` int(11) NOT NULL COMMENT 'llave primaria no incremental',
  `periodo_nombre` varchar(50) NOT NULL DEFAULT 'PERIODO' COMMENT 'nombre o descripcion del periodo',
  `id_annio_lectivo` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_annio_lectivo, indice',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL COMMENT 'usuario que crea el registro',
  PRIMARY KEY (`id_periodo`),
  KEY `id_annio_lectivo` (`id_annio_lectivo`),
  CONSTRAINT `fk_periodo_anniolectivo` FOREIGN KEY (`id_annio_lectivo`) REFERENCES `adm_annio_lectivo` (`id_annio_lectivo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `acade_periodo` */

/*Table structure for table `acade_periodo_nota_detalle` */

DROP TABLE IF EXISTS `acade_periodo_nota_detalle`;

CREATE TABLE `acade_periodo_nota_detalle` (
  `id_nota_detalle` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave primaria incremental',
  `N_1` decimal(2,2) NOT NULL COMMENT 'nota uno para el periodo cualesquiera',
  `N_2` decimal(2,2) NOT NULL COMMENT 'nota dos para el periodo cualesquiera',
  `N_3` decimal(2,2) NOT NULL COMMENT 'nota tres para el periodo cualesquiera',
  `id_periodo` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabla acade_periodo, indice',
  `id_alumno` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_alumno, indice',
  `id_materia` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_materia, indice',
  `id_annio_lectivo` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_annio_lectivo, indice',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL COMMENT 'usuario que crea el registro',
  PRIMARY KEY (`id_nota_detalle`),
  UNIQUE KEY `id_periodo` (`id_periodo`,`id_alumno`,`id_materia`,`id_annio_lectivo`),
  KEY `fk_periodonotadetalle_alumno` (`id_alumno`),
  KEY `fk_periodonotadetalle_materia` (`id_materia`),
  KEY `fk_periodonotadetalle_anniolectivo` (`id_annio_lectivo`),
  CONSTRAINT `fk_periodonotadetalle_alumno` FOREIGN KEY (`id_alumno`) REFERENCES `adm_alumno` (`id_alumno`) ON UPDATE CASCADE,
  CONSTRAINT `fk_periodonotadetalle_anniolectivo` FOREIGN KEY (`id_annio_lectivo`) REFERENCES `adm_annio_lectivo` (`id_annio_lectivo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_periodonotadetalle_materia` FOREIGN KEY (`id_materia`) REFERENCES `adm_materia` (`id_materia`) ON UPDATE CASCADE,
  CONSTRAINT `fk_periodonotadetalle_periodo` FOREIGN KEY (`id_periodo`) REFERENCES `acade_periodo` (`id_periodo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `acade_periodo_nota_detalle` */

/*Table structure for table `adm_alumno` */

DROP TABLE IF EXISTS `adm_alumno`;

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

/*Data for the table `adm_alumno` */

insert  into `adm_alumno`(`id_alumno`,`alumno_codigo`,`alumno_nombre`,`alumno_apellido`,`alumno_direccion`,`alumno_telefonos`,`alumno_fecha_nacimiento`,`alumno_nombre_foto`,`alumno_correo`,`alumno_estado`,`id_lista`,`id_municipio`,`fecha_creacion`,`id_usuario`) values 
(1,'000517','CARLOS MARIO','MEDINA','LA USULUTECA','72581215','1970-01-01',NULL,'gmail@gmail.com',1,2,118,'2017-03-03 14:11:39',1),
(2,'000217','MARIA DE LOS ANGELES','RUIZ MARTINEZ','AVENIDA SHILTUPAN','2225-0505','1987-02-12',NULL,'every@gmail.com',1,1,109,'2017-03-03 14:21:23',1),
(3,'000317','MARTA','MEDINA','OVEROLTE','','1987-10-15',NULL,'',1,1,35,'2017-03-03 14:26:01',1),
(4,'000417','karlos manuel','del monte','avenida peralta','','2017-06-03',NULL,'',1,2,179,'2017-03-06 11:48:28',1),
(5,'000617','juan natanael','pulunte','de todos partes','','2017-06-03',NULL,'',1,2,172,'2017-03-06 14:34:52',1),
(6,'000717','CARLOS MARIO','MEDINA','san salvador','','1970-01-01',NULL,'',1,2,143,'2017-03-06 14:36:02',1);

/*Table structure for table `adm_alumno_detalle` */

DROP TABLE IF EXISTS `adm_alumno_detalle`;

CREATE TABLE `adm_alumno_detalle` (
  `id_detalle_alumno` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave primaria incremental',
  `id_alumno` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_alumno, indice',
  `id_materia` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_materia, indice',
  `id_curso` int(11) NOT NULL COMMENT 'llave foranea para relacionar con al tabla adm_annio_lectivo, indice',
  `id_annio_lectivo` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_annio_lectivo, indice',
  PRIMARY KEY (`id_detalle_alumno`),
  UNIQUE KEY `id_alumno` (`id_alumno`,`id_materia`,`id_curso`,`id_annio_lectivo`),
  KEY `fk_alumnodetalle_materia` (`id_materia`),
  KEY `fk_alumnodetalle_curso` (`id_curso`),
  KEY `fk_alumnodetalle_anniolectivo` (`id_annio_lectivo`),
  CONSTRAINT `fk_alumnodetalle_alumno` FOREIGN KEY (`id_alumno`) REFERENCES `adm_alumno` (`id_alumno`) ON UPDATE CASCADE,
  CONSTRAINT `fk_alumnodetalle_anniolectivo` FOREIGN KEY (`id_annio_lectivo`) REFERENCES `adm_annio_lectivo` (`id_annio_lectivo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_alumnodetalle_curso` FOREIGN KEY (`id_curso`) REFERENCES `adm_curso` (`id_curso`) ON UPDATE CASCADE,
  CONSTRAINT `fk_alumnodetalle_materia` FOREIGN KEY (`id_materia`) REFERENCES `adm_materia` (`id_materia`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `adm_alumno_detalle` */

/*Table structure for table `adm_annio_lectivo` */

DROP TABLE IF EXISTS `adm_annio_lectivo`;

CREATE TABLE `adm_annio_lectivo` (
  `id_annio_lectivo` int(11) NOT NULL COMMENT 'llave primaria no incremental',
  `annio` int(11) NOT NULL COMMENT 'año lectivo creado',
  `estado` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'estado del año lectivo en curso 1=true, 0= fasle',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL COMMENT 'usuario que creo el registro',
  PRIMARY KEY (`id_annio_lectivo`),
  UNIQUE KEY `annio` (`annio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `adm_annio_lectivo` */

insert  into `adm_annio_lectivo`(`id_annio_lectivo`,`annio`,`estado`,`fecha_creacion`,`id_usuario`) values 
(1,2016,0,'2017-02-25 11:50:07',1),
(2,2017,1,'2017-02-27 10:57:00',1);

/*Table structure for table `adm_curso` */

DROP TABLE IF EXISTS `adm_curso`;

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

/*Data for the table `adm_curso` */

insert  into `adm_curso`(`id_curso`,`id_modalidad`,`curso_nivel`,`curso_identificador`,`curso_estado`,`id_annio_lectivo`,`fecha_creacion`,`id_usuario`) values 
(1,1,'1º','L',1,2,'2017-02-28 15:26:39',1),
(2,1,'1','B',1,2,'2017-02-28 15:38:17',1),
(3,3,'1','A',1,2,'2017-02-28 15:39:53',1),
(4,4,'1','A',1,2,'2017-02-28 16:18:23',1),
(5,2,'3º','G',1,2,'2017-02-28 17:20:59',1);

/*Table structure for table `adm_curso_detalle` */

DROP TABLE IF EXISTS `adm_curso_detalle`;

CREATE TABLE `adm_curso_detalle` (
  `id_detalle` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave primaria incremental',
  `id_annio_lectivo` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_annio_lectivo, indice',
  `id_curso` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_curso, indice',
  `id_docente` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabla adm_docente, indice',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL COMMENT 'usuario que crea el registro',
  PRIMARY KEY (`id_detalle`),
  UNIQUE KEY `id_annio_lectivo` (`id_annio_lectivo`,`id_curso`,`id_docente`),
  KEY `fk_cursodetalle_curso` (`id_curso`),
  KEY `fk_cursodetalle_docente` (`id_docente`),
  CONSTRAINT `fk_cursodetalle_anniolectivo` FOREIGN KEY (`id_annio_lectivo`) REFERENCES `adm_annio_lectivo` (`id_annio_lectivo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_cursodetalle_curso` FOREIGN KEY (`id_curso`) REFERENCES `adm_curso` (`id_curso`) ON UPDATE CASCADE,
  CONSTRAINT `fk_cursodetalle_docente` FOREIGN KEY (`id_docente`) REFERENCES `adm_docente` (`id_docente`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `adm_curso_detalle` */

/*Table structure for table `adm_departamento` */

DROP TABLE IF EXISTS `adm_departamento`;

CREATE TABLE `adm_departamento` (
  `id_departamento` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT 'llave primaria incremental',
  `departamento_nombre` varchar(150) NOT NULL COMMENT 'nombreo o descripcion del departamento',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL COMMENT 'usuario que crea el registro',
  PRIMARY KEY (`id_departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `adm_departamento` */

insert  into `adm_departamento`(`id_departamento`,`departamento_nombre`,`fecha_creacion`,`id_usuario`) values 
(1,'Ahuachapán','2017-03-01 10:28:35',1),
(2,'Cabañas','2017-03-01 10:28:35',1),
(3,'Chalatenango','2017-03-01 10:28:35',1),
(4,'Cuscatlán','2017-03-01 10:28:36',1),
(5,'La Libertad','2017-03-01 10:28:36',1),
(6,'La Paz','2017-03-01 10:28:36',1),
(7,'La Unión','2017-03-01 10:28:36',1),
(8,'Morazán','2017-03-01 10:28:36',1),
(9,'San Miguel','2017-03-01 10:28:36',1),
(10,'San Salvador','2017-03-01 10:28:36',1),
(11,'San Vicente','2017-03-01 10:28:36',1),
(12,'Santa Ana','2017-03-01 10:28:36',1),
(13,'Sonsonate','2017-03-01 10:28:36',1),
(14,'Usulután','2017-03-01 10:28:36',1);

/*Table structure for table `adm_docente` */

DROP TABLE IF EXISTS `adm_docente`;

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

/*Data for the table `adm_docente` */

insert  into `adm_docente`(`id_docente`,`docente_nombre`,`docente_apellido`,`docente_direccion`,`fecha_creacion`,`id_usuario`,`id_municipio`,`id_especialidad`) values 
(2,'MARIA LUISA','VASQUEZ','MEJICANOS','2017-02-17 16:53:10',1,1,1),
(3,'CARLOS MARIO','ROMERO','LA GARITA PALMERA, CIUDAD DELGADO','2017-02-17 16:53:10',1,1,1),
(4,'MARVIN GIANCARLO','CRUZ','LA GARITA CIUDAD DELGADO','2017-02-22 09:41:03',3,1,1),
(5,'maria luisa marta','CRUZ PERALTA','SANTIAGO DE MARÍA USULUTÁN','2017-02-22 09:48:17',4,1,1),
(6,'MARVIN GIANCARLO','CRUZ','ALGÚN LUGAR DE LA TIERRA','2017-02-22 10:32:38',5,1,1),
(7,'morlon ustiel','CRUZ','SAN SALADOR ever','2017-02-22 10:33:55',6,1,1),
(8,'karlos de la garza','motoniel','SANTIAGO PERULAPILLA','2017-02-22 10:53:15',7,1,1),
(9,'doromita eustacia','candida perez','SAN SALVADOR EL Salvaodor','2017-02-22 11:10:05',8,1,1),
(10,'CARLOS MARIO ALEXANDER','ROMERO CRUZ MUÑOZ','DE SAN SALVADOR','2017-02-24 10:12:02',9,1,1),
(11,'MARIA ANA','MONTIEL','SUCHITOTO','2017-02-24 10:15:35',10,1,1),
(12,'CANDELARIO RUFINO','RUFIAN MONTIEL','CONDOMINIO','2017-02-24 10:16:35',11,1,1),
(13,'JUAN KARLO','OTONIEL','GARITA','2017-02-24 10:19:04',12,1,1),
(14,'JULIANA DEL PUCHUNTE','CRUZ','OLOCUILTA','2017-02-24 10:21:24',13,1,1),
(15,'JHON CARLO','MURATALLO','TESTACUANGO','2017-02-24 10:31:08',14,1,1),
(16,'DONOBAN','JULIEL','JIQUILISCO','2017-02-24 10:51:00',15,1,1),
(17,'LILIAN DEL MONTE','DE JUPIANINI','SANTA ANA','2017-02-24 10:52:47',16,1,1),
(18,'Ultimo usuario de prueba','usuario de apellidos','ciudad de prueba','2017-02-24 14:20:38',18,1,1),
(19,'MARTA ELIZABETH','VENTURA AYALA','SOYAPANGO','2017-02-24 15:45:24',19,1,1),
(20,'MARIA TIMOTEA EUSTAQUIA','DEL MONTE','MEJICANOS','2017-03-01 14:35:53',20,187,3),
(21,'dolores de jesus','pineda','san salvador','2017-03-01 14:37:26',21,179,1),
(22,'MARIA LUISA','canales','santiago de maría','2017-03-01 14:40:00',22,259,3);

/*Table structure for table `adm_lista` */

DROP TABLE IF EXISTS `adm_lista`;

CREATE TABLE `adm_lista` (
  `id_lista` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave primaria incremental',
  `lista_valor` varchar(60) NOT NULL COMMENT 'volor que contendra la lista',
  `lista_id_opcion` tinyint(4) NOT NULL COMMENT 'valor para indicar en que opcion o mudolo del sitema se ocupara',
  `lista_comentario` varchar(100) DEFAULT NULL COMMENT 'comentario para indicar donde se ocupara',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_lista`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `adm_lista` */

insert  into `adm_lista`(`id_lista`,`lista_valor`,`lista_id_opcion`,`lista_comentario`,`fecha_creacion`) values 
(1,'FEMENINO',1,'se ocupara en el registro de alumnos','2017-03-01 17:24:16'),
(2,'MASCULINO',1,'se ocupara en el registro de alumnos','2017-03-01 17:24:16'),
(3,'PUREBA',2,'PRUEBA','2017-03-02 11:41:46'),
(4,'PRUEBA',2,'PUREBA','2017-03-02 11:41:46');

/*Table structure for table `adm_materia` */

DROP TABLE IF EXISTS `adm_materia`;

CREATE TABLE `adm_materia` (
  `id_materia` int(11) NOT NULL COMMENT 'llave primaria no incremental',
  `materia_nombre` varchar(150) NOT NULL COMMENT 'nombre o descripcion de la materia',
  `materia_unidades_valorativas` tinyint(4) DEFAULT '0' COMMENT 'numero de unidades valorativas de la materia, si aplicase',
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL COMMENT 'usuario que crea el registro',
  PRIMARY KEY (`id_materia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `adm_materia` */

insert  into `adm_materia`(`id_materia`,`materia_nombre`,`materia_unidades_valorativas`,`fecha_creacion`,`id_usuario`) values 
(1,'MATEMÁTICA I',5,'2017-03-01 15:37:33',1),
(2,'MATEMÁTICA GENERAL',0,'2017-03-01 15:38:15',1),
(3,'CIENCIAS NATURALES',8,'2017-03-01 15:38:40',1),
(4,'CIENCIA SALUD Y MEDIO AMBIENTE',0,'2017-03-01 15:38:58',1),
(5,'MATEMÁTICA',0,'2017-03-01 16:29:10',1);

/*Table structure for table `adm_materia_detalle` */

DROP TABLE IF EXISTS `adm_materia_detalle`;

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

/*Data for the table `adm_materia_detalle` */

/*Table structure for table `adm_modulo` */

DROP TABLE IF EXISTS `adm_modulo`;

CREATE TABLE `adm_modulo` (
  `id_modulo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_modulo` varchar(100) NOT NULL,
  `modulo_descripcion` varchar(180) NOT NULL COMMENT 'descripcion del modulo',
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_rol` int(11) NOT NULL COMMENT 'llave foranea apra relacionar con la tabla rol, indice',
  PRIMARY KEY (`id_modulo`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `fk_modulo_rol` FOREIGN KEY (`id_rol`) REFERENCES `adm_rol` (`id_rol`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `adm_modulo` */

insert  into `adm_modulo`(`id_modulo`,`nombre_modulo`,`modulo_descripcion`,`fecha_creacion`,`id_rol`) values 
(1,'CATÁLOGOS','pertenece al rol administradores','2016-11-21 10:59:27',1),
(2,'PROCESOS','pertenece al rol de docentes','2016-11-21 10:59:27',2),
(3,'REPORTES','pertenece al rol de usuarios','2017-01-26 16:35:10',3),
(4,'REPORTES','pertenece al rol de administradores','2017-01-26 16:35:10',1),
(5,'REPORTES','pertenece al rol de docentes','2017-01-26 16:35:24',2),
(6,'INSCRIPCIONES','pertenece al rol administradores','2017-03-06 15:02:17',1);

/*Table structure for table `adm_modulo_opcion` */

DROP TABLE IF EXISTS `adm_modulo_opcion`;

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `adm_modulo_opcion` */

insert  into `adm_modulo_opcion`(`id_modulo_opcion`,`nombre_opcion`,`nombre_controlador_opcion`,`opcion_nivel`,`id_modulo`,`fecha_creacion`) values 
(1,'Docentes/Usuarios','Usuarios/DocentesUsuarios/',1,1,'2016-11-21 11:00:49'),
(2,'Modalidades/Cursos','Modalidades/AdministrarModalidades/',1,1,'2016-11-21 11:00:49'),
(3,'Secciones','Secciones/AdministrarSecciones/',1,1,'2016-11-21 11:03:01'),
(5,'Materias','Materias/AdministrarMaterias/',1,1,'2016-11-21 11:05:44'),
(6,'Alumnos','Alumnos/Administrar/',1,1,'2016-11-21 11:05:44'),
(7,'Períodos','',1,1,'2016-11-21 11:05:44'),
(8,'Aranceles','',1,1,'2016-11-21 11:05:44'),
(9,'Ver Usuarios','',2,1,'2017-01-26 16:59:01'),
(10,'Agregar Usuarios','',2,1,'2017-01-26 16:59:01'),
(11,'Editar Usuarios','',2,1,'2017-01-26 16:59:01'),
(12,'Eliminar Usuarios','',2,1,'2017-01-26 16:59:01'),
(13,'Ver Año','',2,1,'2017-01-26 17:04:47'),
(14,'Agregar Año','',2,1,'2017-01-26 17:04:47'),
(15,'Editar Año','',2,1,'2017-01-26 17:04:47'),
(16,'Eliminar Año','',2,1,'2017-01-26 17:04:47'),
(17,'Reporte Usuarios','',1,4,'2017-01-27 14:48:05'),
(18,'Reporte Secciones','',1,4,'2017-01-27 14:48:05'),
(19,'Reporte Docentes','',1,4,'2017-01-27 14:48:05'),
(20,'Reporte Materias','',1,4,'2017-01-27 14:48:05'),
(21,'Mi Perfil','',1,2,'2017-01-27 15:00:26'),
(22,'Materias','',1,2,'2017-01-27 15:00:26'),
(24,'Inscribir Alumnos','Inscripciones/InscribirAlumnos/',1,6,'2017-03-06 15:14:21');

/*Table structure for table `adm_modulo_opcion_usuario` */

DROP TABLE IF EXISTS `adm_modulo_opcion_usuario`;

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

/*Data for the table `adm_modulo_opcion_usuario` */

insert  into `adm_modulo_opcion_usuario`(`id_opcion_usuario`,`id_usuario`,`id_modulo_opcion`,`puede_ver`,`puede_agregar`,`puede_editar`,`puede_eliminar`) values 
(1,1,1,'\0','\0','\0','\0'),
(2,1,2,'\0','\0','\0','\0'),
(4,1,3,'\0','\0','\0','\0');

/*Table structure for table `adm_municipio` */

DROP TABLE IF EXISTS `adm_municipio`;

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

/*Data for the table `adm_municipio` */

insert  into `adm_municipio`(`id_municipio`,`municipio_nombre`,`id_departamento`,`fecha_creacion`,`id_usuario`) values 
(1,'Ahuachapán',1,'2017-03-01 11:15:28',1),
(2,'Jujutla',1,'2017-03-01 11:15:28',1),
(3,'Atiquizaya',1,'2017-03-01 11:15:28',1),
(4,'Concepción de Ataco',1,'2017-03-01 11:15:28',1),
(5,'El Refugio',1,'2017-03-01 11:15:28',1),
(6,'Guaymango',1,'2017-03-01 11:15:28',1),
(7,'Apaneca',1,'2017-03-01 11:15:28',1),
(8,'San Francisco Menéndez',1,'2017-03-01 11:15:28',1),
(9,'San Lorenzo',1,'2017-03-01 11:15:28',1),
(10,'San Pedro Puxtla',1,'2017-03-01 11:15:28',1),
(11,'Tacuba',1,'2017-03-01 11:15:28',1),
(12,'Turín',1,'2017-03-01 11:15:28',1),
(13,'Cinquera',2,'2017-03-01 11:15:28',1),
(14,'Villa Dolores',2,'2017-03-01 11:15:28',1),
(15,'Guacotecti',2,'2017-03-01 11:15:28',1),
(16,'Ilobasco',2,'2017-03-01 11:15:28',1),
(17,'Jutiapa',2,'2017-03-01 11:15:28',1),
(18,'San Isidro',2,'2017-03-01 11:15:28',1),
(19,'Sensuntepeque',2,'2017-03-01 11:15:28',1),
(20,'Ciudad de Tejutepeque',2,'2017-03-01 11:15:28',1),
(21,'Victoria',2,'2017-03-01 11:15:28',1),
(22,'Agua Caliente',3,'2017-03-01 11:15:28',1),
(23,'Arcatao',3,'2017-03-01 11:15:28',1),
(24,'Azacualpa',3,'2017-03-01 11:15:28',1),
(25,'Chalatenango',3,'2017-03-01 11:15:28',1),
(26,'Citalá',3,'2017-03-01 11:15:28',1),
(27,'Comalapa',3,'2017-03-01 11:15:28',1),
(28,'Concepción Quezaltepeque',3,'2017-03-01 11:15:28',1),
(29,'Dulce Nombre de María',3,'2017-03-01 11:15:28',1),
(30,'El Carrizal',3,'2017-03-01 11:15:28',1),
(31,'El Paraíso',3,'2017-03-01 11:15:28',1),
(32,'La Laguna',3,'2017-03-01 11:15:28',1),
(33,'La Palma',3,'2017-03-01 11:15:28',1),
(34,'La Reina',3,'2017-03-01 11:15:28',1),
(35,'Las Vueltas',3,'2017-03-01 11:15:28',1),
(36,'Nombre de Jesús',3,'2017-03-01 11:15:28',1),
(37,'Nueva Concepción',3,'2017-03-01 11:15:28',1),
(38,'Nueva Trinidad',3,'2017-03-01 11:15:28',1),
(39,'Ojos de Agua',3,'2017-03-01 11:15:28',1),
(40,'Potonico',3,'2017-03-01 11:15:28',1),
(41,'San Antonio de la Cruz',3,'2017-03-01 11:15:28',1),
(42,'San Antonio Los Ranchos',3,'2017-03-01 11:15:28',1),
(43,'San Fernando',3,'2017-03-01 11:15:28',1),
(44,'San Francisco Lempa',3,'2017-03-01 11:15:28',1),
(45,'San Francisco Morazán',3,'2017-03-01 11:15:28',1),
(46,'San Ignacio',3,'2017-03-01 11:15:28',1),
(47,'San Isidro Labrador',3,'2017-03-01 11:15:28',1),
(48,'San José Cancasque',3,'2017-03-01 11:15:28',1),
(49,'San José Las Flores',3,'2017-03-01 11:15:28',1),
(50,'San Luis del Carmen',3,'2017-03-01 11:15:28',1),
(51,'San Miguel de Mercedes',3,'2017-03-01 11:15:28',1),
(52,'San Rafael',3,'2017-03-01 11:15:28',1),
(53,'Santa Rita',3,'2017-03-01 11:15:28',1),
(54,'Tejutla',3,'2017-03-01 11:15:28',1),
(55,'Candelaria',4,'2017-03-01 11:15:28',1),
(56,'Cojutepeque',4,'2017-03-01 11:15:28',1),
(57,'El Carmen',4,'2017-03-01 11:15:28',1),
(58,'El Rosario',4,'2017-03-01 11:15:28',1),
(59,'Monte San Juan',4,'2017-03-01 11:15:28',1),
(60,'Oratorio de Concepción',4,'2017-03-01 11:15:28',1),
(61,'San Bartolomé Perulapía',4,'2017-03-01 11:15:28',1),
(62,'San Cristóbal',4,'2017-03-01 11:15:28',1),
(63,'San José Guayabal',4,'2017-03-01 11:15:28',1),
(64,'San Pedro Perulapán',4,'2017-03-01 11:15:28',1),
(65,'San Rafael Cedros',4,'2017-03-01 11:15:28',1),
(66,'San Ramón',4,'2017-03-01 11:15:28',1),
(67,'Santa Cruz Analquito',4,'2017-03-01 11:15:28',1),
(68,'Santa Cruz Michapa',4,'2017-03-01 11:15:28',1),
(69,'Suchitoto',4,'2017-03-01 11:15:28',1),
(70,'Tenancingo',4,'2017-03-01 11:15:28',1),
(71,'Antiguo Cuscatlán',5,'2017-03-01 11:15:28',1),
(72,'Chiltiupán',5,'2017-03-01 11:15:28',1),
(73,'Ciudad Arce',5,'2017-03-01 11:15:28',1),
(74,'Colón',5,'2017-03-01 11:15:28',1),
(75,'Comasagua',5,'2017-03-01 11:15:28',1),
(76,'Huizúcar',5,'2017-03-01 11:15:28',1),
(77,'Jayaque',5,'2017-03-01 11:15:28',1),
(78,'Jicalapa',5,'2017-03-01 11:15:28',1),
(79,'La Libertad',5,'2017-03-01 11:15:28',1),
(80,'Nueva San Salvador',5,'2017-03-01 11:15:28',1),
(81,'Nuevo Cuscatlán',5,'2017-03-01 11:15:28',1),
(82,'Opico',5,'2017-03-01 11:15:28',1),
(83,'Quezaltepeque',5,'2017-03-01 11:15:28',1),
(84,'Sacacoyo',5,'2017-03-01 11:15:28',1),
(85,'San José Villanueva',5,'2017-03-01 11:15:28',1),
(86,'San Matías',5,'2017-03-01 11:15:28',1),
(87,'San Pablo Tacachico',5,'2017-03-01 11:15:28',1),
(88,'Talnique',5,'2017-03-01 11:15:28',1),
(89,'Tamanique',5,'2017-03-01 11:15:28',1),
(90,'Teotepeque',5,'2017-03-01 11:15:28',1),
(91,'Tepecoyo',5,'2017-03-01 11:15:28',1),
(92,'Zaragoza',5,'2017-03-01 11:15:28',1),
(93,'Cuyultitán',6,'2017-03-01 11:15:28',1),
(94,'El Rosario',6,'2017-03-01 11:15:28',1),
(95,'Jerusalén',6,'2017-03-01 11:15:28',1),
(96,'Mercedes La Ceiba',6,'2017-03-01 11:15:28',1),
(97,'Olocuilta',6,'2017-03-01 11:15:28',1),
(98,'Paraíso de Osorio',6,'2017-03-01 11:15:28',1),
(99,'San Antonio Masahuat',6,'2017-03-01 11:15:28',1),
(100,'San Emigdio',6,'2017-03-01 11:15:28',1),
(101,'San Francisco Chinameca',6,'2017-03-01 11:15:28',1),
(102,'San Juan Nonualco',6,'2017-03-01 11:15:28',1),
(103,'San Juan Talpa',6,'2017-03-01 11:15:28',1),
(104,'San Juan Tepezontes',6,'2017-03-01 11:15:28',1),
(105,'San Luis La Herradura',6,'2017-03-01 11:15:28',1),
(106,'San Luis Talpa',6,'2017-03-01 11:15:28',1),
(107,'San Miguel Tepezontes',6,'2017-03-01 11:15:28',1),
(108,'San Pedro Masahuat',6,'2017-03-01 11:15:28',1),
(109,'San Pedro Nonualco',6,'2017-03-01 11:15:28',1),
(110,'San Rafael Obrajuelo',6,'2017-03-01 11:15:28',1),
(111,'Santa María Ostuma',6,'2017-03-01 11:15:28',1),
(112,'Santiago Nonualco',6,'2017-03-01 11:15:28',1),
(113,'Tapalhuaca',6,'2017-03-01 11:15:28',1),
(114,'Zacatecoluca',6,'2017-03-01 11:15:28',1),
(115,'Anamorós',7,'2017-03-01 11:15:28',1),
(116,'Bolívar',7,'2017-03-01 11:15:28',1),
(117,'Concepción de Oriente',7,'2017-03-01 11:15:28',1),
(118,'Conchagua',7,'2017-03-01 11:15:28',1),
(119,'El Carmen',7,'2017-03-01 11:15:28',1),
(120,'El Sauce',7,'2017-03-01 11:15:28',1),
(121,'Intipucá',7,'2017-03-01 11:15:28',1),
(122,'La Unión',7,'2017-03-01 11:15:28',1),
(123,'Lislique',7,'2017-03-01 11:15:28',1),
(124,'Meanguera del Golfo',7,'2017-03-01 11:15:28',1),
(125,'Nueva Esparta',7,'2017-03-01 11:15:28',1),
(126,'Pasaquina',7,'2017-03-01 11:15:28',1),
(127,'Polorós',7,'2017-03-01 11:15:28',1),
(128,'San Alejo',7,'2017-03-01 11:15:28',1),
(129,'San José',7,'2017-03-01 11:15:28',1),
(130,'Santa Rosa de Lima',7,'2017-03-01 11:15:28',1),
(131,'Yayantique',7,'2017-03-01 11:15:28',1),
(132,'Yucuayquín',7,'2017-03-01 11:15:28',1),
(133,'Arambala',8,'2017-03-01 11:15:28',1),
(134,'Cacaopera',8,'2017-03-01 11:15:28',1),
(135,'Chilanga',8,'2017-03-01 11:15:28',1),
(136,'Corinto',8,'2017-03-01 11:15:28',1),
(137,'Delicias de Concepción',8,'2017-03-01 11:15:28',1),
(138,'El Divisadero',8,'2017-03-01 11:15:28',1),
(139,'El Rosario',8,'2017-03-01 11:15:28',1),
(140,'Gualococti',8,'2017-03-01 11:15:28',1),
(141,'Guatajiagua',8,'2017-03-01 11:15:28',1),
(142,'Joateca',8,'2017-03-01 11:15:28',1),
(143,'Jocoaitique',8,'2017-03-01 11:15:28',1),
(144,'Jocoro',8,'2017-03-01 11:15:28',1),
(145,'Lolotiquillo',8,'2017-03-01 11:15:28',1),
(146,'Meanguera',8,'2017-03-01 11:15:28',1),
(147,'Osicala',8,'2017-03-01 11:15:28',1),
(148,'Perquín',8,'2017-03-01 11:15:28',1),
(149,'San Carlos',8,'2017-03-01 11:15:28',1),
(150,'San Fernando',8,'2017-03-01 11:15:28',1),
(151,'San Francisco Gotera',8,'2017-03-01 11:15:28',1),
(152,'San Isidro',8,'2017-03-01 11:15:28',1),
(153,'San Simón',8,'2017-03-01 11:15:28',1),
(154,'Sensembra',8,'2017-03-01 11:15:28',1),
(155,'Sociedad',8,'2017-03-01 11:15:28',1),
(156,'Torola',8,'2017-03-01 11:15:28',1),
(157,'Yamabal',8,'2017-03-01 11:15:28',1),
(158,'Yoloaiquín',8,'2017-03-01 11:15:28',1),
(159,'Carolina',9,'2017-03-01 11:15:28',1),
(160,'Chapeltique',9,'2017-03-01 11:15:28',1),
(161,'Chinameca',9,'2017-03-01 11:15:28',1),
(162,'Chirilagua',9,'2017-03-01 11:15:28',1),
(163,'Ciudad Barrios',9,'2017-03-01 11:15:28',1),
(164,'Comacarán',9,'2017-03-01 11:15:28',1),
(165,'El Tránsito',9,'2017-03-01 11:15:28',1),
(166,'Lolotique',9,'2017-03-01 11:15:28',1),
(167,'Moncagua',9,'2017-03-01 11:15:28',1),
(168,'Nueva Guadalupe',9,'2017-03-01 11:15:28',1),
(169,'Nuevo Edén de San Juan',9,'2017-03-01 11:15:28',1),
(170,'Quelepa',9,'2017-03-01 11:15:28',1),
(171,'San Antonio',9,'2017-03-01 11:15:28',1),
(172,'San Gerardo',9,'2017-03-01 11:15:28',1),
(173,'San Jorge',9,'2017-03-01 11:15:28',1),
(174,'San Luis de la Reina',9,'2017-03-01 11:15:28',1),
(175,'San Miguel',9,'2017-03-01 11:15:28',1),
(176,'San Rafael',9,'2017-03-01 11:15:28',1),
(177,'Sesori',9,'2017-03-01 11:15:28',1),
(178,'Uluazapa',9,'2017-03-01 11:15:28',1),
(179,'Aguilares',10,'2017-03-01 11:15:28',1),
(180,'Apopa',10,'2017-03-01 11:15:28',1),
(181,'Ayutuxtepeque',10,'2017-03-01 11:15:28',1),
(182,'Cuscatancingo',10,'2017-03-01 11:15:28',1),
(183,'Delgado',10,'2017-03-01 11:15:28',1),
(184,'El Paisnal',10,'2017-03-01 11:15:28',1),
(185,'Guazapa',10,'2017-03-01 11:15:28',1),
(186,'Ilopango',10,'2017-03-01 11:15:28',1),
(187,'Mejicanos',10,'2017-03-01 11:15:28',1),
(188,'Nejapa',10,'2017-03-01 11:15:28',1),
(189,'Panchimalco',10,'2017-03-01 11:15:28',1),
(190,'Rosario de Mora',10,'2017-03-01 11:15:28',1),
(191,'San Marcos',10,'2017-03-01 11:15:28',1),
(192,'San Martín',10,'2017-03-01 11:15:28',1),
(193,'San Salvador',10,'2017-03-01 11:15:28',1),
(194,'Santiago Texacuangos',10,'2017-03-01 11:15:28',1),
(195,'Santo Tomás',10,'2017-03-01 11:15:28',1),
(196,'Soyapango',10,'2017-03-01 11:15:28',1),
(197,'Tonacatepeque',10,'2017-03-01 11:15:28',1),
(198,'Apastepeque',11,'2017-03-01 11:15:28',1),
(199,'Guadalupe',11,'2017-03-01 11:15:28',1),
(200,'San Cayetano Istepeque',11,'2017-03-01 11:15:28',1),
(201,'San Esteban Catarina',11,'2017-03-01 11:15:28',1),
(202,'San Ildefonso',11,'2017-03-01 11:15:28',1),
(203,'San Lorenzo',11,'2017-03-01 11:15:28',1),
(204,'San Sebastián',11,'2017-03-01 11:15:28',1),
(205,'Santa Clara',11,'2017-03-01 11:15:28',1),
(206,'Santo Domingo',11,'2017-03-01 11:15:28',1),
(207,'San Vicente',11,'2017-03-01 11:15:28',1),
(208,'Tecoluca',11,'2017-03-01 11:15:28',1),
(209,'Tepetitán',11,'2017-03-01 11:15:28',1),
(210,'Verapaz',11,'2017-03-01 11:15:28',1),
(211,'Candelaria de la Frontera',12,'2017-03-01 11:15:28',1),
(212,'Chalchuapa',12,'2017-03-01 11:15:28',1),
(213,'Coatepeque',12,'2017-03-01 11:15:28',1),
(214,'El Congo',12,'2017-03-01 11:15:28',1),
(215,'El Porvenir',12,'2017-03-01 11:15:28',1),
(216,'Masahuat',12,'2017-03-01 11:15:28',1),
(217,'Metapán',12,'2017-03-01 11:15:28',1),
(218,'San Antonio Pajonal',12,'2017-03-01 11:15:28',1),
(219,'San Sebastián Salitrillo',12,'2017-03-01 11:15:28',1),
(220,'Santa Ana',12,'2017-03-01 11:15:28',1),
(221,'Santa Rosa Guachipilín',12,'2017-03-01 11:15:28',1),
(222,'Santiago de la Frontera',12,'2017-03-01 11:15:28',1),
(223,'Texistepeque',12,'2017-03-01 11:15:28',1),
(224,'Acajutla',13,'2017-03-01 11:15:28',1),
(225,'Armenia',13,'2017-03-01 11:15:28',1),
(226,'Caluco',13,'2017-03-01 11:15:28',1),
(227,'Cuisnahuat',13,'2017-03-01 11:15:28',1),
(228,'Izalco',13,'2017-03-01 11:15:28',1),
(229,'Juayúa',13,'2017-03-01 11:15:28',1),
(230,'Nahuizalco',13,'2017-03-01 11:15:28',1),
(231,'Nahulingo',13,'2017-03-01 11:15:28',1),
(232,'Salcoatitán',13,'2017-03-01 11:15:28',1),
(233,'San Antonio del Monte',13,'2017-03-01 11:15:28',1),
(234,'San Julián',13,'2017-03-01 11:15:28',1),
(235,'Santa Catarina Masahuat',13,'2017-03-01 11:15:28',1),
(236,'Santa Isabel Ishuatán',13,'2017-03-01 11:15:28',1),
(237,'Santo Domingo',13,'2017-03-01 11:15:28',1),
(238,'Sonsonate',13,'2017-03-01 11:15:28',1),
(239,'Sonzacate',13,'2017-03-01 11:15:28',1),
(240,'Alegría',14,'2017-03-01 11:15:28',1),
(241,'Berlín',14,'2017-03-01 11:15:28',1),
(242,'California',14,'2017-03-01 11:15:28',1),
(243,'Concepción Batres',14,'2017-03-01 11:15:28',1),
(244,'El Triunfo',14,'2017-03-01 11:15:28',1),
(245,'Ereguayquín',14,'2017-03-01 11:15:28',1),
(246,'Estanzuelas',14,'2017-03-01 11:15:28',1),
(247,'Jiquilisco',14,'2017-03-01 11:15:28',1),
(248,'Jucuapa',14,'2017-03-01 11:15:28',1),
(249,'Jucuarán',14,'2017-03-01 11:15:28',1),
(250,'Mercedes Umaña',14,'2017-03-01 11:15:28',1),
(251,'Nueva Granada',14,'2017-03-01 11:15:28',1),
(252,'Ozatlán',14,'2017-03-01 11:15:28',1),
(253,'Puerto El Triunfo',14,'2017-03-01 11:15:28',1),
(254,'San Agustín',14,'2017-03-01 11:15:28',1),
(255,'San Buenaventura',14,'2017-03-01 11:15:28',1),
(256,'San Dionisio',14,'2017-03-01 11:15:28',1),
(257,'San Francisco Javier',14,'2017-03-01 11:15:28',1),
(258,'Santa Elena',14,'2017-03-01 11:15:28',1),
(259,'Santa María',14,'2017-03-01 11:15:28',1),
(260,'Santiago de María',14,'2017-03-01 11:15:28',1),
(261,'Tecapán',14,'2017-03-01 11:15:28',1),
(262,'Usulután',14,'2017-03-01 11:15:28',1);

/*Table structure for table `adm_rol` */

DROP TABLE IF EXISTS `adm_rol`;

CREATE TABLE `adm_rol` (
  `id_rol` int(11) NOT NULL COMMENT 'llave primaria no incremental',
  `rol_nombre` varchar(200) NOT NULL COMMENT 'nombre del roll',
  `rol_comentario` varchar(250) DEFAULT NULL COMMENT 'algun comentario para el rol',
  `rol_fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int(11) NOT NULL COMMENT 'llave foranea para relacionar con la tabla usuario, indice, usuario que creo el registro',
  PRIMARY KEY (`id_rol`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `adm_rol` */

insert  into `adm_rol`(`id_rol`,`rol_nombre`,`rol_comentario`,`rol_fecha_creacion`,`id_usuario`) values 
(1,'ADMINISTRADORES','NINGUNO','2017-01-18 15:22:24',1),
(2,'DONCENTES','NINGUNO','2017-01-26 16:30:40',1),
(3,'USUARIOS','NINGUNO','2017-01-26 16:31:28',1);

/*Table structure for table `adm_usuario` */

DROP TABLE IF EXISTS `adm_usuario`;

CREATE TABLE `adm_usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL COMMENT 'usuario con el cual se logueara',
  `nombres` varchar(100) NOT NULL COMMENT 'nombre ompleto del usuario',
  `apellidos` varchar(100) NOT NULL COMMENT 'apellidos del usuario',
  `clave` varchar(100) NOT NULL COMMENT 'contraseña con el cual se logueara el usuario',
  `usuario_estado` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'estado del usaurio, true activo, false inactivo',
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_rol` int(11) NOT NULL COMMENT 'llave foranera para relacionar con la tabla adm_rol, indice',
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `usuario` (`usuario`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`id_rol`) REFERENCES `adm_rol` (`id_rol`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `adm_usuario` */

insert  into `adm_usuario`(`id_usuario`,`usuario`,`nombres`,`apellidos`,`clave`,`usuario_estado`,`fecha_creacion`,`id_rol`) values 
(1,'mcruz','MARVIN GIANCARLO','CRUZ','a47c973cdb475cec9ad0d26e0891c43f',1,'2016-11-21 10:50:42',1),
(2,'giancarlos1029@hotmail.com','jovel','calin','1029',1,'2016-11-21 10:50:42',2),
(3,'cisco1099@gmail.com','','','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-02-22 09:41:03',1),
(4,'mari@gmail.com','','','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-02-22 09:48:17',2),
(5,'jualia@hotmail.com','','','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-02-22 10:32:38',2),
(6,'ustiel@hotmail.com','','','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-02-22 10:33:55',3),
(7,'moto@gmail.com','','','a47c973cdb475cec9ad0d26e0891c43f',0,'2017-02-22 10:53:14',2),
(8,'doromita@hotmail.com','','','a908fe24d47e1a411df45498b1459b26',1,'2017-02-22 11:10:05',2),
(9,'karlos@gmail.com','','','a47c973cdb475cec9ad0d26e0891c43f',0,'2017-02-24 10:12:02',3),
(10,'montiel@gmail.com','','','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-02-24 10:15:35',1),
(11,'rufiel@gmil.com','','','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-02-24 10:16:35',2),
(12,'krlo@gmail.com','','','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-02-24 10:19:04',2),
(13,'juliana@gmail.com','','','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-02-24 10:21:24',2),
(14,'mora@gmail.com','','','a47c973cdb475cec9ad0d26e0891c43f',0,'2017-02-24 10:31:08',1),
(15,'donoban@gmail.com','','','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-02-24 10:51:00',2),
(16,'delmonte@gmail.com','','','a47c973cdb475cec9ad0d26e0891c43f',0,'2017-02-24 10:52:47',2),
(17,'katarina@gmail.com','','','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-02-24 10:53:43',1),
(18,'prueba@gmail.com','','','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-02-24 14:20:38',1),
(19,'eliza@gmail.com','','','a47c973cdb475cec9ad0d26e0891c43f',0,'2017-02-24 15:45:24',1),
(20,'eustaquia@gmail.com','','','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-03-01 14:35:53',2),
(21,'okok@gmail.com','','','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-03-01 14:37:26',2),
(22,'jhil@gmail.com','','','a47c973cdb475cec9ad0d26e0891c43f',1,'2017-03-01 14:40:00',3);

/*!50106 set global event_scheduler = 1*/;

/* Event structure for event `evento_EjectuarPACrearAnnioLectivo` */

/*!50106 DROP EVENT IF EXISTS `evento_EjectuarPACrearAnnioLectivo`*/;

DELIMITER $$

/*!50106 CREATE DEFINER=`root`@`localhost` EVENT `evento_EjectuarPACrearAnnioLectivo` ON SCHEDULE EVERY 1 YEAR STARTS '2017-02-27 10:57:00' ON COMPLETION NOT PRESERVE ENABLE COMMENT 'Evento que ejecuta cada año el 31 de diciembre' DO begin
		  declare v_id_annio_lectivo int;
         select ifnull(max(id_annio_lectivo), 0) + 1 into v_id_annio_lectivo from adm_annio_lectivo;
		 insert into adm_annio_lectivo(id_annio_lectivo, annio, id_usuario)
         values (v_id_annio_lectivo, year(now()), 1); 
         
         -- actualizo el año anterior y lo pongo inactivo
         update adm_annio_lectivo set estado = 0 where annio = year(now()) - 1;
		 
	end */$$
DELIMITER ;

/* Function  structure for function  `GenerarCodigoAlumno` */

/*!50003 DROP FUNCTION IF EXISTS `GenerarCodigoAlumno` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `GenerarCodigoAlumno`() RETURNS varchar(6) CHARSET utf8
BEGIN

/*si la funcion retorno un NULL sigunifica que ya no hay codigos disponibles*/
DECLARE v_maximo_codigo int;
DECLARE v_valor_devolver VARCHAR(6);
DEClARE v_annio_lectivo int;

-- asigno a la variable v_annio_lectivo el año lectivo corresspondiente
select substr(annio, 3,2) /*desde la poscion 3 quiero 2 posiciones*/ 
	into v_annio_lectivo from adm_annio_lectivo  order by annio desc limit 1;

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

END */$$
DELIMITER ;

/* Procedure structure for procedure `pa_traer_roles` */

/*!50003 DROP PROCEDURE IF EXISTS  `pa_traer_roles` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_traer_roles`()
begin
	select id_rol, rol_nombre from adm_rol;
end */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
