CREATE DATABASE  IF NOT EXISTS `CandyShop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `CandyShop`;
-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: CandyShop
-- ------------------------------------------------------
-- Server version	8.0.39

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
INSERT INTO `Cargo` VALUES (1,'Gerente'),(2,'Vendedor'),(3,'Auxiliar de limpeza');
/*!40000 ALTER TABLE `Cargo` ENABLE KEYS */;
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
  `PessoaCpfPessoa` varchar(20) NOT NULL,
  PRIMARY KEY (`PessoaCpfPessoa`),
  CONSTRAINT `fk_Cliente_Pessoa1` FOREIGN KEY (`PessoaCpfPessoa`) REFERENCES `Pessoa` (`cpfPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cliente`
--

LOCK TABLES `Cliente` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;
INSERT INTO `Cliente` VALUES (10000,'2024-05-06','222'),(5000,'2024-06-05','333');
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
  PRIMARY KEY (`idEndereco`),
  KEY `fk_Endereco_Cidade1_idx` (`CidadeIdCidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Endereco`
--

LOCK TABLES `Endereco` WRITE;
/*!40000 ALTER TABLE `Endereco` DISABLE KEYS */;
INSERT INTO `Endereco` VALUES (1,'Rua do tropeços','10','nenhuma','87300400',1),(2,'Rua dos buracos','50','lá no fim do mundo','89800899',2);
/*!40000 ALTER TABLE `Endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FormaDePagamento`
--

DROP TABLE IF EXISTS `FormaDePagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FormaDePagamento` (
  `idFormaPagamento` int NOT NULL,
  `nomeFormaPagamento` varchar(100) NOT NULL,
  PRIMARY KEY (`idFormaPagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Meio de pagamento utilizado para efetivar o pagamento';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FormaDePagamento`
--

