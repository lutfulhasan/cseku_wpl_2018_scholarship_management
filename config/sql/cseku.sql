-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 18, 2019 at 10:55 PM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cseku`
--

-- --------------------------------------------------------

--
-- Table structure for table `ams_asset`
--

DROP TABLE IF EXISTS `ams_asset`;
CREATE TABLE IF NOT EXISTS `ams_asset` (
  `id` varchar(40) NOT NULL,
  `type_id` int(11) NOT NULL,
  `serialNo` varchar(256) NOT NULL,
  `modelNo` varchar(256) NOT NULL,
  `brand` varchar(256) NOT NULL,
  `purchaseDate` date NOT NULL,
  `status` varchar(256) NOT NULL,
  `configuration` text NOT NULL,
  `stuff_id` varchar(40) NOT NULL,
  `purchasedFrom` varchar(256) NOT NULL,
  `cost` double NOT NULL,
  `warrantyLimit` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serialNo` (`serialNo`),
  KEY `type_id` (`type_id`),
  KEY `user_id` (`stuff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ams_asset`
--

INSERT INTO `ams_asset` (`id`, `type_id`, `serialNo`, `modelNo`, `brand`, `purchaseDate`, `status`, `configuration`, `stuff_id`, `purchasedFrom`, `cost`, `warrantyLimit`) VALUES
('{333CBE50-5443-4329-B824-789082D64549}', 1, 'ROG01', 'G-551VW', 'ASUS', '2015-12-30', 'Working', 'Core i7\r\nNVIDIA GEFORCE GTX 960M', 'zahid@gmail.com', 'Global Brand', 100000, '2019-04-17'),
('{3EAF698D-2FC9-4F07-8C9C-0F0D778EECBE}', 3, 'c101', 'GKU97', 'uhl', '2017-12-31', 'Working', 'sadhk', 'test@test.com', 'asd', 21, '2018-12-31'),
('{4AA59D87-B0CC-4229-80A8-E35430DEF68D}', 6, 'r101', 'FEU89', 'TP-Link', '2016-12-31', 'Working', 'Configuration', 'test@test.com', 'New Tech', 1300, '2017-12-31'),
('{60587C04-FDD2-47EB-96BD-40C2C108F509}', 4, 'm101', 'wqwe', 'dasd', '2017-11-01', 'On Repair', 'asd', 'test@test.com', 'sad', 4, '2017-11-02'),
('{BBA16347-A695-4CAC-A918-336B382596C4}', 1, 't101', 'a', 'q', '2017-11-01', 'On Repair', 'sda', 'test@test.com', 'awds', 2, '2017-11-02'),
('{DF6F512E-62DF-4142-B758-6EFA68F9E3BF}', 1, 'l102', '89OIJND', 'Dell', '2016-12-31', 'Working', 'Configuration', 'test@test.com', 'Shop', 60000, '2017-08-01'),
('{E50C8FEC-D088-4BAD-BF0E-6CC98378C368}', 1, 'l101', '213DWSA', 'ASUS', '2016-12-31', 'Working', 'Ram: 8GB \r\nProcessor: Intel Core i5 \r\nGeneration: 6th', 'test@test.com', 'Rayans', 70000, '2017-12-31');

-- --------------------------------------------------------

--
-- Table structure for table `ams_asset_type`
--

DROP TABLE IF EXISTS `ams_asset_type`;
CREATE TABLE IF NOT EXISTS `ams_asset_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ams_asset_type`
--

INSERT INTO `ams_asset_type` (`id`, `name`) VALUES
(1, 'Laptop'),
(3, 'CPU'),
(4, 'Monitor'),
(5, 'Projector'),
(6, 'Router');

-- --------------------------------------------------------

--
-- Table structure for table `ams_repair`
--

DROP TABLE IF EXISTS `ams_repair`;
CREATE TABLE IF NOT EXISTS `ams_repair` (
  `id` varchar(40) NOT NULL,
  `asset_id` varchar(40) NOT NULL,
  `problem` text NOT NULL,
  `sendingDate` date NOT NULL,
  `receivingDate` date DEFAULT NULL,
  `status` varchar(256) DEFAULT NULL,
  `sent_by` varchar(40) NOT NULL,
  `received_by` varchar(40) DEFAULT NULL,
  `repaired_from` varchar(256) NOT NULL,
  `cost` double DEFAULT NULL,
  `onWarranty` tinyint(1) NOT NULL,
  `isReceived` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sent_by` (`sent_by`),
  KEY `received_by` (`received_by`),
  KEY `asset_id` (`asset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ams_repair`
--

INSERT INTO `ams_repair` (`id`, `asset_id`, `problem`, `sendingDate`, `receivingDate`, `status`, `sent_by`, `received_by`, `repaired_from`, `cost`, `onWarranty`, `isReceived`) VALUES
('{29009978-4607-482C-A1EA-4D839462DDCB}', '{BBA16347-A695-4CAC-A918-336B382596C4}', 'asds', '2018-01-01', '2017-12-01', 'Partially Repaired', 'test@test.com', 'test@test.com', 'Alu', 3, 0, 1),
('{61C0676A-03C2-41A0-81A2-720B0396CF31}', '{BBA16347-A695-4CAC-A918-336B382596C4}', 'klm', '2016-12-31', NULL, NULL, 'test@test.com', NULL, 'asd', NULL, 1, 0),
('{79A79983-1481-47DE-8C0F-3AEE1E3B0C07}', '{4AA59D87-B0CC-4229-80A8-E35430DEF68D}', 'dawd', '2019-12-31', '2017-01-31', 'Partially Repaired', 'test@test.com', 'zahid@gmail.com', 'sdasd', 2, 0, 1),
('{9D4B2838-6CC6-46C7-87EE-4A01DB495A6B}', '{E50C8FEC-D088-4BAD-BF0E-6CC98378C368}', 'LLII', '2018-12-31', '2019-12-01', 'Partially Repaired', 'test@test.com', 'test@test.com', 'Alu', 5, 0, 1),
('{DE303E22-31B5-4B2D-8BE4-2FF7FDA1EA48}', '{DF6F512E-62DF-4142-B758-6EFA68F9E3BF}', 'Shutdown Problem', '2016-12-01', '2017-12-01', 'Repaired', 'test@test.com', 'test@test.com', 'Alu', 0, 1, 1),
('{FD3768E4-B17A-4A53-AA65-2850E23F1C91}', '{333CBE50-5443-4329-B824-789082D64549}', 'Over Heat', '2018-10-09', '2018-10-09', 'Repaired', 'zahid@gmail.com', 'zahid@gmail.com', 'Global Brand', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ams_user_asset`
--

DROP TABLE IF EXISTS `ams_user_asset`;
CREATE TABLE IF NOT EXISTS `ams_user_asset` (
  `id` varchar(40) NOT NULL,
  `user_id` varchar(40) NOT NULL,
  `asset_id` varchar(40) NOT NULL,
  `lendingDate` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `asset_id` (`asset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ems_email`
--

DROP TABLE IF EXISTS `ems_email`;
CREATE TABLE IF NOT EXISTS `ems_email` (
  `id` varchar(40) NOT NULL,
  `firstName` varchar(256) NOT NULL,
  `lastName` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `contact` varchar(256) NOT NULL,
  `contactEmail` varchar(256) NOT NULL,
  `address` text NOT NULL,
  `created_at` date NOT NULL,
  `expire_at` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ems_email`
--

INSERT INTO `ems_email` (`id`, `firstName`, `lastName`, `email`, `contact`, `contactEmail`, `address`, `created_at`, `expire_at`) VALUES
('{4C022864-729A-49FD-804B-38D8340BC459}', 'Sheikh Sohel', 'Moon', 'shlsbbr@gmail.com', '01977662888', 'shlsbbr@gmail.com', 'Khulna', '2018-08-17', '2020-08-20'),
('{B8F2B678-4353-46F4-A073-724599472EFB}', 'Mesbah Ur Rahman', 'Niloy', 'niloykpc123@gmail.com', '01856377269', 'niloykpc123@gmail.com', 'Khulna', '2018-10-16', '2019-11-20');

-- --------------------------------------------------------

--
-- Table structure for table `pms_hall_fee`
--

DROP TABLE IF EXISTS `pms_hall_fee`;
CREATE TABLE IF NOT EXISTS `pms_hall_fee` (
  `ID` varchar(40) NOT NULL,
  `UniversityID` int(11) NOT NULL,
  `Batch` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Email` text NOT NULL,
  `HallName` text NOT NULL,
  `FiscalYear` text NOT NULL,
  `Discipline` text NOT NULL,
  `Date` date NOT NULL,
  `Admission` int(11) NOT NULL,
  `Institutional` int(11) NOT NULL,
  `IdentificationCard` int(11) NOT NULL,
  `SeatRent` int(11) NOT NULL,
  `Utensil` int(11) NOT NULL,
  `CommonRoom` int(11) NOT NULL,
  `Sports` int(11) NOT NULL,
  `ReligiousEvent` int(11) NOT NULL,
  `SecurityReturnable` int(11) NOT NULL,
  `Contingency` int(11) NOT NULL,
  `HallAnniversary` int(11) NOT NULL,
  `Fine` int(11) NOT NULL,
  `Others` int(11) NOT NULL,
  `Total` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pms_hall_fee`
--

INSERT INTO `pms_hall_fee` (`ID`, `UniversityID`, `Batch`, `Name`, `Email`, `HallName`, `FiscalYear`, `Discipline`, `Date`, `Admission`, `Institutional`, `IdentificationCard`, `SeatRent`, `Utensil`, `CommonRoom`, `Sports`, `ReligiousEvent`, `SecurityReturnable`, `Contingency`, `HallAnniversary`, `Fine`, `Others`, `Total`) VALUES
('{29879C14-ED41-47B8-8A8B-5CF8CB8FF74B}', 160204, 16, 'Emamul Haque Manna', 'mannaemam@gmail.com', 'Khan Jahan Ali Hall', '2017/2018', 'Computer Science and Engineering', '2018-10-21', 1, 2, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 80),
('{7AF241F4-0E77-4EAA-9B89-8616B5CDD9ED}', 160216, 16, 'Aswad  Alam', 'aswad@gmail.com', 'Ahsanullah Hall', '2016/2017', 'Computer Science and Engineering', '2018-10-20', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2),
('{C06F2047-430A-4DC7-8587-7DEADCF82A5E}', 160204, 16, 'Emamul Haque Manna', 'mannaemam@gmail.com', 'Khan Jahan Ali Hall', '2016/2017', 'Computer Science and Engineering', '2018-10-20', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2),
('{C9917129-8C9B-436A-81EF-981279141873}', 160216, 16, 'Aswad  Alam', 'aswad@gmail.com', 'Ahsanullah Hall', '2018/2019', 'Computer Science and Engineering', '2018-10-22', 2, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 6),
('{E5644EB1-53CB-44CA-AD47-BB43F205CF68}', 160216, 16, 'Aswad  Alam', 'aswad@gmail.com', 'Ahsanullah Hall', '2017/2018', 'Computer Science and Engineering', '2018-10-22', 1, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 3, 6),
('{F69B2CFA-1C9F-4DA6-8053-240D1B00E002}', 160204, 16, 'Emamul Haque Manna', 'mannaemam@gmail.com', '', '', 'Computer Science and Engineering', '2018-10-29', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('{FA0A55E0-0D9D-486D-9E66-1CC8299C7A56}', 160204, 16, 'Emamul Haque Manna', 'mannaemam@gmail.com', 'Khan Jahan Ali Hall', '2018/2019', 'Computer Science and Engineering', '2018-10-22', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `pms_link_project`
--

DROP TABLE IF EXISTS `pms_link_project`;
CREATE TABLE IF NOT EXISTS `pms_link_project` (
  `id` varchar(40) NOT NULL,
  `link` text NOT NULL,
  `project_id` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pms_link_project`
--

INSERT INTO `pms_link_project` (`id`, `link`, `project_id`) VALUES
('{32D64873-5C27-4B1E-A90A-CD262D4A706B}', 'https://stackoverflow.com/questions/26727581/how-to-remove-default-padding-from-bootstrap-nav-bar', '{7D42D76F-3EE9-43CE-B2F9-A63051D028E3}'),
('{42F54C4C-5925-4667-B058-9FF70FA1459B}', 'https://stackoverflow.com/questions/34500423/remove-top-padding-on-bootstrap-navbar', '{F33491F4-516A-40B3-8D03-557F9A244D1E}'),
('{43A54675-59FC-468C-B928-CD32B2C94ED7}', 'https://stackoverflow.com/questions/26727581/how-to-remove-default-padding-from-bootstrap-nav-bar', '{66B187F3-123B-46C7-A2DB-84C26C40DCBB}'),
('{70017732-32D7-4688-BFDD-53878DE6ACB7}', 'http://cse.ku.dgted.com/', '{E0DDFBEC-EB89-472D-9802-03E322A59281}'),
('{9BE1DB6E-F7E1-4D2D-B3CA-CF7F2A704013}', 'https://stackoverflow.com/questions/34500423/remove-top-padding-on-bootstrap-navbar', '{7D42D76F-3EE9-43CE-B2F9-A63051D028E3}'),
('{A7054D61-1F25-469A-A37E-07BE3058239B}', 'https://www.youtube.com/watch?v=PjcRfTnI0kU&pbjreload=10', '{7D42D76F-3EE9-43CE-B2F9-A63051D028E3}'),
('{FA964E29-1FC8-403A-81DD-405E732771F4}', 'https://stackoverflow.com/questions/26727581/how-to-remove-default-padding-from-bootstrap-nav-bar', '{66B187F3-123B-46C7-A2DB-84C26C40DCBB}');

-- --------------------------------------------------------

--
-- Table structure for table `pms_others_fee`
--

DROP TABLE IF EXISTS `pms_others_fee`;
CREATE TABLE IF NOT EXISTS `pms_others_fee` (
  `ID` varchar(40) NOT NULL,
  `UniversityID` int(40) NOT NULL,
  `Batch` text NOT NULL,
  `Name` text NOT NULL,
  `Email` text NOT NULL,
  `Discipline` text NOT NULL,
  `Date` date NOT NULL,
  `Description` text NOT NULL,
  `Total` int(40) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pms_others_fee`
--

INSERT INTO `pms_others_fee` (`ID`, `UniversityID`, `Batch`, `Name`, `Email`, `Discipline`, `Date`, `Description`, `Total`) VALUES
('{48B9FB28-B876-4296-92B6-E8EE3453E488}', 160216, '16', 'Aswad  Alam', 'aswad@gmail.com', 'Computer Science and Engineering', '2018-10-22', 'DEVELOPMENT', 10),
('{615E147F-EA16-4E2F-9A01-05515A01D3F6}', 160216, '16', 'Aswad  Alam', 'aswad@gmail.com', 'Computer Science and Engineering', '2018-10-23', 'Sports', 100),
('{76A1ED3E-84CD-42BB-8BF4-4822FC6F163E}', 160216, '16', 'Aswad  Alam', 'aswad@gmail.com', 'Computer Science and Engineering', '2018-10-22', 'CLUSTER', 5),
('{D3779D9D-A8E8-4C89-9579-7CC5429A5609}', 160204, '16', 'Emamul Haque Manna', 'mannaemam@gmail.com', 'Computer Science and Engineering', '2018-10-22', 'Cluster', 3);

-- --------------------------------------------------------

--
-- Table structure for table `pms_payment_type`
--

DROP TABLE IF EXISTS `pms_payment_type`;
CREATE TABLE IF NOT EXISTS `pms_payment_type` (
  `ID` varchar(40) CHARACTER SET utf8 NOT NULL,
  `PID` varchar(40) CHARACTER SET utf8 NOT NULL,
  `UniversityID` int(40) NOT NULL,
  `Type` text CHARACTER SET utf8 NOT NULL,
  `Date` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pms_payment_type`
--

INSERT INTO `pms_payment_type` (`ID`, `PID`, `UniversityID`, `Type`, `Date`) VALUES
('{0D5CEF22-7AE7-4F30-894A-EA093D756CB1}', '{C9917129-8C9B-436A-81EF-981279141873}', 160216, 'Hall Fee', '2018-10-22 00:00:00'),
('{0EA045CA-E9EA-47E0-809F-D72F4A8A5E36}', '{8D94B890-D07A-43CD-B1D7-84F6177B99C8}', 160204, 'Registration Fee', '2018-10-19 00:00:00'),
('{1F88B069-5F10-4FB9-A494-59A7B28C3A23}', '{630B4A5B-F075-4C4F-BF65-C99CB3003CB5}', 160204, 'Product', '2018-10-29 01:03:50'),
('{20735E4D-1273-4D55-83C0-5362B566B005}', '{9A69A4D3-5166-4F65-80A9-5B6347A30041}', 160204, 'Registration Fee', '2018-10-20 00:00:00'),
('{2B3BF89F-AB81-44D4-A9EF-24CB17EB1720}', '{615E147F-EA16-4E2F-9A01-05515A01D3F6}', 160216, 'Others Fee', '2018-10-23 00:00:00'),
('{2D20B95F-E2F2-49D3-9108-545E203CC3EC}', '{87956421-ABC3-4FAC-888B-41EA15315A69}', 160204, 'Registration Fee', '2018-10-20 00:00:00'),
('{4A9DB965-4C22-4DA8-9654-2735D3F1878D}', '{6A7DDBAF-99A7-49B2-94E0-B451E88A29E1}', 160216, 'Registration Fee', '2018-10-23 00:00:00'),
('{57957ECF-38C3-4796-B07E-FBFA87644AF6}', '{9734E6E8-74D0-48E7-8144-5F0016455100}', 160204, 'Registration Fee', '2018-10-29 01:48:41'),
('{59878D61-4946-4608-BE94-0C47D3A8EADA}', '{C06F2047-430A-4DC7-8587-7DEADCF82A5E}', 160204, 'Hall Fee', '2018-10-20 00:00:00'),
('{5E079CBB-1378-460F-BE0A-D37354390F52}', '{B12AA071-7ACA-4221-AEE6-D45E814D5514}', 160216, 'Registration Fee', '2018-10-23 00:00:00'),
('{62E60774-A20D-4EFC-BD9B-E37B4440940A}', '{25F764F6-8DF2-4276-AB86-F6639B887AAF}', 160204, 'Product', '2018-10-29 02:24:05'),
('{67AB46B8-1EEA-46A7-98E3-481D9E24CFC0}', '{8B38CC68-FBE3-49A7-B31C-DB8D2B915159}', 160204, 'Registration Fee', '2018-10-18 00:00:00'),
('{82439869-A13E-4BA8-A531-E8596211C3DC}', '{76A1ED3E-84CD-42BB-8BF4-4822FC6F163E}', 160216, 'Others Fee', '2018-10-22 00:00:00'),
('{8AD3FC1A-6F81-4C08-A843-2B66D8498400}', '{AD69CEC5-D998-4C67-94FA-F235D4DBC077}', 160204, 'Registration Fee', '2018-10-20 00:00:00'),
('{8D88F697-D9CA-4402-9C7B-63013B72CFBD}', '{41E2A1FA-20A8-4AC5-85B0-5E8C0026D1AF}', 160204, 'Product', '2018-10-29 12:43:51'),
('{909E7B34-B267-4924-8367-8A44AA42DE46}', '{E464BEA5-AFCC-4A96-9AEC-10587AF3C5AD}', 160216, 'Registration Fee', '2018-10-19 00:00:00'),
('{9377D689-0B4E-45CA-9A7D-45CE3E70B392}', '{7AF241F4-0E77-4EAA-9B89-8616B5CDD9ED}', 160216, 'Hall Fee', '2018-10-20 00:00:00'),
('{95BB204F-170B-4410-BC70-59CE969540BF}', '{48B9FB28-B876-4296-92B6-E8EE3453E488}', 160216, 'Others Fee', '2018-10-22 00:00:00'),
('{AF5104DA-382F-446E-8C53-10E096B9E1EE}', '{29879C14-ED41-47B8-8A8B-5CF8CB8FF74B}', 160204, 'Hall Fee', '2018-10-20 00:00:00'),
('{B1D84286-B44D-44D9-B1FB-9CFC6E3301CF}', '{FA0A55E0-0D9D-486D-9E66-1CC8299C7A56}', 160204, 'Hall Fee', '2018-10-22 00:00:00'),
('{B867A4D1-FBA2-45BD-B88C-8598B9DE2946}', '{4A72D47F-AEE4-434D-9154-BB09548F5034}', 160216, 'Registration Fee', '2018-10-22 00:00:00'),
('{C35B02E5-1861-4B1E-90C4-3123553ACA6A}', '{D3779D9D-A8E8-4C89-9579-7CC5429A5609}', 160204, 'Others Fee', '2018-10-22 00:00:00'),
('{D5385D52-73B0-40D9-BE15-8E9A9903A4BF}', '{F69B2CFA-1C9F-4DA6-8053-240D1B00E002}', 160204, 'Hall Fee', '2018-10-29 01:49:33'),
('{EB94F196-8FA6-4940-829B-0403498F4746}', '{E5644EB1-53CB-44CA-AD47-BB43F205CF68}', 160216, 'Hall Fee', '2018-10-22 00:00:00'),
('{EC7A83D9-47D4-4D05-9A52-A27C9AE6C303}', '{2326EBDC-36E5-4E45-A583-8F263E364353}', 160216, 'Registration Fee', '2018-10-22 00:00:00'),
('{FBAE33C2-1575-4F90-A661-8D09B7356DBA}', '{47EE1E78-A76B-4122-8147-106E94B1C480}', 160204, 'Registration Fee', '2018-10-17 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `pms_project`
--

DROP TABLE IF EXISTS `pms_project`;
CREATE TABLE IF NOT EXISTS `pms_project` (
  `id` varchar(40) NOT NULL,
  `thumbnail` text NOT NULL,
  `title` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `language` varchar(256) NOT NULL,
  `year_id` varchar(40) NOT NULL,
  `term_id` varchar(40) NOT NULL,
  `course_id` varchar(40) NOT NULL,
  `discipline_id` varchar(40) NOT NULL,
  `teacher_id` varchar(40) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `year_id` (`year_id`),
  KEY `term_id` (`term_id`),
  KEY `course_id` (`course_id`),
  KEY `discipline_id` (`discipline_id`),
  KEY `teacher_id` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pms_project`
--

INSERT INTO `pms_project` (`id`, `thumbnail`, `title`, `description`, `language`, `year_id`, `term_id`, `course_id`, `discipline_id`, `teacher_id`, `created_at`, `updated_at`) VALUES
('{0C262E4E-80F5-436-AF8C-48FA39EAE4C0}', './resources/img/thumbnails/Transport Management System.png', 'Transport Management System', '\"Create vehicles as assets. Assign drivers, helpers to bus along with their contact information. \r\n\r\nCreate routes and the stopage along with the google map options \r\n\r\nAdd more features to it, be creative\"', 'PHP', '3', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'teacher@gmail.com', '2017-10-10 09:12:20', '2017-10-10 09:12:20'),
('{0C262E4E-80F5-4367-AF8C-48FA39EAE4C0}', './resources/img/thumbnails/Transport Management System.png', 'Transport Management System', '\"Create vehicles as assets. Assign drivers, helpers to bus along with their contact information. \r\n\r\nCreate routes and the stopage along with the google map options \r\n\r\nAdd more features to it, be creative\"', 'PHP', '3', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'teacher@gmail.com', '2017-08-28 04:35:47', '2017-08-28 04:35:47'),
('{0C262E4E-80F5-437-AF8C-48FA39EAE4C0}', './resources/img/thumbnails/Transport Management System.png', 'Transport Management System', '\"Create vehicles as assets. Assign drivers, helpers to bus along with their contact information. \r\n\r\nCreate routes and the stopage along with the google map options \r\n\r\nAdd more features to it, be creative\"', 'PHP', '3', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'teacher@gmail.com', '2017-10-10 09:11:48', '2017-10-10 09:11:48'),
('{0C62E4E-80F5-4367-AF8C-48FA39EAE4C0}', './resources/img/thumbnails/Transport Management System.png', 'Transport Management System', '\"Create vehicles as assets. Assign drivers, helpers to bus along with their contact information. \r\n\r\nCreate routes and the stopage along with the google map options \r\n\r\nAdd more features to it, be creative\"', 'PHP', '3', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'teacher@gmail.com', '2017-10-10 09:12:14', '2017-10-10 09:12:14'),
('{66B187F3-123B-46C7-A2DB-84C26C40DCBB}', './resources/img/thumbnails/Improved CSE Discipline website (OOP).png', 'Improved CSE Discipline website (OOP)', '\"refresh current website with the given template. \r\n\r\none group work with the new templating. \r\n\r\nOther group work with the admin part for the current database\"', 'PHP', '3', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'teacher@gmail.com', '2017-08-28 02:09:20', '2017-10-11 13:54:45'),
('{6F28DF7E-D7D4-4305-B116-D7466C8CDE03}', './resources/img/thumbnails/Meal Management.png', 'Meal Management', 'dsf', 'PHP', '2', '{298E9628-8DE2-4742-8F93-0491C01BB152}', '2', '{AF41CC9F-3BCD-4952-9D02-17184CC40C79}', 'teacher@gmail.com', '2017-10-11 23:36:43', '2017-10-11 23:36:43'),
('{7D42D76F-3EE9-43CE-B2F9-A63051D028E3}', './resources/img/thumbnails/Improved file-folder management system..png', 'Improved file-folder management system.', '\"improve the available SimTire file folder system, File allocation, file versioning, file relation should be present\r\n\r\nCreate a beatiful file browsing system\"', 'PHP', '3', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'teacher@gmail.com', '2017-08-28 04:09:17', '2017-08-28 04:09:17'),
('{7D42DF-3EE9-43CE-B2F9-A63051D028E3}', './resources/img/thumbnails/Improved file-folder management system..png', 'Improved file-folder management system.', '\"improve the available SimTire file folder system, File allocation, file versioning, file relation should be present\r\n\r\nCreate a beatiful file browsing system\"', 'PHP', '3', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'teacher@gmail.com', '2017-10-10 09:12:01', '2017-10-10 09:12:01'),
('{A5298EE6-822A-4ABF-981D-825CE0FE189B}', './resources/img/thumbnails/Meal Management.png', 'Meal Management', '\"Meal system where you create meal at different times of the day, create menu, cost, SimTire user can subscribe and unsuscribe and pay for the meal to consume it\r\n\r\nIdeally it should be related to the housing. So a meal would created on a housing and consumed from there\r\n\r\nDaily, weekly, monthly consumption report, most likely menus, ranking of the meal should be also present\"', 'PHP', '3', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'teacher@gmail.com', '2017-08-28 04:08:43', '2017-10-12 22:52:12'),
('{A94A0ABA-1AFA-461E-A09D-808A4FB8B522}', './resources/img/thumbnails/Payment Management System.png', 'Payment Management System', '\"First of all user can load his account with money. This is just dummy money\r\n\r\nPayment can be done by SimTire user related to different things may be medical bill, library fine, buying stuffs from canteen.\r\n\r\nThere will be a store of items and their price will be there. User can buy things from that store and pay using their balance from the account. \r\n\r\nFor buying something (e.g. book) from the store user will get credit and later credit can be converted to a balance using some forumla.\"', 'PHP', '3', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'teacher@gmail.com', '2017-08-28 04:11:12', '2017-08-28 04:11:12'),
('{CEC76C2B-FA03-4B33-AB9A-B523B7334145}', './resources/img/thumbnails/Improved advanced event calendar.png', 'Improved advanced event calendar', '\"apply SimTire on the available event calendar code and new features to it\r\n\r\nVarious types of searching\"', 'PHP', '3', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'teacher@gmail.com', '2017-08-28 04:06:10', '2017-09-14 00:27:31'),
('{D283BD24-F48F-45FA-A397-ACFABF690E9C}', './resources/img/thumbnails/Project Archieve.png', 'Project Archieve', '\"improve current project module to SimTire based project. Project should also inclue member names and their partnership in the project\r\n\r\nA front page for the project module where all the projects along with their thumnail pictures and title are shown using pagination. You select one project and you can see the details of the project and the members of the project. Also, the partneship of project if applicable\r\n\r\nPersone wise project lists should also be there\"', 'PHP', '3', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'teacher@gmail.com', '2017-08-28 04:10:39', '2017-08-28 04:10:39'),
('{E0DDFBEC-EB89-472D-9802-03E322A59281}', './resources/img/thumbnails/Library Management.png', 'Library Management', 'create library, create books, create shelfs, assing book to shelfs to a specific library, search books different ways, student can take books and return bookscreate library, create books, create shelfs, assing book to shelfs to a specific library, search books different ways, student can take books and return bookscreate library, create books, create shelfs, assing book to shelfs to a specific library, search books different ways, student can take books and return books', 'PHP', '3', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'teacher@gmail.com', '2017-08-28 04:09:46', '2017-09-12 00:00:55'),
('{F33491F4-516A-40B3-8D03-557F9A244D1E}', './resources/img/thumbnails/Student Hall Dorm Teacher Staff housing Management.png', 'Student Hall Dorm Teacher Staff housing Management', '\"CRUD of hall/dorm/teacher/staff housing, every hall/others will have rooms, each room will have seats. a student will be selected from the SimTire user and will be assigned to a seat\r\nVarious types of searching \"', 'PHP', '3', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'teacher@gmail.com', '2017-08-28 04:07:55', '2017-10-11 14:13:08'),
('{FB511786-370C-4AA9-9686-59EA7C8D1B2B}', './resources/img/thumbnails/Medical Service Management.ico', 'Medical Service Management', '\"create doctors, nurse, medicine stock, university people assigned to doctor, doctor see patient, write prescriptions, and medicine \r\nthen medicine is given to a person and stock gets updated\"', 'PHP', '3', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'teacher@gmail.com', '2017-08-28 04:10:17', '2017-08-28 04:10:17');

-- --------------------------------------------------------

--
-- Table structure for table `pms_recharge`
--

DROP TABLE IF EXISTS `pms_recharge`;
CREATE TABLE IF NOT EXISTS `pms_recharge` (
  `ID` varchar(40) CHARACTER SET utf8 NOT NULL,
  `Date` datetime NOT NULL,
  `Email` text CHARACTER SET utf8 NOT NULL,
  `Amount` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pms_recharge`
--

INSERT INTO `pms_recharge` (`ID`, `Date`, `Email`, `Amount`) VALUES
('{46D252E8-7694-4C15-AB10-99D14CEE73B1}', '2018-10-29 12:01:09', 'mannaemam@gmail.com', 1780),
('{94CEC983-C608-408E-86B5-EE99012CE047}', '2018-10-29 01:20:46', 'aswad@gmail.com', 1110);

-- --------------------------------------------------------

--
-- Table structure for table `pms_recharge_log`
--

DROP TABLE IF EXISTS `pms_recharge_log`;
CREATE TABLE IF NOT EXISTS `pms_recharge_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Date` datetime NOT NULL,
  `Email` text CHARACTER SET utf8 NOT NULL,
  `Amount` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pms_recharge_log`
--

INSERT INTO `pms_recharge_log` (`ID`, `Date`, `Email`, `Amount`) VALUES
(5, '2018-10-17 00:00:00', 'mannaemam@gmail.com', 100),
(6, '2018-10-19 00:00:00', 'aswad@gmail.com', 100),
(7, '2018-10-20 00:00:00', 'mannaemam@gmail.com', 50),
(8, '2018-10-20 00:00:00', 'aswad@gmail.com', 60),
(9, '2018-10-20 00:00:00', 'aswad@gmail.com', 70),
(10, '2018-10-23 00:00:00', 'aswad@gmail.com', 100),
(11, '2018-10-28 00:00:00', 'mannaemam@gmail.com', 2000),
(12, '2018-10-29 00:00:00', 'mannaemam@gmail.com', 2000),
(13, '2018-10-29 00:00:00', 'aswad@gmail.com', 1000),
(14, '2018-10-29 00:00:00', 'aswad@gmail.com', 10),
(15, '2018-10-29 01:20:46', 'aswad@gmail.com', 20),
(16, '2018-10-29 12:01:09', 'mannaemam@gmail.com', 10);

-- --------------------------------------------------------

--
-- Table structure for table `pms_reg_fee`
--

DROP TABLE IF EXISTS `pms_reg_fee`;
CREATE TABLE IF NOT EXISTS `pms_reg_fee` (
  `ID` varchar(40) CHARACTER SET utf8 NOT NULL,
  `UniversityID` int(40) NOT NULL,
  `Batch` int(40) NOT NULL,
  `Name` varchar(40) CHARACTER SET utf8 NOT NULL,
  `Email` varchar(40) CHARACTER SET utf8 NOT NULL,
  `Term` text CHARACTER SET utf8 NOT NULL,
  `Discipline` text CHARACTER SET utf8 NOT NULL,
  `Date` date NOT NULL,
  `AdmissionFee` double NOT NULL,
  `PayBook` double NOT NULL,
  `Security` double NOT NULL,
  `Transportation` double NOT NULL,
  `CourseRegistration` double NOT NULL,
  `Verification` double NOT NULL,
  `Retake` double NOT NULL,
  `ReRetake` double NOT NULL,
  `Bncc` double NOT NULL,
  `Library` double NOT NULL,
  `Medical` double NOT NULL,
  `Cultural` double NOT NULL,
  `ReligiousFee` double NOT NULL,
  `ExaminationFee` double NOT NULL,
  `SessionCharge` double NOT NULL,
  `Gradesheet` double NOT NULL,
  `ProvisionalCertificate` double NOT NULL,
  `MainCertificate` double NOT NULL,
  `Transcript` double NOT NULL,
  `SecurityLibrary` double NOT NULL,
  `EquivalenceCertificate` double NOT NULL,
  `FineLibrary` double NOT NULL,
  `FineRegistration` double NOT NULL,
  `Mc_Mi` double NOT NULL,
  `MphilPhd` double NOT NULL,
  `StudentWelfare` double NOT NULL,
  `Sports` double NOT NULL,
  `Publication` double NOT NULL,
  `Others` double NOT NULL,
  `Total` int(40) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pms_reg_fee`
--

INSERT INTO `pms_reg_fee` (`ID`, `UniversityID`, `Batch`, `Name`, `Email`, `Term`, `Discipline`, `Date`, `AdmissionFee`, `PayBook`, `Security`, `Transportation`, `CourseRegistration`, `Verification`, `Retake`, `ReRetake`, `Bncc`, `Library`, `Medical`, `Cultural`, `ReligiousFee`, `ExaminationFee`, `SessionCharge`, `Gradesheet`, `ProvisionalCertificate`, `MainCertificate`, `Transcript`, `SecurityLibrary`, `EquivalenceCertificate`, `FineLibrary`, `FineRegistration`, `Mc_Mi`, `MphilPhd`, `StudentWelfare`, `Sports`, `Publication`, `Others`, `Total`) VALUES
('{2326EBDC-36E5-4E45-A583-8F263E364353}', 160216, 16, 'Aswad  Alam', 'aswad@gmail.com', '2-1', 'Computer Science and Engineering', '2018-10-22', 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 6),
('{47EE1E78-A76B-4122-8147-106E94B1C480}', 160204, 16, 'Emamul Haque Manna', 'mannaemam@gmail.com', '1-1', 'Computer Science and Engineering', '2018-10-17', 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3),
('{4A72D47F-AEE4-434D-9154-BB09548F5034}', 160216, 16, 'Aswad  Alam', 'aswad@gmail.com', '1-2', 'Computer Science and Engineering', '2018-10-22', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 6),
('{6A7DDBAF-99A7-49B2-94E0-B451E88A29E1}', 160216, 16, 'Aswad  Alam', 'aswad@gmail.com', '3-1', 'Computer Science and Engineering', '2018-10-23', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 3),
('{87956421-ABC3-4FAC-888B-41EA15315A69}', 160204, 16, 'Emamul Haque Manna', 'mannaemam@gmail.com', '2-2', 'Computer Science and Engineering', '2018-10-20', 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 3),
('{8B38CC68-FBE3-49A7-B31C-DB8D2B915159}', 160204, 16, 'Emamul Haque Manna', 'mannaemam@gmail.com', '1-2', 'Computer Science and Engineering', '2018-10-18', 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2),
('{8D94B890-D07A-43CD-B1D7-84F6177B99C8}', 160204, 16, 'Emamul Haque Manna', 'mannaemam@gmail.com', '2-1', 'Computer Science and Engineering', '2018-10-19', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
('{9734E6E8-74D0-48E7-8144-5F0016455100}', 160204, 16, 'Emamul Haque Manna', 'mannaemam@gmail.com', '', 'Computer Science and Engineering', '2018-10-29', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('{9A69A4D3-5166-4F65-80A9-5B6347A30041}', 160204, 16, 'Emamul Haque Manna', 'mannaemam@gmail.com', '3-1', 'Computer Science and Engineering', '2018-10-25', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 4),
('{AD69CEC5-D998-4C67-94FA-F235D4DBC077}', 160204, 16, 'Emamul Haque Manna', 'mannaemam@gmail.com', '3-2', 'Computer Science and Engineering', '2018-10-26', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 2),
('{B12AA071-7ACA-4221-AEE6-D45E814D5514}', 160216, 16, 'Aswad  Alam', 'aswad@gmail.com', '4-1', 'Computer Science and Engineering', '2018-10-23', 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15),
('{E464BEA5-AFCC-4A96-9AEC-10587AF3C5AD}', 160216, 16, 'Aswad  Alam', 'aswad@gmail.com', '1-1', 'Computer Science and Engineering', '2018-10-19', 5, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10);

-- --------------------------------------------------------

--
-- Table structure for table `pms_student_project`
--

DROP TABLE IF EXISTS `pms_student_project`;
CREATE TABLE IF NOT EXISTS `pms_student_project` (
  `id` varchar(40) NOT NULL,
  `student_id` varchar(40) NOT NULL,
  `project_id` varchar(40) NOT NULL,
  `contribution` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pms_student_project`
--

INSERT INTO `pms_student_project` (`id`, `student_id`, `project_id`, `contribution`) VALUES
('{0058AF12-CF2A-4CC3-97C9-34A23FA11457}', 'zubayer@gmail.com', '{CEC76C2B-FA03-4B33-AB9A-B523B7334145}', 65),
('{0DFA6FE8-A794-46AD-8736-92D62F47C8F0}', 'imran@gmail.com', '{7D42D76F-3EE9-43CE-B2F9-A63051D028E3}', 0),
('{0EC59379-2D22-41D0-B04A-B3019DFD0753}', 'pranta.cse@gmail.com', '{D283BD24-F48F-45FA-A397-ACFABF690E9C}', 0),
('{11232E59-FF84-4B74-AA65-2168888FBD07}', 'shuvo@gmail.com', '{66B187F3-123B-46C7-A2DB-84C26C40DCBB}', 0),
('{22CC1D41-8C86-4C65-AE8E-AD5D13227B2E}', 'imran@gmail.com', '{FB511786-370C-4AA9-9686-59EA7C8D1B2B}', 0),
('{330E2402-9EAB-4694-A532-31238064EE88}', 'imran@gmail.com', '{CEC76C2B-FA03-4B33-AB9A-B523B7334145}', 23),
('{3B20A933-25D7-4FCF-8FDE-9D8DBECBE9C8}', 'sakeef@gmail.com', '{D283BD24-F48F-45FA-A397-ACFABF690E9C}', 0),
('{6928ED6C-7DF1-43AF-8DD4-F54D3C769D60}', 'zubayer@gmail.com', '{FB511786-370C-4AA9-9686-59EA7C8D1B2B}', 0),
('{7399A4CE-258D-4F7C-8CA9-C59DBA7795F4}', 'imran@gmail.com', '{F33491F4-516A-40B3-8D03-557F9A244D1E}', 23),
('{7D2A676A-875C-4B96-8D57-6B0D0FF3151F}', 'azoadahnaf@gmail.com', '{A5298EE6-822A-4ABF-981D-825CE0FE189B}', 0),
('{9277AD4B-2FBD-462B-B132-54DA763DD22D}', 'durjoy@gmail.com', '{7D42D76F-3EE9-43CE-B2F9-A63051D028E3}', 0),
('{A3F7A699-E6CF-4377-9711-602D503C5D76}', 'imran@gmail.com', '{66B187F3-123B-46C7-A2DB-84C26C40DCBB}', 0),
('{A9BC0288-1DF9-4026-AEE1-D734AF2350AD}', 'shahidul@gmail.com', '{66B187F3-123B-46C7-A2DB-84C26C40DCBB}', 0),
('{B6CBE46F-0CE4-4831-B61F-F74DAFD700E0}', 'swajon@gmail.com', '{FB511786-370C-4AA9-9686-59EA7C8D1B2B}', 0),
('{BF747D37-653E-4D0B-AFA5-608D8BC41D13}', 'shahidul@gmail.com', '{E0DDFBEC-EB89-472D-9802-03E322A59281}', 100),
('{C18347DC-0769-445E-8FF3-BFA1499664E2}', 'pranta.cse@gmail.com', '{66B187F3-123B-46C7-A2DB-84C26C40DCBB}', 0),
('{C231CCBA-DD44-462B-9094-033A79B5580F}', 'tanmai@gmail.com', '{D283BD24-F48F-45FA-A397-ACFABF690E9C}', 0),
('{CAD5408B-AB81-4445-BF3B-3B1BE2229536}', 'zubayer@gmail.com', '{7D42D76F-3EE9-43CE-B2F9-A63051D028E3}', 0),
('{E2377C13-3040-4DF3-B858-CFE5774761FE}', 'alamin@gmail.com', '{F33491F4-516A-40B3-8D03-557F9A244D1E}', 33);

-- --------------------------------------------------------

--
-- Table structure for table `reg_course`
--

DROP TABLE IF EXISTS `reg_course`;
CREATE TABLE IF NOT EXISTS `reg_course` (
  `ID` varchar(40) NOT NULL,
  `CourseNo` varchar(40) NOT NULL,
  `Title` varchar(100) NOT NULL,
  `Credit` double NOT NULL,
  `CourseTypeID` varchar(40) NOT NULL,
  `DisciplineID` varchar(40) NOT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg_course`
--

INSERT INTO `reg_course` (`ID`, `CourseNo`, `Title`, `Credit`, `CourseTypeID`, `DisciplineID`, `IsDeleted`) VALUES
('{2A038C6A-B6DA-408D-8458-7493D4EE5D6C}', 'cse-3200', 'Web Programming Lab', 1.5, '{EF5CA3BF-A886-4450-ABC4-DED45C7600C0}', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 0),
('{53650FB7-D76E-459D-8B56-BC7A4919C0F6}', 'cse-4112', 'Computer Networks Lab', 1.5, '{EF5CA3BF-A886-4450-ABC4-DED45C7600C0}', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5} ', 0),
('{683A3D91-D124-44AF-82A3-FB43837A4392}', 'cse-4111', 'Computer Networks', 3, '{3DC4DDE5-514F-4BE4-8682-37EA32C3FDB7}', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 0),
('{B17BDB32-6D88-4537-9545-65D940E17EEF}', 'cse-2115', 'Advanced Programming Lab', 1.5, '{EF5CA3BF-A886-4450-ABC4-DED45C7600C0}', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5} ', 0);

-- --------------------------------------------------------

--
-- Table structure for table `reg_course_resource`
--

DROP TABLE IF EXISTS `reg_course_resource`;
CREATE TABLE IF NOT EXISTS `reg_course_resource` (
  `CourseID` varchar(40) NOT NULL,
  `ResourceID` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reg_course_sessional_type`
--

DROP TABLE IF EXISTS `reg_course_sessional_type`;
CREATE TABLE IF NOT EXISTS `reg_course_sessional_type` (
  `ID` varchar(40) NOT NULL,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg_course_sessional_type`
--

INSERT INTO `reg_course_sessional_type` (`ID`, `Name`) VALUES
('{126156BB-18ED-4CAB-8DB9-1C0F72BB63C1}', 'N/A'),
('{45B2147F-5FE0-4CC9-880C-C19EB6323955}', 'physics'),
('{4B342686-B38E-449C-AAD2-1F7DD77E6594}', 'chemistry'),
('{D1E54E03-CDEB-4155-AD0C-27C70A3A490C}', 'ece'),
('{D3F895D3-7389-487F-A604-0BD546DCC764}', 'software'),
('{F1D0443A-EC5D-41C4-94BA-D6F0D9AB1691}', 'hardware');

-- --------------------------------------------------------

--
-- Table structure for table `reg_course_student_registration`
--

DROP TABLE IF EXISTS `reg_course_student_registration`;
CREATE TABLE IF NOT EXISTS `reg_course_student_registration` (
  `ID` varchar(40) NOT NULL,
  `Regs_TeacherID` varchar(40) DEFAULT NULL,
  `StudentID` varchar(40) NOT NULL,
  `CourseID` varchar(40) NOT NULL,
  `SessionID` varchar(40) DEFAULT NULL,
  `YearID` varchar(40) DEFAULT NULL,
  `TermID` varchar(40) DEFAULT NULL,
  `IsRetake` tinyint(1) DEFAULT NULL,
  `Status` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg_course_student_registration`
--

INSERT INTO `reg_course_student_registration` (`ID`, `Regs_TeacherID`, `StudentID`, `CourseID`, `SessionID`, `YearID`, `TermID`, `IsRetake`, `Status`) VALUES
('{31FDEF1E-F280-436A-AFD3-A48BA772D23D}', 'mkazi078@uottawa.ca', 'kashif@gmail.com', '{683A3D91-D124-44AF-82A3-FB43837A4392}', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{6780C884-E112-4F58-9503-E2110B615547}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', NULL, 'registered'),
('{3CA3ABF7-7FF8-4A32-B328-235861061B72}', 'mkazi078@uottawa.ca', 'zahid@gmail.com', '{683A3D91-D124-44AF-82A3-FB43837A4392}', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{6780C884-E112-4F58-9503-E2110B615547}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', NULL, 'registered'),
('{B7F17833-430E-489A-9CA6-E9BBE0EFA0FD}', 'mkazi078@uottawa.ca', 'kashif@gmail.com', '{53650FB7-D76E-459D-8B56-BC7A4919C0F6}', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{6780C884-E112-4F58-9503-E2110B615547}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', NULL, 'registered'),
('{B8B362F3-D164-4082-AA6C-08F3EC73E2A8}', 'mkazi078@uottawa.ca', 'aysha@gmail.com', '{53650FB7-D76E-459D-8B56-BC7A4919C0F6}', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{6780C884-E112-4F58-9503-E2110B615547}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', NULL, 'registered'),
('{C8AE75F9-1644-48C5-87D0-4AFEC777C122}', 'mkazi078@uottawa.ca', 'zahid@gmail.com', '{53650FB7-D76E-459D-8B56-BC7A4919C0F6}', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{6780C884-E112-4F58-9503-E2110B615547}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', NULL, 'submitted'),
('{DBE4ED93-4A97-41CF-B8E3-5E42AEC0246F}', 'mkazi078@uottawa.ca', 'aysha@gmail.com', '{683A3D91-D124-44AF-82A3-FB43837A4392}', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{6780C884-E112-4F58-9503-E2110B615547}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', NULL, 'registered');

-- --------------------------------------------------------

--
-- Table structure for table `reg_course_teacher`
--

DROP TABLE IF EXISTS `reg_course_teacher`;
CREATE TABLE IF NOT EXISTS `reg_course_teacher` (
  `ID` varchar(40) NOT NULL,
  `CourseID` varchar(40) NOT NULL,
  `TeacherID` varchar(40) NOT NULL,
  `SessionID` varchar(40) NOT NULL,
  `YearID` varchar(40) NOT NULL,
  `TermID` varchar(40) NOT NULL,
  `NoOfTests` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg_course_teacher`
--

INSERT INTO `reg_course_teacher` (`ID`, `CourseID`, `TeacherID`, `SessionID`, `YearID`, `TermID`, `NoOfTests`) VALUES
('{0BA78ECC-A6E7-4EA8-9BFA-6C599F88F76D}', '{53650FB7-D76E-459D-8B56-BC7A4919C0F6}', 'mkazi078@uottawa.ca', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{6780C884-E112-4F58-9503-E2110B615547}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', 5),
('{C4490FFA-154B-45FE-9773-744B3E6FDFF7}', '{683A3D91-D124-44AF-82A3-FB43837A4392}', 'mkazi078@uottawa.ca', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{6780C884-E112-4F58-9503-E2110B615547}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', 3);

-- --------------------------------------------------------

--
-- Table structure for table `reg_course_teacher_registration`
--

DROP TABLE IF EXISTS `reg_course_teacher_registration`;
CREATE TABLE IF NOT EXISTS `reg_course_teacher_registration` (
  `ID` varchar(40) NOT NULL,
  `TeacherID` varchar(40) NOT NULL,
  `SessionID` varchar(40) NOT NULL,
  `YearID` varchar(40) NOT NULL,
  `TermID` varchar(40) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg_course_teacher_registration`
--

INSERT INTO `reg_course_teacher_registration` (`ID`, `TeacherID`, `SessionID`, `YearID`, `TermID`) VALUES
('{4D389527-643B-4B05-80AB-E05A6EF8DE2A}', 'mkazi078@uottawa.ca', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{EA335D18-A1A8-4D15-9C7B-4A4700AD4543}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}');

-- --------------------------------------------------------

--
-- Table structure for table `reg_course_type`
--

DROP TABLE IF EXISTS `reg_course_type`;
CREATE TABLE IF NOT EXISTS `reg_course_type` (
  `ID` varchar(40) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `SessionalTypeID` varchar(40) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg_course_type`
--

INSERT INTO `reg_course_type` (`ID`, `Name`, `SessionalTypeID`) VALUES
('{3DC4DDE5-514F-4BE4-8682-37EA32C3FDB7}', 'Theory', '{126156BB-18ED-4CAB-8DB9-1C0F72BB63C1}'),
('{5F886686-4EB1-48C8-A801-8D46233739D1}', 'Thesis', '{126156BB-18ED-4CAB-8DB9-1C0F72BB63C1}'),
('{EF5CA3BF-A886-4450-ABC4-DED45C7600C0}', 'Sessional', '{126156BB-18ED-4CAB-8DB9-1C0F72BB63C1}');

-- --------------------------------------------------------

--
-- Table structure for table `reg_registration_session`
--

DROP TABLE IF EXISTS `reg_registration_session`;
CREATE TABLE IF NOT EXISTS `reg_registration_session` (
  `ID` varchar(40) NOT NULL,
  `Name` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg_registration_session`
--

INSERT INTO `reg_registration_session` (`ID`, `Name`) VALUES
('{05DA37EB-6C62-45E9-A0E3-7C5C6943F6AD}', '2012-2013'),
('{1399EEA3-B939-4155-B9F3-4DAD4928C4D5}', '2014-2015'),
('{65C2BA57-7231-497A-A5A7-90912259684C}', '2011-2012'),
('{A36A7057-CDB5-4E10-9E61-CCC85C74460E}', '2013-2014'),
('{DFF9E45F-6954-46A1-9088-D930EE460C3F}', '2015-2016'),
('{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '2016-2017');

-- --------------------------------------------------------

--
-- Table structure for table `reg_term`
--

DROP TABLE IF EXISTS `reg_term`;
CREATE TABLE IF NOT EXISTS `reg_term` (
  `ID` varchar(40) NOT NULL,
  `Name` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg_term`
--

INSERT INTO `reg_term` (`ID`, `Name`) VALUES
('{6DE3CF58-3A1A-4D6A-88CF-83F22C27E0BA}', 'Special'),
('{AF8B217E-4E76-41B8-A02A-7115BD4A6BE6}', '2nd'),
('{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', '1st');

-- --------------------------------------------------------

--
-- Table structure for table `reg_year`
--

DROP TABLE IF EXISTS `reg_year`;
CREATE TABLE IF NOT EXISTS `reg_year` (
  `ID` varchar(40) NOT NULL,
  `Name` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reg_year`
--

INSERT INTO `reg_year` (`ID`, `Name`) VALUES
('{1FAC0F1A-9D60-43F6-AB07-C933D5A4AA30}', 'Phd 1st'),
('{326B168F-58CC-42F3-B71A-DFE8DBBC05E8}', 'MSc 1st'),
('{6780C884-E112-4F58-9503-E2110B615547}', '4th'),
('{9F3A6CBC-0115-4EC2-ABB3-8CCA431F6C2B}', '1st'),
('{A21965E4-4FE4-43AC-A77F-DABAC9B356F2}', '3rd'),
('{ADBEDD3E-D8EA-47AA-A068-C4C703DB4AE6}', 'MSc 2nd'),
('{B9D6CC05-7AD4-4666-80AB-80797A872743}', 'Phd 2nd'),
('{CBE08035-94CD-4610-B4E2-A0E844184056}', 'Phd 4th'),
('{E3823AA6-6BE5-4A07-93EA-FA59DE4F616F}', 'Phd 3rd'),
('{EA335D18-A1A8-4D15-9C7B-4A4700AD4543}', '2nd');

-- --------------------------------------------------------

--
-- Table structure for table `rms_course_marks_result`
--

DROP TABLE IF EXISTS `rms_course_marks_result`;
CREATE TABLE IF NOT EXISTS `rms_course_marks_result` (
  `ID` varchar(40) NOT NULL,
  `CourseNo` varchar(40) NOT NULL,
  `TeacherID` varchar(40) DEFAULT NULL,
  `SessionID` varchar(40) NOT NULL,
  `YearID` varchar(40) NOT NULL,
  `TermID` varchar(40) NOT NULL,
  `StudentID` varchar(40) NOT NULL,
  `MarksID` varchar(40) NOT NULL,
  `MarksValue` varchar(200) NOT NULL,
  `Status` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rms_course_marks_result`
--

INSERT INTO `rms_course_marks_result` (`ID`, `CourseNo`, `TeacherID`, `SessionID`, `YearID`, `TermID`, `StudentID`, `MarksID`, `MarksValue`, `Status`) VALUES
('{44C3C858-AFC6-4592-B160-10B921BF381C}', 'cse-4111', 'mkazi078@uottawa.ca', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{6780C884-E112-4F58-9503-E2110B615547}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', '020202', '{7E24DC07-CD2C-4360-A6E9-05A363C2EA08}', '10,25,25,25', '');

-- --------------------------------------------------------

--
-- Table structure for table `rms_course_marks_result_publish`
--

DROP TABLE IF EXISTS `rms_course_marks_result_publish`;
CREATE TABLE IF NOT EXISTS `rms_course_marks_result_publish` (
  `ID` varchar(40) NOT NULL,
  `CourseNo` varchar(40) NOT NULL,
  `TeacherID` varchar(40) DEFAULT NULL,
  `SessionID` varchar(40) NOT NULL,
  `YearID` varchar(40) NOT NULL,
  `TermID` varchar(40) NOT NULL,
  `StudentID` varchar(40) NOT NULL,
  `HeaderID` varchar(200) NOT NULL,
  `HeaderName` varchar(200) NOT NULL,
  `HeaderMax` varchar(200) NOT NULL,
  `MarksValue` varchar(200) NOT NULL,
  `MarksTotal` varchar(20) NOT NULL,
  `Grades` varchar(200) NOT NULL,
  `GradeRanges` varchar(300) NOT NULL,
  `FinalGrade` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rms_course_marks_tests`
--

DROP TABLE IF EXISTS `rms_course_marks_tests`;
CREATE TABLE IF NOT EXISTS `rms_course_marks_tests` (
  `ID` varchar(40) NOT NULL,
  `CourseNo` varchar(40) NOT NULL,
  `TeacherID` varchar(40) NOT NULL,
  `SessionID` varchar(40) NOT NULL,
  `YearID` varchar(40) NOT NULL,
  `TermID` varchar(40) NOT NULL,
  `StudentID` varchar(40) NOT NULL,
  `MarksValue` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rms_course_marks_tests`
--

INSERT INTO `rms_course_marks_tests` (`ID`, `CourseNo`, `TeacherID`, `SessionID`, `YearID`, `TermID`, `StudentID`, `MarksValue`) VALUES
('{037E6C4F-CAAE-4587-B3E1-1CC6E59101A4}', 'cse-4111', 'mkazi078@uottawa.ca', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{6780C884-E112-4F58-9503-E2110B615547}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', '020203', '12,20,20'),
('{222F2596-5F55-442C-80EA-F5AE7F466C70}', 'cse-4111', 'mkazi078@uottawa.ca', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{6780C884-E112-4F58-9503-E2110B615547}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', '020202', '15,25,20'),
('{71D63076-9096-4CAA-8D6D-782A25B076A7}', 'cse-4111', 'mkazi078@uottawa.ca', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{6780C884-E112-4F58-9503-E2110B615547}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', '020208', '15,20,20'),
('{B6BB339D-E40B-4CC4-8D34-07017EE2BE44}', 'cse-4112', 'mkazi078@uottawa.ca', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{6780C884-E112-4F58-9503-E2110B615547}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', '020208', '10,30,30,0,0'),
('{DBF1823F-0DF9-4E8F-9233-5AB1545BC1B7}', 'cse-4112', 'mkazi078@uottawa.ca', '{E11A301F-E0B9-47A5-AA3C-FB0B656B2A2A}', '{6780C884-E112-4F58-9503-E2110B615547}', '{F9121C67-1E89-4F0B-80AA-89FD3B6BD665}', '020202', '20,20,20,0,0');

-- --------------------------------------------------------

--
-- Table structure for table `rms_grade_setup`
--

DROP TABLE IF EXISTS `rms_grade_setup`;
CREATE TABLE IF NOT EXISTS `rms_grade_setup` (
  `ID` varchar(40) NOT NULL,
  `Grades` varchar(200) NOT NULL,
  `Ranges` varchar(300) NOT NULL,
  `IsDefault` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rms_grade_setup`
--

INSERT INTO `rms_grade_setup` (`ID`, `Grades`, `Ranges`, `IsDefault`) VALUES
('{FC3DBA75-AF9C-4533-825E-D8A01D076F60}', 'F,E,D,C,C+,B,B+,A-,A,A+', '0-39,40-44,45-49,50-54,55-59,60-64,65-69,70-74,75-79,80-100', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rms_marks_setup`
--

DROP TABLE IF EXISTS `rms_marks_setup`;
CREATE TABLE IF NOT EXISTS `rms_marks_setup` (
  `ID` varchar(40) NOT NULL,
  `CourseTypeID` varchar(40) NOT NULL,
  `HeaderID` varchar(200) NOT NULL,
  `HeaderName` varchar(200) NOT NULL,
  `HeaderMax` varchar(200) NOT NULL,
  `IsDefault` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rms_marks_setup`
--

INSERT INTO `rms_marks_setup` (`ID`, `CourseTypeID`, `HeaderID`, `HeaderName`, `HeaderMax`, `IsDefault`) VALUES
('{236BBFE8-E4CF-4EEF-9C54-AD83FEF42ADB}', '{EF5CA3BF-A886-4450-ABC4-DED45C7600C0}', 'att,assess,viva', 'Attendance,Assessment,Viva', '10,60,30', 1),
('{7E24DC07-CD2C-4360-A6E9-05A363C2EA08}', '{3DC4DDE5-514F-4BE4-8682-37EA32C3FDB7}', 'att,assess,seca,secb', 'Attendance,Assessment,Section A,Section B', '10,30,30,30,30', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sms_scholarship`
--

DROP TABLE IF EXISTS `sms_scholarship`;
CREATE TABLE IF NOT EXISTS `sms_scholarship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(70) DEFAULT NULL,
  `subTitle` varchar(1000) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `publishDate` date DEFAULT NULL,
  `organization` varchar(50) DEFAULT NULL,
  `gender` varchar(20) NOT NULL,
  `ageLimit` varchar(5) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `amount` varchar(10) DEFAULT NULL,
  `lastDate` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `isDeleted` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_scholarship`
--

INSERT INTO `sms_scholarship` (`id`, `title`, `subTitle`, `category`, `publishDate`, `organization`, `gender`, `ageLimit`, `email`, `contact`, `amount`, `lastDate`, `status`, `isDeleted`) VALUES
(11, 'Board Scholarship', 'We are offering a scholarship for the poor and meritorious students . So if you are interested then please apply before the last date.', 'merit', '2018-10-22', 'Khulna Board', 'Anyone', '22', 'khulna@gmail.com', '0166623633', '10000', '2018-10-31', NULL, NULL),
(6, 'Joynul Abedin Sriti', 'It plays a vital role in the student of the fine arts to give them scholarship.', 'merit', '2018-09-25', 'Joynul Abedin Trust Fo.', 'Anyone', '25', 'joynul123@gmail.com', '01800000008', '50000', '2018-10-25', NULL, NULL),
(7, 'Sheikh Kamal Sriti Scholarship', 'Sheikh kamal organization provide some financial help for poor students.', 'merit', '2018-09-25', 'sheikh kamal foundation', 'Male', '22', 'kamal12@gmail.com', '01721345678', '100000', '2018-09-30', NULL, NULL),
(9, 'Mahin Scholarship', 'i am a donor of Bangladesh. please contact me with your cv and apply.', 'merit', '2018-09-21', 'Mahin And Brothers', 'Anyone', '30', 'mahin@gmail.com', '0198887777', '50000', '2018-10-10', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sms_scholarship_applyscholarship`
--

DROP TABLE IF EXISTS `sms_scholarship_applyscholarship`;
CREATE TABLE IF NOT EXISTS `sms_scholarship_applyscholarship` (
  `studentId` int(11) NOT NULL,
  `scholarshipId` int(11) NOT NULL,
  `status` varchar(45) NOT NULL DEFAULT 'pending',
  `priority` varchar(45) NOT NULL DEFAULT '0',
  PRIMARY KEY (`studentId`,`scholarshipId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_scholarship_applyscholarship`
--

INSERT INTO `sms_scholarship_applyscholarship` (`studentId`, `scholarshipId`, `status`, `priority`) VALUES
(160216, 6, 'pending', '0');

-- --------------------------------------------------------

--
-- Table structure for table `sms_scholarship_catagory`
--

DROP TABLE IF EXISTS `sms_scholarship_catagory`;
CREATE TABLE IF NOT EXISTS `sms_scholarship_catagory` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `catagoryName` varchar(45) NOT NULL,
  `shortName` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_scholarship_catagory`
--

INSERT INTO `sms_scholarship_catagory` (`id`, `catagoryName`, `shortName`) VALUES
(1, 'Merit-based Scholarship', 'merit'),
(2, 'Grant in Aid', 'aid'),
(7, 'Cultural Scholarship', 'culture'),
(9, 'Board Scholarship', 'board');

-- --------------------------------------------------------

--
-- Table structure for table `sms_scholarship_cocurricular`
--

DROP TABLE IF EXISTS `sms_scholarship_cocurricular`;
CREATE TABLE IF NOT EXISTS `sms_scholarship_cocurricular` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coName` varchar(100) DEFAULT NULL,
  `shortName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_scholarship_cocurricular`
--

INSERT INTO `sms_scholarship_cocurricular` (`id`, `coName`, `shortName`) VALUES
(1, 'Sports', 'SP'),
(3, 'Debate', 'DB'),
(4, 'Dance', 'DA'),
(5, 'Music', 'MU'),
(6, 'In Door Games', 'GA'),
(7, 'Acting', 'AC');

-- --------------------------------------------------------

--
-- Table structure for table `sms_scholarship_quota`
--

DROP TABLE IF EXISTS `sms_scholarship_quota`;
CREATE TABLE IF NOT EXISTS `sms_scholarship_quota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quotaName` varchar(45) DEFAULT NULL,
  `shortName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_scholarship_quota`
--

INSERT INTO `sms_scholarship_quota` (`id`, `quotaName`, `shortName`) VALUES
(1, 'Bangladesh Krira Shikkha Protishtan Quota', 'BKSPQ'),
(2, 'Freedom Fighter Quota', 'FFQ'),
(3, 'District Quota', 'DQ'),
(4, 'Autism Quota', 'AQ'),
(5, 'Tribal Quota', 'TQ'),
(8, 'Others Quota', 'OQ');

-- --------------------------------------------------------

--
-- Table structure for table `sms_scholarship_student`
--

DROP TABLE IF EXISTS `sms_scholarship_student`;
CREATE TABLE IF NOT EXISTS `sms_scholarship_student` (
  `universityId` int(11) NOT NULL,
  `age` varchar(5) NOT NULL,
  `fProf` varchar(45) DEFAULT NULL,
  `mProf` varchar(45) DEFAULT NULL,
  `income` varchar(45) DEFAULT NULL,
  `sibling` varchar(45) DEFAULT NULL,
  `reason` varchar(2000) DEFAULT NULL,
  `cocurricular` varchar(45) DEFAULT NULL,
  `quota` varchar(45) DEFAULT NULL,
  `term` varchar(5) NOT NULL,
  `cgpa` varchar(45) DEFAULT NULL,
  `picSource` varchar(350) DEFAULT NULL,
  `document` varchar(350) DEFAULT NULL,
  PRIMARY KEY (`universityId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_scholarship_student`
--

INSERT INTO `sms_scholarship_student` (`universityId`, `age`, `fProf`, `mProf`, `income`, `sibling`, `reason`, `cocurricular`, `quota`, `term`, `cgpa`, `picSource`, `document`) VALUES
(160216, '23', 'Businessmen', 'Housewife', '22222', '2', 'need for money', 'DB', '', '4-1', '2.6', 'account.jpg', 'Result.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart`
--

DROP TABLE IF EXISTS `tbl_cart`;
CREATE TABLE IF NOT EXISTS `tbl_cart` (
  `ID` varchar(40) NOT NULL,
  `ProductID` varchar(40) NOT NULL,
  `UserID` varchar(40) NOT NULL,
  `Datetime` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_products`
--

DROP TABLE IF EXISTS `tbl_products`;
CREATE TABLE IF NOT EXISTS `tbl_products` (
  `ID` varchar(40) NOT NULL,
  `Name` varchar(40) NOT NULL,
  `CategoryID` varchar(40) NOT NULL,
  `Price` double NOT NULL,
  `OfferedCredit` double NOT NULL,
  `PictureAddress` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_products`
--

INSERT INTO `tbl_products` (`ID`, `Name`, `CategoryID`, `Price`, `OfferedCredit`, `PictureAddress`) VALUES
('{1A53D0E6-A580-4EA9-A2F9-B35CF92DDD01}', 'Forest Growth Simulation', '{3D212234-2F34-4AB0-83EF-1A772068403B}', 600, 65, '9781604697285r.jpg'),
('{34A3C9A7-4B6C-4398-8845-76399D6878E0}', 'Compiler', '{3D212234-2F34-4AB0-83EF-1A772068403B}', 300, 60, 'compilers.jpg'),
('{4308E3A8-E74F-49DC-A2BA-D26CEF37C37C}', 'Computer Graphics', '{3D212234-2F34-4AB0-83EF-1A772068403B}', 400, 30, 'graphics.jpeg'),
('{8C35D14E-BA72-4FEC-8703-1C7BF08760A1}', 'Java', '{3D212234-2F34-4AB0-83EF-1A772068403B}', 400, 40, 'bangla_c.jpg'),
('{9A912360-8C34-46EB-BFC2-698F237CC5D3}', 'Computer Networks', '{3D212234-2F34-4AB0-83EF-1A772068403B}', 200, 20, 'networking.png'),
('{C7DA13A3-5A5C-4361-BCA5-12EA1C632E0A}', 'Web Learning', '{44CAEE8D-A9D7-48C8-A2EA-A7463E00FCD6}', 400, 40, '9781785280351.png'),
('{CBF2600B-4FD3-41C8-A243-BFEE6C0DB1C3}', 'Bangla C', '{3D212234-2F34-4AB0-83EF-1A772068403B}', 400, 40, 'bangla_c.jpg'),
('{CC9C78DE-7022-4053-8951-B92BDF35D33D}', 'Deep Learning', '{44CAEE8D-A9D7-48C8-A2EA-A7463E00FCD6}', 550, 55, 'deep_learning.jpg'),
('{F14C8CA7-7F3F-45A0-95E5-2359805F2B96}', 'Computer Fundamentals', '{3D212234-2F34-4AB0-83EF-1A772068403B}', 260, 26, 'computer_fundamentals.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_category`
--

DROP TABLE IF EXISTS `tbl_product_category`;
CREATE TABLE IF NOT EXISTS `tbl_product_category` (
  `ID` varchar(40) NOT NULL,
  `Category` varchar(40) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_product_category`
--

INSERT INTO `tbl_product_category` (`ID`, `Category`) VALUES
('{3D212234-2F34-4AB0-83EF-1A772068403B}', 'Book'),
('{44CAEE8D-A9D7-48C8-A2EA-A7463E00FCD6}', 'Thesis Book');

-- --------------------------------------------------------

--
-- Table structure for table `tms_assign`
--

DROP TABLE IF EXISTS `tms_assign`;
CREATE TABLE IF NOT EXISTS `tms_assign` (
  `id` varchar(40) NOT NULL,
  `assign_to` varchar(40) NOT NULL,
  `assign_by` varchar(40) NOT NULL,
  `assing_date` date NOT NULL,
  `comment` varchar(1000) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_assign`
--

INSERT INTO `tms_assign` (`id`, `assign_to`, `assign_by`, `assing_date`, `comment`, `status`) VALUES
('1548585017', 'ryhan@gmail.com', 'ryhan@gmail.com', '2019-01-28', '   test         		\r\n              	', 1),
('1548585122', 'ryhan@gmail.com', 'ryhan@gmail.com', '2019-01-28', '   test2          		\r\n              	', 1),
('1549258841', 'ryhan@gmail.com', 'ryhan@gmail.com', '2019-02-04', '              		\r\n      jj      	', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tms_link_thesis`
--

DROP TABLE IF EXISTS `tms_link_thesis`;
CREATE TABLE IF NOT EXISTS `tms_link_thesis` (
  `id` varchar(40) NOT NULL,
  `link` text NOT NULL,
  `thesis_id` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `thesis_id` (`thesis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_link_thesis`
--

INSERT INTO `tms_link_thesis` (`id`, `link`, `thesis_id`) VALUES
('{992CDFDF-98CE-45C4-B5B6-4EFD77EB530A}', 'https://stackoverflow.com/questions/34500423/remove-top-padding-on-bootstrap-navbar', '{A905A916-1B2C-4F31-BBC2-094E4B199569}'),
('{C811FFEC-3F7F-4C8A-AE5D-4030E85AA25F}', 'https://stackoverflow.com/questions/34500423/remove-top-padding-on-bootstrap-navbar', '{77590E83-76A0-4725-A4C0-48B4DFC34D4D}'),
('{E0103054-7585-4A1E-896C-F035AB4FBCB0}', 'https://stackoverflow.com/questions/26727581/how-to-remove-default-padding-from-bootstrap-nav-bar', '{77590E83-76A0-4725-A4C0-48B4DFC34D4D}');

-- --------------------------------------------------------

--
-- Table structure for table `tms_task`
--

DROP TABLE IF EXISTS `tms_task`;
CREATE TABLE IF NOT EXISTS `tms_task` (
  `id` varchar(40) NOT NULL,
  `task_name` varchar(20) NOT NULL,
  `task_creator` varchar(40) NOT NULL,
  `task_category` varchar(20) NOT NULL,
  `date_of_assign` date NOT NULL,
  `date_of_submission` date NOT NULL,
  `last_date_of_update` date NOT NULL,
  `progress` int(11) NOT NULL DEFAULT '0',
  `details` varchar(1000) NOT NULL,
  `attachment` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_task`
--

INSERT INTO `tms_task` (`id`, `task_name`, `task_creator`, `task_category`, `date_of_assign`, `date_of_submission`, `last_date_of_update`, `progress`, `details`, `attachment`) VALUES
('1548585122', 'test', 'ryhan@gmail.com', 'Programming Contest', '2019-01-27', '2019-02-27', '2019-01-27', 0, 'TEST', '1548585122.jpg'),
('1549258841', 'test2', 'ryhan@gmail.com', 'Study', '2019-02-04', '2019-02-12', '2019-02-04', 0, 'kk', '1549258841.cpp');

-- --------------------------------------------------------

--
-- Table structure for table `tms_task_category`
--

DROP TABLE IF EXISTS `tms_task_category`;
CREATE TABLE IF NOT EXISTS `tms_task_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_task_category`
--

INSERT INTO `tms_task_category` (`id`, `task_type`) VALUES
(1, 'Study'),
(2, 'Office'),
(3, 'Appointment'),
(4, 'Programming Contest'),
(5, 'test'),
(6, 'test2');

-- --------------------------------------------------------

--
-- Table structure for table `tms_thesis`
--

DROP TABLE IF EXISTS `tms_thesis`;
CREATE TABLE IF NOT EXISTS `tms_thesis` (
  `id` varchar(40) NOT NULL,
  `thumbnail` text NOT NULL,
  `title` varchar(256) NOT NULL,
  `pdf_link` text,
  `description` text NOT NULL,
  `year_id` varchar(40) NOT NULL,
  `term_id` varchar(40) NOT NULL,
  `course_id` varchar(40) NOT NULL,
  `discipline_id` varchar(40) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `year_id` (`year_id`),
  KEY `term_id` (`term_id`),
  KEY `course_id` (`course_id`),
  KEY `discipline_id` (`discipline_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tms_thesis`
--

INSERT INTO `tms_thesis` (`id`, `thumbnail`, `title`, `pdf_link`, `description`, `year_id`, `term_id`, `course_id`, `discipline_id`, `created_at`, `updated_at`) VALUES
('{326303FD-7149-4F45-95CB-858B96C81508}', './resources/img/thumbnails/Study of bank customers and employee in 4 local bank of malaysia.ico', 'Study of bank customers and employee in 4 local bank of malaysia', './resources/pdf/report/Study of bank customers and employee in 4 local bank of malaysia.pdf', 'Study of bank customers and employee in 4 local bank of malaysia Study of bank customers and employee in 4 local bank of malaysia Study of bank customers and employee in 4 local bank of malaysia Study of bank customers and employee in 4 local bank of malaysia Study of bank customers and employee in 4 local bank of malaysia Study of bank customers and employee in 4 local bank of malaysia Study of bank customers and employee in 4 local bank of malaysia Study of bank customers and employee in 4 local bank of malaysia Study of bank customers and employee in 4 local bank of malaysia Study of bank customers and employee in 4 local bank of malaysia Study of bank customers and employee in 4 local bank of malaysia Study of bank customers and employee in 4 local bank of malaysia Study of bank customers and employee in 4 local bank of malaysia Study of bank customers and employee in 4 local bank of malaysia Study of bank customers and employee in 4 local bank of malaysia Study of bank customers and employee in 4 local bank of malaysia Study of bank customers and employee in 4 local bank of malaysia Study of bank customers and employee in 4 local bank of malaysia', '4', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', '2017-09-24 22:11:29', '2017-10-12 00:57:38'),
('{647F6FA4-CB2E-42BA-951C-B8A2F3F4D7FD}', './resources/img/thumbnails/Analytical study of premium CREDIT card.ico', 'Analytical study of premium CREDIT card', './resources/pdf/report/Analytical study of premium CREDIT card.pdf', 'Analytical study of premium CREDIT card Analytical study of premium CREDIT card Analytical study of premium CREDIT card Analytical study of premium CREDIT card Analytical study of premium CREDIT card Analytical study of premium CREDIT card Analytical study of premium CREDIT card Analytical study of premium CREDIT card Analytical study of premium CREDIT card Analytical study of premium CREDIT card Analytical study of premium CREDIT card', '4', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', '2017-09-24 22:17:41', '2017-10-04 22:34:52'),
('{6FBA3E23-0106-443A-A703-C29AC3F7FDDE}', './resources/img/thumbnails/Analysis on equity share price behaviour.png', 'Analysis on equity share price behaviour', './resources/pdf/report/Analysis on equity share price behaviour.pdf', 'Analysis on equity share price behaviour Analysis on equity share price behaviour Analysis on equity share price behaviour Analysis on equity share price behaviour Analysis on equity share price behaviour Analysis on equity share price behaviour Analysis on equity share price behaviour Analysis on equity share price behaviour Analysis on equity share price behaviour Analysis on equity share price behaviour', '4', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', '2017-09-24 22:15:53', '2017-10-04 22:32:32'),
('{77590E83-76A0-4725-A4C0-48B4DFC34D4D}', './resources/img/thumbnails/Evolution of mgt technique.png', 'Evolution of mgt technique', './resources/pdf/report/Evolution of mgt technique.pdf', 'Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique Evolution of mgt technique', '4', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', '2017-09-24 22:30:28', '2017-10-04 22:34:15'),
('{7CA833C5-AD32-432E-BA00-4D8562CE37E8}', './resources/img/thumbnails/hall management.png', 'hall management', './resources/pdf/report/hall management.pdf', 'huadhfud', '3', '{19B15CDF-264C-4924-8608-258673BCC448}', '6', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', '2017-11-03 23:20:36', '2017-11-03 23:20:36'),
('{7CB1DE81-EF72-4BDA-98C5-D281D2FAAA23}', './resources/img/thumbnails/Exchange traded fund.png', 'Exchange traded fund', './resources/pdf/report/Exchange traded fund.pdf', 'Exchange traded fund Exchange traded fund Exchange traded fund Exchange traded fund Exchange traded fund Exchange traded fund Exchange traded fund Exchange traded fund Exchange traded fund Exchange traded fund Exchange traded fund', '4', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', '2017-09-24 22:32:57', '2017-10-04 22:32:47'),
('{A54D497B-C365-43F7-855D-233AC4FE4B9C}', './resources/img/thumbnails/Study on effectiveness of training programme.png', 'Study on effectiveness of training programme', './resources/pdf/report/Study on effectiveness of training programme.pdf', 'Study on effectiveness of training programme Study on effectiveness of training programme Study on effectiveness of training programme Study on effectiveness of training programme Study on effectiveness of training programme Study on effectiveness of training programme Study on effectiveness of training programme Study on effectiveness of training programme Study on effectiveness of training programme Study on effectiveness of training programme Study on effectiveness of training programme Study on effectiveness of training programme Study on effectiveness of training programme Study on effectiveness of training programme', '4', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', '2017-09-24 22:15:03', '2017-10-12 23:33:50'),
('{A905A916-1B2C-4F31-BBC2-094E4B199569}', './resources/img/thumbnails/Study on customer perception towards UTI mutual fund.png', 'Study on customer perception towards UTI mutual fund', '', 'Study on customer perception towards UTI mutual fund Study on customer perception towards UTI mutual fund Study on customer perception towards UTI mutual fund Study on customer perception towards UTI mutual fund Study on customer perception towards UTI mutual fund Study on customer perception towards UTI mutual fund Study on customer perception towards UTI mutual fund Study on customer perception towards UTI mutual fund Study on customer perception towards UTI mutual fund Study on customer perception towards UTI mutual fund Study on customer perception towards UTI mutual fund', '4', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', '2017-09-24 22:14:00', '2017-10-12 23:33:58'),
('{D02FDF5E-0705-4563-BC62-13E13997D0AE}', './resources/img/thumbnails/Analysis of the trade finance pattern.ico', 'Analysis of the trade finance pattern', './resources/pdf/report/Analysis of the trade finance pattern.pdf', 'Analysis of the trade finance pattern Analysis of the trade finance pattern Analysis of the trade finance pattern Analysis of the trade finance pattern Analysis of the trade finance pattern Analysis of the trade finance pattern Analysis of the trade finance pattern Analysis of the trade finance pattern Analysis of the trade finance pattern Analysis of the trade finance pattern Analysis of the trade finance pattern Analysis of the trade finance pattern Analysis of the trade finance pattern', '4', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', '2017-09-24 22:16:48', '2017-10-04 22:34:30'),
('{DA4F1E3B-CCBA-4801-8CB9-47E5467D5035}', './resources/img/thumbnails/Health & welfare measures in WOVEN TEXTILE COMPANY.png', 'Health & welfare measures in WOVEN TEXTILE COMPANY', './resources/pdf/report/Health & welfare measures in WOVEN TEXTILE COMPANY.pdf', 'Health & welfare measures in WOVEN TEXTILE COMPANY Health & welfare measures in WOVEN TEXTILE COMPANY Health & welfare measures in WOVEN TEXTILE COMPANY Health & welfare measures in WOVEN TEXTILE COMPANY Health & welfare measures in WOVEN TEXTILE COMPANY Health & welfare measures in WOVEN TEXTILE COMPANY Health & welfare measures in WOVEN TEXTILE COMPANY Health & welfare measures in WOVEN TEXTILE COMPANY Health & welfare measures in WOVEN TEXTILE COMPANY', '4', '{22EDE2D2-D36C-4160-9D2A-80184B8AD35B}', '5', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', '2017-09-24 22:31:57', '2017-10-12 23:34:08');

-- --------------------------------------------------------

--
-- Table structure for table `ums_discipline`
--

DROP TABLE IF EXISTS `ums_discipline`;
CREATE TABLE IF NOT EXISTS `ums_discipline` (
  `ID` varchar(40) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `ShortCode` varchar(20) DEFAULT NULL,
  `SchoolID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ums_discipline`
--

INSERT INTO `ums_discipline` (`ID`, `Name`, `ShortCode`, `SchoolID`) VALUES
('{0CF37516-06FE-41CD-93AD-D2D1652509D6}', 'Mathematics', 'MATH', '{39DDC0C2-CFC2-4246-8748-8812B1751A5C}'),
('{560A0FC0-6221-497D-8D41-E584EE4BBEE3}', 'Architecture', 'ARCH', '{39DDC0C2-CFC2-4246-8748-8812B1751A5C}'),
('{63F3C00B-6168-4FBD-AB01-7A1FE413BDDE}', 'Forestry and Wood Technology', 'FWT', '{4D46079B-AFA3-40F1-B8D1-6CC9E9F56812}'),
('{AF41CC9F-3BCD-4952-9D02-17184CC40C79}', 'Urban and Rural Planning', 'URP', '{4D46079B-AFA3-40F1-B8D1-6CC9E9F56812}'),
('{E065BBA7-D0C5-4DFA-9768-81B6F056EB4A}', 'Foresty and Marine Resource Technology', 'FMRT', '{4D46079B-AFA3-40F1-B8D1-6CC9E9F56812}'),
('{E7280448-E379-424E-A11D-357F4334AC8D}', 'Physics', 'PHY', '{39DDC0C2-CFC2-4246-8748-8812B1751A5C}'),
('{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'Computer Science and Engineering', 'CSE', '{39DDC0C2-CFC2-4246-8748-8812B1751A5C}');

-- --------------------------------------------------------

--
-- Table structure for table `ums_permission`
--

DROP TABLE IF EXISTS `ums_permission`;
CREATE TABLE IF NOT EXISTS `ums_permission` (
  `TableID` int(11) NOT NULL AUTO_INCREMENT,
  `ID` varchar(100) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Category` varchar(100) NOT NULL,
  PRIMARY KEY (`TableID`)
) ENGINE=InnoDB AUTO_INCREMENT=14141 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ums_permission`
--

INSERT INTO `ums_permission` (`TableID`, `ID`, `Name`, `Category`) VALUES
(13981, 'COURSE_C', 'COURSE_C', 'COURSE'),
(13982, 'COURSE_R', 'COURSE_R', 'COURSE'),
(13983, 'COURSE_U', 'COURSE_U', 'COURSE'),
(13984, 'COURSE_D', 'COURSE_D', 'COURSE'),
(13985, 'COURSE_TYPE_C', 'COURSE_TYPE_C', 'COURSE TYPE'),
(13986, 'COURSE_TYPE_R', 'COURSE_TYPE_R', 'COURSE TYPE'),
(13987, 'COURSE_TYPE_U', 'COURSE_TYPE_U', 'COURSE TYPE'),
(13988, 'COURSE_TYPE_D', 'COURSE_TYPE_D', 'COURSE TYPE'),
(13989, 'COURSE_SESSIONAL_TYPE_C', 'COURSE_SESSIONAL_TYPE_C', 'COURSE SESSIONAL TYPE'),
(13990, 'COURSE_SESSIONAL_TYPE_R', 'COURSE_SESSIONAL_TYPE_R', 'COURSE SESSIONAL TYPE'),
(13991, 'COURSE_SESSIONAL_TYPE_U', 'COURSE_SESSIONAL_TYPE_U', 'COURSE SESSIONAL TYPE'),
(13992, 'COURSE_SESSIONAL_TYPE_D', 'COURSE_SESSIONAL_TYPE_D', 'COURSE SESSIONAL TYPE'),
(13993, 'DISCIPLINE_C', 'DISCIPLINE_C', 'DISCIPLINE'),
(13994, 'DISCIPLINE_R', 'DISCIPLINE_R', 'DISCIPLINE'),
(13995, 'DISCIPLINE_U', 'DISCIPLINE_U', 'DISCIPLINE'),
(13996, 'DISCIPLINE_D', 'DISCIPLINE_D', 'DISCIPLINE'),
(13997, 'FILE_C', 'FILE_C', 'FILE'),
(13998, 'FILE_R', 'FILE_R', 'FILE'),
(13999, 'FILE_U', 'FILE_U', 'FILE'),
(14000, 'FILE_D', 'FILE_D', 'FILE'),
(14001, 'PERMISSION_C', 'PERMISSION_C', 'PERMISSION'),
(14002, 'PERMISSION_R', 'PERMISSION_R', 'PERMISSION'),
(14003, 'PERMISSION_U', 'PERMISSION_U', 'PERMISSION'),
(14004, 'PERMISSION_D', 'PERMISSION_D', 'PERMISSION'),
(14005, 'REGISTRATION_C', 'REGISTRATION_C', 'REGISTRATION'),
(14006, 'REGISTRATION_R', 'REGISTRATION_R', 'REGISTRATION'),
(14007, 'REGISTRATION_U', 'REGISTRATION_U', 'REGISTRATION'),
(14008, 'REGISTRATION_D', 'REGISTRATION_D', 'REGISTRATION'),
(14009, 'RESULT_C', 'RESULT_C', 'RESULT'),
(14010, 'RESULT_R', 'RESULT_R', 'RESULT'),
(14011, 'RESULT_U', 'RESULT_U', 'RESULT'),
(14012, 'RESULT_D', 'RESULT_D', 'RESULT'),
(14013, 'ATTENDANCE_C', 'ATTENDANCE_C', 'ATTENDANCE'),
(14014, 'ATTENDANCE_R', 'ATTENDANCE_R', 'ATTENDANCE'),
(14015, 'ATTENDANCE_U', 'ATTENDANCE_U', 'ATTENDANCE'),
(14016, 'ATTENDANCE_D', 'ATTENDANCE_D', 'ATTENDANCE'),
(14017, 'MARKS_SETUP_C', 'MARKS_SETUP_C', 'MARKS_SETUP'),
(14018, 'MARKS_SETUP_R', 'MARKS_SETUP_R', 'MARKS_SETUP'),
(14019, 'MARKS_SETUP_U', 'MARKS_SETUP_U', 'MARKS_SETUP'),
(14020, 'MARKS_SETUP_D', 'MARKS_SETUP_D', 'MARKS_SETUP'),
(14021, 'GRADE_SETUP_C', 'GRADE_SETUP_C', 'GRADE_SETUP'),
(14022, 'GRADE_SETUP_R', 'GRADE_SETUP_R', 'GRADE_SETUP'),
(14023, 'GRADE_SETUP_U', 'GRADE_SETUP_U', 'GRADE_SETUP'),
(14024, 'GRADE_SETUP_D', 'GRADE_SETUP_D', 'GRADE_SETUP'),
(14025, 'ROLE_C', 'ROLE_C', 'ROLE'),
(14026, 'ROLE_R', 'ROLE_R', 'ROLE'),
(14027, 'ROLE_U', 'ROLE_U', 'ROLE'),
(14028, 'ROLE_D', 'ROLE_D', 'ROLE'),
(14029, 'POSITION_C', 'POSITION_C', 'POSITION'),
(14030, 'POSITION_R', 'POSITION_R', 'POSITION'),
(14031, 'POSITION_U', 'POSITION_U', 'POSITION'),
(14032, 'POSITION_D', 'POSITION_D', 'POSITION'),
(14033, 'PROJECT_C', 'PROJECT_C', 'PROJECT'),
(14034, 'PROJECT_R', 'PROJECT_R', 'PROJECT'),
(14035, 'PROJECT_U', 'PROJECT_U', 'PROJECT'),
(14036, 'PROJECT_D', 'PROJECT_D', 'PROJECT'),
(14037, 'QUESTION_C', 'QUESTION_C', 'QUESTION'),
(14038, 'QUESTION_R', 'QUESTION_R', 'QUESTION'),
(14039, 'QUESTION_U', 'QUESTION_U', 'QUESTION'),
(14040, 'QUESTION_D', 'QUESTION_D', 'QUESTION'),
(14041, 'SCHOOL_C', 'SCHOOL_C', 'SCHOOL'),
(14042, 'SCHOOL_R', 'SCHOOL_R', 'SCHOOL'),
(14043, 'SCHOOL_U', 'SCHOOL_U', 'SCHOOL'),
(14044, 'SCHOOL_D', 'SCHOOL_D', 'SCHOOL'),
(14045, 'SESSION_C', 'SESSION_C', 'SESSION'),
(14046, 'SESSION_R', 'SESSION_R', 'SESSION'),
(14047, 'SESSION_U', 'SESSION_U', 'SESSION'),
(14048, 'SESSION_D', 'SESSION_D', 'SESSION'),
(14049, 'SURVEY_C', 'SURVEY_C', 'SURVEY'),
(14050, 'SURVEY_R', 'SURVEY_R', 'SURVEY'),
(14051, 'SURVEY_U', 'SURVEY_U', 'SURVEY'),
(14052, 'SURVEY_D', 'SURVEY_D', 'SURVEY'),
(14053, 'SURVEY_QUESTION_C', 'SURVEY_QUESTION_C', 'SURVEY QUESTION'),
(14054, 'SURVEY_QUESTION_R', 'SURVEY_QUESTION_R', 'SURVEY QUESTION'),
(14055, 'SURVEY_QUESTION_U', 'SURVEY_QUESTION_U', 'SURVEY QUESTION'),
(14056, 'SURVEY_QUESTION_D', 'SURVEY_QUESTION_D', 'SURVEY QUESTION'),
(14057, 'SURVEY_QUESTION_TYPE_C', 'SURVEY_QUESTION_TYPE_C', 'SURVEY QUESTION TYPE'),
(14058, 'SURVEY_QUESTION_TYPE_R', 'SURVEY_QUESTION_TYPE_R', 'SURVEY QUESTION TYPE'),
(14059, 'SURVEY_QUESTION_TYPE_U', 'SURVEY_QUESTION_TYPE_U', 'SURVEY QUESTION TYPE'),
(14060, 'SURVEY_QUESTION_TYPE_D', 'SURVEY_QUESTION_TYPE_D', 'SURVEY QUESTION TYPE'),
(14061, 'SURVEY_QUESTION_FILLUP_C', 'SURVEY_QUESTION_FILLUP_C', 'SURVEY QUESTION FILLUP'),
(14062, 'SURVEY_QUESTION_FILLUP_R', 'SURVEY_QUESTION_FILLUP_R', 'SURVEY QUESTION FILLUP'),
(14063, 'SURVEY_QUESTION_FILLUP_U', 'SURVEY_QUESTION_FILLUP_U', 'SURVEY QUESTION FILLUP'),
(14064, 'SURVEY_QUESTION_FILLUP_D', 'SURVEY_QUESTION_FILLUP_D', 'SURVEY QUESTION FILLUP'),
(14065, 'TERM_C', 'TERM_C', 'TERM'),
(14066, 'TERM_R', 'TERM_R', 'TERM'),
(14067, 'TERM_U', 'TERM_U', 'TERM'),
(14068, 'TERM_D', 'TERM_D', 'TERM'),
(14069, 'USER_C', 'USER_C', 'USER'),
(14070, 'USER_R', 'USER_R', 'USER'),
(14071, 'USER_U', 'USER_U', 'USER'),
(14072, 'USER_D', 'USER_D', 'USER'),
(14073, 'YEAR_C', 'YEAR_C', 'YEAR'),
(14074, 'YEAR_R', 'YEAR_R', 'YEAR'),
(14075, 'YEAR_U', 'YEAR_U', 'YEAR'),
(14076, 'YEAR_D', 'YEAR_D', 'YEAR'),
(14077, 'VIDEO_C', 'VIDEO_C', 'VIDEO'),
(14078, 'VIDEO_R', 'VIDEO_R', 'VIDEO'),
(14079, 'VIDEO_U', 'VIDEO_U', 'VIDEO'),
(14080, 'VIDEO_D', 'VIDEO_D', 'VIDEO'),
(14081, 'VIDEO_COMMENT_C', 'VIDEO_COMMENT_C', 'VIDEO COMMENT'),
(14082, 'VIDEO_COMMENT_R', 'VIDEO_COMMENT_R', 'VIDEO COMMENT'),
(14083, 'VIDEO_COMMENT_U', 'VIDEO_COMMENT_U', 'VIDEO COMMENT'),
(14084, 'VIDEO_COMMENT_D', 'VIDEO_COMMENT_D', 'VIDEO COMMENT'),
(14085, 'JOB_C', 'JOB_C', 'JOB'),
(14086, 'JOB_R', 'JOB_R', 'JOB'),
(14087, 'JOB_U', 'JOB_U', 'JOB'),
(14088, 'JOB_D', 'JOB_D', 'JOB'),
(14089, 'CLUB_C', 'CLUB_C', 'CLUB'),
(14090, 'CLUB_R', 'CLUB_R', 'CLUB'),
(14091, 'CLUB_U', 'CLUB_U', 'CLUB'),
(14092, 'CLUB_D', 'CLUB_D', 'CLUB'),
(14093, 'DISCUSSION_C', 'DISCUSSION_C', 'DISCUSSION'),
(14094, 'DISCUSSION_R', 'DISCUSSION_R', 'DISCUSSION'),
(14095, 'DISCUSSION_U', 'DISCUSSION_U', 'DISCUSSION'),
(14096, 'DISCUSSION_D', 'DISCUSSION_D', 'DISCUSSION'),
(14097, 'DISCUSSION_CAT_C', 'DISCUSSION_CAT_C', 'DISCUSSION CATEGORY'),
(14098, 'DISCUSSION_CAT_R', 'DISCUSSION_CAT_R', 'DISCUSSION CATEGORY'),
(14099, 'DISCUSSION_CAT_U', 'DISCUSSION_CAT_U', 'DISCUSSION CATEGORY'),
(14100, 'DISCUSSION_CAT_D', 'DISCUSSION_CAT_D', 'DISCUSSION CATEGORY'),
(14101, 'DISCUSSION_COMMENT_C', 'DISCUSSION_COMMENT_C', 'DISCUSSION COMMENT'),
(14102, 'DISCUSSION_COMMENT_R', 'DISCUSSION_COMMENT_R', 'DISCUSSION COMMENT'),
(14103, 'DISCUSSION_COMMENT_U', 'DISCUSSION_COMMENT_U', 'DISCUSSION COMMENT'),
(14104, 'DISCUSSION_COMMENT_D', 'DISCUSSION_COMMENT_D', 'DISCUSSION COMMENT'),
(14105, 'TASK_C', 'TASK_C', 'TASK'),
(14106, 'TASK_R', 'TASK_R', 'TASK'),
(14107, 'TASK_U', 'TASK_U', 'TASK'),
(14108, 'TASK_D', 'TASK_D', 'TASK'),
(14109, 'TASK_CATEGORY_C', 'TASK_CATEGORY_C', 'TASK_CATEGORY'),
(14110, 'TASK_CATEGORY_R', 'TASK_CATEGORY_R', 'TASK_CATEGORY'),
(14111, 'TASK_CATEGORY_U', 'TASK_CATEGORY_U', 'TASK_CATEGORY'),
(14112, 'TASK_CATEGORY_D', 'TASK_CATEGORY_D', 'TASK_CATEGORY'),
(14113, 'ASSET_C', 'ASSET_C', 'ASSET'),
(14114, 'ASSET_R', 'ASSET_R', 'ASSET'),
(14115, 'ASSET_U', 'ASSET_U', 'ASSET'),
(14116, 'ASSET_D', 'ASSET_D', 'ASSET'),
(14117, 'THESIS_C', 'THESIS_C', 'THESIS'),
(14118, 'THESIS_R', 'THESIS_R', 'THESIS'),
(14119, 'THESIS_U', 'THESIS_U', 'THESIS'),
(14120, 'THESIS_D', 'THESIS_D', 'THESIS'),
(14121, 'EMAIL_C', 'EMAIL_C', 'EMAIL'),
(14122, 'EMAIL_R', 'EMAIL_R', 'EMAIL'),
(14123, 'EMAIL_U', 'EMAIL_U', 'EMAIL'),
(14124, 'EMAIL_D', 'EMAIL_D', 'EMAIL'),
(14125, 'SCHOLARSHIP_C', 'SCHOLARSHIP_C', 'SCHOLARSHIP'),
(14126, 'SCHOLARSHIP_R', 'SCHOLARSHIP_R', 'SCHOLARSHIP'),
(14127, 'SCHOLARSHIP_U', 'SCHOLARSHIP_U', 'SCHOLARSHIP'),
(14128, 'SCHOLARSHIP_D', 'SCHOLARSHIP_D', 'SCHOLARSHIP'),
(14129, 'SCHOLARSHIP_TYPE_C', 'SCHOLARSHIP_TYPE_C', 'SCHOLARSHIP_TYPE'),
(14130, 'SCHOLARSHIP_TYPE_R', 'SCHOLARSHIP_TYPE_R', 'SCHOLARSHIP_TYPE'),
(14131, 'SCHOLARSHIP_TYPE_U', 'SCHOLARSHIP_TYPE_U', 'SCHOLARSHIP_TYPE'),
(14132, 'SCHOLARSHIP_TYPE_D', 'SCHOLARSHIP_TYPE_D', 'SCHOLARSHIP_TYPE'),
(14133, 'SCHOLARSHIP_APPLIED_C', 'SCHOLARSHIP_APPLIED_C', 'SCHOLARSHIP_APPLIED'),
(14134, 'SCHOLARSHIP_APPLIED_R', 'SCHOLARSHIP_APPLIED_R', 'SCHOLARSHIP_APPLIED'),
(14135, 'SCHOLARSHIP_APPLIED_U', 'SCHOLARSHIP_APPLIED_U', 'SCHOLARSHIP_APPLIED'),
(14136, 'SCHOLARSHIP_APPLIED_D', 'SCHOLARSHIP_APPLIED_D', 'SCHOLARSHIP_APPLIED'),
(14137, 'SCHOLARSHIP_CV_C', 'SCHOLARSHIP_CV_C', 'SCHOLARSHIP_CV'),
(14138, 'SCHOLARSHIP_CV_R', 'SCHOLARSHIP_CV_R', 'SCHOLARSHIP_CV'),
(14139, 'SCHOLARSHIP_CV_U', 'SCHOLARSHIP_CV_U', 'SCHOLARSHIP_CV'),
(14140, 'SCHOLARSHIP_CV_D', 'SCHOLARSHIP_CV_D', 'SCHOLARSHIP_CV');

-- --------------------------------------------------------

--
-- Table structure for table `ums_position`
--

DROP TABLE IF EXISTS `ums_position`;
CREATE TABLE IF NOT EXISTS `ums_position` (
  `ID` varchar(40) NOT NULL,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ums_position`
--

INSERT INTO `ums_position` (`ID`, `Name`) VALUES
('{1BFE76DB-C2AA-4FAA-A23B-F43E6150A2F6}', 'Section Officer'),
('{2E024DF5-BD45-4EF2-A5E3-43BCA3E9777F}', 'Pro-vice Chancellor'),
('{64D25DDA-16B6-47B8-BBFC-4E2AAF5680C7}', 'Assistant Professor'),
('{7CDA1F32-A2F8-4469-B5A8-C2038FCE1F9A}', 'Lecturer'),
('{818DE12F-60CC-42E4-BAEC-48EAAED65179}', 'Dean of School'),
('{928EE9FF-E02D-470F-9A6A-AD0EB38B848F}', 'Vice Chancellor'),
('{92FDDA3F-1E91-4AA3-918F-EB595F85790C}', 'Daywise Worker'),
('{932CB0EE-76C2-448E-A40E-2D167EECC479}', 'Registrar'),
('{ADA027D3-21C1-47AF-A21D-759CAFCFE58D}', 'Assistant Registrar'),
('{B76EB035-EA26-4CEB-B029-1C6129574D98}', 'Librarian'),
('{B78C7A7B-4D38-4025-8170-7B8C9F291946}', 'Head of Discipline'),
('{C27B6BCF-FB83-4F3D-85CA-B7870D8B12D0}', 'Associate Professor'),
('{EB4880E2-01B3-4C6E-A2C9-89B6E5427C0A}', 'Professor');

-- --------------------------------------------------------

--
-- Table structure for table `ums_role`
--

DROP TABLE IF EXISTS `ums_role`;
CREATE TABLE IF NOT EXISTS `ums_role` (
  `ID` varchar(40) NOT NULL,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ums_role`
--

INSERT INTO `ums_role` (`ID`, `Name`) VALUES
('administrator', 'Administrator'),
('registration coordinator', 'Registration Coordinator'),
('student', 'Student'),
('stuff', 'Stuff'),
('tabulator', 'Tabulator'),
('teacher', 'Teacher');

-- --------------------------------------------------------

--
-- Table structure for table `ums_role_permission`
--

DROP TABLE IF EXISTS `ums_role_permission`;
CREATE TABLE IF NOT EXISTS `ums_role_permission` (
  `Row` int(11) NOT NULL AUTO_INCREMENT,
  `RoleID` varchar(40) NOT NULL,
  `PermissionID` varchar(100) NOT NULL,
  PRIMARY KEY (`Row`)
) ENGINE=InnoDB AUTO_INCREMENT=3566 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ums_role_permission`
--

INSERT INTO `ums_role_permission` (`Row`, `RoleID`, `PermissionID`) VALUES
(1453, 'teacher', 'COURSE_C'),
(1454, 'teacher', 'COURSE_D'),
(1455, 'teacher', 'COURSE_R'),
(1456, 'teacher', 'COURSE_U'),
(1457, 'teacher', 'DISCUSSION_C'),
(1458, 'teacher', 'DISCUSSION_D'),
(1459, 'teacher', 'DISCUSSION_R'),
(1460, 'teacher', 'DISCUSSION_U'),
(1461, 'teacher', 'DISCUSSION_CAT_C'),
(1462, 'teacher', 'DISCUSSION_CAT_D'),
(1463, 'teacher', 'DISCUSSION_CAT_R'),
(1464, 'teacher', 'DISCUSSION_CAT_U'),
(1465, 'teacher', 'DISCUSSION_COMMENT_C'),
(1466, 'teacher', 'DISCUSSION_COMMENT_D'),
(1467, 'teacher', 'DISCUSSION_COMMENT_R'),
(1468, 'teacher', 'DISCUSSION_COMMENT_U'),
(1469, 'teacher', 'FILE_C'),
(1470, 'teacher', 'FILE_D'),
(1471, 'teacher', 'FILE_R'),
(1472, 'teacher', 'FILE_U'),
(1473, 'teacher', 'PROJECT_C'),
(1474, 'teacher', 'PROJECT_D'),
(1475, 'teacher', 'PROJECT_R'),
(1476, 'teacher', 'PROJECT_U'),
(1477, 'teacher', 'QUESTION_C'),
(1478, 'teacher', 'QUESTION_D'),
(1479, 'teacher', 'QUESTION_R'),
(1480, 'teacher', 'QUESTION_U'),
(1481, 'teacher', 'REGISTRATION_C'),
(1482, 'teacher', 'REGISTRATION_D'),
(1483, 'teacher', 'REGISTRATION_R'),
(1484, 'teacher', 'REGISTRATION_U'),
(1485, 'teacher', 'RESULT_C'),
(1486, 'teacher', 'RESULT_D'),
(1487, 'teacher', 'RESULT_R'),
(1488, 'teacher', 'RESULT_U'),
(2211, '', 'PRODUCT_C'),
(2212, '', 'PRODUCT_R'),
(2213, '', 'PRODUCT_U'),
(2214, '', 'PRODUCT_D'),
(3107, 'student', 'CLUB_C'),
(3108, 'student', 'CLUB_R'),
(3109, 'student', 'CLUB_U'),
(3110, 'student', 'CLUB_D'),
(3111, 'student', 'DISCUSSION_C'),
(3112, 'student', 'DISCUSSION_R'),
(3113, 'student', 'DISCUSSION_U'),
(3114, 'student', 'DISCUSSION_D'),
(3115, 'student', 'DISCUSSION_COMMENT_C'),
(3116, 'student', 'DISCUSSION_COMMENT_R'),
(3117, 'student', 'DISCUSSION_COMMENT_U'),
(3118, 'student', 'DISCUSSION_COMMENT_D'),
(3119, 'student', 'PROJECT_C'),
(3120, 'student', 'PROJECT_R'),
(3121, 'student', 'PROJECT_U'),
(3122, 'student', 'PROJECT_D'),
(3123, 'student', 'QUESTION_C'),
(3124, 'student', 'QUESTION_R'),
(3125, 'student', 'QUESTION_U'),
(3126, 'student', 'QUESTION_D'),
(3127, 'student', 'REGISTRATION_R'),
(3128, 'student', 'RESULT_R'),
(3129, 'student', 'SCHOLARSHIP_R'),
(3130, 'student', 'SCHOLARSHIP_CV_C'),
(3131, 'student', 'SCHOLARSHIP_CV_R'),
(3132, 'student', 'SCHOLARSHIP_CV_U'),
(3133, 'student', 'USER_R'),
(3134, 'student', 'VIDEO_C'),
(3135, 'student', 'VIDEO_R'),
(3136, 'student', 'VIDEO_U'),
(3137, 'student', 'VIDEO_D'),
(3426, 'administrator', 'ATTENDANCE_C'),
(3427, 'administrator', 'ATTENDANCE_R'),
(3428, 'administrator', 'ATTENDANCE_U'),
(3429, 'administrator', 'ATTENDANCE_D'),
(3430, 'administrator', 'CLUB_C'),
(3431, 'administrator', 'CLUB_R'),
(3432, 'administrator', 'CLUB_U'),
(3433, 'administrator', 'CLUB_D'),
(3434, 'administrator', 'COURSE_C'),
(3435, 'administrator', 'COURSE_R'),
(3436, 'administrator', 'COURSE_U'),
(3437, 'administrator', 'COURSE_D'),
(3438, 'administrator', 'COURSE_SESSIONAL_TYPE_C'),
(3439, 'administrator', 'COURSE_SESSIONAL_TYPE_R'),
(3440, 'administrator', 'COURSE_SESSIONAL_TYPE_U'),
(3441, 'administrator', 'COURSE_SESSIONAL_TYPE_D'),
(3442, 'administrator', 'COURSE_TYPE_C'),
(3443, 'administrator', 'COURSE_TYPE_R'),
(3444, 'administrator', 'COURSE_TYPE_U'),
(3445, 'administrator', 'COURSE_TYPE_D'),
(3446, 'administrator', 'DISCIPLINE_C'),
(3447, 'administrator', 'DISCIPLINE_R'),
(3448, 'administrator', 'DISCIPLINE_U'),
(3449, 'administrator', 'DISCIPLINE_D'),
(3450, 'administrator', 'DISCUSSION_C'),
(3451, 'administrator', 'DISCUSSION_R'),
(3452, 'administrator', 'DISCUSSION_U'),
(3453, 'administrator', 'DISCUSSION_D'),
(3454, 'administrator', 'DISCUSSION_CAT_C'),
(3455, 'administrator', 'DISCUSSION_CAT_R'),
(3456, 'administrator', 'DISCUSSION_CAT_U'),
(3457, 'administrator', 'DISCUSSION_CAT_D'),
(3458, 'administrator', 'DISCUSSION_COMMENT_C'),
(3459, 'administrator', 'DISCUSSION_COMMENT_R'),
(3460, 'administrator', 'DISCUSSION_COMMENT_U'),
(3461, 'administrator', 'DISCUSSION_COMMENT_D'),
(3462, 'administrator', 'FILE_C'),
(3463, 'administrator', 'FILE_R'),
(3464, 'administrator', 'FILE_U'),
(3465, 'administrator', 'FILE_D'),
(3466, 'administrator', 'GRADE_SETUP_C'),
(3467, 'administrator', 'GRADE_SETUP_R'),
(3468, 'administrator', 'GRADE_SETUP_U'),
(3469, 'administrator', 'GRADE_SETUP_D'),
(3470, 'administrator', 'JOB_C'),
(3471, 'administrator', 'JOB_R'),
(3472, 'administrator', 'JOB_U'),
(3473, 'administrator', 'JOB_D'),
(3474, 'administrator', 'MARKS_SETUP_C'),
(3475, 'administrator', 'MARKS_SETUP_R'),
(3476, 'administrator', 'MARKS_SETUP_U'),
(3477, 'administrator', 'MARKS_SETUP_D'),
(3478, 'administrator', 'PERMISSION_C'),
(3479, 'administrator', 'PERMISSION_R'),
(3480, 'administrator', 'PERMISSION_U'),
(3481, 'administrator', 'PERMISSION_D'),
(3482, 'administrator', 'POSITION_C'),
(3483, 'administrator', 'POSITION_R'),
(3484, 'administrator', 'POSITION_U'),
(3485, 'administrator', 'POSITION_D'),
(3486, 'administrator', 'QUESTION_C'),
(3487, 'administrator', 'QUESTION_R'),
(3488, 'administrator', 'QUESTION_U'),
(3489, 'administrator', 'QUESTION_D'),
(3490, 'administrator', 'REGISTRATION_C'),
(3491, 'administrator', 'REGISTRATION_R'),
(3492, 'administrator', 'REGISTRATION_U'),
(3493, 'administrator', 'REGISTRATION_D'),
(3494, 'administrator', 'RESULT_C'),
(3495, 'administrator', 'RESULT_R'),
(3496, 'administrator', 'RESULT_U'),
(3497, 'administrator', 'RESULT_D'),
(3498, 'administrator', 'ROLE_C'),
(3499, 'administrator', 'ROLE_R'),
(3500, 'administrator', 'ROLE_U'),
(3501, 'administrator', 'ROLE_D'),
(3502, 'administrator', 'SCHOLARSHIP_C'),
(3503, 'administrator', 'SCHOLARSHIP_R'),
(3504, 'administrator', 'SCHOLARSHIP_U'),
(3505, 'administrator', 'SCHOLARSHIP_D'),
(3506, 'administrator', 'SCHOLARSHIP_APPLIED_C'),
(3507, 'administrator', 'SCHOLARSHIP_APPLIED_R'),
(3508, 'administrator', 'SCHOLARSHIP_APPLIED_U'),
(3509, 'administrator', 'SCHOLARSHIP_APPLIED_D'),
(3510, 'administrator', 'SCHOLARSHIP_TYPE_C'),
(3511, 'administrator', 'SCHOLARSHIP_TYPE_R'),
(3512, 'administrator', 'SCHOLARSHIP_TYPE_U'),
(3513, 'administrator', 'SCHOLARSHIP_TYPE_D'),
(3514, 'administrator', 'SCHOOL_C'),
(3515, 'administrator', 'SCHOOL_R'),
(3516, 'administrator', 'SCHOOL_U'),
(3517, 'administrator', 'SCHOOL_D'),
(3518, 'administrator', 'SESSION_C'),
(3519, 'administrator', 'SESSION_R'),
(3520, 'administrator', 'SESSION_U'),
(3521, 'administrator', 'SESSION_D'),
(3522, 'administrator', 'SURVEY_C'),
(3523, 'administrator', 'SURVEY_R'),
(3524, 'administrator', 'SURVEY_U'),
(3525, 'administrator', 'SURVEY_D'),
(3526, 'administrator', 'SURVEY_QUESTION_C'),
(3527, 'administrator', 'SURVEY_QUESTION_R'),
(3528, 'administrator', 'SURVEY_QUESTION_U'),
(3529, 'administrator', 'SURVEY_QUESTION_D'),
(3530, 'administrator', 'SURVEY_QUESTION_FILLUP_C'),
(3531, 'administrator', 'SURVEY_QUESTION_FILLUP_R'),
(3532, 'administrator', 'SURVEY_QUESTION_FILLUP_U'),
(3533, 'administrator', 'SURVEY_QUESTION_FILLUP_D'),
(3534, 'administrator', 'SURVEY_QUESTION_TYPE_C'),
(3535, 'administrator', 'SURVEY_QUESTION_TYPE_R'),
(3536, 'administrator', 'SURVEY_QUESTION_TYPE_U'),
(3537, 'administrator', 'SURVEY_QUESTION_TYPE_D'),
(3538, 'administrator', 'TASK_C'),
(3539, 'administrator', 'TASK_R'),
(3540, 'administrator', 'TASK_U'),
(3541, 'administrator', 'TASK_D'),
(3542, 'administrator', 'TASK_CATEGORY_C'),
(3543, 'administrator', 'TASK_CATEGORY_R'),
(3544, 'administrator', 'TASK_CATEGORY_U'),
(3545, 'administrator', 'TASK_CATEGORY_D'),
(3546, 'administrator', 'TERM_C'),
(3547, 'administrator', 'TERM_R'),
(3548, 'administrator', 'TERM_U'),
(3549, 'administrator', 'TERM_D'),
(3550, 'administrator', 'USER_C'),
(3551, 'administrator', 'USER_R'),
(3552, 'administrator', 'USER_U'),
(3553, 'administrator', 'USER_D'),
(3554, 'administrator', 'VIDEO_C'),
(3555, 'administrator', 'VIDEO_R'),
(3556, 'administrator', 'VIDEO_U'),
(3557, 'administrator', 'VIDEO_D'),
(3558, 'administrator', 'VIDEO_COMMENT_C'),
(3559, 'administrator', 'VIDEO_COMMENT_R'),
(3560, 'administrator', 'VIDEO_COMMENT_U'),
(3561, 'administrator', 'VIDEO_COMMENT_D'),
(3562, 'administrator', 'YEAR_C'),
(3563, 'administrator', 'YEAR_R'),
(3564, 'administrator', 'YEAR_U'),
(3565, 'administrator', 'YEAR_D');

-- --------------------------------------------------------

--
-- Table structure for table `ums_school`
--

DROP TABLE IF EXISTS `ums_school`;
CREATE TABLE IF NOT EXISTS `ums_school` (
  `ID` varchar(40) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `DeanID` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ums_school`
--

INSERT INTO `ums_school` (`ID`, `Name`, `DeanID`) VALUES
('{39DDC0C2-CFC2-4246-8748-8812B1751A5C}', 'Science Engineering and Technology', ''),
('{4D46079B-AFA3-40F1-B8D1-6CC9E9F56812}', 'Life Science', ''),
('{86E0F021-B30D-48D2-B177-247180633C5E}', 'Social Science', ''),
('{879375F7-0A15-4705-AC90-C6786D279EF1}', 'Law and Humanities', ''),
('{CE09AA38-205B-4F50-A0E0-14DB8686C912}', 'Fine Arts', ''),
('{39DDC0C2-CFC2-4246-8748-8812B1751A5C}', 'Science Engineering and Technology', ''),
('{4D46079B-AFA3-40F1-B8D1-6CC9E9F56812}', 'Life Science', ''),
('{86E0F021-B30D-48D2-B177-247180633C5E}', 'Social Science', ''),
('{879375F7-0A15-4705-AC90-C6786D279EF1}', 'Law and Humanities', ''),
('{CE09AA38-205B-4F50-A0E0-14DB8686C912}', 'Fine Arts', '');

-- --------------------------------------------------------

--
-- Table structure for table `ums_user`
--

DROP TABLE IF EXISTS `ums_user`;
CREATE TABLE IF NOT EXISTS `ums_user` (
  `ID` varchar(40) NOT NULL,
  `UniversityID` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `MiddleName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `DisciplineID` varchar(40) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `IsLogged` varchar(10) DEFAULT NULL,
  `IsArchived` varchar(10) DEFAULT NULL,
  `IsDeleted` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `UniversityID` (`UniversityID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ums_user`
--

INSERT INTO `ums_user` (`ID`, `UniversityID`, `Email`, `Password`, `FirstName`, `MiddleName`, `LastName`, `DisciplineID`, `Status`, `IsLogged`, `IsArchived`, `IsDeleted`) VALUES
('aswad@gmail.com', '160216', 'aswad@gmail.com', '$2y$10$53o3svYDw8QiP1u0kolZKu6ODVZnvlNVVrAcSKbOgmNSSdsrwh.l.', 'Aswad', '', 'Alam', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'approved', NULL, NULL, NULL),
('aysha@gmail.com', '020208', 'aysha@gmail.com', '$2y$10$53o3svYDw8QiP1u0kolZKu6ODVZnvlNVVrAcSKbOgmNSSdsrwh.l.', 'Aysha', 'mrs', 'Akther', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'approved', NULL, NULL, NULL),
('kashif@gmail.com', '020202', 'kashif@gmail.com', '$2y$10$l0gFzILMq03DcwcBGxIdgunnOd9G5kF8J8ucZZvCKkt8mNGlI74/W', 'Kashif', 'Nizam', 'Khan', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'approved', NULL, NULL, NULL),
('lotif@gmail.com', '160212', 'lotif@gmail.com', '$2y$10$vN3QhR4gMPGhbS3POHtxhOn3zs2pZ5s/NsY9LA2mZFEaUgDx8ZsBC', 'Md', 'Abdul', 'Lotif', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'approved', NULL, NULL, NULL),
('m.afnan2016@gmail.com', '160235', 'm.afnan2016@gmail.com', '$2y$10$53o3svYDw8QiP1u0kolZKu6ODVZnvlNVVrAcSKbOgmNSSdsrwh.l.', 'Mahujur', 'Rahman', 'Afnan', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'approved', NULL, NULL, NULL),
('mannaemam@gmail.com', '160204', 'mannaemam@gmail.com', '$2y$10$D5XCCvmo5jJjySr5QCo5g.MpRzgcpzvpTkvK7eff4ZY2izm68BLo.', 'Emamul', 'Haque', 'Manna', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'approved', NULL, NULL, NULL),
('mkazi078@uottawa.ca', '020229', 'mkazi078@uottawa.ca', '$2y$10$l0gFzILMq03DcwcBGxIdgunnOd9G5kF8J8ucZZvCKkt8mNGlI74/W', 'Kazi', 'Masudul', 'Alam', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'approved', NULL, NULL, NULL),
('sumit@gmail.com', '160205', 'sumit@gmail.com', '$2y$10$rkXrq1vv8Q21JPa5pTLDV.Aghk/GwTa0uWDqgDA3SjqA8ib46oGnW', 'Sumit', 'Kumar', 'Dam', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'approved', NULL, NULL, NULL),
('zahid@gmail.com', '020203', 'zahid@gmail.com', '$2y$10$nLZhZRneURR.v2AFqWw9KOe6/J60pCV/ioBnJnruw5H/Xf3x0lFy6', 'Zahidul', '', 'Islam', '{FFDB1CB8-AF34-4381-8971-9784DCB516C5}', 'approved', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ums_user_details`
--

DROP TABLE IF EXISTS `ums_user_details`;
CREATE TABLE IF NOT EXISTS `ums_user_details` (
  `ID` varchar(40) NOT NULL,
  `FatherName` varchar(100) DEFAULT NULL,
  `MotherName` varchar(100) DEFAULT NULL,
  `PermanentAddress` varchar(200) DEFAULT NULL,
  `HomePhone` varchar(20) DEFAULT NULL,
  `CurrentAddress` varchar(200) DEFAULT NULL,
  `MobilePhone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ums_user_details`
--

INSERT INTO `ums_user_details` (`ID`, `FatherName`, `MotherName`, `PermanentAddress`, `HomePhone`, `CurrentAddress`, `MobilePhone`) VALUES
('abir@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL),
('aswad@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL),
('aysha@gmail.com', 'f', 'm', 'Dr. Kazi Masudul Alam', '12313123123', 'Computer Science and Engineering Discipline, Khulna University', '45 '),
('kashif@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL),
('lotif@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL),
('m.afnan2016@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL),
('mannaemam@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL),
('mkazi078@uottawa.ca', 'Kazi Shahidul Alam', 'Hosneara Jahan', '49/2, Rokon Uddin Sarak, East Baniakhamar, Khulna', '0417223344', 'Same', '01711149360 '),
('sumit@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL),
('zahid@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ums_user_discipline`
--

DROP TABLE IF EXISTS `ums_user_discipline`;
CREATE TABLE IF NOT EXISTS `ums_user_discipline` (
  `UserID` varchar(40) NOT NULL,
  `DisciplineID` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ums_user_position`
--

DROP TABLE IF EXISTS `ums_user_position`;
CREATE TABLE IF NOT EXISTS `ums_user_position` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` varchar(40) NOT NULL,
  `PositionID` varchar(40) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ums_user_position`
--

INSERT INTO `ums_user_position` (`ID`, `UserID`, `PositionID`) VALUES
(50, 'aysha@gmail.com', '{7CDA1F32-A2F8-4469-B5A8-C2038FCE1F9A}'),
(51, 'mkazi078@uottawa.ca', '{C27B6BCF-FB83-4F3D-85CA-B7870D8B12D0}');

-- --------------------------------------------------------

--
-- Table structure for table `ums_user_role`
--

DROP TABLE IF EXISTS `ums_user_role`;
CREATE TABLE IF NOT EXISTS `ums_user_role` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` varchar(40) NOT NULL,
  `RoleID` varchar(40) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ums_user_role`
--

INSERT INTO `ums_user_role` (`ID`, `UserID`, `RoleID`) VALUES
(122, 'middle@test.com', 'student'),
(123, 'middle@test.com', 'student'),
(124, 'middle@test.com', 'student'),
(125, 'middle@test.com', 'student'),
(126, 'middle@test.com', 'student'),
(127, 'middle@test.com', 'student'),
(128, 'middle@test.com', 'student'),
(129, 'middle@test.com', 'student'),
(130, 'middle@test.com', 'student'),
(131, 'middle@test.com', 'student'),
(132, 'middle@test.com', 'student'),
(133, 'middle@test.com', 'student'),
(134, 'middle@test.com', 'student'),
(135, 'middle@test.com', 'student'),
(136, 'middle@test.com', 'student'),
(137, 'middle@test.com', 'student'),
(138, 'middle@test.com', 'student'),
(142, 'zahid@gmail.com', 'student'),
(144, 'middle1@test.com', 'student'),
(145, 'kashif@gmail.com', 'student'),
(164, 'aysha@gmail.com', 'administrator'),
(165, 'mkazi078@uottawa.ca', 'administrator'),
(167, 'mannaemam@gmail.com', 'administrator'),
(169, 'aswad@gmail.com', 'student'),
(170, 'abir@gmail.com', 'student'),
(171, 'sumit@gmail.com', 'student'),
(173, 'm.afnan2016@gmail.com', 'administrator'),
(175, 'lotif@gmail.com', 'student');

-- --------------------------------------------------------

--
-- Table structure for table `vtms_video`
--

DROP TABLE IF EXISTS `vtms_video`;
CREATE TABLE IF NOT EXISTS `vtms_video` (
  `ID` varchar(40) NOT NULL,
  `Title` varchar(1500) NOT NULL,
  `Description` varchar(1500) NOT NULL,
  `TagID` varchar(40) NOT NULL,
  `Link` varchar(150) NOT NULL,
  `IsEmbed` tinyint(1) NOT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `CreatorID` varchar(40) NOT NULL,
  `Views` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vtms_video_comment`
--

DROP TABLE IF EXISTS `vtms_video_comment`;
CREATE TABLE IF NOT EXISTS `vtms_video_comment` (
  `CommentID` varchar(40) NOT NULL,
  `Comment` varchar(1500) NOT NULL,
  `CreatorID` varchar(40) NOT NULL,
  `VideoID` varchar(40) NOT NULL,
  `CommentIDTop` varchar(40) DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vtms_video_tag`
--

DROP TABLE IF EXISTS `vtms_video_tag`;
CREATE TABLE IF NOT EXISTS `vtms_video_tag` (
  `VideoID` varchar(40) NOT NULL,
  `Tag` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
