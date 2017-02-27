-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2016 at 06:30 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `market_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `catalogue`
--

CREATE TABLE `catalogue` (
  `product_id` int(11) NOT NULL,
  `productname` varchar(100) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `productdesc` varchar(200) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `dateadded` date DEFAULT NULL,
  `timeadded` time DEFAULT NULL,
  `purchases` int(11) DEFAULT NULL,
  `imagepath` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `catalogue`
--

INSERT INTO `catalogue` (`product_id`, `productname`, `price`, `productdesc`, `username`, `dateadded`, `timeadded`, `purchases`, `imagepath`) VALUES
(4, 'Anjing', 100000, 'adwwada', 'kdowa', '2016-11-13', '15:13:29', 0, 'img/a.png'),
(5, 'akdowa', 12312301, 'awldpawlpdaw', 'kdowa', '2016-11-13', '16:38:12', 0, 'img/bfs2.png'),
(6, 'ZXX', 1000, 'DKWAODA', 'kdowa', '2016-11-13', '20:40:13', 0, 'img/b2.png');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`product_id`, `user_id`) VALUES
(4, 1),
(6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `purchase_id` int(10) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `product_price` int(11) DEFAULT NULL,
  `seller` varchar(30) DEFAULT NULL,
  `buyer` varchar(30) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `consignee` varchar(100) DEFAULT NULL,
  `fulladdressbuyer` varchar(250) DEFAULT NULL,
  `postalcode` int(5) DEFAULT NULL,
  `newphonenumber` varchar(12) DEFAULT NULL,
  `creditcard` varchar(12) DEFAULT NULL,
  `verification` varchar(3) DEFAULT NULL,
  `datebought` date DEFAULT NULL,
  `timebought` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`purchase_id`, `product_name`, `product_price`, `seller`, `buyer`, `image`, `quantity`, `consignee`, `fulladdressbuyer`, `postalcode`, `newphonenumber`, `creditcard`, `verification`, `datebought`, `timebought`) VALUES
(2, 'ZXX', 1000, 'kdowa', 'dendyyy', 'img/b2.png', 1, 'Dendy Suprihady', 'dwadawd', 12345, '12312312', '123123123121', '123', '2016-11-13', '21:08:52'),
(3, 'ZXX', 1000, 'kdowa', 'dendyyy', 'img/b2.png', 1, 'Dendy Suprihady', 'dwadawd', 12345, '12312312', '123139812832', '123', '2016-11-13', '21:14:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `catalogue`
--
ALTER TABLE `catalogue`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`purchase_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `catalogue`
--
ALTER TABLE `catalogue`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `purchase_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
