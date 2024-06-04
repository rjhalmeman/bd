CREATE DATABASE  IF NOT EXISTS `granja` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `granja`;
-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: granja
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

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
INSERT INTO `Cor` VALUES ('1','Branco'),('2','Amarelo'),('3','Azul');
/*!40000 ALTER TABLE `Cor` ENABLE KEYS */;
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
  PRIMARY KEY (`data`,`idProduto`),
  KEY `producao_produto_FK` (`idProduto`),
  CONSTRAINT `producao_produto_FK` FOREIGN KEY (`idProduto`) REFERENCES `Produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Producao`
--

LOCK TABLES `Producao` WRITE;
/*!40000 ALTER TABLE `Producao` DISABLE KEYS */;
INSERT INTO `Producao` VALUES ('2024-03-30',1,150,0.42),('2024-04-15',1,240,0.42),('2024-04-20',2,120,0.41),('2024-05-24',1,250,0.47),('2024-05-24',2,120,0.4),('2024-06-01',6,320,0.45),('2024-06-03',6,300,0.45);
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
INSERT INTO `Produto` VALUES (1,'Ovo Extra Grande',120,'UN','1',60),(2,'Ovo Grande',72,'UN','1',55),(3,'Ovo Médio',12,'un','1',50),(4,'Ovo pequeno',36,'UN','1',45),(5,'Ovo de codorna',10,'dz','3',25),(6,'Ovo Extra Grande',500,'Un','2',60),(7,'Ovo Grande',1000,'un','2',55);
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
-- Dumping data for table `Tipo`
--

LOCK TABLES `Tipo` WRITE;
/*!40000 ALTER TABLE `Tipo` DISABLE KEYS */;
INSERT INTO `Tipo` VALUES ('1','Extra',60);
/*!40000 ALTER TABLE `Tipo` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `UnidadeDeMedida` VALUES ('BN','Bandeja'),('DZ','Dúzia'),('KG','Quilograma'),('UN','Unidade');
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

--
-- Temporary view structure for view `eProducaoTotal`
--

DROP TABLE IF EXISTS `eProducaoTotal`;
/*!50001 DROP VIEW IF EXISTS `eProducaoTotal`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `eProducaoTotal` AS SELECT 
 1 AS `producaoTotal`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `subtotais`
--

DROP TABLE IF EXISTS `subtotais`;
/*!50001 DROP VIEW IF EXISTS `subtotais`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `subtotais` AS SELECT 
 1 AS `idProduto`,
 1 AS `nomeProduto`,
 1 AS `SubTotal`,
 1 AS `data`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `ExemploDeViewEx01`
--

/*!50001 DROP VIEW IF EXISTS `ExemploDeViewEx01`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `ExemploDeViewEx01` AS select sum(`Producao`.`quantidade`) AS `TotalDeOvosProduzidos` from `Producao` where (`Producao`.`data` = '2024-05-24') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `TesteJoin`
--

/*!50001 DROP VIEW IF EXISTS `TesteJoin`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `TesteJoin` AS select `p`.`idProduto` AS `idProduto`,`pcao`.`quantidade` AS `quantidade` from (`Producao` `pcao` join `Produto` `p`) where (`p`.`idProduto` = `pcao`.`idProduto`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `bProducaoPorData`
--

/*!50001 DROP VIEW IF EXISTS `bProducaoPorData`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `bProducaoPorData` AS select `p`.`data` AS `data`,`p`.`idProduto` AS `idProduto`,`p`.`quantidade` AS `quantidade`,`p`.`precoNoDia` AS `precoNoDia` from `Producao` `p` where (`p`.`data` = '2024-05-24') */;
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
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `cOvosDeUmTipoEmUmPeriodo` AS select `p`.`data` AS `data`,`p`.`idProduto` AS `idProduto`,`p`.`quantidade` AS `quantidade`,`p`.`precoNoDia` AS `precoNoDia` from (`Producao` `p` join `Produto` `prod`) where ((`p`.`data` between '2024-04-01' and '2024-05-20') and (`p`.`idProduto` = `prod`.`idProduto`)) order by `p`.`data` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `dNovoExercicio`
--

/*!50001 DROP VIEW IF EXISTS `dNovoExercicio`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `dNovoExercicio` AS select `Producao`.`data` AS `data`,`Producao`.`idProduto` AS `idProduto`,`Producao`.`quantidade` AS `quantidade`,`Producao`.`precoNoDia` AS `precoNoDia` from `Producao` where (`Producao`.`data` between '2024-04-01' and '2024-04-30') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `eProducaoEmValores`
--

/*!50001 DROP VIEW IF EXISTS `eProducaoEmValores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `eProducaoEmValores` AS select `produto`.`idProduto` AS `idProduto`,`produto`.`nomeProduto` AS `nomeProduto`,(`producao`.`quantidade` * `producao`.`precoNoDia`) AS `subtotal` from (`Produto` `produto` join `Producao` `producao`) where (`produto`.`idProduto` = `producao`.`idProduto`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `eProducaoTotal`
--

/*!50001 DROP VIEW IF EXISTS `eProducaoTotal`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `eProducaoTotal` AS select sum(`eProducaoEmValores`.`subtotal`) AS `producaoTotal` from `eProducaoEmValores` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `subtotais`
--

/*!50001 DROP VIEW IF EXISTS `subtotais`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `subtotais` AS select `Producao`.`idProduto` AS `idProduto`,`Produto`.`nomeProduto` AS `nomeProduto`,(`Producao`.`quantidade` * `Producao`.`precoNoDia`) AS `SubTotal`,`Producao`.`data` AS `data` from (`Producao` join `Produto`) where (`Produto`.`idProduto` = `Producao`.`idProduto`) */;
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

-- Dump completed on 2024-06-04  6:04:02
