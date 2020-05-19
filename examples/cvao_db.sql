-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2020 at 03:42 PM
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
-- Database: `cvao_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin`
(
    `id`    int(11)      NOT NULL,
    `nome`  varchar(30)  NOT NULL,
    `passe` varchar(255) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- --------------------------------------------------------

--
-- Table structure for table `casos_registrados`
--

CREATE TABLE `casos_registrados`
(
    `id`          int(11) NOT NULL,
    `confirmados` int(11) NOT NULL,
    `activos`     int(11) NOT NULL,
    `recuperados` int(11) NOT NULL,
    `obitos`      int(11) NOT NULL,
    `data_casos`  date    NOT NULL,
    `admin_id`    int(11) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- --------------------------------------------------------

--
-- Table structure for table `provincias`
--

CREATE TABLE `provincias`
(
    `id`          int(11)     NOT NULL,
    `nome`        varchar(50) NOT NULL,
    `confirmados` int(11)     NOT NULL,
    `activos`     int(11)     NOT NULL,
    `recuperados` int(11)     NOT NULL,
    `obitos`      int(11)     NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

--
-- Dumping data for table `provincias`
--

INSERT INTO `provincias` (`id`, `nome`, `confirmados`, `activos`, `recuperados`, `obitos`)
VALUES (1, 'Luanda', 0, 0, 0, 0),
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
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `casos_registrados`
--
ALTER TABLE `casos_registrados`
    ADD PRIMARY KEY (`id`),
    ADD KEY `casos_registrados_ibfk_1` (`admin_id`);

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
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `casos_registrados`
--
ALTER TABLE `casos_registrados`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
-- Constraints for table `casos_registrados`
--
ALTER TABLE `casos_registrados`
    ADD CONSTRAINT `casos_registrados_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;