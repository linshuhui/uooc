-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: uooc
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can add group',3,'add_group'),(9,'Can change group',3,'change_group'),(10,'Can delete group',3,'delete_group'),(11,'Can view group',3,'view_group'),(12,'Can view permission',2,'view_permission'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_expenduser'),(22,'Can change user',6,'change_expenduser'),(23,'Can delete user',6,'delete_expenduser'),(24,'Can add 轮播图',7,'add_banner'),(25,'Can change 轮播图',7,'change_banner'),(26,'Can delete 轮播图',7,'delete_banner'),(27,'Can add message',8,'add_message'),(28,'Can change message',8,'change_message'),(29,'Can delete message',8,'delete_message'),(30,'Can add student info',9,'add_studentinfo'),(31,'Can change student info',9,'change_studentinfo'),(32,'Can delete student info',9,'delete_studentinfo'),(33,'Can view 轮播图',7,'view_banner'),(34,'Can view user',6,'view_expenduser'),(35,'Can view message',8,'view_message'),(36,'Can view student info',9,'view_studentinfo'),(37,'Can add Bookmark',10,'add_bookmark'),(38,'Can change Bookmark',10,'change_bookmark'),(39,'Can delete Bookmark',10,'delete_bookmark'),(40,'Can add log entry',11,'add_log'),(41,'Can change log entry',11,'change_log'),(42,'Can delete log entry',11,'delete_log'),(43,'Can add User Setting',12,'add_usersettings'),(44,'Can change User Setting',12,'change_usersettings'),(45,'Can delete User Setting',12,'delete_usersettings'),(46,'Can add User Widget',13,'add_userwidget'),(47,'Can change User Widget',13,'change_userwidget'),(48,'Can delete User Widget',13,'delete_userwidget'),(49,'Can view Bookmark',10,'view_bookmark'),(50,'Can view log entry',11,'view_log'),(51,'Can view User Setting',12,'view_usersettings'),(52,'Can view User Widget',13,'view_userwidget'),(53,'Can add student info to course',14,'add_studentinfotocourse'),(54,'Can change student info to course',14,'change_studentinfotocourse'),(55,'Can delete student info to course',14,'delete_studentinfotocourse'),(56,'Can view student info to course',14,'view_studentinfotocourse'),(57,'Can add 课程表',15,'add_course'),(58,'Can change 课程表',15,'change_course'),(59,'Can delete 课程表',15,'delete_course'),(60,'Can add course to teacher',16,'add_coursetoteacher'),(61,'Can change course to teacher',16,'change_coursetoteacher'),(62,'Can delete course to teacher',16,'delete_coursetoteacher'),(63,'Can add 学校表',17,'add_school'),(64,'Can change 学校表',17,'change_school'),(65,'Can delete 学校表',17,'delete_school'),(66,'Can add 教师表',18,'add_teacher'),(67,'Can change 教师表',18,'change_teacher'),(68,'Can delete 教师表',18,'delete_teacher'),(69,'Can view 课程表',15,'view_course'),(70,'Can view course to teacher',16,'view_coursetoteacher'),(71,'Can view 学校表',17,'view_school'),(72,'Can view 教师表',18,'view_teacher'),(73,'Can add category',19,'add_category'),(74,'Can change category',19,'change_category'),(75,'Can delete category',19,'delete_category'),(76,'Can add keyword',20,'add_keyword'),(77,'Can change keyword',20,'change_keyword'),(78,'Can delete keyword',20,'delete_keyword'),(79,'Can view category',19,'view_category'),(80,'Can view keyword',20,'view_keyword'),(81,'Can add 章节表',21,'add_chapter'),(82,'Can change 章节表',21,'change_chapter'),(83,'Can delete 章节表',21,'delete_chapter'),(84,'Can add 视频表',22,'add_video'),(85,'Can change 视频表',22,'change_video'),(86,'Can delete 视频表',22,'delete_video'),(87,'Can view 章节表',21,'view_chapter'),(88,'Can view 视频表',22,'view_video');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_userapp_expenduser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_userapp_expenduser_id` FOREIGN KEY (`user_id`) REFERENCES `userapp_expenduser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(19,'schoolapp','category'),(21,'schoolapp','chapter'),(15,'schoolapp','course'),(16,'schoolapp','coursetoteacher'),(20,'schoolapp','keyword'),(17,'schoolapp','school'),(18,'schoolapp','teacher'),(22,'schoolapp','video'),(5,'sessions','session'),(7,'userapp','banner'),(6,'userapp','expenduser'),(8,'userapp','message'),(9,'userapp','studentinfo'),(14,'userapp','studentinfotocourse'),(10,'xadmin','bookmark'),(11,'xadmin','log'),(12,'xadmin','usersettings'),(13,'xadmin','userwidget');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-11-26 13:06:39.402611'),(2,'contenttypes','0002_remove_content_type_name','2018-11-26 13:06:39.646481'),(3,'auth','0001_initial','2018-11-26 13:06:40.514971'),(4,'auth','0002_alter_permission_name_max_length','2018-11-26 13:06:40.702863'),(5,'auth','0003_alter_user_email_max_length','2018-11-26 13:06:40.726850'),(6,'auth','0004_alter_user_username_opts','2018-11-26 13:06:40.748838'),(7,'auth','0005_alter_user_last_login_null','2018-11-26 13:06:40.777821'),(8,'auth','0006_require_contenttypes_0002','2018-11-26 13:06:40.792812'),(9,'auth','0007_alter_validators_add_error_messages','2018-11-26 13:06:40.848781'),(10,'auth','0008_alter_user_username_max_length','2018-11-26 13:06:40.875763'),(11,'userapp','0001_initial','2018-11-26 13:06:42.464849'),(12,'admin','0001_initial','2018-11-26 13:06:43.029524'),(13,'admin','0002_logentry_remove_auto_add','2018-11-26 13:06:43.057508'),(14,'sessions','0001_initial','2018-11-26 13:06:43.174442'),(15,'xadmin','0001_initial','2018-11-26 13:06:44.527662'),(16,'userapp','0002_banner_url','2018-11-26 13:16:40.766807'),(17,'userapp','0003_banner_is_display','2018-11-26 14:51:57.978453'),(18,'userapp','0004_auto_20181126_2315','2018-11-26 23:15:15.169848'),(19,'userapp','0005_auto_20181126_2324','2018-11-26 23:25:03.564129'),(20,'userapp','0006_auto_20181126_2329','2018-11-26 23:29:05.190669'),(21,'schoolapp','0001_initial','2018-11-27 13:55:20.078491'),(22,'userapp','0007_auto_20181127_1355','2018-11-27 13:55:20.749104'),(23,'schoolapp','0002_auto_20181127_1444','2018-11-27 14:44:46.797230'),(24,'schoolapp','0003_auto_20181127_1529','2018-11-27 15:29:22.730962'),(25,'userapp','0002_remove_banner_url','2018-11-27 15:59:45.217755'),(26,'schoolapp','0004_course_category','2018-11-27 16:36:51.201297'),(27,'schoolapp','0005_course_status','2018-11-27 16:42:37.292790'),(28,'schoolapp','0006_course_school','2018-11-27 20:42:30.170370'),(29,'schoolapp','0007_auto_20181127_2113','2018-11-27 21:14:01.620741'),(30,'userapp','0003_banner_position','2018-11-28 22:42:36.484164'),(31,'userapp','0004_auto_20181128_2248','2018-11-28 22:48:16.946485'),(32,'schoolapp','0008_auto_20181128_2321','2018-11-28 23:21:12.316192'),(33,'schoolapp','0009_auto_20181128_2344','2018-11-28 23:44:50.601712'),(34,'schoolapp','0010_auto_20181129_0000','2018-11-29 00:00:18.678768'),(35,'schoolapp','0011_category_is_display','2018-11-29 00:05:36.881191'),(36,'schoolapp','0012_category_icon','2018-11-29 08:32:57.807016'),(37,'schoolapp','0013_auto_20181129_0937','2018-11-29 09:37:39.647301'),(38,'userapp','0005_studentinfo_school','2018-11-29 19:56:30.532198'),(39,'userapp','0006_auto_20181129_2119','2018-11-29 21:19:10.526898'),(40,'schoolapp','0014_course_add_time','2018-11-29 23:19:15.847927'),(41,'userapp','0007_auto_20181129_2318','2018-11-29 23:19:15.904894'),(42,'schoolapp','0015_auto_20181129_2322','2018-11-29 23:22:50.165840'),(43,'schoolapp','0016_remove_course_status','2018-11-30 11:16:50.466705'),(44,'schoolapp','0017_auto_20181201_1002','2018-12-01 10:02:49.822656'),(45,'schoolapp','0018_auto_20181201_1015','2018-12-01 10:15:59.187408'),(46,'schoolapp','0019_auto_20181201_1025','2018-12-01 10:25:28.986750');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0hhtrd3hmkkvsqzci6tql83w0b8l98a1','N2VlMDM0MGM5YTVmZDU3ZWQzZjU1N2IyYjk4NTU0Yzg1NTM3YTJjMDp7ImNvZGUiOiI3cTN0In0=','2018-12-13 23:13:56.468457'),('1gkc1kjg5mcr21a2gefjxmn9nc2jwn24','NGM1MDI5MzUzNjU3NjMwOGU3OGQxZjY2YTY3NTRhZDViMDY4ODk3Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcmFwcC52aWV3cy5Vc2VyQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImYwZjRlN2RmYzRiMTMxNzNhMDg5OWNkMTAyZDk1ZDljYWU1YzBkMzUiLCJMSVNUX1FVRVJZIjpbWyJ1c2VyYXBwIiwiYmFubmVyIl0sIiJdfQ==','2018-12-11 08:30:21.990252'),('34ylsarg7wncrrpkis3l4a75ywat8sw0','NTFiNDE1OWVkMTA5NmQ2ZWYwNWQ5MDQ5MjYyZTIyMzQ2ZTEyZTc0YTp7ImNvZGUiOiJ1bmJSIn0=','2018-12-13 23:13:29.128506'),('9wb6r8h8b5xzsx251r5nwcubs232d2cm','NDE3NDJjNGZhOWYxNmYwMmM4OGU2MWI3YzQ5ZTk3YjgwM2JjZjJlYTp7ImNvZGUiOiJ0c0FrIn0=','2018-12-12 23:24:00.137929'),('djgopjiiqscobteno1cotbjvivkmxojc','ZmU0Y2EwZWI5NDEwODNhNzg3N2Y3ODA5NjIyYmRjMGIzMGEzNTE5NTp7ImNvZGUiOiJXeE1DIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2VyYXBwLnZpZXdzLlVzZXJCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjBmNGU3ZGZjNGIxMzE3M2EwODk5Y2QxMDJkOTVkOWNhZTVjMGQzNSJ9','2018-12-13 13:06:22.934961'),('dns77sqgnnrm5xuk68638wz3xvlaefpc','OTJiNTVhYjhhNWVhYzQ0NGJhNTVjYTdlYTAzZWY2OTFmZDAzODgwNjp7ImNvZGUiOiJIVlI1In0=','2018-12-14 00:01:10.455860'),('duat1z8nx519luv1mmzmablvz7zuwo1p','Nzk4ZjQwYzJhM2UxY2UzNDEwMDIzYWQ5ZmVmYmRmODU1MDQ0YzllNTp7ImNvZGUiOiJUNlFTIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2VyYXBwLnZpZXdzLlVzZXJCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjBmNGU3ZGZjNGIxMzE3M2EwODk5Y2QxMDJkOTVkOWNhZTVjMGQzNSIsIkxJU1RfUVVFUlkiOltbInNjaG9vbGFwcCIsImNoYXB0ZXIiXSwiIl0sIm5hdl9tZW51IjoiW3tcInRpdGxlXCI6IFwiU2Nob29sYXBwXCIsIFwibWVudXNcIjogW3tcInRpdGxlXCI6IFwiXHU1MjA2XHU3YzdiXHU4ODY4XCIsIFwidXJsXCI6IFwiL3hhZG1pbi9zY2hvb2xhcHAvY2F0ZWdvcnkvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDh9LCB7XCJ0aXRsZVwiOiBcIlx1NTE3M1x1OTUyZVx1OGJjZFx1ODg2OFwiLCBcInVybFwiOiBcIi94YWRtaW4vc2Nob29sYXBwL2tleXdvcmQvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDl9LCB7XCJ0aXRsZVwiOiBcIlx1OGJmZVx1N2EwYlx1ODg2OFwiLCBcInVybFwiOiBcIi94YWRtaW4vc2Nob29sYXBwL2NvdXJzZS9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTB9LCB7XCJ0aXRsZVwiOiBcIlx1NjU1OVx1NWUwOFx1ODg2OFwiLCBcInVybFwiOiBcIi94YWRtaW4vc2Nob29sYXBwL3RlYWNoZXIvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDExfSwge1widGl0bGVcIjogXCJcdTViNjZcdTY4MjFcdTg4NjhcIiwgXCJ1cmxcIjogXCIveGFkbWluL3NjaG9vbGFwcC9zY2hvb2wvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDEyfSwge1widGl0bGVcIjogXCJcdTY1NTlcdTVlMDhcdTIwMTRcdThiZmVcdTdhMGJcdTg4NjhcIiwgXCJ1cmxcIjogXCIveGFkbWluL3NjaG9vbGFwcC9jb3Vyc2V0b3RlYWNoZXIvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDEzfSwge1widGl0bGVcIjogXCJcdTdhZTBcdTgyODJcdTg4NjhcIiwgXCJ1cmxcIjogXCIveGFkbWluL3NjaG9vbGFwcC9jaGFwdGVyL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxNH0sIHtcInRpdGxlXCI6IFwiXHU4OWM2XHU5ODkxXHU4ODY4XCIsIFwidXJsXCI6IFwiL3hhZG1pbi9zY2hvb2xhcHAvdmlkZW8vXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDE1fV0sIFwiZmlyc3RfdXJsXCI6IFwiL3hhZG1pbi9zY2hvb2xhcHAvY2F0ZWdvcnkvXCJ9LCB7XCJ0aXRsZVwiOiBcIlVzZXJhcHBcIiwgXCJtZW51c1wiOiBbe1widGl0bGVcIjogXCJcdTc1MjhcdTYyMzdcIiwgXCJ1cmxcIjogXCIveGFkbWluL3VzZXJhcHAvZXhwZW5kdXNlci9cIiwgXCJpY29uXCI6IFwiZmEgZmEtdXNlclwiLCBcIm9yZGVyXCI6IDN9LCB7XCJ0aXRsZVwiOiBcIlx1OGY2ZVx1NjRhZFx1NTZmZVwiLCBcInVybFwiOiBcIi94YWRtaW4vdXNlcmFwcC9iYW5uZXIvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDV9LCB7XCJ0aXRsZVwiOiBcIlx1NWI2Nlx1NzUxZlx1NGZlMVx1NjA2Zlx1ODg2OFwiLCBcInVybFwiOiBcIi94YWRtaW4vdXNlcmFwcC9zdHVkZW50aW5mby9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogNn0sIHtcInRpdGxlXCI6IFwiXHU1YjY2XHU0ZTYwXHU5MDA5XHU4YmZlXHU4ODY4XCIsIFwidXJsXCI6IFwiL3hhZG1pbi91c2VyYXBwL3N0dWRlbnRpbmZvdG9jb3Vyc2UvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDd9XSwgXCJmaXJzdF9pY29uXCI6IFwiZmEgZmEtdXNlclwiLCBcImZpcnN0X3VybFwiOiBcIi94YWRtaW4vdXNlcmFwcC9leHBlbmR1c2VyL1wifSwge1widGl0bGVcIjogXCJcdTdiYTFcdTc0MDZcIiwgXCJtZW51c1wiOiBbe1widGl0bGVcIjogXCJcdTY1ZTVcdTVmZDdcdThiYjBcdTVmNTVcIiwgXCJ1cmxcIjogXCIveGFkbWluL3hhZG1pbi9sb2cvXCIsIFwiaWNvblwiOiBcImZhIGZhLWNvZ1wiLCBcIm9yZGVyXCI6IDE3fV0sIFwiZmlyc3RfaWNvblwiOiBcImZhIGZhLWNvZ1wiLCBcImZpcnN0X3VybFwiOiBcIi94YWRtaW4veGFkbWluL2xvZy9cIn0sIHtcInRpdGxlXCI6IFwiXHU4YmE0XHU4YmMxXHU1NDhjXHU2Mzg4XHU2NzQzXCIsIFwibWVudXNcIjogW3tcInRpdGxlXCI6IFwiXHU3ZWM0XCIsIFwidXJsXCI6IFwiL3hhZG1pbi9hdXRoL2dyb3VwL1wiLCBcImljb25cIjogXCJmYSBmYS1ncm91cFwiLCBcIm9yZGVyXCI6IDJ9LCB7XCJ0aXRsZVwiOiBcIlx1Njc0M1x1OTY1MFwiLCBcInVybFwiOiBcIi94YWRtaW4vYXV0aC9wZXJtaXNzaW9uL1wiLCBcImljb25cIjogXCJmYSBmYS1sb2NrXCIsIFwib3JkZXJcIjogNH1dLCBcImZpcnN0X2ljb25cIjogXCJmYSBmYS1ncm91cFwiLCBcImZpcnN0X3VybFwiOiBcIi94YWRtaW4vYXV0aC9ncm91cC9cIn1dIn0=','2018-12-16 11:27:14.945698'),('dv02vp5mk86dr94ispdobd70w848634m','NTM2YTVhMmYwMTA4ZDEwYjk5ZmRkYmIyOTE0Y2EyZmNmMmRkY2JiNzp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcmFwcC52aWV3cy5Vc2VyQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjQyMjQyNzdhYTU3MDJlZTEzZDc3OTFjNGI5NTYwYmY4ZDc0Y2Q2OTIiLCJMSVNUX1FVRVJZIjpbWyJzY2hvb2xhcHAiLCJzY2hvb2wiXSwiIl19','2018-12-14 19:34:46.483917'),('gd8v4fpektolb9axqkebfvp2h763c8s5','M2U1YmQwNjRlMGFjZjQ1ZGJjYjZhOWIwYjllNWM2YjgwMWJkMzkwZjp7ImNvZGUiOiJoVVdDIn0=','2018-12-14 08:36:37.919245'),('o8fl2f6igfrw9yrzv8a60yc3ban0b67d','ZGIzZjQ2M2Y5OWI2OWU5ZmIyNGQ4OGFiYTQ1OThhNzQwYmZhNDZmNTp7ImNvZGUiOiJwazRzIn0=','2018-12-14 09:04:00.220130'),('ro64i1q3fdvx0dxzm5s1u13nsicwgbrt','Zjk4ZWZlOGNhOTQyYzNiMmMyYTVhNDZjMWVjMTEyY2Q4MjA1MzVhNTp7ImNvZGUiOiJjRkhHIn0=','2018-12-11 00:02:27.580393'),('ssmvh2p4o80vq1obh8y2yaib21lguxu2','MDVlYTU2YjQzZTZiYjczMmFhYjc5MDQ0MDg1NjJiNmQxYTI5M2VkYTp7ImNvZGUiOiJqQktzIn0=','2018-12-10 23:55:53.726104'),('u4i44zl33dqpxs5xq0ltjtb0su75zof5','ODFkMzI2ZTdkYjI5ZTBmNWQzOWU1MTI4N2YwOWY4YzlkYTFmY2UxNzp7ImNvZGUiOiJWTUhnIn0=','2018-12-14 19:32:03.567385'),('vlmi9xmzmpnobtocirjlwr36lfx0ucnw','ZTQwZmI1MDFjOTkyYzRiMDE1ODBlOTdiZjgwNmFlNjhiNDg0OTM3YTp7ImNvZGUiOiJibUtzIn0=','2018-12-14 22:11:07.775320');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schoolapp_category`
--

DROP TABLE IF EXISTS `schoolapp_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `schoolapp_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `titleBackgroundImgage` varchar(100) DEFAULT NULL,
  `bodyBackgroundImgage` varchar(100) DEFAULT NULL,
  `is_display` tinyint(1) NOT NULL,
  `icon` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schoolapp_category`
