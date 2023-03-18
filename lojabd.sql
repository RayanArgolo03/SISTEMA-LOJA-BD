-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 13-Mar-2023 às 18:35
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `lojabd`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `ID` int(11) NOT NULL,
  `NOME` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`ID`, `NOME`) VALUES
(1, 'Carnes'),
(2, 'Frios'),
(3, 'Legumes');

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `ID` int(11) NOT NULL,
  `NOME` varchar(100) NOT NULL,
  `CPF` char(11) NOT NULL,
  `DATANASCIMENTO` date NOT NULL,
  `EMAIL` varchar(60) NOT NULL,
  `ATIVO` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`ID`, `NOME`, `CPF`, `DATANASCIMENTO`, `EMAIL`, `ATIVO`) VALUES
(1, 'Yuri Santos', '12179823703', '2003-10-10', 'yuri@gmail.com', b'1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `itens_venda`
--

CREATE TABLE `itens_venda` (
  `DESCONTO` float NOT NULL,
  `IDPRODUTO` int(11) NOT NULL,
  `IDVENDA` int(11) NOT NULL,
  `VALORVENDA` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `ID` int(11) NOT NULL,
  `IDCATEGORIA` int(11) NOT NULL,
  `NOME` varchar(100) NOT NULL,
  `PRECO` float NOT NULL,
  `QTDESTOQUE` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

CREATE TABLE `vendas` (
  `ID` int(11) NOT NULL,
  `IDCLIENTE` int(11) NOT NULL,
  `VALORVENDA` int(11) NOT NULL,
  `DATAVENDA` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`ID`);

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ID`);

--
-- Índices para tabela `itens_venda`
--
ALTER TABLE `itens_venda`
  ADD PRIMARY KEY (`IDPRODUTO`,`IDVENDA`),
  ADD KEY `IDVENDA` (`IDVENDA`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDCATEGORIA` (`IDCATEGORIA`);

--
-- Índices para tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDCLIENTE` (`IDCLIENTE`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `itens_venda`
--
ALTER TABLE `itens_venda`
  ADD CONSTRAINT `itens_venda_ibfk_1` FOREIGN KEY (`IDPRODUTO`) REFERENCES `produtos` (`ID`),
  ADD CONSTRAINT `itens_venda_ibfk_2` FOREIGN KEY (`IDVENDA`) REFERENCES `vendas` (`ID`);

--
-- Limitadores para a tabela `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`IDCATEGORIA`) REFERENCES `categorias` (`ID`);

--
-- Limitadores para a tabela `vendas`
--
ALTER TABLE `vendas`
  ADD CONSTRAINT `vendas_ibfk_1` FOREIGN KEY (`IDCLIENTE`) REFERENCES `clientes` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
