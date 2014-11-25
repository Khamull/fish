-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 24-Set-2014 às 01:48
-- Versão do servidor: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `peixaria`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `acesso`
--

CREATE TABLE IF NOT EXISTS `acesso` (
  `acessoID` int(11) NOT NULL AUTO_INCREMENT,
  `acessoUsuario` varchar(50) NOT NULL,
  `acessoIP` varchar(15) NOT NULL,
  `acessoData` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`acessoID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `caixa`
--

CREATE TABLE IF NOT EXISTS `caixa` (
  `caixaID` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `funcionario` varchar(100) NOT NULL,
  `valorInicial` float(10,2) NOT NULL,
  `valorFinal` float(10,2) NOT NULL,
  `vendaInicial` int(11) NOT NULL,
  `vendaFinal` int(11) NOT NULL,
  `servicoInicial` int(11) NOT NULL,
  `servicoFinal` int(11) NOT NULL,
  `lancamentoInicial` int(11) NOT NULL,
  `lancamentoFinal` int(11) NOT NULL,
  `retiradaInicial` int(11) NOT NULL,
  `retiradaFinal` int(11) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dataInicio` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` varchar(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`caixaID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargo`
--

CREATE TABLE IF NOT EXISTS `cargo` (
  `cargoID` int(11) NOT NULL AUTO_INCREMENT,
  `cargoTitulo` varchar(40) NOT NULL,
  `cargoDescricao` text NOT NULL,
  `cargoData` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cargoAtivo` varchar(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`cargoID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `cargo`
--

INSERT INTO `cargo` (`cargoID`, `cargoTitulo`, `cargoDescricao`, `cargoData`, `cargoAtivo`) VALUES
(1, 'Cargo 1', '', '2012-10-30 13:02:29', 'S'),
(2, 'Dono do Mundo', 'Cuidar de toda a ordem natural das coisas. E distribuir bens e castigos.', '2014-07-19 01:09:19', 'S');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cheques`
--

CREATE TABLE IF NOT EXISTS `cheques` (
  `chequeID` int(11) NOT NULL AUTO_INCREMENT,
  `receberID` int(11) NOT NULL,
  `clienteID` int(11) NOT NULL,
  `valorCheque` float(10,2) NOT NULL,
  `numeroCheque` varchar(30) NOT NULL,
  `vencimentoCheque` date NOT NULL,
  `observacoes` text NOT NULL,
  `empresaID` int(11) NOT NULL,
  PRIMARY KEY (`chequeID`),
  KEY `empresaID` (`empresaID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `clienteID` int(11) NOT NULL AUTO_INCREMENT,
  `tipoPessoa` varchar(1) NOT NULL,
  `clienteNomeFantasia` varchar(40) NOT NULL,
  `clienteRazaoSocial` varchar(40) NOT NULL,
  `clienteCnpj` varchar(20) NOT NULL,
  `clienteInscEstadual` varchar(20) NOT NULL,
  `clienteInscMunicipal` varchar(20) NOT NULL,
  `clienteEndereco` varchar(40) NOT NULL,
  `clienteNumero` varchar(6) NOT NULL,
  `clienteBairro` varchar(50) NOT NULL,
  `clienteCep` varchar(10) NOT NULL,
  `clienteCidade` varchar(20) NOT NULL,
  `clienteUf` varchar(2) NOT NULL,
  `clienteComplemento` text NOT NULL,
  `clienteContato` varchar(30) NOT NULL,
  `clienteTelefone` varchar(14) NOT NULL,
  `clienteFax` varchar(14) NOT NULL,
  `clienteRadio` varchar(15) NOT NULL,
  `clienteCelular` varchar(15) NOT NULL,
  `operadoraCelular` varchar(20) NOT NULL,
  `clienteEmail` varchar(100) NOT NULL,
  `clienteSite` varchar(100) NOT NULL,
  `clienteAtivo` varchar(1) NOT NULL DEFAULT 'S',
  `clienteData` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `clienteUsuario` varchar(40) NOT NULL,
  `limiteCredito` float(16,4) NOT NULL,
  PRIMARY KEY (`clienteID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`clienteID`, `tipoPessoa`, `clienteNomeFantasia`, `clienteRazaoSocial`, `clienteCnpj`, `clienteInscEstadual`, `clienteInscMunicipal`, `clienteEndereco`, `clienteNumero`, `clienteBairro`, `clienteCep`, `clienteCidade`, `clienteUf`, `clienteComplemento`, `clienteContato`, `clienteTelefone`, `clienteFax`, `clienteRadio`, `clienteCelular`, `operadoraCelular`, `clienteEmail`, `clienteSite`, `clienteAtivo`, `clienteData`, `clienteUsuario`, `limiteCredito`) VALUES
(1, '0', 'Joaquim', '', '558.213.707-60', '', '', 'Avenida: Pacaembu', '123', 'Jardim América III', '13222305', 'Várzea Paulista', 'SP', '', 'Joaquim', '(11) 4444-4444', '', '', '', '', '', 'http://', 'S', '2012-11-07 18:51:58', 'cadastro.Usuario@1a544a5', 0.0000),
(2, '0', 'Carlos', '', '713.622.471-38', '', '', 'Avenida: Professor Giacomo Itria', '123', 'Anhangabaú', '13208070', 'Jundiaí', 'SP', '', 'Carlos Contato', '(11) 8888-5555', '', '', '', '', '', 'http://', 'S', '2012-11-07 18:53:46', 'cadastro.Usuario@539a92', 0.0000),
(3, '0', 'William dos Santos', '', '215.866.721-42', '', '', 'Avenida: Tapira', '200', 'Jardim América III', '13222300', 'Várzea Paulista', 'SP', '', 'Will', '(11) 0000-4444', '', '', '', '', '', 'http://', 'S', '2012-11-12 19:32:55', 'cadastro.Usuario@1d1cdf7', 0.0000),
(4, '0', 'Gessé José Ferreira', '', '514.293.448-22', '', '', 'Avenida: Pacaembu', '326', 'Jardim América III', '13222305', 'Várzea Paulista', 'SP', '', 'Gessé', '(11) 4400-0044', '', '', '', '', '', 'http://', 'S', '2012-11-19 12:31:36', 'cadastro.Usuario@9875d1', 0.0000),
(5, '0', 'Almir F. Ferreira', '', '231.966.381-97', '', '', 'Rua: José Jutti', '294', 'Vila Tupi', '13225080', 'Várzea Paulista', 'SP', '', 'Almir', '(11) 0000-0000', '', '', '', '', '', 'http://', 'S', '2012-11-19 12:33:08', 'cadastro.Usuario@130b97d', 0.0000),
(6, '0', 'João Algusto Soares', '', '726.753.187-36', '', '', 'Avenida: Professor Giacomo Itria', '332', 'Anhangabaú', '13208070', 'Jundiaí', 'SP', '', 'João', '', '', '', '', '', '', 'http://', 'S', '2012-11-19 12:36:28', 'almir', 0.0000),
(7, '1', 'X', 'X', '62.674.726/0001-67', '', '', 'Rua: Porto Feliz', '7', 'Jardim Paulista', '13222090', 'Várzea Paulista', 'SP', '', '', '', '', '', '', '', '', 'http://', 'S', '2013-08-03 01:34:51', 'almir', 0.0000),
(13, '0', 'Almir', '', '687.187.326-07', '', '', 'Rua: Potiguara', '222', 'Vila Tupi', '13225090', 'Várzea Paulista', 'SP', '', 'Almir', '(11) 4444-5555', '', '', '(99) 9993-23222', 'VIVO', '', 'http://', 'S', '2013-10-08 00:42:39', 'almir', 0.0000),
(14, '0', 'Gessé', 'Gesse Ferreira LTDA', '651.861.069-76', '', '12345678', 'Avenida: Professor Giacomo Itria', '123', 'Anhangabaú', '13208070', 'Jundiaí', 'SP', '', 'Gessé', '', '', '', '', '', '', 'http://', 'S', '2013-10-08 00:43:31', 'almir', 0.0000),
(15, '1', 'teste', 'teste', '09.239.383/0001-20', '123', '321', 'Avenida: Tapira', '244', 'Jardim América III', '13222300', 'Várzea Paulista', 'SP', 'complemento', 'Nome do Contato', '(22) 2222-2222', '222222222', '', '(11) 1111-1111', 'TIM', 'email@email.com.br', 'http://site.com.br', 'S', '2013-10-08 00:45:01', 'almir', 0.0000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `compras`
--

CREATE TABLE IF NOT EXISTS `compras` (
  `compraID` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `compraAtiva` varchar(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`compraID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `contapagar`
--

CREATE TABLE IF NOT EXISTS `contapagar` (
  `contapagarID` int(11) NOT NULL AUTO_INCREMENT,
  `formPagID` int(11) NOT NULL,
  `favorecido` text NOT NULL,
  `valor` float(10,2) NOT NULL,
  `vezes` int(11) NOT NULL,
  `intervalo` int(11) NOT NULL,
  `data` date NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `empresaID` int(11) NOT NULL,
  PRIMARY KEY (`contapagarID`),
  KEY `empresaID` (`empresaID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `empresa`
--

CREATE TABLE IF NOT EXISTS `empresa` (
  `empresaID` int(11) NOT NULL AUTO_INCREMENT,
  `unidade` varchar(50) NOT NULL,
  `nomeFantasia` varchar(50) NOT NULL,
  `razaoSocial` varchar(80) NOT NULL,
  `ramo` varchar(30) NOT NULL,
  `cnpj` varchar(20) NOT NULL,
  `inscEstadual` varchar(20) NOT NULL,
  `inscMunicipal` varchar(20) NOT NULL,
  `cep` varchar(20) NOT NULL,
  `rua` varchar(50) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `bairro` varchar(30) NOT NULL,
  `cidade` varchar(30) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `complemento` varchar(200) NOT NULL,
  `responsavel` varchar(50) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `fax` varchar(20) NOT NULL,
  `celular` varchar(20) NOT NULL,
  `operadora` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `site` varchar(100) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `empresaAtiva` varchar(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`empresaID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `empresa`
--

INSERT INTO `empresa` (`empresaID`, `unidade`, `nomeFantasia`, `razaoSocial`, `ramo`, `cnpj`, `inscEstadual`, `inscMunicipal`, `cep`, `rua`, `numero`, `bairro`, `cidade`, `uf`, `complemento`, `responsavel`, `telefone`, `fax`, `celular`, `operadora`, `email`, `site`, `data`, `empresaAtiva`) VALUES
(1, 'Matriz', 'VARZEA INFORMATICA 2', 'MASSUIA E MACEDO COM.E MANUT DE EQUIP ', 'INFORMATICA ', '11.234.557/0001-03', '712118090111 ', '', '13220015', 'Avenida: Duque de Caxias', '64', 'Centro', 'Várzea Paulista', 'SP', '', 'ANDRE/FRANCISCO ', '(11) 4596-1455', '', '', '', 'varzea_paulista@hotmail.com', 'VARZEAINFORMATICA.COM.BR', '2013-08-06 00:29:40', 'S'),
(2, 'filial 2', 'VARZEA INFORMATICA', 'MASSUIA E MACEDO COM.E MANUT DE EQUIP ', 'INFORMATICA ', '11.234.557/0001-03', '712118090111 ', '', '13208052', 'Rua: dos Toneleiros', '222', 'Anhangabaú', 'Jundiaí', 'SP', '', 'claudio', '(11) 4444-4444', '', '', '', '', 'VARZEAINFORMATICA.COM.BR', '2013-08-06 00:30:58', 'S');

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoque`
--

CREATE TABLE IF NOT EXISTS `estoque` (
  `estoqueID` int(11) NOT NULL AUTO_INCREMENT,
  `fornecedorID` int(11) NOT NULL,
  `produtoID` int(11) NOT NULL,
  `quantidade` float(10,2) NOT NULL,
  `precoCusto` float(10,2) NOT NULL,
  `preco` float(10,2) NOT NULL,
  `lucro` varchar(10) NOT NULL,
  `unidade` varchar(2) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` varchar(50) NOT NULL,
  `empresaID` int(11) NOT NULL,
  `statusEstoque` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`estoqueID`),
  KEY `empresaID` (`empresaID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=36 ;

--
-- Extraindo dados da tabela `estoque`
--

INSERT INTO `estoque` (`estoqueID`, `fornecedorID`, `produtoID`, `quantidade`, `precoCusto`, `preco`, `lucro`, `unidade`, `data`, `usuario`, `empresaID`, `statusEstoque`) VALUES
(28, 1, 4, 1200.00, 1.25, 2.25, '80.00', 'KG', '2014-09-22 18:45:26', 'almir', 1, 0),
(29, 1, 4, 3500.00, 1.25, 2.25, '80.00', 'KG', '2014-09-22 18:49:36', 'almir', 1, 0),
(30, -1, 5, 3500.00, 2.75, 2.97, '8.00', 'KG', '2014-09-22 18:59:44', 'almir', 1, 0),
(31, 1, 5, 3250.00, 2.75, 2.97, '8.00', 'KG', '2014-09-22 19:02:18', 'almir', 1, 0),
(32, 1, 5, 250.00, 2.75, 2.97, '8.00', 'KG', '2014-09-22 20:12:10', 'almir', 1, 0),
(33, 1, 5, 2500.00, 2.75, 2.97, '8.00', 'KG', '2014-09-22 23:19:55', 'almir', 1, 0),
(34, 1, 5, 1200.00, 2.75, 2.97, '8.00', 'KG', '2014-09-22 23:29:02', 'almir', 1, 0),
(35, 1, 5, 11000.00, 2.75, 2.97, '8.00', 'KG', '2014-09-22 23:47:12', 'almir', 1, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `estoquesobra`
--

CREATE TABLE IF NOT EXISTS `estoquesobra` (
  `estoquesobraID` int(11) NOT NULL AUTO_INCREMENT,
  `produtoID` int(11) NOT NULL,
  `quantidade` float(10,2) NOT NULL,
  `uso` varchar(100) NOT NULL DEFAULT ' ',
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`estoquesobraID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `formapagamento`
--

CREATE TABLE IF NOT EXISTS `formapagamento` (
  `formID` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  `formAtivo` varchar(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`formID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Extraindo dados da tabela `formapagamento`
--

INSERT INTO `formapagamento` (`formID`, `descricao`, `formAtivo`) VALUES
(1, 'Dinheiro', 'S'),
(2, 'Cartão (Crédito)', 'S'),
(3, 'Cartão (Débito)', 'S'),
(4, 'Cheque (com entrada)', 'S'),
(5, 'Cheque (sem entrada)', 'S'),
(6, 'Boleto', 'S'),
(7, 'Venda Vale', 'S');

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedor`
--

CREATE TABLE IF NOT EXISTS `fornecedor` (
  `fornecedorID` int(11) NOT NULL AUTO_INCREMENT,
  `fornNomeFantasia` varchar(40) NOT NULL,
  `fornRazaoSocial` varchar(40) NOT NULL,
  `fornCnpj` varchar(20) NOT NULL,
  `fornInscEstadual` varchar(20) NOT NULL,
  `fornInscMunicipal` varchar(20) NOT NULL,
  `fornEndereco` varchar(40) NOT NULL,
  `fornNumero` varchar(6) NOT NULL,
  `fornBairro` varchar(50) NOT NULL,
  `fornCep` varchar(12) NOT NULL,
  `fornCidade` varchar(20) NOT NULL,
  `fornUf` varchar(2) NOT NULL,
  `fornComplemento` text NOT NULL,
  `fornContato` varchar(30) NOT NULL,
  `fornTelefone` varchar(14) NOT NULL,
  `fornFax` varchar(14) NOT NULL,
  `fornRadio` varchar(15) NOT NULL,
  `fornCelular` varchar(15) NOT NULL,
  `operadoraCelular` varchar(20) NOT NULL,
  `fornEmail` varchar(100) NOT NULL,
  `fornSite` varchar(100) NOT NULL,
  `fornAtivo` varchar(1) NOT NULL DEFAULT 'S',
  `fornData` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fornUsuario` varchar(40) NOT NULL,
  `empresaID` int(11) NOT NULL,
  PRIMARY KEY (`fornecedorID`),
  KEY `empresaID` (`empresaID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `fornecedor`
--

INSERT INTO `fornecedor` (`fornecedorID`, `fornNomeFantasia`, `fornRazaoSocial`, `fornCnpj`, `fornInscEstadual`, `fornInscMunicipal`, `fornEndereco`, `fornNumero`, `fornBairro`, `fornCep`, `fornCidade`, `fornUf`, `fornComplemento`, `fornContato`, `fornTelefone`, `fornFax`, `fornRadio`, `fornCelular`, `operadoraCelular`, `fornEmail`, `fornSite`, `fornAtivo`, `fornData`, `fornUsuario`, `empresaID`) VALUES
(1, 'Fornecedor A', 'Fornecedor A S.A. LTDA', '84.142.871/0001-30', '', '', 'Avenida: Professor Giacomo Itria', '444', 'Anhangabaú', '13208070', 'Jundiaí', 'SP', '', 'José', '(11) 4444-9999', '', '', '', '', '', 'http://', 'S', '2012-11-12 17:35:38', 'cadastro.Usuario@679810', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE IF NOT EXISTS `funcionario` (
  `funcionarioID` int(11) NOT NULL AUTO_INCREMENT,
  `cargoID` int(11) NOT NULL,
  `funcionarioNome` varchar(50) NOT NULL,
  `funcionarioNascimento` date NOT NULL,
  `funcionarioRg` varchar(20) NOT NULL,
  `funcionarioCpf` varchar(20) NOT NULL,
  `funcionarioEndereco` varchar(50) NOT NULL,
  `funcionarioNumero` varchar(10) NOT NULL,
  `funcionarioBairro` varchar(50) NOT NULL,
  `funcionarioCep` varchar(15) NOT NULL,
  `funcionarioCidade` varchar(40) NOT NULL,
  `funcionarioUf` varchar(2) NOT NULL,
  `funcionarioComplemento` varchar(100) NOT NULL,
  `funcionarioTelefone` varchar(15) NOT NULL,
  `funcionarioCelular` varchar(15) NOT NULL,
  `operadoraCelular` varchar(30) NOT NULL,
  `funcionarioEmail` varchar(100) NOT NULL,
  `funcionarioData` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `funcionarioUsuario` varchar(40) NOT NULL,
  `funcionarioAtivo` varchar(1) NOT NULL DEFAULT 'S',
  `empresaID` int(11) NOT NULL,
  PRIMARY KEY (`funcionarioID`),
  KEY `cargoID` (`cargoID`),
  KEY `empresaID` (`empresaID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`funcionarioID`, `cargoID`, `funcionarioNome`, `funcionarioNascimento`, `funcionarioRg`, `funcionarioCpf`, `funcionarioEndereco`, `funcionarioNumero`, `funcionarioBairro`, `funcionarioCep`, `funcionarioCidade`, `funcionarioUf`, `funcionarioComplemento`, `funcionarioTelefone`, `funcionarioCelular`, `operadoraCelular`, `funcionarioEmail`, `funcionarioData`, `funcionarioUsuario`, `funcionarioAtivo`, `empresaID`) VALUES
(1, 1, 'Andre', '1990-01-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '2012-10-18 18:18:01', 'LOJAJUNDIAI', 'S', 1),
(4, 1, 'Viviane', '1990-01-01', '', '', '', '', '', '', '', '', '', '', '', '', '', '2012-10-30 13:14:07', 'lojajundiai', 'S', 1),
(5, 1, 'Almir Fernando Ferreira', '1989-08-29', '', '565.658.247-70', 'Rua: Potiguara', '294', 'Vila Tupi', '13225090', 'Várzea Paulista', 'SP', 'Ap 2, Bloco D', '(11) 4493-0878', '(11) 9647-69816', 'VIVO', 'almirfferreira@hotmail.com', '2012-11-06 18:34:27', 'lojajundiai', 'S', 1),
(6, 2, 'Charles Path', '1986-12-25', '34234234234234', '351.234.168-38', 'Rua: Fernão Dias Paes', '68', 'Vila Thomazina', '13230390', 'Campo Limpo Paulista', 'SP', '', '(11) 1111-1111', '', '', '', '2014-07-19 01:11:28', 'almir', 'S', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `lancamentos`
--

CREATE TABLE IF NOT EXISTS `lancamentos` (
  `lancamentoID` int(11) NOT NULL AUTO_INCREMENT,
  `receberID` int(11) DEFAULT NULL,
  `pagarID` int(11) DEFAULT NULL,
  `vendaID` int(11) DEFAULT NULL,
  `transferenciaID` int(11) DEFAULT NULL,
  `contaPagarID` int(11) DEFAULT NULL,
  `livroID` int(11) NOT NULL,
  `formID` int(11) NOT NULL,
  `valor` float(10,2) NOT NULL,
  `desconto` float(10,2) DEFAULT NULL,
  `acrescimo` float(10,2) DEFAULT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `favorecido` text,
  `observacao` text,
  `tipo` varchar(1) NOT NULL COMMENT 'Ou ''R'' de Recebido Ou ''P'' de Pago Ou ''D'' de Deposito Ou ''T'' de Transferencia Ou ''C'' de Cheque sem Fundo Ou ''S'' de Servico',
  `usuario` varchar(50) NOT NULL,
  `empresaID` int(11) NOT NULL,
  PRIMARY KEY (`lancamentoID`),
  KEY `empresaID` (`empresaID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=52 ;

--
-- Extraindo dados da tabela `lancamentos`
--

INSERT INTO `lancamentos` (`lancamentoID`, `receberID`, `pagarID`, `vendaID`, `transferenciaID`, `contaPagarID`, `livroID`, `formID`, `valor`, `desconto`, `acrescimo`, `data`, `favorecido`, `observacao`, `tipo`, `usuario`, `empresaID`) VALUES
(26, 7, NULL, 4, NULL, NULL, 1, 4, 20.00, 0.00, 0.00, '2012-11-29 17:28:10', NULL, '', 'R', 'almir', 2),
(27, 43, NULL, 30, NULL, NULL, 1, 1, 100.00, NULL, NULL, '2012-11-29 17:29:48', NULL, NULL, 'S', 'almir', 2),
(28, 44, NULL, 22, NULL, NULL, 1, 1, 50.00, NULL, NULL, '2012-11-29 17:30:34', NULL, NULL, 'S', 'almir', 2),
(29, 42, NULL, 29, NULL, NULL, 1, 2, 100.00, 0.00, 0.00, '2012-11-29 17:31:17', NULL, '', 'S', 'almir', 2),
(30, 45, NULL, 32, NULL, NULL, 1, 1, 150.00, NULL, NULL, '2012-11-29 18:34:27', NULL, NULL, 'S', 'almir', 2),
(31, 46, NULL, 28, NULL, NULL, 1, 1, 50.00, NULL, NULL, '2012-11-29 18:35:16', NULL, NULL, 'S', 'almir', 2),
(32, 47, NULL, 14, NULL, NULL, 1, 1, 4.00, NULL, NULL, '2012-11-29 18:36:02', NULL, NULL, 'R', 'almir', 2),
(33, 40, NULL, 12, NULL, NULL, 1, 2, 20.00, 0.00, 0.00, '2012-11-29 18:36:38', NULL, '', 'R', 'almir', 2),
(34, 49, NULL, 16, NULL, NULL, 1, 1, 40.00, NULL, NULL, '2012-11-29 18:41:09', NULL, NULL, 'R', 'almir', 2),
(35, 10, NULL, 10, NULL, NULL, 1, 4, 20.00, 0.00, 0.00, '2012-11-29 18:41:45', NULL, '', 'S', 'almir', 2),
(36, 50, NULL, 33, NULL, NULL, 1, 1, 40.00, NULL, NULL, '2012-11-29 18:42:14', NULL, NULL, 'S', 'almir', 2),
(37, 51, NULL, 17, NULL, NULL, 1, 1, 40.00, NULL, NULL, '2012-11-29 18:52:43', NULL, NULL, 'R', 'almir', 2),
(38, 53, NULL, 19, NULL, NULL, 1, 1, 4.00, NULL, NULL, '2012-11-29 18:53:13', NULL, NULL, 'R', 'almir', 2),
(39, 54, NULL, 34, NULL, NULL, 1, 1, 100.00, NULL, NULL, '2012-11-29 18:54:40', NULL, NULL, 'S', 'almir', 2),
(40, 56, NULL, 38, NULL, NULL, 1, 1, 50.00, NULL, NULL, '2012-11-29 18:55:51', NULL, NULL, 'S', 'almir', 2),
(41, 52, NULL, 18, NULL, NULL, 1, 4, 40.00, 0.00, 0.00, '2012-11-29 18:56:17', NULL, '', 'R', 'almir', 2),
(42, 57, NULL, 20, NULL, NULL, 1, 1, 40.00, NULL, NULL, '2012-11-29 19:12:03', NULL, NULL, 'R', 'almir', 2),
(43, 58, NULL, 21, NULL, NULL, 1, 1, 40.00, NULL, NULL, '2012-11-29 19:12:18', NULL, NULL, 'R', 'almir', 2),
(44, 60, NULL, 39, NULL, NULL, 1, 1, 10.00, NULL, NULL, '2012-11-29 19:13:49', NULL, NULL, 'S', 'almir', 2),
(45, 48, NULL, 15, NULL, NULL, 1, 2, 40.00, 0.00, 0.00, '2012-11-29 19:15:18', NULL, '', 'R', 'almir', 2),
(46, 63, NULL, 23, NULL, NULL, 1, 7, 47.58, 0.00, 0.00, '2012-11-29 19:35:14', NULL, '', 'R', 'almir', 2),
(47, 64, NULL, 24, NULL, NULL, 1, 7, 4.75, 0.00, 0.00, '2012-11-29 19:35:23', NULL, '', 'R', 'almir', 2),
(48, 65, NULL, 25, NULL, NULL, 1, 1, 7.48, NULL, NULL, '2013-08-03 12:49:11', NULL, NULL, 'R', 'almir', 2),
(49, 70, NULL, 42, NULL, NULL, 1, 1, 350.00, NULL, NULL, '2013-09-27 01:23:02', NULL, NULL, 'S', 'almir', 2),
(50, 73, NULL, 44, NULL, NULL, 1, 1, 100.00, NULL, NULL, '2013-10-12 01:35:22', NULL, NULL, 'S', 'almir', 2),
(51, 75, NULL, 29, NULL, NULL, 1, 1, 8.00, NULL, NULL, '2014-07-19 01:33:09', NULL, NULL, 'R', 'charles', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `livrocaixa`
--

CREATE TABLE IF NOT EXISTS `livrocaixa` (
  `livroID` int(11) NOT NULL AUTO_INCREMENT,
  `banco` varchar(50) NOT NULL,
  `descricao` text NOT NULL,
  `valorInicial` float(10,2) NOT NULL,
  `dataInicio` date NOT NULL,
  `ultimoLancamento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `saldo` float(14,2) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`livroID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `orcamento`
--

CREATE TABLE IF NOT EXISTS `orcamento` (
  `orcamentoID` int(11) NOT NULL AUTO_INCREMENT,
  `clienteID` int(11) NOT NULL,
  `formPagID` int(11) NOT NULL,
  `valor` float(10,2) NOT NULL,
  `entrada` float(10,2) NOT NULL,
  `troco` float(10,2) NOT NULL,
  `vezes` int(11) NOT NULL,
  `desconto` float(10,2) NOT NULL,
  `notaFiscal` varchar(20) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` varchar(50) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT '1',
  `empresaID` int(11) NOT NULL,
  PRIMARY KEY (`orcamentoID`),
  KEY `empresaID` (`empresaID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `orcamentoitem`
--

CREATE TABLE IF NOT EXISTS `orcamentoitem` (
  `itemID` int(11) NOT NULL AUTO_INCREMENT,
  `orcamentoID` int(11) NOT NULL,
  `produtoID` int(11) NOT NULL,
  `quantidade` float(10,2) NOT NULL,
  `valor` float(10,2) NOT NULL,
  `total` float(10,2) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `orcamentoservico`
--

CREATE TABLE IF NOT EXISTS `orcamentoservico` (
  `servicoID` int(11) NOT NULL AUTO_INCREMENT,
  `clienteID` int(11) NOT NULL,
  `veiculoID` int(11) NOT NULL DEFAULT '0',
  `km` int(11) NOT NULL DEFAULT '0',
  `empresaID` int(11) NOT NULL,
  `formPagID` int(11) NOT NULL DEFAULT '0',
  `entrada` float(10,2) NOT NULL DEFAULT '0.00',
  `troco` float(10,2) NOT NULL DEFAULT '0.00',
  `vezes` int(11) NOT NULL DEFAULT '0',
  `desconto` float(10,2) NOT NULL DEFAULT '0.00',
  `descricao` text NOT NULL,
  `dataInicio` date NOT NULL,
  `dataFim` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `valor` float(10,2) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'M' COMMENT 'M (Em manutenção, em andamento) OU F (Finalizado)',
  `visualizacao` varchar(1) NOT NULL DEFAULT 'N' COMMENT 'S (Sim) OU N (Não)',
  PRIMARY KEY (`servicoID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `orcamentoservicoitem`
--

CREATE TABLE IF NOT EXISTS `orcamentoservicoitem` (
  `servicoitemID` int(11) NOT NULL AUTO_INCREMENT,
  `servicoID` int(11) NOT NULL,
  `descricao` text NOT NULL,
  `valor` float(10,2) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`servicoitemID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `orcamentoservicoproduto`
--

CREATE TABLE IF NOT EXISTS `orcamentoservicoproduto` (
  `servicoprodutoID` int(11) NOT NULL AUTO_INCREMENT,
  `servicoID` int(11) NOT NULL,
  `produtoID` int(11) NOT NULL,
  `valor` float(10,2) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`servicoprodutoID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagar`
--

CREATE TABLE IF NOT EXISTS `pagar` (
  `pagarID` int(11) NOT NULL AUTO_INCREMENT,
  `contapagarID` int(11) NOT NULL,
  `formID` int(11) NOT NULL,
  `valor` float(10,2) NOT NULL,
  `vencimento` date NOT NULL,
  `parcela` int(11) NOT NULL,
  `de` int(11) NOT NULL,
  `status` varchar(1) NOT NULL COMMENT 'Ou ''D'' de Devendo ou ''P'' de Pago',
  `empresaID` int(11) NOT NULL,
  PRIMARY KEY (`pagarID`),
  KEY `empresaID` (`empresaID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE IF NOT EXISTS `produto` (
  `produtoID` int(11) NOT NULL AUTO_INCREMENT,
  `tipoprodutoID` int(11) NOT NULL,
  `fornecedorID` int(11) DEFAULT NULL,
  `nome` varchar(100) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `unidade` varchar(2) NOT NULL,
  `precoCusto` float(10,2) NOT NULL,
  `preco` float(10,2) NOT NULL,
  `estoqueMinimo` int(11) NOT NULL,
  `estoque` float(10,2) NOT NULL,
  `lucro` varchar(10) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `produtoAtivo` varchar(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`produtoID`),
  KEY `tipoprodutoID` (`tipoprodutoID`),
  KEY `fornecedorID` (`fornecedorID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`produtoID`, `tipoprodutoID`, `fornecedorID`, `nome`, `codigo`, `unidade`, `precoCusto`, `preco`, `estoqueMinimo`, `estoque`, `lucro`, `data`, `produtoAtivo`) VALUES
(4, 3, NULL, 'Tainha Grauda', '000001', 'KG', 1.25, 2.25, 250, 4700.00, '80.00', '2014-09-22 18:49:36', 'S'),
(5, 3, NULL, 'Sardinha Inteira', '000002', 'KG', 2.75, 2.97, 350, 21700.00, '8.00', '2014-09-22 23:47:13', 'S');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtoestoque`
--

CREATE TABLE IF NOT EXISTS `produtoestoque` (
  `produtoestoqueID` int(11) NOT NULL AUTO_INCREMENT,
  `produtoID` int(11) NOT NULL,
  `empresaID` int(11) NOT NULL,
  `quantidade` float(10,2) NOT NULL,
  `ultimaInsercao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`produtoestoqueID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Extraindo dados da tabela `produtoestoque`
--

INSERT INTO `produtoestoque` (`produtoestoqueID`, `produtoID`, `empresaID`, `quantidade`, `ultimaInsercao`) VALUES
(6, 4, 1, 4700.00, '2014-09-22 18:49:36'),
(7, 5, 1, 21700.00, '2014-09-22 23:47:13');

-- --------------------------------------------------------

--
-- Estrutura da tabela `receber`
--

CREATE TABLE IF NOT EXISTS `receber` (
  `receberID` int(11) NOT NULL AUTO_INCREMENT,
  `vendaID` int(11) NOT NULL,
  `formID` int(11) NOT NULL,
  `clienteID` int(11) NOT NULL,
  `valor` float(10,2) NOT NULL,
  `vencimento` date NOT NULL,
  `parcela` int(11) NOT NULL,
  `de` int(11) NOT NULL,
  `status` varchar(1) NOT NULL COMMENT 'Ou ''D'' de Devendo Ou ''P'' de Pago',
  `servico` varchar(1) NOT NULL,
  `empresaID` int(11) NOT NULL,
  PRIMARY KEY (`receberID`),
  KEY `empresaID` (`empresaID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=80 ;

--
-- Extraindo dados da tabela `receber`
--

INSERT INTO `receber` (`receberID`, `vendaID`, `formID`, `clienteID`, `valor`, `vencimento`, `parcela`, `de`, `status`, `servico`, `empresaID`) VALUES
(26, 6, 3, 4, 4.75, '2012-12-01', 1, 1, 'D', 'N', 2),
(27, 16, 1, 3, 200.00, '2012-11-29', 1, 1, 'P', 'S', 2),
(28, 7, 1, 0, 47.58, '2012-11-29', 1, 1, 'P', 'N', 2),
(29, 8, 3, 6, 47.58, '2012-12-01', 1, 1, 'D', 'N', 2),
(30, 24, 4, 5, 75.00, '2012-11-29', 1, 2, 'P', 'S', 2),
(31, 24, 4, 5, 75.00, '2012-12-29', 2, 2, 'D', 'S', 2),
(32, 25, 1, 2, 300.00, '2012-11-29', 1, 1, 'P', 'S', 2),
(33, 9, 1, 0, 40.00, '2012-11-29', 1, 1, 'P', 'N', 2),
(34, 10, 2, 4, 45.00, '2012-12-29', 1, 1, 'D', 'N', 2),
(35, 26, 1, 2, 300.00, '2012-11-29', 1, 1, 'P', 'S', 2),
(36, 11, 6, 1, 50.00, '2012-12-29', 1, 1, 'D', 'S', 2),
(37, 27, 6, 4, 40.00, '2012-12-29', 1, 1, 'D', 'S', 2),
(38, 11, 1, 0, 40.00, '2012-11-29', 1, 1, 'P', 'N', 2),
(39, 12, 2, 6, 20.00, '2012-12-29', 1, 2, 'D', 'N', 2),
(40, 12, 2, 6, 20.00, '2013-01-29', 2, 2, 'P', 'N', 2),
(41, 13, 6, 4, 40.00, '2012-12-29', 1, 1, 'D', 'N', 2),
(42, 29, 2, 2, 100.00, '2012-12-29', 1, 1, 'P', 'S', 2),
(43, 30, 1, 2, 100.00, '2012-11-29', 1, 1, 'P', 'S', 2),
(44, 22, 1, 4, 50.00, '2012-11-29', 1, 1, 'P', 'S', 2),
(45, 32, 1, 4, 150.00, '2012-11-29', 1, 1, 'P', 'S', 2),
(46, 28, 1, 3, 50.00, '2012-11-29', 1, 1, 'P', 'S', 2),
(47, 14, 1, 0, 4.00, '2012-11-29', 1, 1, 'P', 'N', 2),
(48, 15, 2, 6, 40.00, '2012-12-29', 1, 1, 'P', 'N', 2),
(49, 16, 1, 0, 40.00, '2012-11-29', 1, 1, 'P', 'N', 2),
(50, 33, 1, 5, 40.00, '2012-11-29', 1, 1, 'P', 'S', 2),
(51, 17, 1, 0, 40.00, '2012-11-29', 1, 1, 'P', 'N', 2),
(52, 18, 4, 0, 40.00, '2012-11-29', 1, 1, 'P', 'N', 2),
(53, 19, 1, 0, 4.00, '2012-11-29', 1, 1, 'P', 'N', 2),
(54, 34, 1, 4, 100.00, '2012-11-29', 1, 1, 'P', 'S', 2),
(55, 37, 2, 1, 10.00, '2012-12-29', 1, 1, 'D', 'S', 2),
(56, 38, 1, 4, 50.00, '2012-11-29', 1, 1, 'P', 'S', 2),
(57, 20, 1, 0, 40.00, '2012-11-29', 1, 1, 'P', 'N', 2),
(58, 21, 1, 0, 40.00, '2012-11-29', 1, 1, 'P', 'N', 2),
(59, 22, 5, 0, 4.00, '2012-12-29', 1, 1, 'D', 'N', 2),
(60, 39, 1, 6, 10.00, '2012-11-29', 1, 1, 'P', 'S', 2),
(61, 40, 3, 4, 50.00, '2012-12-01', 1, 1, 'D', 'S', 2),
(62, 36, 2, 3, 15.00, '2012-12-29', 1, 1, 'D', 'S', 2),
(63, 23, 7, 6, 47.58, '2012-12-29', 1, 1, 'P', 'N', 2),
(64, 24, 7, 6, 4.75, '2012-12-29', 1, 1, 'P', 'N', 2),
(65, 25, 7, 4, 7.48, '2013-08-03', 1, 1, 'P', 'N', 2),
(66, 25, 7, 4, 40.10, '2013-09-03', 1, 1, 'D', 'N', 2),
(67, 26, 7, 0, 50.00, '2013-10-25', 1, 1, 'D', 'N', 2),
(68, 27, 7, 7, 47.58, '2013-10-25', 1, 1, 'D', 'N', 2),
(69, 41, 7, 7, 100.00, '2013-10-25', 1, 1, 'D', 'S', 2),
(70, 42, 1, 7, 350.00, '2013-09-26', 1, 1, 'P', 'S', 2),
(71, 35, 5, 2, 52.33, '2013-11-07', 1, 1, 'D', 'S', 2),
(72, 35, 5, 2, 52.33, '2013-11-07', 1, 1, 'D', 'S', 2),
(73, 44, 1, 14, 100.00, '2013-10-11', 1, 1, 'P', 'S', 2),
(74, 45, 7, 14, 40.00, '2013-11-11', 1, 1, 'D', 'S', 2),
(75, 29, 4, 13, 8.00, '2014-07-18', 1, 1, 'P', 'N', 1),
(76, 29, 4, 13, 10.00, '2014-07-18', 1, 3, 'D', 'N', 1),
(77, 29, 4, 13, 10.00, '2014-08-18', 2, 3, 'D', 'N', 1),
(78, 29, 4, 13, 10.00, '2014-09-18', 3, 3, 'D', 'N', 1),
(79, 30, 7, 13, 24.00, '2014-08-18', 1, 1, 'D', 'N', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `retiradas`
--

CREATE TABLE IF NOT EXISTS `retiradas` (
  `retiradaID` int(11) NOT NULL AUTO_INCREMENT,
  `caixaID` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `responsavel` varchar(50) NOT NULL,
  `valor` float(10,2) NOT NULL,
  `observacao` text NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `empresaID` int(11) NOT NULL,
  PRIMARY KEY (`retiradaID`),
  KEY `empresaID` (`empresaID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `retiradasestoque`
--

CREATE TABLE IF NOT EXISTS `retiradasestoque` (
  `retiradaID` int(11) NOT NULL AUTO_INCREMENT,
  `produtoID` int(11) NOT NULL,
  `quantidade` float(10,2) NOT NULL,
  `motivo` text NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `empresaID` int(11) NOT NULL,
  PRIMARY KEY (`retiradaID`),
  KEY `empresaID` (`empresaID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `servico`
--

CREATE TABLE IF NOT EXISTS `servico` (
  `servicoID` int(11) NOT NULL AUTO_INCREMENT,
  `clienteID` int(11) NOT NULL,
  `veiculoID` int(11) NOT NULL DEFAULT '0',
  `km` int(11) NOT NULL DEFAULT '0',
  `empresaID` int(11) NOT NULL,
  `formPagID` int(11) NOT NULL DEFAULT '0',
  `entrada` float(10,2) NOT NULL DEFAULT '0.00',
  `troco` float(10,2) NOT NULL DEFAULT '0.00',
  `vezes` int(11) NOT NULL DEFAULT '0',
  `desconto` float(10,2) NOT NULL DEFAULT '0.00',
  `descricao` text NOT NULL,
  `dataInicio` date NOT NULL,
  `dataFim` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `valor` float(10,2) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'M' COMMENT 'M (Em manutenção, em andamento) OU F (Finalizado)',
  `visualizacao` varchar(1) NOT NULL DEFAULT 'N' COMMENT 'S (sim) OU N (não)',
  PRIMARY KEY (`servicoID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicofechado`
--

CREATE TABLE IF NOT EXISTS `servicofechado` (
  `servicofechadoID` int(11) NOT NULL AUTO_INCREMENT,
  `servicoID` int(11) NOT NULL,
  `valor` float(10,2) NOT NULL,
  `formPagID` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`servicofechadoID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicoitem`
--

CREATE TABLE IF NOT EXISTS `servicoitem` (
  `servicoitemID` int(11) NOT NULL AUTO_INCREMENT,
  `servicoID` int(11) NOT NULL,
  `descricao` text NOT NULL,
  `valor` float(10,2) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`servicoitemID`),
  KEY `servicoID` (`servicoID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicoproduto`
--

CREATE TABLE IF NOT EXISTS `servicoproduto` (
  `servicoprodutoID` int(11) NOT NULL AUTO_INCREMENT,
  `servicoID` int(11) NOT NULL,
  `produtoID` int(11) NOT NULL,
  `valor` float(10,2) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`servicoprodutoID`),
  KEY `servicoID` (`servicoID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipoproduto`
--

CREATE TABLE IF NOT EXISTS `tipoproduto` (
  `tipoprodutoID` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(100) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tipoAtivo` varchar(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`tipoprodutoID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `tipoproduto`
--

INSERT INTO `tipoproduto` (`tipoprodutoID`, `tipo`, `data`, `tipoAtivo`) VALUES
(3, 'Peixes', '2014-09-22 18:01:44', 'S');

-- --------------------------------------------------------

--
-- Estrutura da tabela `transferenciaestoque`
--

CREATE TABLE IF NOT EXISTS `transferenciaestoque` (
  `transferenciaID` int(11) NOT NULL AUTO_INCREMENT,
  `usuarioID` int(11) NOT NULL,
  `empresaID` int(11) NOT NULL COMMENT 'Empresa que será retirada essa quantidade',
  `origemID` int(11) NOT NULL COMMENT 'Empresa onde será depositada a quantidade que foi retirada',
  `destinoID` int(11) NOT NULL,
  `quantidade` float(10,2) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tipo` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`transferenciaID`),
  KEY `tipo` (`tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `transferencias`
--

CREATE TABLE IF NOT EXISTS `transferencias` (
  `transferenciaID` int(11) NOT NULL AUTO_INCREMENT,
  `bancoDe` int(11) NOT NULL,
  `bancoPara` int(11) NOT NULL,
  `valor` float(10,2) NOT NULL,
  `observacoes` text NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `empresaID` int(11) NOT NULL,
  PRIMARY KEY (`transferenciaID`),
  KEY `empresaID` (`empresaID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `usuarioID` int(11) NOT NULL AUTO_INCREMENT,
  `funcionarioID` int(11) NOT NULL,
  `usuarioNome` varchar(50) NOT NULL,
  `usuarioTelefone` varchar(15) NOT NULL,
  `usuarioEmail` varchar(100) NOT NULL,
  `usuarioLogin` varchar(20) NOT NULL,
  `usuarioSenha` varchar(20) NOT NULL,
  `usuarioNivel` int(11) NOT NULL,
  `usuarioData` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioAtivo` varchar(1) NOT NULL DEFAULT 'S',
  `empresaID` int(11) NOT NULL,
  PRIMARY KEY (`usuarioID`),
  KEY `empresaID` (`empresaID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`usuarioID`, `funcionarioID`, `usuarioNome`, `usuarioTelefone`, `usuarioEmail`, `usuarioLogin`, `usuarioSenha`, `usuarioNivel`, `usuarioData`, `usuarioAtivo`, `empresaID`) VALUES
(1, 1, 'Andre', '', '', 'lojajundiai', 'adm123', 1, '2012-09-06 18:23:22', 'S', 1),
(15, 5, 'Almir Fernando Ferreira', '', '', 'almir', 'adm123', 1, '2012-11-06 18:34:55', 'S', 1),
(16, 6, 'Charles Path', '', '', 'charles', 'charles123', 1, '2014-07-19 01:13:33', 'S', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `veiculo`
--

CREATE TABLE IF NOT EXISTS `veiculo` (
  `veiculoID` int(11) NOT NULL AUTO_INCREMENT,
  `clienteID` int(11) NOT NULL,
  `veiculo` varchar(30) NOT NULL,
  `cor` varchar(20) NOT NULL,
  `placa` varchar(8) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `veiculoAtivo` varchar(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`veiculoID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE IF NOT EXISTS `venda` (
  `vendaID` int(11) NOT NULL AUTO_INCREMENT,
  `clienteID` int(11) NOT NULL,
  `formPagID` int(11) NOT NULL,
  `valor` float(10,2) NOT NULL,
  `entrada` float(10,2) NOT NULL,
  `troco` float(10,2) NOT NULL,
  `vezes` int(11) NOT NULL,
  `desconto` float(10,2) NOT NULL,
  `notaFiscal` varchar(20) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario` varchar(50) NOT NULL,
  `status` varchar(1) NOT NULL DEFAULT '1',
  `empresaID` int(11) NOT NULL,
  PRIMARY KEY (`vendaID`),
  KEY `empresaID` (`empresaID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendaitem`
--

CREATE TABLE IF NOT EXISTS `vendaitem` (
  `itemID` int(11) NOT NULL AUTO_INCREMENT,
  `vendaID` int(11) NOT NULL,
  `produtoID` int(11) NOT NULL,
  `quantidade` float(10,2) NOT NULL,
  `valor` float(10,2) NOT NULL,
  `total` float(10,2) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `cheques`
--
ALTER TABLE `cheques`
  ADD CONSTRAINT `cheques_ibfk_1` FOREIGN KEY (`empresaID`) REFERENCES `empresa` (`empresaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `contapagar`
--
ALTER TABLE `contapagar`
  ADD CONSTRAINT `contapagar_ibfk_1` FOREIGN KEY (`empresaID`) REFERENCES `empresa` (`empresaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `estoque`
--
ALTER TABLE `estoque`
  ADD CONSTRAINT `estoque_ibfk_1` FOREIGN KEY (`empresaID`) REFERENCES `empresa` (`empresaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD CONSTRAINT `fornecedor_ibfk_1` FOREIGN KEY (`empresaID`) REFERENCES `empresa` (`empresaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`cargoID`) REFERENCES `cargo` (`cargoID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `funcionario_ibfk_2` FOREIGN KEY (`empresaID`) REFERENCES `empresa` (`empresaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `lancamentos`
--
ALTER TABLE `lancamentos`
  ADD CONSTRAINT `lancamentos_ibfk_1` FOREIGN KEY (`empresaID`) REFERENCES `empresa` (`empresaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `orcamento`
--
ALTER TABLE `orcamento`
  ADD CONSTRAINT `orcamento_ibfk_1` FOREIGN KEY (`empresaID`) REFERENCES `empresa` (`empresaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `pagar`
--
ALTER TABLE `pagar`
  ADD CONSTRAINT `pagar_ibfk_1` FOREIGN KEY (`empresaID`) REFERENCES `empresa` (`empresaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`tipoprodutoID`) REFERENCES `tipoproduto` (`tipoprodutoID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `receber`
--
ALTER TABLE `receber`
  ADD CONSTRAINT `receber_ibfk_1` FOREIGN KEY (`empresaID`) REFERENCES `empresa` (`empresaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `retiradas`
--
ALTER TABLE `retiradas`
  ADD CONSTRAINT `retiradas_ibfk_1` FOREIGN KEY (`empresaID`) REFERENCES `empresa` (`empresaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `retiradasestoque`
--
ALTER TABLE `retiradasestoque`
  ADD CONSTRAINT `retiradasestoque_ibfk_1` FOREIGN KEY (`empresaID`) REFERENCES `empresa` (`empresaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `servicoitem`
--
ALTER TABLE `servicoitem`
  ADD CONSTRAINT `servicoitem_ibfk_1` FOREIGN KEY (`servicoID`) REFERENCES `servico` (`servicoID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `servicoproduto`
--
ALTER TABLE `servicoproduto`
  ADD CONSTRAINT `servicoproduto_ibfk_1` FOREIGN KEY (`servicoID`) REFERENCES `servico` (`servicoID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `transferencias`
--
ALTER TABLE `transferencias`
  ADD CONSTRAINT `transferencias_ibfk_1` FOREIGN KEY (`empresaID`) REFERENCES `empresa` (`empresaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`empresaID`) REFERENCES `empresa` (`empresaID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `venda_ibfk_1` FOREIGN KEY (`empresaID`) REFERENCES `empresa` (`empresaID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
