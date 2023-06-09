CREATE DATABASE  IF NOT EXISTS `19831049_finalproject` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `19831049_finalproject`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: 19831049_finalproject
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `board_anonymous`
--

DROP TABLE IF EXISTS `board_anonymous`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board_anonymous` (
  `num` int NOT NULL,
  `title` varchar(30) NOT NULL,
  `writer` varchar(10) NOT NULL,
  `content` text,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_anonymous`
--

LOCK TABLES `board_anonymous` WRITE;
/*!40000 ALTER TABLE `board_anonymous` DISABLE KEYS */;
INSERT INTO `board_anonymous` VALUES (1,'익명제목','익명작성자','익명내용','2023-06-09 23:00:58'),(2,'안녕','나는누구','내용이야','2023-06-09 23:01:10'),(3,'심심하다','심심','뭐하지...','2023-06-09 23:01:21');
/*!40000 ALTER TABLE `board_anonymous` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board_data`
--

DROP TABLE IF EXISTS `board_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board_data` (
  `num` int NOT NULL,
  `title` varchar(30) NOT NULL,
  `writer` varchar(10) NOT NULL,
  `content` text,
  `date` datetime DEFAULT NULL,
  `data_name` text,
  `data_realName` text,
  `data_route` text,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_data`
--

LOCK TABLES `board_data` WRITE;
/*!40000 ALTER TABLE `board_data` DISABLE KEYS */;
INSERT INTO `board_data` VALUES (1,'카카오톡 테마','test','자료실 게시판은 회원제로 운영됩니다. 로그인 하지 않으면 해당 게시판에 접근할 수 없습니다. 자료실 게시판은 모든 파일 업로드를 지원하지만, 최대 1GB까지의 파일만 업로드가 가능합니다. 첨부된 파일은 제가 사용하고 있는 카카오톡 테마입니다. (iOS 전용 카카오톡 테마)','2023-06-09 23:09:31','COL_SOYMILK_CHOCOLATE.ktheme','COL_SOYMILK_CHOCOLATE1.ktheme','/19831049_finalproject/data/upload/board/data_board/COL_SOYMILK_CHOCOLATE1.ktheme'),(2,'발표용 - 이 게시글을 수정해 볼까요? (수정 전)','test','수정 전 내용','2023-06-09 23:11:18',NULL,NULL,'/19831049_finalproject/data/upload/board/data_board/null'),(3,'발표용 - 이 게시글을 삭제해 볼까요?','test','발표용 게시글','2023-06-09 23:11:31',NULL,NULL,'/19831049_finalproject/data/upload/board/data_board/null');
/*!40000 ALTER TABLE `board_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board_tip`
--

DROP TABLE IF EXISTS `board_tip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board_tip` (
  `num` int NOT NULL,
  `title` varchar(30) NOT NULL,
  `writer` varchar(10) NOT NULL,
  `content` text,
  `date` datetime DEFAULT NULL,
  `img_name` text,
  `img_realName` text,
  `img_route` text,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_tip`
--

LOCK TABLES `board_tip` WRITE;
/*!40000 ALTER TABLE `board_tip` DISABLE KEYS */;
INSERT INTO `board_tip` VALUES (1,'경민대학교 꿀팁','경민대','내용입니다.\r\n\r\n이미지 첨부는 Tip 게시판 한정입니다.','2023-06-09 23:04:48','1.png','1.png','/19831049_finalproject/img/upload/board/tip_board/1.png'),(2,'경민대 인근 의정부시 명물 부대찌개 거리','의정부시','의정부에서 제일 오래된 오뎅식당 입니다.','2023-06-09 23:05:31','오뎅식당슬라이드.jpg','오뎅식당슬라이드.jpg','/19831049_finalproject/img/upload/board/tip_board/오뎅식당슬라이드.jpg'),(3,'사진이 없는 게시글은 어떻게 표시될까','발표용','이렇게 표시됩니다','2023-06-09 23:11:52',NULL,NULL,'/19831049_finalproject/img/upload/board/tip_board/null');
/*!40000 ALTER TABLE `board_tip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_anonymous`
--

DROP TABLE IF EXISTS `comment_anonymous`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_anonymous` (
  `post_num` int NOT NULL,
  `writer` varchar(10) DEFAULT NULL,
  `content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_anonymous`
--

LOCK TABLES `comment_anonymous` WRITE;
/*!40000 ALTER TABLE `comment_anonymous` DISABLE KEYS */;
INSERT INTO `comment_anonymous` VALUES (3,'1','프로젝트 해야지 무슨 소리야'),(3,'2','JSP 프로젝트 끝...'),(3,'3','자바 프로젝트는 언제할까'),(2,'1','너는 익명이야'),(1,'1','경민대학교 대나무숲 화이팅'),(1,'2','JSP 활용 기말 프로젝트'),(1,'3','19831049 이민혁'),(1,'4','댓글기능 입니다 (익명 게시판 한정)');
/*!40000 ALTER TABLE `comment_anonymous` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `num` varchar(12) NOT NULL,
  `name` varchar(5) NOT NULL,
  `id` varchar(10) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `tel` varchar(13) NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`num`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('230609110511','테스트계정','test','test','010-2587-6302','m_file@naver.com');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-09 23:14:22
