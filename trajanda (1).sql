-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 02, 2022 at 03:34 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trajanda`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank_type`
--

CREATE TABLE `bank_type` (
  `id_bank_type` int(11) NOT NULL,
  `bank_type_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `card_type`
--

CREATE TABLE `card_type` (
  `id_card_type` int(11) NOT NULL,
  `card_type_name` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id_city` int(11) NOT NULL,
  `city_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id_city`, `city_name`) VALUES
(1, 'Jakarta'),
(2, 'Bandung'),
(3, 'Makassar'),
(4, 'Surabaya'),
(5, 'Denpasar');

-- --------------------------------------------------------

--
-- Table structure for table `costumer`
--

CREATE TABLE `costumer` (
  `id_costumer` int(11) NOT NULL,
  `full_name` varchar(225) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `id_user` int(11) NOT NULL,
  `reg_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `costumer`
--

INSERT INTO `costumer` (`id_costumer`, `full_name`, `email`, `phone`, `address`, `id_user`, `reg_date`) VALUES
(5, 'Aditya Rahmanto', 'adit23@gmail.com', '', '', 6, '2022-05-30'),
(6, 'syarif', 'syarif@gmail.com', '', '', 7, '2022-05-30');

-- --------------------------------------------------------

--
-- Table structure for table `costumer_bank_account`
--

CREATE TABLE `costumer_bank_account` (
  `id_bank` int(11) NOT NULL,
  `id_costumer` int(11) NOT NULL,
  `bank_type` varchar(100) NOT NULL,
  `bank_account_name` varchar(225) NOT NULL,
  `bank_account_number` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `costumer_card_account`
--

CREATE TABLE `costumer_card_account` (
  `id_card` int(11) NOT NULL,
  `id_costumer` int(11) NOT NULL,
  `card_holder` varchar(200) NOT NULL,
  `card_number` varchar(100) NOT NULL,
  `card_type` int(11) NOT NULL,
  `exp_date` varchar(100) NOT NULL,
  `ccv` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `id_level` int(11) NOT NULL,
  `level_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id_level`, `level_name`) VALUES
(1, 'Admin'),
(2, 'User');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id_order` int(11) NOT NULL,
  `final_price` int(11) NOT NULL,
  `id_payment_type` int(11) NOT NULL,
  `buyer_name` varchar(100) NOT NULL,
  `buyer_email` varchar(100) NOT NULL,
  `buyer_phone` varchar(100) NOT NULL,
  `status` enum('Tertunda','Terbayar','Batal') NOT NULL,
  `order_date` date NOT NULL,
  `order_time` time NOT NULL,
  `id_costumer` int(11) NOT NULL,
  `id_promo_code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_cancel`
--

CREATE TABLE `order_cancel` (
  `id_order_cancel` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_costumer` int(11) NOT NULL,
  `reason` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `id_passenger` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `p_full_name` varchar(200) NOT NULL,
  `p_title` varchar(100) NOT NULL,
  `ticket_code` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`id_passenger`, `id_order`, `p_full_name`, `p_title`, `ticket_code`) VALUES
(1, 1, 'azis nuromdona maelandi', 'Tn', 'TGKIO4HTXBM'),
(2, 2, 'Aditnya Rahmanto', 'Ny', 'TGKTDS3O792'),
(3, 3, '', '', 'TGUJOIDPQPR'),
(4, 4, 'Aditya Rahmanto', 'Ny', 'TGRJBML8MEY'),
(5, 5, 'Aditya Rahmanto', 'Tn', 'TGXJPHYHS19');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id_payment` int(11) NOT NULL,
  `id_payment_type` int(11) NOT NULL,
  `status` varchar(100) NOT NULL,
  `id_reservation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment_type`
--

CREATE TABLE `payment_type` (
  `id_payment_type` int(11) NOT NULL,
  `payment_type_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_type`
--

INSERT INTO `payment_type` (`id_payment_type`, `payment_type_name`) VALUES
(1, 'Transfer Bank'),
(2, 'Kartu Kredit');

-- --------------------------------------------------------

--
-- Table structure for table `place`
--

CREATE TABLE `place` (
  `id_place` int(11) NOT NULL,
  `id_transportation_type` int(11) NOT NULL,
  `place_name` varchar(200) NOT NULL,
  `id_city` int(11) NOT NULL,
  `place_code` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `place`
--

INSERT INTO `place` (`id_place`, `id_transportation_type`, `place_name`, `id_city`, `place_code`) VALUES
(5, 1, 'Bandar Udara Internasional Husein Sastranegara', 2, 'BDO'),
(6, 1, 'Bandar Udara Internasional Soekarno-Hatta', 1, 'CGK'),
(7, 1, 'Bandar Udara Internasional Ngurah Rai', 5, 'DPS'),
(8, 1, 'Bandar Udara Internasional Sultan Hasanuddin', 3, 'UPG'),
(9, 1, 'Bandar Udara Internasional Juanda', 4, 'SUB');

-- --------------------------------------------------------

--
-- Table structure for table `promo_code`
--

CREATE TABLE `promo_code` (
  `id_promo_code` int(11) NOT NULL,
  `promo_code` varchar(50) NOT NULL,
  `promo_percentage` int(11) NOT NULL,
  `promo_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `promo_code`
--

INSERT INTO `promo_code` (`id_promo_code`, `promo_code`, `promo_percentage`, `promo_price`) VALUES
(1, 'DISKONAGUSTUS', 30, 200000),
(2, 'BANYAKBANGET', 40, 500000);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `id_reservation` int(11) NOT NULL,
  `id_rute` int(11) NOT NULL,
  `reservation_code` varchar(100) NOT NULL,
  `id_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`id_reservation`, `id_rute`, `reservation_code`, `id_order`) VALUES
(1, 1, '2727737643', 1),
(2, 1, '3667235516', 2),
(3, 2, '2384065031', 3),
(4, 3, '2574634553', 4),
(5, 3, '1964775615', 5);

-- --------------------------------------------------------

--
-- Table structure for table `rute`
--

CREATE TABLE `rute` (
  `id_rute` int(11) NOT NULL,
  `depart_at` date NOT NULL,
  `arrive_at` date NOT NULL,
  `depart_time` time NOT NULL,
  `arrive_time` time NOT NULL,
  `id_place_from` int(11) NOT NULL,
  `id_place_to` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `id_transportation` int(11) NOT NULL,
  `id_transportation_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rute`
--

INSERT INTO `rute` (`id_rute`, `depart_at`, `arrive_at`, `depart_time`, `arrive_time`, `id_place_from`, `id_place_to`, `price`, `id_transportation`, `id_transportation_type`) VALUES
(26, '2022-08-01', '2022-08-01', '17:00:00', '19:50:00', 6, 7, 951400, 7, 1),
(27, '2022-08-01', '2022-07-01', '06:00:00', '08:50:00', 6, 7, 955400, 33, 1),
(28, '2022-08-01', '2022-07-01', '07:00:00', '09:50:00', 6, 7, 955400, 34, 1),
(29, '2022-08-01', '2022-08-01', '08:00:00', '10:50:00', 6, 7, 955400, 35, 1),
(30, '2022-08-01', '2022-08-01', '09:00:00', '11:50:00', 6, 7, 955400, 36, 1),
(31, '2022-08-01', '2022-08-01', '10:00:00', '12:50:00', 6, 7, 955400, 10, 1),
(32, '2022-08-01', '2022-08-01', '11:00:00', '13:50:00', 6, 7, 955400, 37, 1),
(33, '2022-08-01', '2022-08-01', '12:00:00', '14:50:00', 6, 7, 955400, 38, 1),
(34, '2022-08-01', '2022-08-01', '05:10:00', '08:05:00', 6, 7, 969001, 39, 1),
(35, '2022-08-01', '2022-08-01', '06:00:00', '08:55:00', 6, 7, 969001, 14, 1),
(36, '2022-08-01', '2022-08-01', '09:25:00', '12:25:00', 6, 7, 969001, 20, 1),
(37, '2022-08-01', '2022-08-01', '11:40:00', '14:40:00', 6, 7, 969001, 40, 1),
(38, '2022-08-01', '2022-08-01', '13:15:00', '16:10:00', 6, 7, 969001, 41, 1),
(39, '2022-08-01', '2022-08-01', '06:00:00', '08:05:00', 6, 7, 970100, 13, 1),
(40, '2022-08-01', '2022-08-01', '09:30:00', '11:25:00', 6, 7, 970100, 42, 1),
(41, '2022-08-01', '2022-08-01', '04:55:00', '07:55:00', 6, 7, 1089876, 43, 1),
(42, '2022-08-01', '2022-05-01', '15:10:00', '18:05:00', 6, 7, 1089876, 16, 1),
(43, '2022-08-01', '2022-08-01', '16:15:00', '19:10:00', 6, 7, 1089876, 44, 1),
(44, '2022-08-01', '2022-08-01', '16:30:00', '19:20:00', 6, 7, 1111700, 11, 1),
(45, '2022-08-01', '2022-08-01', '04:30:00', '07:20:00', 6, 7, 1123700, 45, 1),
(46, '2022-08-01', '2022-08-01', '06:30:00', '09:20:00', 6, 7, 1123700, 46, 1),
(47, '2022-08-01', '2022-08-01', '07:30:00', '10:20:00', 6, 7, 1123700, 21, 1),
(48, '2022-08-01', '2022-08-01', '09:40:00', '12:40:00', 6, 7, 1225296, 47, 1),
(49, '2022-08-01', '2022-08-01', '14:25:00', '17:20:00', 6, 7, 1421900, 47, 1),
(50, '2022-08-01', '2022-08-01', '16:30:00', '19:30:00', 6, 7, 1421900, 48, 1),
(51, '2022-08-01', '2022-09-01', '05:30:00', '08:20:00', 6, 7, 1621500, 12, 1),
(52, '2022-08-01', '2022-08-01', '09:25:00', '12:20:00', 6, 7, 1623800, 24, 1),
(53, '2022-08-01', '2022-08-01', '17:30:00', '19:00:00', 6, 9, 746700, 49, 1),
(55, '2022-08-01', '2022-08-01', '04:10:00', '05:40:00', 6, 9, 750700, 50, 1),
(56, '2022-08-01', '2022-08-01', '05:30:00', '07:00:00', 6, 9, 750700, 51, 1),
(57, '2022-08-01', '2022-08-01', '09:30:00', '11:00:00', 6, 9, 750700, 52, 1),
(58, '2022-08-01', '2022-08-01', '04:30:00', '06:00:00', 6, 9, 871451, 53, 1),
(59, '2022-08-01', '2022-08-01', '05:30:00', '07:00:00', 6, 9, 871451, 54, 1),
(60, '2022-08-01', '2022-08-01', '11:55:00', '13:25:00', 6, 9, 871451, 55, 1),
(61, '2022-08-01', '2022-08-01', '18:00:00', '19:30:00', 6, 9, 920200, 56, 1),
(62, '2022-08-01', '2022-08-01', '04:00:00', '05:30:00', 6, 9, 932200, 57, 1),
(63, '2022-08-01', '2022-08-01', '09:00:00', '10:30:00', 6, 9, 932200, 58, 1),
(64, '2022-08-01', '2022-08-01', '12:00:00', '13:30:00', 6, 9, 932200, 59, 1),
(65, '2022-08-01', '2022-08-01', '16:00:00', '17:30:00', 6, 9, 978900, 60, 1),
(66, '2022-08-01', '2022-08-01', '06:15:00', '07:55:00', 6, 9, 1277600, 61, 1),
(67, '2022-08-01', '2022-08-01', '15:00:00', '16:40:00', 6, 9, 1277600, 62, 1),
(68, '2022-08-01', '2022-08-01', '16:00:00', '17:40:00', 6, 9, 1227600, 63, 1),
(69, '2022-08-01', '2022-08-01', '06:00:00', '07:00:00', 6, 9, 2534200, 64, 1),
(70, '2022-08-01', '2022-08-01', '06:00:00', '09:20:00', 6, 8, 976200, 65, 1),
(71, '2022-08-01', '2022-08-01', '22:00:00', '01:30:00', 6, 8, 1207800, 66, 1),
(72, '2022-08-01', '2022-08-01', '21:30:00', '01:00:00', 6, 8, 1211800, 68, 1),
(73, '2022-08-01', '2022-08-01', '14:05:00', '17:30:00', 6, 8, 1298300, 69, 1),
(74, '2022-08-01', '2022-08-01', '01:00:00', '04:25:00', 6, 8, 1372815, 70, 1),
(75, '2022-08-01', '2022-08-01', '05:00:00', '08:25:00', 6, 8, 1372815, 71, 1),
(76, '2022-08-01', '2022-08-01', '14:00:00', '17:25:00', 6, 8, 1372815, 72, 1),
(77, '2022-08-01', '2022-08-01', '16:25:00', '19:50:00', 6, 8, 1372815, 73, 1),
(78, '2022-08-01', '2022-08-01', '21:45:00', '01:05:00', 6, 8, 1398400, 74, 1),
(79, '2022-08-01', '2022-08-01', '22:00:00', '01:25:00', 6, 8, 1398400, 75, 1),
(80, '2022-08-01', '2022-08-01', '22:15:00', '01:40:00', 6, 8, 1398400, 76, 1),
(81, '2022-08-01', '2022-08-01', '15:30:00', '18:55:00', 6, 8, 1398900, 77, 1),
(82, '2022-08-01', '2022-08-01', '02:30:00', '06:00:00', 6, 8, 1410900, 78, 1),
(83, '2022-08-01', '2022-08-01', '03:30:00', '07:00:00', 6, 8, 1410900, 79, 1),
(84, '2022-08-01', '2022-08-02', '04:55:00', '17:20:00', 6, 5, 2071789, 82, 1),
(85, '2022-08-01', '2022-08-01', '09:10:00', '11:50:00', 5, 6, 1737100, 83, 1),
(86, '2022-08-01', '2022-08-02', '17:00:00', '13:15:00', 6, 5, 2151757, 84, 1),
(87, '2022-08-01', '2022-08-02', '06:30:00', '13:15:00', 6, 5, 2325780, 86, 1),
(88, '2022-08-01', '2022-08-01', '09:10:00', '13:20:00', 5, 6, 1804800, 88, 1),
(89, '2022-08-01', '2022-08-01', '09:10:00', '16:20:00', 5, 6, 1804800, 87, 1),
(90, '2022-08-01', '2022-08-01', '09:10:00', '17:20:00', 5, 6, 1804800, 88, 1),
(91, '2022-08-01', '2022-08-02', '09:10:00', '08:05:00', 5, 6, 2246100, 90, 1),
(92, '2022-08-01', '2022-08-02', '09:10:00', '13:05:00', 5, 6, 2246100, 91, 1),
(93, '2022-08-01', '2022-08-02', '09:10:00', '18:25:00', 5, 6, 2504093, 92, 1),
(94, '2022-08-01', '2022-08-01', '09:10:00', '17:30:00', 5, 8, 1701700, 96, 1),
(95, '2022-08-01', '2022-08-01', '09:10:00', '17:30:00', 5, 8, 1701700, 93, 1),
(96, '2022-08-01', '2022-08-01', '09:10:00', '17:00:00', 5, 8, 2044086, 97, 1),
(98, '2022-08-01', '2022-08-01', '09:10:00', '17:45:00', 5, 8, 2148068, 98, 1),
(99, '2022-08-01', '2022-08-01', '11:05:00', '16:25:00', 5, 8, 6089593, 99, 1),
(100, '2022-08-01', '2022-08-01', '17:40:00', '18:55:00', 8, 5, 1742200, 100, 1),
(101, '2022-08-01', '2022-08-02', '05:00:00', '17:20:00', 8, 5, 1834569, 101, 1),
(102, '2022-08-01', '2022-08-02', '14:20:00', '17:20:00', 8, 5, 2162208, 103, 1),
(103, '2022-08-01', '2022-08-01', '05:00:00', '13:15:00', 8, 5, 1913410, 101, 1),
(104, '2022-08-01', '2022-08-01', '09:30:00', '17:20:00', 8, 5, 2011200, 102, 1),
(105, '2022-08-01', '2022-08-02', '09:30:00', '13:15:00', 8, 5, 2360322, 102, 1),
(106, '2022-08-01', '2022-08-02', '14:20:00', '13:15:00', 8, 5, 2382037, 103, 1),
(107, '2022-08-01', '2022-08-01', '12:50:00', '15:45:00', 9, 6, 2488600, 116, 1),
(108, '2022-08-01', '2022-08-01', '07:30:00', '09:00:00', 9, 6, 982341, 115, 1),
(109, '2022-08-01', '2022-08-01', '05:05:00', '06:30:00', 9, 6, 982341, 114, 1),
(110, '2022-08-01', '2022-08-01', '06:15:00', '07:50:00', 9, 6, 1005100, 112, 1),
(111, '2022-08-01', '2022-08-01', '18:10:00', '19:40:00', 9, 6, 868000, 111, 1),
(112, '2022-08-01', '2022-08-01', '19:40:00', '21:10:00', 9, 6, 762700, 104, 1),
(113, '2022-08-01', '2022-08-01', '06:20:00', '07:50:00', 9, 6, 766700, 105, 1),
(114, '2022-08-01', '2022-08-01', '07:40:00', '09:10:00', 9, 6, 766700, 106, 1),
(115, '2022-08-01', '2022-08-02', '08:40:00', '13:15:00', 9, 5, 4364869, 123, 1),
(116, '2022-08-01', '2022-08-02', '05:00:00', '13:15:00', 9, 5, 3197410, 122, 1),
(117, '2022-08-01', '2022-08-02', '06:15:00', '17:20:00', 9, 5, 3093500, 121, 1),
(118, '2022-08-01', '2022-08-01', '06:00:00', '13:15:00', 9, 5, 1850979, 117, 1),
(119, '2022-08-01', '2022-08-01', '09:10:00', '17:20:00', 9, 5, 1440200, 118, 1),
(120, '2022-08-01', '2022-08-02', '12:45:00', '17:20:00', 9, 5, 1663400, 120, 1),
(121, '2022-08-01', '2022-08-02', '11:45:00', '17:20:00', 9, 5, 1663400, 119, 1),
(122, '2022-08-01', '2022-08-01', '06:00:00', '08:25:00', 9, 8, 879310, 124, 1),
(123, '2022-08-01', '2022-08-01', '09:30:00', '12:15:00', 9, 8, 879310, 125, 1),
(124, '2022-08-01', '2022-08-01', '18:30:00', '20:55:00', 9, 8, 879310, 126, 1),
(125, '2022-08-01', '2022-08-01', '20:30:00', '23:00:00', 9, 8, 895500, 127, 1),
(126, '2022-08-01', '2022-08-01', '06:00:00', '08:30:00', 9, 8, 907500, 128, 1),
(127, '2022-08-01', '2022-08-01', '07:15:00', '09:45:00', 9, 8, 907500, 129, 1),
(128, '2022-08-01', '2022-08-01', '05:00:00', '07:30:00', 9, 8, 965100, 131, 1);

-- --------------------------------------------------------

--
-- Table structure for table `transportation`
--

CREATE TABLE `transportation` (
  `id_transportation` int(11) NOT NULL,
  `transportation_code` varchar(50) NOT NULL,
  `transportation_name` varchar(225) NOT NULL,
  `id_transportation_class` int(11) NOT NULL,
  `id_transportation_type` int(11) NOT NULL,
  `seat_qty` int(11) NOT NULL,
  `id_transportation_company` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transportation`
--

INSERT INTO `transportation` (`id_transportation`, `transportation_code`, `transportation_name`, `id_transportation_class`, `id_transportation_type`, `seat_qty`, `id_transportation_company`) VALUES
(7, 'JT-26', '{JT-26} Boeing 737 ', 5, 1, 29, 9),
(10, 'JT-30', '{JT-30} Boeing 737', 5, 1, 29, 9),
(11, 'ID-6518', '{ID-6518} Airbus A320', 5, 1, 32, 4),
(12, 'IN-280', '{IN-280} Boeing 737', 5, 1, 29, 19),
(13, 'SJ-272', '{SJ-272} Boeing 737', 5, 1, 29, 12),
(14, 'QZ-7516', '{QZ-7516} Airbus A320', 5, 1, 28, 1),
(15, 'JT-40', '{JT-40} Boeing 737', 5, 1, 29, 9),
(16, 'QG-688', '{QG-688} Airbus A320', 5, 1, 29, 6),
(17, 'ID-6516', '{ID-6516} Boeing 737', 5, 1, 32, 4),
(18, 'QG-666', '{QG-666} Boeing 737', 5, 1, 29, 6),
(19, 'QZ-7514', '{QZ-7514} Airbus A320', 5, 1, 28, 1),
(20, 'QZ-7520', '{QZ-7520} Airbus A320', 5, 1, 28, 1),
(21, 'ID-6512', '{ID-6512} Boeing 737', 5, 1, 29, 4),
(22, 'GA-422', '{GA-422} Boeing 737', 5, 1, 29, 8),
(23, 'GA-402', '{GA-402} Boeing 737', 5, 1, 29, 8),
(24, 'GA-404', '{GA-404} Boeing 737', 5, 1, 29, 8),
(25, 'GA-408', '{GA-408} Boeing 737', 5, 1, 29, 8),
(26, 'JT-35', '{JT-35} Boeing 737', 5, 1, 29, 9),
(27, 'QZ-7525', '{QZ-7525} Airbus A320', 5, 1, 28, 1),
(28, 'JT-43', '{JT-43} Boeing 737', 5, 1, 29, 9),
(29, 'JT-31', '{JT-31} Boeing 737', 5, 1, 29, 9),
(30, 'JT-23', '{JT-23} Boeing 737', 5, 1, 29, 9),
(31, 'QZ-7527', '{QZ-7527} Airbus A320', 5, 1, 28, 1),
(32, 'QZ-7519', '{QZ-7519} Airbus A320', 5, 1, 28, 1),
(33, 'JT-34', '{JT-34} Boeing 737', 5, 1, 31, 9),
(34, 'JT-28', '{JT-28} Boeing 737', 5, 1, 29, 9),
(35, 'JT-10', '{JT-10} Boeing 737', 5, 1, 29, 9),
(36, 'JT-42', '{JT-42} Boeing 737', 5, 1, 31, 9),
(37, 'JT-22', '{JT-22} Boeing 737', 5, 1, 29, 9),
(38, 'JT-12', '{JT-12} Boeing 737', 5, 1, 29, 9),
(39, 'QZ-7510', '{QZ-7510} Airbus A320', 5, 1, 28, 1),
(40, 'QZ-7532', '{QZ-7532} Airbus A320', 5, 1, 28, 1),
(41, 'QZ-7512', '{QZ-7512} Airbus A320', 5, 1, 28, 1),
(42, 'SJ-584', '{SJ-584} Boeing 737', 5, 1, 29, 12),
(43, 'QG-682', '{QG-682} Airbus A320', 5, 1, 29, 6),
(44, 'QG-686', '{QG-686} Airbus A320', 5, 1, 29, 6),
(45, 'ID-6500', '{ID-6500} Airbus A320', 5, 1, 32, 4),
(46, 'ID-6061', '{ID-6061} Airbus A320', 5, 1, 32, 4),
(47, 'GA-410', '{GA-410} Boeing 737', 5, 1, 29, 8),
(48, 'GA-420', '{GA-420} Boeing 737', 5, 1, 29, 8),
(49, 'JT-590', '{JT-590} Boeing 737', 5, 1, 29, 9),
(50, 'JT-690', '{JT-690} Boeing 737', 5, 1, 29, 9),
(51, 'JT-748', '{JT-748} Boeing 737', 5, 1, 29, 9),
(52, 'JT-694', '{JT-694} Boeing 737', 5, 1, 31, 9),
(53, 'QG-710', '{QG-710} Airbus A320', 5, 1, 29, 6),
(54, 'QG-714', '{QG-714} Airbus A320', 5, 1, 29, 6),
(55, 'QG-716', '{QG-716} Airbus A320', 5, 1, 29, 6),
(56, 'ID-6588', '{ID-6588} Airbus A320', 5, 1, 32, 4),
(57, 'ID-6134', '{ID-6134} Airbus A320', 5, 1, 32, 4),
(58, 'ID-8580', '{ID-8580} Airbus A320', 5, 1, 32, 4),
(59, 'ID-6574', '{ID-6574} Airbus A320', 5, 1, 32, 4),
(60, 'ID-7517', '{ID-7517} Airbus A320', 5, 1, 32, 4),
(61, 'GA-304', '{GA-304} Boeing 737', 5, 1, 29, 8),
(62, 'GA-326', '{GA-326} Boeing 737', 5, 1, 29, 8),
(63, 'GA-320', '{GA-320} Boeing 737', 5, 1, 29, 8),
(64, 'IN-190', '{IN-190} Boeing 737', 5, 1, 29, 19),
(65, 'ID-7701', '{ID-7701} Airbus A320', 5, 1, 32, 4),
(66, 'JT-704', '{JT-704} Boeing 737', 5, 1, 29, 9),
(67, 'JT-798', '{JT-798} Boeing 737', 5, 1, 29, 9),
(68, 'JT-798', '{JT-798} Boeing 737', 5, 1, 29, 9),
(69, 'JT-782', '{JT-782} Boeing 737', 5, 1, 29, 9),
(70, 'QG-250', '{QG-250} Airbus A320', 5, 1, 29, 6),
(71, 'QG-340', '{QG-340} Airbus A320', 5, 1, 29, 6),
(72, 'QG-332', '{QG-332} Boeing 737', 5, 1, 29, 6),
(73, 'QG-212', '{QG-212} Airbus A320', 5, 1, 29, 6),
(74, 'SJ-580', '{SJ-580} Boeing 737', 5, 1, 29, 12),
(75, 'SJ-584', '{SJ-584} Boeing 737', 5, 1, 29, 12),
(76, 'SJ-598', '{SJ-598} Boeing 737', 5, 1, 29, 12),
(77, 'ID-6264', '{ID-6264} Airbus A320', 5, 1, 32, 4),
(78, 'ID-6182', '{ID-6182} Airbus A320', 5, 1, 32, 4),
(79, 'ID-6262', '{ID-6262} Airbus A320', 5, 1, 32, 4),
(81, 'JT-26', 'Boeing 737', 5, 1, 215, 9),
(82, 'QG-682 ', '{QG-682 } Airbus A320', 5, 1, 29, 6),
(83, 'JT-3960', '{JT-3960} Boeing 737', 5, 1, 29, 9),
(84, 'JT-26', '{JT-26} Boeing 737', 5, 1, 29, 9),
(85, 'JT-34 ', '{JT-34 } Boeing 737', 5, 1, 29, 9),
(86, 'ID-6061 ', '{ID-6061 } Airbus A320', 5, 1, 32, 4),
(87, 'JT-3960', '{JT-3960} Boeing 737', 5, 1, 29, 9),
(88, 'JT-3960', '{JT-3960} Boeing 737', 5, 1, 29, 9),
(89, 'QG-825 ', '{QG-825 } Airbus A320', 5, 1, 29, 6),
(90, 'GA-401', '{GA-401} Boeing 737', 5, 1, 31, 8),
(91, 'GA-407', '{GA-407} Airbus A320 ', 5, 1, 29, 8),
(92, 'IN-281', '{IN-281} ', 5, 1, 29, 19),
(93, 'JT-3740', '{JT-3740} Boeing 737', 5, 1, 29, 9),
(94, 'JT-3960 ', '{JT-3960 } Boeing 737', 5, 1, 29, 9),
(95, 'JT-3882', '{JT-3882} Boeing 737', 5, 1, 29, 9),
(96, 'JT-3960', '{JT-3960} Boeing 737', 5, 1, 29, 9),
(97, 'QG-342', '{QG-342} Airbus A320', 5, 1, 29, 6),
(98, 'SJ-726', '{SJ-726} Boeing 737', 5, 1, 29, 12),
(99, 'GA-616', '{GA-616} Boeing 737', 5, 1, 31, 8),
(100, 'JT-3883', '{JT-3883} Boeing 737', 5, 1, 29, 9),
(101, 'QG-343', '{QG-343} Airbus A320', 5, 1, 29, 6),
(102, 'JT-741', '{JT-741} Boeing 737', 5, 1, 29, 9),
(103, 'SJ-727', '{SJ-727} Boeing 737', 5, 1, 29, 12),
(104, 'JT-577', '{JT-577} Boeing 737', 5, 1, 31, 9),
(105, 'JT-591', '{JT-591} Boeing 737', 5, 1, 29, 9),
(106, 'JT-573', '{JT-573} Boeing 737', 5, 1, 31, 9),
(107, 'JT-581', '{JT-581} Boeing 737', 5, 1, 29, 9),
(108, 'JT-693', '{JT-693} Boeing 737', 5, 1, 29, 9),
(109, 'JT-579 ', '{JT-579 } Boeing 737', 5, 1, 29, 9),
(110, 'JT-697', '{JT-697} Boeing 737', 5, 1, 31, 9),
(111, 'ID-7516', '{ID-7516} Airbus A320', 5, 1, 32, 4),
(112, 'GA-305', '{GA-305} Boeing 737', 5, 1, 31, 8),
(113, 'GA-325 ', '{GA-325 } Boeing 737', 5, 1, 31, 8),
(114, 'QG-711', '{QG-711} Airbus A320', 5, 1, 29, 6),
(115, 'QG-713', '{QG-713} Airbus A320', 5, 1, 29, 6),
(116, 'IN-191', '{IN-191} Boeing 737', 5, 1, 29, 19),
(117, 'JT-804 ', '{JT-804 } Boeing 737', 5, 1, 29, 9),
(118, 'JT-990', '{JT-990} Boeing 737', 5, 1, 29, 9),
(119, 'QG-668', '{QG-668} Airbus A320', 5, 1, 29, 6),
(120, 'QG-698', '{QG-698} Airbus A320', 5, 1, 29, 6),
(121, 'GA-305 ', '{GA-305 } Boeing 737', 5, 1, 31, 8),
(122, 'ID-6589', '{ID-6589} Airbus A320', 5, 1, 32, 4),
(123, 'GA-309', '{GA-309} AirbusA320', 5, 1, 29, 8),
(124, 'QG-307 ', '{QG-307 } Airbus A320', 5, 1, 29, 6),
(125, 'QG-350', '{QG-350} Airbus A320', 5, 1, 29, 6),
(126, 'QG-354', '{QG-354} Airbus A320', 5, 1, 29, 6),
(127, 'JT-880', '{JT-880} Boeing 737', 5, 1, 29, 9),
(128, 'JT-708 ', '{JT-708 } Boeing 737', 5, 1, 31, 9),
(129, 'JT-706', '{JT-706} Boeing 737', 5, 1, 29, 9),
(130, 'JT-780', '{JT-780} Boeing 737', 5, 1, 29, 9),
(131, 'ID-8136', '{ID-8136} Airbus A320', 5, 1, 32, 4),
(132, 'SJ-562', '{SJ-562} Boeing 737', 5, 1, 29, 12),
(133, 'GA-305', '{GA-305} Boeing 737', 5, 1, 31, 8);

-- --------------------------------------------------------

--
-- Table structure for table `transportation_class`
--

CREATE TABLE `transportation_class` (
  `id_transportation_class` int(11) NOT NULL,
  `id_transportation_type` int(11) NOT NULL,
  `class_name` varchar(100) NOT NULL,
  `class_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transportation_class`
--

INSERT INTO `transportation_class` (`id_transportation_class`, `id_transportation_type`, `class_name`, `class_price`) VALUES
(5, 1, 'Economy', 0),
(6, 1, 'Premium Economy', 0),
(7, 1, 'Business', 0),
(8, 1, 'First Class', 0);

-- --------------------------------------------------------

--
-- Table structure for table `transportation_company`
--

CREATE TABLE `transportation_company` (
  `id_transportation_company` int(11) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `id_transportation_type` int(11) NOT NULL,
  `company_logo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transportation_company`
--

INSERT INTO `transportation_company` (`id_transportation_company`, `company_name`, `id_transportation_type`, `company_logo`) VALUES
(1, 'Air Asia', 1, 'airasia.png'),
(3, 'Air France', 1, 'airfrance.png'),
(4, 'Batik Air', 1, 'batikair.png'),
(5, 'British Airways', 1, 'britishair.png'),
(6, 'Citilink', 1, 'citilink.png'),
(7, 'Etihad Airline', 1, 'etihadair.png'),
(8, 'Garuda Indonesia', 1, 'garudaindonesia.png'),
(9, 'Lion Air', 1, 'lionair.png'),
(10, 'Malaysia Airlines', 1, 'malaysiaair.png'),
(11, 'Singapore Airlines', 1, 'singaporeair.png'),
(12, 'Sriwijaya Air', 1, 'sriwijayaair.png'),
(13, 'All Nippon Airways', 1, 'allnipponair.png'),
(14, 'Virgin Atlantic', 1, 'virgin.png'),
(15, 'Lufthansa', 1, 'lufthansa.png'),
(16, 'Eurowings', 1, 'eurowings.png'),
(17, 'KLM RoyaL Dutch Airline', 1, 'klm.png'),
(18, 'Turkish Airlines', 1, 'turkish.png'),
(19, 'NAM Air ', 1, 'nam.png');

-- --------------------------------------------------------

--
-- Table structure for table `transportation_type`
--

CREATE TABLE `transportation_type` (
  `id_transportation_type` int(11) NOT NULL,
  `transportation_type_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transportation_type`
--

INSERT INTO `transportation_type` (`id_transportation_type`, `transportation_type_name`) VALUES
(1, 'Pesawat Terbang');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `level_id`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1),
(2, 'stevenazis71@gmail.com', 'dedd87f2364c4bd3e7e7753509f44338', 2),
(3, 'yusufbintanggg@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 2),
(4, 'adit23@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 2),
(5, 'adit23@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 2),
(6, 'adit23@gmail.com', '4ee04f9698f3532e2d70ebd4ac804b6b', 2),
(7, 'syarif@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank_type`
--
ALTER TABLE `bank_type`
  ADD PRIMARY KEY (`id_bank_type`);

--
-- Indexes for table `card_type`
--
ALTER TABLE `card_type`
  ADD PRIMARY KEY (`id_card_type`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id_city`);

--
-- Indexes for table `costumer`
--
ALTER TABLE `costumer`
  ADD PRIMARY KEY (`id_costumer`);

--
-- Indexes for table `costumer_bank_account`
--
ALTER TABLE `costumer_bank_account`
  ADD PRIMARY KEY (`id_bank`);

--
-- Indexes for table `costumer_card_account`
--
ALTER TABLE `costumer_card_account`
  ADD PRIMARY KEY (`id_card`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id_level`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id_order`);

--
-- Indexes for table `order_cancel`
--
ALTER TABLE `order_cancel`
  ADD PRIMARY KEY (`id_order_cancel`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`id_passenger`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id_payment`);

--
-- Indexes for table `payment_type`
--
ALTER TABLE `payment_type`
  ADD PRIMARY KEY (`id_payment_type`);

--
-- Indexes for table `place`
--
ALTER TABLE `place`
  ADD PRIMARY KEY (`id_place`);

--
-- Indexes for table `promo_code`
--
ALTER TABLE `promo_code`
  ADD PRIMARY KEY (`id_promo_code`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id_reservation`);

--
-- Indexes for table `rute`
--
ALTER TABLE `rute`
  ADD PRIMARY KEY (`id_rute`);

--
-- Indexes for table `transportation`
--
ALTER TABLE `transportation`
  ADD PRIMARY KEY (`id_transportation`);

--
-- Indexes for table `transportation_class`
--
ALTER TABLE `transportation_class`
  ADD PRIMARY KEY (`id_transportation_class`);

--
-- Indexes for table `transportation_company`
--
ALTER TABLE `transportation_company`
  ADD PRIMARY KEY (`id_transportation_company`);

--
-- Indexes for table `transportation_type`
--
ALTER TABLE `transportation_type`
  ADD PRIMARY KEY (`id_transportation_type`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank_type`
--
ALTER TABLE `bank_type`
  MODIFY `id_bank_type` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `card_type`
--
ALTER TABLE `card_type`
  MODIFY `id_card_type` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id_city` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `costumer`
--
ALTER TABLE `costumer`
  MODIFY `id_costumer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `costumer_bank_account`
--
ALTER TABLE `costumer_bank_account`
  MODIFY `id_bank` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `costumer_card_account`
--
ALTER TABLE `costumer_card_account`
  MODIFY `id_card` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `id_level` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `order_cancel`
--
ALTER TABLE `order_cancel`
  MODIFY `id_order_cancel` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `passenger`
--
ALTER TABLE `passenger`
  MODIFY `id_passenger` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id_payment` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payment_type`
--
ALTER TABLE `payment_type`
  MODIFY `id_payment_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `place`
--
ALTER TABLE `place`
  MODIFY `id_place` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `promo_code`
--
ALTER TABLE `promo_code`
  MODIFY `id_promo_code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id_reservation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `rute`
--
ALTER TABLE `rute`
  MODIFY `id_rute` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;
--
-- AUTO_INCREMENT for table `transportation`
--
ALTER TABLE `transportation`
  MODIFY `id_transportation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;
--
-- AUTO_INCREMENT for table `transportation_class`
--
ALTER TABLE `transportation_class`
  MODIFY `id_transportation_class` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `transportation_company`
--
ALTER TABLE `transportation_company`
  MODIFY `id_transportation_company` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `transportation_type`
--
ALTER TABLE `transportation_type`
  MODIFY `id_transportation_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
