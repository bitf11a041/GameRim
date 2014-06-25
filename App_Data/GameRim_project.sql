/*
SQLyog Enterprise - MySQL GUI v7.12 
MySQL - 5.6.12-log : Database - gamerim
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`gamerim` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `gamerim`;

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `Cart_Id` int(30) NOT NULL AUTO_INCREMENT,
  `U_Email` varchar(30) NOT NULL,
  `Purchase_Date` date NOT NULL,
  PRIMARY KEY (`Cart_Id`),
  KEY `U_Email` (`U_Email`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`U_Email`) REFERENCES `user` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

/*Data for the table `cart` */

insert  into `cart`(`Cart_Id`,`U_Email`,`Purchase_Date`) values (1,'mohsin_khan310@yahoo.com','2014-02-05'),(2,'mohsin_khan310@yahoo.com','2014-02-05'),(3,'mohsin_khan310@yahoo.com','2014-02-05'),(4,'mohsin_khan310@hotmail.com','2014-02-05'),(5,'mohsin_khan310@hotmail.com','2014-02-05'),(6,'mohsin_khan310@hotmail.com','2014-02-05'),(7,'mohsin_khan310@hotmail.com','2014-02-05'),(8,'mohsin_khan310@yahoo.com','2014-02-05'),(9,'mohsin_khan310@hotmail.com','2014-02-05'),(10,'mohsin_khan310@hotmail.com','2014-02-05'),(11,'mohsin_khan310@hotmail.com','2014-02-05'),(12,'mohsin_khan310@hotmail.com','2014-02-05'),(13,'mohsin_khan310@hotmail.com','2014-02-06'),(14,'mohsin_khan310@hotmail.com','2014-02-06'),(15,'mohsin_khan310@hotmail.com','2014-02-06'),(16,'mohsin_khan310@yahoo.com','2014-02-06'),(17,'mohsin_khan310@yahoo.com','2014-02-06'),(18,'mohsin_khan310@yahoo.com','2014-02-06'),(19,'mohsin_khan310@yahoo.com','2014-02-06'),(20,'mohsin_khan310@yahoo.com','2014-02-06'),(21,'mohsin_khan310@hotmail.com','2014-02-06'),(22,'abc@hotmail.com','2014-02-06');

/*Table structure for table `developer` */

DROP TABLE IF EXISTS `developer`;

CREATE TABLE `developer` (
  `Developer_ID` varchar(30) NOT NULL,
  `Developer_Name` varchar(30) NOT NULL,
  `Description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`Developer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `developer` */

insert  into `developer`(`Developer_ID`,`Developer_Name`,`Description`) values ('d1','UbiSoft','One of the best game Developers!');

/*Table structure for table `game` */

DROP TABLE IF EXISTS `game`;

CREATE TABLE `game` (
  `Game_Id` varchar(30) NOT NULL,
  `Game_name` varchar(30) NOT NULL,
  `Rating` int(2) DEFAULT NULL,
  `Price` int(4) NOT NULL,
  `Release_Date` date DEFAULT NULL,
  `Description` varchar(250) DEFAULT NULL,
  `CPU_Req` varchar(10) DEFAULT NULL,
  `Ram_Req` varchar(10) DEFAULT NULL,
  `Hard_Req` varchar(10) DEFAULT NULL,
  `GraphicCard_Req` varchar(30) DEFAULT NULL,
  `Developer_ID` varchar(30) DEFAULT NULL,
  `PlatForm` varchar(10) NOT NULL,
  `Category` varchar(30) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Game_Id`),
  KEY `Developer_ID` (`Developer_ID`),
  CONSTRAINT `game_ibfk_1` FOREIGN KEY (`Developer_ID`) REFERENCES `developer` (`Developer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `game` */

insert  into `game`(`Game_Id`,`Game_name`,`Rating`,`Price`,`Release_Date`,`Description`,`CPU_Req`,`Ram_Req`,`Hard_Req`,`GraphicCard_Req`,`Developer_ID`,`PlatForm`,`Category`,`status`) values ('g1','Assassins Creed Chronicles',8,5000,'2014-02-03','Assassins creed','i3 extream','4 gb','10 gb','4 gb','d1','Xbox','Action',0),('g3','Prototype',8,4000,'2008-12-30','Good Game','Dual core','2 gb','8 gb','1 gb','d1','pc','Action',1),('GTA_12','GTA',2,50,'2014-02-12','town game','abc','fdg','fdg','dfg','d1','Android','roadPlay',1);

/*Table structure for table `item` */

DROP TABLE IF EXISTS `item`;

CREATE TABLE `item` (
  `Item_Id` int(30) NOT NULL AUTO_INCREMENT,
  `Cart_Id` int(30) NOT NULL,
  `Quantity` int(7) NOT NULL DEFAULT '1',
  `Game_Id` varchar(30) NOT NULL,
  PRIMARY KEY (`Item_Id`),
  KEY `Cart_Id` (`Cart_Id`),
  KEY `Game_Id` (`Game_Id`),
  CONSTRAINT `item_ibfk_1` FOREIGN KEY (`Cart_Id`) REFERENCES `cart` (`Cart_Id`),
  CONSTRAINT `item_ibfk_2` FOREIGN KEY (`Game_Id`) REFERENCES `game` (`Game_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `item` */

insert  into `item`(`Item_Id`,`Cart_Id`,`Quantity`,`Game_Id`) values (1,1,4,'g1'),(2,1,4,'g1'),(3,4,4,'g1'),(4,8,3,'g1'),(5,9,45,'g1'),(6,10,3,'g1'),(7,10,4,'g3'),(8,11,5,'g1'),(9,11,13,'g3'),(10,12,7,'g1'),(11,12,8,'g3'),(12,17,376,'g1'),(13,18,324,'g1'),(14,19,324,'g1'),(15,20,10,'g1'),(16,20,7,'g3'),(17,21,19,'g1'),(18,21,7,'g3'),(19,22,1,'g1');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `Email` varchar(30) NOT NULL,
  `User_name` varchar(30) NOT NULL,
  `City` varchar(30) NOT NULL,
  `Street` int(3) NOT NULL,
  `House` int(3) NOT NULL,
  `Credit_card_no` int(30) NOT NULL,
  `pass_w` varchar(30) NOT NULL,
  PRIMARY KEY (`Email`),
  UNIQUE KEY `Credit_card_no` (`Credit_card_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`Email`,`User_name`,`City`,`Street`,`House`,`Credit_card_no`,`pass_w`) values ('abc@hotmail.com','hassan khan','lahore',123,42,1235432,'12345'),('Admin','Admin','Admin',0,0,0,'Admin'),('bitf11a041@gmail.com','Mohsin','Lahore',23,1,12321415,'pass'),('dsf','f1','hjds',23,234,234,'kal'),('dsfkj','dsf','jshf',324,2434,324,'sdjk'),('dshajk','hjk','jdkh',38,238,3278,'hs'),('fg','dfg','fdgfdg',123,12,123,'123'),('James@gmail.com','Jamshed','karachi',24,324,132423,'pakistan'),('Jazzy@gmail.com','Jamshed','karachi',34,21,234875287,'pakistan'),('moh','pak','3287',8973,23,327498,'pak'),('mohsin_khan310@gmail.com','User_name','Lahore',24,10,1400201,'pass'),('mohsin_khan310@hotmail.com','Khan','Lahore',123,23,2144155,'pakistan'),('mohsin_khan310@yahoo.com','User_name','Lahore',24,10,2147483647,'pass'),('pak','pak','lahore',2234,234,32342,'pak');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
