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
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '考勤id',
  `e_id` int(11) NOT NULL COMMENT '员工id',
  `month` int(11) NOT NULL COMMENT '考勤月份',
  `day` date NOT NULL COMMENT '当天日期',
  `morning` time NOT NULL COMMENT '上班时间',
  `night` time NOT NULL COMMENT '下班时间',
  `overtime` double NOT NULL DEFAULT '0' COMMENT '加班时间',
  `leave_time` double NOT NULL DEFAULT '0' COMMENT '请加时间',
  `absenteeism` double NOT NULL DEFAULT '0' COMMENT '旷工时间',
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awards`
--

DROP TABLE IF EXISTS `awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `awards` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `e_id` int(11) NOT NULL COMMENT '员工Id',
  `type` tinyint(1) NOT NULL COMMENT '赏/罚类型',
  `reason` varchar(50) NOT NULL COMMENT '原因说明',
  `create_tiem` date NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awards`
--

LOCK TABLES `awards` WRITE;
/*!40000 ALTER TABLE `awards` DISABLE KEYS */;
/*!40000 ALTER TABLE `awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commitrecords`
--

DROP TABLE IF EXISTS `commitrecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commitrecords` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '提交记录ID',
  `j_id` int(11) NOT NULL COMMENT '所选的工作',
  `r_id` int(11) NOT NULL COMMENT '提交的简历ID',
  `commit_time` datetime NOT NULL COMMENT '提交时间',
  `r_status` tinyint(1) NOT NULL COMMENT '简历状态(已读/未读)',
  `i_id` int(11) NOT NULL COMMENT '面试邀请ID',
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commitrecords`
--