--

LOCK TABLES `schoolapp_category` WRITE;
/*!40000 ALTER TABLE `schoolapp_category` DISABLE KEYS */;
INSERT INTO `schoolapp_category` VALUES (1,'理学▪工学','background/2018/11/171031004430_e4db39_理学工学.png','background/2018/11/171031004424_4f42d5_理学工学.jpg',1,'yisheng'),(2,'计算机','background/2018/11/171031004724_91d792_计算机.png','background/2018/11/171031004720_9921dd_计算机2.jpg',1,'jisuanji'),(3,'教育▪语言','background/2018/11/171031004930_754424_教育语言.png','background/2018/11/171031004926_d9041e_教育语言2.jpg',1,'jiaoyuyuyan'),(4,'文学▪艺术','background/2018/11/171031005121_01a441_文学艺术.png','background/2018/11/171031005118_cb472f_文学艺术2.jpg',1,'wenxueyishu'),(5,'创业▪职场','background/2018/11/171103124700_4e2764_创业职场.png','background/2018/11/171103124651_b0d877_创业职场2.jpg',1,'chuangyezhichang'),(6,'哲史▪文化','','',0,'zeshiwenhua'),(7,'经济▪管理','','',0,'jingjiguanli'),(8,'医学▪农学','','',0,'yixuenonxue'),(9,'心理学','','',0,'xinlixue'),(10,'社会▪法律','','',0,'shehuifalv');
/*!40000 ALTER TABLE `schoolapp_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schoolapp_chapter`
--

DROP TABLE IF EXISTS `schoolapp_chapter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `schoolapp_chapter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schoolapp_chapter_course_id_726e63b3_fk_schoolapp_course_id` (`course_id`),
  CONSTRAINT `schoolapp_chapter_course_id_726e63b3_fk_schoolapp_course_id` FOREIGN KEY (`course_id`) REFERENCES `schoolapp_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schoolapp_chapter`
--

LOCK TABLES `schoolapp_chapter` WRITE;
/*!40000 ALTER TABLE `schoolapp_chapter` DISABLE KEYS */;
INSERT INTO `schoolapp_chapter` VALUES (1,'1 音乐与健康概论',9),(2,'2 中国古代的音乐养生',9),(3,'3 西方的音乐治疗',9),(4,'1 第一讲 中华地向城边尽',1),(5,'2 第二讲 南人垂泪北人笑',1),(6,'1  计算机基础知识',2),(7,'2  计算理论与计算模型',2),(8,'1 绪论',3),(9,'2 生命的意义',3),(10,'3 幸福与你同行',3),(11,'4 价值观与人生发展',3),(12,'1  第1章 绪论-物理思想与人文精神',5),(13,'2  第2章 经典力学的建立和发展',5),(14,'1 Roots about Hearing, Seeing, Saying and Doing',4),(15,'2 Roots about Holding, Seizing and Following',4);
/*!40000 ALTER TABLE `schoolapp_chapter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schoolapp_course`
--

DROP TABLE IF EXISTS `schoolapp_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `schoolapp_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `english_title` varchar(240) NOT NULL,
  `introduction` longtext NOT NULL,
  `start_time` date DEFAULT NULL,
  `end_time` date DEFAULT NULL,
  `credit` int(11) NOT NULL,
  `teaching_mode` int(11) NOT NULL,
  `period` int(11) DEFAULT NULL,
  `language` int(11) NOT NULL,
  `frequency` int(11) DEFAULT NULL,
  `total_student` int(11) DEFAULT NULL,
  `favorite_count` int(11) DEFAULT NULL,
  `picture` varchar(100) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `add_time` date,
  PRIMARY KEY (`id`),
  KEY `schoolapp_course_school_id_35cd06ad_fk_schoolapp_school_id` (`school_id`),
  KEY `schoolapp_course_category_id_5a61601f` (`category_id`),
  CONSTRAINT `schoolapp_course_category_id_5a61601f_fk_schoolapp_category_id` FOREIGN KEY (`category_id`) REFERENCES `schoolapp_category` (`id`),
  CONSTRAINT `schoolapp_course_school_id_35cd06ad_fk_schoolapp_school_id` FOREIGN KEY (`school_id`) REFERENCES `schoolapp_school` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schoolapp_course`
--

LOCK TABLES `schoolapp_course` WRITE;
/*!40000 ALTER TABLE `schoolapp_course` DISABLE KEYS */;
INSERT INTO `schoolapp_course` VALUES (1,'品诗论史','Appreciation and discussion of history through Chinese classical poems','<p>&nbsp; &nbsp; 中国历史悠久、深厚、精彩。史家论史，著作、文章，文字往往厚重、板重，一般读者容易厌倦。诗家论史，诗词歌曲，简洁而生动，情深而意长，往往思之有致，味之无极，是读史的传神“阿堵”。因此，特开课程《品诗论史》，假道诗歌，走进历史。\r\n\r\n凡对中国文化充满好奇，对古典诗词饶有兴趣，对中国历史抱有热情者，无论年级、无论专业，均可选修。以诗会友，谈古论今，启迪思想，言说新意。</p><p><br/> </p><p><img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/> <img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/> <img src=\"http://img.baidu.com/hi/jx2/j_0016.gif\"/> </p>','2018-12-05','2018-12-11',2,2,36,1,1,4,3,'course/2018/11/181105102838_44fc62_180202071250_0455dd_品诗论史改_1_XfskLct.jpg',6,1,'2018-11-06'),(2,'大学计算机','Fundamentals of Computer','<p>&nbsp; &nbsp; 课程简介\r\n &nbsp; &nbsp;《大学计算机》课程是大学本科生必修的一门公共基础课程，它是根据教育部高等学校大学计算机课程教学指导委员会制订的“1+X”课程设置方案开设的第一门计算机课程。与大学数学、大学物理一样，大学计算机课程应讲授计算学科中具有基础性和普适性的核心概念、方法和技术。通过本课程的学习，使学生不仅掌握计算机科学技术的基础知识，而且让学生初步具备利用计算机分析问题和解决问题的能力。引导学生将计算机解决问题的思想和方法应用到各自的专业领域中。《大学计算机》课程内容主要有：计算机基础知识、计算理论与计算模型、算法基础、程序设计基础、计算机硬件基础、计算机软件基础、IT新技术以及大学计算机素质教育等。课程实验内容涉及操作系统、办公软件、算法工具、计算机网络等。使学生能在熟练使用办公软件和算法工具的基础上，进一步提高计算机的应用能力。</p><p><img src=\"/media/course/ueditor\" title=\"\" alt=\"学计算机.jpg\"/> </p>','2018-11-15','2018-11-30',2,1,36,1,1,3,3,'course/2018/11/学计算机.jpg',2,1,'2018-11-29'),(3,'积极心理学','Positive Psychology','<p>&nbsp; &nbsp; 积极心理学是一门关于“幸福的科学”，与我们每个人的工作、生活、家庭、教育和爱息息相关。本课程关注普通人的积极力量和积极品质，研究如何让人活的更幸福，获得积极的心理感受。它告诉我们幸福不是望不可及的，每个人都可以通过学习新方法、新技巧及建立新习惯来获得幸福。幸福感是人生追求的目标。你如何理解幸福?你要营造什么样的心态，才能在现在的大学校园生活和今后的成家立业、个人发展、创造价值的过程中体验到人生的美好、快乐与幸福？本课程将全方位地向你展现通向幸福人生的认知思路，启迪你的自我人文关怀修养，帮助你从思维的必然王国迈向自由王国。</p>','2018-11-19','2018-12-07',2,2,36,1,1,3,2,'course/2018/11/181105103128_4625a3_180202071419_bc03bf_积极心理学.jpg',9,1,'2018-11-29'),(4,'拓展英语词汇','Increasing Your Word Power','<p>&nbsp; &nbsp; <img src=\"http://img.baidu.com/hi/jx2/j_0053.gif\"/>课程简介\r\n &nbsp; &nbsp; 《拓展英语词汇》MOOC课程旨在帮助非英语专业本科生掌握英语词汇学习的有效方法，扩大词汇量，为其在阅读、翻译和写作等方面的学习奠定扎实的基础。本课程的教学内聚焦于英语词根词缀法，中外主讲教师采用对话的形式，为词汇的学习设置理想的语境，辅助以语义网络法、关键词法和图像联想法，强化记忆。课程内含国学经典、希腊神话、流行元素、电影传媒等主题系列，寓词汇学习于文化理解之中。课程的每个单元都包含微视频和配套练习，方便学生学习课程内容。线上学习和线下辅导相结合，确保学习效果。</p>','2018-11-15','2018-12-01',2,1,32,2,1,2,0,'course/2018/11/170925030930_49353d_4adc8372-7524-485c-a73e-b88197ef4bc7_thumb.png',3,5,'2018-11-29'),(5,'物理与文化','physics and culture','<p><img src=\"http://img.baidu.com/hi/jx2/j_0048.gif\"/>&nbsp; &nbsp;&nbsp;</p><p>课程简介\r\n对于任何人，不关心科学就是睁着眼走向奴役！\r\n\r\n &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;——J.Bronowski,哲学家和科学家\r\n\r\n &nbsp; 眼下的中国大学，变化剧烈，选择什么样的方式，以什么样的眼光，能将物理思想和文化精神结合、浓缩在一门课程中，是我们团队每天都在不停思索的问题。我们追求的是希望作一门简单有趣的科学素养课，而不是山高一样的物理课本和“黑洞一样的物理知识”，我们更期待的是，大家能够在课程中获得启迪和科学素养的提高，因为这是一个需要科学和文化融合的新时代。《物理与文化》在线开放课程，以河南理工大学《物理与文化》精品课程和河南省精品视频公开课为基础，通过通俗的语言、精彩的案例、诙谐幽默的小故事和严谨的授课等方式，向听众介绍物理现象以及那个年代物理学家的思维方法，并结合文化生活，阐述其中的物理原理和文化精神，旨在让听众通过轻松的讲座了解物理学，喜欢物理学，走进物理学，同时也培养听众的物理学兴趣、学会用科学的思维方法解决专业和生活中上面临的问题。</p>','2019-11-06','2019-11-13',2,1,32,1,1,3,1,'course/2018/11/170817024814_09deb4_0462c062-8e37-4d4c-a17d-299251fa451d_thumb.png',1,7,'2018-10-17'),(6,'C君带你玩编程','The C Language Programming','<p><img src=\"http://img.baidu.com/hi/jx2/j_0007.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0003.gif\"/>&nbsp;&nbsp;</p><p>&nbsp; 课程简介\r\n课程荣获大中华区首届优秀慕课选拔赛团体贡献铜奖、中国高校计算机MOOC联盟优秀课程、建设课程称号。为了使学习者轻松学习编程，课程采用学习者熟知的现象引入知识点，引领学习者探寻程序设计的前世与今生，结合专业的设计案例将帮助学习者利用计算机解决专业领域的问题，等考辅导视频则能帮助学习者获取NCRE证书，硬件设计案例能让大家学以致用。\r\n\r\n逻辑严密出美的境界，简洁绽放内涵的深邃。C君牵你的手，纵贯古今、融通中外，采撷精彩的代码，谱写人类独有的智慧之诗。Error与Warning的迷惑、捕捉Bug的悬疑、算法成功的狂喜……我们将亲手为冰冷的机器注入灵魂、打开CPU的世界、探索1和0构建的二次元的神奇。结合专业知识、驱动硬件、兼顾NCRE证书的获取……是本课程现实与独特的美。C君等你，一起玩编程吧！</p>','2018-12-12','2018-12-08',3,1,36,1,1,1,1,'course/2018/11/170825024719_db7644_2c816353-e387-44d5-8ce7-00b6482646a2_thumb.png',2,10,'2018-11-29'),(7,'古典文学的城市书写','City Landscape and Classic Literature of China','<p>&nbsp; &nbsp; 课程简介\r\n &nbsp; &nbsp;本课程在遵循古典文学教学重视文本阅读、经典赏析的教学传统之同时，更将区域文化研究与文学地理学、文学景观学等现代研究的新视角和新方法以及现代网络教学技术融入到教学过程中。\r\n\r\n &nbsp;&nbsp;</p><p><img src=\"/media/course/ueditor\" title=\"\" alt=\"459b8f91c71b928e.jpg\"/>&nbsp;本课程通过诗词等传统文学作品中的讲解，对中国主要历史文化名城的历史文化进行系统深入的讲解，进而深入剖析各城市的文化精神及其传承脉络。其中既有古典文学对城市自然生态、景观风物、社会风貌、岁时风俗、风土人情的描写，有城市历史中重大事件在诗歌等传统文学样式中的表现以及情感层累所形成的集体记忆，也有文学艺术活动所形成的城市人文景观与城市人文历史内涵之积淀，也有传统文学书写与城市文化精神的传承关系……总之，这是一门集学术性、知识性、趣味性于一炉的课程。</p>','2018-11-24','2018-12-08',3,2,32,1,1,1,1,'course/2018/11/170814040446_217369_03e3e024-dd1b-46c4-a106-a6ddc8f91286_thumb_1_ewl20sA.png',4,13,'2018-11-29'),(8,'沟通技巧','Communications Skills','<p><img src=\"http://img.baidu.com/hi/jx2/j_0017.gif\"/>&nbsp; &nbsp;</p><p>&nbsp;日常生活和工作中，沟通和我们每个人，如影随行，密不可分。我们每个人的生活都离不开三个圈：家庭圈、朋友圈和工作圈。为什么有的家父慈子孝、幸福美满？为什么有的人高朋满座，人见人爱？为什么有的人事业顺利，平步青云？ 众多的原因之中，讲究沟通技巧当居头功！\r\n\r\n &nbsp; &nbsp;口若悬河，说不到点子上，也只是废话！只言片语，说到心坎里，就是金玉良言！良言一句三冬暖，恶语伤人六月寒。沟通是一门讲策略重技巧的学问。说悦耳的话，做暖心的事。多一些理解，少一点误会。\r\n\r\n &nbsp; &nbsp;“沟通技巧”既是一门学科，更是一门艺术。“沟通技巧”课程重点训练和提升学生的沟通技能，让学生体会沟通艺术的精髓，使学生学会根据情境的变化，灵活运用所学的沟通策略和沟通技巧，得心应手地处理生活和工作中遇到的各种沟通问题，从而提高生活质量和工作效率，实现人际和谐，助力事业成功。</p><p><img src=\"/media/course/ueditor\" title=\"\" alt=\"170904025334_42f1e9_61c8c582-c0e8-4bf9-bff4-2c180944e960_thumb.png\"/> </p>','2018-11-04','2018-12-08',2,1,32,1,1,2,1,'course/2018/11/170904025334_42f1e9_61c8c582-c0e8-4bf9-bff4-2c180944e960_thumb_NJaANOL.png',5,1,'2018-11-01'),(9,'音乐与健康','music and health','<p>&nbsp; &nbsp; 课程简介\r\n课程介绍\r\n\r\n本课程精心设计了音乐与健康、治疗、养生、音乐处方单等八个专题的内容，适合喜爱音乐和关注身心健康的人群。课程内容新颖、实用，讲授通俗易懂，师生互动自然而和谐，适合普通大众也适合全体大学生。本课程共计2个学分。\r\n\r\n\r\n\r\n教学特色\r\n\r\n1.聚焦热点。健康是所有人永恒的追求，音乐又是人们日常生活中离不开的心灵“良药”。生活中可谓到处都有音乐，因此这两者的结合可谓是聚焦了热点。清代医家吴尚先说：“看花解闷，听曲消愁，有胜于服药者。”从美育和教化的角度来看，音乐有升华情感、净化灵魂的作用，对于校正人的异常行为等，音乐有着药物难以起到的作用。\r\n\r\n2.内容丰富。本课程从健康的定义入手，从身体，心理以及社会适应能力三个方面来讲述音乐与健康的关联，并讲解了人们关注的音乐与治疗，音乐胎教以及音乐养生等方面的热点话题，并从实践角度教大家如何简单易行得对自己进行生活化的音乐治疗。\r\n\r\n3.实录视频案例。本课程运用大量高水平的由专业演奏家和演唱家的现场实录视频和采访花絮（都是为此次慕课特别订制），加强听众的直观感受，让音乐直抵人内心深处，有着强烈的听觉和视觉冲击力。\r\n\r\n4.深入浅出。本课程语言通俗易懂、教师授课富有激情并不乏幽默、与学生互动积极自然、案例简明易懂，课程逻辑严谨，图文混合讲解。易被不同文化层次的人群理解。<img src=\"/media/course/ueditor\" title=\"\" alt=\"170823181131_fc5aa7_a3956db5-b7f7-4693-a94a-0f8bd94c86ec_thumb.png\"/> </p><p><br/> </p>','2019-12-18','2019-12-31',2,2,26,1,1,1,1,'course/2018/12/170823181131_fc5aa7_a3956db5-b7f7-4693-a94a-0f8bd94c86ec_thumb.png',4,14,'2018-10-01');
/*!40000 ALTER TABLE `schoolapp_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schoolapp_coursetoteacher`
--

DROP TABLE IF EXISTS `schoolapp_coursetoteacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `schoolapp_coursetoteacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_primary` tinyint(1) NOT NULL,
  `course_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `schoolapp_coursetoteacher_course_id_teacher_id_8382062c_uniq` (`course_id`,`teacher_id`),
  KEY `schoolapp_coursetote_teacher_id_e24aa67d_fk_schoolapp` (`teacher_id`),
  CONSTRAINT `schoolapp_coursetote_course_id_3651167b_fk_schoolapp` FOREIGN KEY (`course_id`) REFERENCES `schoolapp_course` (`id`),
  CONSTRAINT `schoolapp_coursetote_teacher_id_e24aa67d_fk_schoolapp` FOREIGN KEY (`teacher_id`) REFERENCES `schoolapp_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schoolapp_coursetoteacher`
--

LOCK TABLES `schoolapp_coursetoteacher` WRITE;
/*!40000 ALTER TABLE `schoolapp_coursetoteacher` DISABLE KEYS */;
INSERT INTO `schoolapp_coursetoteacher` VALUES (1,1,1,1),(2,0,1,2),(3,1,2,3),(4,0,2,4),(5,1,3,5),(6,0,3,6),(7,1,4,7),(8,0,4,8),(9,1,6,10),(10,1,5,9),(11,1,7,11),(12,1,8,12),(13,1,9,13);
/*!40000 ALTER TABLE `schoolapp_coursetoteacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schoolapp_keyword`
--

DROP TABLE IF EXISTS `schoolapp_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `schoolapp_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(20) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `keyword` (`keyword`),
  KEY `schoolapp_keyword_category_id_a8d63dcd_fk_schoolapp_category_id` (`category_id`),
  CONSTRAINT `schoolapp_keyword_category_id_a8d63dcd_fk_schoolapp_category_id` FOREIGN KEY (`category_id`) REFERENCES `schoolapp_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schoolapp_keyword`
--

LOCK TABLES `schoolapp_keyword` WRITE;
/*!40000 ALTER TABLE `schoolapp_keyword` DISABLE KEYS */;
INSERT INTO `schoolapp_keyword` VALUES (1,'地质及材料',1),(2,'物理',1),(3,'电气信息',1),(4,'自然生命科学',1),(5,'工业',1),(6,'土木',1),(7,'数学',1),(8,'化学',1),(9,'网络科技',2),(10,'产品设计',2),(11,'应用',2),(12,'软件工程',2),(13,'数据库',2),(14,'编程语言',2),(15,'计算机基础',2),(16,'运动健身',3),(17,'教育学',3),(18,'小语种',3),(19,'汉语',3),(20,'英语',3),(21,'设计',4),(22,'媒体',4),(23,'艺术',4),(24,'文学',4),(25,'创业指南',5),(26,'就业指导',5),(27,'职场经验',5);
/*!40000 ALTER TABLE `schoolapp_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schoolapp_school`
--

DROP TABLE IF EXISTS `schoolapp_school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `schoolapp_school` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `picture` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schoolapp_school`
--

LOCK TABLES `schoolapp_school` WRITE;
/*!40000 ALTER TABLE `schoolapp_school` DISABLE KEYS */;
INSERT INTO `schoolapp_school` VALUES (1,'深圳大学','school/2018/11/180524040828_183953_bd5aa748cdcd9913.jpg'),(2,'长春大学','school/2018/11/8b3253a708dffc0f.jpg'),(3,'广州大学','school/2018/11/5e998f113089746d.jpg'),(4,'安徽建筑大学','school/2018/11/0e70ee7aa1a5692e.jpg'),(5,'青岛大学','school/2018/11/dd575eb4c752a4a1.jpg'),(7,'河南理工大学','school/2018/11/180910015834_52ad6f_微信图片_20180910095822.jpg'),(8,'哈尔滨学院','school/2018/11/31426d1be231ef48.jpg'),(9,'广西科技大学','school/2018/11/c49991f542477162.jpg'),(10,'昆明理工学院','school/2018/11/45b2ea9b99fecbd2.jpg'),(11,'西安交通大学','school/2018/11/459b8f91c71b928e.jpg'),(12,'河南大学','school/2018/11/76fba751bc20979a.jpg'),(13,'苏州大学','school/2018/11/a1ef44263882778f.jpg'),(14,'宁波大学','school/2018/11/454682d3fa2e0d9e.jpg');
/*!40000 ALTER TABLE `schoolapp_school` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schoolapp_teacher`
--

DROP TABLE IF EXISTS `schoolapp_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `schoolapp_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `position` int(11) NOT NULL,
  `introduce` longtext,
  `avatar` varchar(100) NOT NULL,
  `school_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schoolapp_teacher_school_id_ab6bb8fc_fk_schoolapp_school_id` (`school_id`),
  CONSTRAINT `schoolapp_teacher_school_id_ab6bb8fc_fk_schoolapp_school_id` FOREIGN KEY (`school_id`) REFERENCES `schoolapp_school` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schoolapp_teacher`
--

LOCK TABLES `schoolapp_teacher` WRITE;
/*!40000 ALTER TABLE `schoolapp_teacher` DISABLE KEYS */;
INSERT INTO `schoolapp_teacher` VALUES (1,'章必功',1,'主讲人章必功教授，安徽铜陵人，全国优秀教师，2005年4月至2012年7月任深圳大学校长。主要研究方向：中国古代文学、中国古典文艺学、中国传统文化。代表作有《文体史话》、《红楼讲稿》、《中国旅游史》、《元好问及金人诗传》、《天问讲稿》等。 章教授热衷于中国古典文史哲的融贯汇通和激浊扬清，形成了一种生动活泼、深入浅出、雅俗共赏的学术风格。三十余年扎根高校，深谙中国高等教育变革，致力中国古典文学的传承，身体力行，见解独到，学识渊博，学养深厚，深得同行尊敬，师生喜爱。','tch_avatar/2018/11/55db2c5fe4b0529fd540a200.jpg',1),(2,'周萌',2,'北京大学中文系文学博士，深圳大学文学院中文系副教授，主要从事中国文学批评史研究。出版专著《唐五代僧人诗格研究——以僧皎然〈诗式〉为中心》、《史海传灯照长天——〈资治通鉴〉司马光述评集讲》、《决策与抉择——十五朝兴亡启示录》，在国内外学术刊物发表论文若干篇。','tch_avatar/2018/11/5588e044498e2975b5ef1e08.JPG',1),(3,'王志强',1,'研究领域 多媒体技术，Petri网，计算机教育 论文与著作 [1]以计算思维为导向的大学计算机基础课程教学改革研究，工业和信息化教育，2014(6):19-22 [2]基于计算思维的计算机基础课程改革研究，中国大学教学，2013(6):59-60,36 [3]Supervisory Arc of Petri Nets and Its Application on Traffic Signal Control System, ACAI 2012 [4]多媒体应用基础，高等教育出版社，2012.1 (“十二五”普通高等教育本科国家级规划教材) [5]计算思维导论，高等教育出版社，2012.9 (“十二五”普通高等教育本科国家级规划教材) 荣誉与奖励 获得广东省高等教育教学成果一等奖2次，二等奖3次 王志强老师电子邮箱：wangzq@szu.edu.cn','tch_avatar/2018/11/1.jpeg',1),(4,'陈国良',1,'研究领域 并行算法、高性能计算及其应用等。 论文与著作 承担了国家863计划、国家973计划、国家攀登计划、国家自然科学基金等10多项科研项目，发表论文200多篇，出版学术著作和教材10多部。 荣誉与奖励 曾获得国家科技进步二等奖、教育部科技进步一等奖、水利部大禹一等奖、中国科学院科技进步二等奖和自然科学三等奖、国家级教学成果二等奖、首届全国高等学校教学名师奖、CCF杰出教育奖、安徽省重大科技成就奖等共20多项，并获安徽省劳动模范称号。','tch_avatar/2018/11/2.jpeg',1),(5,'王晓钧',1,'王晓钧教授，男，1956年生，陕西西安人，中共党员。发展与教育心理学专业硕士生导师。西北大学物理学系激光专业毕业，陕西师范大学心理学硕士。1996年到深圳大学任教，历任深圳大学师范学院教育系心理学教研室主任，深圳大学应用心理学研究与咨询中心常务副主任，深圳大学师范学院心理学系主任。2002年晋升为教授。长期从事心理测量学，社会与管理心理学研究。先后出版《当代心理测量》、《嫉妒论—人类嫉妒心理、文化及行为研究》、《大学生心理健康—理论、测量与咨询》等专著6本，在《中国社会科学》、《心理学报》、《心理科学》、《华东师范大学学报》、《陕西师范大学学报》、《学术研究》等权威及核心期刊上发表学术论文30余篇。','tch_avatar/2018/11/540ea78253703d8b3b561a05.jpg',1),(6,'高秋凤',3,'高秋凤，女，1977年出生，深圳大学应用心理学系教师，国际PPT培训讲师，深圳市总工会讲师团成员，心理咨询师培训讲师。先后在《Computers in human behavior》、《心理科学》、《心理与行为研究》、《中国临床心理学杂志》、《华南师范大学学报》等杂志上发表论文10余篇，其中CSSCI收录5篇，SSCI一区文章1篇，合著专著2部，《大学生心理健康》及《管理心理学》，主持校级课题4项，先后参与多项国家级省部级课题。','tch_avatar/2018/11/5427bf275370243d07484241.jpg',1),(7,'李秀清',1,'《中西原典文化》等，是国家级精品视频公开课《教育观》课程负责人。近年来主持山东省社会科学规划办项目、山东省教育厅高等学校教学改革课题等十余项教学研究课题，获得青岛大学教学成果一等奖和山东省高等教育教学成果三等奖，在CSSCI和全国中文核心期刊发表论文，获得青岛大学“教学名师”和“美国密苏里州立大学教学贡献证书”等荣誉。主要研究领域是大学英语教学和跨文化交际。','tch_avatar/2018/11/d67fd642-4695-4487-8345-33bd0518f090.png',5),(8,'张惠',3,'张惠，青岛大学公共外语教育学院讲师，硕士。从事大学英语教学研究工作，讲授《交际英语教程》、《英语听说》和《全新版大学英语教程》等课程。研究领域为翻译实务和大学英语教学。在翻译方面，主持市厅级项目2项；译著一部《装饰新思维—视觉艺术中的愉悦和意识形态》。在教学方面，主持校级教研项目1项；参加市厅级项目3项和多项校级项目；参编《21世纪大学艺术英语教程》等教材','tch_avatar/2018/11/95ff7244-2a51-4cc8-9797-b6385e9c4566.png',5),(9,'薛中会',1,'河南理工大学副教授，物理学博士，长期从事物理学教学与研究工作，河南理工大学教学一等奖获得者，河南理工大学教学示范教师。主持河南省精品视频公开课《物理与文化》。本课程中，负者整体规划、设计，课程平台的建设，主讲第一章和第八章。','tch_avatar/2018/11/588A0335.JPG',7),(10,'方娇莉',2,'女，1973年生，副教授，中国高校计算机MOOC联盟云南省工作委员会秘书长，教育部在线教育研究中心\"智慧教学之星\"。主持2项教育部校企合作协同育人项目，主持和参与25项全国计算机基础教育、省厅“十二五”规划、校级科研教改项目，获得6项发明专利、5项实用新型专利和22项软件著作权，主编、副主编和参编教材13部，公开发表论文35篇。作为负责人主持建设的“C君带你玩编程”慕课课程荣获首届大中华区慕课选拔赛团体贡献铜奖，荣获云南省教育教学科研成果二等奖、昆明理工大学教学成果特等奖、一等奖，荣获云南省首届高校教师教学比赛一等奖、云南省高校计算机课程优秀教师奖、CMOOC联盟优秀教学案例三等奖、红云园丁模范教师奖、昆明理工大学首届师德标兵、首届多媒体教学比赛特等奖、首届“爱岗敬业、为人师表”十杰青年教师奖、伍达观先进教师奖、优秀党员及岗位标兵等荣誉称号，指导学生参加中国大学生计算机设计大赛获得国家级二、三等奖。\r\n\r\n潘晟旻','tch_avatar/2018/11/1fddc39c-4085-4d2b-88b2-b93274fc8ddd.png',10),(11,'杨旭辉',1,'【研究领域】 中国古代文学 【主要著作】 1、《清代经学与文学——以常州文人群体为典范的研究》，凤凰出版社2006年 2、《阳湖文派研究》，江苏人民出版社2010年 3、《清代骈文史》，人民出版社2013年 4、《拷问盛世》，中原农民出版社2008年 5、《纳兰平生纳兰词》，中原农民出版社2011年 6、《中国历代题画诗》（合著，第二作者），语文出版社2006年 7、《唐诗鉴赏大辞典》（主编），中华书局2011年 8、《唐宋词鉴赏大辞典》（主编），中华书局2012年 9、《尤侗集》（古籍整理），上海古籍出版社2015年 10、《中国文学史》（黄人著，杨旭辉点校整理），苏州大学出版社2015年版','tch_avatar/2018/11/5408144f53703d8b3b5605db.jpg',13),(12,'张转玲',2,'深圳大学管理学院人力资源管理系副教授，硕士生导师。深圳市社会保障基金监督委员会委员。主要研究领域为沟通学、组织行为和人力资源管理。教授MBA的《管理沟通》、《现代员工关系》，本科生的《沟通技巧》、《管理沟通》《组织行为学》、《社会保障学》、《企业经营管理》等课程。主持广东省哲学社会科学研究项目1项，参与省部级科研项目3项，主持深圳市哲学社会科学研究项目1项，主持企业横向项目3项。在国内重要学术期刊上发表论文10余篇。曾为深圳市南山公安分局、盐田民政局、大鹏新区城建局、深圳市公园管理中心等多个政府部门进行管理人员“沟通技能”培训。','/static/img/user_default.jpg',1),(13,'王蕾',2,'王蕾, 浙江宁波人,音乐教育学硕士,宁波大学音乐学院院长助理，美国哥伦比亚大学访问学者,长期从事音乐欣赏，音乐教学法，音乐治疗等方面的教学，多年来一直致力于推广经典音乐的普及化和生活化，她也被誉为是宁波大学最快乐的“杯子”老师，授课风格激情幽默，师生互动积极自然。获多项省市级教学奖项，2014年浙江省高校第二届微课教学比赛一等奖，宁波市艺术教育“晨风奖”获得者,宁波大学教学成果奖一等奖等，2014年当选为首届宁波大学最美导师，2015年荣获“王宽诚育才奖”。2016年荣获浙江省第九届高校青年教师教学技能大赛特等奖，浙江省教育系统“三育人”先进个人，宁波市优秀教师等荣誉称号。','tch_avatar/2018/11/8c6c852b-29b1-432c-bb3e-f9fa73568a73.png',14);
/*!40000 ALTER TABLE `schoolapp_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schoolapp_video`
--

DROP TABLE IF EXISTS `schoolapp_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `schoolapp_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `addr` varchar(200) DEFAULT NULL,
  `chapter_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schoolapp_video_chapter_id_4c0946a1_fk_schoolapp_chapter_id` (`chapter_id`),
  CONSTRAINT `schoolapp_video_chapter_id_4c0946a1_fk_schoolapp_chapter_id` FOREIGN KEY (`chapter_id`) REFERENCES `schoolapp_chapter` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schoolapp_video`
--

LOCK TABLES `schoolapp_video` WRITE;
/*!40000 ALTER TABLE `schoolapp_video` DISABLE KEYS */;
INSERT INTO `schoolapp_video` VALUES (1,'1.1  计算机概述','http://source3.uooconline.com/course349/video/%E7%A7%AF%E6%9E%81%E5%BF%83%E7%90%86%E5%AD%A6%20%E5%AE%A3%E4%BC%A0%E7%89%8720170817T.mp4',6),(2,'1.2  计算机运算基础','http://source3.uooconline.com/course349/video/%E7%A7%AF%E6%9E%81%E5%BF%83%E7%90%86%E5%AD%A6%20%E5%AE%A3%E4%BC%A0%E7%89%8720170817T.mp4',6),(3,'1.2  计算机运算基础','http://source3.uooconline.com/course349/video/%E7%A7%AF%E6%9E%81%E5%BF%83%E7%90%86%E5%AD%A6%20%E5%AE%A3%E4%BC%A0%E7%89%8720170817T.mp4',6),(4,'2.1  计算的几种视角','http://source3.uooconline.com/course349/video/%E7%A7%AF%E6%9E%81%E5%BF%83%E7%90%86%E5%AD%A6%20%E5%AE%A3%E4%BC%A0%E7%89%8720170817T.mp4',7),(5,'2.2  计算理论','http://source3.uooconline.com/course349/video/%E7%A7%AF%E6%9E%81%E5%BF%83%E7%90%86%E5%AD%A6%20%E5%AE%A3%E4%BC%A0%E7%89%8720170817T.mp4',7),(6,'1.1 中华一词的由来','http://source3.uooconline.com/course349/video/%E7%A7%AF%E6%9E%81%E5%BF%83%E7%90%86%E5%AD%A6%20%E5%AE%A3%E4%BC%A0%E7%89%8720170817T.mp4',4),(7,'1.2 中华一词的使用','http://source3.uooconline.com/course349/video/%E7%A7%AF%E6%9E%81%E5%BF%83%E7%90%86%E5%AD%A6%20%E5%AE%A3%E4%BC%A0%E7%89%8720170817T.mp4',4),(8,'1.3 中华一词的内涵','http://source3.uooconline.com/course349/video/%E7%A7%AF%E6%9E%81%E5%BF%83%E7%90%86%E5%AD%A6%20%E5%AE%A3%E4%BC%A0%E7%89%8720170817T.mp4',4),(9,'2.1 《送琴师毛敏仲北行》品读','http://source3.uooconline.com/course349/video/%E7%A7%AF%E6%9E%81%E5%BF%83%E7%90%86%E5%AD%A6%20%E5%AE%A3%E4%BC%A0%E7%89%8720170817T.mp4',5),(10,'2.2 南北分合 北强南弱（上','http://source3.uooconline.com/course349/video/%E7%A7%AF%E6%9E%81%E5%BF%83%E7%90%86%E5%AD%A6%20%E5%AE%A3%E4%BC%A0%E7%89%8720170817T.mp4',5),(11,'2.3 南北分合 北强南弱（下）','http://source3.uooconline.com/course349/video/%E7%A7%AF%E6%9E%81%E5%BF%83%E7%90%86%E5%AD%A6%20%E5%AE%A3%E4%BC%A0%E7%89%8720170817T.mp4',5),(12,'1.1导论','http://source3.uooconline.com/course349/video/%E7%A7%AF%E6%9E%81%E5%BF%83%E7%90%86%E5%AD%A6%20%E5%AE%A3%E4%BC%A0%E7%89%8720170817T.mp4',1),(13,'1.2音乐的“语言”','http://source3.uooconline.com/course349/video/%E7%A7%AF%E6%9E%81%E5%BF%83%E7%90%86%E5%AD%A6%20%E5%AE%A3%E4%BC%A0%E7%89%8720170817T.mp4',1),(14,'1.3音乐的功能','http://source3.uooconline.com/course349/video/%E7%A7%AF%E6%9E%81%E5%BF%83%E7%90%86%E5%AD%A6%20%E5%AE%A3%E4%BC%A0%E7%89%8720170817T.mp4',1),(15,'2.1中国传统音乐养生的思想渊源','http://source3.uooconline.com/course349/video/%E7%A7%AF%E6%9E%81%E5%BF%83%E7%90%86%E5%AD%A6%20%E5%AE%A3%E4%BC%A0%E7%89%8720170817T.mp4',2),(16,'2.2黄帝内经与音乐养生—中国传统音乐养生的文化机理','http://source3.uooconline.com/course349/video/%E7%A7%AF%E6%9E%81%E5%BF%83%E7%90%86%E5%AD%A6%20%E5%AE%A3%E4%BC%A0%E7%89%8720170817T.mp4',2),(17,'2.3古琴与音乐养生','http://source3.uooconline.com/course349/video/%E7%A7%AF%E6%9E%81%E5%BF%83%E7%90%86%E5%AD%A6%20%E5%AE%A3%E4%BC%A0%E7%89%8720170817T.mp4',2),(18,'2.4中国传统养生音乐曲目推荐','http://source3.uooconline.com/course349/video/%E7%A7%AF%E6%9E%81%E5%BF%83%E7%90%86%E5%AD%A6%20%E5%AE%A3%E4%BC%A0%E7%89%8720170817T.mp4',2),(19,'3.1什么是音乐治疗','http://source3.uooconline.com/course349/video/%E7%A7%AF%E6%9E%81%E5%BF%83%E7%90%86%E5%AD%A6%20%E5%AE%A3%E4%BC%A0%E7%89%8720170817T.mp4',3),(20,'3.2音乐治疗历史和现状','http://source3.uooconline.com/course349/video/%E7%A7%AF%E6%9E%81%E5%BF%83%E7%90%86%E5%AD%A6%20%E5%AE%A3%E4%BC%A0%E7%89%8720170817T.mp4',3),(21,'1.1 积极心理学简介','http://source3.uooconline.com/course349/video/%E7%A7%AF%E6%9E%81%E5%BF%83%E7%90%86%E5%AD%A6%20%E5%AE%A3%E4%BC%A0%E7%89%8720170817T.mp4',8),(22,'1.2 本课程的特点及创新','http://source3.uooconline.com/course349/video/%E7%A7%AF%E6%9E%81%E5%BF%83%E7%90%86%E5%AD%A6%20%E5%AE%A3%E4%BC%A0%E7%89%8720170817T.mp4',8),(23,'2.1 对生命意义的文化阐释','http://source3.uooconline.com/course349/video/%E7%A7%AF%E6%9E%81%E5%BF%83%E7%90%86%E5%AD%A6%20%E5%AE%A3%E4%BC%A0%E7%89%8720170817T.mp4',9),(24,'2.2 生命意义的心理学理论研究','http://source3.uooconline.com/course349/video/%E7%A7%AF%E6%9E%81%E5%BF%83%E7%90%86%E5%AD%A6%20%E5%AE%A3%E4%BC%A0%E7%89%8720170817T.mp4',9),(25,'2.3 生命意义的取向理论','http://source3.uooconline.com/course349/video/%E7%A7%AF%E6%9E%81%E5%BF%83%E7%90%86%E5%AD%A6%20%E5%AE%A3%E4%BC%A0%E7%89%8720170817T.mp4',9),(26,'3.1 幸福','http://source3.uooconline.com/course349/video/%E7%A7%AF%E6%9E%81%E5%BF%83%E7%90%86%E5%AD%A6%20%E5%AE%A3%E4%BC%A0%E7%89%8720170817T.mp4',10),(27,'3.2 幸福观','http://source3.uooconline.com/course349/video/%E7%A7%AF%E6%9E%81%E5%BF%83%E7%90%86%E5%AD%A6%20%E5%AE%A3%E4%BC%A0%E7%89%8720170817T.mp4',10),(28,'3.3 幸福感','http://source3.uooconline.com/course349/video/%E7%A7%AF%E6%9E%81%E5%BF%83%E7%90%86%E5%AD%A6%20%E5%AE%A3%E4%BC%A0%E7%89%8720170817T.mp4',10),(29,'1.1  第1节 本是同根生相 煎何太急','http://source3.uooconline.com/course349/video/%E7%A7%AF%E6%9E%81%E5%BF%83%E7%90%86%E5%AD%A6%20%E5%AE%A3%E4%BC%A0%E7%89%8720170817T.mp4',12),(30,'1.2  第2节 物理思想与人文精神如何融合','http://source3.uooconline.com/course349/video/%E7%A7%AF%E6%9E%81%E5%BF%83%E7%90%86%E5%AD%A6%20%E5%AE%A3%E4%BC%A0%E7%89%8720170817T.mp4',12),(31,'2.1  第1节 古希腊宇宙理论','http://source3.uooconline.com/course349/video/%E7%A7%AF%E6%9E%81%E5%BF%83%E7%90%86%E5%AD%A6%20%E5%AE%A3%E4%BC%A0%E7%89%8720170817T.mp4',13),(32,'2.2  第2节 从哥白尼到开普勒','http://source3.uooconline.com/course349/video/%E7%A7%AF%E6%9E%81%E5%BF%83%E7%90%86%E5%AD%A6%20%E5%AE%A3%E4%BC%A0%E7%89%8720170817T.mp4',13),(33,'2.3  第3节 伽利略和近代力学的诞生','http://source3.uooconline.com/course349/video/%E7%A7%AF%E6%9E%81%E5%BF%83%E7%90%86%E5%AD%A6%20%E5%AE%A3%E4%BC%A0%E7%89%8720170817T.mp4',13),(34,'1.1 关于“听”和“看”的词根 audi, vis','http://source3.uooconline.com/course349/video/%E7%A7%AF%E6%9E%81%E5%BF%83%E7%90%86%E5%AD%A6%20%E5%AE%A3%E4%BC%A0%E7%89%8720170817T.mp4',14),(35,'1.2 关于“说”和“做”的词根 dict, log, loqu, ag','http://source3.uooconline.com/course349/video/%E7%A7%AF%E6%9E%81%E5%BF%83%E7%90%86%E5%AD%A6%20%E5%AE%A3%E4%BC%A0%E7%89%8720170817T.mp4',14),(36,'2.1 关于“握、持”的词根tain','http://source3.uooconline.com/course349/video/%E7%A7%AF%E6%9E%81%E5%BF%83%E7%90%86%E5%AD%A6%20%E5%AE%A3%E4%BC%A0%E7%89%8720170817T.mp4',15),(37,'2.2 关于“抓住”的词根prehend','http://source3.uooconline.com/course349/video/%E7%A7%AF%E6%9E%81%E5%BF%83%E7%90%86%E5%AD%A6%20%E5%AE%A3%E4%BC%A0%E7%89%8720170817T.mp4',15);
/*!40000 ALTER TABLE `schoolapp_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userapp_banner`
--

DROP TABLE IF EXISTS `userapp_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `userapp_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alt` varchar(40) DEFAULT NULL,
  `add_time` datetime(6) NOT NULL,
  `is_display` tinyint(1) NOT NULL,
  `course_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `bodyBannerImage` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userapp_banner`
--

LOCK TABLES `userapp_banner` WRITE;
/*!40000 ALTER TABLE `userapp_banner` DISABLE KEYS */;
INSERT INTO `userapp_banner` VALUES (12,'品诗论史','2018-11-27 16:03:00.000000',1,1,1,''),(13,'积极心理学','2018-11-27 16:03:00.000000',1,3,1,NULL),(14,'大学计算机','2018-11-27 16:03:00.000000',1,2,1,'course/2018/11/学计算机_RQUkLFH.jpg'),(15,'积极心理学中部推广图','2018-11-28 22:49:00.000000',1,3,2,'course/2018/11/181105104122_7e9a55_171031010000_166e9f_运营位01.png'),(16,'音乐与健康--中部','2018-11-09 22:56:00.000000',1,9,2,'course/2018/11/181105104142_9007a8_171031010004_a624ba_运营位02_WevBoP1.png'),(17,'efsfsd','2018-11-30 22:24:00.000000',1,8,1,'course/2018/11/170904025334_42f1e9_61c8c582-c0e8-4bf9-bff4-2c180944e960_thumb_M9KDRm2.png');
/*!40000 ALTER TABLE `userapp_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userapp_expenduser`
--

DROP TABLE IF EXISTS `userapp_expenduser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `userapp_expenduser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `phone` varchar(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userapp_expenduser`
--

LOCK TABLES `userapp_expenduser` WRITE;
/*!40000 ALTER TABLE `userapp_expenduser` DISABLE KEYS */;
INSERT INTO `userapp_expenduser` VALUES (1,'pbkdf2_sha256$36000$GZ4nIrbFICYX$uq/VgY71Vj8xDXOhlVhljfBdPeBXA+TMCrAmIsQmWsM=','2018-11-30 22:11:00.000000',1,'dashu','','','1735853471@qq.com',1,1,'2018-11-26 13:14:00.000000','13400000001'),(2,'pbkdf2_sha256$36000$jir9s2CPq9xF$FxXv6M+/2dLU5R01sydx+J0DJKgH6YiBfLcoetcrqDQ=','2018-11-27 08:21:00.000000',0,'aleax','','','1234@qq.com',1,1,'2018-11-26 21:26:00.000000','13400000002'),(3,'pbkdf2_sha256$36000$HxngiOMvNnAb$zYjO4o07dAWWY6GW9jiB0ymwHUa1kiNu+uqVJbJJL8g=','2018-11-29 22:57:48.875339',0,'linshuhui','','','2@qq.com',0,1,'2018-11-26 22:56:55.320340','13400000003'),(4,'pbkdf2_sha256$36000$X7wsxX9urxdr$sIWRCQbsFQg7jQ7e3D+SrovzpLHXDKSZ7ePxDURKd8M=','2018-11-30 19:33:00.000000',0,'aleax123','','','1@qq.com',1,1,'2018-11-29 22:59:00.000000','13400000004');
/*!40000 ALTER TABLE `userapp_expenduser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userapp_expenduser_groups`
--

DROP TABLE IF EXISTS `userapp_expenduser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `userapp_expenduser_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expenduser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userapp_expenduser_groups_expenduser_id_group_id_9691e9b0_uniq` (`expenduser_id`,`group_id`),
  KEY `userapp_expenduser_groups_group_id_2aeebae4_fk_auth_group_id` (`group_id`),
  CONSTRAINT `userapp_expenduser_g_expenduser_id_77b8b6ac_fk_userapp_e` FOREIGN KEY (`expenduser_id`) REFERENCES `userapp_expenduser` (`id`),
  CONSTRAINT `userapp_expenduser_groups_group_id_2aeebae4_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userapp_expenduser_groups`
--

LOCK TABLES `userapp_expenduser_groups` WRITE;
/*!40000 ALTER TABLE `userapp_expenduser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `userapp_expenduser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userapp_expenduser_user_permissions`
--

DROP TABLE IF EXISTS `userapp_expenduser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `userapp_expenduser_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expenduser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userapp_expenduser_user__expenduser_id_permission_3ca74c57_uniq` (`expenduser_id`,`permission_id`),
  KEY `userapp_expenduser_u_permission_id_a1f50b58_fk_auth_perm` (`permission_id`),
  CONSTRAINT `userapp_expenduser_u_expenduser_id_c5273b7e_fk_userapp_e` FOREIGN KEY (`expenduser_id`) REFERENCES `userapp_expenduser` (`id`),
  CONSTRAINT `userapp_expenduser_u_permission_id_a1f50b58_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userapp_expenduser_user_permissions`
--

LOCK TABLES `userapp_expenduser_user_permissions` WRITE;
/*!40000 ALTER TABLE `userapp_expenduser_user_permissions` DISABLE KEYS */;
INSERT INTO `userapp_expenduser_user_permissions` VALUES (1,4,71);
/*!40000 ALTER TABLE `userapp_expenduser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userapp_message`
--

DROP TABLE IF EXISTS `userapp_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `userapp_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(200) NOT NULL,
  `send_from` varchar(40) NOT NULL,
  `send_type` varchar(10) NOT NULL,
  `send_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userapp_message`
--

LOCK TABLES `userapp_message` WRITE;
/*!40000 ALTER TABLE `userapp_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `userapp_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userapp_studentinfo`
--

DROP TABLE IF EXISTS `userapp_studentinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `userapp_studentinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_name` varchar(20) DEFAULT NULL,
  `institute` varchar(40) DEFAULT NULL,
  `profession` varchar(40) DEFAULT NULL,
  `avatar` varchar(100),
  `user_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userapp_studentinfo_user_id_b4eaeddd_uniq` (`user_id`),
  KEY `userapp_studentinfo_school_id_a487320a_fk_schoolapp_school_id` (`school_id`),
  CONSTRAINT `userapp_studentinfo_school_id_a487320a_fk_schoolapp_school_id` FOREIGN KEY (`school_id`) REFERENCES `schoolapp_school` (`id`),
  CONSTRAINT `userapp_studentinfo_user_id_b4eaeddd_fk_userapp_expenduser_id` FOREIGN KEY (`user_id`) REFERENCES `userapp_expenduser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userapp_studentinfo`
--

LOCK TABLES `userapp_studentinfo` WRITE;
/*!40000 ALTER TABLE `userapp_studentinfo` DISABLE KEYS */;
INSERT INTO `userapp_studentinfo` VALUES (1,'林树辉12312','信息工程11','通信工程1','5408144f53703d8b3b5605db.jpg',3,1),(2,'林树辉12312','信息工程11','通信工程1','avatars/2018/11/588A0335.JPG',1,1),(3,'林树辉12312','信息工程11','通信工程1','5408144f53703d8b3b5605db.jpg',2,1),(4,'aleax','软件工程学院','软件工程','avatars/2018/11/5408144f53703d8b3b5605db_pFsO8YM.jpg',4,2);
/*!40000 ALTER TABLE `userapp_studentinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userapp_studentinfotocourse`
--

DROP TABLE IF EXISTS `userapp_studentinfotocourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `userapp_studentinfotocourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `join_or_attention` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userapp_studentinfotocou_course_id_student_id_joi_555d5c2e_uniq` (`course_id`,`student_id`,`join_or_attention`),
  KEY `userapp_studentinfot_student_id_6e987889_fk_userapp_s` (`student_id`),
  KEY `userapp_studentinfotocourse_course_id_c4b16dad` (`course_id`),
  CONSTRAINT `userapp_studentinfot_course_id_c4b16dad_fk_schoolapp` FOREIGN KEY (`course_id`) REFERENCES `schoolapp_course` (`id`),
  CONSTRAINT `userapp_studentinfot_student_id_6e987889_fk_userapp_s` FOREIGN KEY (`student_id`) REFERENCES `userapp_studentinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userapp_studentinfotocourse`
--

LOCK TABLES `userapp_studentinfotocourse` WRITE;
/*!40000 ALTER TABLE `userapp_studentinfotocourse` DISABLE KEYS */;
INSERT INTO `userapp_studentinfotocourse` VALUES (25,1,2,2),(36,2,2,2),(33,1,3,2),(39,2,3,2),(37,1,4,2),(35,1,5,2),(34,2,5,2),(27,1,6,2),(28,2,6,2),(30,1,8,2),(31,2,8,2),(32,1,9,2);
/*!40000 ALTER TABLE `userapp_studentinfotocourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_bookmark`
--

DROP TABLE IF EXISTS `xadmin_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_userapp_expenduser_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_userapp_expenduser_id` FOREIGN KEY (`user_id`) REFERENCES `userapp_expenduser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_bookmark`
--

LOCK TABLES `xadmin_bookmark` WRITE;
/*!40000 ALTER TABLE `xadmin_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_log`
--

DROP TABLE IF EXISTS `xadmin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_userapp_expenduser_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_userapp_expenduser_id` FOREIGN KEY (`user_id`) REFERENCES `userapp_expenduser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_log`
--

LOCK TABLES `xadmin_log` WRITE;
/*!40000 ALTER TABLE `xadmin_log` DISABLE KEYS */;
INSERT INTO `xadmin_log` VALUES (1,'2018-11-26 13:17:50.644339','127.0.0.1','1','Banner object','create','已添加。',7,1),(2,'2018-11-26 13:19:38.743865','127.0.0.1','2','Banner object','create','已添加。',7,1),(3,'2018-11-26 13:19:58.082212','127.0.0.1','3','Banner object','create','已添加。',7,1),(4,'2018-11-26 13:20:27.860675','127.0.0.1','4','Banner object','create','已添加。',7,1),(5,'2018-11-26 13:20:57.244136','127.0.0.1','5','Banner object','create','已添加。',7,1),(6,'2018-11-26 15:30:23.120345','127.0.0.1','6','Banner object','create','已添加。',7,1),(7,'2018-11-26 15:30:49.915758','127.0.0.1','7','Banner object','create','已添加。',7,1),(8,'2018-11-26 15:31:06.136502','127.0.0.1','8','Banner object','create','已添加。',7,1),(9,'2018-11-26 15:32:07.827589','127.0.0.1','9','Banner object','create','已添加。',7,1),(10,'2018-11-26 20:54:08.618658','127.0.0.1','1','dashu','change','修改 last_login，email 和 phone',6,1),(11,'2018-11-26 22:56:55.357318','127.0.0.1','3','linshuhui','create','已添加。',6,1),(12,'2018-11-26 22:57:08.312178','127.0.0.1','1','StudentInfo object','create','已添加。',9,1),(13,'2018-11-27 15:14:06.008612','127.0.0.1','1','School object','create','已添加。',17,1),(14,'2018-11-27 15:16:50.634954','127.0.0.1','2','School object','create','已添加。',17,1),(15,'2018-11-27 15:17:04.782016','127.0.0.1','3','School object','create','已添加。',17,1),(16,'2018-11-27 15:17:28.020274','127.0.0.1','4','School object','create','已添加。',17,1),(17,'2018-11-27 15:19:21.507608','127.0.0.1','5','School object','create','已添加。',17,1),(18,'2018-11-27 15:20:12.433072','127.0.0.1','6','School object','create','已添加。',17,1),(19,'2018-11-27 15:26:44.052109','127.0.0.1','1','章必功','create','已添加。',18,1),(20,'2018-11-27 15:27:46.451722','127.0.0.1','2','周萌','create','已添加。',18,1),(21,'2018-11-27 15:35:05.345309','127.0.0.1','1','品诗论史','create','已添加。',15,1),(22,'2018-11-27 15:36:15.105084','127.0.0.1','1','CourseToTeacher object','create','已添加。',16,1),(23,'2018-11-27 15:36:26.683823','127.0.0.1','2','CourseToTeacher object','create','已添加。',16,1),(24,'2018-11-27 15:38:54.972621','127.0.0.1','3','王志强','create','已添加。',18,1),(25,'2018-11-27 15:40:00.125334','127.0.0.1','4','陈国良','create','已添加。',18,1),(26,'2018-11-27 15:41:51.741269','127.0.0.1','2','大学计算机','create','已添加。',15,1),(27,'2018-11-27 15:42:07.479274','127.0.0.1','3','CourseToTeacher object','create','已添加。',16,1),(28,'2018-11-27 15:42:14.695331','127.0.0.1','4','CourseToTeacher object','create','已添加。',16,1),(29,'2018-11-27 15:45:35.176727','127.0.0.1','5','王晓钧','create','已添加。',18,1),(30,'2018-11-27 15:46:02.307515','127.0.0.1','6','高秋凤','create','已添加。',18,1),(31,'2018-11-27 15:48:10.634484','127.0.0.1','3','积极心理学','create','已添加。',15,1),(32,'2018-11-27 15:48:25.438699','127.0.0.1','5','CourseToTeacher object','create','已添加。',16,1),(33,'2018-11-27 15:48:41.668251','127.0.0.1','6','CourseToTeacher object','create','已添加。',16,1),(34,'2018-11-27 15:50:43.783920','127.0.0.1','7','李秀清','create','已添加。',18,1),(35,'2018-11-27 15:51:33.576451','127.0.0.1','8','张惠','create','已添加。',18,1),(36,'2018-11-27 15:53:41.203180','127.0.0.1','4','拓展英语词汇','create','已添加。',15,1),(37,'2018-11-27 15:54:04.989946','127.0.0.1','7','CourseToTeacher object','create','已添加。',16,1),(38,'2018-11-27 15:54:37.281106','127.0.0.1','8','CourseToTeacher object','create','已添加。',16,1),(39,'2018-11-27 15:57:43.857850','127.0.0.1','9','Banner object','delete','',7,1),(40,'2018-11-27 15:57:56.982529','127.0.0.1',NULL,'','delete','批量删除 8 个 轮播图',NULL,1),(41,'2018-11-27 16:00:07.402454','127.0.0.1','10','Banner object','create','已添加。',7,1),(42,'2018-11-27 16:00:57.831521','127.0.0.1','11','Banner object','create','已添加。',7,1),(43,'2018-11-27 16:01:10.747656','127.0.0.1','10','Banner object','delete','',7,1),(44,'2018-11-27 16:03:18.051742','127.0.0.1','11','品诗论史','delete','',7,1),(45,'2018-11-27 16:03:27.839556','127.0.0.1','12','品诗论史','create','已添加。',7,1),(46,'2018-11-27 16:03:54.331976','127.0.0.1','13','积极心理学','create','已添加。',7,1),(47,'2018-11-27 16:04:07.054172','127.0.0.1','14','大学计算机','create','已添加。',7,1),(48,'2018-11-28 11:08:07.935045','127.0.0.1','7','河南理工大学','create','已添加。',17,1),(49,'2018-11-28 11:08:40.193881','127.0.0.1','8','哈尔滨学院','create','已添加。',17,1),(50,'2018-11-28 11:09:10.080799','127.0.0.1','9','广西科技大学','create','已添加。',17,1),(51,'2018-11-28 11:09:48.723912','127.0.0.1','10','昆明理工学院','create','已添加。',17,1),(52,'2018-11-28 11:10:15.415394','127.0.0.1','11','西安交通大学','create','已添加。',17,1),(53,'2018-11-28 11:11:21.897795','127.0.0.1','12','河南大学','create','已添加。',17,1),(54,'2018-11-28 11:13:41.351242','127.0.0.1','9','薛中会','create','已添加。',18,1),(55,'2018-11-28 11:15:49.114121','127.0.0.1','5','物理与文化','create','已添加。',15,1),(56,'2018-11-28 11:27:22.123359','127.0.0.1','10','方娇莉','create','已添加。',18,1),(57,'2018-11-28 11:28:15.998309','127.0.0.1','6','C君带你玩编程','create','已添加。',15,1),(58,'2018-11-28 11:30:38.161143','127.0.0.1','9','CourseToTeacher object','create','已添加。',16,1),(59,'2018-11-28 11:30:49.369893','127.0.0.1','10','CourseToTeacher object','create','已添加。',16,1),(60,'2018-11-28 15:34:18.961720','127.0.0.1','13','苏州大学','create','已添加。',17,1),(61,'2018-11-28 15:41:03.103623','127.0.0.1','11','古典文学的城市书写','create','已添加。',18,1),(62,'2018-11-28 15:43:07.142876','127.0.0.1','11','古典文学的城市书写','change','修改 avatar',18,1),(63,'2018-11-28 15:43:24.611901','127.0.0.1','11','杨旭辉','change','修改 name',18,1),(64,'2018-11-28 15:44:36.904407','127.0.0.1','7','古典文学的城市书写','create','已添加。',15,1),(65,'2018-11-28 15:44:47.692325','127.0.0.1','11','CourseToTeacher object','create','已添加。',16,1),(66,'2018-11-28 15:46:08.931640','127.0.0.1','12','张转玲','create','已添加。',18,1),(67,'2018-11-28 15:47:06.746641','127.0.0.1','8','沟通技巧','create','已添加。',15,1),(68,'2018-11-28 15:47:09.316232','127.0.0.1','12','CourseToTeacher object','create','已添加。',16,1),(69,'2018-11-28 22:17:20.609478','127.0.0.1','8','沟通技巧','change','修改 picture',15,1),(70,'2018-11-28 22:51:05.140953','127.0.0.1','15','积极心理学','create','已添加。',7,1),(71,'2018-11-28 22:51:45.579374','127.0.0.1','15','积极心理学','change','修改 bodyBannerImage',7,1),(72,'2018-11-28 22:53:03.259909','127.0.0.1','14','宁波大学','create','已添加。',17,1),(73,'2018-11-28 22:53:46.471377','127.0.0.1','13','王蕾','create','已添加。',18,1),(74,'2018-11-28 22:55:47.838477','127.0.0.1','9','音乐与健康','create','已添加。',15,1),(75,'2018-11-28 22:55:58.398480','127.0.0.1','13','CourseToTeacher object','create','已添加。',16,1),(76,'2018-11-28 22:56:48.664956','127.0.0.1','16','音乐与健康','create','已添加。',7,1),(77,'2018-11-28 23:31:44.074477','127.0.0.1',NULL,'','delete','批量删除 1 个 学校表',NULL,1),(78,'2018-11-28 23:50:38.355066','127.0.0.1','1','理学▪工学','create','已添加。',19,1),(79,'2018-11-28 23:50:53.190037','127.0.0.1','2','计算机','create','已添加。',19,1),(80,'2018-11-28 23:51:12.440217','127.0.0.1','3','教育▪语言','create','已添加。',19,1),(81,'2018-11-28 23:52:13.991072','127.0.0.1','4','文学▪艺术','create','已添加。',19,1),(82,'2018-11-28 23:52:30.534788','127.0.0.1','5','创业▪职场','create','已添加。',19,1),(83,'2018-11-28 23:53:01.569566','127.0.0.1','1','地质及材料','create','已添加。',20,1),(84,'2018-11-28 23:53:14.270767','127.0.0.1','2','物理','create','已添加。',20,1),(85,'2018-11-28 23:53:19.602782','127.0.0.1','3','电气信息','create','已添加。',20,1),(86,'2018-11-28 23:53:24.086190','127.0.0.1','4','自然生命科学','create','已添加。',20,1),(87,'2018-11-28 23:53:28.669552','127.0.0.1','5','工业','create','已添加。',20,1),(88,'2018-11-28 23:53:33.135200','127.0.0.1','6','土木','create','已添加。',20,1),(89,'2018-11-28 23:53:37.206857','127.0.0.1','7','数学','create','已添加。',20,1),(90,'2018-11-28 23:53:41.477532','127.0.0.1','8','化学','create','已添加。',20,1),(91,'2018-11-28 23:54:09.448570','127.0.0.1','9','网络科技','create','已添加。',20,1),(92,'2018-11-28 23:54:15.588828','127.0.0.1','10','产品设计','create','已添加。',20,1),(93,'2018-11-28 23:54:22.090195','127.0.0.1','11','应用','create','已添加。',20,1),(94,'2018-11-28 23:54:31.856967','127.0.0.1','12','软件工程','create','已添加。',20,1),(95,'2018-11-28 23:54:36.527053','127.0.0.1','13','数据库','create','已添加。',20,1),(96,'2018-11-28 23:54:42.457730','127.0.0.1','14','编程语言','create','已添加。',20,1),(97,'2018-11-28 23:54:49.172865','127.0.0.1','15','计算机基础','create','已添加。',20,1),(98,'2018-11-28 23:54:58.896778','127.0.0.1','16','运动健身','create','已添加。',20,1),(99,'2018-11-28 23:55:05.765308','127.0.0.1','17','教育学','create','已添加。',20,1),(100,'2018-11-28 23:55:11.115396','127.0.0.1','18','小语种','create','已添加。',20,1),(101,'2018-11-28 23:55:47.659301','127.0.0.1','19','汉语','create','已添加。',20,1),(102,'2018-11-28 23:55:54.076783','127.0.0.1','20','英语','create','已添加。',20,1),(103,'2018-11-28 23:56:02.538979','127.0.0.1','21','设计','create','已添加。',20,1),(104,'2018-11-28 23:56:09.229420','127.0.0.1','22','媒体','create','已添加。',20,1),(105,'2018-11-28 23:56:13.738861','127.0.0.1','23','艺术','create','已添加。',20,1),(106,'2018-11-28 23:56:20.090288','127.0.0.1','24','文学','create','已添加。',20,1),(107,'2018-11-28 23:56:27.292327','127.0.0.1','25','创业指南','create','已添加。',20,1),(108,'2018-11-28 23:56:34.605530','127.0.0.1','26','就业指导','create','已添加。',20,1),(109,'2018-11-28 23:56:42.111282','127.0.0.1','27','职场经验','create','已添加。',20,1),(110,'2018-11-29 00:00:50.766756','127.0.0.1','6','哲史▪文化','create','已添加。',19,1),(111,'2018-11-29 00:01:07.959494','127.0.0.1','7','经济▪管理','create','已添加。',19,1),(112,'2018-11-29 00:01:13.927195','127.0.0.1','8','医学▪农学','create','已添加。',19,1),(113,'2018-11-29 00:01:19.310168','127.0.0.1','9','心理学','create','已添加。',19,1),(114,'2018-11-29 00:01:25.167799','127.0.0.1','10','社会▪法律','create','已添加。',19,1),(115,'2018-11-30 18:14:10.529890','127.0.0.1',NULL,'','delete','批量删除 14 个 学习选课表',NULL,1),(116,'2018-11-30 18:16:15.505064','127.0.0.1',NULL,'','delete','批量删除 1 个 学习选课表',NULL,1),(117,'2018-11-30 19:28:42.926242','127.0.0.1','2','aleax','change','修改 last_login 和 is_staff',6,1),(118,'2018-11-30 19:33:20.019738','127.0.0.1','4','aleax123','change','修改 last_login 和 is_staff',6,1),(119,'2018-11-30 19:34:21.895046','127.0.0.1','4','aleax123','change','修改 last_login 和 user_permissions',6,1),(120,'2018-11-30 21:52:46.343981','127.0.0.1','9','音乐与健康','change','修改 picture 和 introduction',15,1),(121,'2018-11-30 21:53:19.882066','127.0.0.1','8','沟通技巧','change','修改 picture 和 introduction',15,1),(122,'2018-11-30 21:54:09.403346','127.0.0.1','7','古典文学的城市书写','change','修改 picture 和 introduction',15,1),(123,'2018-11-30 21:56:25.264441','127.0.0.1','1','品诗论史','change','修改 picture 和 introduction',15,1),(124,'2018-11-30 21:57:13.394361','127.0.0.1','2','大学计算机','change','修改 picture 和 introduction',15,1),(125,'2018-11-30 22:05:24.649320','127.0.0.1','1','品诗论史','change','修改 picture 和 introduction',15,1),(126,'2018-11-30 22:23:34.740728','127.0.0.1','14','大学计算机','change','修改 bodyBannerImage',7,1),(127,'2018-11-30 22:24:05.887416','127.0.0.1','14','大学计算机','change','修改 bodyBannerImage',7,1),(128,'2018-11-30 22:25:12.600286','127.0.0.1','17','沟通技巧','create','已添加。',7,1),(129,'2018-12-01 10:11:39.049507','127.0.0.1','9','音乐与健康','change','修改 picture 和 introduction',15,1),(130,'2018-12-01 10:16:27.613687','127.0.0.1','1','品诗论史','change','修改 introduction',15,1),(131,'2018-12-01 10:16:52.075794','127.0.0.1','1','品诗论史','change','修改 introduction',15,1),(132,'2018-12-01 10:17:32.463246','127.0.0.1','2','大学计算机','change','修改 introduction',15,1),(133,'2018-12-01 10:27:17.918644','127.0.0.1','6','1  计算机基础知识','change','没有字段被修改。',21,1),(134,'2018-12-01 10:27:39.457407','127.0.0.1','6','1  计算机基础知识','change','没有字段被修改。',21,1),(135,'2018-12-01 10:29:04.837454','127.0.0.1','7','2  计算理论与计算模型','change','没有字段被修改。',21,1),(136,'2018-12-01 10:30:00.840393','127.0.0.1','4','1 第一讲 中华地向城边尽','change','没有字段被修改。',21,1),(137,'2018-12-01 10:30:35.327409','127.0.0.1','5','2 第二讲 南人垂泪北人笑','change','没有字段被修改。',21,1),(138,'2018-12-01 10:31:48.826747','127.0.0.1','1','1 音乐与健康概论','change','没有字段被修改。',21,1),(139,'2018-12-01 10:32:14.080776','127.0.0.1','2','2 中国古代的音乐养生','change','没有字段被修改。',21,1),(140,'2018-12-01 10:32:28.422477','127.0.0.1','3','3 西方的音乐治疗','change','没有字段被修改。',21,1),(141,'2018-12-01 14:44:23.723368','127.0.0.1','3','积极心理学','change','修改 introduction',15,1),(142,'2018-12-01 14:44:56.521887','127.0.0.1','8','1 绪论','change','没有字段被修改。',21,1),(143,'2018-12-01 14:45:21.206009','127.0.0.1','9','2 生命的意义','change','没有字段被修改。',21,1),(144,'2018-12-01 14:45:42.653763','127.0.0.1','10','3 幸福与你同行','change','没有字段被修改。',21,1),(145,'2018-12-01 14:50:10.629565','127.0.0.1','6','C君带你玩编程','change','修改 introduction',15,1),(146,'2018-12-01 14:50:59.333829','127.0.0.1','8','沟通技巧','change','修改 introduction',15,1),(147,'2018-12-01 14:51:27.749667','127.0.0.1','5','物理与文化','change','修改 introduction',15,1),(148,'2018-12-01 14:52:22.833966','127.0.0.1','4','拓展英语词汇','change','修改 introduction',15,1),(149,'2018-12-01 14:53:39.631740','127.0.0.1','5','物理与文化','change','没有字段被修改。',15,1),(150,'2018-12-01 14:54:04.269641','127.0.0.1','12','1  第1章 绪论-物理思想与人文精神','change','没有字段被修改。',21,1),(151,'2018-12-01 14:54:22.961934','127.0.0.1','13','2  第2章 经典力学的建立和发展','change','没有字段被修改。',21,1),(152,'2018-12-02 11:17:46.809025','127.0.0.1','1','dashu','change','修改 last_login',6,1),(153,'2018-12-02 11:26:28.478235','127.0.0.1','4','拓展英语词汇','change','没有字段被修改。',15,1),(154,'2018-12-02 11:26:56.331727','127.0.0.1','14','1 Roots about Hearing, Seeing, Saying and Doing','change','没有字段被修改。',21,1),(155,'2018-12-02 11:27:14.578923','127.0.0.1','15','2 Roots about Holding, Seizing and Following','change','没有字段被修改。',21,1);
/*!40000 ALTER TABLE `xadmin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_usersettings`
--

DROP TABLE IF EXISTS `xadmin_usersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_userapp_expenduser_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_userapp_expenduser_id` FOREIGN KEY (`user_id`) REFERENCES `userapp_expenduser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_usersettings`
--

LOCK TABLES `xadmin_usersettings` WRITE;
/*!40000 ALTER TABLE `xadmin_usersettings` DISABLE KEYS */;
INSERT INTO `xadmin_usersettings` VALUES (1,'dashboard:home:pos','',1),(2,'site-theme','https://bootswatch.com/3/cosmo/bootstrap.min.css',1),(3,'dashboard:home:pos','',4),(4,'schoolapp_course_editform_portal','box-0,chapter_set-group,,,',1),(5,'schoolapp_chapter_editform_portal','box-0,video_set-group,',1);
/*!40000 ALTER TABLE `xadmin_usersettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_userwidget`
--

DROP TABLE IF EXISTS `xadmin_userwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_userapp_expenduser_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_userapp_expenduser_id` FOREIGN KEY (`user_id`) REFERENCES `userapp_expenduser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_userwidget`
--

LOCK TABLES `xadmin_userwidget` WRITE;
/*!40000 ALTER TABLE `xadmin_userwidget` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_userwidget` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-03 15:13:14
