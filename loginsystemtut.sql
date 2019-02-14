-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 14, 2019 at 07:24 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `loginsystemtut`
--

-- --------------------------------------------------------

--
-- Table structure for table `BodyFacts`
--

CREATE TABLE `BodyFacts` (
  `BodyFactsID` int(11) NOT NULL,
  `weight` varchar(255) NOT NULL,
  `height` varchar(255) NOT NULL,
  `BMF` varchar(255) NOT NULL,
  `SMM` varchar(255) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `BodyFacts`
--

INSERT INTO `BodyFacts` (`BodyFactsID`, `weight`, `height`, `BMF`, `SMM`, `UserID`) VALUES
(1, '23', '23', '23', '23', 5),
(2, '23', '23', '48', '23', 5);

-- --------------------------------------------------------

--
-- Table structure for table `Doctors`
--

CREATE TABLE `Doctors` (
  `DoctorID` int(11) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `Age` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Doctors`
--

INSERT INTO `Doctors` (`DoctorID`, `FirstName`, `LastName`, `Age`) VALUES
(1, 'George', 'Maged', '22'),
(2, 'Joseph', 'Moheb', '24');

-- --------------------------------------------------------

--
-- Table structure for table `DoctorsTimeSlots`
--

CREATE TABLE `DoctorsTimeSlots` (
  `DoctorsTimeSlotsID` int(11) NOT NULL,
  `DoctorID` int(11) NOT NULL,
  `TimeSlotID` int(11) NOT NULL,
  `Avaliability` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `DoctorsTimeSlots`
--

INSERT INTO `DoctorsTimeSlots` (`DoctorsTimeSlotsID`, `DoctorID`, `TimeSlotID`, `Avaliability`) VALUES
(1, 1, 1, 0),
(2, 1, 2, 0),
(4, 2, 2, 0),
(5, 2, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `TimeSlots`
--

CREATE TABLE `TimeSlots` (
  `TimeSlotID` int(11) NOT NULL,
  `TimeBegin` varchar(255) NOT NULL,
  `TimeEnd` varchar(255) NOT NULL,
  `Day` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `TimeSlots`
--

INSERT INTO `TimeSlots` (`TimeSlotID`, `TimeBegin`, `TimeEnd`, `Day`) VALUES
(1, '9:00', '9:30', 'Sunday'),
(2, '9:30', '10:00', 'Sunday');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `idUsers` int(11) NOT NULL,
  `uidUsers` tinytext NOT NULL,
  `emailUsers` tinytext NOT NULL,
  `pwdUsers` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`idUsers`, `uidUsers`, `emailUsers`, `pwdUsers`) VALUES
(1, 'Gogo10', 'gogomaged62@mail.com', '$2y$10$hHM4MFVH18frg9EakPb1gevEebdUXAJQI4jp7wjprbVKem5wl5rnS'),
(2, 'jonjon', 'jm@gmail.com', '$2y$10$nkWRJNQYYpCudhd2zYgSPOj4AGgGeesg3CDBcy.xYJotLr6PI3NtS'),
(3, 'Marina', 'Marina97@gmail.com', '$2y$10$Slll5MWGMMi3zb6jQiT.TeO5bpZAoRVQdURGM1oc76vwwB52RJmI2'),
(4, 'Mario', 'MarioHany@gmail.com', '$2y$10$ohDBZkYsD7DrU60.b7joSu4qn5cWRFXe90h5uUwGmBpx4Svd3lQhO'),
(5, 'JohnMonir', 'john1500463@miuegypt.edu.eg', '$2y$10$735Q.RT9b80l42uEeP2u/ePkM6wAquw2ZR1q8KSacNd0Hkxs70zmW');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `BodyFacts`
--
ALTER TABLE `BodyFacts`
  ADD PRIMARY KEY (`BodyFactsID`),
  ADD KEY `ForeginKeyConstrain` (`UserID`);

--
-- Indexes for table `Doctors`
--
ALTER TABLE `Doctors`
  ADD PRIMARY KEY (`DoctorID`);

--
-- Indexes for table `DoctorsTimeSlots`
--
ALTER TABLE `DoctorsTimeSlots`
  ADD PRIMARY KEY (`DoctorsTimeSlotsID`),
  ADD UNIQUE KEY `DoctorID` (`DoctorID`,`TimeSlotID`),
  ADD KEY `TimeSlotID` (`TimeSlotID`);

--
-- Indexes for table `TimeSlots`
--
ALTER TABLE `TimeSlots`
  ADD PRIMARY KEY (`TimeSlotID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idUsers`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `BodyFacts`
--
ALTER TABLE `BodyFacts`
  MODIFY `BodyFactsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `Doctors`
--
ALTER TABLE `Doctors`
  MODIFY `DoctorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `DoctorsTimeSlots`
--
ALTER TABLE `DoctorsTimeSlots`
  MODIFY `DoctorsTimeSlotsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `TimeSlots`
--
ALTER TABLE `TimeSlots`
  MODIFY `TimeSlotID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `idUsers` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `BodyFacts`
--
ALTER TABLE `BodyFacts`
  ADD CONSTRAINT `ForeginKeyConstrain` FOREIGN KEY (`UserID`) REFERENCES `users` (`idUsers`) ON DELETE NO ACTION;

--
-- Constraints for table `DoctorsTimeSlots`
--
ALTER TABLE `DoctorsTimeSlots`
  ADD CONSTRAINT `DoctorID` FOREIGN KEY (`DoctorID`) REFERENCES `Doctors` (`DoctorID`),
  ADD CONSTRAINT `TimeSlotID` FOREIGN KEY (`TimeSlotID`) REFERENCES `TimeSlots` (`TimeSlotID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
