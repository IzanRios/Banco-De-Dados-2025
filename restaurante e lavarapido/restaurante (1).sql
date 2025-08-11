-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 11/08/2025 às 13:20
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `restaurante`
--
CREATE DATABASE IF NOT EXISTS `restaurante` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `restaurante`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `areasrestaurante`
--

CREATE TABLE `areasrestaurante` (
  `codarea` int(11) NOT NULL,
  `descricao` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `areasrestaurante`
--

INSERT INTO `areasrestaurante` (`codarea`, `descricao`) VALUES
(1, 'Área Interna'),
(2, 'Área Externa'),
(3, 'Salão Principal'),
(4, 'Mezanino'),
(5, 'Terraço'),
(6, 'Bar'),
(7, 'VIP Lounge'),
(8, 'Jardim'),
(9, 'Área Infantil'),
(10, 'Varanda');

-- --------------------------------------------------------

--
-- Estrutura para tabela `atendimento`
--

CREATE TABLE `atendimento` (
  `codatendimento` int(11) NOT NULL,
  `codgarcom` int(11) NOT NULL,
  `codmesa` int(11) NOT NULL,
  `horarioentrada` datetime NOT NULL,
  `horariosaida` datetime DEFAULT NULL,
  `qtdpessoas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `atendimento`
--

INSERT INTO `atendimento` (`codatendimento`, `codgarcom`, `codmesa`, `horarioentrada`, `horariosaida`, `qtdpessoas`) VALUES
(1, 1, 1, '2025-08-11 12:00:00', '2025-08-11 13:00:00', 4),
(2, 2, 2, '2025-08-11 12:15:00', '2025-08-11 13:20:00', 2),
(3, 3, 3, '2025-08-11 12:30:00', NULL, 6),
(4, 4, 4, '2025-08-11 13:00:00', NULL, 8),
(5, 5, 5, '2025-08-11 13:15:00', '2025-08-11 14:00:00', 4),
(6, 6, 6, '2025-08-11 13:20:00', NULL, 10),
(7, 7, 7, '2025-08-11 13:30:00', '2025-08-11 14:30:00', 2),
(8, 8, 8, '2025-08-11 14:00:00', NULL, 6),
(9, 9, 9, '2025-08-11 14:10:00', '2025-08-11 15:00:00', 4),
(10, 10, 10, '2025-08-11 14:30:00', NULL, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `conta`
--

CREATE TABLE `conta` (
  `codconta` int(11) NOT NULL,
  `data` date NOT NULL,
  `valortotal` decimal(10,2) NOT NULL,
  `valorporpessoa` decimal(10,2) NOT NULL,
  `codmesa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `conta`
--

INSERT INTO `conta` (`codconta`, `data`, `valortotal`, `valorporpessoa`, `codmesa`) VALUES
(1, '2025-08-11', 100.00, 25.00, 1),
(2, '2025-08-11', 80.00, 40.00, 2),
(3, '2025-08-11', 150.00, 25.00, 3),
(4, '2025-08-11', 200.00, 25.00, 4),
(5, '2025-08-11', 90.00, 22.50, 5),
(6, '2025-08-11', 300.00, 30.00, 6),
(7, '2025-08-11', 50.00, 25.00, 7),
(8, '2025-08-11', 180.00, 30.00, 8),
(9, '2025-08-11', 120.00, 30.00, 9),
(10, '2025-08-11', 60.00, 30.00, 10);

-- --------------------------------------------------------

--
-- Estrutura para tabela `garcon`
--

CREATE TABLE `garcon` (
  `codgarcom` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `garcon`
--

INSERT INTO `garcon` (`codgarcom`, `nome`) VALUES
(1, 'Carlos Silva'),
(2, 'Ana Maria'),
(3, 'João Pedro'),
(4, 'Mariana Rocha'),
(5, 'Lucas Lima'),
(6, 'Paula Mendes'),
(7, 'Felipe Costa'),
(8, 'Bruna Oliveira'),
(9, 'Rafael Souza'),
(10, 'Tatiane Ramos');

-- --------------------------------------------------------

--
-- Estrutura para tabela `item`
--

CREATE TABLE `item` (
  `coditem` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `preco` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `item`
--

INSERT INTO `item` (`coditem`, `nome`, `preco`) VALUES
(1, 'Pizza Margherita', 39.90),
(2, 'Lasanha Bolonhesa', 45.00),
(3, 'Coca-Cola 600ml', 7.50),
(4, 'Suco Natural', 9.00),
(5, 'Hambúrguer Artesanal', 29.00),
(6, 'Porção de Batata', 18.00),
(7, 'Caipirinha', 15.00),
(8, 'Cerveja Long Neck', 10.00),
(9, 'Salada Caesar', 25.00),
(10, 'Espaguete ao Pesto', 32.00),
(11, 'Filé Mignon ao Molho Madeira', 58.90),
(12, 'Risoto de Camarão', 49.00),
(13, 'Tábua de Frios', 42.00),
(14, 'Refrigerante Lata', 6.00),
(15, 'Torta de Chocolate', 15.00),
(16, 'Pudim de Leite', 12.00),
(17, 'Café Expresso', 5.00),
(18, 'Chá Gelado', 7.00),
(19, 'Panqueca de Frango', 27.50),
(20, 'Sorvete Artesanal', 10.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `itensconta`
--

CREATE TABLE `itensconta` (
  `cod_itensconta` int(11) NOT NULL,
  `codconta` int(11) NOT NULL,
  `coditem` int(11) NOT NULL,
  `qtde` int(11) NOT NULL,
  `totalitem` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `itensconta`
--

INSERT INTO `itensconta` (`cod_itensconta`, `codconta`, `coditem`, `qtde`, `totalitem`) VALUES
(1, 1, 1, 2, 79.80),
(2, 1, 3, 2, 15.00),
(3, 2, 4, 2, 18.00),
(4, 2, 5, 1, 29.00),
(5, 3, 1, 3, 119.70),
(6, 4, 2, 2, 90.00),
(7, 4, 6, 1, 18.00),
(8, 5, 7, 3, 45.00),
(9, 6, 10, 3, 96.00),
(10, 6, 3, 4, 30.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `mesa`
--

CREATE TABLE `mesa` (
  `codmesa` int(11) NOT NULL,
  `comporta` int(11) NOT NULL,
  `codarea` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `mesa`
--

INSERT INTO `mesa` (`codmesa`, `comporta`, `codarea`) VALUES
(1, 4, 1),
(2, 2, 2),
(3, 6, 3),
(4, 8, 4),
(5, 4, 5),
(6, 10, 6),
(7, 2, 7),
(8, 6, 8),
(9, 4, 9),
(10, 2, 10);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `areasrestaurante`
--
ALTER TABLE `areasrestaurante`
  ADD PRIMARY KEY (`codarea`);

--
-- Índices de tabela `atendimento`
--
ALTER TABLE `atendimento`
  ADD PRIMARY KEY (`codatendimento`),
  ADD KEY `fk_atendimento_garcon` (`codgarcom`),
  ADD KEY `fk_atendimento_mesa` (`codmesa`);

--
-- Índices de tabela `conta`
--
ALTER TABLE `conta`
  ADD PRIMARY KEY (`codconta`),
  ADD KEY `fk_conta_mesa` (`codmesa`);

--
-- Índices de tabela `garcon`
--
ALTER TABLE `garcon`
  ADD PRIMARY KEY (`codgarcom`);

--
-- Índices de tabela `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`coditem`);

--
-- Índices de tabela `itensconta`
--
ALTER TABLE `itensconta`
  ADD PRIMARY KEY (`cod_itensconta`),
  ADD KEY `fk_itensconta_conta` (`codconta`),
  ADD KEY `fk_itensconta_item` (`coditem`);

--
-- Índices de tabela `mesa`
--
ALTER TABLE `mesa`
  ADD PRIMARY KEY (`codmesa`),
  ADD KEY `fk_mesa_area` (`codarea`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `areasrestaurante`
--
ALTER TABLE `areasrestaurante`
  MODIFY `codarea` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `atendimento`
--
ALTER TABLE `atendimento`
  MODIFY `codatendimento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `conta`
--
ALTER TABLE `conta`
  MODIFY `codconta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `garcon`
--
ALTER TABLE `garcon`
  MODIFY `codgarcom` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `item`
--
ALTER TABLE `item`
  MODIFY `coditem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `itensconta`
--
ALTER TABLE `itensconta`
  MODIFY `cod_itensconta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `mesa`
--
ALTER TABLE `mesa`
  MODIFY `codmesa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `atendimento`
--
ALTER TABLE `atendimento`
  ADD CONSTRAINT `fk_atendimento_garcon` FOREIGN KEY (`codgarcom`) REFERENCES `garcon` (`codgarcom`),
  ADD CONSTRAINT `fk_atendimento_mesa` FOREIGN KEY (`codmesa`) REFERENCES `mesa` (`codmesa`);

--
-- Restrições para tabelas `conta`
--
ALTER TABLE `conta`
  ADD CONSTRAINT `fk_conta_mesa` FOREIGN KEY (`codmesa`) REFERENCES `mesa` (`codmesa`);

--
-- Restrições para tabelas `itensconta`
--
ALTER TABLE `itensconta`
  ADD CONSTRAINT `fk_itensconta_conta` FOREIGN KEY (`codconta`) REFERENCES `conta` (`codconta`),
  ADD CONSTRAINT `fk_itensconta_item` FOREIGN KEY (`coditem`) REFERENCES `item` (`coditem`);

--
-- Restrições para tabelas `mesa`
--
ALTER TABLE `mesa`
  ADD CONSTRAINT `fk_mesa_area` FOREIGN KEY (`codarea`) REFERENCES `areasrestaurante` (`codarea`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
