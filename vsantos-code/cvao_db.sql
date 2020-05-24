-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2020 at 11:37 AM
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
    `passe` varchar(255) NOT NULL,
    `email` varchar(255) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `nome`, `passe`, `email`)
VALUES (1, 'vijay', '', 'vijay.v@cvao.mail.com'),
       (2, 'usertest', '$2y$10$/7RSrSqdLL4zwGw1DxoVDe58YqA3CGugYcLg06rkhqpy6El1pV8G6', 'user.usertest@cvao.mail.com');

-- --------------------------------------------------------

--
-- Table structure for table `casos_registrados`
--

CREATE TABLE `casos_registrados`
(
    `id`          int(11) NOT NULL,
    `confirmados` int(11) NOT NULL,
    `novos`       int(11) NOT NULL DEFAULT 0,
    `activos`     int(11) NOT NULL,
    `recuperados` int(11) NOT NULL,
    `obitos`      int(11) NOT NULL,
    `data_casos`  date    NOT NULL,
    `admin_id`    int(11) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

--
-- Dumping data for table `casos_registrados`
--

INSERT INTO `casos_registrados` (`id`, `confirmados`, `novos`, `activos`, `recuperados`, `obitos`, `data_casos`,
                                 `admin_id`)
VALUES (1, 3, 3, 3, 0, 0, '2020-05-24', 2),
       (2, 6, 3, 6, 0, 0, '2020-05-24', 2),
       (3, 8, 2, 8, 0, 0, '2020-05-24', 2),
       (4, 15, 7, 13, 1, 1, '2020-05-24', 2),
       (5, 18, 3, 15, 1, 0, '2020-05-24', 2),
       (6, 18, 0, 12, 3, 0, '2020-05-24', 2);

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
VALUES (1, 'Luanda', 13, 7, 5, 1),
       (2, 'Benguela', 3, 3, 0, 0),
       (3, 'Cabinda', 2, 2, 0, 0),
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
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 3;

--
-- AUTO_INCREMENT for table `casos_registrados`
--
ALTER TABLE `casos_registrados`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 7;

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
