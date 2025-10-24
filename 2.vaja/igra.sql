-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 14, 2019 at 01:23 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `igra`
--

-- --------------------------------------------------------

--
-- Table structure for table `igralec`
--

CREATE TABLE `igralec` (
  `vzdevek` varchar(20) NOT NULL,
  `geslo` varchar(20) NOT NULL,
  `ime` varchar(20) NOT NULL,
  `priimek` varchar(20) NOT NULL,
  `email` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `igralec`
--

INSERT INTO `igralec` (`vzdevek`, `geslo`, `ime`, `priimek`, `email`) VALUES
('franc', 'franc123', 'Franc', 'Novak', 'fr_novak@gmejl.com'),
('jure', 'joore', 'Jurij', 'Leban', 'jurijleban12@jahu.com'),
('lukas77', 'lookah', 'Luka', 'Novak', 'novakluka1357@jahu.com'),
('maja', 'cebelica', 'Maja', 'Vidmar', 'mv85@hotmejl.com'),
('mojca', 'abcd123', 'Mojca', 'Novak', 'mojca_novak82@mail.com'),
('petra', 'pet5ra', 'Petra', 'Smole', 'petrasmole@jahu.com');

-- --------------------------------------------------------

--
-- Table structure for table `odigrana_igra`
--

CREATE TABLE `odigrana_igra` (
  `IDigre` int(11) NOT NULL,
  `vzdevek` varchar(20) NOT NULL,
  `tezavnost` int(1) NOT NULL,
  `rezultat` int(3) NOT NULL,
  `casovni_zig` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `odigrana_igra`
--

INSERT INTO `odigrana_igra` (`IDigre`, `vzdevek`, `tezavnost`, `rezultat`, `casovni_zig`) VALUES
(55, 'franc', 1, 8, '2019-07-01 19:59:34'),
(56, 'franc', 1, 12, '2019-07-07 16:19:34'),
(57, 'franc', 2, 4, '2019-07-07 16:59:34'),
(58, 'franc', 2, 5, '2019-09-03 16:59:34'),
(59, 'franc', 3, 2, '2019-09-03 16:59:34'),
(60, 'jure', 1, 7, '2019-09-03 16:59:34'),
(61, 'jure', 1, 8, '2019-09-03 16:59:34'),
(62, 'jure', 1, 12, '2019-09-03 16:59:34'),
(63, 'jure', 2, 2, '2019-09-03 16:59:34'),
(64, 'jure', 2, 11, '2019-09-03 16:59:34'),
(65, 'maja', 1, 9, '2019-09-03 16:59:34'),
(66, 'maja', 2, 7, '2019-09-03 16:59:34'),
(67, 'maja', 2, 9, '2019-09-03 16:59:34'),
(68, 'maja', 2, 11, '2019-09-03 16:59:34'),
(69, 'maja', 3, 5, '2019-09-03 16:59:34'),
(70, 'mojca', 1, 9, '2019-09-03 16:59:34'),
(71, 'mojca', 2, 10, '2019-09-03 16:59:34'),
(72, 'mojca', 2, 12, '2019-09-03 16:59:34'),
(73, 'mojca', 3, 5, '2019-09-03 16:59:34'),
(74, 'mojca', 3, 4, '2019-09-03 16:59:34'),
(75, 'jure', 1, 12, '2019-09-07 18:18:29'),
(79, 'jure', 1, 12, '2019-09-09 16:10:02'),
(80, 'jure', 1, 23, '2019-09-23 15:50:37'),
(81, 'jure', 1, 23, '2019-09-23 15:50:41'),
(82, 'jure', 1, 23, '2019-09-23 15:50:42'),
(83, 'jure', 1, 23, '2019-09-23 15:50:43'),
(84, 'jure', 1, 23, '2019-09-25 08:08:28'),
(85, 'jure', 1, 23, '2019-09-25 08:09:08'),
(86, 'jure', 1, 23, '2019-10-04 08:54:28'),
(87, 'maja', 1, 10, '2019-10-14 11:00:58'),
(88, 'maja', 1, 11, '2019-10-14 11:01:06'),
(89, 'maja', 1, 14, '2019-10-14 11:01:09'),
(90, 'maja', 2, 14, '2019-10-14 11:01:14'),
(91, 'maja', 2, 13, '2019-10-14 11:01:18'),
(92, 'maja', 2, 12, '2019-10-14 11:01:21'),
(93, 'maja', 2, 9, '2019-10-14 11:01:27'),
(94, 'maja', 2, 6, '2019-10-14 11:01:30'),
(95, 'maja', 2, 6, '2019-10-14 11:01:31'),
(96, 'maja', 2, 3, '2019-10-14 11:01:34'),
(97, 'maja', 3, 3, '2019-10-14 11:01:39'),
(98, 'maja', 3, 4, '2019-10-14 11:01:43'),
(99, 'maja', 3, 7, '2019-10-14 11:01:47'),
(100, 'maja', 3, 7, '2019-10-14 11:01:48'),
(101, 'franc', 3, 7, '2019-10-14 11:02:01'),
(102, 'franc', 3, 3, '2019-10-14 11:02:04'),
(103, 'franc', 3, 3, '2019-10-14 11:02:05'),
(104, 'franc', 3, 4, '2019-10-14 11:02:09'),
(105, 'franc', 3, 4, '2019-10-14 11:02:10'),
(106, 'franc', 3, 1, '2019-10-14 11:02:16'),
(107, 'franc', 3, 2, '2019-10-14 11:02:18'),
(108, 'franc', 3, 2, '2019-10-14 11:02:19'),
(109, 'franc', 3, 5, '2019-10-14 11:02:22'),
(110, 'franc', 2, 5, '2019-10-14 11:02:27'),
(111, 'franc', 2, 8, '2019-10-14 11:02:30'),
(112, 'franc', 2, 8, '2019-10-14 11:02:31'),
(113, 'franc', 2, 9, '2019-10-14 11:02:33'),
(114, 'franc', 2, 11, '2019-10-14 11:02:37'),
(115, 'franc', 2, 13, '2019-10-14 11:02:42'),
(116, 'franc', 2, 14, '2019-10-14 11:02:44'),
(117, 'franc', 1, 14, '2019-10-14 11:02:48'),
(118, 'franc', 1, 14, '2019-10-14 11:02:49'),
(119, 'franc', 1, 15, '2019-10-14 11:02:52'),
(120, 'franc', 1, 17, '2019-10-14 11:02:55'),
(121, 'franc', 1, 7, '2019-10-14 11:02:59'),
(122, 'franc', 1, 14, '2019-10-14 11:03:04'),
(123, 'franc', 1, 13, '2019-10-14 11:03:07'),
(124, 'jure', 1, 13, '2019-10-14 11:03:14'),
(125, 'jure', 1, 13, '2019-10-14 11:03:17'),
(126, 'jure', 1, 11, '2019-10-14 11:03:19'),
(127, 'jure', 1, 15, '2019-10-14 11:03:22'),
(128, 'jure', 1, 16, '2019-10-14 11:03:24'),
(129, 'jure', 1, 13, '2019-10-14 11:03:28'),
(130, 'jure', 1, 19, '2019-10-14 11:03:31'),
(131, 'jure', 1, 19, '2019-10-14 11:03:32'),
(132, 'jure', 1, 18, '2019-10-14 11:03:36'),
(133, 'jure', 1, 7, '2019-10-14 11:03:40'),
(134, 'jure', 2, 7, '2019-10-14 11:03:42'),
(135, 'jure', 2, 6, '2019-10-14 11:03:46'),
(136, 'jure', 2, 8, '2019-10-14 11:03:49'),
(137, 'jure', 2, 8, '2019-10-14 11:03:50'),
(138, 'jure', 2, 12, '2019-10-14 11:03:53'),
(139, 'jure', 2, 12, '2019-10-14 11:03:54'),
(140, 'jure', 2, 16, '2019-10-14 11:03:57'),
(141, 'jure', 2, 14, '2019-10-14 11:04:00'),
(142, 'jure', 3, 14, '2019-10-14 11:04:05'),
(143, 'jure', 3, 13, '2019-10-14 11:04:07'),
(144, 'jure', 3, 12, '2019-10-14 11:04:09'),
(145, 'jure', 3, 12, '2019-10-14 11:04:10'),
(146, 'jure', 3, 9, '2019-10-14 11:04:12'),
(147, 'jure', 3, 4, '2019-10-14 11:04:16'),
(148, 'jure', 3, 6, '2019-10-14 11:04:19'),
(149, 'mojca', 3, 6, '2019-10-14 11:04:26'),
(150, 'mojca', 3, 6, '2019-10-14 11:04:27'),
(151, 'mojca', 3, 7, '2019-10-14 11:04:30'),
(152, 'mojca', 3, 8, '2019-10-14 11:04:33'),
(153, 'mojca', 3, 13, '2019-10-14 11:04:37'),
(154, 'mojca', 3, 12, '2019-10-14 11:04:39'),
(155, 'mojca', 3, 12, '2019-10-14 11:04:40'),
(156, 'mojca', 3, 10, '2019-10-14 11:04:43'),
(157, 'mojca', 3, 10, '2019-10-14 11:04:45'),
(158, 'mojca', 3, 10, '2019-10-14 11:04:45'),
(159, 'mojca', 2, 10, '2019-10-14 11:04:48'),
(160, 'mojca', 2, 9, '2019-10-14 11:04:52'),
(161, 'mojca', 2, 9, '2019-10-14 11:04:53'),
(162, 'mojca', 2, 2, '2019-10-14 11:04:56'),
(163, 'mojca', 2, 1, '2019-10-14 11:04:58'),
(164, 'mojca', 2, 9, '2019-10-14 11:05:02'),
(165, 'mojca', 2, 8, '2019-10-14 11:05:04'),
(166, 'mojca', 1, 8, '2019-10-14 11:05:07'),
(167, 'mojca', 1, 8, '2019-10-14 11:05:09'),
(168, 'mojca', 1, 18, '2019-10-14 11:05:11'),
(169, 'mojca', 1, 19, '2019-10-14 11:05:14'),
(170, 'mojca', 1, 21, '2019-10-14 11:05:17'),
(171, 'mojca', 1, 12, '2019-10-14 11:05:20'),
(172, 'mojca', 1, 13, '2019-10-14 11:05:23'),
(173, 'petra', 1, 13, '2019-10-14 11:09:01'),
(174, 'petra', 1, 13, '2019-10-14 11:09:02'),
(175, 'petra', 1, 11, '2019-10-14 11:09:04'),
(176, 'petra', 2, 1, '2019-10-14 11:09:07'),
(177, 'petra', 2, 1, '2019-10-14 11:09:09'),
(178, 'petra', 2, 8, '2019-10-14 11:09:13'),
(179, 'petra', 3, 1, '2019-10-14 11:09:17'),
(180, 'lukas77', 3, 0, '2019-10-14 11:09:25'),
(181, 'lukas77', 2, 8, '2019-10-14 11:09:30'),
(182, 'lukas77', 1, 18, '2019-10-14 11:09:34'),
(183, 'lukas77', 1, 13, '2019-10-14 11:09:38'),
(184, 'lukas77', 1, 11, '2019-10-14 11:09:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `igralec`
--
ALTER TABLE `igralec`
  ADD PRIMARY KEY (`vzdevek`);

--
-- Indexes for table `odigrana_igra`
--
ALTER TABLE `odigrana_igra`
  ADD PRIMARY KEY (`IDigre`),
  ADD KEY `vzdevek` (`vzdevek`),
  ADD KEY `vzdevek_2` (`vzdevek`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `odigrana_igra`
--
ALTER TABLE `odigrana_igra`
  MODIFY `IDigre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `odigrana_igra`
--
ALTER TABLE `odigrana_igra`
  ADD CONSTRAINT `odigrana_igra_ibfk_1` FOREIGN KEY (`vzdevek`) REFERENCES `igralec` (`vzdevek`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
