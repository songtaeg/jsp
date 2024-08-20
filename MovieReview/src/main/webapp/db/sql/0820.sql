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
  `story` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 moviedb.movies:~7 rows (대략적) 내보내기
INSERT INTO `movies` (`id`, `title`, `director`, `year`, `genre`, `poster_url`, `story`) VALUES
	(1, '조커', '토드 필립스', '2019-10-02', '범죄/드라마/스릴러', 'img/joker.jpg', '“내 인생이 비극인줄 알았는데, 코미디였어”\r\n\r\n고담시의 광대 아서 플렉은 코미디언을 꿈꾸는 남자. 하지만 모두가 미쳐가는 코미디 같은 세상에서 맨 정신으로는 그가 설 자리가 없음을 깨닫게 되는데…\r\n이제껏 본 적 없는 진짜 ‘조커’를 만나라.'),
	(2, '소울', '피트 닥터', '2021-01-20', '애니메이션/코미디/판타지', 'img/soul.jpg', '나는 어떻게 ‘나’로 태어나게 되었을까? 지구에 오기 전 영혼들이 머무는 ‘태어나기 전 세상’이 있다면?\r\n\r\n뉴욕에서 음악 선생님으로 일하던 ‘조’는 꿈에 그리던 최고의 밴드와 재즈 클럽에서 연주하게 된 그 날, 예기치 못한 사고로 영혼이 되어 ‘태어나기 전 세상’에 떨어진다. 탄생 전 영혼들이 멘토와 함께 자신의 관심사를 발견하면 지구 통행증을 발급하는 ‘태어나기 전 세상’. ‘조’는 그 곳에서 유일하게 지구에 가고 싶어하지 않는 시니컬한 영혼 ‘22’의 멘토가 된다. \r\n링컨, 간디, 테레사 수녀도 멘토되길 포기한 영혼 ‘22’. 꿈의 무대에 서려면 ‘22’의 지구 통행증이 필요한 ‘조’. 그는 다시 지구로 돌아가 꿈의 무대에 설 수 있을까?'),
	(3, '서울의 봄', '김성수', '2023-11-22', '드라마', 'img/theday.jpg', '1979년 12월 12일, 수도 서울 군사반란 발생\r\n그날, 대한민국의 운명이 바뀌었다.\r\n\r\n대한민국을 뒤흔든 10월 26일 이후, 서울에 새로운 바람이 불어온 것도 잠시 12월 12일, 보안사령관 전두광이 반란을 일으키고 군 내 사조직을 총동원하여 최전선의 전방부대까지 서울로 불러들인다. 권력에 눈이 먼 전두광의 반란군과 이에 맞선 수도경비사령관 이태신을 비롯한 진압군 사이, 일촉즉발의 9시간이 흘러가는데…\r\n  \r\n목숨을 건 두 세력의 팽팽한 대립\r\n오늘 밤, 대한민국 수도에서 가장 치열한 전쟁이 펼쳐진다!'),
	(4, '극한직업', '이병헌', '2019-01-23', '코미디/액션', 'img/extreme_job.jpg', '불철주야 달리고 구르지만 실적은 바닥, 급기야 해체 위기를 맞는 마약반. 더 이상 물러설 곳이 없는 팀의 맏형 고반장은 국제 범죄조직의 국내 마약 밀반입 정황을 포착하고 장형사, 마형사, 영호, 재훈까지 4명의 팀원들과 함께 잠복 수사에 나선다. \r\n마약반은 24시간 감시를 위해 범죄조직의 아지트 앞 치킨집을 인수해 위장 창업을 하게 되고, 뜻밖의 절대미각을 지닌 마형사의 숨은 재능으로 치킨집은 일약 맛집으로 입소문이 나기 시작한다. \r\n수사는 뒷전, 치킨장사로 눈코 뜰 새 없이 바빠진 마약반에게 어느 날 절호의 기회가 찾아오는데…\r\n\r\n범인을 잡을 것인가, 닭을 잡을 것인가!'),
	(5, '라라랜드', '데이미언 셔젤', '2016-12-07', '드라마/뮤지컬', 'img/lalaland.jpg', '황홀한 사랑, 순수한 희망, 격렬한 열정…\r\n이 곳에서 모든 감정이 폭발한다!\r\n\r\n꿈을 꾸는 사람들을 위한 별들의 도시 ‘라라랜드’. 재즈 피아니스트 ‘세바스찬’(라이언 고슬링)과 성공을 꿈꾸는 배우 지망생 ‘미아’(엠마 스톤). \r\n인생에서 가장 빛나는 순간 만난 두 사람은 미완성인 서로의 무대를 만들어가기 시작한다.'),
	(6, '인사이드아웃2', '켈시 맨', '2024-06-12', '애니메이션/모험/코미디', 'img/insideout2.jpg', '13살이 된 라일리의 행복을 위해 매일 바쁘게 머릿속 감정 컨트롤 본부를 운영하는 ‘기쁨’, ‘슬픔’, ‘버럭’, ‘까칠’, ‘소심’. \r\n그러던 어느 날, 낯선 감정인 ‘불안’, ‘당황’, ‘따분’, ‘부럽’이가 본부에 등장하고, 언제나 최악의 상황을 대비하며 제멋대로인 ‘불안’이와 기존 감정들은 계속 충돌한다. \r\n결국 새로운 감정들에 의해 본부에서 쫓겨나게 된 기존 감정들은 다시 본부로 돌아가기 위해 위험천만한 모험을 시작하는데…\r\n\r\n2024년, 전 세계를 공감으로 물들인 유쾌한 상상이 다시 시작된다!'),
	(7, '기생충', '봉준호', '2019-05-30', '스릴러/블랙 코미디', 'img/parasite.jpg', '“폐 끼치고 싶진 않았어요”\r\n\r\n전원백수로 살 길 막막하지만 사이는 좋은 기택 가족. 장남 기우에게 명문대생 친구가 연결시켜 준 고액 과외 자리는 모처럼 싹튼 고정수입의 희망이다.\r\n 온 가족의 도움과 기대 속에 박사장 집으로 향하는 기우. 글로벌 IT기업 CEO인 박사장의 저택에 도착하자 젊고 아름다운 사모님 연교가 기우를 맞이한다. \r\n 그러나 이렇게 시작된 두 가족의 만남 뒤로, 걷잡을 수 없는 사건이 기다리고 있었으니…');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 moviedb.reviews:~8 rows (대략적) 내보내기
