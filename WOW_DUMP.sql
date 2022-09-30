-- MariaDB dump 10.19  Distrib 10.5.12-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_23
-- ------------------------------------------------------
-- Server version	10.5.12-MariaDB-cll-lve

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
-- Table structure for table `NPC`
--

DROP TABLE IF EXISTS `NPC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NPC` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('Ally','Enemy','Neutral') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` enum('Common','Rare','Elite') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `race` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lvl` int(10) unsigned NOT NULL,
  `location` bigint(20) unsigned NOT NULL,
  `expansion` int(10) unsigned NOT NULL,
  `fraction_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `race` (`race`),
  KEY `location` (`location`),
  KEY `expansion` (`expansion`),
  KEY `fraction_id` (`fraction_id`),
  CONSTRAINT `NPC_ibfk_1` FOREIGN KEY (`race`) REFERENCES `races` (`id`),
  CONSTRAINT `NPC_ibfk_2` FOREIGN KEY (`location`) REFERENCES `locations` (`id`),
  CONSTRAINT `NPC_ibfk_3` FOREIGN KEY (`expansion`) REFERENCES `expansions` (`id`),
  CONSTRAINT `NPC_ibfk_4` FOREIGN KEY (`fraction_id`) REFERENCES `fractions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NPC`
--

LOCK TABLES `NPC` WRITE;
/*!40000 ALTER TABLE `NPC` DISABLE KEYS */;
INSERT INTO `NPC` VALUES (1,'Enemy','Rare',1,'adipisci',7,1,1,1),(2,'Ally','Common',2,'quas',13,2,2,2),(3,'Ally','Elite',3,'nesciunt',39,3,3,1),(4,'Ally','Rare',4,'omnis',34,4,4,2),(5,'Neutral','Rare',5,'amet',9,5,5,1),(6,'Neutral','Elite',6,'repellendus',28,6,6,2),(7,'Enemy','Common',7,'tenetur',11,7,7,1),(8,'Neutral','Rare',8,'aut',17,8,8,2),(9,'Ally','Elite',9,'laudantium',33,9,9,1),(10,'Ally','Elite',10,'at',62,10,10,2),(11,'Enemy','Rare',11,'fuga',33,11,1,1),(12,'Ally','Elite',1,'voluptates',31,12,2,2),(13,'Ally','Rare',2,'facilis',39,13,3,1),(14,'Neutral','Rare',3,'maiores',59,14,4,2),(15,'Ally','Common',4,'sunt',45,15,5,1),(16,'Neutral','Elite',5,'rerum',35,16,6,2),(17,'Neutral','Elite',6,'quae',47,17,7,1),(18,'Neutral','Rare',7,'porro',3,18,8,2),(19,'Neutral','Elite',8,'in',44,19,9,1),(20,'Ally','Common',9,'sed',29,20,10,2);
/*!40000 ALTER TABLE `NPC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 0,
  `achievements` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`achievements`)),
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'rae.hagenes','halle04@example.com','94be8c98efe9ae069649fa918d5094628d97c3e8','2018-09-29',1,NULL),(2,'kcormier','aufderhar.elvie@example.org','95a4ffabbcef87d814b52b6a26f53e883a8ac4b9','2013-09-11',1,NULL),(3,'giles44','bsmitham@example.com','846e88357716e4f2386b33bd985ec9c6f2c70c13','1978-01-09',1,NULL),(4,'greg.dach','erin.kozey@example.org','d49eadcb235409013fa270e3206e65d245e9523b','1978-09-20',1,NULL),(5,'qwest','aubree52@example.com','008c5b7b653eebdf2f0627e50058fd9636b24d3f','2011-02-07',1,NULL),(6,'kaleb20','javier.aufderhar@example.com','1a8ef21fb10904670775d8873e234422b903d242','2002-08-16',0,NULL),(7,'jmclaughlin','dooley.golda@example.org','7a1e466d93d3c1ba5fe74bc44ce4830a27022283','1985-07-24',1,NULL),(8,'hkris','rex.borer@example.net','1e72bcd333e917f50eaee8efb197b766888f394f','1993-03-19',0,NULL),(9,'garfield42','darrick26@example.net','cdfa8e33d7c94a32cf0cb376bcafb93aee5658ef','1975-02-02',0,NULL),(10,'robel.sven','cleffler@example.org','7d9491b05911d400d6ddb6c84f54c9839365983d','2016-08-07',0,NULL),(11,'schumm.rasheed','nwintheiser@example.com','471f717c2834507d37b0d1280b4ddc36bb9c7de6','2019-10-21',0,NULL),(12,'flindgren','egraham@example.com','6e1d286e80041c939261b3e7cbc7a0e8b735486f','2021-12-19',0,NULL),(13,'laurel47','heathcote.abby@example.com','e6213e43cb915b2edc33a6bb132a7244d115d1d3','1977-09-08',0,NULL),(14,'leland05','rippin.sonia@example.org','5a14365aa78327c7406bd0718996a83be750e897','2017-07-16',1,NULL),(15,'runolfsson.edwina','efahey@example.net','be62fc5d1342e0de2c43f077a9131bc74ceb9e83','2016-07-24',1,NULL),(16,'towne.estella','louie21@example.org','d9f3a454f0fafab5d4b735706e1c1537a08eb3a2','2012-07-31',0,NULL),(17,'bogan.justyn','upton.alessandro@example.org','3c818906b245baa153b54faac88d5cf8939c9c3f','2016-04-03',1,NULL),(18,'bjast','tabitha.bauch@example.org','c11678b8561c009fbfbd38cf179eab1f9094dafe','1972-04-17',0,NULL),(19,'jaida15','nhane@example.org','f010ce6d6f13025f9a6fdb28437126f07247f5e7','2020-02-29',0,NULL),(20,'stan.king','jany43@example.org','665b58b9929f6ad5fbd8feea43139899fd4b97e9','1993-08-06',0,NULL);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `achievements`
--

DROP TABLE IF EXISTS `achievements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `achievements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requirements` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `achievement_type` enum('Character','Quests','Research','PVP','Dungeons&Raids','Professions','Reputation','Events','Pet battles','Collections','Special content','Great feats','Legacy') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `achieved_at` date DEFAULT NULL,
  `reward` bigint(20) unsigned NOT NULL,
  `expansion` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `idx_achievements_type` (`achievement_type`),
  KEY `expansion` (`expansion`),
  KEY `reward` (`reward`),
  CONSTRAINT `achievements_ibfk_1` FOREIGN KEY (`expansion`) REFERENCES `expansions` (`id`),
  CONSTRAINT `achievements_ibfk_2` FOREIGN KEY (`reward`) REFERENCES `items` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievements`
--

