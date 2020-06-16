-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 16-Jun-2020 às 16:15
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `cvao2_db`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `passe` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `admin`
--

INSERT INTO `admin` (`id`, `nome`, `email`, `passe`) VALUES
(1, 'vijay', 'vijay.v@cvao.mail.com', '$2y$10$PYyGVdADCbBf6rt.mML.oOsTkKtrvB9u8TrvneC2QOeLPDYl9Vatm'),
(2, 'retro', 'retro@gmail.com', '$2y$10$CH.OSi8CAJFK/fZKFcyMQOwCjyduuivl7dOCZSVneW.kAuZ8d4R/a');

-- --------------------------------------------------------

--
-- Estrutura da tabela `casos`
--

CREATE TABLE `casos` (
  `id` int(11) NOT NULL,
  `novos` int(11) NOT NULL DEFAULT 0,
  `confirmados` int(11) NOT NULL DEFAULT 0,
  `activos` int(11) NOT NULL DEFAULT 0,
  `recuperados` int(11) NOT NULL DEFAULT 0,
  `obitos` int(11) NOT NULL DEFAULT 0,
  `data` date NOT NULL,
  `idAdmin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `casos`
--

INSERT INTO `casos` (`id`, `novos`, `confirmados`, `activos`, `recuperados`, `obitos`, `data`, `idAdmin`) VALUES
(14, 71, 71, 49, 18, 4, '2020-05-26', 2),
(15, 2, 73, 51, 18, 4, '2020-05-27', 2),
(16, 4, 77, 55, 18, 4, '2020-05-28', 2),
(17, 4, 81, 59, 18, 4, '2020-05-29', 2),
(18, 3, 84, 62, 18, 4, '2020-05-30', 2),
(19, 2, 86, 64, 18, 4, '2020-05-31', 2),
(20, 0, 86, 64, 18, 4, '2020-06-01', 2),
(21, 0, 86, 64, 18, 4, '2020-06-02', 2),
(22, 0, 86, 64, 18, 4, '2020-06-03', 2),
(23, 0, 86, 63, 19, 4, '2020-06-04', 2),
(24, 0, 86, 61, 21, 4, '2020-06-05', 2),
(25, 2, 88, 60, 24, 4, '2020-06-06', 2),
(26, 3, 91, 63, 24, 4, '2020-06-07', 2),
(27, 1, 92, 50, 38, 4, '2020-06-08', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `provincias`
--

CREATE TABLE `provincias` (
  `id` int(11) NOT NULL,
  `nome` varchar(40) NOT NULL,
  `confirmados` int(11) NOT NULL DEFAULT 0,
  `activos` int(11) NOT NULL DEFAULT 0,
  `recuperados` int(11) NOT NULL DEFAULT 0,
  `obitos` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `provincias`
--

INSERT INTO `provincias` (`id`, `nome`, `confirmados`, `activos`, `recuperados`, `obitos`) VALUES
(1, 'Luanda', 92, 50, 38, 4),
(2, 'Cabinda', 0, 0, 0, 0),
(3, 'Huíla', 0, 0, 0, 0),
(4, 'Benguela', 0, 0, 0, 0),
(5, 'Bengo', 0, 0, 0, 0),
(6, 'Malange', 0, 0, 0, 0),
(7, 'Huambo', 0, 0, 0, 0),
(8, 'Cuando-Cubango', 0, 0, 0, 0),
(9, 'Cuanza Norte', 0, 0, 0, 0),
(10, 'Cuanza Sul', 0, 0, 0, 0),
(11, 'Moxico', 0, 0, 0, 0),
(12, 'Uíge', 0, 0, 0, 0),
(13, 'Cunene', 0, 0, 0, 0),
(14, 'Lunda Sul', 0, 0, 0, 0),
(15, 'Lunda Norte', 0, 0, 0, 0),
(16, 'Namibe', 0, 0, 0, 0),
(17, 'Bié', 0, 0, 0, 0),
(18, 'Zaire', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `visitas`
--

CREATE TABLE `visitas` (
  `Id` int(11) NOT NULL,
  `Ip` varchar(30) NOT NULL,
  `Data` varchar(30) NOT NULL,
  `Hora` varchar(30) NOT NULL,
  `hits` varchar(30) CHARACTER SET utf8 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `visitas`
--

INSERT INTO `visitas` (`Id`, `Ip`, `Data`, `Hora`, `hits`) VALUES
(33, '105.168.13.152', '2020/06/14', '20:16', '1'),
(32, '154.127.230.144', '2020/06/14', '20:23', '4'),
(34, '105.172.183.14', '2020/06/14', '20:25', '1'),
(35, '105.168.16.241', '2020/06/14', '20:34', '1'),
(36, '31.13.103.2', '2020/06/15', '02:51', '1'),
(37, '31.13.127.112', '2020/06/15', '05:06', '1'),
(38, '173.252.87.28', '2020/06/15', '07:38', '1'),
(39, '173.252.87.113', '2020/06/15', '07:38', '1'),
(40, '173.252.87.119', '2020/06/15', '07:38', '2'),
(41, '173.252.87.111', '2020/06/15', '07:38', '1'),
(42, '173.252.87.27', '2020/06/15', '07:38', '1'),
(43, '154.127.230.144', '2020/06/15', '08:22', '1'),
(44, '173.252.87.27', '2020/06/16', '07:38', '5'),
(45, '173.252.87.87', '2020/06/16', '07:38', '5'),
(46, '178.252.87.87', '2020/06/16', '07:38', '5'),
(47, '178.252.87.87', '2020/06/17', '09:38', '5'),
(48, '178.252.83.87', '2020/06/17', '09:38', '5'),
(49, '::1', '2020/06/15', '23:00', '2'),
(50, '192.168.100.5', '2020/06/15', '23:24', '9'),
(51, '::1', '2020/06/16', '12:19', '1');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `casos`
--
ALTER TABLE `casos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idAdmin` (`idAdmin`);

--
-- Índices para tabela `provincias`
--
ALTER TABLE `provincias`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `visitas`
--
ALTER TABLE `visitas`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `casos`
--
ALTER TABLE `casos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de tabela `provincias`
--
ALTER TABLE `provincias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `visitas`
--
ALTER TABLE `visitas`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `casos`
--
ALTER TABLE `casos`
  ADD CONSTRAINT `casos_ibfk_1` FOREIGN KEY (`idAdmin`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
