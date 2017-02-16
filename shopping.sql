-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 10, 2017 at 08:29 AM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `shopping`
--
CREATE DATABASE `shopping` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `shopping`;

-- --------------------------------------------------------

--
-- Table structure for table `auto_gen_id`
--

CREATE TABLE IF NOT EXISTS `auto_gen_id` (
  `form_name` varchar(50) NOT NULL,
  `prefix_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`form_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auto_gen_id`
--

INSERT INTO `auto_gen_id` (`form_name`, `prefix_id`) VALUES
('customer', 'CUST-00000'),
('Offer', 'Offer-00004'),
('product', 'P-00020'),
('purchase', 'P-00006'),
('sales', 'SEL-00025'),
('stock', 'STK-00000'),
('vender', 'VNDR-00001');

-- --------------------------------------------------------

--
-- Table structure for table `chatting`
--

CREATE TABLE IF NOT EXISTS `chatting` (
  `id` varchar(100) DEFAULT NULL,
  `sid` varchar(100) DEFAULT NULL,
  `mess` varchar(100) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chatting`
--


-- --------------------------------------------------------

--
-- Table structure for table `feed_back`
--

CREATE TABLE IF NOT EXISTS `feed_back` (
  `Name` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `ContNo` varchar(25) DEFAULT NULL,
  `Feedback` varchar(50) DEFAULT NULL,
  `Remarks` varchar(1000) DEFAULT NULL,
  `Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feed_back`
--

INSERT INTO `feed_back` (`Name`, `Email`, `ContNo`, `Feedback`, `Remarks`, `Date`) VALUES
('Rajul Ranjan', 'rahul@gmail.com', '6535656899', 'Feedback', 'na\r\n                                    ', '2011-05-13'),
('Pratik', 'par@gmail.com', '1111111111', 'Suggestion', '\r\n       Good Design keep it up                             ', '2014-05-14');

-- --------------------------------------------------------

--
-- Table structure for table `offer`
--

CREATE TABLE IF NOT EXISTS `offer` (
  `offer_id` varchar(100) NOT NULL,
  `offer` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`offer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `offer`
--

INSERT INTO `offer` (`offer_id`, `offer`) VALUES
('Offer-00001', '20% off now');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE IF NOT EXISTS `payment` (
  `SalesID` varchar(50) DEFAULT NULL,
  `UserID` varchar(50) DEFAULT NULL,
  `Bank` varchar(200) DEFAULT NULL,
  `Price` varchar(50) DEFAULT NULL,
  `AccountNo` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `ReedmedPoint` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`SalesID`, `UserID`, `Bank`, `Price`, `AccountNo`, `Password`, `ReedmedPoint`) VALUES
('SEL-00023', 'a', 'State Bank Of India', '100.0', '11223333333333', 'PU8r8H3BvjiyDNbkaUmhBx+dDj0=', '100'),
('SEL-00024', 'a', 'Co Operative Bank', '10100.0', '5545454545454', 'qpPAhzKZGDm24MgWRyhurb1tQO4=', '2000'),
('SEL-00025', 'a', 'ICICI Bank', '100.0', '87878787878', 'qynqUzTirpKUYa/2r/TebOqQOSc=', '100');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `ProductID` varchar(50) NOT NULL,
  `Category` varchar(50) DEFAULT NULL,
  `ProductName` varchar(200) DEFAULT NULL,
  `SizeWeight` varchar(20) DEFAULT NULL,
  `Productqty` varchar(20) DEFAULT NULL,
  `Price` varchar(50) DEFAULT NULL,
  `MFGDate` varchar(20) DEFAULT NULL,
  `ProductImage` varchar(1000) DEFAULT NULL,
  `color` varchar(100) DEFAULT NULL,
  `model` varchar(100) DEFAULT NULL,
  `didcrip` varchar(100) DEFAULT NULL,
  `waight` varchar(100) DEFAULT NULL,
  `video` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ProductID`, `Category`, `ProductName`, `SizeWeight`, `Productqty`, `Price`, `MFGDate`, `ProductImage`, `color`, `model`, `didcrip`, `waight`, `video`) VALUES
('P-00018', 'Mobile', 'Lenevo', '12', '7', '100', '25-11-2016', 'Product_Image_1480046541841.png', 'RED', 'S2156', 'dsdsd', '1 Year', NULL),
('P-00019', 'Electronics', 'Laptop', '12', '9', '10000', '08-11-2016', 'Product_Image_1480154840484.png', 'RED', 'S2156', 'dsdsd', '1 Year', NULL),
('P-00020', 'Mobile', 'rrr', 'rrr', '12', '111', '30-01-2017', 'Product_Image_1486714574888.jpg', 'rrr', 'rrrr', 'tttyy', 'yyy', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `productid`
--

CREATE TABLE IF NOT EXISTS `productid` (
  `ProductID` varchar(50) NOT NULL,
  `ProductName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productid`
--

INSERT INTO `productid` (`ProductID`, `ProductName`) VALUES
('P-00001', 'Cloths'),
('P-00002', 'Electronics'),
('P-00003', 'Bags'),
('P-00005', 'mobile'),
('P-00006', 'Cloth'),
('P-00007', 'Bags'),
('P-00008', 'Bags'),
('P-00009', 'aaa'),
('P-00010', 'Cloths'),
('P-00011', 'E01'),
('P-00012', 'Cloths'),
('P-00013', 'Mobile'),
('P-00014', 'Mobile'),
('P-00015', 'Bike'),
('P-00016', 'abc'),
('P-00017', 'abc'),
('P-00018', 'Lenevo'),
('P-00019', 'Laptop'),
('P-00020', 'rrr');

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE IF NOT EXISTS `purchase` (
  `ProductId` varchar(50) NOT NULL,
  `VenderId` varchar(50) DEFAULT NULL,
  `ProductPrice` varchar(50) DEFAULT NULL,
  `ProductQuantity` varchar(50) DEFAULT NULL,
  `MFGDate` varchar(20) DEFAULT NULL,
  `EXPDate` varchar(20) DEFAULT NULL,
  `Total` varchar(20) DEFAULT NULL,
  `BankName` varchar(100) DEFAULT NULL,
  `AccountNo` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `Money` varchar(50) DEFAULT NULL,
  `Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`ProductId`, `VenderId`, `ProductPrice`, `ProductQuantity`, `MFGDate`, `EXPDate`, `Total`, `BankName`, `AccountNo`, `Password`, `Money`, `Date`) VALUES
('P-00001', 'VNDR-00001', '50', '3', '19-05-2011', '18-05-2011', '165', 'Bank Of Baroda', '44564654fdsafsaf', 'dsaf', '165', '2011-05-13');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE IF NOT EXISTS `sales` (
  `SalerId` varchar(50) NOT NULL,
  `ProductId` varchar(200) DEFAULT NULL,
  `Category` varchar(50) DEFAULT NULL,
  `SeizeWeight` varchar(50) DEFAULT NULL,
  `Price` varchar(50) DEFAULT NULL,
  `Quantity` varchar(50) DEFAULT NULL,
  `Image` varchar(200) DEFAULT NULL,
  `BankName` varchar(100) DEFAULT NULL,
  `AccountNo` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `Money` varchar(50) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`SalerId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`SalerId`, `ProductId`, `Category`, `SeizeWeight`, `Price`, `Quantity`, `Image`, `BankName`, `AccountNo`, `Password`, `Money`, `Date`) VALUES
('SEL-00016', NULL, NULL, 'large', '500', '2', NULL, 'Union Bank', '1111', 'aaa', '1100', '2014-04-28'),
('SEL-00017', NULL, NULL, 'large', '500', '2', NULL, 'ICICI Bank', '1111', '6', '1100', '2014-04-28');

-- --------------------------------------------------------

--
-- Table structure for table `tblcomment`
--

CREATE TABLE IF NOT EXISTS `tblcomment` (
  `comment` varchar(200) NOT NULL,
  `rdate` date NOT NULL,
  `rating` varchar(5) NOT NULL,
  `username` varchar(30) NOT NULL,
  `cid` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`username`,`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcomment`
--

INSERT INTO `tblcomment` (`comment`, `rdate`, `rating`, `username`, `cid`) VALUES
('Very Good Product', '2016-11-26', '4', 'a', 'P-00018'),
('not Nice product', '2016-11-26', '5', 'a', 'P-00019');

-- --------------------------------------------------------

--
-- Table structure for table `userlogin`
--

CREATE TABLE IF NOT EXISTS `userlogin` (
  `UserName` varchar(50) NOT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `DOB` varchar(25) DEFAULT NULL,
  `Gender` varchar(25) DEFAULT NULL,
  `ContactNo` varchar(20) DEFAULT NULL,
  `EmailId` varchar(50) DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `pin` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlogin`
--

INSERT INTO `userlogin` (`UserName`, `FullName`, `Password`, `DOB`, `Gender`, `ContactNo`, `EmailId`, `contact`, `address`, `city`, `country`, `pin`) VALUES
('a', 'a', 'a', '25-11-2004', '111111111', 'Male', 'colthurling@gmail.com', '111111111', 'Apiit Sd India, Panipat', 'Delhi', 'Delhi', '132103');

-- --------------------------------------------------------

--
-- Table structure for table `userpurchase`
--

CREATE TABLE IF NOT EXISTS `userpurchase` (
  `SalerId` varchar(50) NOT NULL,
  `UserId` varchar(50) NOT NULL,
  `ProductId` varchar(50) NOT NULL,
  `Category` varchar(50) NOT NULL,
  `SeizeWeight` varchar(50) NOT NULL,
  `Price` varchar(50) NOT NULL,
  `Quantity` varchar(50) NOT NULL,
  `TotalAmount` varchar(50) DEFAULT NULL,
  `Image` varchar(200) NOT NULL,
  `Status` varchar(5) NOT NULL,
  `Date` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userpurchase`
--

INSERT INTO `userpurchase` (`SalerId`, `UserId`, `ProductId`, `Category`, `SeizeWeight`, `Price`, `Quantity`, `TotalAmount`, `Image`, `Status`, `Date`) VALUES
('SEL-00023', 'a', 'P-00018', 'Mobile', '12', '100', '1', '100.0', 'Product_Image_1480046541841.png', '1', '2016-11-25 09:35:09'),
('SEL-00024', 'a', 'P-00018', 'Mobile', '12', '100', '1', '100.0', 'Product_Image_1480046541841.png', '1', '2016-11-25 09:36:59'),
('SEL-00024', 'a', 'P-00019', 'Electronics', '12', '10000', '1', '10000.0', 'Product_Image_1480154840484.png', '1', '2016-11-26 15:38:22'),
('SEL-00025', 'a', 'P-00018', 'Mobile', '12', '100', '1', '100.0', 'Product_Image_1480046541841.png', '1', '2017-02-10 13:13:09');

-- --------------------------------------------------------

--
-- Table structure for table `vender`
--

CREATE TABLE IF NOT EXISTS `vender` (
  `VenderId` varchar(50) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `VenderName` varchar(100) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `Mobile` varchar(20) DEFAULT NULL,
  `EmailId` varchar(50) DEFAULT NULL,
  `Gender` varchar(20) DEFAULT NULL,
  `Nature` varchar(50) DEFAULT NULL,
  `Date` varchar(20) DEFAULT NULL,
  `utype` varchar(50) NOT NULL,
  PRIMARY KEY (`VenderId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vender`
--

INSERT INTO `vender` (`VenderId`, `pwd`, `VenderName`, `Address`, `Mobile`, `EmailId`, `Gender`, `Nature`, `Date`, `utype`) VALUES
('admin', 'admin', 'Admin', 'null', 'null', 'null', 'null', 'null', 'null', 'admin');
