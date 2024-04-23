CREATE DATABASE  IF NOT EXISTS `lojinha_do_salim_2024` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `lojinha_do_salim_2024`;
-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: lojinha_do_salim_2024
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo` (
  `id_cargo` int NOT NULL,
  `nome_cargo` varchar(45) NOT NULL,
  PRIMARY KEY (`id_cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'Proprietário'),(2,'Gerente'),(3,'Vendedor'),(4,'Faxineiro'),(5,'Relações públicas');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `pessoa_cpf_pessoa` varchar(15) NOT NULL,
  `data_cadastro` date NOT NULL,
  `renda_cliente` double DEFAULT NULL,
  `status_id_status` int NOT NULL,
  PRIMARY KEY (`pessoa_cpf_pessoa`),
  KEY `fk_cliente_pessoa1_idx` (`pessoa_cpf_pessoa`),
  KEY `fk_cliente_status1_idx` (`status_id_status`),
  CONSTRAINT `fk_cliente_pessoa1` FOREIGN KEY (`pessoa_cpf_pessoa`) REFERENCES `pessoa` (`cpf_pessoa`),
  CONSTRAINT `fk_cliente_status1` FOREIGN KEY (`status_id_status`) REFERENCES `status` (`id_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('111','2024-04-15',10000,1),('333','2024-01-02',1000,1),('555','2021-04-18',1250.3,1);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `pessoa_cpf_pessoa` varchar(15) NOT NULL,
  `data_cadastro` date NOT NULL,
  `cargo_id_cargo` int NOT NULL,
  `observacao` varchar(200) DEFAULT NULL,
  `status_id_status` int NOT NULL,
  PRIMARY KEY (`pessoa_cpf_pessoa`),
  KEY `fk_usuario_pessoa1_idx` (`pessoa_cpf_pessoa`),
  KEY `fk_funcionario_cargo1_idx` (`cargo_id_cargo`),
  KEY `fk_funcionario_status1_idx` (`status_id_status`),
  CONSTRAINT `fk_funcionario_cargo1` FOREIGN KEY (`cargo_id_cargo`) REFERENCES `cargo` (`id_cargo`),
  CONSTRAINT `fk_funcionario_status1` FOREIGN KEY (`status_id_status`) REFERENCES `status` (`id_status`),
  CONSTRAINT `fk_usuario_pessoa1` FOREIGN KEY (`pessoa_cpf_pessoa`) REFERENCES `pessoa` (`cpf_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES ('111','2000-02-28',1,'Chefão',1),('555','2010-12-12',2,'Gerente chato',1),('666','2020-10-10',3,'',1);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL,
  `data_pedido` date NOT NULL,
  `cliente_pessoa_cpf_pessoa` varchar(15) NOT NULL,
  `naoSei` varchar(45) DEFAULT NULL,
  `funcionario_pessoa_cpf_pessoa` varchar(15) NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_pedido_cliente1_idx` (`cliente_pessoa_cpf_pessoa`),
  KEY `fk_pedido_funcionario1_idx` (`funcionario_pessoa_cpf_pessoa`),
  CONSTRAINT `fk_pedido_cliente1` FOREIGN KEY (`cliente_pessoa_cpf_pessoa`) REFERENCES `cliente` (`pessoa_cpf_pessoa`),
  CONSTRAINT `fk_pedido_funcionario1` FOREIGN KEY (`funcionario_pessoa_cpf_pessoa`) REFERENCES `funcionario` (`pessoa_cpf_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'2024-04-18','111','','666'),(2,'2024-01-13','333',NULL,'666');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_has_produto`
--

DROP TABLE IF EXISTS `pedido_has_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_has_produto` (
  `pedido_id_pedido` int NOT NULL,
  `produto_id_produto` int NOT NULL,
  `quantidade_produto_pedido` int DEFAULT NULL,
  `preco_unitario` double DEFAULT NULL,
  `desconto_unitario` double DEFAULT NULL,
  PRIMARY KEY (`pedido_id_pedido`,`produto_id_produto`),
  KEY `fk_pedido_has_produto_pedido1_idx` (`pedido_id_pedido`),
  KEY `fk_pedido_has_produto_produto1` (`produto_id_produto`),
  CONSTRAINT `fk_pedido_has_produto_pedido1` FOREIGN KEY (`pedido_id_pedido`) REFERENCES `pedido` (`id_pedido`),
  CONSTRAINT `fk_pedido_has_produto_produto1` FOREIGN KEY (`produto_id_produto`) REFERENCES `produto` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_has_produto`
--

