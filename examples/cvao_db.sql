-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22-Maio-2020 às 21:59
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
-- Banco de dados: `cvao_db`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `passe` varchar(255) NOT NULL,
  `email` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `admin`
--

INSERT INTO `admin` (`id`, `nome`, `passe`, `email`) VALUES
(1, 'retro', '$2y$10$vmcGbQHQ.r6VyzJwegbhc.K6sAr126T/zUxJaFjxSWBF9RcU/30Py', 'retro@gmail.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `casos_registrados`
--

CREATE TABLE `casos_registrados` (
  `id` int(11) NOT NULL,
  `confirmados` int(11) NOT NULL,
  `activos` int(11) NOT NULL,
  `recuperados` int(11) NOT NULL,
  `obitos` int(11) NOT NULL,
  `data_casos` date NOT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `casos_registrados`
--

INSERT INTO `casos_registrados` (`id`, `confirmados`, `activos`, `recuperados`, `obitos`, `data_casos`, `admin_id`) VALUES
(1, 60, 39, 18, 3, '2020-05-22', 1),
(2, 65, 56, 56, 56, '2020-05-07', 1),
(3, 65, 56, 56, 56, '2020-05-07', 1),
(4, 65, 56, 56, 56, '2020-05-07', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `provincias`
--

CREATE TABLE `provincias` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `confirmados` int(11) NOT NULL,
  `activos` int(11) NOT NULL,
  `recuperados` int(11) NOT NULL,
  `obitos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `provincias`
--

INSERT INTO `provincias` (`id`, `nome`, `confirmados`, `activos`, `recuperados`, `obitos`) VALUES
(1, 'Luanda', 60, 39, 18, 3),
(2, 'Benguela', 0, 0, 0, 0),
(3, 'Cabinda', 0, 0, 0, 0),
(4, 'Huíla', 0, 0, 0, 0),
(5, 'Huambo', 0, 0, 0, 0),
(6, 'Namibe', 0, 0, 0, 0),
(7, 'Malanje', 0, 0, 0, 0),
(8, 'Bengo', 0, 0, 0, 0),
(9, 'Bié', 0, 0, 0, 0),
(10, 'Cuando Cubango', 0, 0, 0, 0),
(11, 'Moxico', 0, 0, 0, 0),
(12, 'Cunene', 0, 0, 0, 0),
(13, 'Lunda Norte', 0, 0, 0, 0),
(14, 'Lunda Sul', 0, 0, 0, 0),
(15, 'Uíge', 0, 0, 0, 0),
(16, 'Zaire', 0, 0, 0, 0),
(17, 'Kwanza Norte', 0, 0, 0, 0),
(18, 'Kwanza Sul', 0, 0, 0, 0);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `casos_registrados`
--
ALTER TABLE `casos_registrados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `casos_registrados_ibfk_1` (`admin_id`);

--
-- Índices para tabela `provincias`
--
ALTER TABLE `provincias`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `casos_registrados`
--
ALTER TABLE `casos_registrados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `provincias`
--
ALTER TABLE `provincias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `casos_registrados`
--
ALTER TABLE `casos_registrados`
  ADD CONSTRAINT `casos_registrados_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