INSERT INTO `reviews` (`review_id`, `movie_id`, `user_id`, `review_text`, `rating`) VALUES
	(1, 6, 'abcd', '나를 사랑하는 나의 모든 감정들 ', 4.5),
	(2, 1, 'efgh', '매력적이면서 위태로운 악인의 탄생 ', 4.2),
	(3, 1, 'abcd', '호아킨 피닉스의 조커', 3.8),
	(4, 4, 'dddd', '웃고 싶을 때 보자! 웃다가 순삭', 3.5),
	(5, 5, 'user1', '이 영화는 꿈꾸는 모든 이들을 위한 영화. ', 4.7),
	(7, 2, 'hello', '당신도 남은 인생 매 순간을 즐기면서 살아가길', 3.9),
	(8, 3, 'hello', '예정된 비극 그래서 더 잊지 말아야하는 이유', 3.6),
	(9, 5, 'abcd', '꿈꾸는 바보들을 위하여', 4.5);

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
	('abcd', '김지연', '12345', '49fdje@naver.com'),
	('dddd', '정성민', '3789', '3jmksd@gmail.com'),
	('efgh', '성해민', '5678', 'gdl35da@naver.com'),
	('hello', '장선재', '2222', 'rjujf452@gmail.com'),
	('user1', '최준', '6843', '2341vsde@naver.com');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