LOCK TABLES `pedido_has_produto` WRITE;
/*!40000 ALTER TABLE `pedido_has_produto` DISABLE KEYS */;
INSERT INTO `pedido_has_produto` VALUES (1,1,5,12.5,0),(1,3,1,7,NULL),(1,4,1,5,NULL),(2,4,2,5,NULL),(2,5,3,7,NULL),(2,8,12,1,NULL),(2,10,1,8,0);
/*!40000 ALTER TABLE `pedido_has_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pedidosDosClientes`
--

DROP TABLE IF EXISTS `pedidosDosClientes`;
/*!50001 DROP VIEW IF EXISTS `pedidosDosClientes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pedidosDosClientes` AS SELECT 
 1 AS `id_pedido`,
 1 AS `nome_pessoa`,
 1 AS `data_pedido`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa` (
  `cpf_pessoa` varchar(15) NOT NULL,
  `nome_pessoa` varchar(100) NOT NULL,
  `foto_pessoa` text,
  `e_mail_pessoa` varchar(100) DEFAULT NULL,
  `status_id_status` int NOT NULL,
  PRIMARY KEY (`cpf_pessoa`),
  UNIQUE KEY `e_mail_pessoa_UNIQUE` (`e_mail_pessoa`),
  KEY `fk_pessoa_status1_idx` (`status_id_status`),
  CONSTRAINT `fk_pessoa_status1` FOREIGN KEY (`status_id_status`) REFERENCES `status` (`id_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES ('111','Primeirino Silva','','pp@algo.com',1),('222','Segundino Pereira','','segun@algo.com',3),('333','Tercino','','tercio@gmail.com',1),('444','Quaternária da Silva','','qs@algo.com',1),('555','Quintézia Santos','','quinta@algo.com',1),('666','Sextino do Mal','','malvado@gmail.com',1);
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preco_produto`
--

DROP TABLE IF EXISTS `preco_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preco_produto` (
  `produto_id_produto` int NOT NULL,
  `data_preco_produto` date NOT NULL,
  `preco_produto` double NOT NULL,
  PRIMARY KEY (`produto_id_produto`,`data_preco_produto`),
  KEY `fk_preco_produto_produto_idx` (`produto_id_produto`),
  CONSTRAINT `fk_preco_produto_produto` FOREIGN KEY (`produto_id_produto`) REFERENCES `produto` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preco_produto`
--

LOCK TABLES `preco_produto` WRITE;
/*!40000 ALTER TABLE `preco_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `preco_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `id_produto` int NOT NULL,
  `nome_produto` varchar(45) NOT NULL,
  `quantidade_estoque_produto` int NOT NULL,
  `status_id_status` int NOT NULL,
  `unidade_de_medida_id_unidade_de_medida` varchar(2) NOT NULL,
  PRIMARY KEY (`id_produto`),
  KEY `fk_produto_status1_idx` (`status_id_status`),
  KEY `fk_produto_unidade_de_medida1_idx` (`unidade_de_medida_id_unidade_de_medida`),
  CONSTRAINT `fk_produto_status1` FOREIGN KEY (`status_id_status`) REFERENCES `status` (`id_status`),
  CONSTRAINT `fk_produto_unidade_de_medida1` FOREIGN KEY (`unidade_de_medida_id_unidade_de_medida`) REFERENCES `unidade_de_medida` (`id_unidade_de_medida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Café',30,1,'kg'),(2,'Pera',25,1,'un'),(3,'Coca-cola',250,1,'l'),(4,'Açúcar',50,1,'kg'),(5,'Arroz',0,2,'kg'),(6,'Melancia',15,1,'kg'),(7,'Maçã',60,1,'un'),(8,'Laranja',50,1,'un'),(9,'Leite',15,1,'l'),(10,'Feijão',20,1,'kg');
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id_status` int NOT NULL,
  `nome_status` varchar(45) NOT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Ativo'),(2,'Não disponível'),(3,'Falecido'),(4,'Sem estoque'),(5,'Demitido');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidade_de_medida`
--

DROP TABLE IF EXISTS `unidade_de_medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidade_de_medida` (
  `id_unidade_de_medida` varchar(2) NOT NULL,
  `nome_unidade_de_medida` varchar(45) NOT NULL,
  PRIMARY KEY (`id_unidade_de_medida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidade_de_medida`
--

LOCK TABLES `unidade_de_medida` WRITE;
/*!40000 ALTER TABLE `unidade_de_medida` DISABLE KEYS */;
INSERT INTO `unidade_de_medida` VALUES ('g','Grama'),('kg','Quilograma'),('l','Litro'),('m','Metro'),('pa','Pacote 900 gr'),('un','Unitário');
/*!40000 ALTER TABLE `unidade_de_medida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `pedidosDosClientes`
--

/*!50001 DROP VIEW IF EXISTS `pedidosDosClientes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pedidosDosClientes` AS select `pedido`.`id_pedido` AS `id_pedido`,`pessoa`.`nome_pessoa` AS `nome_pessoa`,`pedido`.`data_pedido` AS `data_pedido` from (`pedido` join `pessoa`) where (`pedido`.`cliente_pessoa_cpf_pessoa` = `pessoa`.`cpf_pessoa`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-23  6:29:46
