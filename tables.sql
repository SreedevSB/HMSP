-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2017 at 08:56 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.5.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `EID` varchar(20) NOT NULL,
  `type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `EID` varchar(20) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `dept` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `EID` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `date_joined` date DEFAULT NULL,
  `date_resigned` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `governs`
--

CREATE TABLE `governs` (
  `EID` varchar(20) NOT NULL,
  `room_no` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `name` varchar(20) NOT NULL,
  `quantity` varchar(20) NOT NULL,
  `price` float NOT NULL,
  `code` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nurse`
--

CREATE TABLE `nurse` (
  `EID` varchar(20) NOT NULL,
  `designation` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `PID` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `date_admitted` date DEFAULT NULL,
  `date_discharged` date DEFAULT NULL,
  `room_no` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patientgetsmedicine`
--

CREATE TABLE `patientgetsmedicine` (
  `PID` varchar(20) NOT NULL,
  `code` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `record`
--

CREATE TABLE `record` (
  `PID` varchar(20) NOT NULL,
  `record_no` varchar(20) NOT NULL,
  `description` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `room_no` varchar(20) NOT NULL,
  `roomtype` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `treats`
--

CREATE TABLE `treats` (
  `EID` varchar(20) NOT NULL,
  `PID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`EID`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`EID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EID`);

--
-- Indexes for table `governs`
--
ALTER TABLE `governs`
  ADD PRIMARY KEY (`EID`,`room_no`),
  ADD KEY `room_no` (`room_no`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `nurse`
--
ALTER TABLE `nurse`
  ADD PRIMARY KEY (`EID`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`PID`),
  ADD KEY `room_no` (`room_no`);

--
-- Indexes for table `patientgetsmedicine`
--
ALTER TABLE `patientgetsmedicine`
  ADD PRIMARY KEY (`PID`,`code`),
  ADD KEY `code` (`code`);

--
-- Indexes for table `record`
--
ALTER TABLE `record`
  ADD PRIMARY KEY (`record_no`),
  ADD KEY `PID` (`PID`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_no`);

--
-- Indexes for table `treats`
--
ALTER TABLE `treats`
  ADD PRIMARY KEY (`EID`,`PID`),
  ADD KEY `PID` (`PID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `employee` (`EID`);

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `employee` (`EID`);

--
-- Constraints for table `governs`
--
ALTER TABLE `governs`
  ADD CONSTRAINT `governs_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `employee` (`EID`),
  ADD CONSTRAINT `governs_ibfk_2` FOREIGN KEY (`room_no`) REFERENCES `room` (`room_no`);

--
-- Constraints for table `nurse`
--
ALTER TABLE `nurse`
  ADD CONSTRAINT `nurse_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `employee` (`EID`);

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`room_no`) REFERENCES `room` (`room_no`);

--
-- Constraints for table `patientgetsmedicine`
--
ALTER TABLE `patientgetsmedicine`
  ADD CONSTRAINT `patientgetsmedicine_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `patient` (`PID`),
  ADD CONSTRAINT `patientgetsmedicine_ibfk_2` FOREIGN KEY (`code`) REFERENCES `medicine` (`code`);

--
-- Constraints for table `record`
--
ALTER TABLE `record`
  ADD CONSTRAINT `record_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `patient` (`PID`);

--
-- Constraints for table `treats`
--
ALTER TABLE `treats`
  ADD CONSTRAINT `treats_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `employee` (`EID`),
  ADD CONSTRAINT `treats_ibfk_2` FOREIGN KEY (`PID`) REFERENCES `patient` (`PID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
