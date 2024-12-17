-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: localhost    Database: CandyShop
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.24.04.1

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
INSERT INTO `Cliente` VALUES (5698,'2000-10-14','123'),(10000,'2024-05-06','222'),(5000,'2024-06-05','333'),(5000,'2022-12-15','555'),(2500,'2020-04-15','777'),(3500,'2021-01-11','999');
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
  PRIMARY KEY (`idEndereco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Endereco`
--

LOCK TABLES `Endereco` WRITE;
/*!40000 ALTER TABLE `Endereco` DISABLE KEYS */;
INSERT INTO `Endereco` VALUES (1,'Rua do tropeços','10','nenhuma','87300400'),(2,'Rua dos buracos','50','lá no fim do mundo','89800899'),(3,'Rua do brejo','25','perto do rio','87912369'),(4,'Av. Fim da linha',NULL,'perto do trilho','87546936');
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
INSERT INTO `Pagamento` VALUES (2,'2024-10-01 03:00:00',15.75),(5,'2024-10-10 03:00:00',168.5),(7,'2024-10-14 03:00:00',50.5);
/*!40000 ALTER TABLE `Pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PagamentoHasFormaPagamento`
--

DROP TABLE IF EXISTS `PagamentoHasFormaPagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PagamentoHasFormaPagamento` (
  `PagamentoIdPedido` int NOT NULL,
  `FormaPagamentoIdFormaPagamento` int NOT NULL,
  `valorPago` double DEFAULT NULL COMMENT 'valor que foi pago em um pedido com uma forma de pagamento.',
  PRIMARY KEY (`PagamentoIdPedido`,`FormaPagamentoIdFormaPagamento`),
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
INSERT INTO `PagamentoHasFormaPagamento` VALUES (2,2,15.75),(5,1,100),(5,2,68.5);
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
INSERT INTO `Pedido` VALUES (1,'2024-09-05','333','222'),(2,'2024-04-20','222','333'),(5,'2024-05-20','222','333'),(7,'2024-10-05','555','222');
/*!40000 ALTER TABLE `Pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PedidoHasProduto`
--

DROP TABLE IF EXISTS `PedidoHasProduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PedidoHasProduto` (
  `PedidoIdPedido` int NOT NULL,
  `ProdutoIdProduto` int NOT NULL,
  `quantidade` double NOT NULL,
  `precoUnitario` double NOT NULL,
  PRIMARY KEY (`PedidoIdPedido`,`ProdutoIdProduto`),
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
INSERT INTO `PedidoHasProduto` VALUES (1,1,0.2,25),(1,2,0.5,50),(2,1,0.3,25),(2,5,0.15,55),(5,1,0.35,25),(5,2,0.5,50),(5,4,2,55),(5,5,0.45,55),(7,12,0.5,14),(7,28,1.5,29);
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
INSERT INTO `Pessoa` VALUES ('111','Berola','2024-05-23',1),('123','Zé Bonitinho','1950-06-11',2),('222','Zózoio Cego','2024-05-23',1),('333','xeroncio da silva','2000-05-10',2),('555','Belzelinda','1990-10-10',1),('777','Bernardete da Veiga','2000-12-25',3),('999','Timocréia ','1905-02-13',4);
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
INSERT INTO `Produto` VALUES (1,'Cocada branca',100,25),(2,'Jujuba sortida',50,50),(4,'Cocada de coco queimado',25,44),(5,'Doce de leite',12,55),(7,'Paçoquinha rolha',100,22),(9,'Doce de abóbora coração',33,33),(11,'Marshmallow',45,13.5),(12,'Pé de moleque',90,14),(13,'Amendoim açucarado',100,11),(14,'Gelatina de frutas',50,16),(15,'Jujuba',120,10),(16,'Bala de coco',75,12),(17,'Doce de leite pastoso',40,18),(18,'Brigadeiro',65,25),(19,'Beijinho',55,24),(20,'Doce de amendoim',90,20),(21,'Bala de tamarindo',200,7.5),(22,'Bala de hortelã',180,6),(23,'Caramelo',100,15),(24,'Cajuzinho',50,21),(25,'Doce de batata roxa',30,19),(26,'Pipoca doce',110,8),(27,'Suspiro',70,5.5),(28,'Doce de figo',45,29),(29,'Doce de abóbora com coco',50,32),(30,'Goiabada cascão',60,17),(31,'Chocolate branco',95,20),(32,'Torta de limão',40,35),(33,'Doce de leite com coco',55,27),(34,'Doce de abacaxi',35,23),(35,'Doce de banana',65,26),(36,'Doce de maracujá',25,22),(37,'Bala de mel',150,9),(38,'Goma de mascar',180,12),(39,'Torrone de amendoim',85,14),(40,'Doce de caju',45,28);
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

-- Dump completed on 2024-12-17  6:03:26
