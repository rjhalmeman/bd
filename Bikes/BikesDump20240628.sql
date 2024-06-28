CREATE DATABASE  IF NOT EXISTS `Bikes` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `Bikes`;
-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: Bikes
-- ------------------------------------------------------
-- Server version	8.0.37

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
  `idCargo` int NOT NULL,
  `nomeCargo` varchar(45) NOT NULL,
  PRIMARY KEY (`idCargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cargo`
--

LOCK TABLES `Cargo` WRITE;
/*!40000 ALTER TABLE `Cargo` DISABLE KEYS */;
INSERT INTO `Cargo` VALUES (1,'Gerente'),(2,'Vendedor'),(3,'Faxineiro');
/*!40000 ALTER TABLE `Cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cidade`
--

DROP TABLE IF EXISTS `Cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cidade` (
  `idCidade` int NOT NULL,
  `nomeCidade` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`idCidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cidade`
--

LOCK TABLES `Cidade` WRITE;
/*!40000 ALTER TABLE `Cidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cliente`
--

DROP TABLE IF EXISTS `Cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cliente` (
  `rendaCliente` double NOT NULL,
  `dataDeCadastroCliente` date NOT NULL,
  `Pessoa_idPessoa` varchar(20) NOT NULL,
  PRIMARY KEY (`Pessoa_idPessoa`),
  CONSTRAINT `fk_Cliente_Pessoa1` FOREIGN KEY (`Pessoa_idPessoa`) REFERENCES `Pessoa` (`idPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cliente`
--

LOCK TABLES `Cliente` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Endereco`
--

DROP TABLE IF EXISTS `Endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Endereco` (
  `idEndereco` int NOT NULL,
  `logradouro` varchar(100) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `referencia` varchar(45) DEFAULT NULL,
  `cep` varchar(9) DEFAULT NULL,
  `CidadeIdCidade` int NOT NULL,
  `Estado_siglaEstado` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`idEndereco`),
  KEY `fk_Endereco_Cidade1_idx` (`CidadeIdCidade`),
  KEY `fk_Endereco_Estado1_idx` (`Estado_siglaEstado`),
  CONSTRAINT `fk_Endereco_Cidade1` FOREIGN KEY (`CidadeIdCidade`) REFERENCES `Cidade` (`idCidade`),
  CONSTRAINT `fk_Endereco_Estado1` FOREIGN KEY (`Estado_siglaEstado`) REFERENCES `Estado` (`siglaEstado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Endereco`
--

LOCK TABLES `Endereco` WRITE;
/*!40000 ALTER TABLE `Endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `Endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Estado`
--

DROP TABLE IF EXISTS `Estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Estado` (
  `siglaEstado` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `nomeEstado` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`siglaEstado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Estado`
--

LOCK TABLES `Estado` WRITE;
/*!40000 ALTER TABLE `Estado` DISABLE KEYS */;
/*!40000 ALTER TABLE `Estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fornecedor`
--

DROP TABLE IF EXISTS `Fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Fornecedor` (
  `nomeFornecedor` int DEFAULT NULL,
  `Pessoa_idPessoa` varchar(20) NOT NULL,
  PRIMARY KEY (`Pessoa_idPessoa`),
  CONSTRAINT `fk_Fornecedor_Pessoa1` FOREIGN KEY (`Pessoa_idPessoa`) REFERENCES `Pessoa` (`idPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fornecedor`
--

LOCK TABLES `Fornecedor` WRITE;
/*!40000 ALTER TABLE `Fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fornecedor_has_Produto`
--

DROP TABLE IF EXISTS `Fornecedor_has_Produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Fornecedor_has_Produto` (
  `Fornecedor_Pessoa_idPessoa` varchar(20) NOT NULL,
  `Produto_idProduto` int NOT NULL,
  PRIMARY KEY (`Fornecedor_Pessoa_idPessoa`,`Produto_idProduto`),
  KEY `fk_Fornecedor_has_Produto_Produto1_idx` (`Produto_idProduto`),
  KEY `fk_Fornecedor_has_Produto_Fornecedor1_idx` (`Fornecedor_Pessoa_idPessoa`),
  CONSTRAINT `fk_Fornecedor_has_Produto_Fornecedor1` FOREIGN KEY (`Fornecedor_Pessoa_idPessoa`) REFERENCES `Fornecedor` (`Pessoa_idPessoa`),
  CONSTRAINT `fk_Fornecedor_has_Produto_Produto1` FOREIGN KEY (`Produto_idProduto`) REFERENCES `Produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fornecedor_has_Produto`
--

LOCK TABLES `Fornecedor_has_Produto` WRITE;
/*!40000 ALTER TABLE `Fornecedor_has_Produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `Fornecedor_has_Produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Funcionario`
--

DROP TABLE IF EXISTS `Funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Funcionario` (
  `salario` double DEFAULT NULL,
  `CargosIdCargo` int NOT NULL,
  `Pessoa_idPessoa` varchar(20) NOT NULL,
  PRIMARY KEY (`Pessoa_idPessoa`),
  KEY `fk_Funcionario_Cargos1_idx` (`CargosIdCargo`),
  KEY `fk_Funcionario_Pessoa1_idx` (`Pessoa_idPessoa`),
  CONSTRAINT `fk_Funcionario_Cargos1` FOREIGN KEY (`CargosIdCargo`) REFERENCES `Cargo` (`idCargo`),
  CONSTRAINT `fk_Funcionario_Pessoa1` FOREIGN KEY (`Pessoa_idPessoa`) REFERENCES `Pessoa` (`idPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Funcionario`
--

LOCK TABLES `Funcionario` WRITE;
/*!40000 ALTER TABLE `Funcionario` DISABLE KEYS */;
INSERT INTO `Funcionario` VALUES (5000,1,'111'),(1200,3,'444'),(2000,2,'555');
/*!40000 ALTER TABLE `Funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Marca`
--

DROP TABLE IF EXISTS `Marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Marca` (
  `idMarca` int NOT NULL,
  `nomeMarca` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMarca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Marca`
--

LOCK TABLES `Marca` WRITE;
/*!40000 ALTER TABLE `Marca` DISABLE KEYS */;
/*!40000 ALTER TABLE `Marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pagamento`
--

DROP TABLE IF EXISTS `Pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pagamento` (
  `Pedido_idPedido` int NOT NULL,
  `Cliente_Pessoa_idPessoa` varchar(20) NOT NULL,
  `valor` double DEFAULT NULL,
  `parcelas` int DEFAULT NULL,
  `TipoPagamento_idTipoPagamento` int NOT NULL,
  PRIMARY KEY (`Cliente_Pessoa_idPessoa`,`Pedido_idPedido`),
  KEY `fk_Pagamento_Pedido1_idx` (`Pedido_idPedido`),
  KEY `fk_Pagamento_Cliente1_idx` (`Cliente_Pessoa_idPessoa`),
  KEY `fk_Pagamento_TipoPagamento1_idx` (`TipoPagamento_idTipoPagamento`),
  CONSTRAINT `fk_Pagamento_Cliente1` FOREIGN KEY (`Cliente_Pessoa_idPessoa`) REFERENCES `Cliente` (`Pessoa_idPessoa`),
  CONSTRAINT `fk_Pagamento_Pedido1` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `Pedido` (`idPedido`),
  CONSTRAINT `fk_Pagamento_TipoPagamento1` FOREIGN KEY (`TipoPagamento_idTipoPagamento`) REFERENCES `TipoPagamento` (`idTipoPagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pagamento`
--

LOCK TABLES `Pagamento` WRITE;
/*!40000 ALTER TABLE `Pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pedido`
--

DROP TABLE IF EXISTS `Pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pedido` (
  `idPedido` int NOT NULL,
  `dataDoPedido` date NOT NULL,
  `Funcionario_Pessoa_idPessoa` varchar(20) NOT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `fk_Pedido_Funcionario1_idx` (`Funcionario_Pessoa_idPessoa`),
  CONSTRAINT `fk_Pedido_Funcionario1` FOREIGN KEY (`Funcionario_Pessoa_idPessoa`) REFERENCES `Funcionario` (`Pessoa_idPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pedido`
--

LOCK TABLES `Pedido` WRITE;
/*!40000 ALTER TABLE `Pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PedidoHasProduto`
--

DROP TABLE IF EXISTS `PedidoHasProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PedidoHasProduto` (
  `quantidade` int NOT NULL,
  `precoUnitarioProduto` double NOT NULL,
  `ProdutoIdProduto` int NOT NULL,
  `PedidoIdPedido` int NOT NULL,
  PRIMARY KEY (`ProdutoIdProduto`,`PedidoIdPedido`),
  KEY `fk_pedido_has_produto_produto1_idx` (`ProdutoIdProduto`),
  KEY `fk_PedidoHasProduto_Pedido1_idx` (`PedidoIdPedido`),
  CONSTRAINT `fk_pedido_has_produto_produto1` FOREIGN KEY (`ProdutoIdProduto`) REFERENCES `Produto` (`idProduto`),
  CONSTRAINT `fk_PedidoHasProduto_Pedido1` FOREIGN KEY (`PedidoIdPedido`) REFERENCES `Pedido` (`idPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PedidoHasProduto`
--

LOCK TABLES `PedidoHasProduto` WRITE;
/*!40000 ALTER TABLE `PedidoHasProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `PedidoHasProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pessoa`
--

DROP TABLE IF EXISTS `Pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pessoa` (
  `idPessoa` varchar(20) NOT NULL,
  `nomePessoa` varchar(60) NOT NULL,
  `dataNascimentoPessoa` date NOT NULL,
  `TipoPessoa_idTipoPessoa` int NOT NULL,
  `senhaPessoa` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`idPessoa`),
  KEY `fk_Pessoa_TipoPessoa1_idx` (`TipoPessoa_idTipoPessoa`),
  CONSTRAINT `fk_Pessoa_TipoPessoa1` FOREIGN KEY (`TipoPessoa_idTipoPessoa`) REFERENCES `TipoPessoa` (`idTipoPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pessoa`
--

LOCK TABLES `Pessoa` WRITE;
/*!40000 ALTER TABLE `Pessoa` DISABLE KEYS */;
INSERT INTO `Pessoa` VALUES ('111','Maria Consoladora da Almas','1990-01-24',1,'123456'),('2020','Cia das peças','1990-01-01',2,'123456'),('2030','Fábrica de bicicletas Xing Ling','2000-01-01',2,'123456'),('2040','Gambiarra e Cia','2015-01-01',2,'123456'),('2050','Monark','1990-01-01',2,'123456'),('222','José da Almas','1984-01-13',1,'123456'),('444','Carlos Carlitos','1990-01-24',1,'123456'),('555','Timocréia Triches','1900-05-04',1,'123456'),('999','Joel Simplório','2000-06-23',1,'123456');
/*!40000 ALTER TABLE `Pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pessoa_has_Endereco`
--

DROP TABLE IF EXISTS `Pessoa_has_Endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pessoa_has_Endereco` (
  `Endereco_idEndereco` int NOT NULL,
  `Pessoa_idPessoa` varchar(20) NOT NULL,
  PRIMARY KEY (`Endereco_idEndereco`,`Pessoa_idPessoa`),
  KEY `fk_Pessoa_has_Endereco_Endereco1_idx` (`Endereco_idEndereco`),
  KEY `fk_Pessoa_has_Endereco_Pessoa1_idx` (`Pessoa_idPessoa`),
  CONSTRAINT `fk_Pessoa_has_Endereco_Endereco1` FOREIGN KEY (`Endereco_idEndereco`) REFERENCES `Endereco` (`idEndereco`),
  CONSTRAINT `fk_Pessoa_has_Endereco_Pessoa1` FOREIGN KEY (`Pessoa_idPessoa`) REFERENCES `Pessoa` (`idPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pessoa_has_Endereco`
--

LOCK TABLES `Pessoa_has_Endereco` WRITE;
/*!40000 ALTER TABLE `Pessoa_has_Endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pessoa_has_Endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pessoa_has_TipoContato`
--

DROP TABLE IF EXISTS `Pessoa_has_TipoContato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pessoa_has_TipoContato` (
  `Pessoa_idPessoa` varchar(20) NOT NULL,
  `TipoContato_idTipoContato` int NOT NULL,
  `contato` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`Pessoa_idPessoa`,`TipoContato_idTipoContato`),
  KEY `fk_Pessoa_has_TipoContato_TipoContato1_idx` (`TipoContato_idTipoContato`),
  KEY `fk_Pessoa_has_TipoContato_Pessoa1_idx` (`Pessoa_idPessoa`),
  CONSTRAINT `fk_Pessoa_has_TipoContato_Pessoa1` FOREIGN KEY (`Pessoa_idPessoa`) REFERENCES `Pessoa` (`idPessoa`),
  CONSTRAINT `fk_Pessoa_has_TipoContato_TipoContato1` FOREIGN KEY (`TipoContato_idTipoContato`) REFERENCES `TipoContato` (`idTipoContato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pessoa_has_TipoContato`
--

LOCK TABLES `Pessoa_has_TipoContato` WRITE;
/*!40000 ALTER TABLE `Pessoa_has_TipoContato` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pessoa_has_TipoContato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PrecoProduto`
--

DROP TABLE IF EXISTS `PrecoProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PrecoProduto` (
  `Produto_idProduto` int NOT NULL,
  `dataPrecoProduto` timestamp NOT NULL,
  `precoProduto` double DEFAULT NULL,
  PRIMARY KEY (`Produto_idProduto`,`dataPrecoProduto`),
  KEY `fk_PrecoProduto_Produto1_idx` (`Produto_idProduto`),
  CONSTRAINT `fk_PrecoProduto_Produto1` FOREIGN KEY (`Produto_idProduto`) REFERENCES `Produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PrecoProduto`
--

LOCK TABLES `PrecoProduto` WRITE;
/*!40000 ALTER TABLE `PrecoProduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `PrecoProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Produto`
--

DROP TABLE IF EXISTS `Produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Produto` (
  `idProduto` int NOT NULL,
  `nomeProduto` varchar(45) NOT NULL,
  `quantidadeEmEstoque` int NOT NULL,
  `UnidadeDeMedidaSiglaUnidadeDeMedida` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Marca_idMarca` int NOT NULL,
  `modelo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idProduto`),
  KEY `fk_Produto_UnidadeDeMedida1_idx` (`UnidadeDeMedidaSiglaUnidadeDeMedida`),
  KEY `fk_Produto_Marca1_idx` (`Marca_idMarca`),
  CONSTRAINT `fk_Produto_Marca1` FOREIGN KEY (`Marca_idMarca`) REFERENCES `Marca` (`idMarca`),
  CONSTRAINT `fk_Produto_UnidadeDeMedida1` FOREIGN KEY (`UnidadeDeMedidaSiglaUnidadeDeMedida`) REFERENCES `UnidadeDeMedida` (`siglaUnidadeDeMedida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Produto`
--

LOCK TABLES `Produto` WRITE;
/*!40000 ALTER TABLE `Produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `Produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TipoContato`
--

DROP TABLE IF EXISTS `TipoContato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TipoContato` (
  `idTipoContato` int NOT NULL,
  `nomeTipoContato` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`idTipoContato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TipoContato`
--

LOCK TABLES `TipoContato` WRITE;
/*!40000 ALTER TABLE `TipoContato` DISABLE KEYS */;
/*!40000 ALTER TABLE `TipoContato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TipoPagamento`
--

DROP TABLE IF EXISTS `TipoPagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TipoPagamento` (
  `idTipoPagamento` int NOT NULL,
  `nomeTipoPagamento` varchar(45) DEFAULT NULL COMMENT 'Dinheiro, cartão, pix, etc.',
  PRIMARY KEY (`idTipoPagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TipoPagamento`
--

LOCK TABLES `TipoPagamento` WRITE;
/*!40000 ALTER TABLE `TipoPagamento` DISABLE KEYS */;
INSERT INTO `TipoPagamento` VALUES (1,'Cartão de Crédito'),(2,'Dinheiro'),(3,'Pix'),(4,'Transferência Bancária');
/*!40000 ALTER TABLE `TipoPagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TipoPessoa`
--

DROP TABLE IF EXISTS `TipoPessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TipoPessoa` (
  `idTipoPessoa` int NOT NULL,
  `nomeTipoPessoa` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipoPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COMMENT='Considerados os casos de pessoa física ou pessoa jurídica';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TipoPessoa`
--

LOCK TABLES `TipoPessoa` WRITE;
/*!40000 ALTER TABLE `TipoPessoa` DISABLE KEYS */;
INSERT INTO `TipoPessoa` VALUES (1,'Fisica'),(2,'Juridica');
/*!40000 ALTER TABLE `TipoPessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UnidadeDeMedida`
--

DROP TABLE IF EXISTS `UnidadeDeMedida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UnidadeDeMedida` (
  `siglaUnidadeDeMedida` varchar(2) NOT NULL,
  `nomeUnidadeDeMedida` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`siglaUnidadeDeMedida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UnidadeDeMedida`
--

LOCK TABLES `UnidadeDeMedida` WRITE;
/*!40000 ALTER TABLE `UnidadeDeMedida` DISABLE KEYS */;
/*!40000 ALTER TABLE `UnidadeDeMedida` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-28 15:06:10
