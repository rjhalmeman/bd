CREATE DATABASE  IF NOT EXISTS `SFM` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `SFM`;
-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: SFM
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.22.04.1

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
-- Table structure for table `Cargo`
--

DROP TABLE IF EXISTS `Cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cargo` (
  `idCargo` int NOT NULL AUTO_INCREMENT,
  `nomeCargo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCargo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cargo`
--

LOCK TABLES `Cargo` WRITE;
/*!40000 ALTER TABLE `Cargo` DISABLE KEYS */;
INSERT INTO `Cargo` VALUES (1,'Cabeleireiro(a)'),(2,'Gerente'),(3,'Auxiliar de limpeza');
/*!40000 ALTER TABLE `Cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cliente`
--

DROP TABLE IF EXISTS `Cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cliente` (
  `pessoaCpfPessoa` varchar(11) NOT NULL,
  PRIMARY KEY (`pessoaCpfPessoa`),
  CONSTRAINT `Cliente_ibfk_1` FOREIGN KEY (`pessoaCpfPessoa`) REFERENCES `Pessoa` (`cpfPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cliente`
--

LOCK TABLES `Cliente` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;
INSERT INTO `Cliente` VALUES ('222'),('444');
/*!40000 ALTER TABLE `Cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Funcionario`
--

DROP TABLE IF EXISTS `Funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Funcionario` (
  `pessoaCpfPessoa` varchar(11) NOT NULL,
  `cargoIdCargo` int DEFAULT NULL,
  PRIMARY KEY (`pessoaCpfPessoa`),
  KEY `cargoIdCargo` (`cargoIdCargo`),
  CONSTRAINT `Funcionario_ibfk_1` FOREIGN KEY (`pessoaCpfPessoa`) REFERENCES `Pessoa` (`cpfPessoa`),
  CONSTRAINT `Funcionario_ibfk_2` FOREIGN KEY (`cargoIdCargo`) REFERENCES `Cargo` (`idCargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Funcionario`
--

LOCK TABLES `Funcionario` WRITE;
/*!40000 ALTER TABLE `Funcionario` DISABLE KEYS */;
INSERT INTO `Funcionario` VALUES ('111',1),('333',1);
/*!40000 ALTER TABLE `Funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FuncionarioHasServico`
--

DROP TABLE IF EXISTS `FuncionarioHasServico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FuncionarioHasServico` (
  `funcionarioPessoaCpfPessoa` varchar(11) NOT NULL,
  `servicoIdServico` int NOT NULL,
  PRIMARY KEY (`funcionarioPessoaCpfPessoa`,`servicoIdServico`),
  KEY `servicoIdServico` (`servicoIdServico`),
  CONSTRAINT `FuncionarioHasServico_ibfk_1` FOREIGN KEY (`funcionarioPessoaCpfPessoa`) REFERENCES `Funcionario` (`pessoaCpfPessoa`),
  CONSTRAINT `FuncionarioHasServico_ibfk_2` FOREIGN KEY (`servicoIdServico`) REFERENCES `Servico` (`idServico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FuncionarioHasServico`
--

LOCK TABLES `FuncionarioHasServico` WRITE;
/*!40000 ALTER TABLE `FuncionarioHasServico` DISABLE KEYS */;
/*!40000 ALTER TABLE `FuncionarioHasServico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Horario`
--

DROP TABLE IF EXISTS `Horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Horario` (
  `siglaHorario` varchar(2) NOT NULL,
  `inicioHorario` varchar(6) DEFAULT NULL,
  `fimHorario` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`siglaHorario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Horario`
--

LOCK TABLES `Horario` WRITE;
/*!40000 ALTER TABLE `Horario` DISABLE KEYS */;
INSERT INTO `Horario` VALUES ('M1','08h','09h'),('M2','09h','10h'),('M3','10h','11h'),('M4','11h','12h'),('T1','13h','14h'),('T2','14h','15h'),('T3','15h','16h'),('T4','16h','17h'),('T5','17h','18h');
/*!40000 ALTER TABLE `Horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pessoa`
--

DROP TABLE IF EXISTS `Pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pessoa` (
  `cpfPessoa` varchar(11) NOT NULL,
  `nomePessoa` varchar(100) DEFAULT NULL,
  `contatoPessoa` varchar(100) DEFAULT NULL,
  `enderecoPessoa` varchar(255) DEFAULT NULL,
  `senhaPessoa` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cpfPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pessoa`
--

LOCK TABLES `Pessoa` WRITE;
/*!40000 ALTER TABLE `Pessoa` DISABLE KEYS */;
INSERT INTO `Pessoa` VALUES ('111','Jõao Primeiro ','44 999596998','lá longe','12345'),('222','Ana Segunda','44 99899966','mais longe ainda','abcdef'),('333','Maria Terceira Silva','44 44587225','mais longe ainda','abc123'),('444','Carlos Quarto','44 987458968','longe demais','321456');
/*!40000 ALTER TABLE `Pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reserva`
--

DROP TABLE IF EXISTS `Reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reserva` (
  `dataReserva` date NOT NULL,
  `horarioSiglaHorario` varchar(2) NOT NULL,
  `funcionarioPessoaCpfPessoa` varchar(11) NOT NULL,
  `servicoIdServico` int NOT NULL,
  `clientePessoaCpfPessoa` varchar(11) NOT NULL,
  PRIMARY KEY (`dataReserva`,`horarioSiglaHorario`,`funcionarioPessoaCpfPessoa`),
  KEY `horarioSiglaHorario` (`horarioSiglaHorario`),
  KEY `funcionarioPessoaCpfPessoa` (`funcionarioPessoaCpfPessoa`),
  KEY `servicoIdServico` (`servicoIdServico`),
  KEY `clientePessoaCpfPessoa` (`clientePessoaCpfPessoa`),
  CONSTRAINT `Reserva_ibfk_1` FOREIGN KEY (`horarioSiglaHorario`) REFERENCES `Horario` (`siglaHorario`),
  CONSTRAINT `Reserva_ibfk_2` FOREIGN KEY (`funcionarioPessoaCpfPessoa`) REFERENCES `Funcionario` (`pessoaCpfPessoa`),
  CONSTRAINT `Reserva_ibfk_3` FOREIGN KEY (`servicoIdServico`) REFERENCES `Servico` (`idServico`),
  CONSTRAINT `Reserva_ibfk_4` FOREIGN KEY (`clientePessoaCpfPessoa`) REFERENCES `Cliente` (`pessoaCpfPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reserva`
--

LOCK TABLES `Reserva` WRITE;
/*!40000 ALTER TABLE `Reserva` DISABLE KEYS */;
INSERT INTO `Reserva` VALUES ('2024-08-10','m1','111',1,'222'),('2024-08-11','m1','111',2,'444'),('2024-08-11','m2','111',2,'222');
/*!40000 ALTER TABLE `Reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Servico`
--

DROP TABLE IF EXISTS `Servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Servico` (
  `idServico` int NOT NULL AUTO_INCREMENT,
  `nomeServico` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idServico`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Servico`
--

LOCK TABLES `Servico` WRITE;
/*!40000 ALTER TABLE `Servico` DISABLE KEYS */;
INSERT INTO `Servico` VALUES (1,'corte masculino'),(2,'corte feminino'),(3,'pintura simples'),(4,'pintura especial');
/*!40000 ALTER TABLE `Servico` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-20  6:08:29
