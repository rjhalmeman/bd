CREATE DATABASE  IF NOT EXISTS `GerenciadorDeAmbientes` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `GerenciadorDeAmbientes`;
-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: GerenciadorDeAmbientes
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `Ambiente`
--

DROP TABLE IF EXISTS `Ambiente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ambiente` (
  `idAmbiente` varchar(20) NOT NULL,
  `nomeAmbiente` varchar(100) NOT NULL,
  `capacidade` int NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `idTipoAmbiente` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idAmbiente`),
  KEY `idTipoAmbiente` (`idTipoAmbiente`),
  CONSTRAINT `Ambiente_ibfk_1` FOREIGN KEY (`idTipoAmbiente`) REFERENCES `TipoAmbiente` (`idTipoAmbiente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ambiente`
--

LOCK TABLES `Ambiente` WRITE;
/*!40000 ALTER TABLE `Ambiente` DISABLE KEYS */;
INSERT INTO `Ambiente` VALUES ('AUD01','Auditório Principal',100,'Auditório com sistema de som','AUD'),('BIB01','Biblioteca Central',200,'Acervo de livros e periódicos','BIB'),('GIN01','Ginásio de Esportes',500,'Espaço para eventos esportivos','GIN'),('LAB01','Laboratório de Informática',30,'Equipado com 30 computadores','LAB'),('SALA01','Sala de Aula 101',40,'Sala equipada com projetor','SALA');
/*!40000 ALTER TABLE `Ambiente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Horario`
--

DROP TABLE IF EXISTS `Horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Horario` (
  `idHorario` varchar(3) NOT NULL,
  `nomeHorario` varchar(50) NOT NULL,
  `horaInicio` varchar(5) NOT NULL,
  `horaFim` varchar(5) NOT NULL,
  PRIMARY KEY (`idHorario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Horario`
--

LOCK TABLES `Horario` WRITE;
/*!40000 ALTER TABLE `Horario` DISABLE KEYS */;
INSERT INTO `Horario` VALUES ('M1','Manhã 1','08:00','10:00'),('M2','Manhã 2','10:00','12:00'),('N1','Noite 1','19:00','21:00'),('T1','Tarde 1','14:00','16:00'),('T2','Tarde 2','16:00','18:00');
/*!40000 ALTER TABLE `Horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pessoa`
--

DROP TABLE IF EXISTS `Pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pessoa` (
  `cpf` varchar(16) NOT NULL,
  `nomePessoa` varchar(60) NOT NULL,
  `dataNascimento` date NOT NULL,
  `senha` varchar(100) NOT NULL,
  `foto` blob,
  `idStatus` int DEFAULT NULL,
  PRIMARY KEY (`cpf`),
  KEY `idStatus` (`idStatus`),
  CONSTRAINT `Pessoa_ibfk_1` FOREIGN KEY (`idStatus`) REFERENCES `PessoaStatus` (`idStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pessoa`
--

LOCK TABLES `Pessoa` WRITE;
/*!40000 ALTER TABLE `Pessoa` DISABLE KEYS */;
INSERT INTO `Pessoa` VALUES ('1234567890123456','João Silva','1990-05-15','senha123',NULL,1),('2345678901234567','Maria Souza','1985-10-10','senha456',NULL,2),('3456789012345678','Carlos Oliveira','2000-01-20','senha789',NULL,3),('4567890123456789','Ana Costa','1995-08-25','senha101',NULL,1),('5678901234567890','Paulo Lima','1988-03-30','senha202',NULL,1);
/*!40000 ALTER TABLE `Pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PessoaStatus`
--

DROP TABLE IF EXISTS `PessoaStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PessoaStatus` (
  `idStatus` int NOT NULL AUTO_INCREMENT,
  `nomeStatus` varchar(50) NOT NULL,
  PRIMARY KEY (`idStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PessoaStatus`
--

LOCK TABLES `PessoaStatus` WRITE;
/*!40000 ALTER TABLE `PessoaStatus` DISABLE KEYS */;
INSERT INTO `PessoaStatus` VALUES (1,'Ativo'),(2,'Inativo'),(3,'Bloqueado'),(4,'Pendente'),(5,'Cancelado');
/*!40000 ALTER TABLE `PessoaStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reserva`
--

DROP TABLE IF EXISTS `Reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reserva` (
  `data` date NOT NULL,
  `idAmbiente` varchar(20) NOT NULL,
  `idHorario` varchar(3) NOT NULL,
  `cpf` varchar(16) NOT NULL,
  `obs` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`data`,`idAmbiente`,`idHorario`),
  KEY `idAmbiente` (`idAmbiente`),
  KEY `idHorario` (`idHorario`),
  KEY `cpf` (`cpf`),
  CONSTRAINT `Reserva_ibfk_1` FOREIGN KEY (`idAmbiente`) REFERENCES `Ambiente` (`idAmbiente`),
  CONSTRAINT `Reserva_ibfk_2` FOREIGN KEY (`idHorario`) REFERENCES `Horario` (`idHorario`),
  CONSTRAINT `Reserva_ibfk_3` FOREIGN KEY (`cpf`) REFERENCES `Pessoa` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reserva`
--

LOCK TABLES `Reserva` WRITE;
/*!40000 ALTER TABLE `Reserva` DISABLE KEYS */;
/*!40000 ALTER TABLE `Reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TipoAmbiente`
--

DROP TABLE IF EXISTS `TipoAmbiente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TipoAmbiente` (
  `idTipoAmbiente` varchar(15) NOT NULL,
  `nomeTipoAmbiente` varchar(50) NOT NULL,
  PRIMARY KEY (`idTipoAmbiente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TipoAmbiente`
--

LOCK TABLES `TipoAmbiente` WRITE;
/*!40000 ALTER TABLE `TipoAmbiente` DISABLE KEYS */;
INSERT INTO `TipoAmbiente` VALUES ('AUD','Auditório'),('BIB','Biblioteca'),('GIN','Ginásio'),('LAB','Laboratório'),('SALA','Sala de Aula');
/*!40000 ALTER TABLE `TipoAmbiente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TipoUsuario`
--

DROP TABLE IF EXISTS `TipoUsuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TipoUsuario` (
  `idTipoUsuario` int NOT NULL AUTO_INCREMENT,
  `nomeTipoUsuario` varchar(50) NOT NULL,
  PRIMARY KEY (`idTipoUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TipoUsuario`
--

LOCK TABLES `TipoUsuario` WRITE;
/*!40000 ALTER TABLE `TipoUsuario` DISABLE KEYS */;
INSERT INTO `TipoUsuario` VALUES (1,'Administrador'),(2,'Professor'),(3,'Aluno'),(4,'Visitante'),(5,'Manutenção');
/*!40000 ALTER TABLE `TipoUsuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuario` (
  `cpf` varchar(16) NOT NULL,
  `idTipoUsuario` int NOT NULL,
  `ativoBloqueado` tinyint(1) NOT NULL,
  PRIMARY KEY (`cpf`),
  KEY `idTipoUsuario` (`idTipoUsuario`),
  CONSTRAINT `Usuario_ibfk_1` FOREIGN KEY (`cpf`) REFERENCES `Pessoa` (`cpf`),
  CONSTRAINT `Usuario_ibfk_2` FOREIGN KEY (`idTipoUsuario`) REFERENCES `TipoUsuario` (`idTipoUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
INSERT INTO `Usuario` VALUES ('1234567890123456',1,0),('2345678901234567',2,1),('3456789012345678',3,0),('4567890123456789',4,0),('5678901234567890',5,0);
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-03  5:32:29