LOCK TABLES `commitrecords` WRITE;
/*!40000 ALTER TABLE `commitrecords` DISABLE KEYS */;
INSERT INTO `commitrecords` VALUES (31,1,12,'2018-10-19 13:35:47',1,12),(32,1,14,'2018-10-19 13:46:55',1,13);
/*!40000 ALTER TABLE `commitrecords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `d_id` int(11) NOT NULL AUTO_INCREMENT,
  `d_name` varchar(20) NOT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`d_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'销售部','0000-00-00 00:00:00'),(2,'财务部','0000-00-00 00:00:00'),(3,'项目部','0000-00-00 00:00:00'),(4,'采购部','0000-00-00 00:00:00'),(5,'人力资源部','0000-00-00 00:00:00'),(6,'广告部','0000-00-00 00:00:00'),(7,'行政部','0000-00-00 00:00:00'),(9,'后勤部','2018-10-19 16:59:48');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `e_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '员工编号',
  `r_id` int(11) NOT NULL COMMENT '对应简历ID',
  `e_name` varchar(20) NOT NULL COMMENT '姓名',
  `e_password` varchar(50) NOT NULL COMMENT '密码',
  `gender` varchar(10) NOT NULL COMMENT '性别',
  `tel` bigint(11) NOT NULL COMMENT '联系方式',
  `email` varchar(20) NOT NULL COMMENT '电子邮箱',
  `d_id` int(11) NOT NULL COMMENT '部门编号',
  `p_id` int(11) NOT NULL COMMENT '职位编号',
  `entry_time` date NOT NULL COMMENT '入职时间',
  `dimission_time` date DEFAULT NULL COMMENT '离职时间',
  `education` varchar(20) NOT NULL COMMENT '学历',
  PRIMARY KEY (`e_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10012 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (10010,12,'aaa','6cf7af35e8b3873e13c2376866fc13e7','男',12345678098,'12345@163.com',4,39,'2018-10-18','1970-01-01','本科'),(10011,14,'ccc','670b14728ad9902aecba32e22fa4f6bd','男',111111111111,'12345@163.com',1,2,'2018-10-19','1970-01-01','本科');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invitations`
--

DROP TABLE IF EXISTS `invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invitations` (
  `i_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '面试邀请ID',
  `c_id` int(11) NOT NULL COMMENT '简历ID',
  `invite_time` datetime NOT NULL COMMENT '面试时间',
  `manager` varchar(50) NOT NULL COMMENT '面试官',
  `address` varchar(50) NOT NULL COMMENT '面试地址',
  `confirmed` int(1) NOT NULL COMMENT '是否面试',
  `pass` int(1) NOT NULL COMMENT '是否通过',
  PRIMARY KEY (`i_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitations`
--

LOCK TABLES `invitations` WRITE;
/*!40000 ALTER TABLE `invitations` DISABLE KEYS */;
INSERT INTO `invitations` VALUES (12,31,'2018-11-11 14:00:00','销售主管','浦东新区松涛路489号',1,1),(13,32,'2018-11-11 14:00:00','销售主管','123',1,1);
/*!40000 ALTER TABLE `invitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `j_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '招聘信息ID',
  `p_id` int(11) NOT NULL COMMENT '职位ID',
  `company` varchar(50) NOT NULL COMMENT '公司名称',
  `address` varchar(100) NOT NULL COMMENT '工作地点',
  `salary_range` varchar(50) NOT NULL COMMENT '薪资范围',
  `duty` varchar(200) NOT NULL COMMENT '岗位职责',
  `requirements` varchar(200) NOT NULL COMMENT '任职要求',
  `pubdate` date NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`j_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,2,'海同','上海浦东','8000~10000','Java软件开发','海同毕业','2018-10-14'),(2,20,'海同','上海浦东','8000~10000','前台文员','仅限女生','2018-10-14'),(3,14,'海同','上海闸北区','10000~20000','培训员工','有培训经验，工作8年','2018-10-14'),(4,22,'海同','上海闸北区','10000~15000','行政事务管理','有人力资源工作经验，3年以上','2018-10-14'),(5,35,'海同','上海徐汇区','20000~30000','负责外贸事务管理','工作经验10年','2018-10-14'),(6,3,'海同','上海徐汇区','8000~15000','项目跟进','有一定的项目经验，3年以上','2018-10-14');
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `managers`
--

DROP TABLE IF EXISTS `managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `managers` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `m_name` varchar(50) NOT NULL COMMENT '账号',
  `m_password` varchar(50) NOT NULL COMMENT '密码',
  `type` int(50) NOT NULL COMMENT '类别',
  `d_name` varchar(50) NOT NULL COMMENT '所属部门',
  `p_name` varchar(50) NOT NULL COMMENT '职位',
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `managers`
--

LOCK TABLES `managers` WRITE;
/*!40000 ALTER TABLE `managers` DISABLE KEYS */;
INSERT INTO `managers` VALUES (6,'admin','827ccb0eea8a706c4c34a16891f84e7b',0,'人力资源部','人力资源主管'),(7,'xiaoshou','827ccb0eea8a706c4c34a16891f84e7b',1,'销售部','销售主管'),(8,'caiwu','827ccb0eea8a706c4c34a16891f84e7b',1,'财务部','财务主管'),(9,'xiangmu','827ccb0eea8a706c4c34a16891f84e7b',1,'项目部','项目主管'),(10,'caigou','827ccb0eea8a706c4c34a16891f84e7b',1,'采购部','采购主管'),(11,'renliziyuan','827ccb0eea8a706c4c34a16891f84e7b',1,'人力资源部','人力资源主管'),(12,'guanggao','827ccb0eea8a706c4c34a16891f84e7b',1,'广告部','广告设计主管'),(13,'xingzheng ','827ccb0eea8a706c4c34a16891f84e7b',1,'行政部','行政主管');
/*!40000 ALTER TABLE `managers` ENABLE KEYS */;
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
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
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
INSERT INTO `positions` VALUES (1,'销售代表',1,NULL),(2,'电话销售',1,NULL),(3,'销售经理',1,NULL),(4,'销售主管',1,NULL),(5,'销售总监',1,NULL),(6,'出纳员',2,NULL),(7,'会计助理',2,NULL),(8,'会计师',2,NULL),(9,'会计经理',2,NULL),(10,'财务顾问',2,NULL),(11,'财务主管',2,NULL),(12,'财务经理',2,NULL),(13,'财务总监',2,NULL),(14,'培训专员',5,NULL),(15,'培训经理',5,NULL),(16,'培训讲师',5,NULL),(17,'人力资源总监',5,NULL),(18,'人力资源经理',5,NULL),(19,'人力资源主管',5,NULL),(20,'前台',7,NULL),(21,'行政助理',7,NULL),(22,'行政专员',7,NULL),(23,'行政经理',7,NULL),(24,'行政主管',7,NULL),(25,'行政总监',7,NULL),(26,'项目专员',3,NULL),(27,'项目主管',3,NULL),(28,'项目经理',3,NULL),(29,'项目专管',3,NULL),(30,'项目助理',3,NULL),(31,'测试工程师',3,NULL),(32,'开发工程师',3,NULL),(33,'报关员',4,NULL),(34,'贸易跟单员',4,NULL),(35,'外贸主管',4,NULL),(36,'外贸专员',4,NULL),(37,'采购主管',4,NULL),(38,'采购专员',4,NULL),(39,'采购经理',4,NULL),(40,'广告设计师',6,NULL),(41,'广告文案策划',6,NULL),(42,'广告美术指导',6,NULL),(43,'广告执行制作',6,NULL),(44,'广告设计经理',6,NULL),(45,'广告设计主管',6,NULL);
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
  `u_gender` varchar(10) NOT NULL COMMENT '性别',
  `first_work_time` date NOT NULL COMMENT '参加工作时间',
  `tel` bigint(11) NOT NULL COMMENT '联系电话',
  `email` varchar(50) NOT NULL COMMENT '电子邮箱',
  `dept_id` int(11) NOT NULL COMMENT '应聘的部门ID',
  `position_id` int(11) NOT NULL COMMENT '应聘的职位ID',
  `work_experience` varchar(500) NOT NULL COMMENT '工作经验',
  `education` varchar(50) NOT NULL COMMENT '学历',
  `expect_salary` double NOT NULL COMMENT '期望薪资',
  `hobbies` varchar(100) NOT NULL COMMENT '兴趣爱好',
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resumes`
--

LOCK TABLES `resumes` WRITE;
/*!40000 ALTER TABLE `resumes` DISABLE KEYS */;
INSERT INTO `resumes` VALUES (12,22,'aaa','aaa','2000-10-01','男','2018-10-09',12345678098,'12345@163.com',2,9,'asdfg','本科',12345,'qweer'),(13,19,'bbb','bbb','2000-10-10','女','2017-10-10',12345678098,'12345@163.com',5,17,'1111','本科',111,'23456'),(14,10,'ccc','ccc','1998-10-19','男','2018-10-28',111111111111,'12345@163.com',1,2,'asdfg','本科',12345,'1232345'),(15,26,'fff','fff','1995-10-09','男','2018-10-18',111111111111,'12345@163.com',1,2,'12345','大专',12345,'23456');
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
-- Table structure for table `train`
--

DROP TABLE IF EXISTS `train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `train` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '培训Id',
  `title` varchar(50) NOT NULL COMMENT '培训主题',
  `e_id` int(11) NOT NULL COMMENT '员工ID',
  `start_time` datetime NOT NULL COMMENT '培训开始时间',
  `end_tiem` datetime NOT NULL COMMENT '结束时间',
  `result` double NOT NULL COMMENT '培训结果',
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train`
--

LOCK TABLES `train` WRITE;
/*!40000 ALTER TABLE `train` DISABLE KEYS */;
/*!40000 ALTER TABLE `train` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (10,'ccc','827ccb0eea8a706c4c34a16891f84e7b'),(11,'dddd','827ccb0eea8a706c4c34a16891f84e7b'),(19,'bbb','827ccb0eea8a706c4c34a16891f84e7b'),(22,'aaa','827ccb0eea8a706c4c34a16891f84e7b'),(25,'eee','827ccb0eea8a706c4c34a16891f84e7b'),(26,'fff','827ccb0eea8a706c4c34a16891f84e7b'),(28,' a','c4ca4238a0b923820dcc509a6f75849b'),(29,'qqq','202cb962ac59075b964b07152d234b70');
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

-- Dump completed on 2018-10-19 17:07:50
