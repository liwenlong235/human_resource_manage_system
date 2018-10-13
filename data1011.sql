-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: data1011
-- ------------------------------------------------------
-- Server version	5.6.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `d_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `d_name` varchar(30) NOT NULL COMMENT '部门名称',
  PRIMARY KEY (`d_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'销售部'),(2,'财务部'),(3,'项目部'),(4,'采购部'),(5,'人力资源部'),(6,'广告部'),(7,'行政部');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `e_id` bigint(20) NOT NULL COMMENT '员工编号',
  `e_name` varchar(20) NOT NULL COMMENT '姓名',
  `e_gender` varchar(2) NOT NULL COMMENT '性别',
  `tel` bigint(11) NOT NULL COMMENT '联系方式',
  `email` varchar(20) NOT NULL COMMENT '电子邮箱',
  `d_id` int(11) NOT NULL COMMENT '部门编号',
  `p_id` int(11) NOT NULL COMMENT '职位编号',
  `entry_time` date NOT NULL COMMENT '入职时间',
  `dimission_time` date NOT NULL COMMENT '离职时间',
  `education` varchar(20) NOT NULL COMMENT '学历',
  `s_id` int(11) NOT NULL COMMENT '薪资ID',
  PRIMARY KEY (`e_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (10001,'张三 ','男',15211112222,'zhangsan@163.com',1,2,'2018-10-01','2021-02-13','本科',10000),(10002,'李四','男',15212342345,'lisi@163.com',1,1,'2018-02-11','2099-09-09','本科',2);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions`
--

DROP TABLE IF EXISTS `positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `positions` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '职位ID',
  `p_name` varchar(50) NOT NULL COMMENT '职位名称',
  `d_id` int(11) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`p_id`),
  KEY `foreign_p_d` (`d_id`),
  CONSTRAINT `foreign_p_d` FOREIGN KEY (`d_id`) REFERENCES `departments` (`d_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions`
--

LOCK TABLES `positions` WRITE;
/*!40000 ALTER TABLE `positions` DISABLE KEYS */;
INSERT INTO `positions` VALUES (1,'销售代表',1),(2,'电话销售',1),(3,'销售经理',1),(4,'销售主管',1),(5,'销售总监',1),(6,'出纳员',2),(7,'会计助理',2),(8,'会计师',2),(9,'会计经理',2),(10,'财务顾问',2),(11,'财务主管',2),(12,'财务经理',2),(13,'财务总监',2),(14,'培训专员',5),(15,'培训经理',5),(16,'培训讲师',5),(17,'人力资源总监',5),(18,'人力资源经理',5),(19,'人力资源主管',5),(20,'前台',7),(21,'行政助理',7),(22,'行政专员',7),(23,'行政经理',7),(24,'行政主管',7),(25,'行政总监',7),(26,'项目专员',3),(27,'项目主管',3),(28,'项目经理',3),(29,'项目专管',3),(30,'项目助理',3),(31,'测试工程师',3),(32,'开发工程师',3),(33,'报关员',4),(34,'贸易跟单员',4),(35,'外贸主管',4),(36,'外贸专员',4),(37,'采购经理',4),(38,'采购专员',4),(39,'采购经理',4),(40,'广告设计师',6),(41,'广告文案策划',6),(42,'广告美术指导',6),(43,'广告执行制作',6),(44,'广告设计经理',6),(45,'广告设计总监',6);
/*!40000 ALTER TABLE `positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resumes`
--

DROP TABLE IF EXISTS `resumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resumes` (
  `r_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '简历ID',
  `user_id` int(11) NOT NULL COMMENT '游客ID',
  `r_title` varchar(50) NOT NULL COMMENT '简历名称',
  `u_name` varchar(50) NOT NULL COMMENT '用户姓名',
  `u_birth` date NOT NULL COMMENT '出生日期',
  `u_gender` varchar(2) NOT NULL COMMENT '性别',
  `first_worktime` date NOT NULL COMMENT '参加工作时间',
  `tel` bigint(11) NOT NULL COMMENT '联系电话',
  `email` varchar(50) NOT NULL COMMENT '电子邮箱',
  `dept_id` int(11) NOT NULL COMMENT '应聘的部门ID',
  `position_id` int(11) NOT NULL COMMENT '应聘的职位ID',
  `work_experience` varchar(500) NOT NULL COMMENT '工作经验',
  `education` varchar(50) NOT NULL COMMENT '学历',
  `expect_salary` double NOT NULL COMMENT '期望薪资',
  `hobbies` varchar(100) NOT NULL COMMENT '兴趣爱好',
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resumes`
--

LOCK TABLES `resumes` WRITE;
/*!40000 ALTER TABLE `resumes` DISABLE KEYS */;
/*!40000 ALTER TABLE `resumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salaries`
--

DROP TABLE IF EXISTS `salaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salaries` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '工资ID',
  `s_month` varchar(10) NOT NULL COMMENT '哪月工资',
  `e_id` int(11) NOT NULL COMMENT '员工ID',
  `e_name` varchar(20) NOT NULL COMMENT '员工姓名',
  `s_basic` double NOT NULL COMMENT '基本工资',
  `bonus` double NOT NULL COMMENT '奖金',
  `overtime_weekday` double NOT NULL COMMENT '平时加班时间',
  `overtime_weekend` double NOT NULL COMMENT '周末加班时间',
  `overtime_pay` double NOT NULL COMMENT '加班费',
  `leave_time` double unsigned NOT NULL COMMENT '请假时长',
  `absent_time` double NOT NULL COMMENT '旷工时间',
  `s_deduct` double NOT NULL COMMENT '工资减项',
  `back_pay` double NOT NULL COMMENT '补发工资',
  `s_real` double NOT NULL COMMENT '实发工资',
  `remarks` varchar(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salaries`
--

LOCK TABLES `salaries` WRITE;
/*!40000 ALTER TABLE `salaries` DISABLE KEYS */;
/*!40000 ALTER TABLE `salaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '游客ID',
  `user_name` varchar(30) NOT NULL COMMENT '游客账号',
  `user_password` varchar(50) NOT NULL COMMENT '游客密码',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'??2','12345'),(2,'张三1','12345'),(3,'张三','12345'),(4,'lisi','12345'),(5,'zhangsan','12345'),(6,'','');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-13  9:46:27
