-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 17-Maio-2020 às 23:48
-- Versão do servidor: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `covid_ao`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `casos_diarios`
--

CREATE TABLE `casos_diarios` (
  `id` int(32) NOT NULL,
  `data_d` date NOT NULL,
  `c_confirmados` int(32) NOT NULL,
  `c_activos` int(32) NOT NULL,
  `c_recuperados` int(32) NOT NULL,
  `Mortes` int(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `casos_diarios`
--

INSERT INTO `casos_diarios` (`id`, `data_d`, `c_confirmados`, `c_activos`, `c_recuperados`, `Mortes`) VALUES
(1, '2020-05-18', 48, 28, 20, 2),
(3, '2020-05-19', 52, 30, 20, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `provincia`
--

CREATE TABLE `provincia` (
  `id` int(32) NOT NULL,
  `Nome` varchar(32) NOT NULL,
  `C_activos` int(32) NOT NULL,
  `C_recuperados` int(32) NOT NULL,
  `C_mortes` int(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `provincia`
--

INSERT INTO `provincia` (`id`, `Nome`, `C_activos`, `C_recuperados`, `C_mortes`) VALUES
(1, 'Benguela', 0, 0, 0),
(8, 'Huambo', 0, 0, 0),
(4, 'Huíla', 0, 0, 0),
(7, 'Cabinda', 0, 0, 0),
(6, 'Luanda', 48, 11, 2),
(9, 'Lunda Sul', 0, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `casos_diarios`
--
ALTER TABLE `casos_diarios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `casos_diarios`
--
ALTER TABLE `casos_diarios`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `provincia`
--
ALTER TABLE `provincia`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
