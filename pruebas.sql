-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: Pruebas
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.20.04.2

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
-- Table structure for table `Paciente`
--

DROP TABLE IF EXISTS `Paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Paciente` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `PsicologoId` int NOT NULL,
  `Age` varchar(3) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Email` (`Email`),
  KEY `PsicologoId` (`PsicologoId`),
  CONSTRAINT `Paciente_ibfk_1` FOREIGN KEY (`PsicologoId`) REFERENCES `Psicologo` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Paciente`
--

LOCK TABLES `Paciente` WRITE;
/*!40000 ALTER TABLE `Paciente` DISABLE KEYS */;
INSERT INTO `Paciente` VALUES (5,'Testing','Testing@testing.comc',1,'22'),(8,'Testing','Testing@testing.comcb',1,'22'),(9,'daeadae','adsaeaewa',1,'23');
/*!40000 ALTER TABLE `Paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Psicologo`
--

DROP TABLE IF EXISTS `Psicologo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Psicologo` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Psicologo`
--

LOCK TABLES `Psicologo` WRITE;
/*!40000 ALTER TABLE `Psicologo` DISABLE KEYS */;
INSERT INTO `Psicologo` VALUES (1,'Alfredo Orozco','alfredo.orozco@academicos.udg.mx','1234');
/*!40000 ALTER TABLE `Psicologo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Resultado`
--

DROP TABLE IF EXISTS `Resultado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Resultado` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Respuesta` text NOT NULL,
  `PsicologoId` int NOT NULL,
  `PacienteId` int NOT NULL,
  `Puntaje` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `PsicologoId` (`PsicologoId`),
  KEY `PacienteId` (`PacienteId`),
  CONSTRAINT `Resultado_ibfk_1` FOREIGN KEY (`PsicologoId`) REFERENCES `Psicologo` (`Id`),
  CONSTRAINT `Resultado_ibfk_2` FOREIGN KEY (`PacienteId`) REFERENCES `Paciente` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Resultado`
--

LOCK TABLES `Resultado` WRITE;
/*!40000 ALTER TABLE `Resultado` DISABLE KEYS */;
INSERT INTO `Resultado` VALUES (1,'[{\"option\":\"Tristeza\",\"value\":1,\"index\":1},{\"option\":\"Pesimismo\",\"value\":1,\"index\":2},{\"option\":\"Fracaso\",\"value\":1,\"index\":3},{\"option\":\"Pérdida de Placer\",\"value\":1,\"index\":4},{\"option\":\"Sentimientos de Culpa\",\"value\":1,\"index\":5},{\"option\":\"Sentimientos de Castigo\",\"value\":1,\"index\":6},{\"option\":\"Disconformidad con uno mismo\",\"value\":1,\"index\":7},{\"option\":\"Autocrítica\",\"value\":1,\"index\":8},{\"option\":\"Pensamientos o Deseos Suicidas\",\"value\":1,\"index\":9},{\"option\":\"Llanto\",\"value\":1,\"index\":10},{\"option\":\"Agitación\",\"value\":1,\"index\":11},{\"option\":\"Pérdida de Interés\",\"value\":1,\"index\":12},{\"option\":\"Indecisión\",\"value\":1,\"index\":13},{\"option\":\"Desvalorización\",\"value\":1,\"index\":14},{\"option\":\"Pérdida de Energía\",\"value\":1,\"index\":15},{\"option\":\"Cambios en los Hábitos de Sueño\",\"value\":1,\"index\":16},{\"option\":\"Irritabilidad\",\"value\":1,\"index\":17},{\"option\":\"Cambios en el Apetito\",\"value\":1,\"index\":18},{\"option\":\"Dificultad de Concentración\",\"value\":1,\"index\":19},{\"option\":\"Cansancio o Fatiga\",\"value\":1,\"index\":20},{\"option\":\"Pérdida de Interés en el Sexo\",\"value\":1,\"index\":21}]',1,8,21),(2,'[{\"option\":\"Tristeza\",\"value\":1,\"index\":1},{\"option\":\"Pesimismo\",\"value\":1,\"index\":2},{\"option\":\"Fracaso\",\"value\":1,\"index\":3},{\"option\":\"Pérdida de Placer\",\"value\":1,\"index\":4},{\"option\":\"Sentimientos de Culpa\",\"value\":1,\"index\":5},{\"option\":\"Sentimientos de Castigo\",\"value\":1,\"index\":6},{\"option\":\"Disconformidad con uno mismo\",\"value\":1,\"index\":7},{\"option\":\"Autocrítica\",\"value\":1,\"index\":8},{\"option\":\"Pensamientos o Deseos Suicidas\",\"value\":1,\"index\":9},{\"option\":\"Llanto\",\"value\":1,\"index\":10},{\"option\":\"Agitación\",\"value\":1,\"index\":11},{\"option\":\"Pérdida de Interés\",\"value\":1,\"index\":12},{\"option\":\"Indecisión\",\"value\":1,\"index\":13},{\"option\":\"Desvalorización\",\"value\":1,\"index\":14},{\"option\":\"Pérdida de Energía\",\"value\":1,\"index\":15},{\"option\":\"Cambios en los Hábitos de Sueño\",\"value\":1,\"index\":16},{\"option\":\"Irritabilidad\",\"value\":1,\"index\":17},{\"option\":\"Cambios en el Apetito\",\"value\":1,\"index\":18},{\"option\":\"Dificultad de Concentración\",\"value\":1,\"index\":19},{\"option\":\"Cansancio o Fatiga\",\"value\":1,\"index\":20},{\"option\":\"Pérdida de Interés en el Sexo\",\"value\":1,\"index\":21}]',1,8,21),(3,'[{\"option\":\"Tristeza\",\"value\":1,\"index\":1},{\"option\":\"Pesimismo\",\"value\":1,\"index\":2},{\"option\":\"Fracaso\",\"value\":1,\"index\":3},{\"option\":\"Pérdida de Placer\",\"value\":1,\"index\":4},{\"option\":\"Sentimientos de Culpa\",\"value\":1,\"index\":5},{\"option\":\"Sentimientos de Castigo\",\"value\":1,\"index\":6},{\"option\":\"Disconformidad con uno mismo\",\"value\":1,\"index\":7},{\"option\":\"Autocrítica\",\"value\":1,\"index\":8},{\"option\":\"Pensamientos o Deseos Suicidas\",\"value\":1,\"index\":9},{\"option\":\"Llanto\",\"value\":1,\"index\":10},{\"option\":\"Agitación\",\"value\":1,\"index\":11},{\"option\":\"Pérdida de Interés\",\"value\":1,\"index\":12},{\"option\":\"Indecisión\",\"value\":1,\"index\":13},{\"option\":\"Desvalorización\",\"value\":1,\"index\":14},{\"option\":\"Pérdida de Energía\",\"value\":1,\"index\":15},{\"option\":\"Cambios en los Hábitos de Sueño\",\"value\":1,\"index\":16},{\"option\":\"Irritabilidad\",\"value\":1,\"index\":17},{\"option\":\"Cambios en el Apetito\",\"value\":1,\"index\":18},{\"option\":\"Dificultad de Concentración\",\"value\":1,\"index\":19},{\"option\":\"Cansancio o Fatiga\",\"value\":1,\"index\":20},{\"option\":\"Pérdida de Interés en el Sexo\",\"value\":1,\"index\":21}]',1,8,21),(4,'[{\"option\":\"Tristeza\",\"value\":1,\"index\":1},{\"option\":\"Pesimismo\",\"value\":1,\"index\":2},{\"option\":\"Fracaso\",\"value\":1,\"index\":3},{\"option\":\"Pérdida de Placer\",\"value\":1,\"index\":4},{\"option\":\"Sentimientos de Culpa\",\"value\":1,\"index\":5},{\"option\":\"Sentimientos de Castigo\",\"value\":1,\"index\":6},{\"option\":\"Disconformidad con uno mismo\",\"value\":1,\"index\":7},{\"option\":\"Autocrítica\",\"value\":1,\"index\":8},{\"option\":\"Pensamientos o Deseos Suicidas\",\"value\":1,\"index\":9},{\"option\":\"Llanto\",\"value\":1,\"index\":10},{\"option\":\"Agitación\",\"value\":1,\"index\":11},{\"option\":\"Pérdida de Interés\",\"value\":1,\"index\":12},{\"option\":\"Indecisión\",\"value\":1,\"index\":13},{\"option\":\"Desvalorización\",\"value\":1,\"index\":14},{\"option\":\"Pérdida de Energía\",\"value\":1,\"index\":15},{\"option\":\"Cambios en los Hábitos de Sueño\",\"value\":1,\"index\":16},{\"option\":\"Irritabilidad\",\"value\":1,\"index\":17},{\"option\":\"Cambios en el Apetito\",\"value\":1,\"index\":18},{\"option\":\"Dificultad de Concentración\",\"value\":1,\"index\":19},{\"option\":\"Cansancio o Fatiga\",\"value\":1,\"index\":20},{\"option\":\"Pérdida de Interés en el Sexo\",\"value\":2,\"index\":21}]',1,8,22),(5,'[{\"option\":\"Tristeza\",\"value\":3,\"index\":1},{\"option\":\"Pesimismo\",\"value\":3,\"index\":2},{\"option\":\"Fracaso\",\"value\":3,\"index\":3},{\"option\":\"Pérdida de Placer\",\"value\":3,\"index\":4},{\"option\":\"Sentimientos de Culpa\",\"value\":3,\"index\":5},{\"option\":\"Sentimientos de Castigo\",\"value\":3,\"index\":6},{\"option\":\"Disconformidad con uno mismo\",\"value\":3,\"index\":7},{\"option\":\"Autocrítica\",\"value\":3,\"index\":8},{\"option\":\"Pensamientos o Deseos Suicidas\",\"value\":3,\"index\":9},{\"option\":\"Llanto\",\"value\":3,\"index\":10},{\"option\":\"Agitación\",\"value\":3,\"index\":11},{\"option\":\"Pérdida de Interés\",\"value\":3,\"index\":12},{\"option\":\"Indecisión\",\"value\":3,\"index\":13},{\"option\":\"Desvalorización\",\"value\":3,\"index\":14},{\"option\":\"Pérdida de Energía\",\"value\":3,\"index\":15},{\"option\":\"Cambios en los Hábitos de Sueño\",\"value\":3,\"index\":16},{\"option\":\"Irritabilidad\",\"value\":3,\"index\":17},{\"option\":\"Cambios en el Apetito\",\"value\":3,\"index\":18},{\"option\":\"Dificultad de Concentración\",\"value\":3,\"index\":19},{\"option\":\"Cansancio o Fatiga\",\"value\":3,\"index\":20},{\"option\":\"Pérdida de Interés en el Sexo\",\"value\":3,\"index\":21}]',1,9,63);
/*!40000 ALTER TABLE `Resultado` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-24 16:11:09