LOCK TABLES `achievements` WRITE;
/*!40000 ALTER TABLE `achievements` DISABLE KEYS */;
INSERT INTO `achievements` VALUES (1,'enim',NULL,0,'Dungeons&Raids','1997-09-30',1,1),(2,'veritatis',NULL,0,'Character','1980-07-09',2,2),(3,'optio',NULL,1,'Legacy','1984-04-09',3,3),(4,'cupiditate',NULL,1,'Legacy','2014-07-16',4,4),(5,'facere',NULL,0,'Special content','1994-10-09',5,5),(6,'non',NULL,1,'Events','1981-02-17',6,6),(7,'et',NULL,1,'Research','1986-05-26',7,7),(8,'consectetur',NULL,0,'Events','1980-08-19',8,8),(9,'ab',NULL,1,'Dungeons&Raids','2016-04-22',9,9),(10,'rerum',NULL,0,'Quests','2010-11-21',10,10),(11,'sapiente',NULL,0,'Quests','1971-04-08',11,1),(12,'fugit',NULL,1,'Events','2016-05-17',12,2),(13,'ullam',NULL,0,'Dungeons&Raids','2009-10-27',13,3),(14,'aliquid',NULL,0,'Professions','1987-09-27',14,4),(15,'earum',NULL,1,'Special content','1984-03-27',15,5),(16,'repellendus',NULL,1,'Special content','2001-05-13',16,6),(17,'in',NULL,1,'Quests','2002-04-24',17,7),(18,'minus',NULL,0,'Great feats','2010-10-10',18,8),(19,'reprehenderit',NULL,0,'Events','2007-11-18',19,9),(20,'sit',NULL,1,'Great feats','2008-07-20',20,10);
/*!40000 ALTER TABLE `achievements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arenas`
--

DROP TABLE IF EXISTS `arenas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arenas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expansion` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `expansion` (`expansion`),
  CONSTRAINT `arenas_ibfk_1` FOREIGN KEY (`expansion`) REFERENCES `expansions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arenas`
--

LOCK TABLES `arenas` WRITE;
/*!40000 ALTER TABLE `arenas` DISABLE KEYS */;
INSERT INTO `arenas` VALUES (1,'Ashamane\'s Fall',7),(2,'Black Rook Hold Arena',7),(3,'Blade\'s Edge Arena',2),(4,'Dalaran Arena',3),(5,'Empyrean Domain',9),(6,'Enigma Arena',9),(7,'Kul Tiras Arena',8),(8,'Maldrazzus Arena',9),(9,'Mugambala',8),(10,'Nagrand Arena',2),(11,'Ruins of Lordaeron',2),(12,'Shado-Pan Showdown',5),(13,'The Robodrome',8),(14,'The Tiger\'s Peak',5),(15,'Tol\'Viron Arena',4);
/*!40000 ALTER TABLE `arenas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `armor`
--

DROP TABLE IF EXISTS `armor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `armor` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `armor_type` int(10) unsigned NOT NULL,
  `item_id` bigint(20) unsigned NOT NULL,
  `stats` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`stats`)),
  `required_lvl` int(10) unsigned DEFAULT NULL,
  `drop_from` bigint(20) unsigned NOT NULL,
  `drop_chance` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `armor_type` (`armor_type`),
  KEY `item_id` (`item_id`),
  KEY `drop_from` (`drop_from`),
  CONSTRAINT `armor_ibfk_1` FOREIGN KEY (`armor_type`) REFERENCES `armor_types` (`id`),
  CONSTRAINT `armor_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  CONSTRAINT `armor_ibfk_3` FOREIGN KEY (`drop_from`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `armor`
--

LOCK TABLES `armor` WRITE;
/*!40000 ALTER TABLE `armor` DISABLE KEYS */;
INSERT INTO `armor` VALUES (1,'totam',1,1,NULL,38,1,42),(2,'eveniet',2,2,NULL,58,2,72),(3,'dolore',3,3,NULL,23,3,62),(4,'quis',4,4,NULL,11,4,2),(5,'impedit',5,5,NULL,31,5,50),(6,'quibusdam',6,6,NULL,9,6,27),(7,'voluptates',7,7,NULL,44,7,34),(8,'laboriosam',8,8,NULL,16,8,39),(9,'et',9,9,NULL,7,9,11),(10,'dolorum',10,10,NULL,3,10,8),(11,'molestias',11,11,NULL,18,11,94),(12,'incidunt',12,12,NULL,54,12,98),(13,'atque',13,13,NULL,53,13,93),(14,'ea',14,14,NULL,36,14,79),(15,'qui',15,15,NULL,55,15,51),(16,'nesciunt',16,16,NULL,48,16,23),(17,'tenetur',17,17,NULL,36,17,44),(18,'aperiam',18,18,NULL,29,18,99),(19,'laborum',19,19,NULL,57,19,66),(20,'necessitatibus',20,20,NULL,8,20,6);
/*!40000 ALTER TABLE `armor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `armor_types`
--

DROP TABLE IF EXISTS `armor_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `armor_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` enum('Cloth','Leather','Mail','Plate','Jewelry','Other') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `armor_types`
--

LOCK TABLES `armor_types` WRITE;
/*!40000 ALTER TABLE `armor_types` DISABLE KEYS */;
INSERT INTO `armor_types` VALUES (1,'Chest','Cloth'),(2,'Feet','Cloth'),(3,'Hands','Cloth'),(4,'Head','Cloth'),(5,'Legs','Cloth'),(6,'Shoulder','Cloth'),(7,'Waist','Cloth'),(8,'Wrist','Cloth'),(9,'Chest','Leather'),(10,'Feet','Leather'),(11,'Hands','Leather'),(12,'Head','Leather'),(13,'Legs','Leather'),(14,'Shoulder','Leather'),(15,'Waist','Leather'),(16,'Wrist','Leather'),(17,'Chest','Mail'),(18,'Feet','Mail'),(19,'Hands','Mail'),(20,'Head','Mail'),(21,'Legs','Mail'),(22,'Shoulder','Mail'),(23,'Waist','Mail'),(24,'Wrist','Mail'),(25,'Chest','Plate'),(26,'Feet','Plate'),(27,'Hands','Plate'),(28,'Head','Plate'),(29,'Legs','Plate'),(30,'Shoulder','Plate'),(31,'Waist','Plate'),(32,'Wrist','Plate'),(33,'Amulet','Jewelry'),(34,'Ring','Jewelry'),(35,'Trinket','Jewelry'),(36,'Cloak','Other'),(37,'Off-Hand Frill','Other'),(38,'Shield','Other'),(39,'Shirt','Other'),(40,'Tabard','Other'),(41,'Cosmetic','Other'),(42,'Miscellaneous','Other');
/*!40000 ALTER TABLE `armor_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `battlegrounds`
--

DROP TABLE IF EXISTS `battlegrounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battlegrounds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lvl` int(10) unsigned NOT NULL,
  `number_of_players` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expansion` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `expansion` (`expansion`),
  CONSTRAINT `battlegrounds_ibfk_1` FOREIGN KEY (`expansion`) REFERENCES `expansions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battlegrounds`
--

LOCK TABLES `battlegrounds` WRITE;
/*!40000 ALTER TABLE `battlegrounds` DISABLE KEYS */;
INSERT INTO `battlegrounds` VALUES (1,'Strand of the Ancients',10,'15v15',3),(2,'Warsong Gulch',10,'10v10',1),(3,'Alterac Valley',20,'40v40',1),(4,'Ashran',20,'25v25',6),(5,'Isle of Conquest',20,'25v25',3),(6,'The Battle for Gilneas',20,'10v10',4),(7,'Twin Peaks',30,'10v10',4),(8,'Seething Shore',50,'10v10',7),(9,'Arathi Basin',50,'15v15',1),(10,'Deepwind Gorge',50,'15v15',5),(11,'Eye of the Storm',50,'15v15',2),(12,'Silvershard Mines',50,'15v15',5),(13,'Temple of Kotmogu',50,'10v10',5),(14,'Wintergrasp',50,'40v40',3);
/*!40000 ALTER TABLE `battlegrounds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fraction` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `fraction` (`fraction`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`fraction`) REFERENCES `fractions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Boralus',1),(2,'Darnassus',1),(3,'Ironforge',1),(4,'Shrine of Seven Stars',1),(5,'Stormshield',1),(6,'Stormwind City',1),(7,'The Expdar',1),(8,'Dazar\'Alor',2),(9,'Orgrimmar',2),(10,'Shrine of Two Moons',2),(11,'Silvermoon City',2),(12,'Thunder Bluff',2),(13,'Undercity',2),(14,'Warspear',2),(15,'Dalaran',NULL),(16,'Dalaran (Legion)',NULL),(17,'Oribos',NULL),(18,'Shattrath City',NULL);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_halls`
--

DROP TABLE IF EXISTS `class_halls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_halls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `class` (`class`),
  CONSTRAINT `class_halls_ibfk_1` FOREIGN KEY (`class`) REFERENCES `classes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_halls`
--

LOCK TABLES `class_halls` WRITE;
/*!40000 ALTER TABLE `class_halls` DISABLE KEYS */;
INSERT INTO `class_halls` VALUES (1,'Acherus: The Ebon Hold',1),(2,'Chamber of Shadows',9),(3,'Dreadscar Rift',11),(4,'Hall of the Guardian',5),(5,'Netherlight Temple',8),(6,'Sanctum of Light',7),(7,'Skyhold',12),(8,'Temple of Five Dawns',6),(9,'The Dreamgrove',3),(10,'The Fell Hammer',2),(11,'The Maelstorm',10),(12,'Trueshot Lodge',4);
/*!40000 ALTER TABLE `class_halls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class_color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_of_armor` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `specializations` int(10) unsigned NOT NULL DEFAULT 3,
  `resources` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `resources` (`resources`),
  CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`resources`) REFERENCES `resources` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,'Death Knight','Red','Plate',3,16),(2,'Demon Hunter','Magenta','Leather',2,13),(3,'Druid','Orange','Leather',4,12),(4,'Hunter','Emerald','Mail',3,6),(5,'Mage','Azure','Cloth',3,12),(6,'Monk','Green','Leather',3,3),(7,'Paladin','Pink','Plate',3,9),(8,'Priest','White','Cloth',3,12),(9,'Rogue','Yellow','Leather',3,4),(10,'Shaman','Blue','Mail',3,11),(11,'Warlock','Purple','Cloth',3,17),(12,'Warrior','Brown','Plate',3,14);
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `continents`
--

DROP TABLE IF EXISTS `continents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `continents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expansion` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `expansion` (`expansion`),
  CONSTRAINT `continents_ibfk_1` FOREIGN KEY (`expansion`) REFERENCES `expansions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `continents`
--

LOCK TABLES `continents` WRITE;
/*!40000 ALTER TABLE `continents` DISABLE KEYS */;
INSERT INTO `continents` VALUES (1,'The Shadowlands',9),(2,'Kul Tiras',8),(3,'Zandalar',8),(4,'Broken Isles',7),(5,'Draenor',6),(6,'Pandaria',5),(7,'The Maelstrom',5),(8,'Northrend',3),(9,'Outland',2),(10,'Eastern Kingdoms',1),(11,'Kalimdor',1);
/*!40000 ALTER TABLE `continents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expansion` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `expansion` (`expansion`),
  CONSTRAINT `currency_ibfk_1` FOREIGN KEY (`expansion`) REFERENCES `expansions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES (1,'Bronze',1),(2,'Silver',1),(3,'Gold',1),(4,'Spirit Shard',2),(5,'Champion\'s Seal',3),(6,'Dalaran Jewelcrafter\'s Token',3),(7,'Mark of the World Tree',4),(8,'Illustrious Jewelcrafter\'s Token',4),(9,'Mote of Darkness',4),(10,'Essence of the Corrupted Deathwing',4),(11,'Elder Charm of Good Fortune',5),(12,'Lesser Charm of Good Fortune',5),(13,'Timeless Coin',5),(14,'Mogu Rune of Fate',5),(15,'Bloody Coin',5),(16,'Warforged Seal',5),(17,'Apexis Crystal',6),(18,'Garrison Resources',6),(19,'Oil',6),(20,'Dingy Iron Coins',6),(21,'Seal of Tempered Fate',6),(22,'Seal of Inevitable Fate',6),(23,'Artifact Fragment',6),(24,'Curious Coin',7),(25,'Sightless Eye',7),(26,'Coins of Air',7),(27,'Veiled Argunite',7),(28,'Neithershard',7),(29,'Wakening Essence',7),(30,'Ancient Mana',7),(31,'Order Resources',7),(32,'Seal of Broken Fate',7),(33,'Legionfall War Supplies',7),(34,'Lingering Soul Fragment',7),(35,'Echoes of Battle',7),(36,'Echoes of Domination',7),(37,'Timeworn Artifact',7),(38,'Felessence',7),(39,'Shadowy Coins',7),(40,'Seafarer\'s Dubloon',8),(41,'Honorbound Service Medal',8),(42,'7th Legion Service Medal',8),(43,'Corrupted Mementos',8),(44,'War Resources',8),(45,'Seal of Warton Fate',8),(46,'Prismatic Manapearl',8),(47,'Coalescing Visions',8),(48,'Echoes of Ny\'alotha',8),(49,'Brawler\'s Gold',8),(50,'Titan Residuum',8),(51,'Rich Azerite Fragment',8),(52,'War Supplies',8),(53,'Progenitor Shard',8),(54,'Cosmic Flux',9),(55,'Soul Cinders',9),(56,'Grateful Offering',9),(57,'Valor',9),(58,'Cyphers of the First Ones',9),(59,'Stygia',9),(60,'Soul Ash',9),(61,'Infused Ruby',9),(62,'Reservoir Anima',9),(63,'Tower Knowledge',9),(64,'Sinstone Fragments',9),(65,'Cataloged Research',9),(66,'Medallion of Service',9),(67,'Argent Commendation',9),(68,'Stygian Ember',9),(69,'Renown-Venthyr',9),(70,'Renown-Kyrian',9),(71,'Renown-NightFae',9),(72,'Renown-Necrolord',9);
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dungeons`
--

DROP TABLE IF EXISTS `dungeons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dungeons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` bigint(20) unsigned NOT NULL,
  `expansion` int(10) unsigned NOT NULL,
  `boss` bigint(20) unsigned NOT NULL,
  `loot` bigint(20) unsigned NOT NULL,
  `quests` bigint(20) unsigned NOT NULL,
  `required_level` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `location` (`location`),
  KEY `expansion` (`expansion`),
  KEY `boss` (`boss`),
  KEY `quests` (`quests`),
  CONSTRAINT `dungeons_ibfk_1` FOREIGN KEY (`location`) REFERENCES `locations` (`id`),
  CONSTRAINT `dungeons_ibfk_2` FOREIGN KEY (`expansion`) REFERENCES `expansions` (`id`),
  CONSTRAINT `dungeons_ibfk_3` FOREIGN KEY (`boss`) REFERENCES `NPC` (`id`),
  CONSTRAINT `dungeons_ibfk_4` FOREIGN KEY (`quests`) REFERENCES `quests` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dungeons`
--

LOCK TABLES `dungeons` WRITE;
/*!40000 ALTER TABLE `dungeons` DISABLE KEYS */;
INSERT INTO `dungeons` VALUES (1,'voluptatem',1,1,1,1,1,45),(2,'enim',2,2,2,2,2,39),(3,'eum',3,3,3,3,3,56),(4,'non',4,4,4,4,4,26),(5,'harum',5,5,5,5,5,16),(6,'magni',6,6,6,6,6,35),(7,'est',7,7,7,7,7,30),(8,'rerum',8,8,8,8,8,19),(9,'voluptate',9,9,9,9,9,38),(10,'et',10,10,10,10,10,42),(11,'corrupti',11,1,11,11,11,24),(12,'consectetur',12,2,12,12,12,45),(13,'sit',13,3,13,13,13,28),(14,'nisi',14,4,14,14,14,10),(15,'nemo',15,5,15,15,15,51),(16,'commodi',16,6,16,16,16,38),(17,'delectus',17,7,17,17,17,54),(18,'nam',18,8,18,18,18,27),(19,'architecto',19,9,19,19,19,34),(20,'quisquam',20,10,20,20,20,41);
/*!40000 ALTER TABLE `dungeons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starting_at` datetime DEFAULT NULL,
  `ending_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'Brewfest','2022-09-20 10:00:00','2022-10-06 10:00:00'),(2,'Children\'s Week','2023-05-01 10:00:00','2023-05-08 10:00:00'),(3,'Day of the Dead','2022-11-01 11:00:00','2022-11-03 11:00:00'),(4,'Feast of Winter Veil','2022-12-16 10:00:00','2023-01-02 06:00:00'),(5,'Fireworks Spectacular','2023-07-04 10:00:00','2023-07-05 04:00:00'),(6,'Hallow\'s End','2022-10-18 10:00:00','2022-11-01 11:00:00'),(7,'Harvest Festival','2022-09-06 10:00:00','2022-09-13 10:00:00'),(8,'Love is in the Air','2023-02-06 10:00:00','2023-02-20 10:00:00'),(9,'Lunar Festival','2023-01-20 10:00:00','2023-02-03 10:00:00'),(10,'Midsummer Fire Festival','2023-06-21 10:00:00','2023-07-05 10:00:00'),(11,'Noblegarden','2023-04-10 10:00:00','2023-04-17 10:00:00'),(12,'Piligrim\'s Bounty','2022-11-22 10:00:00','2022-11-29 09:00:00'),(13,'Pirate\'s Day','2022-09-19 10:00:00','2022-09-20 10:00:00');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expansions`
--

DROP TABLE IF EXISTS `expansions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expansions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lvl` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `started_at` date DEFAULT NULL,
  `ended_at` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expansions`
--

LOCK TABLES `expansions` WRITE;
/*!40000 ALTER TABLE `expansions` DISABLE KEYS */;
INSERT INTO `expansions` VALUES (1,'Classic','1-30','2004-11-24','2007-01-01'),(2,'The Burning Crusade','10-30','2007-01-16','2008-11-01'),(3,'Wrath of the Lich King','10-30','2008-11-13','2010-12-01'),(4,'Cataclysm','30-35','2010-12-07','2012-09-01'),(5,'Mists of Pandaria','10-35','2012-09-25','2014-10-01'),(6,'Warlords of Draenor','10-40','2014-10-13','2016-08-01'),(7,'Legion','10-45','2016-08-30','2018-08-01'),(8,'Battle for Azeroth','10-50','2018-08-14','2020-11-01'),(9,'Shadowlands','50-60','2020-11-23',NULL),(10,'Dragonflight','60-70',NULL,NULL);
/*!40000 ALTER TABLE `expansions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fractions`
--

DROP TABLE IF EXISTS `fractions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fractions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fractions`
--

LOCK TABLES `fractions` WRITE;
/*!40000 ALTER TABLE `fractions` DISABLE KEYS */;
INSERT INTO `fractions` VALUES (1,'Alliance'),(2,'Horde');
/*!40000 ALTER TABLE `fractions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guilds`
--

DROP TABLE IF EXISTS `guilds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guilds` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `leader` bigint(20) unsigned NOT NULL,
  `fraction` int(10) unsigned NOT NULL,
  `population` bigint(20) unsigned NOT NULL,
  `realm` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `fraction` (`fraction`),
  KEY `leader` (`leader`),
  KEY `realm` (`realm`),
  CONSTRAINT `guilds_ibfk_1` FOREIGN KEY (`fraction`) REFERENCES `fractions` (`id`),
  CONSTRAINT `guilds_ibfk_2` FOREIGN KEY (`leader`) REFERENCES `heroes` (`id`),
  CONSTRAINT `guilds_ibfk_3` FOREIGN KEY (`realm`) REFERENCES `realms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guilds`
--

LOCK TABLES `guilds` WRITE;
/*!40000 ALTER TABLE `guilds` DISABLE KEYS */;
INSERT INTO `guilds` VALUES (1,'et',1,1,2212,1),(2,'dolorem',2,2,944,2),(3,'quas',3,1,778,3),(4,'porro',4,2,223,4),(5,'facilis',5,1,555,5),(6,'reiciendis',6,2,2475,6),(7,'nihil',7,1,2477,7),(8,'maiores',8,2,1563,8),(9,'unde',9,1,15,9),(10,'voluptas',10,2,814,10),(11,'ex',11,1,2489,11),(12,'illo',12,2,670,12),(13,'iure',13,1,2219,13),(14,'tenetur',14,2,1208,14),(15,'ullam',15,1,807,15),(16,'perspiciatis',16,2,1723,16),(17,'enim',17,1,2072,17),(18,'ea',18,2,291,18),(19,'consequatur',19,1,2457,19),(20,'dolor',20,2,1092,20);
/*!40000 ALTER TABLE `guilds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `heroes`
--

DROP TABLE IF EXISTS `heroes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `heroes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` int(10) unsigned NOT NULL,
  `gender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner` bigint(20) unsigned NOT NULL,
  `lvl` int(10) unsigned NOT NULL,
  `race` int(10) unsigned NOT NULL,
  `fraction` int(10) unsigned NOT NULL,
  `realm` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `idx_of_name` (`name`,`realm`),
  KEY `class` (`class`),
  KEY `owner` (`owner`),
  KEY `fraction` (`fraction`),
  KEY `fk_playable_race` (`race`),
  CONSTRAINT `fk_playable_race` FOREIGN KEY (`race`) REFERENCES `playable_races` (`id`),
  CONSTRAINT `heroes_ibfk_1` FOREIGN KEY (`class`) REFERENCES `classes` (`id`),
  CONSTRAINT `heroes_ibfk_2` FOREIGN KEY (`owner`) REFERENCES `accounts` (`id`),
  CONSTRAINT `heroes_ibfk_3` FOREIGN KEY (`fraction`) REFERENCES `fractions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heroes`
--

LOCK TABLES `heroes` WRITE;
/*!40000 ALTER TABLE `heroes` DISABLE KEYS */;
INSERT INTO `heroes` VALUES (1,'consequatur',1,'M',1,53,1,1,1),(2,'et',2,'F',2,24,2,2,2),(3,'molestiae',3,'F',3,60,3,1,3),(4,'eveniet',4,'F',4,42,4,2,4),(5,'facilis',5,'M',5,12,5,1,5),(6,'sed',6,'F',6,43,6,2,6),(7,'incidunt',7,'F',7,51,7,1,7),(8,'omnis',8,'M',8,23,8,2,8),(9,'quo',9,'F',9,40,9,1,9),(10,'recusandae',10,'M',10,20,10,2,10),(11,'repellat',11,'F',11,32,11,1,11),(12,'explicabo',12,'M',12,21,12,2,12),(13,'eum',1,'F',13,17,13,1,13),(14,'unde',2,'F',14,53,14,2,14),(15,'error',3,'F',15,6,15,1,15),(16,'accusantium',4,'M',16,54,16,2,16),(17,'est',5,'M',17,14,17,1,17),(18,'veritatis',6,'F',18,6,18,2,18),(19,'eaque',7,'F',19,4,19,1,19),(20,'sapiente',8,'F',20,32,20,2,20);
/*!40000 ALTER TABLE `heroes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hunter_pets`
--

DROP TABLE IF EXISTS `hunter_pets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hunter_pets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` enum('Cunning','Ferocity','Tenacity') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lvl` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abilities` bigint(20) unsigned DEFAULT NULL,
  `diet` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_exotic` bit(1) DEFAULT b'0',
  `expansion` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `abilities` (`abilities`),
  KEY `expansion` (`expansion`),
  CONSTRAINT `hunter_pets_ibfk_1` FOREIGN KEY (`abilities`) REFERENCES `spells` (`id`),
  CONSTRAINT `hunter_pets_ibfk_2` FOREIGN KEY (`expansion`) REFERENCES `expansions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hunter_pets`
--

LOCK TABLES `hunter_pets` WRITE;
/*!40000 ALTER TABLE `hunter_pets` DISABLE KEYS */;
INSERT INTO `hunter_pets` VALUES (1,'Raptor','Cunning','4-52',NULL,'Meat','\0',1),(2,'Aqiri','Cunning','19-52',NULL,'Meat, Fungus','',3),(3,'Hound','Cunning','5-62',NULL,'Meat, Cheese, Fish, Bread, Fungus, Fruit','\0',4),(4,'Mechanical','Cunning',NULL,NULL,NULL,'\0',5),(5,'Hyena','Cunning','12-50',NULL,'Meat','\0',1),(6,'Serpent','Cunning','1-60',NULL,'Meat','\0',1),(7,'Bird of Prey','Cunning','1-61',NULL,'Meat, Fish','\0',1),(8,'Shale Beast','Cunning','1-61',NULL,'Meat, Fish, Raw Meat, Raw Fish','',4),(9,'Fox','Cunning','3-60',NULL,'Meat, Fish, Fruit','\0',4),(10,'Pterrodax','Cunning','10-50',NULL,'Meat, Fish, Fruit, Raw Meat, Raw Fish','',8),(11,'Rodent','Cunning','3-62',NULL,'Fungus','\0',5),(12,'Boar','Cunning','1-60',NULL,'Meat, Fish, Cheese, Bread, Fungus, Fruit','\0',1),(13,'Water Strider','Cunning','7-60',NULL,'Fungus, Fruit','',5),(14,'Gruffhorn','Cunning','3-60',NULL,'Meat, Fish, Cheese, Bread, Fungus, Fruit, Raw Meat, Raw, Fish','\0',5),(15,'Basilisk','Cunning','10-60',NULL,'Meat, Fish','\0',5),(16,'Warp Stalker','Cunning','19-50',NULL,'Fish, Fruit','\0',2),(17,'Sporebat','Cunning','10-60',NULL,'Cheese, Bread, Fungus, Fruit','\0',2),(18,'Moth','Cunning','1-61',NULL,'Cheese, Bread, Fungus, Fruit','\0',3),(19,'Monkey','Cunning','7-61',NULL,'Fungus, Fruit','\0',4),(20,'Camel','Cunning','30-50',NULL,'Bread, Fungus, Fruit','\0',9),(21,'Core Hound','Ferocity','30-60',NULL,'Meat','',3),(22,'Devilsaur','Ferocity','20-51',NULL,'Meat','',3),(23,'Wolf','Ferocity','1-60',NULL,'Meat','\0',1),(24,'Clefthoof','Ferocity','12-50',NULL,'Cheese, Bread, Fungus, Fruit','\0',6),(25,'Ravager','Ferocity','11-60',NULL,'Meat','\0',2),(26,'Cat','Ferocity','1-60',NULL,'Meat, Fish','\0',1),(27,'Scalehide','Ferocity','6-60',NULL,'Cheese, Bread, Fungus, Fruit','\0',7),(28,'Chimaera','Ferocity','17-62',NULL,'Meat','',3),(29,'Wasp','Ferocity','1-61',NULL,'Cheese, Bread, Fungus, Fruit','\0',3),(30,'Courser','Ferocity','5-62',NULL,'Fungus, Fruit','\0',9),(31,'Gorilla','Ferocity','19-51',NULL,'Bread, Fungus, Fruit','\0',1),(32,'Wind Serpent','Ferocity','14-61',NULL,'Fish, Cheese, Bread','\0',1),(33,'Carrion Bird','Ferocity','5-61',NULL,'Meat, Fish','\0',1),(34,'Scorpid','Ferocity','2-60',NULL,'Meat','\0',1),(35,'Spider','Ferocity','1-62',NULL,'Meat','\0',1),(36,'Bat','Ferocity','4-61',NULL,'Meat, Fungus, Fruit','\0',1),(37,'Ray','Ferocity','11-60',NULL,'Meat, Fungus','\0',2),(38,'Crocolisk','Ferocity','9-60',NULL,'Meat, Fish','\0',1),(39,'Tallstrider','Ferocity','5-46',NULL,'Cheese, Bread, Fungus, Fruit','\0',1),(40,'Spirit Beast','Tenacity','22-60',NULL,'Meat, Fish','',3),(41,'Stone Hound','Tenacity','11-62',NULL,'Meat, Fish, Raw Meat, Raw Fish','',5),(42,'Turtle','Tenacity','7-60',NULL,'Fish, Bread, Fungus, Fruit','\0',1),(43,'Direhorn','Tenacity','20-50',NULL,'Fungus, Fruit','\0',6),(44,'Hydra','Tenacity','11-52',NULL,'Meat, Fish, Raw Meat, Raw Fish','\0',6),(45,'Bear','Tenacity','6-60',NULL,'Meat, Fish, Cheese, Bread, Fungus, Fruit','\0',1),(46,'Lizard','Tenacity','11-60',NULL,'Meat, Fish, Fungus, Fruit, Raw Meat, Raw Fish','\0',8),(47,'Feathermane','Tenacity','9-60',NULL,'Meat, Fish, Cheese, Bread, Fungus, Fruit, Raw Meat, Raw Fish','\0',7),(48,'Blood Beast','Tenacity','11-52',NULL,'Meat, Fish, Raw Meat, Raw Fish','\0',8),(49,'Riverbeast','Tenacity','20-61',NULL,'Bread, Fungus, Fruit','\0',6),(50,'Crab','Tenacity','1-60',NULL,'Fish, Bread, Fungus, Fruit','\0',1),(51,'Carapid','Tenacity','11-61',NULL,'Meat, Raw Meat','',8),(52,'Mammoth','Tenacity','19-48',NULL,'Cheese, Bread, Fungus, Fruit','\0',9),(53,'Dragonhawk','Tenacity','5-35',NULL,'Meat, Fish, Fruit','\0',2),(54,'Worm','Tenacity','11-60',NULL,'Cheese, Bread, Fungus','',3),(55,'Stag','Tenacity','11-61',NULL,'Cheese, Bread, Fungus, Fruit','\0',6),(56,'Crane','Tenacity','6-61',NULL,'Fish, Bread, Raw Fish','\0',5),(57,'Oxen','Tenacity','17-60',NULL,'Cheese, Bread, Fungus, Fruit','\0',7),(58,'Toad','Tenacity','10-61',NULL,'Meat, Fish, Fungus, Fruit, Raw Meat, Raw Fish','\0',8),(59,'Beetle','Tenacity','14-61',NULL,'Fungus, Fruit','\0',4);
/*!40000 ALTER TABLE `hunter_pets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('Weapon','Armor','Bags','Expendable','Symbols','Household','Recepies','Gems','Other','Quests','Keys') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `drop_from` bigint(20) unsigned NOT NULL,
  `drop_chance` int(10) unsigned DEFAULT NULL,
  `quality` enum('Trash','Common','Unusual','Rare','Epic','Legendary') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sale_price` int(10) unsigned DEFAULT NULL,
  `lvl_of_item` int(10) unsigned NOT NULL,
  `lvl_requirement` int(10) unsigned NOT NULL,
  `icon_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `idx_of_item_quality` (`quality`,`type`),
  KEY `fk_drop_from_id` (`drop_from`),
  CONSTRAINT `fk_drop_from_id` FOREIGN KEY (`drop_from`) REFERENCES `NPC` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'error','Keys','Qui enim debitis sequi temporibus sit earum sit ad. Qui deleniti cumque quam est accusamus aut. Et tempore sint consequatur eveniet. Et facere quae ut inventore iusto.',1,56,'Common',0,324,5,797106),(2,'et','Other','Alias cupiditate eos veniam omnis ipsum. Omnis non dolor et et recusandae sit ratione. Perspiciatis id perferendis at. Quas corporis ut eligendi quas officiis et dicta. Aut dignissimos porro officia ducimus corrupti laudantium qui voluptatem.',2,58,'Trash',200832,6,2,65982),(3,'ut','Bags','Non nulla molestias culpa sint expedita amet. Excepturi unde libero dolorem excepturi. Ut et quia totam temporibus est esse sequi incidunt.',3,63,'Trash',115461044,982,35,200400),(4,'est','Armor','Asperiores ut sint corrupti nostrum aliquid dolores. Sed quia perspiciatis officia quae aut. Minima velit omnis et veniam est qui voluptatibus. Aperiam odio deleniti veritatis sed dolore quia dicta.',4,86,'Common',11112092,992,33,441172),(5,'eius','Quests','Perspiciatis enim quia rerum illum aut. Rerum quis corporis tempore. Nam sit optio ut facilis quisquam. Vitae minus accusantium ipsa. Inventore consequuntur sit aut id velit itaque.',5,99,'Unusual',0,518,52,299997),(6,'neque','Recepies','Quia suscipit est perspiciatis recusandae. Qui quos ut ut earum enim ut nisi. Quis rerum exercitationem molestias id nemo.',6,84,'Common',15582520,774,23,719951),(7,'odit','Household','Perferendis animi magni eos ratione et dolorem odit odio. Quas culpa et quaerat voluptatem est placeat explicabo. Deleniti ut ut est.',7,46,'Rare',0,214,33,534920),(8,'assumenda','Keys','In fugit maxime quis porro consequatur vel et. Distinctio sed inventore veritatis eius est. Sed atque repudiandae molestiae voluptate alias.',8,89,'Trash',3781,64,34,938454),(9,'placeat','Bags','Accusamus magni modi ex esse qui voluptas reprehenderit est. Fugiat consequatur enim enim eos tenetur ratione dignissimos. Rerum ut sit perspiciatis ad tempora et.',9,81,'Epic',6937,60,12,340691),(10,'ad','Symbols','Alias cum est voluptatem voluptate ratione ut. Eos illum eos atque quia. Enim similique delectus et suscipit. Beatae incidunt non unde.',10,44,'Trash',493,646,53,690031),(11,'aut','Other','Non similique alias delectus quod similique vitae. Qui eum veritatis omnis ut corporis magnam repellendus.',11,84,'Unusual',11,391,5,210420),(12,'ipsam','Symbols','Natus ducimus vero incidunt ut et et ad. Ut nulla iure voluptatem repellat rerum. Nostrum occaecati quisquam suscipit nobis. Ex eius praesentium tempore odit ut.',12,11,'Rare',214,387,32,212126),(13,'non','Quests','Quam dolore veritatis quidem doloremque maiores culpa eligendi. Ex et id delectus et et. Nisi placeat quibusdam sapiente. Aut cum autem modi cumque.',13,90,'Epic',210167053,426,15,826194),(14,'sed','Keys','Sequi vel aut odio ad voluptatum aliquam doloribus. Aperiam et explicabo dolor qui architecto nesciunt perspiciatis. Itaque iusto rerum temporibus ut. Eligendi autem perferendis aut delectus.',14,37,'Trash',53,35,60,54380),(15,'earum','Quests','Voluptate reprehenderit commodi omnis autem facere. Architecto nihil unde in. Repellat pariatur consequatur ipsam facere nisi ut qui.',15,63,'Unusual',228524,438,60,179906),(16,'culpa','Expendable','Sit accusamus sed et et quibusdam veniam. Magni iure debitis sed quos et accusamus. Quod a nulla et ab.',16,18,'Unusual',1340360,3,38,648422),(17,'in','Symbols','Nobis numquam nihil culpa nisi vel. Aut suscipit animi temporibus. Qui sed repellendus animi porro.',17,78,'Trash',0,339,20,48580),(18,'voluptas','Quests','Consequatur quo pariatur molestiae. Dolore et aut dolorem laboriosam vitae dolore dolor et. Vel qui deserunt accusamus cupiditate repudiandae temporibus.',18,41,'Rare',428,196,1,572259),(19,'adipisci','Armor','Quis omnis molestias ad laudantium voluptatem. Id odit officiis ea velit non culpa et. Non et odio dicta dicta.',19,30,'Trash',8593,136,52,961806),(20,'nobis','Quests','Est aut quasi minus et veniam. Deserunt quam ea ut veritatis aut facere aut. Quae facere sed ut qui veritatis rerum. Qui modi explicabo est dicta sunt minus quis nostrum.',20,17,'Common',504,486,59,480652);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `continent` int(10) unsigned DEFAULT NULL,
  `expansion` int(10) unsigned NOT NULL,
  `fraction` int(10) unsigned DEFAULT NULL,
  `required_level` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `expansion` (`expansion`),
  KEY `continent` (`continent`),
  KEY `fraction` (`fraction`),
  CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`expansion`) REFERENCES `expansions` (`id`),
  CONSTRAINT `locations_ibfk_2` FOREIGN KEY (`continent`) REFERENCES `continents` (`id`),
  CONSTRAINT `locations_ibfk_3` FOREIGN KEY (`fraction`) REFERENCES `fractions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'Azuremist Isle',11,2,1,1),(2,'Bloodmyst Isle',11,2,1,1),(3,'Dun Morogh',10,1,1,1),(4,'Elwynn Forest',10,1,1,1),(5,'Teldrassil',11,1,1,1),(6,'Darkshore',11,1,1,5),(7,'Loch Modan',10,1,1,5),(8,'Westfall',10,1,1,5),(9,'Redbridge Mountains',10,1,1,7),(10,'Duskwood',10,1,1,10),(11,'Wetlands',10,1,1,10),(12,'Durotar',11,1,2,1),(13,'Eversong Woods',10,2,2,1),(14,'Ghostlands',10,2,2,1),(15,'Mulgor',11,1,2,1),(16,'Tirisfal Glades',10,1,2,1),(17,'Azshara',11,1,2,5),(18,'Northern Barrens',11,1,2,5),(19,'Silverpine Forest',10,1,2,5),(20,'Hilbsrad Foothills',10,1,2,7),(21,'Arathi Highlands',10,1,NULL,10),(22,'Deadwing Pass',10,1,NULL,10),(23,'Stranglethorn Vale',10,1,NULL,10),(24,'The Hinterlands',10,1,NULL,10),(25,'Badlands',10,1,NULL,15),(26,'Blasted Lands',10,1,NULL,15),(27,'Burning Steppes',10,1,NULL,15),(28,'Eastern Plaguelands',10,1,NULL,15),(29,'Searing Gorge',10,1,NULL,15),(30,'Swamp of Sorrows',10,1,NULL,15),(31,'Western Plaguelands',10,1,NULL,15),(32,'Isle if Quel\'Danas',10,1,NULL,25),(33,'Moonglade',11,1,NULL,1),(34,'Ashenvale',11,1,NULL,7),(35,'Desolace',11,1,NULL,10),(36,'Southern Barrens',11,1,NULL,10),(37,'Dustwallow Marsh',11,1,NULL,15),(38,'Felwood',11,1,NULL,15),(39,'Feralas',11,1,NULL,15),(40,'Silithus',11,1,NULL,15),(41,'Tanaris',11,1,NULL,15),(42,'Thousand Needles',11,1,NULL,15),(43,'Un\'Goro Crater',11,1,NULL,15),(44,'Winterspring',11,1,NULL,15),(45,'Hellfire Peninsula',9,2,NULL,10),(46,'Zangarmash',9,2,NULL,10),(47,'Nagrand',9,2,NULL,15),(48,'Terrokar Forest',9,2,NULL,15),(49,'Blade\'s Edge Mountains',9,2,NULL,20),(50,'Netherstorm',9,2,NULL,25),(51,'Shadowmoon Valley',9,2,NULL,25),(52,'Borean Tundra',8,3,NULL,10),(53,'Howling Fjord',8,3,NULL,10),(54,'Dragonblight',8,3,NULL,15),(55,'Grizzly Hills',8,3,NULL,15),(56,'Sholazar Basin',8,3,NULL,20),(57,'Zul\'Drak',8,3,NULL,20),(58,'Crystalsong Forest',8,3,NULL,25),(59,'Hrothgar\'s Landing',8,3,NULL,25),(60,'Icecrown',8,3,NULL,25),(61,'The Storm Peaks',8,3,NULL,25),(62,'Wintergrasp',8,3,NULL,25),(63,'Deepholm',7,4,NULL,30),(64,'Mount Hyjal',11,4,NULL,30),(65,'The Maelstrom',7,4,NULL,30),(66,'Tol Barad Peninsula',NULL,4,NULL,30),(67,'Twilight Highlands',10,4,NULL,30),(68,'Uldum',11,4,NULL,30),(69,'Vashj\'ir',10,4,NULL,30),(70,'Tol Barad',7,4,NULL,35),(71,'The Jade Forest',6,5,NULL,10),(72,'Krasarang Wilds',6,5,NULL,15),(73,'Valley of the Four Winds',6,5,NULL,15),(74,'Kun-Lai Summit',6,5,NULL,20),(75,'Townlong Steppes',6,5,NULL,25),(76,'Dread Wasters',6,5,NULL,30),(77,'The Veiled Stair',6,5,NULL,30),(78,'Timeless Island',6,5,NULL,30),(79,'Vale of Eternal Blossoms',6,5,NULL,35),(80,'Isle of Thunder',6,5,NULL,32),(81,'Isle of Giants',6,5,NULL,35),(82,'Ashran',5,6,NULL,10),(83,'Frostfire Ridge',5,6,NULL,10),(84,'Shadowmoon Valley (Draenor)',5,6,NULL,10),(85,'Gorgrond',5,6,NULL,15),(86,'Talador',5,6,NULL,20),(87,'Spires of Arak',5,6,NULL,30),(88,'Nagrand (Draenor)',5,6,NULL,35),(89,'Tanaan Jungle',5,6,NULL,40),(90,'Azsuna',4,7,NULL,10),(91,'Eye of Azshara',4,7,NULL,10),(92,'Highmountain',4,7,NULL,10),(93,'Stormheim',4,7,NULL,10),(94,'Broken Shore',4,7,NULL,45),(95,'Suramar',4,7,NULL,45),(96,'Tiragarde Sound',2,8,1,10),(97,'Drustvar',2,8,1,20),(98,'Stormsong Valley',2,8,1,30),(99,'Mechagon',2,8,NULL,50),(100,'Zuldazar',3,8,2,10),(101,'Nazmir',3,8,2,20),(102,'Vol\'Dun',3,8,2,30),(103,'Nazjatar',NULL,8,NULL,50),(104,'Bastion',1,9,NULL,51),(105,'Maldraxxus',1,9,NULL,53),(106,'Ardenweald',1,9,NULL,55),(107,'Revendreth',1,9,NULL,58),(108,'The Maw',1,9,NULL,60),(109,'Zereth Mortis',1,9,NULL,62);
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mounts`
--

DROP TABLE IF EXISTS `mounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `drop_from` bigint(20) unsigned NOT NULL,
  `drop_chance` int(10) unsigned DEFAULT NULL,
  `is_flying` tinyint(1) DEFAULT NULL,
  `required_level` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `drop_from` (`drop_from`),
  CONSTRAINT `mounts_ibfk_1` FOREIGN KEY (`drop_from`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mounts`
--

LOCK TABLES `mounts` WRITE;
/*!40000 ALTER TABLE `mounts` DISABLE KEYS */;
INSERT INTO `mounts` VALUES (1,'in',1,98,1,12),(2,'necessitatibus',2,34,0,44),(3,'maiores',3,50,0,21),(4,'iure',4,5,0,14),(5,'autem',5,59,1,42),(6,'molestiae',6,76,0,31),(7,'voluptatum',7,74,0,31),(8,'reiciendis',8,29,1,38),(9,'eum',9,67,1,25),(10,'qui',10,33,0,3),(11,'fugiat',11,67,0,41),(12,'voluptas',12,25,0,22),(13,'debitis',13,39,0,13),(14,'natus',14,44,1,24),(15,'tempore',15,60,0,1),(16,'et',16,96,1,36),(17,'quia',17,68,0,5),(18,'laborum',18,31,0,17),(19,'ipsa',19,45,1,24),(20,'delectus',20,98,0,5);
/*!40000 ALTER TABLE `mounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neutral_fractions`
--

DROP TABLE IF EXISTS `neutral_fractions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `neutral_fractions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expansion` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `expansion` (`expansion`),
  CONSTRAINT `neutral_fractions_ibfk_1` FOREIGN KEY (`expansion`) REFERENCES `expansions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neutral_fractions`
--

LOCK TABLES `neutral_fractions` WRITE;
/*!40000 ALTER TABLE `neutral_fractions` DISABLE KEYS */;
INSERT INTO `neutral_fractions` VALUES (1,'Steamwheedle Cartel',1),(2,'Shattrah City',2),(3,'Alliance Vanguard',3),(4,'Horde Expedition',3),(5,'Sholazar Basin',3),(6,'The Anglers',5),(7,'The Trillers',5),(8,'Barracks Bodyguards',6),(9,'The Nightfallen',7),(10,'Order of Embers',8),(11,'Proudmoore Admiralty',8),(12,'Storm\'s Wake',8),(13,'The Ember Court',9),(14,'The Wild Hunt',9);
/*!40000 ALTER TABLE `neutral_fractions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pet_races`
--

DROP TABLE IF EXISTS `pet_races`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pet_races` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `race` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pet_races`
--

LOCK TABLES `pet_races` WRITE;
/*!40000 ALTER TABLE `pet_races` DISABLE KEYS */;
INSERT INTO `pet_races` VALUES (1,'Aquatic'),(2,'Beast'),(3,'Critter'),(4,'Dragonkin'),(5,'Elemental'),(6,'Flying'),(7,'Humanoid'),(8,'Magic'),(9,'Mechanical'),(10,'Undead'),(11,'Passive');
/*!40000 ALTER TABLE `pet_races` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pets`
--

DROP TABLE IF EXISTS `pets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spells` bigint(20) unsigned DEFAULT NULL,
  `drop_from` bigint(20) unsigned NOT NULL,
  `drop_chance` int(10) unsigned NOT NULL,
  `pet_type` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `spells` (`spells`),
  KEY `drop_from` (`drop_from`),
  KEY `pet_type` (`pet_type`),
  CONSTRAINT `pets_ibfk_1` FOREIGN KEY (`spells`) REFERENCES `spells` (`id`),
  CONSTRAINT `pets_ibfk_2` FOREIGN KEY (`drop_from`) REFERENCES `NPC` (`id`),
  CONSTRAINT `pets_ibfk_3` FOREIGN KEY (`pet_type`) REFERENCES `pet_races` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pets`
--

LOCK TABLES `pets` WRITE;
/*!40000 ALTER TABLE `pets` DISABLE KEYS */;
INSERT INTO `pets` VALUES (1,'nihil',1,1,12,1),(2,'corporis',2,2,4,2),(3,'autem',3,3,40,3),(4,'quia',4,4,40,4),(5,'itaque',5,5,5,5),(6,'nihil',6,6,83,6),(7,'totam',7,7,83,7),(8,'cum',8,8,48,8),(9,'nam',9,9,60,9),(10,'dicta',10,10,91,10),(11,'perspiciatis',11,11,19,11),(12,'est',12,12,95,1),(13,'praesentium',13,13,57,2),(14,'molestiae',14,14,90,3),(15,'voluptatum',15,15,56,4),(16,'perspiciatis',16,16,22,5),(17,'consequatur',17,17,46,6),(18,'facere',18,18,47,7),(19,'maiores',19,19,95,8),(20,'et',20,20,72,9);
/*!40000 ALTER TABLE `pets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playable_races`
--

DROP TABLE IF EXISTS `playable_races`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playable_races` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fraction` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fraction` (`fraction`),
  CONSTRAINT `playable_races_ibfk_1` FOREIGN KEY (`fraction`) REFERENCES `fractions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playable_races`
--

LOCK TABLES `playable_races` WRITE;
/*!40000 ALTER TABLE `playable_races` DISABLE KEYS */;
INSERT INTO `playable_races` VALUES (1,'Dark Iron Dwarf',1),(2,'Draenei',1),(3,'Dwarf',1),(4,'Gnome',1),(5,'Human',1),(6,'Kul Tiran',1),(7,'Lightforged Draenei',1),(8,'Mechagnome',1),(9,'Night Elf',1),(10,'Pandaren',NULL),(11,'Void Elf',1),(12,'Worgen',1),(13,'Blood Elf',2),(14,'Goblin',2),(15,'Highmountain Tauren',2),(16,'Mag\'har Orc',2),(17,'Nightborne',2),(18,'Orc',2),(19,'Tauren',2),(20,'Troll',2),(21,'Undead',2),(22,'Vulpera',2),(23,'Zandalari Troll',2);
/*!40000 ALTER TABLE `playable_races` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professions`
--

DROP TABLE IF EXISTS `professions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profession_type` enum('gathering','manufacturing') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professions`
--

LOCK TABLES `professions` WRITE;
/*!40000 ALTER TABLE `professions` DISABLE KEYS */;
INSERT INTO `professions` VALUES (1,'Alchemy','manufacturing'),(2,'Blacksmithing','manufacturing'),(3,'Enchanting','manufacturing'),(4,'Engineering','manufacturing'),(5,'Herbalism','gathering'),(6,'Inscription','gathering'),(7,'Jewelcrafting','manufacturing'),(8,'Leatherworking','manufacturing'),(9,'Mining','gathering'),(10,'Skinning','gathering'),(11,'Tailoring','manufacturing'),(12,'Archaeology','manufacturing'),(13,'Cooking','manufacturing');
/*!40000 ALTER TABLE `professions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quest_givers`
--

DROP TABLE IF EXISTS `quest_givers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quest_givers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` bigint(20) unsigned NOT NULL,
  `expansion` int(10) unsigned NOT NULL,
  `quests` bigint(20) unsigned NOT NULL,
  `fraction_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `location` (`location`),
  KEY `expansion` (`expansion`),
  KEY `fraction_id` (`fraction_id`),
  KEY `quests` (`quests`),
  CONSTRAINT `quest_givers_ibfk_1` FOREIGN KEY (`location`) REFERENCES `locations` (`id`),
  CONSTRAINT `quest_givers_ibfk_2` FOREIGN KEY (`expansion`) REFERENCES `expansions` (`id`),
  CONSTRAINT `quest_givers_ibfk_3` FOREIGN KEY (`fraction_id`) REFERENCES `fractions` (`id`),
  CONSTRAINT `quest_givers_ibfk_4` FOREIGN KEY (`quests`) REFERENCES `quests` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quest_givers`
--

LOCK TABLES `quest_givers` WRITE;
/*!40000 ALTER TABLE `quest_givers` DISABLE KEYS */;
INSERT INTO `quest_givers` VALUES (1,'porro',1,1,1,1),(2,'deleniti',2,2,2,2),(3,'voluptatem',3,3,3,1),(4,'id',4,4,4,2),(5,'qui',5,5,5,1),(6,'iure',6,6,6,2),(7,'et',7,7,7,1),(8,'doloremque',8,8,8,2),(9,'sed',9,9,9,1),(10,'dolores',10,10,10,2),(11,'natus',11,1,11,1),(12,'atque',12,2,12,2),(13,'odit',13,3,13,1),(14,'praesentium',14,4,14,2),(15,'aut',15,5,15,1),(16,'ipsa',16,6,16,2),(17,'quae',17,7,17,1),(18,'nobis',18,8,18,2),(19,'eligendi',19,9,19,1),(20,'dolor',20,10,20,2);
/*!40000 ALTER TABLE `quest_givers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quests`
--

DROP TABLE IF EXISTS `quests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` bigint(20) unsigned NOT NULL,
  `expansion` int(10) unsigned NOT NULL,
  `fraction_id` int(10) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reward` bigint(20) unsigned NOT NULL,
  `required_level` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reward` (`reward`),
  UNIQUE KEY `name` (`name`),
  KEY `location` (`location`),
  KEY `expansion` (`expansion`),
  KEY `fraction_id` (`fraction_id`),
  CONSTRAINT `quests_ibfk_1` FOREIGN KEY (`location`) REFERENCES `locations` (`id`),
  CONSTRAINT `quests_ibfk_2` FOREIGN KEY (`expansion`) REFERENCES `expansions` (`id`),
  CONSTRAINT `quests_ibfk_3` FOREIGN KEY (`fraction_id`) REFERENCES `fractions` (`id`),
  CONSTRAINT `quests_ibfk_4` FOREIGN KEY (`reward`) REFERENCES `items` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quests`
--

LOCK TABLES `quests` WRITE;
/*!40000 ALTER TABLE `quests` DISABLE KEYS */;
INSERT INTO `quests` VALUES (1,'aut',1,1,1,'Impedit harum ea omnis repudiandae fuga. Maiores voluptas voluptas vel debitis. Aspernatur quam neque error eum non blanditiis cupiditate.',1,8),(2,'accusamus',2,2,2,'Consequatur consequatur unde repellat. Id delectus voluptas molestias totam. Rerum qui rerum veniam eum.',2,39),(3,'ut',3,3,1,'Ipsum voluptatem aliquid dolor enim dolorem iusto. Id dicta maiores consequatur consequatur natus.',3,40),(4,'qui',4,4,2,'Velit doloribus sint doloribus quia sapiente sint. Ratione omnis omnis nihil aut sequi. Earum impedit aliquid eum voluptatum omnis voluptas hic. Aliquam dignissimos minus omnis dolor ea.',4,25),(5,'et',5,5,1,'Sed dolorem qui harum accusantium quisquam voluptatem eos aut. Ipsa delectus voluptatum aut sit molestias ipsum qui.',5,56),(6,'minus',6,6,2,'Doloribus non ad debitis ea ratione. Quia vitae et et ratione quia.',6,26),(7,'nemo',7,7,1,'Neque iure dolore quam doloribus. Ab laudantium est ut non est voluptas. Cupiditate necessitatibus in quos aliquam labore sint veniam. Debitis nesciunt vel ut numquam fugit.',7,40),(8,'unde',8,8,2,'Doloribus nostrum vel hic sit est consequatur distinctio. Tenetur similique animi explicabo nemo. Facilis aspernatur nihil quam aliquam dolor. Mollitia corporis et repellendus rerum.',8,43),(9,'doloribus',9,9,1,'Illo ratione accusamus commodi doloribus perspiciatis sequi rem. Et sint dicta molestiae cumque quisquam neque. Voluptatem ut nulla officiis vero. Porro consequatur quas hic asperiores veritatis sed provident ipsa.',9,19),(10,'nulla',10,10,2,'Officia magni aut soluta. Possimus sed ex dolor quo et qui. Ipsa earum provident necessitatibus unde.',10,21),(11,'explicabo',11,1,1,'Fugit facere quis quod distinctio. Voluptatem aspernatur molestiae laudantium.',11,7),(12,'officiis',12,2,2,'Omnis voluptatem neque aut. Praesentium aperiam et incidunt modi voluptas pariatur quia.',12,12),(13,'repudiandae',13,3,1,'Quis est maiores et laboriosam dolor quod autem suscipit. Aut ratione quidem ullam asperiores et. Accusantium ullam omnis distinctio id. Non nobis accusamus soluta error.',13,21),(14,'quaerat',14,4,2,'Quo dolor doloribus asperiores cumque aut mollitia dicta. Expedita magnam non non aut. Deleniti nihil aut hic est eaque.',14,25),(15,'ducimus',15,5,1,'Non explicabo tenetur eos commodi. Qui ipsum molestiae distinctio sunt dolor veritatis. Expedita eum et voluptatem dolore velit aperiam.',15,5),(16,'corrupti',16,6,2,'Deserunt qui dolor natus ullam vero ex voluptatem. Voluptates dolores aspernatur delectus inventore.',16,45),(17,'dolores',17,7,1,'Occaecati sint officiis est assumenda et perferendis quo. Dolorum possimus suscipit nesciunt. Qui ex nostrum aut veritatis enim reiciendis.',17,27),(18,'dolore',18,8,2,'Et sit tempora consectetur omnis ab. Harum rerum pariatur veniam quisquam illum.',18,22),(19,'enim',19,9,1,'Odit voluptatum qui culpa esse nulla earum consequatur ab. Sit ea et labore numquam sapiente consequatur. Cupiditate molestias rem animi voluptatem error officiis.',19,48),(20,'possimus',20,10,2,'Nobis molestiae quo incidunt in inventore. Dignissimos dolorem nisi quia. Et distinctio dolor veritatis quo. Quia alias et rerum.',20,46);
/*!40000 ALTER TABLE `quests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `races`
--

DROP TABLE IF EXISTS `races`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `races` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `races`
--

LOCK TABLES `races` WRITE;
/*!40000 ALTER TABLE `races` DISABLE KEYS */;
INSERT INTO `races` VALUES (1,'Aberration'),(2,'Beast'),(3,'Critter'),(4,'Demon'),(5,'Dragokin'),(6,'Elemental'),(7,'Giant'),(8,'Humanoid'),(9,'Mechanical'),(10,'Uncategorized'),(11,'Undead');
/*!40000 ALTER TABLE `races` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raids`
--

DROP TABLE IF EXISTS `raids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `raids` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` bigint(20) unsigned NOT NULL,
  `expansion` int(10) unsigned NOT NULL,
  `boss` bigint(20) unsigned NOT NULL,
  `loot` bigint(20) unsigned NOT NULL,
  `quests` bigint(20) unsigned NOT NULL,
  `required_level` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `location` (`location`),
  KEY `expansion` (`expansion`),
  KEY `boss` (`boss`),
  KEY `quests` (`quests`),
  CONSTRAINT `raids_ibfk_1` FOREIGN KEY (`location`) REFERENCES `locations` (`id`),
  CONSTRAINT `raids_ibfk_2` FOREIGN KEY (`expansion`) REFERENCES `expansions` (`id`),
  CONSTRAINT `raids_ibfk_3` FOREIGN KEY (`boss`) REFERENCES `NPC` (`id`),
  CONSTRAINT `raids_ibfk_4` FOREIGN KEY (`quests`) REFERENCES `quests` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raids`
--

LOCK TABLES `raids` WRITE;
/*!40000 ALTER TABLE `raids` DISABLE KEYS */;
INSERT INTO `raids` VALUES (1,'perferendis',1,1,1,1,1,50),(2,'totam',2,2,2,2,2,40),(3,'at',3,3,3,3,3,30),(4,'eum',4,4,4,4,4,58),(5,'ut',5,5,5,5,5,35),(6,'consectetur',6,6,6,6,6,57),(7,'cupiditate',7,7,7,7,7,50),(8,'quibusdam',8,8,8,8,8,31),(9,'dolor',9,9,9,9,9,48),(10,'vitae',10,10,10,10,10,34),(11,'voluptatem',11,1,11,11,11,33),(12,'aut',12,2,12,12,12,56),(13,'voluptate',13,3,13,13,13,59),(14,'occaecati',14,4,14,14,14,36),(15,'aliquam',15,5,15,15,15,30),(16,'dolores',16,6,16,16,16,34),(17,'nihil',17,7,17,17,17,40),(18,'sapiente',18,8,18,18,18,57),(19,'tempore',19,9,19,19,19,36),(20,'rerum',20,10,20,20,20,44);
/*!40000 ALTER TABLE `raids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ranks`
--

DROP TABLE IF EXISTS `ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ranks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requirements` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `requirements` (`requirements`),
  CONSTRAINT `ranks_ibfk_1` FOREIGN KEY (`requirements`) REFERENCES `achievements` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ranks`
--

LOCK TABLES `ranks` WRITE;
/*!40000 ALTER TABLE `ranks` DISABLE KEYS */;
INSERT INTO `ranks` VALUES (1,'est',1),(2,'eligendi',2),(3,'harum',3),(4,'sint',4),(5,'dolorem',5),(6,'odio',6),(7,'reprehenderit',7),(8,'vel',8),(9,'placeat',9),(10,'nihil',10),(11,'debitis',11),(12,'totam',12),(13,'beatae',13),(14,'quia',14),(15,'occaecati',15),(16,'eos',16),(17,'qui',17),(18,'quaerat',18),(19,'accusantium',19),(20,'delectus',20);
/*!40000 ALTER TABLE `ranks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realms`
--

DROP TABLE IF EXISTS `realms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `realm_type` enum('PVP','PVE','RP') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `population` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realms`
--

LOCK TABLES `realms` WRITE;
/*!40000 ALTER TABLE `realms` DISABLE KEYS */;
INSERT INTO `realms` VALUES (1,'est','United Kingdom','RP',34131),(2,'magnam','El Salvador','PVE',52534),(3,'temporibus','Slovenia','RP',92821),(4,'et','Heard Island and McDonald Islands','RP',10574),(5,'voluptatibus','Azerbaijan','PVE',92877),(6,'ut','Gambia','PVP',54120),(7,'quas','Indonesia','PVE',97976),(8,'dolores','Kuwait','RP',37776),(9,'perspiciatis','Wallis and Futuna','RP',27146),(10,'sit','Netherlands','RP',16177),(11,'iure','Serbia','PVP',92997),(12,'laboriosam','Cambodia','PVP',12003),(13,'sapiente','Iraq','PVP',11801),(14,'sequi','Botswana','PVE',84621),(15,'velit','Sweden','RP',60821),(16,'voluptatem','Afghanistan','PVE',23826),(17,'neque','French Guiana','PVP',22623),(18,'qui','Poland','RP',37246),(19,'atque','Norfolk Island','PVE',56792),(20,'quibusdam','United Arab Emirates','PVE',72699);
/*!40000 ALTER TABLE `realms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recepies`
--

DROP TABLE IF EXISTS `recepies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recepies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ingredients` set('') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profession` int(10) unsigned NOT NULL,
  `required_level_of_profession` int(10) unsigned DEFAULT NULL,
  `drop_from` bigint(20) unsigned NOT NULL,
  `expansion` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `drop_from` (`drop_from`),
  KEY `expansion` (`expansion`),
  KEY `profession` (`profession`),
  CONSTRAINT `recepies_ibfk_1` FOREIGN KEY (`drop_from`) REFERENCES `NPC` (`id`),
  CONSTRAINT `recepies_ibfk_2` FOREIGN KEY (`expansion`) REFERENCES `expansions` (`id`),
  CONSTRAINT `recepies_ibfk_3` FOREIGN KEY (`profession`) REFERENCES `professions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recepies`
--

LOCK TABLES `recepies` WRITE;
/*!40000 ALTER TABLE `recepies` DISABLE KEYS */;
INSERT INTO `recepies` VALUES (1,'cumque',NULL,1,37,1,1),(2,'saepe',NULL,2,36,2,2),(3,'quo',NULL,3,19,3,3),(4,'et',NULL,4,48,4,4),(5,'sunt',NULL,5,56,5,5),(6,'laudantium',NULL,6,49,6,6),(7,'qui',NULL,7,31,7,7),(8,'vel',NULL,8,34,8,8),(9,'libero',NULL,9,9,9,9),(10,'perspiciatis',NULL,10,18,10,10),(11,'aut',NULL,11,55,11,1),(12,'reiciendis',NULL,12,57,12,2),(13,'repellat',NULL,13,44,13,3),(14,'ut',NULL,1,26,14,4),(15,'quia',NULL,2,18,15,5),(16,'laboriosam',NULL,3,49,16,6),(17,'ipsam',NULL,4,22,17,7),(18,'fugit',NULL,5,41,18,8),(19,'labore',NULL,6,35,19,9),(20,'dicta',NULL,7,2,20,10);
/*!40000 ALTER TABLE `recepies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resources` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources`
--

LOCK TABLES `resources` WRITE;
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
INSERT INTO `resources` VALUES (1,'Arcane Charges'),(2,'Astral Power'),(3,'Chi'),(4,'Combo Points'),(5,'Energy'),(6,'Focus'),(7,'Fury'),(8,'Health'),(9,'Holy Power'),(10,'Insanity'),(11,'Maelstrom'),(12,'Mana'),(13,'Pain'),(14,'Rage'),(15,'Runes'),(16,'Runic Power'),(17,'Soul Shards');
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specializations`
--

DROP TABLE IF EXISTS `specializations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specializations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` int(10) unsigned NOT NULL,
  `category` enum('Damage Dealer','Healer','Tank') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `class` (`class`),
  CONSTRAINT `specializations_ibfk_1` FOREIGN KEY (`class`) REFERENCES `classes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specializations`
--

LOCK TABLES `specializations` WRITE;
/*!40000 ALTER TABLE `specializations` DISABLE KEYS */;
INSERT INTO `specializations` VALUES (1,'Blood',1,'Tank'),(2,'Frost',1,'Damage Dealer'),(3,'Unholy',1,'Damage Dealer'),(4,'Havoc',2,'Damage Dealer'),(5,'Vengeance',2,'Tank'),(6,'Balance',3,'Damage Dealer'),(7,'Feral',3,'Damage Dealer'),(8,'Guardian',3,'Tank'),(9,'Restoration',3,'Healer'),(10,'Beast Mastery',4,'Damage Dealer'),(11,'Marksmanship',4,'Damage Dealer'),(12,'Survival',4,'Damage Dealer'),(13,'Arcane',5,'Damage Dealer'),(14,'Fire',5,'Damage Dealer'),(15,'Frost',5,'Damage Dealer'),(16,'Brewmaster',6,'Tank'),(17,'Mistweaver',6,'Healer'),(18,'Windwalker',6,'Damage Dealer'),(19,'Holy',7,'Healer'),(20,'Protection',7,'Tank'),(21,'Retribution',7,'Damage Dealer'),(22,'Discipline',8,'Healer'),(23,'Holy',8,'Healer'),(24,'Shadow',8,'Damage Dealer'),(25,'Assassination',9,'Damage Dealer'),(26,'Outlaw',9,'Damage Dealer'),(27,'Sublety',9,'Damage Dealer'),(28,'Elemental',10,'Damage Dealer'),(29,'Enchancement',10,'Damage Dealer'),(30,'Restoration',10,'Healer'),(31,'Affliction',11,'Damage Dealer'),(32,'Demonology',11,'Damage Dealer'),(33,'Destruction',11,'Damage Dealer'),(34,'Arms',12,'Damage Dealer'),(35,'Fury',12,'Damage Dealer'),(36,'Protection',12,'Tank');
/*!40000 ALTER TABLE `specializations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spell_schools`
--

DROP TABLE IF EXISTS `spell_schools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spell_schools` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spell_schools`
--

LOCK TABLES `spell_schools` WRITE;
/*!40000 ALTER TABLE `spell_schools` DISABLE KEYS */;
INSERT INTO `spell_schools` VALUES (1,'Shadow'),(2,'Physical'),(3,'Nature'),(4,'Fire'),(5,'Frost'),(6,'Arcane'),(7,'Holy');
/*!40000 ALTER TABLE `spell_schools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spells`
--

DROP TABLE IF EXISTS `spells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spells` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `required_level` int(10) unsigned NOT NULL,
  `school` int(10) unsigned NOT NULL,
  `class` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `class` (`class`),
  KEY `fk_spell_school` (`school`),
  CONSTRAINT `fk_spell_school` FOREIGN KEY (`school`) REFERENCES `spell_schools` (`id`),
  CONSTRAINT `spells_ibfk_1` FOREIGN KEY (`class`) REFERENCES `classes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spells`
--

LOCK TABLES `spells` WRITE;
/*!40000 ALTER TABLE `spells` DISABLE KEYS */;
INSERT INTO `spells` VALUES (1,'perspiciatis','Excepturi natus autem molestiae qui dolorem dolor. Asperiores occaecati aspernatur ullam est voluptates sed. Molestiae voluptatem et aliquam illo.',47,1,1),(2,'sunt','At et alias eligendi asperiores fugiat rerum perferendis minima. Assumenda ut omnis quas cum repellendus fugiat odit occaecati. Eos accusamus qui aut aut.',29,2,2),(3,'exercitationem','Eum ex commodi occaecati perferendis. Recusandae autem sequi vitae commodi quas. Et officia sed consectetur beatae cupiditate et quis perferendis. Et soluta eius modi ut facere neque.',54,3,3),(4,'amet','A est recusandae ad tempora aut. Qui quis ut eaque possimus sapiente omnis. Quia molestias suscipit corporis error.',43,4,4),(5,'corrupti','Quae excepturi alias vitae minima et eum aperiam asperiores. Nisi quos sunt omnis vel. Omnis excepturi consequatur dolores fugiat quos. Libero velit quis animi sed libero in reprehenderit.',35,5,5),(6,'incidunt','Numquam accusamus porro voluptate aspernatur distinctio. Nulla aperiam et culpa. Tempore ullam in maxime ab sit ipsam. A nostrum et suscipit repellat est neque.',26,6,6),(7,'labore','Reiciendis magnam quo dolorem ut et laudantium fugit. Consequatur magni molestiae nostrum velit odio qui. Aspernatur non cumque ea mollitia culpa quibusdam maiores. Aspernatur nihil incidunt et. Rerum assumenda incidunt autem quaerat.',8,7,7),(8,'cumque','Quia voluptatem labore et maxime nam blanditiis sint. Accusantium rerum quia quia explicabo. Voluptatum sit ea id excepturi occaecati est tenetur. Quis facilis molestiae aspernatur in minus.',20,1,8),(9,'quis','Earum recusandae eveniet assumenda dolores saepe voluptates. Necessitatibus deserunt aut officiis fugit qui dicta quia voluptatem.',60,2,9),(10,'ratione','Quaerat et nostrum commodi culpa nihil. Est officia esse rerum omnis eius ducimus doloribus. Deserunt ducimus quo harum accusamus.',5,3,10),(11,'quasi','Pariatur sequi dolor quibusdam blanditiis aut. Autem qui nesciunt aliquid ipsa. Quo cumque libero pariatur repudiandae dolor.',40,4,11),(12,'esse','Est labore ut dolores alias ipsum ab non. Voluptatem eius rerum quod sit ipsa natus voluptate. Rerum ex ea quia in tempora quibusdam.',8,5,12),(13,'pariatur','Consequuntur eum fugit voluptate quasi doloremque saepe autem. Nesciunt nisi eum rerum debitis. Quia fugit ab expedita quo qui. Aperiam corporis eligendi voluptatem facilis minima. Temporibus dicta nihil architecto quia dolor expedita veritatis voluptatem.',32,6,1),(14,'non','Ipsam id ipsa itaque id qui. Eveniet et ratione a velit aliquam doloremque. Voluptatem illum accusantium deserunt sed consectetur cumque.',2,7,2),(15,'autem','Ratione ducimus quasi repudiandae veritatis et reiciendis. Ipsam inventore aut autem corporis sed omnis sit sed. Dolores et praesentium velit aut. Temporibus dolorem odit id aut eaque.',57,1,3),(16,'quibusdam','Aspernatur tempora voluptatem quasi iste dicta veritatis dignissimos qui. Cupiditate consectetur sed vel aspernatur corrupti et.',33,2,4),(17,'laborum','Maxime culpa exercitationem nam. Illo consequatur officiis hic explicabo quam sunt. Itaque sed atque debitis est quasi. Voluptas ratione saepe possimus aut.',29,3,5),(18,'nobis','Voluptas incidunt architecto et est. Aut minima consequatur vero nostrum voluptatibus ut mollitia earum.',39,4,6),(19,'fugiat','Dicta et ea ad dicta aliquam dignissimos ducimus. Eligendi harum neque et asperiores alias vitae. Enim facere doloremque veniam natus aliquid. Saepe in ullam voluptatem cumque consectetur sint mollitia.',16,5,7),(20,'commodi','Quo vel repellat totam commodi. Vero similique voluptatem suscipit tenetur qui praesentium. Omnis animi vero officiis quidem laboriosam explicabo. Totam in qui placeat laboriosam.',49,6,8);
/*!40000 ALTER TABLE `spells` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weapon_types`
--

DROP TABLE IF EXISTS `weapon_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weapon_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` enum('One-Handed','Two-Handed','Ranged','Other') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weapon_types`
--

LOCK TABLES `weapon_types` WRITE;
/*!40000 ALTER TABLE `weapon_types` DISABLE KEYS */;
INSERT INTO `weapon_types` VALUES (1,'Dagger','One-Handed'),(2,'Fist Weapon','One-Handed'),(3,'One-Handed Axe','One-Handed'),(4,'One-Handed Mace','One-Handed'),(5,'One-Handed Sword','One-Handed'),(6,'Warglave','One-Handed'),(7,'Polearm','Two-Handed'),(8,'Stave','Two-Handed'),(9,'Two-Handed Axe','Two-Handed'),(10,'Two-Handed Mace','Two-Handed'),(11,'Two-Handed Sword','Two-Handed'),(12,'Bow','Ranged'),(13,'Crossbow','Ranged'),(14,'Gun','Ranged'),(15,'Wand','Ranged'),(16,'Fishing Pole','Other'),(17,'Miscellaneous','Other');
/*!40000 ALTER TABLE `weapon_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weapons`
--

DROP TABLE IF EXISTS `weapons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weapons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weapon_type` int(10) unsigned NOT NULL,
  `item_id` bigint(20) unsigned NOT NULL,
  `stats` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`stats`)),
  `required_lvl` int(10) unsigned DEFAULT NULL,
  `drop_from` bigint(20) unsigned NOT NULL,
  `drop_chance` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `weapon_type` (`weapon_type`),
  KEY `item_id` (`item_id`),
  KEY `drop_from` (`drop_from`),
  CONSTRAINT `weapons_ibfk_1` FOREIGN KEY (`weapon_type`) REFERENCES `weapon_types` (`id`),
  CONSTRAINT `weapons_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  CONSTRAINT `weapons_ibfk_3` FOREIGN KEY (`drop_from`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weapons`
--

LOCK TABLES `weapons` WRITE;
/*!40000 ALTER TABLE `weapons` DISABLE KEYS */;
INSERT INTO `weapons` VALUES (1,'animi',1,1,NULL,40,1,9),(2,'vel',2,2,NULL,36,2,75),(3,'voluptatum',3,3,NULL,46,3,31),(4,'ut',4,4,NULL,25,4,30),(5,'perspiciatis',5,5,NULL,33,5,68),(6,'qui',6,6,NULL,29,6,52),(7,'tempora',7,7,NULL,39,7,23),(8,'voluptate',8,8,NULL,55,8,15),(9,'dolorum',9,9,NULL,32,9,21),(10,'quia',10,10,NULL,24,10,66),(11,'commodi',11,11,NULL,55,11,75),(12,'velit',12,12,NULL,47,12,50),(13,'quisquam',13,13,NULL,13,13,1),(14,'et',14,14,NULL,20,14,89),(15,'debitis',15,15,NULL,19,15,53),(16,'ea',16,16,NULL,19,16,57),(17,'dolor',17,17,NULL,9,17,44),(18,'occaecati',1,18,NULL,14,18,18),(19,'nostrum',2,19,NULL,41,19,46),(20,'eum',3,20,NULL,58,20,37);
/*!40000 ALTER TABLE `weapons` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-30 19:45:51

-- MariaDB dump 10.19  Distrib 10.5.12-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_23
-- ------------------------------------------------------
-- Server version	10.5.12-MariaDB-cll-lve

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
-- Table structure for table `heroes`
--

DROP TABLE IF EXISTS `heroes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `heroes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` int(10) unsigned NOT NULL,
  `gender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner` bigint(20) unsigned NOT NULL,
  `lvl` int(10) unsigned NOT NULL,
  `race` int(10) unsigned NOT NULL,
  `fraction` int(10) unsigned NOT NULL,
  `realm` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `idx_of_name` (`name`,`realm`),
  KEY `class` (`class`),
  KEY `owner` (`owner`),
  KEY `fraction` (`fraction`),
  KEY `fk_playable_race` (`race`),
  CONSTRAINT `fk_playable_race` FOREIGN KEY (`race`) REFERENCES `playable_races` (`id`),
  CONSTRAINT `heroes_ibfk_1` FOREIGN KEY (`class`) REFERENCES `classes` (`id`),
  CONSTRAINT `heroes_ibfk_2` FOREIGN KEY (`owner`) REFERENCES `accounts` (`id`),
  CONSTRAINT `heroes_ibfk_3` FOREIGN KEY (`fraction`) REFERENCES `fractions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heroes`
--

LOCK TABLES `heroes` WRITE;
/*!40000 ALTER TABLE `heroes` DISABLE KEYS */;
INSERT INTO `heroes` VALUES (1,'possimus',1,'F',1,52,1,1,1),(2,'at',2,'F',2,41,2,2,2),(3,'est',3,'F',3,10,3,1,3),(4,'accusantium',4,'M',4,38,4,2,4),(5,'nulla',5,'F',5,51,5,1,5),(6,'architecto',6,'M',6,56,6,2,6),(7,'eos',7,'F',7,37,7,1,7),(8,'sed',8,'F',8,9,8,2,8),(9,'fugiat',9,'M',9,60,9,1,9),(10,'quaerat',10,'F',10,20,10,2,10),(11,'aliquid',11,'M',11,29,11,1,11),(12,'doloribus',12,'F',12,36,12,2,12),(13,'qui',1,'F',13,8,13,1,13),(14,'id',2,'M',14,8,14,2,14),(15,'ea',3,'M',15,27,15,1,15),(16,'voluptates',4,'M',16,50,16,2,16),(17,'asperiores',5,'F',17,36,17,1,17),(18,'beatae',6,'F',18,3,18,2,18),(19,'ut',7,'F',19,31,19,1,19),(20,'blanditiis',8,'M',20,52,20,2,20);
/*!40000 ALTER TABLE `heroes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-30 20:13:02

UPDATE classes 
SET
	type_of_armor = 'Mail'
WHERE id IN(4, 10);

UPDATE heroes 
SET
	fraction = 2
WHERE race BETWEEN 13 AND 23;

UPDATE accounts 
SET 
	created_at = '2004-11-23'
WHERE created_at < '2004-11-23';