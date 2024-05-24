-- MySQL dump 10.13  Distrib 8.0.37, for Linux (x86_64)
--
-- Host: localhost    Database: granja
-- ------------------------------------------------------
-- Server version	8.0.37

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
  KEY `producao_produto_FK` (`idProduto`),
  CONSTRAINT `producao_produto_FK` FOREIGN KEY (`idProduto`) REFERENCES `Produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  PRIMARY KEY (`idProduto`),
  KEY `produto_UnidadeDeMedida_FK` (`siglaUM`),
  KEY `Produto_Cor_FK` (`idCor`),
  CONSTRAINT `Produto_Cor_FK` FOREIGN KEY (`idCor`) REFERENCES `Cor` (`idCor`),
  CONSTRAINT `produto_UnidadeDeMedida_FK` FOREIGN KEY (`siglaUM`) REFERENCES `UnidadeDeMedida` (`siglaUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Tipo`
--

DROP TABLE IF EXISTS `Tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tipo` (
  `idTipo` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nomeTipo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pesoMin` int DEFAULT NULL COMMENT 'peso mínimo para ser Extra',
  PRIMARY KEY (`idTipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Temporary view structure for view `bQuantosOvosPorData`
--

DROP TABLE IF EXISTS `bQuantosOvosPorData`;
/*!50001 DROP VIEW IF EXISTS `bQuantosOvosPorData`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `bQuantosOvosPorData` AS SELECT 
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
-- Dumping routines for database 'granja'
--

--
-- Final view structure for view `bQuantosOvosPorData`
--

/*!50001 DROP VIEW IF EXISTS `bQuantosOvosPorData`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bQuantosOvosPorData` AS select `p`.`data` AS `data`,`p`.`idProduto` AS `idProduto`,`p`.`quantidade` AS `quantidade`,`p`.`precoNoDia` AS `precoNoDia` from `Producao` `p` where (`p`.`data` = '2024-05-24') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cOvosDeUmTipoEmUmPeriodo`
--

/*!50001 DROP VIEW IF EXISTS `cOvosDeUmTipoEmUmPeriodo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cOvosDeUmTipoEmUmPeriodo` AS select `p`.`data` AS `data`,`p`.`idProduto` AS `idProduto`,`p`.`quantidade` AS `quantidade`,`p`.`precoNoDia` AS `precoNoDia` from `Producao` `p` where (`p`.`data` between '2024-04-01' and '2024-05-20') order by `p`.`data` */;
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

-- Dump completed on 2024-05-24 14:25:07
