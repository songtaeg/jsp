-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        8.0.39 - MySQL Community Server - GPL
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- moviedb 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `moviedb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `moviedb`;

-- 테이블 moviedb.movies 구조 내보내기
CREATE TABLE IF NOT EXISTS `movies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `director` varchar(50) DEFAULT NULL,
  `year` date DEFAULT NULL,
  `genre` varchar(50) DEFAULT NULL,
  `poster_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 moviedb.movies:~5 rows (대략적) 내보내기
INSERT INTO `movies` (`id`, `title`, `director`, `year`, `genre`, `poster_url`) VALUES
	(1, '조커', '토드 필립스', '2019-10-02', '범죄/드라마/스릴러', 'img/joker.jpg'),
	(2, '소울', '피트 닥터', '2021-01-20', '애니메이션/코미디/판타지', 'img/soul.jpg'),
	(3, '서울의 봄', '김성수', '2023-11-22', '드라마', 'img/theday.jpg'),
	(4, '극한직업', '이병헌', '2019-01-23', '코미디/액션', 'img/extremejob.jpg'),
	(5, '라라랜드', '데이미언 셔젤', '2016-12-07', '드라마/뮤지컬', 'img/lalaland.jpg');

-- 테이블 moviedb.reviews 구조 내보내기
CREATE TABLE IF NOT EXISTS `reviews` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `movie_id` int DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `review_text` text,
  `rating` float DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `movie_id` (`movie_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `reviews_chk_1` CHECK (((`rating` >= 1.0) and (`rating` <= 5.0)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 moviedb.reviews:~0 rows (대략적) 내보내기

-- 테이블 moviedb.users 구조 내보내기
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pwd` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE KEY `username` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 moviedb.users:~5 rows (대략적) 내보내기
INSERT INTO `users` (`user_id`, `name`, `pwd`, `email`) VALUES
	('abcd', '김', '12345', '49fdje@naver.com'),
	('dddd', '정', '3789', '3jmksd@gmail.com'),
	('efgh', '성', '5678', 'gdl35da@naver.com'),
	('hello', '장', '2222', 'rjujf452@gmail.com'),
	('user1', '최', '6843', '2341vsde@naver.com');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
