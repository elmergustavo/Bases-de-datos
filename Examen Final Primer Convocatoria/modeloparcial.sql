-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: modeloparcial
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `detallefactura`
--

DROP TABLE IF EXISTS `detallefactura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallefactura` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Precio_id` int NOT NULL,
  `Factura_id` int NOT NULL,
  `Cantidad` float DEFAULT NULL,
  `PrecioEstudio` float DEFAULT NULL,
  `SubTotal` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Precio_has_Factura_Factura1_idx` (`Factura_id`),
  KEY `fk_Precio_has_Factura_Precio1_idx` (`Precio_id`),
  CONSTRAINT `fk_Precio_has_Factura_Factura1` FOREIGN KEY (`Factura_id`) REFERENCES `factura` (`id`),
  CONSTRAINT `fk_Precio_has_Factura_Precio1` FOREIGN KEY (`Precio_id`) REFERENCES `precio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallefactura`
--

LOCK TABLES `detallefactura` WRITE;
/*!40000 ALTER TABLE `detallefactura` DISABLE KEYS */;
INSERT INTO `detallefactura` VALUES (1,1,1,1,100,100),(2,3,2,2,100,200),(3,2,3,2,50,100),(4,13,3,1,50,50),(5,16,3,3,50,150),(6,17,4,1,100,100),(7,18,4,1,100,100),(8,19,4,2,100,200),(9,14,5,4,50,200),(10,15,5,6,50,300),(11,17,6,1,100,100),(12,5,7,1,100,100),(13,6,7,1,100,100),(14,3,8,3,100,300),(15,8,9,8,50,400),(16,9,10,1,100,100),(17,10,10,1,100,100),(18,11,10,2,100,200),(19,12,10,1,100,100),(20,15,11,6,50,300),(21,16,11,6,50,300),(22,1,12,7,100,700),(23,1,13,8,100,800),(24,3,14,9,100,900),(25,2,15,6,50,300),(26,3,15,4,100,400),(27,4,15,6,50,300);
/*!40000 ALTER TABLE `detallefactura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudio`
--

DROP TABLE IF EXISTS `estudio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `Grupo_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Estudio_Grupo1_idx` (`Grupo_id`),
  CONSTRAINT `fk_Estudio_Grupo1` FOREIGN KEY (`Grupo_id`) REFERENCES `grupo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudio`
--

LOCK TABLES `estudio` WRITE;
/*!40000 ALTER TABLE `estudio` DISABLE KEYS */;
INSERT INTO `estudio` VALUES (1,'Estudio A','',1),(2,'Estudio B','',2),(3,'Estudio C','',2),(4,'Estudio D','',3),(5,'Estudio E','',3),(6,'Estudio F','',4),(7,'Estudio G','',5),(8,'Estudio H','',5),(9,'Estudio I','',5),(10,'Estudio J','',5),(11,'Estudio K','',5),(12,'Estudio L','',2),(13,'Estudio M','',3),(14,'Estudio N','',3),(15,'Estudio O','',4),(16,'Estudio P','',5);
/*!40000 ALTER TABLE `estudio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `id` int NOT NULL AUTO_INCREMENT,
  `FechaHora` datetime DEFAULT NULL,
  `NoFactura` varchar(45) DEFAULT NULL,
  `Total` float DEFAULT NULL,
  `Credito` tinyint(1) DEFAULT NULL,
  `Impresa` tinyint(1) DEFAULT NULL,
  `Anulada` tinyint(1) DEFAULT NULL,
  `Paciente_id` int NOT NULL,
  `Talonario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Factura_Paciente1_idx` (`Paciente_id`),
  KEY `fk_Factura_Talonario1_idx` (`Talonario_id`),
  CONSTRAINT `fk_Factura_Paciente1` FOREIGN KEY (`Paciente_id`) REFERENCES `paciente` (`id`),
  CONSTRAINT `fk_Factura_Talonario1` FOREIGN KEY (`Talonario_id`) REFERENCES `talonario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (1,'2015-01-01 08:00:00','1',100,0,1,0,1,1),(2,'2015-01-01 15:00:00','2',200,0,1,0,2,1),(3,'2015-01-02 10:00:00','3',300,0,1,1,3,1),(4,'2015-02-02 08:00:00','4',400,0,1,0,3,1),(5,'2015-03-01 08:00:00','5',500,0,1,0,4,1),(6,'2015-05-01 08:00:00','1',100,0,1,0,5,2),(7,'2015-08-23 10:00:00','2',200,0,1,0,6,2),(8,'2015-10-01 08:00:00','3',300,0,1,0,2,2),(9,'2015-11-01 10:00:00','4',400,0,1,0,1,2),(10,'2016-01-01 23:55:00','5',500,0,1,1,3,2),(11,'2016-01-04 08:00:00','6',600,0,1,1,9,2),(12,'2016-02-05 08:00:00','7',700,0,1,0,9,2),(13,'2016-02-08 08:00:00','8',800,0,1,1,4,2),(14,'2016-03-01 08:00:00','9',900,0,1,0,5,2),(15,'2016-03-01 10:00:00','10',1000,0,1,0,5,2);
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES (1,'Grupo 1'),(2,'Grupo 2'),(3,'Grupo 3'),(4,'Grupo 4'),(5,'Grupo 5'),(6,'Grupo 6');
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informacion`
--

DROP TABLE IF EXISTS `informacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `informacion` (
  `id` int NOT NULL,
  `NombrePaciente` varchar(45) DEFAULT NULL,
  `ApellidoPaciente` varchar(45) DEFAULT NULL,
  `Usuario` varchar(45) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Accion` varchar(45) DEFAULT NULL,
  `Paciente_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Informacion_Paciente1_idx` (`Paciente_id`),
  CONSTRAINT `fk_Informacion_Paciente1` FOREIGN KEY (`Paciente_id`) REFERENCES `paciente` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informacion`
--

LOCK TABLES `informacion` WRITE;
/*!40000 ALTER TABLE `informacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `informacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Apellido` varchar(45) DEFAULT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  `Nit` varchar(15) DEFAULT NULL,
  `Usuario` varchar(50) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (1,'Lucia ','Alvarado','Quetzaltenango','',NULL,NULL),(2,'Fernando','Estrada','Guatemala','',NULL,NULL),(3,'María Cristina','de León','Quetzaltenango','',NULL,NULL),(4,'Guillermo','Arana','Quetzalatenango',NULL,NULL,NULL),(5,'Karina','de León','San Marcos',NULL,NULL,NULL),(6,'Jorge','de León','San Marcos',NULL,NULL,NULL),(7,'Fernanda','Miranda','Quetzaltenango',NULL,NULL,NULL),(8,'Sonia','Fuentes','San Marcos',NULL,NULL,NULL),(9,'Sebastian','Cano','San Marcos',NULL,NULL,NULL),(10,'Edwin','Morales','Guatemala',NULL,NULL,NULL),(12,'Gustavo','PU','Escuintla','dsfdf',NULL,NULL),(20,'Dana ','Fuentes','Quetzaltenango',NULL,NULL,NULL),(27,'Gustavito','pu','Quetzaltenango',NULL,'root@localhost',NULL),(28,'nuevo','DFDF','SDFSDF','DFS','root@localhost','2020-05-03 15:02:57'),(29,'dfsdf','kjjl','kjkl','kl','root@localhost','2020-05-03 00:00:00');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `precio`
--

DROP TABLE IF EXISTS `precio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `precio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `NombrePrecio` varchar(45) DEFAULT NULL,
  `Precio` float DEFAULT NULL,
  `Estudio_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Precio_Estudio1_idx` (`Estudio_id`),
  CONSTRAINT `fk_Precio_Estudio1` FOREIGN KEY (`Estudio_id`) REFERENCES `estudio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `precio`
--

LOCK TABLES `precio` WRITE;
/*!40000 ALTER TABLE `precio` DISABLE KEYS */;
INSERT INTO `precio` VALUES (1,'A',100,1),(2,'B',50,1),(3,'A',100,2),(4,'B',50,2),(5,'A',100,3),(6,'A',100,4),(7,'A',100,5),(8,'B',50,5),(9,'A',100,6),(10,'A',100,7),(11,'A',100,8),(12,'A',100,9),(13,'B',50,10),(14,'B',50,11),(15,'B',50,12),(16,'B',50,13),(17,'A',100,14),(18,'A',100,15),(19,'A',100,16);
/*!40000 ALTER TABLE `precio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talonario`
--

DROP TABLE IF EXISTS `talonario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `talonario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Serie` varchar(5) DEFAULT NULL,
  `NoInicial` int DEFAULT NULL,
  `NoFinal` int DEFAULT NULL,
  `Correlativo` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talonario`
--

LOCK TABLES `talonario` WRITE;
/*!40000 ALTER TABLE `talonario` DISABLE KEYS */;
INSERT INTO `talonario` VALUES (1,'A',1,5,5),(2,'AA',1,100,10),(3,'Hola',4,5,6);
/*!40000 ALTER TABLE `talonario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono`
--

DROP TABLE IF EXISTS `telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefono` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Numero` varchar(10) DEFAULT NULL,
  `TipoTel_id` int NOT NULL,
  `Paciente_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Telefono_TipoTel_idx` (`TipoTel_id`),
  KEY `fk_Telefono_Paciente1_idx` (`Paciente_id`),
  CONSTRAINT `fk_Telefono_Paciente1` FOREIGN KEY (`Paciente_id`) REFERENCES `paciente` (`id`),
  CONSTRAINT `fk_Telefono_TipoTel` FOREIGN KEY (`TipoTel_id`) REFERENCES `tipotel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono`
--

LOCK TABLES `telefono` WRITE;
/*!40000 ALTER TABLE `telefono` DISABLE KEYS */;
INSERT INTO `telefono` VALUES (1,'11111111',1,1),(2,'22222222',1,2),(3,'33333333',1,3),(4,'44444444',3,2),(5,'55555555',1,4),(6,'66666666',1,5),(7,'77777777',2,6),(8,'88888888',2,7),(9,'99999999',1,9),(10,'10101010',2,3);
/*!40000 ALTER TABLE `telefono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipotel`
--

DROP TABLE IF EXISTS `tipotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipotel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipotel`
--

LOCK TABLES `tipotel` WRITE;
/*!40000 ALTER TABLE `tipotel` DISABLE KEYS */;
INSERT INTO `tipotel` VALUES (1,'Casa'),(2,'Celular'),(3,'Trabajo'),(4,'Pbx');
/*!40000 ALTER TABLE `tipotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'modeloparcial'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-05  8:33:15
