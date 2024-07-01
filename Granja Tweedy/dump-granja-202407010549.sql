-- MySQL dump 10.13  Distrib 8.0.38, for Linux (x86_64)
--
-- Host: localhost    Database: granja
-- ------------------------------------------------------
-- Server version	8.0.38

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
-- Table structure for table `CategoriaInsumo`
--
-- drop schema if exists granja;
CREATE schema granja;

use granja;

DROP TABLE IF EXISTS `CategoriaInsumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CategoriaInsumo` (
  `idCategoria` int NOT NULL,
  `nomeCategoria` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CategoriaInsumo`
--

LOCK TABLES `CategoriaInsumo` WRITE;
/*!40000 ALTER TABLE `CategoriaInsumo` DISABLE KEYS */;
INSERT INTO `CategoriaInsumo` VALUES (1,'Fixo');
INSERT INTO `CategoriaInsumo` VALUES (2,'Eventual');
/*!40000 ALTER TABLE `CategoriaInsumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cor`
--

DROP TABLE IF EXISTS `Cor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cor` (
  `idCor` varchar(1) NOT NULL,
  `nomeCor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idCor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cor`
--

LOCK TABLES `Cor` WRITE;
/*!40000 ALTER TABLE `Cor` DISABLE KEYS */;
INSERT INTO `Cor` VALUES ('1','Branco');
INSERT INTO `Cor` VALUES ('2','Amarelo');
INSERT INTO `Cor` VALUES ('3','Azul');
/*!40000 ALTER TABLE `Cor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Despesa`
--

DROP TABLE IF EXISTS `Despesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Despesa` (
  `dataDespesa` date NOT NULL,
  `idInsumo` int NOT NULL,
  `quantidade` int DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `funcionario_cpf` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dataLancamento` datetime DEFAULT CURRENT_TIMESTAMP,
  `subTotal` double GENERATED ALWAYS AS ((`quantidade` * `valor`)) VIRTUAL,
  PRIMARY KEY (`dataDespesa`,`idInsumo`),
  KEY `Despesa_Insumo_FK` (`idInsumo`),
  KEY `fk_Despesa_funcionario1_idx` (`funcionario_cpf`),
  CONSTRAINT `Despesa_Insumo_FK` FOREIGN KEY (`idInsumo`) REFERENCES `Insumo` (`idInsumo`),
  CONSTRAINT `fk_Despesa_funcionario1` FOREIGN KEY (`funcionario_cpf`) REFERENCES `Funcionario` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Despesa`
--

LOCK TABLES `Despesa` WRITE;
/*!40000 ALTER TABLE `Despesa` DISABLE KEYS */;
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-05-10',3,1,35,'111','2024-06-18 05:42:38');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-05-15',1,500,1500,'111','2024-06-18 05:42:38');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-01',1,50,10,'111','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-01',2,100,15,'222','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-02',3,5,20,'111','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-02',4,10,25,'222','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-03',5,20,30,'111','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-03',6,25,12,'222','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-04',7,15,18,'111','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-04',8,30,22,'222','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-05',9,40,11,'111','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-05',10,35,19,'222','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-06',11,45,21,'111','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-06',12,50,24,'222','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-07',13,55,17,'111','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-07',14,60,13,'222','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-08',15,65,14,'111','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-08',16,70,16,'222','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-09',17,75,28,'111','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-09',18,80,30,'222','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-10',19,85,27,'111','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-10',20,90,29,'222','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-11',21,95,31,'111','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-11',22,100,32,'222','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-12',23,105,33,'111','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-12',24,110,34,'222','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-13',25,115,35,'111','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-13',26,120,36,'222','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-14',27,125,37,'111','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-14',28,130,38,'222','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-15',1,550,1650,'111','2024-06-18 05:42:38');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-15',2,10,10,'222','2024-06-18 05:42:38');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-15',29,135,39,'111','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-15',30,140,40,'222','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-16',31,145,41,'111','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-16',32,150,42,'222','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-17',33,155,43,'111','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-17',34,160,44,'222','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-18',35,165,45,'111','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-18',36,170,46,'222','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-19',37,175,47,'111','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-19',38,180,48,'222','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-20',39,185,49,'111','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-20',40,10,50,'222','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-21',41,195,51,'111','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-21',42,200,52,'222','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-22',43,205,53,'111','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-22',44,210,54,'222','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-23',45,215,55,'111','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-23',46,220,56,'222','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-24',47,225,57,'111','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-24',48,230,58,'222','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-25',49,235,59,'111','2024-06-28 18:52:19');
INSERT INTO `Despesa` (`dataDespesa`, `idInsumo`, `quantidade`, `valor`, `funcionario_cpf`, `dataLancamento`) VALUES ('2024-06-25',50,240,60,'222','2024-06-28 18:52:19');
/*!40000 ALTER TABLE `Despesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ExemploDeViewEx01`
--

DROP TABLE IF EXISTS `ExemploDeViewEx01`;
/*!50001 DROP VIEW IF EXISTS `ExemploDeViewEx01`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ExemploDeViewEx01` AS SELECT 
 1 AS `TotalDeOvosProduzidos`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Funcionario`
--

DROP TABLE IF EXISTS `Funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Funcionario` (
  `cpf` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `salario_funcionario` double DEFAULT NULL,
  `data_admissao` date DEFAULT NULL,
  `data_rescisao` date DEFAULT NULL,
  PRIMARY KEY (`cpf`),
  CONSTRAINT `funcionario_pessoa_FK` FOREIGN KEY (`cpf`) REFERENCES `Pessoa` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Funcionario`
--

LOCK TABLES `Funcionario` WRITE;
/*!40000 ALTER TABLE `Funcionario` DISABLE KEYS */;
INSERT INTO `Funcionario` VALUES ('111',3000,'2000-05-13',NULL);
INSERT INTO `Funcionario` VALUES ('222',3200,'2000-03-05',NULL);
INSERT INTO `Funcionario` VALUES ('333',1500,'2009-10-15',NULL);
INSERT INTO `Funcionario` VALUES ('780',2000,'1999-12-10',NULL);
INSERT INTO `Funcionario` VALUES ('783',1600,'2008-11-01',NULL);
/*!40000 ALTER TABLE `Funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Insumo`
--

DROP TABLE IF EXISTS `Insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Insumo` (
  `idInsumo` int NOT NULL,
  `nomeInsumo` varchar(50) DEFAULT NULL,
  `quantidadeInsumo` varchar(100) DEFAULT NULL,
  `idCategoria` int DEFAULT NULL,
  `siglaUM` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`idInsumo`),
  KEY `Insumo_CategoriaInsumo_FK` (`idCategoria`),
  KEY `Insumo_UnidadeDeMedida_FK` (`siglaUM`),
  CONSTRAINT `Insumo_CategoriaInsumo_FK` FOREIGN KEY (`idCategoria`) REFERENCES `CategoriaInsumo` (`idCategoria`),
  CONSTRAINT `Insumo_UnidadeDeMedida_FK` FOREIGN KEY (`siglaUM`) REFERENCES `UnidadeDeMedida` (`siglaUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Insumo`
--

LOCK TABLES `Insumo` WRITE;
/*!40000 ALTER TABLE `Insumo` DISABLE KEYS */;
INSERT INTO `Insumo` VALUES (1,'Ração','500',1,'kg');
INSERT INTO `Insumo` VALUES (2,'Energia elétrica','3050',1,'kw');
INSERT INTO `Insumo` VALUES (3,'Cimento','3',2,'sc');
INSERT INTO `Insumo` VALUES (4,'Farinha de osso','100',1,'KG');
INSERT INTO `Insumo` VALUES (5,'Milho','200',1,'KG');
INSERT INTO `Insumo` VALUES (6,'Soja','150',1,'KG');
INSERT INTO `Insumo` VALUES (7,'Trigo','180',1,'KG');
INSERT INTO `Insumo` VALUES (8,'Cálcio','75',1,'KG');
INSERT INTO `Insumo` VALUES (9,'Farelo de trigo','90',1,'KG');
INSERT INTO `Insumo` VALUES (10,'Óleo de soja','60',1,'KG');
INSERT INTO `Insumo` VALUES (11,'Sal mineral','110',1,'KG');
INSERT INTO `Insumo` VALUES (12,'Premix vitamínico','50',1,'KG');
INSERT INTO `Insumo` VALUES (13,'Vitaminas','80',1,'KG');
INSERT INTO `Insumo` VALUES (14,'Antibióticos','30',2,'KG');
INSERT INTO `Insumo` VALUES (15,'Desinfetante','40',2,'UN');
INSERT INTO `Insumo` VALUES (16,'Insumo sanitário','20',2,'UN');
INSERT INTO `Insumo` VALUES (17,'Ladrilhos','50',1,'UN');
INSERT INTO `Insumo` VALUES (18,'Madeira','100',2,'UN');
INSERT INTO `Insumo` VALUES (19,'Pregos','200',1,'KG');
INSERT INTO `Insumo` VALUES (20,'Fios Elétricos','300',2,'M');
INSERT INTO `Insumo` VALUES (21,'Canos','150',1,'M');
INSERT INTO `Insumo` VALUES (22,'Válvulas','75',2,'UN');
INSERT INTO `Insumo` VALUES (23,'Bombas','50',1,'UN');
INSERT INTO `Insumo` VALUES (24,'Lâmpadas','500',2,'UN');
INSERT INTO `Insumo` VALUES (25,'Fertilizante','200',1,'KG');
INSERT INTO `Insumo` VALUES (26,'Herbicida','100',2,'L');
INSERT INTO `Insumo` VALUES (27,'Pesticida','50',1,'L');
INSERT INTO `Insumo` VALUES (28,'Sementes','30',2,'KG');
INSERT INTO `Insumo` VALUES (29,'Vacinas','200',1,'UN');
INSERT INTO `Insumo` VALUES (30,'Medicamentos','150',2,'UN');
INSERT INTO `Insumo` VALUES (31,'Suplementos','500',1,'KG');
INSERT INTO `Insumo` VALUES (32,'Vitaminas','300',2,'KG');
INSERT INTO `Insumo` VALUES (33,'Antibióticos','100',1,'UN');
INSERT INTO `Insumo` VALUES (34,'Desinfetante','200',2,'L');
INSERT INTO `Insumo` VALUES (35,'Lubrificante','300',1,'L');
INSERT INTO `Insumo` VALUES (36,'Ferramentas','100',2,'UN');
INSERT INTO `Insumo` VALUES (37,'Equipamentos de Proteção','50',1,'UN');
INSERT INTO `Insumo` VALUES (38,'Materiais de Limpeza','200',2,'UN');
INSERT INTO `Insumo` VALUES (39,'Tecidos','300',1,'M');
INSERT INTO `Insumo` VALUES (40,'Tintas','100',2,'L');
INSERT INTO `Insumo` VALUES (41,'Pincéis','150',1,'UN');
INSERT INTO `Insumo` VALUES (42,'Vernizes','50',2,'L');
INSERT INTO `Insumo` VALUES (43,'Solventes','200',1,'L');
INSERT INTO `Insumo` VALUES (44,'Parafusos','300',2,'KG');
INSERT INTO `Insumo` VALUES (45,'Porcas','100',1,'KG');
INSERT INTO `Insumo` VALUES (46,'Arruelas','200',2,'KG');
INSERT INTO `Insumo` VALUES (47,'Ferragens','300',1,'KG');
INSERT INTO `Insumo` VALUES (48,'Rodízios','100',2,'UN');
INSERT INTO `Insumo` VALUES (49,'Cabos','200',1,'M');
INSERT INTO `Insumo` VALUES (50,'Conexões','300',2,'UN');
/*!40000 ALTER TABLE `Insumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ObservacaoDespesa`
--

DROP TABLE IF EXISTS `ObservacaoDespesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ObservacaoDespesa` (
  `dataDespesa` date NOT NULL,
  `idInsumo` int NOT NULL,
  `observacaoDespesa` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`idInsumo`,`dataDespesa`),
  KEY `ObservacaoDespesa_Despesa_FK` (`dataDespesa`,`idInsumo`),
  CONSTRAINT `ObservacaoDespesa_Despesa_FK` FOREIGN KEY (`dataDespesa`, `idInsumo`) REFERENCES `Despesa` (`dataDespesa`, `idInsumo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ObservacaoDespesa`
--

LOCK TABLES `ObservacaoDespesa` WRITE;
/*!40000 ALTER TABLE `ObservacaoDespesa` DISABLE KEYS */;
INSERT INTO `ObservacaoDespesa` VALUES ('2024-05-10',3,'Para consertar piso de entrada');
INSERT INTO `ObservacaoDespesa` VALUES ('2024-06-07',14,'para combater surto de virose');
INSERT INTO `ObservacaoDespesa` VALUES ('2024-06-13',26,'para diminuir o mato próximo da granja');
INSERT INTO `ObservacaoDespesa` VALUES ('2024-06-20',40,'Pintura das cercas externas');
/*!40000 ALTER TABLE `ObservacaoDespesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pessoa`
--

DROP TABLE IF EXISTS `Pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pessoa` (
  `cpf` varchar(16) NOT NULL,
  `nome_pessoa` varchar(60) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  PRIMARY KEY (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pessoa`
--

LOCK TABLES `Pessoa` WRITE;
/*!40000 ALTER TABLE `Pessoa` DISABLE KEYS */;
INSERT INTO `Pessoa` VALUES ('111','Berzildo Créio','2004-07-09');
INSERT INTO `Pessoa` VALUES ('222','Berola da Silva','1990-10-28');
INSERT INTO `Pessoa` VALUES ('333','Creuzina Kreums','1998-10-02');
INSERT INTO `Pessoa` VALUES ('555','Kronos Antiguo Mitol','1970-03-15');
INSERT INTO `Pessoa` VALUES ('777','João Silva','1990-01-01');
INSERT INTO `Pessoa` VALUES ('778','Maria Oliveira','1991-02-02');
INSERT INTO `Pessoa` VALUES ('779','José Santos','1992-03-03');
INSERT INTO `Pessoa` VALUES ('780','Ana Souza','1993-04-04');
INSERT INTO `Pessoa` VALUES ('781','Pedro Costa','1994-05-05');
INSERT INTO `Pessoa` VALUES ('782','Paula Lima','1995-06-06');
INSERT INTO `Pessoa` VALUES ('783','Lucas Almeida','1996-07-07');
INSERT INTO `Pessoa` VALUES ('784','Juliana Pereira','1997-08-08');
INSERT INTO `Pessoa` VALUES ('785','Carlos Rodrigues','1998-09-09');
INSERT INTO `Pessoa` VALUES ('786','Fernanda Fernandes','1999-10-10');
INSERT INTO `Pessoa` VALUES ('787','Roberto Martins','1980-11-11');
INSERT INTO `Pessoa` VALUES ('788','Mariana Gonçalves','1981-12-12');
INSERT INTO `Pessoa` VALUES ('789','Bruno Barbosa','1982-01-13');
INSERT INTO `Pessoa` VALUES ('790','Aline Ribeiro','1983-02-14');
INSERT INTO `Pessoa` VALUES ('791','Renato Dias','1984-03-15');
INSERT INTO `Pessoa` VALUES ('792','Isabela Moreira','1985-04-16');
INSERT INTO `Pessoa` VALUES ('793','Ricardo Vieira','1986-05-17');
INSERT INTO `Pessoa` VALUES ('794','Gabriela Nascimento','1987-06-18');
INSERT INTO `Pessoa` VALUES ('795','Felipe Souza','1988-07-19');
INSERT INTO `Pessoa` VALUES ('796','Tatiana Silva','1989-08-20');
INSERT INTO `Pessoa` VALUES ('797','Eduardo Lima','1970-09-21');
INSERT INTO `Pessoa` VALUES ('798','Raquel Mendes','1971-10-22');
INSERT INTO `Pessoa` VALUES ('799','Adriano Gomes','1972-11-23');
INSERT INTO `Pessoa` VALUES ('800','Patrícia Araújo','1973-12-24');
INSERT INTO `Pessoa` VALUES ('801','Sérgio Rocha','1974-01-25');
INSERT INTO `Pessoa` VALUES ('802','Vanessa Ferreira','1975-02-26');
INSERT INTO `Pessoa` VALUES ('803','Marcelo Pinto','1976-03-27');
INSERT INTO `Pessoa` VALUES ('804','Larissa Campos','1977-04-28');
INSERT INTO `Pessoa` VALUES ('805','Fábio Teixeira','1978-05-29');
INSERT INTO `Pessoa` VALUES ('806','Renata Carvalho','1979-06-30');
/*!40000 ALTER TABLE `Pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Producao`
--

DROP TABLE IF EXISTS `Producao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Producao` (
  `data` date NOT NULL,
  `idProduto` smallint NOT NULL,
  `quantidade` int DEFAULT NULL,
  `precoNoDia` double DEFAULT NULL,
  `dataLancamento` datetime DEFAULT CURRENT_TIMESTAMP,
  `funcionario_cpf` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`data`,`idProduto`),
  KEY `producao_produto_FK` (`idProduto`),
  KEY `fk_Producao_funcionario1_idx` (`funcionario_cpf`),
  CONSTRAINT `fk_Producao_funcionario1` FOREIGN KEY (`funcionario_cpf`) REFERENCES `Funcionario` (`cpf`),
  CONSTRAINT `producao_produto_FK` FOREIGN KEY (`idProduto`) REFERENCES `Produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Producao`
--

LOCK TABLES `Producao` WRITE;
/*!40000 ALTER TABLE `Producao` DISABLE KEYS */;
INSERT INTO `Producao` VALUES ('2024-03-30',1,150,0.42,'2024-06-14 16:41:55','780');
INSERT INTO `Producao` VALUES ('2024-04-15',1,240,0.42,'2024-06-14 16:41:55','780');
INSERT INTO `Producao` VALUES ('2024-04-20',2,120,0.41,'2024-06-14 16:41:55','783');
INSERT INTO `Producao` VALUES ('2024-05-24',1,250,0.47,'2024-06-14 16:41:55','333');
INSERT INTO `Producao` VALUES ('2024-05-24',2,120,0.4,'2024-06-14 16:41:55','783');
INSERT INTO `Producao` VALUES ('2024-06-01',6,320,0.45,'2024-06-14 16:41:55','780');
INSERT INTO `Producao` VALUES ('2024-06-03',6,300,0.45,'2024-06-14 16:41:55','333');
INSERT INTO `Producao` VALUES ('2024-06-14',1,500,0.47,'2024-06-14 16:45:49','333');
INSERT INTO `Producao` VALUES ('2024-12-10',1,120,60,'2024-06-28 18:36:17','780');
INSERT INTO `Producao` VALUES ('2024-12-10',2,72,55,'2024-06-28 18:36:17','333');
INSERT INTO `Producao` VALUES ('2024-12-10',3,12,50,'2024-06-28 18:36:17','783');
INSERT INTO `Producao` VALUES ('2024-12-10',4,36,45,'2024-06-28 18:36:17','780');
INSERT INTO `Producao` VALUES ('2024-12-10',5,10,300,'2024-06-28 18:36:17','333');
INSERT INTO `Producao` VALUES ('2024-12-10',6,500,60,'2024-06-28 18:36:17','783');
INSERT INTO `Producao` VALUES ('2024-12-10',7,1000,55,'2024-06-28 18:36:17','780');
INSERT INTO `Producao` VALUES ('2024-12-10',11,500,60,'2024-06-28 18:36:17','333');
INSERT INTO `Producao` VALUES ('2024-12-10',12,400,60,'2024-06-28 18:36:17','783');
INSERT INTO `Producao` VALUES ('2024-12-10',13,300,35,'2024-06-28 18:36:17','780');
INSERT INTO `Producao` VALUES ('2024-12-11',14,250,25,'2024-06-28 18:36:17','333');
INSERT INTO `Producao` VALUES ('2024-12-11',15,200,25,'2024-06-28 18:36:17','783');
INSERT INTO `Producao` VALUES ('2024-12-11',16,150,25,'2024-06-28 18:36:17','780');
INSERT INTO `Producao` VALUES ('2024-12-11',17,100,720,'2024-06-28 18:36:17','333');
INSERT INTO `Producao` VALUES ('2024-12-11',18,80,720,'2024-06-28 18:36:17','783');
INSERT INTO `Producao` VALUES ('2024-12-11',19,60,720,'2024-06-28 18:36:17','780');
INSERT INTO `Producao` VALUES ('2024-12-11',20,500,800,'2024-06-28 18:36:17','333');
INSERT INTO `Producao` VALUES ('2024-12-12',1,120,60,'2024-06-28 18:36:37','780');
INSERT INTO `Producao` VALUES ('2024-12-12',2,72,55,'2024-06-28 18:36:37','333');
INSERT INTO `Producao` VALUES ('2024-12-12',3,12,50,'2024-06-28 18:36:37','783');
INSERT INTO `Producao` VALUES ('2024-12-12',4,36,45,'2024-06-28 18:36:37','780');
INSERT INTO `Producao` VALUES ('2024-12-12',5,10,300,'2024-06-28 18:36:37','333');
INSERT INTO `Producao` VALUES ('2024-12-12',6,500,60,'2024-06-28 18:36:37','783');
INSERT INTO `Producao` VALUES ('2024-12-12',7,1000,55,'2024-06-28 18:36:37','780');
INSERT INTO `Producao` VALUES ('2024-12-12',11,500,60,'2024-06-28 18:36:37','333');
INSERT INTO `Producao` VALUES ('2024-12-12',12,400,60,'2024-06-28 18:36:37','783');
INSERT INTO `Producao` VALUES ('2024-12-12',13,300,35,'2024-06-28 18:36:37','780');
INSERT INTO `Producao` VALUES ('2024-12-13',14,250,25,'2024-06-28 18:36:37','333');
INSERT INTO `Producao` VALUES ('2024-12-13',15,200,25,'2024-06-28 18:36:37','783');
INSERT INTO `Producao` VALUES ('2024-12-13',16,150,25,'2024-06-28 18:36:37','780');
INSERT INTO `Producao` VALUES ('2024-12-13',17,100,720,'2024-06-28 18:36:37','333');
INSERT INTO `Producao` VALUES ('2024-12-13',18,80,720,'2024-06-28 18:36:37','783');
INSERT INTO `Producao` VALUES ('2024-12-13',19,60,720,'2024-06-28 18:36:37','780');
INSERT INTO `Producao` VALUES ('2024-12-13',20,500,800,'2024-06-28 18:36:37','333');
INSERT INTO `Producao` VALUES ('2024-12-14',1,120,60,'2024-06-28 18:37:00','780');
INSERT INTO `Producao` VALUES ('2024-12-14',2,72,55,'2024-06-28 18:37:00','333');
INSERT INTO `Producao` VALUES ('2024-12-14',3,12,50,'2024-06-28 18:37:00','783');
INSERT INTO `Producao` VALUES ('2024-12-14',4,36,45,'2024-06-28 18:37:00','780');
INSERT INTO `Producao` VALUES ('2024-12-14',5,10,300,'2024-06-28 18:37:00','333');
INSERT INTO `Producao` VALUES ('2024-12-14',6,500,60,'2024-06-28 18:37:00','783');
INSERT INTO `Producao` VALUES ('2024-12-14',7,1000,55,'2024-06-28 18:37:00','780');
INSERT INTO `Producao` VALUES ('2024-12-14',11,500,60,'2024-06-28 18:37:00','333');
INSERT INTO `Producao` VALUES ('2024-12-14',12,400,60,'2024-06-28 18:37:00','783');
INSERT INTO `Producao` VALUES ('2024-12-14',13,300,35,'2024-06-28 18:37:00','780');
INSERT INTO `Producao` VALUES ('2024-12-15',14,250,25,'2024-06-28 18:37:00','333');
INSERT INTO `Producao` VALUES ('2024-12-15',15,200,25,'2024-06-28 18:37:00','783');
INSERT INTO `Producao` VALUES ('2024-12-15',16,150,25,'2024-06-28 18:37:00','780');
INSERT INTO `Producao` VALUES ('2024-12-15',17,100,720,'2024-06-28 18:37:00','333');
INSERT INTO `Producao` VALUES ('2024-12-15',18,80,720,'2024-06-28 18:37:00','783');
INSERT INTO `Producao` VALUES ('2024-12-15',19,60,720,'2024-06-28 18:37:00','780');
INSERT INTO `Producao` VALUES ('2024-12-15',20,500,800,'2024-06-28 18:37:00','333');
/*!40000 ALTER TABLE `Producao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Produto`
--

DROP TABLE IF EXISTS `Produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Produto` (
  `idProduto` smallint NOT NULL,
  `nomeProduto` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `estoqueProduto` int DEFAULT NULL,
  `siglaUM` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `idCor` varchar(1) DEFAULT NULL,
  `peso` int DEFAULT NULL,
  PRIMARY KEY (`idProduto`),
  KEY `produto_UnidadeDeMedida_FK` (`siglaUM`),
  KEY `Produto_Cor_FK` (`idCor`),
  CONSTRAINT `Produto_Cor_FK` FOREIGN KEY (`idCor`) REFERENCES `Cor` (`idCor`),
  CONSTRAINT `produto_UnidadeDeMedida_FK` FOREIGN KEY (`siglaUM`) REFERENCES `UnidadeDeMedida` (`siglaUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Produto`
--

LOCK TABLES `Produto` WRITE;
/*!40000 ALTER TABLE `Produto` DISABLE KEYS */;
INSERT INTO `Produto` VALUES (1,'Ovo Extra Grande',120,'UN','1',60);
INSERT INTO `Produto` VALUES (2,'Ovo Grande',72,'UN','1',55);
INSERT INTO `Produto` VALUES (3,'Ovo Médio',12,'un','1',50);
INSERT INTO `Produto` VALUES (4,'Ovo pequeno',36,'UN','1',45);
INSERT INTO `Produto` VALUES (5,'Ovo de codorna',10,'dz','3',300);
INSERT INTO `Produto` VALUES (6,'Ovo Extra Grande',500,'Un','2',60);
INSERT INTO `Produto` VALUES (7,'Ovo Grande',1000,'un','2',55);
INSERT INTO `Produto` VALUES (11,'Ovos de Galinha Branco Extra Grande',500,'BN','1',60);
INSERT INTO `Produto` VALUES (12,'Ovos de Galinha Amarelo Extra Grande',400,'BN','2',60);
INSERT INTO `Produto` VALUES (13,'Ovos de Galinha Azul Pequeno',300,'BN','3',35);
INSERT INTO `Produto` VALUES (14,'Ovos de Codorna Branco ',250,'DZ','1',25);
INSERT INTO `Produto` VALUES (15,'Ovos de Codorna Amarelo',200,'DZ','2',25);
INSERT INTO `Produto` VALUES (16,'Ovos de Codorna Azul',150,'DZ','3',25);
INSERT INTO `Produto` VALUES (17,'Caixa de Ovos de Galinha Branco',100,'UN','1',720);
INSERT INTO `Produto` VALUES (18,'Caixa de Ovos de Galinha Amarelo',80,'UN','2',720);
INSERT INTO `Produto` VALUES (19,'Caixa de Ovos de Galinha Azul',60,'UN','3',720);
INSERT INTO `Produto` VALUES (20,'Bandeja de Ovos Diversos',500,'BN','1',800);
/*!40000 ALTER TABLE `Produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `TesteJoin`
--

DROP TABLE IF EXISTS `TesteJoin`;
/*!50001 DROP VIEW IF EXISTS `TesteJoin`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `TesteJoin` AS SELECT 
 1 AS `idProduto`,
 1 AS `quantidade`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `UnidadeDeMedida`
--

DROP TABLE IF EXISTS `UnidadeDeMedida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UnidadeDeMedida` (
  `siglaUM` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'sigla da Unidade de Medida',
  `nomeUM` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`siglaUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UnidadeDeMedida`
--

LOCK TABLES `UnidadeDeMedida` WRITE;
/*!40000 ALTER TABLE `UnidadeDeMedida` DISABLE KEYS */;
INSERT INTO `UnidadeDeMedida` VALUES ('BN','Bandeja');
INSERT INTO `UnidadeDeMedida` VALUES ('DZ','Dúzia');
INSERT INTO `UnidadeDeMedida` VALUES ('KG','Quilograma');
INSERT INTO `UnidadeDeMedida` VALUES ('kw','Kilowatt/Hora');
INSERT INTO `UnidadeDeMedida` VALUES ('l','Litro');
INSERT INTO `UnidadeDeMedida` VALUES ('m','Metro');
INSERT INTO `UnidadeDeMedida` VALUES ('sc','Saco com 60 kg');
INSERT INTO `UnidadeDeMedida` VALUES ('UN','Unidade');
/*!40000 ALTER TABLE `UnidadeDeMedida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `bProducaoPorData`
--

DROP TABLE IF EXISTS `bProducaoPorData`;
/*!50001 DROP VIEW IF EXISTS `bProducaoPorData`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `bProducaoPorData` AS SELECT 
 1 AS `data`,
 1 AS `idProduto`,
 1 AS `quantidade`,
 1 AS `precoNoDia`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `cOvosDeUmTipoEmUmPeriodo`
--

DROP TABLE IF EXISTS `cOvosDeUmTipoEmUmPeriodo`;
/*!50001 DROP VIEW IF EXISTS `cOvosDeUmTipoEmUmPeriodo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cOvosDeUmTipoEmUmPeriodo` AS SELECT 
 1 AS `data`,
 1 AS `idProduto`,
 1 AS `quantidade`,
 1 AS `precoNoDia`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `dNovoExercicio`
--

DROP TABLE IF EXISTS `dNovoExercicio`;
/*!50001 DROP VIEW IF EXISTS `dNovoExercicio`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `dNovoExercicio` AS SELECT 
 1 AS `data`,
 1 AS `idProduto`,
 1 AS `quantidade`,
 1 AS `precoNoDia`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `eProducaoEmValores`
--

DROP TABLE IF EXISTS `eProducaoEmValores`;
/*!50001 DROP VIEW IF EXISTS `eProducaoEmValores`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `eProducaoEmValores` AS SELECT 
 1 AS `idProduto`,
 1 AS `nomeProduto`,
 1 AS `subtotal`*/;
SET character_set_client = @saved_cs_client;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-01  5:49:03
