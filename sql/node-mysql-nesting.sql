-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 23, 2015 at 02:17 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `node`
--
CREATE DATABASE IF NOT EXISTS `node` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `node`;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE IF NOT EXISTS `courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `department_id` int(11) NOT NULL,
  `courseNumber` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19738 ;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `name`, `department_id`, `courseNumber`) VALUES
(19279, 'Accounting Info & Mgt Decision', 49165, '100'),
(19280, 'Principles of Accounting I', 49165, '101'),
(19281, 'Principles of Accounting II', 49165, '102'),
(19282, 'Agricultural Economics', 49166, '100'),
(19283, 'Environmental Economics', 49166, '225'),
(19284, 'Agricultural Business Mgmt.', 49166, '230');

-- --------------------------------------------------------

--
-- Table structure for table `course_sections`
--

CREATE TABLE IF NOT EXISTS `course_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `course_id` int(11) NOT NULL,
  `courseterm_id` int(11) NOT NULL,
  `courseCRN` varchar(5) NOT NULL,
  `instructor` varchar(25) NOT NULL,
  `currentEnrollment` int(11) NOT NULL,
  `maxEnrollment` int(11) NOT NULL,
  `credits` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3355 ;

--
-- Dumping data for table `course_sections`
--

INSERT INTO `course_sections` (`id`, `name`, `course_id`, `courseterm_id`, `courseCRN`, `instructor`, `currentEnrollment`, `maxEnrollment`, `credits`) VALUES
(2237, '01', 19279, 0, '10193', 'Beebe, Robert R', 17, 30, 3),
(2238, '02', 19279, 0, '10189', 'Beebe, Robert R', 14, 30, 3),
(2239, '01', 19280, 0, '13049', 'Vosteen, Paul A', 27, 30, 3),
(2240, '02', 19280, 0, '10204', 'Beebe, Robert R', 20, 30, 3),
(2241, '03', 19280, 0, '10218', 'Beebe, Robert R', 30, 30, 3),
(2242, '04', 19280, 0, '10226', 'Vosteen, Paul A', 20, 30, 3),
(2243, 'LN1', 19280, 0, '10235', 'Vosteen, Paul A', 15, 20, 3),
(2244, '01', 19281, 0, '10241', 'Beebe, Robert R', 20, 30, 3),
(2245, 'LN1', 19281, 0, '13230', 'Vosteen, Paul A', 14, 20, 3),
(2246, '01', 19282, 0, '10332', 'Hayes, Corey M', 59, 50, 3),
(2247, '02', 19282, 0, '10335', 'Hayes, Corey M', 55, 50, 3),
(2248, '03', 19282, 0, '12351', 'Hayes, Corey M', 54, 50, 3),
(2249, 'LN1', 19283, 0, '14775', 'Becker, Kenneth M', 13, 20, 3),
(2250, '01', 19284, 0, '13332', 'Hayes, Corey M', 27, 20, 2);

-- --------------------------------------------------------

--
-- Table structure for table `course_terms`
--

CREATE TABLE IF NOT EXISTS `course_terms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `abbreviation` varchar(5) NOT NULL,
  `name` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE IF NOT EXISTS `departments` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `abbreviation` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=49244 ;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `abbreviation`) VALUES
(49165, 'ACCT'),
(49166, 'AGBS');

-- --------------------------------------------------------

--
-- Table structure for table `meetings`
--

CREATE TABLE IF NOT EXISTS `meetings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `monday` bit(1) NOT NULL,
  `tuesday` bit(1) NOT NULL,
  `wednesday` bit(1) NOT NULL,
  `thursday` bit(1) NOT NULL,
  `friday` bit(1) NOT NULL,
  `online` bit(1) NOT NULL,
  `startTime` int(11) NOT NULL,
  `endTime` int(11) NOT NULL,
  `coursesection_id` int(11) NOT NULL,
  `building` varchar(25) NOT NULL,
  `room` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `term_weeks`
--

CREATE TABLE IF NOT EXISTS `term_weeks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `week` int(11) NOT NULL,
  `term_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