LOCK TABLES `FormaDePagamento` WRITE;
/*!40000 ALTER TABLE `FormaDePagamento` DISABLE KEYS */;
INSERT INTO `FormaDePagamento` VALUES (1,'Dinheiro'),(2,'Cartão de Crédito'),(3,'PIX'),(4,'Boleto');
/*!40000 ALTER TABLE `FormaDePagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Funcionario`
--

DROP TABLE IF EXISTS `Funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Funcionario` (
  `PessoaCpfPessoa` varchar(20) NOT NULL,
  `salario` double DEFAULT NULL,
  `CargosIdCargo` int NOT NULL,
  `porcentagemComissao` double DEFAULT NULL COMMENT 'Número de zero a um representando a comissão de venda do funcionário.',
  PRIMARY KEY (`PessoaCpfPessoa`),
  KEY `fk_Funcionario_Cargos1_idx` (`CargosIdCargo`),
  CONSTRAINT `fk_Funcionario_Cargos1` FOREIGN KEY (`CargosIdCargo`) REFERENCES `Cargo` (`idCargo`),
  CONSTRAINT `fk_funcionario_pessoa1` FOREIGN KEY (`PessoaCpfPessoa`) REFERENCES `Pessoa` (`cpfPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Funcionario`
--

LOCK TABLES `Funcionario` WRITE;
/*!40000 ALTER TABLE `Funcionario` DISABLE KEYS */;
INSERT INTO `Funcionario` VALUES ('222',2500,2,0.03),('333',2700,2,0.04);
/*!40000 ALTER TABLE `Funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pagamento`
--

DROP TABLE IF EXISTS `Pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pagamento` (
  `PedidoIdPedido` int NOT NULL,
  `dataPagamento` timestamp NOT NULL COMMENT 'Data de efetivação do pagamento',
  `valorTotalPagamento` double DEFAULT NULL COMMENT 'Soma de todas as formas de pagamento. Tem que coincidir com o total do pedido.',
  PRIMARY KEY (`PedidoIdPedido`),
  CONSTRAINT `Pagamento_Pedido_FK` FOREIGN KEY (`PedidoIdPedido`) REFERENCES `Pedido` (`idPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabela para controlar os pagamentos. Se o id de um pedido está na tabela pagamento é por que o pagamento foi efetivado.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pagamento`
--

LOCK TABLES `Pagamento` WRITE;
/*!40000 ALTER TABLE `Pagamento` DISABLE KEYS */;
INSERT INTO `Pagamento` VALUES (2,'2024-10-01 03:00:00',22),(5,'2024-10-10 03:00:00',47);
/*!40000 ALTER TABLE `Pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PagamentoHasFormaPagamento`
--

DROP TABLE IF EXISTS `PagamentoHasFormaPagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PagamentoHasFormaPagamento` (
  `PagamentoIdPedido` int DEFAULT NULL,
  `FormaPagamentoIdFormaPagamento` int DEFAULT NULL,
  `valorPago` double DEFAULT NULL COMMENT 'valor que foi pago em um pedido com uma forma de pagamento.',
  KEY `PagamentoHasFormaPagamento_Pagamento_FK` (`PagamentoIdPedido`),
  KEY `PagamentoHasFormaPagamento_FormaDePagamento_FK` (`FormaPagamentoIdFormaPagamento`),
  CONSTRAINT `PagamentoHasFormaPagamento_FormaDePagamento_FK` FOREIGN KEY (`FormaPagamentoIdFormaPagamento`) REFERENCES `FormaDePagamento` (`idFormaPagamento`),
  CONSTRAINT `PagamentoHasFormaPagamento_Pagamento_FK` FOREIGN KEY (`PagamentoIdPedido`) REFERENCES `Pagamento` (`PedidoIdPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PagamentoHasFormaPagamento`
--

LOCK TABLES `PagamentoHasFormaPagamento` WRITE;
/*!40000 ALTER TABLE `PagamentoHasFormaPagamento` DISABLE KEYS */;
INSERT INTO `PagamentoHasFormaPagamento` VALUES (2,2,22),(5,3,30),(5,2,17);
/*!40000 ALTER TABLE `PagamentoHasFormaPagamento` ENABLE KEYS */;
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
  `ClientePessoaCpfPessoa` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `FuncionarioPessoaCpfPessoa` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `fk_Pedido_Cliente1_idx` (`ClientePessoaCpfPessoa`),
  KEY `Pedido_Funcionario_FK` (`FuncionarioPessoaCpfPessoa`),
  CONSTRAINT `fk_Pedido_Cliente1` FOREIGN KEY (`ClientePessoaCpfPessoa`) REFERENCES `Cliente` (`PessoaCpfPessoa`),
  CONSTRAINT `Pedido_Funcionario_FK` FOREIGN KEY (`FuncionarioPessoaCpfPessoa`) REFERENCES `Funcionario` (`PessoaCpfPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pedido`
--

LOCK TABLES `Pedido` WRITE;
/*!40000 ALTER TABLE `Pedido` DISABLE KEYS */;
INSERT INTO `Pedido` VALUES (1,'2024-09-05','333','222'),(2,'2024-04-20','222','333'),(5,'2024-05-20','222','333');
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
  `precoUnitario` double NOT NULL,
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
INSERT INTO `PedidoHasProduto` VALUES (2,22,1,1),(1,2,1,2),(1,0,1,5),(3,3,2,1),(1,7,2,5),(1,0,22,2),(1,0,22,5),(5,8,33,5);
/*!40000 ALTER TABLE `PedidoHasProduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pessoa`
--

DROP TABLE IF EXISTS `Pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pessoa` (
  `cpfPessoa` varchar(20) NOT NULL,
  `nomePessoa` varchar(60) NOT NULL,
  `dataNascimentoPessoa` date NOT NULL,
  `EnderecoIdEndereco` int NOT NULL,
  PRIMARY KEY (`cpfPessoa`),
  KEY `fk_Pessoa_Endereco1_idx` (`EnderecoIdEndereco`),
  CONSTRAINT `fk_Pessoa_Endereco1` FOREIGN KEY (`EnderecoIdEndereco`) REFERENCES `Endereco` (`idEndereco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pessoa`
--

LOCK TABLES `Pessoa` WRITE;
/*!40000 ALTER TABLE `Pessoa` DISABLE KEYS */;
INSERT INTO `Pessoa` VALUES ('111','Berola','2024-05-23',1),('222','Zózoio Cego','2024-05-23',1),('333','xeroncio da silva','2000-05-10',2),('555','aaaaabbbbb','2025-10-10',1);
/*!40000 ALTER TABLE `Pessoa` ENABLE KEYS */;
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
  `precoUnitario` double DEFAULT NULL,
  PRIMARY KEY (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Produto`
--

LOCK TABLES `Produto` WRITE;
/*!40000 ALTER TABLE `Produto` DISABLE KEYS */;
INSERT INTO `Produto` VALUES (1,'Arroz Especial',100,7),(2,'Feijão',50,9),(22,'Farinha de mandioca',100,5),(33,'Fubá',33,3),(444,'Azeite de oliva',444,44);
/*!40000 ALTER TABLE `Produto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-11 13:11:28
