-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 15, 2014 at 07:08 PM
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
(2, 'Byron', 'Scott', 13, 423, 537);

-- --------------------------------------------------------

--
-- Table structure for table `College`
--

CREATE TABLE IF NOT EXISTS `College` (
  `College ID` mediumint(9) NOT NULL,
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
  `AwayID` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Team Id of the away team',
  `HomeID` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Team Id of of the home team',
  `Date` date NOT NULL,
  `Result` text COLLATE utf8_unicode_ci NOT NULL,
  `Ties` tinyint(4) NOT NULL,
  `Lead Changes` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Game`
--

INSERT INTO `Game` (`AwayID`, `HomeID`, `Date`, `Result`, `Ties`, `Lead Changes`) VALUES
('LAL', 'SAS', '2014-12-12', 'LAL', 5, 11);

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
  `Team` text COLLATE utf8_unicode_ci NOT NULL,
  `College` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Player`
--

INSERT INTO `Player` (`Player ID`, `First Name`, `Last Name`, `Age`, `Experience`, `Team`, `College`) VALUES
(100000, 'Kobe', 'Bryant', 36, 18, 'LAL', 0),
(100001, 'Tim', 'Duncan', 38, 17, 'SAS', 0),
(100002, 'Kevin', 'Durant', 26, 7, 'OKC', 1000002),
(100003, 'LeBron', 'James', 30, 11, 'CLE', 0),
(100004, 'Carmelo', 'Anthony', 30, 11, 'NYK', 1000001);

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
  `Blocks` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Player Career Stats`
--

INSERT INTO `Player Career Stats` (`Player ID`, `Games Played`, `Points`, `Assists`, `Rebounds`, `Steals`, `Blocks`) VALUES
(100003, 863, 23706, 5949, 6201, 1474, 689),
(100000, 1268, 32284, 6041, 6716, 1868, 624);

-- --------------------------------------------------------

--
-- Table structure for table `Player Game Stats`
--

CREATE TABLE IF NOT EXISTS `Player Game Stats` (
  `Player ID` mediumint(6) NOT NULL,
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

INSERT INTO `Player Game Stats` (`Player ID`, `Date`, `Points`, `Assists`, `Rebounds`, `Steals`, `Blocks`) VALUES
(100003, '2014-12-12', 41, 5, 5, 0, 1),
(100001, '2014-12-12', 19, 2, 18, 0, 2),
(100000, '2014-12-12', 22, 9, 5, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Player Season Stats`
--

CREATE TABLE IF NOT EXISTS `Player Season Stats` (
  `Player ID` mediumint(6) NOT NULL,
  `Year` year(4) NOT NULL,
  `Team` text COLLATE utf8_unicode_ci NOT NULL,
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
(100003, 2014, 'MIA', 77, 2089, 488, 533, 121, 26),
(100003, 2015, 'CLE', 21, 536, 159, 115, 30, 14),
(100003, 2013, 'MIA', 76, 2036, 551, 610, 129, 67);

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
  `Team ID` text COLLATE utf8_unicode_ci NOT NULL,
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

INSERT INTO `Team Game Stats` (`Team ID`, `Date`, `Points`, `Assists`, `Rebounds`, `Steals`, `Blocks`) VALUES
('SAS', '2014-12-12', 110, 23, 47, 10, 5),
('LAL', '2014-12-12', 112, 27, 49, 11, 4);

-- --------------------------------------------------------

--
-- Table structure for table `Team Season Stats`
--

CREATE TABLE IF NOT EXISTS `Team Season Stats` (
  `Team ID` text COLLATE utf8_unicode_ci NOT NULL,
  `Year` year(4) NOT NULL,
  `Games Played` tinyint(4) NOT NULL,
  `Win` tinyint(4) NOT NULL,
  `Loss` tinyint(4) NOT NULL,
  `Win Pct` float(4,2) NOT NULL,
  `Coach` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Team Season Stats`
--

INSERT INTO `Team Season Stats` (`Team ID`, `Year`, `Games Played`, `Win`, `Loss`, `Win Pct`, `Coach`) VALUES
('SAS', 2015, 23, 16, 7, 69.57, 1),
('LAL', 2015, 23, 7, 16, 30.43, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Team`
--
ALTER TABLE `Team`
 ADD PRIMARY KEY (`Team ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
