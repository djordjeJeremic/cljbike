-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 10, 2019 at 08:25 
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bike`
--

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `country_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `country_name`) VALUES
(1, 'Germany'),
(2, 'Great Britain'),
(3, 'France'),
(5, 'Finland'),
(6, 'Brazil'),
(7, 'Russia'),
(8, 'Mexico'),
(9, 'Spain'),
(10, 'Sweden'),
(11, 'Australia'),
(12, 'Netherlands'),
(13, 'Venezuela'),
(14, 'Australia'),
(15, 'Malaysia'),
(16, 'China'),
(17, 'Kazakhstan'),
(18, 'Canada'),
(19, 'Austria'),
(20, 'Hungary'),
(21, 'Belgium'),
(22, 'Italy'),
(23, 'Singapore'),
(24, 'Japan'),
(25, 'United States'),
(26, 'United Arab Emirates');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `id` int(11) NOT NULL,
  `driver_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `driver_number` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `driver_points` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`id`, `driver_name`, `driver_number`, `team_id`, `country_id`, `driver_points`) VALUES
(1, 'Jonathan Castroviejo Nicolas', 52, 10, 9, 25),
(2, 'Pablo Lastras Garcia', 6, 10, 9, 52),
(3, 'Mickaël Chérel', 77, 1, 3, 34),
(4, 'Lloyd Mondory', 5, 1, 3, 60),
(6, 'Maxat Ayazbayev', 7, 2, 17, 76),
(7, 'Alessandro De Marchi', 3, 3, 2, 51),
(8, 'Michael Schär', 26, 3, 1, 45),
(9, 'Davide Formolo', 27, 5, 1, 24),
(13, 'Nikolas Maes', 12, 6, 6, 16),
(14, 'Zdeněk Štybar', 11, 7, 8, 15),
(15, 'Johan Le Bon', 13, 7, 13, 12),
(16, 'Thibaut Pinot', 14, 7, 9, 11),
(17, 'Pirmin Lang', 55, 8, 9, 9),
(18, 'Sébastien Reichenbach', 22, 8, 2, 6),
(19, 'Ruben Plaza Molina', 9, 9, 10, 6),
(20, 'Tony Gallopin', 98, 4, 9, 0),
(21, 'Maxime Monfort', 28, 4, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `race`
--

CREATE TABLE `race` (
  `id` int(11) NOT NULL,
  `track_id` int(11) NOT NULL,
  `race_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `race`
--

INSERT INTO `race` (`id`, `track_id`, `race_date`) VALUES
(6, 2, '2015-05-24'),
(7, 4, '2015-07-05'),
(8, 5, '2015-03-15'),
(9, 6, '2015-03-29'),
(10, 7, '2015-04-12'),
(11, 8, '2015-04-19'),
(12, 9, '2015-05-10'),
(13, 10, '2015-06-07'),
(14, 11, '2015-06-21'),
(15, 12, '2015-07-26'),
(16, 13, '2015-08-23'),
(17, 4, '2019-02-09'),
(18, 7, '2018-12-11');

-- --------------------------------------------------------

--
-- Table structure for table `race_results`
--

