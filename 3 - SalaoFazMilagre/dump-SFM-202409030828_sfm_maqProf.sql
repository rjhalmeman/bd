-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: SFM
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.22.04.1

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
-- Table structure for table `Atendimento`
--

DROP TABLE IF EXISTS `Atendimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Atendimento` (
  `idAtendimento` int NOT NULL AUTO_INCREMENT,
  `dataAtendimento` date DEFAULT NULL,
  `pessoaCpfPessoaCliente` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pessoaCpfPessoaFuncionario` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`idAtendimento`),
  KEY `Atendimento_Cliente_FK` (`pessoaCpfPessoaCliente`),
  KEY `Atendimento_Funcionario_FK` (`pessoaCpfPessoaFuncionario`),
  CONSTRAINT `Atendimento_Cliente_FK` FOREIGN KEY (`pessoaCpfPessoaCliente`) REFERENCES `Cliente` (`pessoaCpfPessoa`),
  CONSTRAINT `Atendimento_Funcionario_FK` FOREIGN KEY (`pessoaCpfPessoaFuncionario`) REFERENCES `Funcionario` (`pessoaCpfPessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Atendimento`
--

LOCK TABLES `Atendimento` WRITE;
/*!40000 ALTER TABLE `Atendimento` DISABLE KEYS */;
INSERT INTO `Atendimento` VALUES (1,'2024-08-08','222','000'),(2,'2024-01-06','696','047'),(3,'2024-10-22','777','069'),(4,'2024-10-24','222','000'),(5,'2024-10-25','777','888'),(6,'2024-10-26','222','888'),(7,'2024-10-23','069','888'),(8,'2024-10-27','696','047'),(9,'2024-08-08','1112','069'),(10,'2024-10-28','069','888'),(11,'2024-08-08','1516','069'),(21,'2024-08-08','1718','069'),(24,'2024-08-01','171','999'),(69,'2024-10-22','004','047');
/*!40000 ALTER TABLE `Atendimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AtendimentoHasServico`
--

DROP TABLE IF EXISTS `AtendimentoHasServico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AtendimentoHasServico` (
  `idAtendimento` int DEFAULT NULL,
  `idServico` int DEFAULT NULL,
  `precoUnitarioServico` double DEFAULT NULL,
  `quantidadeServico` int DEFAULT NULL,
  KEY `AtendimentoHasServico_Atendimento_FK` (`idAtendimento`),
  KEY `AtendimentoHasServico_Servico_FK` (`idServico`),
  CONSTRAINT `AtendimentoHasServico_Atendimento_FK` FOREIGN KEY (`idAtendimento`) REFERENCES `Atendimento` (`idAtendimento`),
  CONSTRAINT `AtendimentoHasServico_Servico_FK` FOREIGN KEY (`idServico`) REFERENCES `Servico` (`idServico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AtendimentoHasServico`
--

LOCK TABLES `AtendimentoHasServico` WRITE;
/*!40000 ALTER TABLE `AtendimentoHasServico` DISABLE KEYS */;
INSERT INTO `AtendimentoHasServico` VALUES (2,2,500,5),(7,5,0,24),(7,1,20,1),(7,8,25,2),(10,3,50,1),(7,20,1000,8),(8,5,0,2),(2,2,500,5),(3,2,500,5),(4,2,500,5),(5,2,500,5),(6,2,500,5),(3,2,500,5),(4,2,500,5),(5,2,500,5),(6,2,500,5),(11,60,2000,2),(1,1,20,3),(2,5,0,1),(3,11,200,2),(4,20,1000,4),(5,60,2000,5),(6,69,90,2),(7,77,500,6),(8,777,10000,3),(9,11,200,7),(10,1,20,4),(11,5,0,1),(21,60,2000,2),(24,20,1000,3),(69,69,95,8);
/*!40000 ALTER TABLE `AtendimentoHasServico` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cargo`
--

LOCK TABLES `Cargo` WRITE;
/*!40000 ALTER TABLE `Cargo` DISABLE KEYS */;
INSERT INTO `Cargo` VALUES (0,'taxador profissional'),(1,'Cabeleireiro(a)'),(2,'Gerente'),(3,'Auxiliar de limpeza'),(4,'BrunoBala'),(5,'Tik Tok'),(6,'Marketing'),(7,'Atendente'),(8,'Faxineiro'),(9,'Segurança'),(10,'Atendente de telemarketing'),(11,'CEO'),(20,'Pedreiro'),(69,'Rebolar lentin'),(100,'bolador profissional');
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
INSERT INTO `Cliente` VALUES ('004'),('040'),('069'),('1010'),('1112'),('1516'),('171'),('1718'),('22'),('222'),('444'),('555'),('616'),('666'),('695'),('696'),('69999'),('777'),('8890'),('919'),('956'),('999'),('99999');
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
INSERT INTO `Funcionario` VALUES ('000',1),('111',1),('12345',1),('333',1),('695',1),('888',1),('1010',2),('047',4),('004',5),('1213',9),('101',10),('999',10),('555',11),('171',20),('956',20),('069',69);
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
  `quantidade` int DEFAULT NULL,
  `precoUnitario` double DEFAULT NULL,
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
INSERT INTO `FuncionarioHasServico` VALUES ('047',1,NULL,NULL),('047',2,NULL,NULL),('1010',3,NULL,NULL),('1010',4,NULL,NULL),('111',1,NULL,NULL),('12345',1,NULL,NULL),('12345',8,NULL,NULL),('333',5,NULL,NULL),('695',1,NULL,NULL),('888',1,NULL,NULL),('888',2,NULL,NULL),('999',6,NULL,NULL),('999',10,NULL,NULL);
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
INSERT INTO `Horario` VALUES ('M1','08h','09h'),('M2','09h','10h'),('M3','10h','11h'),('M4','11h','12h'),('N1','18h','19h'),('N2','19h','20h'),('N3','20h','21h'),('T1','13h','14h'),('T2','14h','15h'),('T3','15h','16h'),('T4','16h','17h'),('T5','17h','18h');
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
  `emailPessoa` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cpfPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pessoa`
--

LOCK TABLES `Pessoa` WRITE;
/*!40000 ALTER TABLE `Pessoa` DISABLE KEYS */;
INSERT INTO `Pessoa` VALUES ('000','maomé','44 99999999','meka','alcorão','maomé@gmail.com'),('0001','silvio santos','44 696969696','céu','riosDeDinheiroMaooee','IML@gmail.com'),('0002','kid bengala','44 99696070','pronhub','30cmdepurap..','pintadaviolenta@gmail.com'),('001','mano beuzas','44 666666666','Seara','66666','nordeste@gmail.com'),('002','Manuel Gomez','44 444444444','Um lá ele para nós dois lá ele','Ela é muito','amostradinho@gmail.cum'),('004','Opala4Portas','44 999888888','garagem da ascent','vendo cookies','vendocookies@gmail.com'),('040','Paulo Kogos','45 468545658','São Paulo','BowserPagão','comunismo@gmail.com'),('047','Bruno Bala','44 999999999','Quinta do Sol','loiras','私は男性が大好きです@gmail.com'),('069','Mia Khalifa','44 996969696','lá ele','sacanagem','hentai@gmail.com'),('101','Pedro Tunes','01 001011010','entre códigos','strong strong','progamadordoano@gmal.com'),('1010','Vetor Baitola','44 993427392','em juranda','vitinho1234','vitin@gmail.com'),('111','Jõao Primeiro ','44 999596998','lá ele','12345','fufu@gmail.com'),('1112','Macedinho','44999999999','Bahia','123456','naosei@example.com'),('1213','Homem pix','42 545654564','pixlandia','eopix?nadaainda?','vemdipixbebe@gmail.com'),('12345','Edward Mão de Tesoura','44 444444444','Filme','tic tic tic tic','tesoura@gmail.com'),('13','gigi mentirosa','13 131313131','rua falsa','after nicolau','Falsa13@yahool.com'),('1314','Mariana Almeida','44999999999','Bahia','123456','naosei@example.com'),('1415','José','44999999999','Bahia','123456','naosei@example.com'),('1516','Ralielly','44999999999','Bahia','123456','naosei@example.com'),('1617','Gigi','44999999999','Bahia','123456','naosei@example.com'),('171','Lula','44 100012864','Receita Federal','TaxadorSupremo69','Otaxadordofuturo@gmail.com'),('1718','Manu','44999999999','Bahia','123456','naosei@example.com'),('22','Bolsonaro','22 000000000','Triples do lula','saúde, patría e familía','luladocoração@gmail.com'),('222','Ana Segunda','44 99899966','mais longe ainda','abcdef','segundalina@algo.com.br'),('2222','wesley_DP','44 997756436','Bar do farol','Corinthians','gavioes@gmail.com'),('333','Maria Terceira Silva','44 44587225','mais longe ainda','abc123','longevidade@gmail.com'),('444','Carlos Quarto','44 987458968','longe demais','321456','cquarto@uol.com'),('555','Radames','44 995432674','vizinho','********','radames@professores.utfpr.edu.br'),('616','Feiticeira Escarlate','44 997438428','enterrada','morta2022','no_caixão@gmailcom'),('666','coisa ruim','44 998572648','lugar ruim','jesusémeusalvador','jesuscaminho@gmailcom'),('667','Erick_Cabeção','44 999449944','ponte(embaixo)','nao_tenho_amigos','cabeça@gmail.com'),('6924','Só Capa Violento','44 990028922','Free Fire','Dando Capa Violento','amohomens@gmail.com'),('695','Lula','31 658525485','Na prisao kkkk','comunista','analfabeto@hotmail.com'),('696','olixinal','44 999696090','no japão','taxar','フライドチキン@gmail.com'),('6969','Polenguinho Gaucho','44 997111431','debaixo da ponte','laeleborabil','botafogo@gmail.com'),('69999','Bruno Berti','44 699999699','Casa dos sarradores','sarra cmg?','sarreipor1h@gmail.com'),('777','Carlos Magno','41 995231785','Europa','asd2544','euro@gmail.com'),('888','Cabeleleila Leila','44 996215785','São Roque/SP','Dando Capa Violento','capaviolento@sexo.cum'),('8890','BOZZtinha','47 997756444','brawl stars','tiktok','yyoutubeeee@gmail.com'),('919','FlamengoBoy','44696969696','alianspark','botafogo','Botanomeufogo@gmail.com'),('956','Orea Seca','44 990818677','na obra','ligeiro','@éCoisaDeAbestado'),('999','Adilson','44 997756433','não é na UTF','lol1234','orn@loldle.com'),('9999','Galvão Kinder Bueno','44 696009696','globo','laelemilvezes','receba1234@hotmail.com'),('99999','Bruno Berti','44 997756432','United States','sarracomigo','sarreipor1h@gmail.com');
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
INSERT INTO `Reserva` VALUES ('2024-07-25','T2','888',9,'666'),('2024-08-10','m1','111',1,'222'),('2024-08-10','M3','888',5,'171'),('2024-08-11','m1','111',2,'444'),('2024-08-11','m2','111',2,'222'),('2024-08-12','T5','333',3,'222'),('2024-08-15','T1','888',10,'999'),('2024-08-17','M2','333',4,'999'),('2024-08-19','m2','111',2,'666'),('2024-08-19','M2','888',4,'695'),('2024-08-20','m1','111',3,'666'),('2024-08-20','M3','000',777,'22'),('2024-08-20','M4','888',5,'069'),('2024-08-20','N1','12345',1,'956'),('2024-08-20','t2','333',3,'666'),('2024-08-20','T2','888',5,'696'),('2024-08-20','T3','695',5,'069'),('2024-08-20','T4','888',5,'1010'),('2024-08-24','M3','695',5,'069'),('2024-08-25','M4','888',7,'1010'),('2024-08-26','T1','888',5,'695'),('2024-08-26','T5','333',2,'999'),('2024-09-08','M3','1010',4,'444'),('2024-09-18','N1','333',6,'999'),('2024-09-20','M1','956',60,'695'),('2024-09-20','M2','956',60,'695'),('2024-09-20','M3','956',60,'695'),('2024-10-01','T1','888',4,'695'),('2024-11-24','M2','1010',77,'222'),('2024-12-14','M4','111',77,'695'),('2024-12-22','T2','111',7,'999'),('2024-12-24','M3','333',3,'1010');
/*!40000 ALTER TABLE `Reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `SFM 1`
--

DROP TABLE IF EXISTS `SFM 1`;
/*!50001 DROP VIEW IF EXISTS `SFM 1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `SFM 1` AS SELECT 
 1 AS `idAtendimento`,
 1 AS `dataAtendimento`,
 1 AS `pessoaCpfPessoaCliente`,
 1 AS `pessoaCpfPessoaFuncionario`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Servico`
--

DROP TABLE IF EXISTS `Servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Servico` (
  `idServico` int NOT NULL AUTO_INCREMENT,
  `nomeServico` varchar(45) DEFAULT NULL,
  `precoServico` double DEFAULT NULL,
  PRIMARY KEY (`idServico`)
) ENGINE=InnoDB AUTO_INCREMENT=778 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Servico`
--

LOCK TABLES `Servico` WRITE;
/*!40000 ALTER TABLE `Servico` DISABLE KEYS */;
INSERT INTO `Servico` VALUES (1,'corte masculino',20),(2,'corte feminino',500),(3,'pintura simples',50),(4,'pintura especial',100),(5,'depilação anal',0),(6,'Unhas',40),(7,'Sílios Grandes',50),(8,'barba',25),(9,'urologista',10),(10,'barba de cima',15),(11,'aluguel de esposa',200),(20,'dentista',1000),(60,'dama da noite',2000),(69,'jobzinho',5000),(77,'massagem tântrica',500),(777,'Cote Supremo',10000);
/*!40000 ALTER TABLE `Servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'SFM'
--

--
-- Final view structure for view `SFM 1`
--

/*!50001 DROP VIEW IF EXISTS `SFM 1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `SFM 1` AS select `Atendimento`.`idAtendimento` AS `idAtendimento`,`Atendimento`.`dataAtendimento` AS `dataAtendimento`,`Atendimento`.`pessoaCpfPessoaCliente` AS `pessoaCpfPessoaCliente`,`Atendimento`.`pessoaCpfPessoaFuncionario` AS `pessoaCpfPessoaFuncionario` from `Atendimento` where (`Atendimento`.`pessoaCpfPessoaCliente` = 222) */;
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

-- Dump completed on 2024-09-03  8:28:54
