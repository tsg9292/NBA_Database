-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 16, 2014 at 07:48 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `NBA Database`
--

-- --------------------------------------------------------

--
-- Table structure for table `Coach`
--

CREATE TABLE IF NOT EXISTS `Coach` (
  `Coach ID` tinyint(2) NOT NULL,
  `First Name` text COLLATE utf8_unicode_ci NOT NULL,
  `Last Name` text COLLATE utf8_unicode_ci NOT NULL,
  `Experience` tinyint(2) NOT NULL,
  `Wins` smallint(4) NOT NULL,
  `Losses` smallint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Coach`
--

INSERT INTO `Coach` (`Coach ID`, `First Name`, `Last Name`, `Experience`, `Wins`, `Losses`) VALUES
(1, 'Gregg', 'Popovich', 18, 983, 450),
(2, 'Byron', 'Scott', 13, 423, 537),
(3, 'David', 'Blatt', 0, 13, 9);

-- --------------------------------------------------------

--
-- Table structure for table `College`
--

CREATE TABLE IF NOT EXISTS `College` (
  `College ID` mediumint(7) NOT NULL,
  `Name` text COLLATE utf8_unicode_ci NOT NULL,
  `State` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `Tournament Appearances` tinyint(2) NOT NULL,
  `Championships` tinyint(2) NOT NULL,
  `Pro Players` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `College`
--

INSERT INTO `College` (`College ID`, `Name`, `State`, `Tournament Appearances`, `Championships`, `Pro Players`) VALUES
(1000001, 'Syracuse Orange', 'NY', 37, 1, 44),
(1000002, 'The University of Texas', 'TX', 31, 0, 29),
(1000003, 'Wake Forest Demon Deacons', 'NC', 22, 0, 28),
(1000004, 'University of Colorado Buffaloes', 'CO', 13, 0, 20);

-- --------------------------------------------------------

--
-- Table structure for table `Game`
--

CREATE TABLE IF NOT EXISTS `Game` (
  `Game ID` int(9) NOT NULL,
  `AwayID` char(3) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Team Id of the away team',
  `HomeID` char(3) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Team Id of of the home team',
  `Date` date NOT NULL,
  `Result` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `Ties` tinyint(4) NOT NULL,
  `Lead Changes` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Game`
--

INSERT INTO `Game` (`Game ID`, `AwayID`, `HomeID`, `Date`, `Result`, `Ties`, `Lead Changes`) VALUES
(100000001, 'LAL', 'SAS', '2014-12-12', 'LAL', 5, 11),
(100000002, 'CLE', 'NOP', '2014-12-12', 'NOP', 16, 23),
(100000003, 'SAS', 'CLE', '2014-11-19', 'SAS', 7, 18);

-- --------------------------------------------------------

--
-- Table structure for table `Player`
--

CREATE TABLE IF NOT EXISTS `Player` (
`Player ID` mediumint(6) NOT NULL,
  `First Name` text COLLATE utf8_unicode_ci NOT NULL,
  `Last Name` text COLLATE utf8_unicode_ci NOT NULL,
  `Age` tinyint(4) NOT NULL,
  `Experience` tinyint(4) NOT NULL,
  `Team` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `College` mediumint(7) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=100010 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Player`
--

INSERT INTO `Player` (`Player ID`, `First Name`, `Last Name`, `Age`, `Experience`, `Team`, `College`) VALUES
(100000, 'Kobe', 'Bryant', 36, 18, 'LAL', NULL),
(100001, 'Tim', 'Duncan', 38, 17, 'SAS', 1000003),
(100002, 'Kevin', 'Durant', 26, 7, 'OKC', 1000002),
(100003, 'LeBron', 'James', 30, 11, 'CLE', NULL),
(100004, 'Carmelo', 'Anthony', 30, 11, 'NYK', 1000001),
(100005, 'Tony', 'Parker', 32, 13, 'SAS', NULL),
(100006, 'Michael', 'Carter-Williams', 23, 1, 'PHI', 1000001),
(100007, 'Andre', 'Roberson', 23, 1, 'OKC', 1000004);

-- --------------------------------------------------------

--
-- Table structure for table `Player Career Stats`
--

CREATE TABLE IF NOT EXISTS `Player Career Stats` (
  `Player ID` mediumint(6) NOT NULL,
  `Games Played` smallint(6) NOT NULL,
  `Points` smallint(6) NOT NULL,
  `Assists` smallint(6) NOT NULL,
  `Rebounds` smallint(6) NOT NULL,
  `Steals` smallint(6) NOT NULL,
  `Blocks` smallint(6) NOT NULL,
  `Championships` tinyint(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Player Career Stats`
--

INSERT INTO `Player Career Stats` (`Player ID`, `Games Played`, `Points`, `Assists`, `Rebounds`, `Steals`, `Blocks`, `Championships`) VALUES
(100000, 1268, 32284, 6041, 6716, 1868, 624, 5),
(100001, 1275, 25212, 3896, 14167, 933, 2838, 5),
(100002, 549, 14997, 1920, 3791, 687, 536, 0),
(100003, 863, 23706, 5949, 6201, 1474, 689, 2),
(100004, 813, 20494, 2496, 5326, 883, 391, 0),
(100005, 959, 16355, 5736, 2832, 883, 76, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Player Game Stats`
--

CREATE TABLE IF NOT EXISTS `Player Game Stats` (
  `Player ID` mediumint(6) NOT NULL,
  `Game ID` int(9) NOT NULL,
  `Date` date NOT NULL,
  `Points` smallint(6) NOT NULL,
  `Assists` smallint(6) NOT NULL,
  `Rebounds` smallint(6) NOT NULL,
  `Steals` smallint(6) NOT NULL,
  `Blocks` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Player Game Stats`
--

INSERT INTO `Player Game Stats` (`Player ID`, `Game ID`, `Date`, `Points`, `Assists`, `Rebounds`, `Steals`, `Blocks`) VALUES
(100000, 100000001, '2014-12-12', 22, 9, 5, 4, 0),
(100001, 100000001, '2014-12-12', 19, 2, 18, 0, 2),
(100003, 100000002, '2014-12-12', 41, 5, 5, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Player Season Stats`
--

CREATE TABLE IF NOT EXISTS `Player Season Stats` (
  `Player ID` mediumint(6) NOT NULL,
  `Year` year(4) NOT NULL,
  `Team` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `Games Played` smallint(6) NOT NULL,
  `Points` smallint(6) NOT NULL,
  `Assists` smallint(6) NOT NULL,
  `Rebounds` smallint(6) NOT NULL,
  `Steals` smallint(6) NOT NULL,
  `Blocks` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Player Season Stats`
--

INSERT INTO `Player Season Stats` (`Player ID`, `Year`, `Team`, `Games Played`, `Points`, `Assists`, `Rebounds`, `Steals`, `Blocks`) VALUES
(100001, 2014, 'SAS', 74, 1119, 220, 721, 43, 139),
(100001, 2015, 'SAS', 21, 308, 64, 227, 18, 47),
(100003, 2013, 'MIA', 76, 2036, 551, 610, 129, 67),
(100003, 2014, 'MIA', 77, 2089, 488, 533, 121, 26),
(100003, 2015, 'CLE', 22, 560, 163, 122, 31, 15),
(100005, 2014, 'SAS', 68, 1134, 388, 155, 36, 9),
(100005, 2015, 'SAS', 19, 304, 101, 32, 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Team`
--

CREATE TABLE IF NOT EXISTS `Team` (
  `Team ID` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `Name` text COLLATE utf8_unicode_ci NOT NULL,
  `Seasons` tinyint(3) NOT NULL,
  `Wins` smallint(4) NOT NULL,
  `Losses` smallint(4) NOT NULL,
  `Win Pct` float(4,2) NOT NULL,
  `Championships` tinyint(2) NOT NULL,
  `Conference` set('East','West') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Team`
--

INSERT INTO `Team` (`Team ID`, `Name`, `Seasons`, `Wins`, `Losses`, `Win Pct`, `Championships`, `Conference`) VALUES
('ATL', 'Atlanta Hawks', 66, 2558, 2607, 49.53, 1, 'East'),
('BKN', 'Brooklyn Nets', 48, 1685, 2149, 43.95, 2, 'East'),
('BOS', 'Boston Celtics', 69, 3140, 2195, 58.86, 17, 'East'),
('CHA', 'Charlotte Hornets', 25, 841, 1102, 43.28, 0, 'East'),
('CHI', 'Chicago Bulls', 49, 2037, 1872, 52.11, 6, 'East'),
('CLE', 'Cleveland Cavaliers', 45, 1631, 1951, 45.53, 0, 'East'),
('DAL', 'Dallas Mavericks', 35, 1407, 1358, 50.89, 1, 'West'),
('DEN', 'Denver Nuggets', 48, 1923, 1912, 50.14, 0, 'West'),
('DET', 'Detroit Pistons', 67, 2545, 2683, 48.68, 3, 'East'),
('GSW', 'Golden State Warriors', 69, 2470, 2862, 46.32, 3, 'West'),
('HOU', 'Houston Rockets', 48, 1973, 1856, 51.53, 2, 'West'),
('IND', 'Indiana Pacers', 48, 1957, 1878, 51.03, 3, 'East'),
('LAC', 'Los Angeles Clippers', 45, 1376, 2207, 38.40, 0, 'West'),
('LAL', 'Las Angeles Lakers', 67, 3204, 2024, 61.29, 16, 'West'),
('MEM', 'Memphis Grizzlies', 20, 616, 917, 40.18, 0, 'West'),
('MIA', 'Miami Heat', 27, 1096, 1011, 52.02, 3, 'East'),
('MIL', 'Milwaukee Bucks', 47, 1921, 1827, 51.25, 1, 'East'),
('MIN', 'Minnesota Timberwolves', 26, 807, 1217, 39.87, 0, 'West'),
('NOP', 'New Orleans Pelicans', 13, 464, 526, 46.87, 0, 'West'),
('NYK', 'New York Knicks', 69, 2657, 2679, 49.79, 2, 'East'),
('OKC', 'Oklahoma City Thunder', 48, 2049, 1780, 53.51, 1, 'West'),
('ORL', 'Orlando Magic', 26, 1012, 1016, 49.90, 0, 'East'),
('PHI', 'Philadelphia 76ers', 66, 2700, 2463, 52.30, 3, 'East'),
('PHX', 'Phoenix Suns', 47, 2072, 1676, 55.28, 0, 'West'),
('POR', 'Portland Trail Blazers', 45, 1914, 1670, 53.40, 1, 'West'),
('SAC', 'Sacramento Kings', 67, 2413, 2816, 46.15, 1, 'West'),
('SAS', 'San Antonio Spurs', 48, 2278, 1557, 59.40, 5, 'West'),
('TOR', 'Toronto Raptors', 20, 646, 887, 42.14, 0, 'East'),
('UTA', 'Utah Jazz', 41, 1743, 1512, 53.55, 0, 'West'),
('WAS', 'Washington Wizards', 54, 1933, 2376, 44.86, 1, 'East');

-- --------------------------------------------------------

--
-- Table structure for table `Team Game Stats`
--

CREATE TABLE IF NOT EXISTS `Team Game Stats` (
  `Team ID` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `Game ID` int(9) NOT NULL,
  `Date` date NOT NULL,
  `Points` smallint(4) NOT NULL,
  `Assists` smallint(4) NOT NULL,
  `Rebounds` smallint(4) NOT NULL,
  `Steals` smallint(4) NOT NULL,
  `Blocks` smallint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Team Game Stats`
--

INSERT INTO `Team Game Stats` (`Team ID`, `Game ID`, `Date`, `Points`, `Assists`, `Rebounds`, `Steals`, `Blocks`) VALUES
('CLE', 100000002, '2014-12-12', 114, 22, 40, 6, 6),
('CLE', 100000003, '2014-11-19', 90, 23, 38, 7, 5),
('LAL', 100000001, '2014-12-12', 112, 27, 49, 11, 4),
('SAS', 100000001, '2014-12-12', 110, 23, 47, 10, 5),
('SAS', 100000003, '2014-11-19', 92, 26, 42, 11, 4);

-- --------------------------------------------------------

--
-- Table structure for table `Team Season Stats`
--

CREATE TABLE IF NOT EXISTS `Team Season Stats` (
  `Team ID` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `Year` year(4) NOT NULL,
  `Games Played` tinyint(4) NOT NULL,
  `Win` tinyint(4) NOT NULL,
  `Loss` tinyint(4) NOT NULL,
  `Win Pct` float(4,2) NOT NULL,
  `Coach` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Team Season Stats`
--

INSERT INTO `Team Season Stats` (`Team ID`, `Year`, `Games Played`, `Win`, `Loss`, `Win Pct`, `Coach`) VALUES
('CLE', 2015, 22, 13, 9, 99.99, 3),
('LAL', 2015, 23, 7, 16, 30.43, 2),
('SAS', 2013, 82, 58, 24, 99.99, 1),
('SAS', 2014, 82, 62, 20, 99.99, 1),
('SAS', 2015, 23, 16, 7, 69.57, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Coach`
--
ALTER TABLE `Coach`
 ADD PRIMARY KEY (`Coach ID`);

--
-- Indexes for table `College`
--
ALTER TABLE `College`
 ADD PRIMARY KEY (`College ID`);

--
-- Indexes for table `Game`
--
ALTER TABLE `Game`
 ADD PRIMARY KEY (`Game ID`), ADD KEY `AwayID` (`AwayID`), ADD KEY `HomeID` (`HomeID`);

--
-- Indexes for table `Player`
--
ALTER TABLE `Player`
 ADD PRIMARY KEY (`Player ID`), ADD KEY `College` (`College`), ADD KEY `Team` (`Team`);

--
-- Indexes for table `Player Career Stats`
--
ALTER TABLE `Player Career Stats`
 ADD PRIMARY KEY (`Player ID`), ADD KEY `Player ID` (`Player ID`);

--
-- Indexes for table `Player Game Stats`
--
ALTER TABLE `Player Game Stats`
 ADD PRIMARY KEY (`Player ID`,`Game ID`), ADD KEY `Game ID` (`Game ID`);

--
-- Indexes for table `Player Season Stats`
--
ALTER TABLE `Player Season Stats`
 ADD PRIMARY KEY (`Player ID`,`Year`), ADD KEY `Player ID` (`Player ID`), ADD KEY `Team` (`Team`);

--
-- Indexes for table `Team`
--
ALTER TABLE `Team`
 ADD PRIMARY KEY (`Team ID`);

--
-- Indexes for table `Team Game Stats`
--
ALTER TABLE `Team Game Stats`
 ADD PRIMARY KEY (`Team ID`,`Game ID`), ADD KEY `Team ID` (`Team ID`), ADD KEY `Game ID` (`Game ID`);

--
-- Indexes for table `Team Season Stats`
--
ALTER TABLE `Team Season Stats`
 ADD PRIMARY KEY (`Team ID`,`Year`), ADD KEY `Team ID` (`Team ID`), ADD KEY `Coach` (`Coach`), ADD KEY `Coach_2` (`Coach`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Player`
--
ALTER TABLE `Player`
MODIFY `Player ID` mediumint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=100010;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Game`
--
ALTER TABLE `Game`
ADD CONSTRAINT `Game_ibfk_1` FOREIGN KEY (`AwayID`) REFERENCES `Team` (`Team ID`),
ADD CONSTRAINT `Game_ibfk_2` FOREIGN KEY (`HomeID`) REFERENCES `Team` (`Team ID`);

--
-- Constraints for table `Player`
--
ALTER TABLE `Player`
ADD CONSTRAINT `Player College ID` FOREIGN KEY (`College`) REFERENCES `College` (`College ID`),
ADD CONSTRAINT `Player Team ID` FOREIGN KEY (`Team`) REFERENCES `Team` (`Team ID`);

--
-- Constraints for table `Player Career Stats`
--
ALTER TABLE `Player Career Stats`
ADD CONSTRAINT `Career Player ID` FOREIGN KEY (`Player ID`) REFERENCES `Player` (`Player ID`);

--
-- Constraints for table `Player Game Stats`
--
ALTER TABLE `Player Game Stats`
ADD CONSTRAINT `Game Player ID` FOREIGN KEY (`Player ID`) REFERENCES `Player` (`Player ID`),
ADD CONSTRAINT `Player Game Game ID` FOREIGN KEY (`Game ID`) REFERENCES `Game` (`Game ID`);

--
-- Constraints for table `Player Season Stats`
--
ALTER TABLE `Player Season Stats`
ADD CONSTRAINT `Player Season Stats Team ID` FOREIGN KEY (`Team`) REFERENCES `Team` (`Team ID`),
ADD CONSTRAINT `Player Season Stats_ibfk_1` FOREIGN KEY (`Player ID`) REFERENCES `Player` (`Player ID`);

--
-- Constraints for table `Team Game Stats`
--
ALTER TABLE `Team Game Stats`
ADD CONSTRAINT `TEAM  GAME ID` FOREIGN KEY (`Game ID`) REFERENCES `Game` (`Game ID`),
ADD CONSTRAINT `Team Game Stats Team ID` FOREIGN KEY (`Team ID`) REFERENCES `Team` (`Team ID`);

--
-- Constraints for table `Team Season Stats`
--
ALTER TABLE `Team Season Stats`
ADD CONSTRAINT `Team Season Stats_ibfk_1` FOREIGN KEY (`Team ID`) REFERENCES `Team` (`Team ID`),
ADD CONSTRAINT `Team season stats coaach id` FOREIGN KEY (`Coach`) REFERENCES `Coach` (`Coach ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
