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
-- Database: `acc_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `tokendata`
--

CREATE TABLE `tokendata` (
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(200) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tokendata`
--

INSERT INTO `tokendata` (`user_id`, `token`, `create_time`) VALUES
(1, 'RhIenieUmQZgkxgEdxO3', '2016-11-13 14:05:17'),
(2, 'MLEY5Ccaeq2TULnvvxpc', '2016-11-13 14:06:14'),
(2, 'gipgqAawsT9qQdV6FXxZ', '2016-11-13 14:16:53');

-- --------------------------------------------------------

--
-- Table structure for table `userdata`
--

CREATE TABLE `userdata` (
  `user_id` int(11) NOT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `fulladdress` varchar(250) DEFAULT NULL,
  `postalcode` int(5) DEFAULT NULL,
  `phonenumber` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `userdata`
--

INSERT INTO `userdata` (`user_id`, `fullname`, `username`, `email`, `password`, `fulladdress`, `postalcode`, `phonenumber`) VALUES
(1, 'dadwako', 'kdowa', 'dad@yahoo..com', '123', 'dwadawdaw', 123, '123'),
(2, 'Dendy Suprihady', 'dendyyy', 'ded@yahoo.com', '123', 'dwadawd', 12345, '12312312'),
(3, 'Catherine Pricilla', 'catherinepricillas', 'cathericillas@gmail.com', 'tatancang', 'jalan2', 11850, '087788995609');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `userdata`
--
ALTER TABLE `userdata`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `userdata`
--
ALTER TABLE `userdata`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
