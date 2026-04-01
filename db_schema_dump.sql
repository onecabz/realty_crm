/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.15-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: realty_newone
-- ------------------------------------------------------
-- Server version	8.4.8

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `law`
--
DROP DATABASE IF EXISTS realty_newone;
CREATE DATABASE realty_newone;
USE realty_newone;

DROP TABLE IF EXISTS `law`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `law` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `right_type` enum('собственность','оперативное управление','постоянное (бессрочное) пользование') DEFAULT NULL COMMENT 'вид иного вещного права',
  `law_registration_date` date DEFAULT NULL COMMENT 'дата регистрации иного вещного права',
  `owner_registration_number` varchar(100) DEFAULT NULL COMMENT 'номер записи о регистрации иного вещного права',
  `owner_right_document` varchar(1000) DEFAULT NULL COMMENT 'документ-основание возникнования иного вещного права',
  `status` enum('действующий','архивный') DEFAULT NULL COMMENT 'статус данной записи: действующий/архивный',
  `status_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'дата установления статуса',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `law`
--

LOCK TABLES `law` WRITE;
/*!40000 ALTER TABLE `law` DISABLE KEYS */;
/*!40000 ALTER TABLE `law` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objects`
--

DROP TABLE IF EXISTS `objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `objects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `object_law_id` bigint unsigned DEFAULT NULL COMMENT 'создать foreign key с id права###########################################',
  `object_owner_id` bigint unsigned DEFAULT NULL COMMENT 'создать foreign key с id права###########################################',
  `kadastr_num` varchar(30) DEFAULT NULL COMMENT 'кадастровый номер',
  `object_type` enum('Здание','Сооружение','Помещение','Земельный участок') DEFAULT NULL COMMENT 'вид объекта',
  `name` varchar(300) DEFAULT NULL,
  `assignment` varchar(100) DEFAULT NULL COMMENT 'назначение/разрешенное использование',
  `space_longness` float DEFAULT '0' COMMENT 'площадь/протяженность',
  `liter` varchar(20) DEFAULT NULL COMMENT 'литера',
  `build_year` year DEFAULT NULL COMMENT 'год завершения строительства/ввода в эксплуатацию',
  `adress` varchar(700) DEFAULT NULL,
  `rnki_number` varchar(12) DEFAULT NULL COMMENT 'РНКИ',
  `carrying_ammount` float DEFAULT '0' COMMENT 'балансовая стоимость',
  `status` enum('действующий','архивный') DEFAULT NULL COMMENT 'статус объекта: действующий/архивный',
  `status_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'дата установления статуса',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kadastr_num` (`kadastr_num`),
  UNIQUE KEY `rnki_number` (`rnki_number`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objects`
--

/*LOCK TABLES `objects` WRITE;
/*!40000 ALTER TABLE `objects` DISABLE KEYS ;
INSERT INTO `objects` VALUES
(1,NULL,NULL,'24:50:0600052:149','Сооружение','Сети канализации','сооружение коммунального хозяйства',286,NULL,2018,'Российская Федерация, Красноярский край, г. Красноярск, Кировский район, от нежилого здания по ул. академика Павлова, 21, стр.1,2,6 до точки врезки','П12000011768',1,'действующий','2026-03-24 03:17:11'),
(2,NULL,NULL,'24:50:0600051:27','Здание','Нежилое здание','Здания спортивных объектов',1505.8,NULL,1970,'Красноярский край, г. Красноярск, ул. академика Павлова, зд. 21, строение 6','П12000004917',5093400,'действующий','2026-03-24 03:17:11'),
(3,NULL,NULL,'24:50:0600052:147','Сооружение','Наружное освещение','сооружение электроэнергетики',528,NULL,2018,'Российская Федерация, Красноярский край, г. Красноярск, Кировский район, от ТП 6/04 кВ до опор уличного освещения в районе нежилого здания по ул. академика Павлова, 21, стр. 1,2,6','П12000011764',1,'действующий','2026-03-24 03:17:11'),
(4,NULL,NULL,'24:50:0600052:146','Сооружение','Подземная кабельная ЛЭП низкого напряжения','сооружение электроэнергетики',295,NULL,2018,'Российская Федерация, Красноярский край, г. Красноярск, Кировский район, от ТП 6/04 кВ до нежилого здания по ул. академика Павлова, 21, стр.1,2,6','П12000011767',1,'действующий','2026-03-24 03:17:11'),
(5,NULL,NULL,'24:50:0600052:142','Сооружение','Наружные сети теплоснабжения','сооружение коммунального хозяйства',233,NULL,2018,'Российская Федерация, Красноярский край, г. Красноярск, от существующей сети в тепловой камере УТ1 по пер. Маяковского до нежилого здания по ул.академика Павлова, 21, стр.1,2,6','П12000011769',1,'действующий','2026-03-24 03:17:11'),
(6,NULL,NULL,'24:50:0600052:143','Сооружение','Региональный центр по регби. Спорткомплекс \"Авангард\" (этап). Трансформаторная подстанция 6/0,4 кВ','сооружение электроэнергетики',58.3,NULL,2018,'Российская Федерация, Красноярский край, г. Красноярск, Кировский район, ул. Павлова, 21, строение 1,2,6','П12000011765',1,'действующий','2026-03-24 03:17:11'),
(7,NULL,NULL,'24:50:0600052:158','Сооружение','Наружные сети водоотведения','сооружение коммунального хозяйства',516,NULL,2018,'Российская Федерация, Красноярский край, г. Красноярск, Кировский район, в районе тренировочного поля до резервуаров 1 и 2 по ул. академика Павлова, 21, стр.1,2,6','П12000012646',0,'действующий','2026-03-24 03:17:11'),
(8,NULL,NULL,'24:50:0600052:144','Сооружение','Наружное электроосвещение спортивных объектов','сооружение электроэнергетики',504,NULL,2018,'Российская Федерация, Красноярский край, г. Красноярск, Кировский район от ТП 6/04 кВ до прожекторных мачт ПМ1-40, ПМ2-40, ПМ3-40, ПМ4-40','П12000011766',1,'действующий','2026-03-24 03:17:11'),
(9,NULL,NULL,'24:50:0600052:150','Сооружение','Наружные сети водоснабжения','сооружение коммунального хозяйства',437,NULL,2018,'Российская Федерация, Красноярский край, г. Красноярск, Кировский район, от точек врезки в существующие городские сети по пер.Маяковского в районе жилого дома ул.Щорса, 23 и по ул. Гастелло до нежилого здания по ул. академика Павлова, 21, стр.1,2,6','П12000011770',1,'действующий','2026-03-24 03:17:11'),
(10,NULL,NULL,'24:50:0600052:148','Сооружение','Региональный центр по регби. Спорткомплекс \"Авангард\" (этап). Западная трибуна','спортивно-оздоровительное сооружение',3013.8,NULL,2018,'Красноярский край, г. Красноярск, Кировский район, ул. Академика Павлова, д. 21, строен. 1,2,6','П12000011763',395229000,'действующий','2026-03-24 03:17:11');
/*!40000 ALTER TABLE `objects` ENABLE KEYS */;
/*UNLOCK TABLES;*/

--
-- Table structure for table `owners`
--

DROP TABLE IF EXISTS `owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `owners` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(400) DEFAULT NULL,
  `inn` bigint DEFAULT NULL,
  `ogrn` bigint DEFAULT NULL,
  `adress` varchar(600) DEFAULT NULL,
  `telephone` bigint DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `status` enum('действующий','архивный') DEFAULT NULL COMMENT 'статус данной записи: действующий/архивный',
  `status_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'дата установления статуса',
  PRIMARY KEY (`id`),
  UNIQUE KEY `inn` (`inn`),
  UNIQUE KEY `ogrn` (`ogrn`),
  UNIQUE KEY `telephone` (`telephone`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owners`
--

LOCK TABLES `owners` WRITE;
/*!40000 ALTER TABLE `owners` DISABLE KEYS */;
INSERT INTO `owners` VALUES
(1,'КГАУ \"РЦСC\"',2466223493,1092468038849,'660064, Красноярский край, Красноярск г, ОСТ-В ОТДЫХА, Д. 8',83912050511,'invest@rcsskrsk.ru','действующий','2026-03-24 03:17:00'),
(2,'КГАУ \"ЦСП\"',2466107345,1032402953296,'660064, Красноярский край, Красноярск г, ОСТ-В ОТДЫХА, Д. 12',83919891082,'mail@krascsp.ru','действующий','2026-03-24 03:17:00'),
(3,'КГАУ \"СШОР ПО РЕГБИ \"ЕНИСЕЙ - СТМ\"',2466084183,1032402940338,'60003, Красноярский край, Красноярск г, АКАДЕМИКА ПАВЛОВА, ЗДАНИЕ 21/СТРОЕНИЕ 1, ПОМЕЩЕНИЕ 3',83912061293,'enisei-stm@yandex.ru','действующий','2026-03-24 03:17:00'),
(4,'КГАУ \"РЦСП \"АКАДЕМИЯ ЛЕТНИХ ВИДОВ СПОРТА\"',2460034669,1022401801674,'660049, Красноярский край, ГОРОД КРАСНОЯРСК, Красноярск г, КРАСНОЯРСК, ПР-КТ МИРА, Д. 37Г',83912369562,'office@akademlvs.ru','действующий','2026-03-24 03:17:00'),
(5,'КГАУ \"РЦСП \"АЗВС\"',2466058338,1022402664020,'660041, Красноярский край, Красноярск г, УЛ БИАТЛОННАЯ, Д. 25Г',83912490955,'info@azvs-krsk.ru','действующий','2026-03-24 03:17:00'),
(6,'КГАПОУ \"ККОР\"',2466041366,1022402661225,'660064, Красноярский край, Красноярск г, ОСТ-В ОТДЫХА, СООР. 15А',83912668524,'reception@kkor24.ru','действующий','2026-03-24 03:17:00'),
(7,'КГАПОУ \"ДКИОР\"',2446001358,1022401254600,'663094, Красноярский край, Дивногорск г, УЛ. ЧКАЛОВА, Д. 3А/1',83914436204,'dkior_priem@mail.ru','действующий','2026-03-24 03:17:00'),
(8,'КГАУ ДО \"СШ\" ЦЕНТР ПО ЛЕДОВЫМ ВИДАМ СПОРТА\"',2465038561,2465038561,'660022, Красноярский край, Красноярск г, УЛ. ПАРТИЗАНА ЖЕЛЕЗНЯКА, Д. 42',83912221989,'lv.sport@yandex.ru','действующий','2026-03-24 03:17:00'),
(9,'КГБУДО \"СШОР ПО САННЫМ ВИДАМ СПОРТА\"',2464017897,1022402310028,'660121, Красноярский край, Красноярск г, УЛ. ЭЛЕКТРИКОВ, Д.170А',83912409935,'sanikrsn@mail.ru','действующий','2026-03-24 03:17:00'),
(10,'КГАУ ДО \"СШОР ПО ХОККЕЮ \"СОКОЛ\"',2465230667,1092468056450,'660112, Красноярский край, Красноярск г, ПР-КТ МЕТАЛЛУРГОВ, Д. 22 Д',83912288811,'ldsokol@mail.ru','действующий','2026-03-24 03:17:00'),
(11,'КГАУ ДО \"СШОР ПО ВОЛЕЙБОЛУ \"ЕНИСЕЙ\" ИМЕНИ Э.А.НОСКОВА\"',2466075372,1032402942880,'660064, Красноярский край, Красноярск г, ОСТ-В ОТДЫХА, Д.15',83912369333,'voley@sshorenisey24.ru','действующий','2026-03-24 03:17:00'),
(12,'КГАУ ДО \"СШОР ПО ФУТБОЛУ \"ЕНИСЕЙ\"',2466226303,1092468056438,'660111, Красноярский край, Красноярск г, УЛ НОВГОРОДСКАЯ, Д. 5/СТР. 7',83912228245,'priem@dfc-enisey.ru','действующий','2026-03-24 03:17:00'),
(13,'КГАУ ДО \"СШОР ПО ХОККЕЮ С МЯЧОМ \"ЕНИСЕЙ\"',2462200030,1072468000043,'660123, Красноярский край, Красноярск г, УЛ. ЮНОСТИ, Д.18',83912269688,'finans-enisey@mail.ru','действующий','2026-03-24 03:17:00'),
(14,'КГБУ ДО \"СШОР ИМЕНИ Б.Х. САЙТИЕВА\"',2466058137,1022402658563,'660005, Красноярский край, ГОРОД КРАСНОЯРСК, Красноярск г, КРАСНОЯРСК, УЛ. БУВАЙСАРА САЙТИЕВА, ЗД. 1',83912179018,'sdushor_pr@stmpkrsk.ru','действующий','2026-03-24 03:17:00'),
(15,'КГАУ \"РЦСП \"АКАДЕМИЯ БОРЬБЫ ИМЕНИ Д.Г.МИНДИАШВИЛИ\"',2466009122,1022402646980,'660049, Красноярский край, Красноярск г, УЛ. МАРКОВСКОГО, Д. 88',83912113868,'shvsmkrk@mail.ru','действующий','2026-03-24 03:17:00'),
(16,'КГАУ РЦСП \"АКАДЕМИЯ БИАТЛОНА\"',2466141843,1062466147479,'660041, Красноярский край, Красноярск г, УЛ БИАТЛОННАЯ, ЗД. 37',83912632680,'info@krasbiatlon.ru','действующий','2026-03-24 03:17:00'),
(17,'КГКУ \"КРАСНОЯРСКИЙ ИНСТИТУТ РАЗВИТИЯ ФИЗИЧЕСКОЙ КУЛЬТУРЫ И СПОРТА\"',2460002787,1022401798011,'660017, Красноярский край, ГОРОД КРАСНОЯРСК, КРАСНОЯРСК, УЛ ОБОРОНЫ, ЗД. 3',83912011546,'ipk_rfk@mail.ru','действующий','2026-03-24 03:17:00');
/*!40000 ALTER TABLE `owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `transaction_type` enum('аренда','безвозмездное пользование','залог','арест','ограничение регистрационных действий') DEFAULT NULL COMMENT 'виды обремений',
  `trans_right_document` varchar(300) DEFAULT NULL COMMENT 'документ-основание возникнования обременения',
  `trans_registration_date` date DEFAULT (curdate()) COMMENT 'дата регистрации обременения',
  `status` enum('действующий','архивный') DEFAULT NULL COMMENT 'статус данной записи: действующий/архивный',
  `status_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'дата установления статуса',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transmission`
--

DROP TABLE IF EXISTS `transmission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `transmission` (
  `owner_id` bigint unsigned DEFAULT NULL COMMENT 'создать foreign key с id права###########################################',
  `object_id` bigint unsigned DEFAULT NULL COMMENT 'создать foreign key с id права###########################################',
  `transaction_id` bigint unsigned DEFAULT NULL COMMENT 'создать foreign key с id права###########################################',
  `law_id` bigint unsigned DEFAULT NULL COMMENT 'создать foreign key с id права###########################################',
  KEY `owner_id` (`owner_id`),
  KEY `object_id` (`object_id`),
  KEY `transaction_id` (`transaction_id`),
  KEY `law_id` (`law_id`),
  CONSTRAINT `transmission_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `owners` (`id`),
  CONSTRAINT `transmission_ibfk_2` FOREIGN KEY (`object_id`) REFERENCES `objects` (`id`),
  CONSTRAINT `transmission_ibfk_3` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`),
  CONSTRAINT `transmission_ibfk_4` FOREIGN KEY (`law_id`) REFERENCES `law` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transmission`
--

LOCK TABLES `transmission` WRITE;
/*!40000 ALTER TABLE `transmission` DISABLE KEYS */;
/*!40000 ALTER TABLE `transmission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'realty_newone'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-26 18:22:50
