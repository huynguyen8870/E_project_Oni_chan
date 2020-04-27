-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3308
-- Thời gian đã tạo: Th4 27, 2020 lúc 09:57 AM
-- Phiên bản máy phục vụ: 8.0.18
-- Phiên bản PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `bbb`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `admin` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `categoryID` varchar(100) NOT NULL,
  `mangaID` varchar(100) NOT NULL,
  PRIMARY KEY (`categoryID`),
  KEY `fk_mangaCategory` (`mangaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categorydetail`
--

DROP TABLE IF EXISTS `categorydetail`;
CREATE TABLE IF NOT EXISTS `categorydetail` (
  `categoryDetailID` varchar(100) NOT NULL,
  `categoryID` varchar(100) NOT NULL,
  `categoryName` varchar(100) NOT NULL,
  PRIMARY KEY (`categoryDetailID`),
  KEY `fk_categoryCategoryDetail` (`categoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chapter`
--

DROP TABLE IF EXISTS `chapter`;
CREATE TABLE IF NOT EXISTS `chapter` (
  `chapterID` varchar(100) NOT NULL,
  `chapterName` varchar(100) NOT NULL,
  `mangaID` varchar(100) NOT NULL,
  `content` varchar(100) NOT NULL,
  `view` varchar(100) NOT NULL,
  `lastUpdate` date NOT NULL,
  PRIMARY KEY (`chapterID`),
  KEY `fk_mangaChapter` (`mangaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `commentID` varchar(100) NOT NULL,
  `userID` varchar(100) NOT NULL,
  `mangaID` varchar(100) NOT NULL,
  `content` varchar(300) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`commentID`),
  KEY `fk_userComment` (`userID`),
  KEY `fk_commentManga` (`mangaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `folow`
--

DROP TABLE IF EXISTS `folow`;
CREATE TABLE IF NOT EXISTS `folow` (
  `folowID` varchar(100) NOT NULL,
  `userID` varchar(100) NOT NULL,
  `mangaID` varchar(100) NOT NULL,
  PRIMARY KEY (`folowID`),
  KEY `fk_userFolow` (`userID`),
  KEY `fk_folowManga` (`mangaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `manga`
--

DROP TABLE IF EXISTS `manga`;
CREATE TABLE IF NOT EXISTS `manga` (
  `mangaID` varchar(100) NOT NULL,
  `mangaName` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `artsits` varchar(100) NOT NULL,
  `description` varchar(300) NOT NULL,
  `view` int(11) NOT NULL,
  `rate` int(11) NOT NULL,
  `coverImage` varchar(300) NOT NULL,
  PRIMARY KEY (`mangaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `userID` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `userName` varchar(100) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `fk_mangaCategory` FOREIGN KEY (`mangaID`) REFERENCES `manga` (`mangaID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `categorydetail`
--
ALTER TABLE `categorydetail`
  ADD CONSTRAINT `fk_categoryCategoryDetail` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `chapter`
--
ALTER TABLE `chapter`
  ADD CONSTRAINT `fk_mangaChapter` FOREIGN KEY (`mangaID`) REFERENCES `manga` (`mangaID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_commentManga` FOREIGN KEY (`mangaID`) REFERENCES `manga` (`mangaID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_userComment` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `folow`
--
ALTER TABLE `folow`
  ADD CONSTRAINT `fk_folowManga` FOREIGN KEY (`mangaID`) REFERENCES `manga` (`mangaID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_userFolow` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
