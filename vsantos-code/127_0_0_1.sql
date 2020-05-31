-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2020 at 10:54 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cvao2_db`
--
CREATE DATABASE IF NOT EXISTS `cvao2_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cvao2_db`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin`
(
    `id`    int(11)      NOT NULL,
    `nome`  varchar(20)  NOT NULL,
    `email` varchar(40)  NOT NULL,
    `passe` varchar(255) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `nome`, `email`, `passe`)
VALUES (1, 'vijay', 'vijay.v@cvao.mail.com', '$2y$10$PYyGVdADCbBf6rt.mML.oOsTkKtrvB9u8TrvneC2QOeLPDYl9Vatm');

-- --------------------------------------------------------

--
-- Table structure for table `casos`
--

CREATE TABLE `casos`
(
    `id`          int(11) NOT NULL,
    `novos`       int(11) NOT NULL DEFAULT 0,
    `confirmados` int(11) NOT NULL DEFAULT 0,
    `activos`     int(11) NOT NULL DEFAULT 0,
    `recuperados` int(11) NOT NULL DEFAULT 0,
    `obitos`      int(11) NOT NULL DEFAULT 0,
    `data`        date    NOT NULL,
    `idAdmin`     int(11) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

--
-- Dumping data for table `casos`
--

INSERT INTO `casos` (`id`, `novos`, `confirmados`, `activos`, `recuperados`, `obitos`, `data`, `idAdmin`)
VALUES (1, 6, 6, 6, 0, 0, '2020-05-31', 1),
       (2, 5, 6, 4, 2, 0, '2020-06-01', 1),
       (3, 3, 6, 4, 2, 0, '2020-06-02', 1),
       (4, 2, 16, 12, 4, 0, '2020-06-03', 1);

-- --------------------------------------------------------

--
-- Table structure for table `provincias`
--

CREATE TABLE `provincias`
(
    `id`          int(11)     NOT NULL,
    `nome`        varchar(40) NOT NULL,
    `confirmados` int(11)     NOT NULL DEFAULT 0,
    `activos`     int(11)     NOT NULL DEFAULT 0,
    `recuperados` int(11)     NOT NULL DEFAULT 0,
    `obitos`      int(11)     NOT NULL DEFAULT 0
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

--
-- Dumping data for table `provincias`
--

INSERT INTO `provincias` (`id`, `nome`, `confirmados`, `activos`, `recuperados`, `obitos`)
VALUES (1, 'Luanda', 0, 0, 0, 0),
       (2, 'Cabinda', 0, 0, 0, 0),
       (3, 'Huíla', 0, 0, 0, 0),
       (4, 'Benguela', 5, 1, 4, 0),
       (5, 'Bengo', 6, 6, 0, 0),
       (6, 'Malange', 0, 0, 0, 0),
       (7, 'Huambo', 0, 0, 0, 0),
       (8, 'Kuando Kubango', 0, 0, 0, 0),
       (9, 'Kwanza Norte', 0, 0, 0, 0),
       (10, 'Kwanza Sul', 0, 0, 0, 0),
       (11, 'Moxico', 0, 0, 0, 0),
       (12, 'Uíge', 0, 0, 0, 0),
       (13, 'Cunene', 0, 0, 0, 0),
       (14, 'Lunda Sul', 0, 0, 0, 0),
       (15, 'Lunda Norte', 0, 0, 0, 0),
       (16, 'Namibe', 0, 0, 0, 0),
       (17, 'Bié', 5, 5, 0, 0),
       (18, 'Zaire', 0, 0, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `casos`
--
ALTER TABLE `casos`
    ADD PRIMARY KEY (`id`),
    ADD KEY `idAdmin` (`idAdmin`);

--
-- Indexes for table `provincias`
--
ALTER TABLE `provincias`
    ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 2;

--
-- AUTO_INCREMENT for table `casos`
--
ALTER TABLE `casos`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 5;

--
-- AUTO_INCREMENT for table `provincias`
--
ALTER TABLE `provincias`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `casos`
--
ALTER TABLE `casos`
    ADD CONSTRAINT `casos_ibfk_1` FOREIGN KEY (`idAdmin`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