CREATE TABLE `race_results` (
  `id` int(11) NOT NULL,
  `race_id` int(11) NOT NULL,
  `no1_id` int(11) NOT NULL,
  `no2_id` int(11) NOT NULL,
  `no3_id` int(11) NOT NULL,
  `no4_id` int(11) NOT NULL,
  `no5_id` int(11) NOT NULL,
  `no6_id` int(11) NOT NULL,
  `no7_id` int(11) NOT NULL,
  `no8_id` int(11) NOT NULL,
  `no9_id` int(11) NOT NULL,
  `no10_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `race_results`
--

INSERT INTO `race_results` (`id`, `race_id`, `no1_id`, `no2_id`, `no3_id`, `no4_id`, `no5_id`, `no6_id`, `no7_id`, `no8_id`, `no9_id`, `no10_id`) VALUES
(6, 8, 1, 2, 4, 5, 13, 7, 9, 19, 17, 14),
(7, 9, 4, 1, 2, 6, 3, 5, 12, 17, 8, 7),
(8, 10, 1, 2, 4, 6, 5, 3, 10, 13, 7, 19),
(9, 11, 1, 6, 2, 3, 4, 7, 10, 14, 8, 5),
(10, 12, 2, 1, 4, 3, 6, 5, 7, 10, 17, 8),
(11, 6, 2, 4, 1, 8, 7, 6, 14, 18, 13, 17),
(12, 13, 1, 2, 3, 6, 4, 5, 15, 9, 8, 10),
(13, 14, 2, 1, 5, 4, 3, 9, 15, 12, 14, 7),
(14, 7, 1, 2, 4, 5, 3, 8, 9, 6, 14, 16),
(15, 15, 4, 8, 7, 12, 16, 1, 10, 2, 18, 19);

--
-- Triggers `race_results`
--
DELIMITER $$
CREATE TRIGGER `trigger_race_results` AFTER INSERT ON `race_results` FOR EACH ROW begin
declare no1_points int(11);
declare no2_points int(11);
declare no3_points int(11);
declare no4_points int(11);
declare no5_points int(11);
declare no6_points int(11);
declare no7_points int(11);
declare no8_points int(11);
declare no9_points int(11);
declare no10_points int(11);

select driver_points
into no1_points
from driver
where id = new.no1_id;

select driver_points
into no2_points
from driver
where id = new.no2_id;

select driver_points
into no3_points
from driver
where id = new.no3_id;

select driver_points
into no4_points
from driver
where id = new.no4_id;

select driver_points
into no5_points
from driver
where id = new.no5_id;

select driver_points
into no6_points
from driver
where id = new.no6_id;

select driver_points
into no7_points
from driver
where id = new.no7_id;

select driver_points
into no8_points
from driver
where id = new.no8_id;

select driver_points
into no9_points
from driver
where id = new.no9_id;

select driver_points
into no10_points
from driver
where id = new.no10_id;

update driver
set driver_points = (no1_points + 15)
where id = new.no1_id;

update driver
set driver_points = (no2_points + 12)
where id = new.no2_id;

update driver
set driver_points = (no3_points + 9)
where id = new.no3_id;

update driver
set driver_points = (no4_points + 7)
where id = new.no4_id;

update driver
set driver_points = (no5_points + 6)
where id = new.no5_id;

update driver
set driver_points = (no6_points + 5)
where id = new.no6_id;

update driver
set driver_points = (no7_points + 4)
where id = new.no7_id;

update driver
set driver_points = (no8_points + 3)
where id = new.no8_id;

update driver
set driver_points = (no9_points + 2)
where id = new.no9_id;

update driver
set driver_points = (no10_points + 1)
where id = new.no10_id;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` int(11) NOT NULL,
  `team_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`id`, `team_name`) VALUES
(1, 'AG2R La Mondiale'),
(2, 'Astana Pro Team'),
(3, 'BMC Racing Team'),
(4, 'Cannondale-Garmin Pro Cycling '),
(5, 'Etixx - Quick-Step'),
(6, 'FDJ.fr'),
(7, 'IAM Cycling'),
(8, 'Lampre-Merida'),
(9, 'Lotto Soudal'),
(10, 'Movistar Team');

-- --------------------------------------------------------

--
-- Table structure for table `track`
--

CREATE TABLE `track` (
  `id` int(11) NOT NULL,
  `track_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `track`
--

INSERT INTO `track` (`id`, `track_name`, `country_id`) VALUES
(2, 'Vuelta a España', 9),
(4, 'UCI Road World Championships', 25),
(5, 'UCI Cyclo-cross World Cup CrossVegas', 25),
(6, 'Grand Prix Cycliste de Montréal', 18),
(7, 'Tour of Britain', 2),
(8, 'Grand Prix Cycliste de Québec', 18),
(9, 'Grand Prix de Wallonie', 9),
(10, 'Coppa Agostoni - Giro delle Brianze', 18),
(11, 'La Madrid Challenge by La Vuelta', 9),
(12, 'Primus Classic Impanis - Van Petegem', 21),
(13, 'Reading 120', 25),
(14, 'Tour of Alberta', 18),
(15, 'Lotto Belgium Tour', 21),
(16, 'Boels Rental Tour', 12),
(17, 'GP de Fourmies / La Voix du Nord', 3),
(18, 'UCI Mountain Bike World Championships', 25),
(19, 'GP Ouest France - Plouay', 3),
(20, 'Ellison Park Cyclo-cross', 25),
(21, 'Gateway Cup', 25);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `country_id` (`country_id`);

--
-- Indexes for table `race`
--
ALTER TABLE `race`
  ADD PRIMARY KEY (`id`),
  ADD KEY `track_id` (`track_id`);

--
-- Indexes for table `race_results`
--
ALTER TABLE `race_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `race_id` (`race_id`),
  ADD KEY `no1_id` (`no1_id`),
  ADD KEY `no2_id` (`no2_id`),
  ADD KEY `no3_id` (`no3_id`),
  ADD KEY `no4_id` (`no4_id`),
  ADD KEY `no5_id` (`no5_id`),
  ADD KEY `no6_id` (`no6_id`),
  ADD KEY `no7_id` (`no7_id`),
  ADD KEY `no8_id` (`no8_id`),
  ADD KEY `no9_id` (`no9_id`),
  ADD KEY `no10_id` (`no10_id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `track`
--
ALTER TABLE `track`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_id` (`country_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `race`
--
ALTER TABLE `race`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `race_results`
--
ALTER TABLE `race_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `track`
--
ALTER TABLE `track`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`),
  ADD CONSTRAINT `driver_ibfk_2` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`);

--
-- Constraints for table `race`
--
ALTER TABLE `race`
  ADD CONSTRAINT `race_ibfk_1` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`);

--
-- Constraints for table `race_results`
--
ALTER TABLE `race_results`
  ADD CONSTRAINT `race_results_ibfk_1` FOREIGN KEY (`race_id`) REFERENCES `race` (`id`);

--
-- Constraints for table `track`
--
ALTER TABLE `track`
  ADD CONSTRAINT `track_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
