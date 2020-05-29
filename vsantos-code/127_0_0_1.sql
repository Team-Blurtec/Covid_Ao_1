-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2020 at 10:40 PM
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
    `nome`  varchar(40)  NOT NULL,
    `email` varchar(100) NOT NULL,
    `passe` varchar(255) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

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
    `idAdmin`     int(11) NOT NULL,
    `idData`      int(11) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- --------------------------------------------------------

--
-- Table structure for table `datas`
--

CREATE TABLE `datas`
(
    `id`   int(11) NOT NULL,
    `data` date    NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

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
       (4, 'Benguela', 0, 0, 0, 0),
       (5, 'Bengo', 0, 0, 0, 0),
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
       (16, 'Namibe', 0, 0, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
    ADD PRIMARY KEY (`id`),
    ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `casos`
--
ALTER TABLE `casos`
    ADD PRIMARY KEY (`id`),
    ADD KEY `idAdmin` (`idAdmin`),
    ADD KEY `idData` (`idData`);

--
-- Indexes for table `datas`
--
ALTER TABLE `datas`
    ADD PRIMARY KEY (`id`);

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
    AUTO_INCREMENT = 4;

--
-- AUTO_INCREMENT for table `casos`
--
ALTER TABLE `casos`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `datas`
--
ALTER TABLE `datas`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `provincias`
--
ALTER TABLE `provincias`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `casos`
--
ALTER TABLE `casos`
    ADD CONSTRAINT `casos_ibfk_1` FOREIGN KEY (`idData`) REFERENCES `datas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT `casos_ibfk_2` FOREIGN KEY (`idAdmin`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `deviango_db`
--
CREATE DATABASE IF NOT EXISTS `deviango_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `deviango_db`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin`
(
    `id`       int(11)      NOT NULL,
    `username` varchar(255) NOT NULL,
    `password` varchar(255) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars`
(
    `id`       int(11)      NOT NULL,
    `uid`      int(11)      NOT NULL,
    `stamp`    varchar(20)  NOT NULL,
    `model`    varchar(20)  NOT NULL,
    `photo`    varchar(255) NOT NULL,
    `color`    varchar(20)  NOT NULL,
    `weight`   float        NOT NULL,
    `height`   float        NOT NULL,
    `capacity` int(11)      NOT NULL,
    `brand`    varchar(100) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback`
(
    `id`         int(11)      NOT NULL,
    `uid`        int(11)      NOT NULL,
    `subject`    varchar(255) NOT NULL,
    `feedback`   mediumtext   NOT NULL,
    `created_at` timestamp    NOT NULL DEFAULT current_timestamp(),
    `replied`    tinyint(4)   NOT NULL DEFAULT 0
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes`
(
    `id`         int(11)      NOT NULL,
    `uid`        int(11)      NOT NULL,
    `title`      varchar(255) NOT NULL,
    `note`       mediumtext   NOT NULL,
    `created_at` timestamp    NOT NULL DEFAULT current_timestamp(),
    `updated_at` timestamp    NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification`
(
    `id`         int(11)      NOT NULL,
    `uid`        int(11)      NOT NULL,
    `type`       varchar(255) NOT NULL,
    `message`    varchar(255) NOT NULL,
    `created_at` timestamp    NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users`
(
    `id`           int(11)      NOT NULL,
    `cid`          varchar(20)  NOT NULL,
    `name`         varchar(100) NOT NULL,
    `email`        varchar(255) NOT NULL,
    `password`     varchar(255) NOT NULL,
    `phone`        varchar(20)  NOT NULL,
    `gender`       varchar(20)  NOT NULL,
    `DoB`          varchar(100) NOT NULL,
    `photo`        varchar(255) NOT NULL,
    `token`        varchar(100) NOT NULL,
    `token_expire` timestamp    NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
    `created_at`   timestamp    NOT NULL DEFAULT current_timestamp(),
    `verified`     tinyint(4)   NOT NULL DEFAULT 0,
    `deleted`      tinyint(4)   NOT NULL DEFAULT 1
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `cid`, `name`, `email`, `password`, `phone`, `gender`, `DoB`, `photo`, `token`,
                     `token_expire`, `created_at`, `verified`, `deleted`)
VALUES (1, '005831799CA040', 'Vitor do Espirito Santo', 'admin.userdevelop@gmail.com', '', '', '', '', '', '',
        '2020-05-15 09:13:17', '2020-05-15 09:03:49', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors`
(
    `id`   int(2)  NOT NULL,
    `hits` int(11) NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
    ADD PRIMARY KEY (`id`),
    ADD KEY `uid` (`uid`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
    ADD PRIMARY KEY (`id`),
    ADD KEY `uid` (`uid`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
    ADD PRIMARY KEY (`id`),
    ADD KEY `notes_ibfk_1` (`uid`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
    ADD PRIMARY KEY (`id`),
    ADD KEY `uid` (`uid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
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
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 2;

--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
    MODIFY `id` int(2) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cars`
--
ALTER TABLE `cars`
    ADD CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
    ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`);

--
-- Constraints for table `notes`
--
ALTER TABLE `notes`
    ADD CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
    ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`);
--
-- Database: `phapp_db`
--
CREATE DATABASE IF NOT EXISTS `phapp_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `phapp_db`;

-- --------------------------------------------------------

--
-- Table structure for table `phapp_client`
--

CREATE TABLE `phapp_client`
(
    `cli_code`        int(11)      NOT NULL,
    `cli_name`        varchar(100) NOT NULL,
    `cli_phonenumber` varchar(14)  NOT NULL,
    `cli_regdate`     datetime     NOT NULL DEFAULT current_timestamp()
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;

--
-- Dumping data for table `phapp_client`
--

INSERT INTO `phapp_client` (`cli_code`, `cli_name`, `cli_phonenumber`, `cli_regdate`)
VALUES (1, 'Vitor Santo', '935597050', '2020-04-16 23:45:53'),
       (2, 'Vitor do Espírito Santo', '935597011', '2020-04-16 23:59:40'),
       (3, 'Agnaldo de Deus', '939712144', '2020-04-17 00:05:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `phapp_client`
--
ALTER TABLE `phapp_client`
    ADD PRIMARY KEY (`cli_code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `phapp_client`
--
ALTER TABLE `phapp_client`
    MODIFY `cli_code` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 5;
--
-- Database: `phbeta_db`
--
CREATE DATABASE IF NOT EXISTS `phbeta_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `phbeta_db`;

-- --------------------------------------------------------

--
-- Table structure for table `phbeta_client`
--

CREATE TABLE `phbeta_client`
(
    `cli_code`     int(11)      NOT NULL,
    `cli_name`     varchar(50)  NOT NULL,
    `cli_email`    varchar(255) NOT NULL,
    `cli_password` varchar(255) NOT NULL,
    `cli_datetime` datetime     NOT NULL,
    `cli_onState`  tinyint(4)   NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

--
-- Dumping data for table `phbeta_client`
--

INSERT INTO `phbeta_client` (`cli_code`, `cli_name`, `cli_email`, `cli_password`, `cli_datetime`, `cli_onState`)
VALUES (1, '00PP79ubzp', 'isVsd@uroot.wme', '$2y$10$XAgD41g90ga2PweMCsTT2e96KyQ7ATdZ5yV49yIEZzEgbJuTYe8yC',
        '2020-04-26 16:10:07', 0),
       (2, '4hC4XTCtuF', 'uVBne@uroot.wme', '$2y$10$jpbUajxxhKsJkcHMqceAu.GOFWjbTGTAznbfyFjRxqqHY204QfcQW',
        '2020-04-26 16:10:08', 0),
       (3, '8rjNG1VwQa', 'f69iE@uroot.wme', '$2y$10$kreiv72ZzMTAYrJVrpEvaOQC0960wGT11.aFEpn/sIioRBexv8zEK',
        '2020-04-26 16:10:08', 0),
       (4, 'vl70RKGzUi', 'NFkdN@uroot.wme', '$2y$10$d5QcxupX.6YazD/jjorvl.3frNE49jzxOxym/X/MLClNnh7VNBLIC',
        '2020-04-26 16:10:08', 0),
       (5, 'Ak4oDkvTiO', 'jTu7w@uroot.wme', '$2y$10$0xuOaT2ia7Z4BGIelBK/bO/7pE/4wxH5S.uPeyX/RBBl7mihoxATO',
        '2020-04-26 16:10:08', 0),
       (6, 'TvSrYubMvY', 'bBP8a@uroot.wme', '$2y$10$BrL08lNcAIqQ1SarVoF7fOB0rX0w8tLphVmYJNd29QEqhfGGxjXcu',
        '2020-04-26 16:10:08', 0),
       (7, 'f2yu87Xcss', 'TGGOP@uroot.wme', '$2y$10$S0kKCjQqqvtirKAGgbwTJuO/D/nkHME2oWuvYg3tRsYxGLWprZ7s2',
        '2020-04-26 16:10:08', 0),
       (8, 'ilL7WeCNHa', 'Uyc04@uroot.wme', '$2y$10$xvcNlEOP50tiOE6TCI0ATush.3.6TB0FPMhA10s9Q80NxKvs.beUy',
        '2020-04-26 16:10:08', 0),
       (9, 'E6Sa67lNji', 'yxbSb@uroot.wme', '$2y$10$Bs.AWgVUGsnvd/Gi/BKKIuCb5fjg9NlcCPv6Wy8Tf2d5Zp6itRx3G',
        '2020-04-26 16:10:08', 0),
       (10, 'mqD68Sd63z', '63HL4@uroot.wme', '$2y$10$AquEpC3bMvIgsqQo9qIQAOzYQG3NoiRq7YQtHx9iTSSeTZll4dd9.',
        '2020-04-26 16:10:09', 0),
       (11, 't7bXgq97aO', '9bWZc@uroot.wme', '$2y$10$qRwRjVeFAa5x0TD0MZkrYud4VEvhFiKTByg5LDKNqDO.mmIqhBp2G',
        '2020-04-26 16:10:09', 0),
       (12, 'J00WcrYJZU', 'zk99X@uroot.wme', '$2y$10$JOEuCcV9WVdRqqNt8xidaeZhO.CQPB1vP8tijOLkmdnnC6ry4btEW',
        '2020-04-26 16:10:09', 0),
       (13, 'PBbQiMdyah', 'ExlyQ@uroot.wme', '$2y$10$/myJufMmPFgCHQ2sPSTl2u7gAkRXwKhul66HsGsiHobCeAJXmMBkC',
        '2020-04-26 16:10:09', 0),
       (14, 'ALfFyivyqI', 'cat6o@uroot.wme', '$2y$10$yxkxxpswbdi5pvAQGJzSnOF52ES3K5b4HeLS5Do75CEC8sCwZXvsG',
        '2020-04-26 16:10:09', 0),
       (15, 'R9WVY68UF5', 'UGhcP@uroot.wme', '$2y$10$yuBM.4rUlO.3GMgBwV8rH.j4HIw0/DFKafmqnvetzZNCCxxcAOJBy',
        '2020-04-26 16:10:09', 0),
       (16, 'ChQZTwBeIv', 'Cl0xL@uroot.wme', '$2y$10$8myRylDUwiF7KO66Ui7P5.2pvEla42FWEmAvZbHUzX5xP2onZVkHm',
        '2020-04-26 16:10:09', 0),
       (17, '0vPftKnRuf', 'rBAJI@uroot.wme', '$2y$10$/z.52ltj30sDF1LhCuc41.1jZ4fPJdjOQNBZUdqHuEPBoCIWEq2gu',
        '2020-04-26 16:10:09', 0),
       (18, 'cmK1G4YHrm', 'V3Txa@uroot.wme', '$2y$10$CuAjvMi32w36ACFo8KNH.u8kw92.xTv.pJkNBtNkyq71ffhbQIYBi',
        '2020-04-26 16:10:10', 0),
       (19, 'LVfYnv9Yxh', 'drRhq@uroot.wme', '$2y$10$TVmdk/AmvM/gdiK.Xl0SCul8pn3o6ppBjHAf.mhXnKLaX1q9AOime',
        '2020-04-26 16:10:10', 0),
       (20, '6ygqpgJYf7', '9V7yo@uroot.wme', '$2y$10$mXA8/ueDcKJwoXjWzfwsP.Q18c5rCsaCSjQ0GoQumT03vY.Ou9ipu',
        '2020-04-26 16:10:10', 0),
       (21, 'fqgrUxiLYy', 'EufOt@uroot.wme', '$2y$10$NC8Ju1gPdw/8ffO6MUvq2u28kuAJeHtiCU90Ud5a1oScgBRBGGmQ.',
        '2020-04-26 16:10:10', 0),
       (22, '4WTAl9LJ7e', 'xqGNo@uroot.wme', '$2y$10$wr1gd33TftWKahg8gbHO1uP7D71S1ZRxStQ3OGXUH79lyu3zhPz7m',
        '2020-04-26 16:10:10', 0),
       (23, 'pafOyMDgAa', 'cErks@uroot.wme', '$2y$10$1CiXkZpNvBdV8c08.FS9yuxmTo9fFtjHJmWFnG..ohKCdT6QMZzwC',
        '2020-04-26 16:10:10', 0),
       (24, 'em087tAHKU', 'TXE6c@uroot.wme', '$2y$10$riREbEPDl0aJeyoaC2mJt.SmUYMF6JeUhLnJeLq7X6IU54zAvjmpe',
        '2020-04-26 16:10:10', 0),
       (25, '0lgvrKN72S', 'LyD1H@uroot.wme', '$2y$10$tLyCeHO1zCeVp3SmMCiRTOYpgFSD5rXRMol.xSiqyE2dsWBslfkNG',
        '2020-04-26 16:10:10', 0),
       (26, 'Rr3qeSYtiV', 'afSON@uroot.wme', '$2y$10$fb8qTYlR9R1SWacJhvzUfuuh6hrc5ZHURlK18agMhhL04rM9AFkA2',
        '2020-04-26 16:10:11', 0),
       (27, '2Z1cYmccts', 'Xl576@uroot.wme', '$2y$10$ZSWXlCuuxR6vmwjZot.TE.Z/nrhcQdgu5LXcnjMgBDgDPkFtTFUU6',
        '2020-04-26 16:10:11', 0),
       (28, 'oKy1ry3YA4', 'Sq7Li@uroot.wme', '$2y$10$1QUuaN0NGR7HILelbYv4vuTinRqFbuce9/p1ASM6RCr6Ham684m2W',
        '2020-04-26 16:10:11', 0),
       (29, 'EmotBh6SNO', 'xOrnI@uroot.wme', '$2y$10$OJE4T4Zp24vuRJ/6tcB05ORAxmmHN7eE.NMOR0kAZnF05kD8XhmqC',
        '2020-04-26 16:10:11', 0),
       (30, 'Pmjx5cxWRl', 'K5eEc@uroot.wme', '$2y$10$Cp6ghC4vXJw74R7yc9GVT.uNzk/QrvdCZ4SB27dZJuXoGOs0YDHfG',
        '2020-04-26 16:10:11', 0),
       (31, 'v65ZkDitBP', 'mpDYe@uroot.wme', '$2y$10$Arlq8GYnPGSs0wixRrQcJ.S9J/Eagd6u/iqcBCyIWlaP.M4dvmDSi',
        '2020-04-26 16:10:11', 0),
       (32, 'PhhPQiQElC', '0ggQE@uroot.wme', '$2y$10$kGccvrJ0BASjH9PLCOucWOdFvJ9TuJF80RuAgkmBAJq8hKLNPHc5q',
        '2020-04-26 16:10:11', 0),
       (33, 'EZZgiSBYOq', 'KeJtJ@uroot.wme', '$2y$10$0rYV79rxOWXz0tyWOsWMv.UROZ7S6aUCx37/dxoYpbHLny6/gseJi',
        '2020-04-26 16:10:12', 0),
       (34, 'wxjk3xEUMt', 'zLMHH@uroot.wme', '$2y$10$7Ocm8BPbwBgEJgLnxvte1enz.BX1Bbf7kg7JFVh9oSMiZ.AdEr1iK',
        '2020-04-26 16:10:12', 0),
       (35, '2vnT2ld9CJ', 'XKLxj@uroot.wme', '$2y$10$k.Nk2i61dsq/Nz8KTRdLb./N7fAcXYUqe2Ebkb8pq6p3TgGVgOcri',
        '2020-04-26 16:10:12', 0),
       (36, 'V3Gz4GCXpS', 'XOufN@uroot.wme', '$2y$10$ExuV9VkUheZ2zRRjEkrlzeo0eEtbxr1NYCLCHW78zffhtIdSshbWq',
        '2020-04-26 16:10:12', 0),
       (37, 'BAEmmvSQDT', 'L6CHU@uroot.wme', '$2y$10$LcNDRhGm3vdXJk8uOJgw1O5Ix9hX5S8ov9Z9ZJ9jCZMAtmI4xQL.C',
        '2020-04-26 16:10:12', 0),
       (38, '162egC66ul', 'FfBd8@uroot.wme', '$2y$10$2I.KSfFMu.YWgQVGVaER2OoEbZcCtSY1t4mjalhu/gQnktB8QwYmC',
        '2020-04-26 16:10:12', 0),
       (39, '5n21CzjsgI', 'ZWLQe@uroot.wme', '$2y$10$ptDvlGniYvHZHUq0HS..sehFA2A6DRqQXpgWsl5VeoYxDcuMiWgDi',
        '2020-04-26 16:10:12', 0),
       (40, 'EZlfmA1UIe', 'P5jDi@uroot.wme', '$2y$10$23l9Dg1Th4A4WK4ogEw41e8zOiRO5MPlI9I2btkth2MIbULbcq3k.',
        '2020-04-26 16:10:12', 0),
       (41, 'VRPuXc8qQg', 'dq6JK@uroot.wme', '$2y$10$/D6P.X3tmladwrr38LozHO9tgbQ2DZklhYiKPyoVaMDsEJkD1WZzy',
        '2020-04-26 16:10:13', 0),
       (42, 'zno0el0loI', '6Ik75@uroot.wme', '$2y$10$BpwjBkn1yIuiMCrgI9vnpeOLShYXRvxj.vY33jBttpnjVDkTyaKmu',
        '2020-04-26 16:10:13', 0),
       (43, 'vNkony6w0P', '632f2@uroot.wme', '$2y$10$o6FTL.FFqyjNOnRxpONCXeh7UypXaJGrCsD7ywzOg.GQTP8GBxz1W',
        '2020-04-26 16:10:13', 0),
       (44, 'Yy2CyoIGPj', 'SyBxB@uroot.wme', '$2y$10$/vPjPxEZ0hlPc/JFIAlMI.t.bSlQW1f6BLKZrV.rRN4PE/uWeGc32',
        '2020-04-26 16:10:13', 0),
       (45, 'N7QZ1Iwqqp', 'ljlI9@uroot.wme', '$2y$10$AvC4bj0SSvsvDlxZK6IAAeYswftr.Eb.IYbYf6oP6V8O74p5gpCIO',
        '2020-04-26 16:10:13', 0),
       (46, 'dciRQg0fFM', 'b04YK@uroot.wme', '$2y$10$H/aDG2BHGOq50XgSYmdk1OivsD1lub96R9YJpcZEY4WacFgt6hdBW',
        '2020-04-26 16:10:13', 0),
       (47, 'sY2srxG5hL', '3YuR5@uroot.wme', '$2y$10$HFelAdiGpV8KCk3VMlO2.er95i0kjOf967l3wWj0zYK/Bm8e0e/Be',
        '2020-04-26 16:10:13', 0),
       (48, '3PIP9UsLZa', 'ypaLD@uroot.wme', '$2y$10$p6e.iCA7/u8abPn8/nGM1e.9Bia9195Jy3dkqe3AO6RS9ry9MvwNK',
        '2020-04-26 16:10:13', 0),
       (49, 'aBcvNTkuP4', 'g9YPd@uroot.wme', '$2y$10$scM9q0eqPORCirRRWNQXvu7QAjFtT9GCGZWChdwF0ZpYK00le3E5K',
        '2020-04-26 16:10:14', 0),
       (50, 'op8XbLkqSz', 'fnntU@uroot.wme', '$2y$10$0seDN.NTSAhlhC6P29PIb.SqM8htcqXgA9WTZBWZKk4RuGTx/ARFe',
        '2020-04-26 16:10:14', 0),
       (51, 'Oe6pBdwQRA', '0YwHa@uroot.wme', '$2y$10$jnQ26xOZzNZq/zA2B7egAuwbvljWVYF7FDsNuQ3OvSbh2JWY00bPe',
        '2020-04-26 16:10:14', 0),
       (52, 'QUobwFPeY7', '2CFEi@uroot.wme', '$2y$10$44lqxI1rdkA2WMG4azESmOKRzvN43LQuZCeD5PeBr3L16EFWcZxea',
        '2020-04-26 16:10:14', 0),
       (53, 'WCBAMVVokj', '1qMZ0@uroot.wme', '$2y$10$VEz9SfKPZt2ZcGfzUU9f8OvfL5bHJSG8GlqeQmioPWJcp76XCMLFK',
        '2020-04-26 16:10:14', 0),
       (54, '3PsTr0pbqL', 'pphUP@uroot.wme', '$2y$10$kvkYCXV9BjUetWTl07BG7u/IG5kllSgmkVjP2Z2W0XtnQ9xbQoVcq',
        '2020-04-26 16:10:14', 0),
       (55, 'F0cW66m9AZ', 'NgIV4@uroot.wme', '$2y$10$3DiJNtaBM87eU8t/5YxhHO.3OIdc1wyDHbC5EIBhF9BcdBGuw3uMe',
        '2020-04-26 16:10:14', 0),
       (56, '54jDUJlFGv', '1wtuC@uroot.wme', '$2y$10$IG34jhIktycHAl0Y4BYk8eYU.Del9dd0tbvu4fpdH7jJ8nLSNZqvi',
        '2020-04-26 16:10:14', 0),
       (57, 'yLR5zGZYxF', 't6IcC@uroot.wme', '$2y$10$LsejBFYT7prG5SnpHwlUMuswzpHm/dsOMw2SgnWx3mWgF8BPwgJV6',
        '2020-04-26 16:10:15', 0),
       (58, 'Ey23cr9mTL', 'WfDRo@uroot.wme', '$2y$10$F5yrzDPIJgGEVwClIXDFb.MAX8OQoIhT5b02/SYyFHHuoOMhBw5XS',
        '2020-04-26 16:10:15', 0),
       (59, 'RrcZZQzNFQ', 'pZZO7@uroot.wme', '$2y$10$WCgvBqur0KG.t6uXfUex.e9SU0QFHnS9qf5gF3JVdkdtf3ehP1b7e',
        '2020-04-26 16:10:15', 0),
       (60, 'hAaISaUadk', 'dssMB@uroot.wme', '$2y$10$OWqtGsuWbwHQbPk9pVFvd.krRouEiZocqSUGizHo5daJwYdO8oQ0G',
        '2020-04-26 16:10:15', 0),
       (61, 'CwTZRnXExR', '9VXOD@uroot.wme', '$2y$10$RD7VjXATk5AT.8s6idpPfO9myAlPOuuqroUf6lSa8Eb/Uc/XRfw52',
        '2020-04-26 16:10:15', 0),
       (62, 'Kd9vyzDRpK', 'UZK14@uroot.wme', '$2y$10$SnX.4n6Y8NhrYwE.zHD6l.F6n3.NQinnRCU7BX56pSrr8Bc7ILQZW',
        '2020-04-26 16:10:15', 0),
       (63, 'gJzBJ0JBxp', 'sgyBf@uroot.wme', '$2y$10$aob7gSCwUuroxoLKmLXTgOKOvuUivTv1VYIce7W5fooBavvmqT5gi',
        '2020-04-26 16:10:15', 0),
       (64, 'FytmDLOKzL', 'iHUQ8@uroot.wme', '$2y$10$WDRX4OPGIOyVxoSljkIAVOuQwIfdGbLMNjPK3JOJeDWaSeaN8QeAu',
        '2020-04-26 16:10:16', 0),
       (65, 'P9Sou36AHu', 'NNCer@uroot.wme', '$2y$10$GLtSYNVpAreyF1H55PNX0efdd0A2Xw7BToGZjtRI.qCXr.8T.I3Q2',
        '2020-04-26 16:10:16', 0),
       (66, 'kAX3Hrepel', 'dSUg3@uroot.wme', '$2y$10$GXUSqv.bJEHeaePMGXwss.Gppv17TERQt2XVfdFf953JHOWH9JTEy',
        '2020-04-26 16:10:16', 0),
       (67, 'LJ6BuGejQZ', '2lNSk@uroot.wme', '$2y$10$4KceK/C0HTEbdpRuqfylDuysqVJjYjd5sMGC/XymGY4OJb25zUfPy',
        '2020-04-26 16:10:16', 0),
       (68, 'u9RvRQ2zFt', '1qsOn@uroot.wme', '$2y$10$hG4GxHhHaWILtl8cEoDIPOykPdmwybsumFofOj6uyWPe08sED0G8G',
        '2020-04-26 16:10:16', 0),
       (69, '1unk6opFg9', 'r7x6m@uroot.wme', '$2y$10$tCWnxtbKJuaX9CPPyzbzlufUg8KYUQ1zddNsPtEHUtliwgkBAc58S',
        '2020-04-26 16:10:16', 0),
       (70, 'zkYA6BjJ1M', 'sAaUW@uroot.wme', '$2y$10$RKd7hG.WPx7UL1hBwQkUT.LtUCOQdBrxdOx9j0iWXvNAJrhds4TDW',
        '2020-04-26 16:10:16', 0),
       (71, 'VaOMfpobdV', 'dd4Wv@uroot.wme', '$2y$10$81o0cMxgXHSH.4w8Tj72bezoBT5bWwiWKqah41/HVE13aX2bM/F6a',
        '2020-04-26 16:10:16', 0),
       (72, 'BOUxrtD8Hw', 'z5Ujz@uroot.wme', '$2y$10$TOkFkIjcW1sCFlE8ZFXcneM0FSg3KHOXAWNreowCYbeo7EeHKjY5W',
        '2020-04-26 16:10:17', 0),
       (73, 'MP4QKwKaEu', 'HsZ0b@uroot.wme', '$2y$10$VEExfbOzQ1bbxdx4t0IUje3KVHAu3nEMIekkBxUe/zI0TlxvYqhzq',
        '2020-04-26 16:10:17', 0),
       (74, 'yd3wfjVGob', 'Ac5gs@uroot.wme', '$2y$10$l6fZktkr/tUaAE80ipRJVeo1rP4zUb30eZM4BvjS3WO8QGYDg9s/u',
        '2020-04-26 16:10:17', 0),
       (75, 'rhr2sa8d1X', 'OTBSj@uroot.wme', '$2y$10$/7HFVhUv6IuwFWCCSAAK6.16/9hK.DDPmUP5g4y5xVljY3EU7U32m',
        '2020-04-26 16:10:17', 0),
       (76, 'eSwVgUNsHc', 'CvIEg@uroot.wme', '$2y$10$wp7dU9cbB4h/lVBG3xGQh.gehrUbOUnMRMvQylsrhXjPclrx9wlgC',
        '2020-04-26 16:10:17', 0),
       (77, 'CV4fPFvZCv', 'UWIWP@uroot.wme', '$2y$10$w.GIIFBRqKb1fUK7moE5uOq9PjoNs.m8PhKb3tG.oItTcMJqCELra',
        '2020-04-26 16:10:17', 0),
       (78, 'SLGlUBGYSf', '6yJi6@uroot.wme', '$2y$10$HPgbOd3WG6Li9JdXfHng.e7fg5jSK9gGAkW.6mhUCa/LpvAQIfxoC',
        '2020-04-26 16:10:17', 0),
       (79, 'MQQAgOcKfZ', 'COZ3I@uroot.wme', '$2y$10$wpeAs1m31yHjXA/KnNS1N.Uv20MehApxfT8gKHtnRd4Kvxxg2IwMu',
        '2020-04-26 16:10:18', 0),
       (80, 'pzfiluTVfZ', 'AlBcE@uroot.wme', '$2y$10$BC3TxqGURhqfbguuRxkjPOjAl1Jp2drkYJY..I.y6vOWVicsAgENa',
        '2020-04-26 16:10:18', 0),
       (81, 'JAixU7f1tg', 'Jx4Ov@uroot.wme', '$2y$10$vYXZKQpyIBM3HvFgUOkg2u/Kn555hMIL7r6AcFvleoHDpOcvFUqBK',
        '2020-04-26 16:10:18', 0),
       (82, 'd3GUT5DNXu', 'PaDqm@uroot.wme', '$2y$10$ULH0bmYKqievbyW8/kwhUOSaSmMZNqUdU2T9gqrfcJuf/OPVsuOSa',
        '2020-04-26 16:10:18', 0),
       (83, 'K8DTo6hGGK', 'dDxHW@uroot.wme', '$2y$10$CDmlhgjMDoFYX2ySS.tON.fawENag36qTMFkEjpjDXeVIVvG2A.Dm',
        '2020-04-26 16:10:18', 0),
       (84, 'WWC2E7FFTo', 'tPrOZ@uroot.wme', '$2y$10$AYS0/cBBNIC89LOhch/XkOFVr8Xjzo30y3V6QszwcUnbX7fcDabp.',
        '2020-04-26 16:10:18', 0),
       (85, 'VIvJGy0H0b', 'Jl88q@uroot.wme', '$2y$10$G3/VFoBkaEdosDrBQfmOvO3KJ.iDIic/.4e5jIbSsuw8vnQs.tcSS',
        '2020-04-26 16:10:18', 0),
       (86, 'RXwQZxNP2P', 'lM8eF@uroot.wme', '$2y$10$60PbrSGB6T.JQzIPHfVYqeoiEKPo5chBLhG5qb1EU2xIe8imysY4i',
        '2020-04-26 16:10:19', 0),
       (87, 'Dvw6PFlILj', 'Mj8AY@uroot.wme', '$2y$10$gIsXBoJJ0UXrRxhQZB8Q/uKURkkQmmtJQt/kaFnUFcn7mZBVVNC8i',
        '2020-04-26 16:10:19', 0),
       (88, 'RiWLM2wRPe', 'z1V4d@uroot.wme', '$2y$10$6ShiXwizkcxbwdykGXAZnu2qKUfdMSTia31VpZqdlNtl1O4yRwbh6',
        '2020-04-26 16:10:19', 0),
       (89, 'O0H1FHOPja', 'Lryux@uroot.wme', '$2y$10$34Snmo0J9fBoNzJmt4cmBeu59AiUjCLavy8LIoJmRCKRy900rPZiK',
        '2020-04-26 16:10:19', 0),
       (90, 'qNUBkvH9Tu', 'C3IPU@uroot.wme', '$2y$10$5R8p0xyfCPrk2lBnYPGQlucjz02JacNRoPbimfhcSpwELqqd3yMQy',
        '2020-04-26 16:10:19', 0),
       (91, 'lDYAfcPWYt', 'HfY1F@uroot.wme', '$2y$10$bNDAl1PG9.XNOnGntiFOFeH8EGjF0WJBUyW76tGt/3o1Ef/CTJ1G.',
        '2020-04-26 16:10:19', 0),
       (92, 'WPd6MO5qP4', 'NSDzd@uroot.wme', '$2y$10$Ll0MDics4wUj..66RuEGIOz8iLCg9yZLq8YtDXCqi3lfVYmewmkpK',
        '2020-04-26 16:10:20', 0),
       (93, '2yw4NGZtjv', 'jTW2R@uroot.wme', '$2y$10$8ubFXiYKcaBhMaxObJSKlOmJTFpIHXn57Ht1OAyXMOu8yIRBJshqu',
        '2020-04-26 16:10:20', 0),
       (94, 'peHpfTsIS7', 'jZ5ce@uroot.wme', '$2y$10$/AYDFkCoTg52lUsShoAVSecMJ.Lt1GwFs0Ba6ePd5PKLEFVZDafaa',
        '2020-04-26 16:10:20', 0),
       (95, 'ZoUjtAWQCy', '6csfP@uroot.wme', '$2y$10$pMs3JjlFJ3uVsYAc7QKj2OW/S1vDiwyAHQFeT/5127cTo0Ws.piVe',
        '2020-04-26 16:10:20', 0),
       (96, 'Lnlikwz4qf', 'vfhqU@uroot.wme', '$2y$10$9zw2bIBZJMXphp/5j.K5Cu.kizmXp0dAQXcdZ0HPfhd1jEv3zm856',
        '2020-04-26 16:10:20', 0),
       (97, 'XpIjBych3Q', 'uw380@uroot.wme', '$2y$10$7xJNxs6NavnH8mE.9LI7m.IiyzGADhTtfr6Qirb7wF7Q/ECCOpNPW',
        '2020-04-26 16:10:20', 0),
       (98, '1V3MmN93Wm', '48oma@uroot.wme', '$2y$10$fALEHClQlRCXYPSoQF24ZuSJ8DVNdfAzG2jYxqhQbANg0LOtlmrqy',
        '2020-04-26 16:10:20', 0),
       (99, 'boa7SO7v6Y', 'rMlMI@uroot.wme', '$2y$10$KxUliDhFYLDbBqGx5agb8eZ9rzNjVPYP21hLNMv55ms5unvERplNy',
        '2020-04-26 16:10:21', 0),
       (100, 'NYplAFAnBo', 'h97x3@uroot.wme', '$2y$10$d5fWBIFATJPkORvO8pPmeOhJ3MRAPTFflZD/B0KL/2GjnlEnlPH/K',
        '2020-04-26 16:10:21', 0),
       (101, 'Vitor Saint-James', 'vitorSJ.igtp@uroot.wme',
        '$2y$10$YGKHo3Fn8un1BVMxdvFr6e3ckl9RmSbBcDLwEl0rblg1tFzb/FeRG', '2020-04-27 10:37:46', 0);

-- --------------------------------------------------------

--
-- Table structure for table `phbeta_comms`
--

CREATE TABLE `phbeta_comms`
(
    `coms_code`     int(11)      NOT NULL,
    `coms_clicode`  int(11)      NOT NULL,
    `inps_clicode`  int(11)      NOT NULL,
    `coms_title`    varchar(255) NOT NULL,
    `coms_text`     text         NOT NULL,
    `coms_datetime` datetime     NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

--
-- Dumping data for table `phbeta_comms`
--

INSERT INTO `phbeta_comms` (`coms_code`, `coms_clicode`, `inps_clicode`, `coms_title`, `coms_text`, `coms_datetime`)
VALUES (1, 19, 60, 'T2cCapVShh',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:25'),
       (2, 45, 31, 'cQqBDs5L7c',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:25'),
       (3, 23, 31, 'PEKSp5yIJp',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:25'),
       (4, 83, 11, 'krko2SfOLf',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:25'),
       (5, 56, 99, 'lrCiE8GL6j',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:25'),
       (6, 40, 92, '6UqRin2quT',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:25'),
       (7, 94, 63, 'XGKnbZF6A2',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:25'),
       (8, 50, 38, 'goH9e52KBp',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:25'),
       (9, 9, 10, 'wgsX17b6Sl',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:25'),
       (10, 89, 36, 'wrMD2ODUyn',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:25'),
       (11, 65, 66, 'OtedBpjE63',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:25'),
       (12, 57, 48, 'KcNUc7xuQI',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:25'),
       (13, 65, 72, 'c5NUZciFi0',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:25'),
       (14, 13, 69, 'Ot6ZiwfjTq',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:25'),
       (15, 76, 44, 'bQRdJmOtfz',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:25'),
       (16, 59, 69, 'JwqLkxd2nN',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:26'),
       (17, 14, 25, 'bQ5bJUMlN7',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:26'),
       (18, 94, 27, 'QxFTmx5O2Y',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:26'),
       (19, 4, 42, 'ouY4Nlp1HY',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:26'),
       (20, 86, 21, 'bEaWL8K5ex',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:26'),
       (21, 34, 6, '2WlRMdvI8t',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:26'),
       (22, 8, 68, 'r6z78VsjMA',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:26'),
       (23, 50, 63, '53eUXLSjei',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:26'),
       (24, 67, 2, 'Jhs9zszW1P',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:26'),
       (25, 32, 29, 'dKYfrQxACE',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:26'),
       (26, 16, 31, 'xUeyBV3IEF',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:26'),
       (27, 67, 94, 'vOF7xWFMVI',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:26'),
       (28, 84, 13, 'YTY93iPZFh',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:26'),
       (29, 99, 69, 'u9tiJqKmnm',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:26'),
       (30, 81, 89, 'VtqqNgxV6Z',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:26'),
       (31, 99, 14, 'UcfwxwVjjK',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:26'),
       (32, 68, 83, 'BPHDFvf7cX',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:26'),
       (33, 31, 27, 'vDCJGDCNT7',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:26'),
       (34, 29, 58, 'm4nX9Y5N89',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:27'),
       (35, 18, 19, 'HNPAwtkawD',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:27'),
       (36, 98, 51, 'xjr15KAoR6',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:27'),
       (37, 63, 10, 'SOpla1y9cZ',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:27'),
       (38, 12, 90, 'J8hyli0OSU',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:27'),
       (39, 36, 32, 'YljeZIIJcC',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:27'),
       (40, 41, 52, 'LFu4PrmMm8',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:27'),
       (41, 93, 51, 'F432Er6HXV',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:27'),
       (42, 79, 89, 'rmdl6IqmyI',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:27'),
       (43, 49, 69, 'bGQtah3AT7',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:27'),
       (44, 39, 64, 'uSHmi4HHdp',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:27'),
       (45, 39, 14, 'BiYrvVTAfH',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:27'),
       (46, 49, 43, '3biERsrx2F',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:27'),
       (47, 63, 37, 'YgFRK0BjoT',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:27'),
       (48, 31, 72, 'W1WhNvOCFO',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:27'),
       (49, 17, 10, 'IaTHj3yAt4',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:27'),
       (50, 5, 67, 'AbcbNBvpGP',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:27'),
       (51, 40, 73, 'PFkCXU9S8Y',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:27'),
       (52, 56, 61, 'x26N9c6mtE',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:27'),
       (53, 20, 76, 'snuebJpddW',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:27'),
       (54, 68, 24, 'DPoM58jWAH',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:28'),
       (55, 41, 56, 'lfijdpa1e6',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:28'),
       (56, 64, 55, '0vIuP1gQxG',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:28');
INSERT INTO `phbeta_comms` (`coms_code`, `coms_clicode`, `inps_clicode`, `coms_title`, `coms_text`, `coms_datetime`)
VALUES (57, 32, 10, 'YcE1tcM8xE',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:28'),
       (58, 97, 49, 'qz474Swrrj',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:28'),
       (59, 27, 84, 'Wx1zQsAJLQ',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:28'),
       (60, 64, 100, 'kZzNdg4CCH',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:28'),
       (61, 87, 47, 'TnjEwQCxoK',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:28'),
       (62, 60, 25, 'ZUcp03DIoO',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:28'),
       (63, 31, 57, 'izUTMiluWI',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:28'),
       (64, 7, 28, 'kpAeJbAIr7',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:28'),
       (65, 49, 66, 'P3H5Ob70uO',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:28'),
       (66, 76, 61, 'SahFcIzJt6',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:28'),
       (67, 48, 12, 'N7uqJ7YNZL',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:28'),
       (68, 48, 3, 'P0WzN8VBaJ',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:28'),
       (69, 22, 87, 'IgeLgaFw4m',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:28'),
       (70, 21, 87, 'aDCb2U5VjJ',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:28'),
       (71, 2, 10, 'yOlNb27Zmx',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:28'),
       (72, 5, 100, 'ms8RcqkS9L',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:28'),
       (73, 15, 77, '07iAN4BMFp',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:28'),
       (74, 24, 4, '3FR9Yr7b1m',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:28'),
       (75, 53, 21, 'BTwhAVAaNW',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:28'),
       (76, 28, 38, 'U113Pkn14H',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:28'),
       (77, 64, 80, 'n6YIx6MhkD',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:28'),
       (78, 79, 10, 'ZbhtZ1K8lJ',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:28'),
       (79, 96, 81, '80g2tpNiJ8',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:28'),
       (80, 48, 46, 'B9VZN2DCl3',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:29'),
       (81, 1, 18, '3sMoaYagxH',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:29'),
       (82, 44, 89, '4hMipygj6o',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:29'),
       (83, 30, 80, 'htdADtPLs1',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:29'),
       (84, 26, 66, 'wJRRaFCKjc',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:29'),
       (85, 20, 3, 'XuuBPEzJNd',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:29'),
       (86, 67, 76, 'w3WznzoAUP',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:29'),
       (87, 89, 90, 'bGXtdPh1LK',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:29'),
       (88, 92, 99, 'dxrOUcP0Ub',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:29'),
       (89, 74, 80, 'WHuf6Y284k',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:29'),
       (90, 18, 25, 'exwddDouSU',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:29'),
       (91, 5, 52, '1e9EWpMBV7',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:29'),
       (92, 88, 99, 'h7EElqZ78V',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:29'),
       (93, 90, 85, 'ix5bvCzTdA',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:29'),
       (94, 74, 79, 'KRiSzl7sHP',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:29'),
       (95, 60, 37, 'IsH3OQWRUc',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:29'),
       (96, 15, 73, 'tCQWiONcZP',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:29'),
       (97, 70, 74, 'TflXGysAcM',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:29'),
       (98, 94, 17, 'AXyXRVItLc',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:29'),
       (99, 35, 53, 'mZY7e9O7FR',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:29'),
       (100, 81, 1, '5tYEMpEJIs',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:29');

-- --------------------------------------------------------

--
-- Table structure for table `phbeta_inputs`
--

CREATE TABLE `phbeta_inputs`
(
    `inps_code`     int(11)      NOT NULL,
    `inps_clicode`  int(11)      NOT NULL,
    `inps_url`      varchar(255) NOT NULL,
    `inps_title`    varchar(255) NOT NULL,
    `inps_text`     text         NOT NULL,
    `inps_datetime` datetime     NOT NULL,
    `inps_onState`  tinyint(4)   NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

--
-- Dumping data for table `phbeta_inputs`
--

INSERT INTO `phbeta_inputs` (`inps_code`, `inps_clicode`, `inps_url`, `inps_title`, `inps_text`, `inps_datetime`,
                             `inps_onState`)
VALUES (1, 46, '2EMARFP8WB', '2EMARFP8WB',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:21', 0),
       (2, 44, 'CgM8FRrow6', 'CgM8FRrow6',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:21', 0),
       (3, 50, '453MzEx6de', '453MzEx6de',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:21', 0),
       (4, 43, 'pGDUXqKazN', 'pGDUXqKazN',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:21', 0),
       (5, 77, 'hQlT0qgV5v', 'hQlT0qgV5v',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:21', 0),
       (6, 51, '8W0NKX6tWv', '8W0NKX6tWv',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:21', 0),
       (7, 85, 'RiML1OuTUa', 'RiML1OuTUa',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:21', 0),
       (8, 7, 'dMQpJPMV5V', 'dMQpJPMV5V',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:21', 0),
       (9, 79, 'JUeFj9GbnQ', 'JUeFj9GbnQ',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:21', 0),
       (10, 81, 'z22jv96MKP', 'z22jv96MKP',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:21', 0),
       (11, 23, 'Mn2eVq2k5m', 'Mn2eVq2k5m',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:21', 0),
       (12, 42, 'Xfecjn6yd9', 'Xfecjn6yd9',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:22', 0),
       (13, 10, '9BcNweIEZY', '9BcNweIEZY',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:22', 0),
       (14, 62, '6qY7ipFUgl', '6qY7ipFUgl',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:22', 0),
       (15, 85, 'Y7iuL5zh1Y', 'Y7iuL5zh1Y',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:22', 0),
       (16, 43, 'hxkrm8bEqq', 'hxkrm8bEqq',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:22', 0),
       (17, 42, 'CmUU2mu3ig', 'CmUU2mu3ig',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:22', 0),
       (18, 69, 'I8pWzpFZl3', 'I8pWzpFZl3',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:22', 0),
       (19, 19, 'r7Q9zNeqDc', 'r7Q9zNeqDc',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:22', 0),
       (20, 92, 'Xw5ZeSaXHY', 'Xw5ZeSaXHY',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:22', 0),
       (21, 62, 'KxanF7sKPv', 'KxanF7sKPv',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:22', 0),
       (22, 84, '8OGDr3fiSz', '8OGDr3fiSz',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:22', 0),
       (23, 73, 'V6Ak9Mdz9C', 'V6Ak9Mdz9C',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:22', 0),
       (24, 9, 'x3kNOxuS0u', 'x3kNOxuS0u',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:22', 0),
       (25, 50, 'uRnKMUPT3M', 'uRnKMUPT3M',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:22', 0),
       (26, 97, '9MCiMrXP5e', '9MCiMrXP5e',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:22', 0),
       (27, 86, '8u4iJCyO4Y', '8u4iJCyO4Y',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:22', 0),
       (28, 94, 'K4Npovvj1X', 'K4Npovvj1X',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:22', 0),
       (29, 42, 't14zsQPlIu', 't14zsQPlIu',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:22', 0),
       (30, 30, 'v3BNzekQKo', 'v3BNzekQKo',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:22', 0),
       (31, 85, 'An4RqCkJf6', 'An4RqCkJf6',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:22', 0),
       (32, 18, 'LiNdbeIqwh', 'LiNdbeIqwh',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:22', 0),
       (33, 9, 'ZWkBoFOW7q', 'ZWkBoFOW7q',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:23', 0),
       (34, 83, 'cnFNpA5ae0', 'cnFNpA5ae0',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:23', 0),
       (35, 15, 'g38HWzLB8w', 'g38HWzLB8w',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:23', 0),
       (36, 12, 'JOTb0Mu90K', 'JOTb0Mu90K',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:23', 0),
       (37, 12, 'kJkEvGcdno', 'kJkEvGcdno',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:23', 0),
       (38, 54, 'ZOIuLavMZU', 'ZOIuLavMZU',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:23', 0),
       (39, 48, 'OLziTtB5Lt', 'OLziTtB5Lt',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:23', 0),
       (40, 30, '30O5uoyaV9', '30O5uoyaV9',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:23', 0),
       (41, 82, 'NaFHJKtTcj', 'NaFHJKtTcj',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:23', 0),
       (42, 68, '8chuY8fda3', '8chuY8fda3',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:23', 0),
       (43, 15, 'E6g0oqSbsm', 'E6g0oqSbsm',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:23', 0),
       (44, 89, '2O7woGxhWy', '2O7woGxhWy',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:23', 0),
       (45, 57, 'SqhCOUJCds', 'SqhCOUJCds',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:23', 0),
       (46, 47, 'GToiO1ZGM1', 'GToiO1ZGM1',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:23', 0),
       (47, 29, 'jinsXlZ7Hd', 'jinsXlZ7Hd',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:23', 0),
       (48, 71, 'zqWNATldhP', 'zqWNATldhP',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:23', 0),
       (49, 27, 'GWjN8AQnJE', 'GWjN8AQnJE',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:23', 0),
       (50, 97, '4RnC5s5Jpo', '4RnC5s5Jpo',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:23', 0),
       (51, 86, '3jSQPtENVM', '3jSQPtENVM',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:23', 0),
       (52, 51, 'ipYfsNvo0a', 'ipYfsNvo0a',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:23', 0),
       (53, 85, 'gjSdSPrWX6', 'gjSdSPrWX6',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:23', 0),
       (54, 34, 'KiZIwYsAci', 'KiZIwYsAci',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:23', 0),
       (55, 16, '9qBnMd7Bny', '9qBnMd7Bny',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:23', 0);
INSERT INTO `phbeta_inputs` (`inps_code`, `inps_clicode`, `inps_url`, `inps_title`, `inps_text`, `inps_datetime`,
                             `inps_onState`)
VALUES (56, 72, 'mDk2t7VL0r', 'mDk2t7VL0r',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:23', 0),
       (57, 53, 'JYYJ67nNI9', 'JYYJ67nNI9',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:23', 0),
       (58, 96, 'rbB2EGIudA', 'rbB2EGIudA',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:23', 0),
       (59, 54, 'KqSvOY1Jzj', 'KqSvOY1Jzj',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:23', 0),
       (60, 98, 'stAaLXhF1J', 'stAaLXhF1J',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:23', 0),
       (61, 36, 'VozVZmhuzY', 'VozVZmhuzY',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:23', 0),
       (62, 51, 'C4SZbBLW14', 'C4SZbBLW14',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:23', 0),
       (63, 95, 'BfbJe46AQ7', 'BfbJe46AQ7',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:23', 0),
       (64, 45, 'miPVE4URAE', 'miPVE4URAE',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:23', 0),
       (65, 56, '09ehzNGQ5C', '09ehzNGQ5C',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:24', 0),
       (66, 25, 'R4y6CaO8NK', 'R4y6CaO8NK',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:24', 0),
       (67, 74, 'CjDcIHKKE3', 'CjDcIHKKE3',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:24', 0),
       (68, 45, 'L3qS0DOq53', 'L3qS0DOq53',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:24', 0),
       (69, 71, 'MwxYOf6hUI', 'MwxYOf6hUI',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:24', 0),
       (70, 96, '9pysPaWvwL', '9pysPaWvwL',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:24', 0),
       (71, 87, 'DWgBa7WAGp', 'DWgBa7WAGp',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:24', 0),
       (72, 70, 'P7e4nXDpcv', 'P7e4nXDpcv',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:24', 0),
       (73, 92, 'CPoBfHaIZE', 'CPoBfHaIZE',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:24', 0),
       (74, 45, 'GX91dt6BPB', 'GX91dt6BPB',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:24', 0),
       (75, 80, 'i54UjbcXPo', 'i54UjbcXPo',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:24', 0),
       (76, 70, 'xBLlMLAQSM', 'xBLlMLAQSM',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:24', 0),
       (77, 2, 'nOcPFYDaoR', 'nOcPFYDaoR',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:24', 0),
       (78, 68, 'G7hpLAdALz', 'G7hpLAdALz',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:24', 0),
       (79, 77, '67s82jWBin', '67s82jWBin',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:24', 0),
       (80, 62, 'dUaPI4blg9', 'dUaPI4blg9',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:24', 0),
       (81, 19, 'W4uyu71JbT', 'W4uyu71JbT',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:24', 0),
       (82, 36, 'MvY3GLR9ep', 'MvY3GLR9ep',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:24', 0),
       (83, 34, 'dkMyLNjAYm', 'dkMyLNjAYm',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:24', 0),
       (84, 93, 'mfrdloCrEW', 'mfrdloCrEW',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:24', 0),
       (85, 40, 'gODiYW92VK', 'gODiYW92VK',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:24', 0),
       (86, 50, 'l75CJxwxlm', 'l75CJxwxlm',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:24', 0),
       (87, 12, 'KqbEpSEwl8', 'KqbEpSEwl8',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:24', 0),
       (88, 69, '9i3TuUwYIO', '9i3TuUwYIO',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:24', 0),
       (89, 62, 'mCqYaawEBe', 'mCqYaawEBe',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:24', 0),
       (90, 11, '23xbsHL7xg', '23xbsHL7xg',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:24', 0),
       (91, 45, 'wceKIES1sh', 'wceKIES1sh',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:24', 0),
       (92, 37, 'PJBZKgVaQK', 'PJBZKgVaQK',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:24', 0),
       (93, 100, 'mlY4GCOnPi', 'mlY4GCOnPi',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:24', 0),
       (94, 2, '8iBT2OyiNe', '8iBT2OyiNe',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:24', 0),
       (95, 18, '72v6nbWNn6', '72v6nbWNn6',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:25', 0),
       (96, 97, 'HxlRJe70wD', 'HxlRJe70wD',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:25', 0),
       (97, 75, 'BAeFl5ey5L', 'BAeFl5ey5L',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:25', 0),
       (98, 81, 'lH5Udx81sa', 'lH5Udx81sa',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:25', 0),
       (99, 71, 'i1x7tK2h7c', 'i1x7tK2h7c',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:25', 0),
       (100, 83, 'G5MkghAm34', 'G5MkghAm34',
        'No ano de 2020, a humanidade avançou para o estágio das tendencias tecnológicas e um grande crescimento populacional mundial.\r\nAs pessoas começaram a se socializar mais do que nunca e, buscando deixar suas marcas no Planeta.\r\nSeja através do desporto, da política, da ciência, dos memes, qualquer coisa poderá levar até a glória.\r\nMas nisso tudo, o racismo não foi deixado a parte... hmm... não é o racismo entre negros e brancos, mas sim algo pior...\r\nAgora eu pergunto: “será que essa introdução importa?”\r\nEstás a perder teu tempo a ler este prólogo idiota! \r\nEsta história é sobre “Otakus”! Esses são os novos tipos de seres humanos que estão a ser vítimas de racismo mas, estão a tornar este mundo idiota muito mais divertido do que antes.\r\nCiência?! O caraças! Nem mesmo a religião domina...\r\nCONHEÇA OS OTAKUS!\r\n',
        '2020-04-26 16:10:25', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `phbeta_client`
--
ALTER TABLE `phbeta_client`
    ADD PRIMARY KEY (`cli_code`),
    ADD UNIQUE KEY `cli_code` (`cli_code`),
    ADD UNIQUE KEY `cli_name` (`cli_name`),
    ADD UNIQUE KEY `cli_email` (`cli_email`);

--
-- Indexes for table `phbeta_comms`
--
ALTER TABLE `phbeta_comms`
    ADD PRIMARY KEY (`coms_code`),
    ADD UNIQUE KEY `coms_code` (`coms_code`),
    ADD KEY `coms_clicode` (`coms_clicode`),
    ADD KEY `inps_clicode` (`inps_clicode`);

--
-- Indexes for table `phbeta_inputs`
--
ALTER TABLE `phbeta_inputs`
    ADD PRIMARY KEY (`inps_code`),
    ADD UNIQUE KEY `inps_code` (`inps_code`),
    ADD UNIQUE KEY `inps_url` (`inps_url`),
    ADD UNIQUE KEY `inps_title` (`inps_title`),
    ADD KEY `inps_clicode` (`inps_clicode`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `phbeta_client`
--
ALTER TABLE `phbeta_client`
    MODIFY `cli_code` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 102;

--
-- AUTO_INCREMENT for table `phbeta_comms`
--
ALTER TABLE `phbeta_comms`
    MODIFY `coms_code` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 101;

--
-- AUTO_INCREMENT for table `phbeta_inputs`
--
ALTER TABLE `phbeta_inputs`
    MODIFY `inps_code` int(11) NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 101;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `phbeta_comms`
--
ALTER TABLE `phbeta_comms`
    ADD CONSTRAINT `phbeta_comms_ibfk_1` FOREIGN KEY (`coms_clicode`) REFERENCES `phbeta_client` (`cli_code`) ON UPDATE CASCADE,
    ADD CONSTRAINT `phbeta_comms_ibfk_2` FOREIGN KEY (`inps_clicode`) REFERENCES `phbeta_inputs` (`inps_code`) ON UPDATE CASCADE;

--
-- Constraints for table `phbeta_inputs`
--
ALTER TABLE `phbeta_inputs`
    ADD CONSTRAINT `phbeta_inputs_ibfk_1` FOREIGN KEY (`inps_clicode`) REFERENCES `phbeta_client` (`cli_code`) ON UPDATE CASCADE;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark`
(
    `id`    int(10) UNSIGNED                NOT NULL,
    `dbase` varchar(255) COLLATE utf8_bin   NOT NULL DEFAULT '',
    `user`  varchar(255) COLLATE utf8_bin   NOT NULL DEFAULT '',
    `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
    `query` text COLLATE utf8_bin           NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin COMMENT ='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns`
(
    `db_name`       varchar(64) COLLATE utf8_bin NOT NULL,
    `col_name`      varchar(64) COLLATE utf8_bin NOT NULL,
    `col_type`      varchar(64) COLLATE utf8_bin NOT NULL,
    `col_length`    text COLLATE utf8_bin         DEFAULT NULL,
    `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
    `col_isNull`    tinyint(1)                   NOT NULL,
    `col_extra`     varchar(255) COLLATE utf8_bin DEFAULT '',
    `col_default`   text COLLATE utf8_bin         DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin COMMENT ='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info`
(
    `id`                           int(5) UNSIGNED                 NOT NULL,
    `db_name`                      varchar(64) COLLATE utf8_bin    NOT NULL DEFAULT '',
    `table_name`                   varchar(64) COLLATE utf8_bin    NOT NULL DEFAULT '',
    `column_name`                  varchar(64) COLLATE utf8_bin    NOT NULL DEFAULT '',
    `comment`                      varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
    `mimetype`                     varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
    `transformation`               varchar(255) COLLATE utf8_bin   NOT NULL DEFAULT '',
    `transformation_options`       varchar(255) COLLATE utf8_bin   NOT NULL DEFAULT '',
    `input_transformation`         varchar(255) COLLATE utf8_bin   NOT NULL DEFAULT '',
    `input_transformation_options` varchar(255) COLLATE utf8_bin   NOT NULL DEFAULT ''
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin COMMENT ='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings`
(
    `username`      varchar(64) COLLATE utf8_bin NOT NULL,
    `settings_data` text COLLATE utf8_bin        NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin COMMENT ='Settings related to Designer';

--
-- Dumping data for table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`)
VALUES ('root', '{\"snap_to_grid\":\"off\",\"relation_lines\":\"true\",\"angular_direct\":\"direct\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates`
(
    `id`            int(5) UNSIGNED              NOT NULL,
    `username`      varchar(64) COLLATE utf8_bin NOT NULL,
    `export_type`   varchar(10) COLLATE utf8_bin NOT NULL,
    `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
    `template_data` text COLLATE utf8_bin        NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin COMMENT ='Saved export templates';

--
-- Dumping data for table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`)
VALUES (1, 'root', 'database', 'f_phbeta_db',
        '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"phbeta_client\",\"phbeta_comms\",\"phbeta_inputs\"],\"table_structure[]\":[\"phbeta_client\",\"phbeta_comms\",\"phbeta_inputs\"],\"table_data[]\":[\"phbeta_client\",\"phbeta_comms\",\"phbeta_inputs\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite`
(
    `username` varchar(64) COLLATE utf8_bin NOT NULL,
    `tables`   text COLLATE utf8_bin        NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin COMMENT ='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history`
(
    `id`        bigint(20) UNSIGNED          NOT NULL,
    `username`  varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
    `db`        varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
    `table`     varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
    `timevalue` timestamp                    NOT NULL DEFAULT current_timestamp(),
    `sqlquery`  text COLLATE utf8_bin        NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin COMMENT ='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding`
(
    `username`   varchar(64) COLLATE utf8_bin NOT NULL,
    `item_name`  varchar(64) COLLATE utf8_bin NOT NULL,
    `item_type`  varchar(64) COLLATE utf8_bin NOT NULL,
    `db_name`    varchar(64) COLLATE utf8_bin NOT NULL,
    `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin COMMENT ='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages`
(
    `db_name`    varchar(64) COLLATE utf8_bin   NOT NULL DEFAULT '',
    `page_nr`    int(10) UNSIGNED               NOT NULL,
    `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin COMMENT ='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent`
(
    `username` varchar(64) COLLATE utf8_bin NOT NULL,
    `tables`   text COLLATE utf8_bin        NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin COMMENT ='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`)
VALUES ('root',
        '[{\"db\":\"db_phdvt\",\"table\":\"users\"},{\"db\":\"phbeta_db\",\"table\":\"phbeta_comms\"},{\"db\":\"phbeta_db\",\"table\":\"phbeta_client\"},{\"db\":\"phbeta_db\",\"table\":\"phbeta_inputs\"},{\"db\":\"dbsistemavenda\",\"table\":\"tbvenda\"},{\"db\":\"dbsistemavenda\",\"table\":\"tbproduto\"},{\"db\":\"dbsistemavenda\",\"table\":\"tbitemvenda\"},{\"db\":\"dbsistemavenda\",\"table\":\"tbitemcompra\"},{\"db\":\"dbsistemavenda\",\"table\":\"tbfornecedor\"},{\"db\":\"dbsistemavenda\",\"table\":\"tbcompra\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation`
(
    `master_db`     varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
    `master_table`  varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
    `master_field`  varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
    `foreign_db`    varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
    `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
    `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin COMMENT ='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches`
(
    `id`          int(5) UNSIGNED              NOT NULL,
    `username`    varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
    `db_name`     varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
    `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
    `search_data` text COLLATE utf8_bin        NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin COMMENT ='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords`
(
    `db_name`         varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
    `table_name`      varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
    `pdf_page_number` int(11)                      NOT NULL DEFAULT 0,
    `x`               float UNSIGNED               NOT NULL DEFAULT 0,
    `y`               float UNSIGNED               NOT NULL DEFAULT 0
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin COMMENT ='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info`
(
    `db_name`       varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
    `table_name`    varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
    `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin COMMENT ='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs`
(
    `username`    varchar(64) COLLATE utf8_bin NOT NULL,
    `db_name`     varchar(64) COLLATE utf8_bin NOT NULL,
    `table_name`  varchar(64) COLLATE utf8_bin NOT NULL,
    `prefs`       text COLLATE utf8_bin        NOT NULL,
    `last_update` timestamp                    NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin COMMENT ='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`)
VALUES ('root', 'phbeta_db', 'phbeta_comms', '{\"sorted_col\":\"`inps_clicode` ASC\"}', '2020-04-25 16:54:10');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking`
(
    `db_name`         varchar(64) COLLATE utf8_bin NOT NULL,
    `table_name`      varchar(64) COLLATE utf8_bin NOT NULL,
    `version`         int(10) UNSIGNED             NOT NULL,
    `date_created`    datetime                     NOT NULL,
    `date_updated`    datetime                     NOT NULL,
    `schema_snapshot` text COLLATE utf8_bin        NOT NULL,
    `schema_sql`      text COLLATE utf8_bin                                                                                                                                                                                                                                 DEFAULT NULL,
    `data_sql`        longtext COLLATE utf8_bin                                                                                                                                                                                                                             DEFAULT NULL,
    `tracking`        set ('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
    `tracking_active` int(1) UNSIGNED              NOT NULL                                                                                                                                                                                                                 DEFAULT 1
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin COMMENT ='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig`
(
    `username`    varchar(64) COLLATE utf8_bin NOT NULL,
    `timevalue`   timestamp                    NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
    `config_data` text COLLATE utf8_bin        NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin COMMENT ='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`)
VALUES ('root', '2020-05-05 13:53:52', '{\"Console\\/Mode\":\"collapse\",\"ThemeDefault\":\"pmahomme\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups`
(
    `usergroup` varchar(64) COLLATE utf8_bin    NOT NULL,
    `tab`       varchar(64) COLLATE utf8_bin    NOT NULL,
    `allowed`   enum ('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin COMMENT ='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users`
(
    `username`  varchar(64) COLLATE utf8_bin NOT NULL,
    `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin COMMENT ='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
    ADD PRIMARY KEY (`db_name`, `col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
    ADD PRIMARY KEY (`id`),
    ADD UNIQUE KEY `db_name` (`db_name`, `table_name`, `column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
    ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
    ADD PRIMARY KEY (`id`),
    ADD UNIQUE KEY `u_user_type_template` (`username`, `export_type`, `template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
    ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
    ADD PRIMARY KEY (`id`),
    ADD KEY `username` (`username`, `db`, `table`, `timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
    ADD PRIMARY KEY (`username`, `item_name`, `item_type`, `db_name`, `table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
    ADD PRIMARY KEY (`page_nr`),
    ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
    ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
    ADD PRIMARY KEY (`master_db`, `master_table`, `master_field`),
    ADD KEY `foreign_field` (`foreign_db`, `foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
    ADD PRIMARY KEY (`id`),
    ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`, `db_name`, `search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
    ADD PRIMARY KEY (`db_name`, `table_name`, `pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
    ADD PRIMARY KEY (`db_name`, `table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
    ADD PRIMARY KEY (`username`, `db_name`, `table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
    ADD PRIMARY KEY (`db_name`, `table_name`, `version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
    ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
    ADD PRIMARY KEY (`usergroup`, `tab`, `allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
    ADD PRIMARY KEY (`username`, `usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
    MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
    MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 2;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
    MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
    MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
    MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
