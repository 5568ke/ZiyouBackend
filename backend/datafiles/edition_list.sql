-- MySQL dump 10.13  Distrib 5.6.37, for Linux (x86_64)
--
-- Host: localhost    Database: serial_number_2
-- ------------------------------------------------------
-- Server version	5.6.37

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
-- Table structure for table `edition_list_112`
--

DROP TABLE IF EXISTS `edition_list_112`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edition_list_112` (
  `edi_num` varchar(7) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0-00-00' COMMENT 'edition-vol-chap',
  `edition` varchar(4) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT 'hle=1,knsh=2,nani=3,edu=4',
  `vol` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Ã¥â€ Å ',
  `chap` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Ã¥â€“Â®Ã¥â€¦Æ’',
  `chap_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Ã¥â€“Â®Ã¥â€¦Æ’Ã¥ÂÂÃ§Â¨Â±',
  PRIMARY KEY (`edi_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edition_list_112`
--

LOCK TABLES `edition_list_112` WRITE;
/*!40000 ALTER TABLE `edition_list_112` DISABLE KEYS */;
INSERT INTO `edition_list_112` VALUES ('0-00-00','0',0,0,''),('1-01-01','1',1,1,'10以內的數'),('1-01-02','1',1,2,'比較物品的長短'),('1-01-03','1',1,3,'排順序、比多少'),('1-01-04','1',1,4,'分與合'),('1-01-05','1',1,5,'10以內的加減'),('1-01-06','1',1,6,'認識形狀'),('1-01-07','1',1,7,'30以內的數'),('1-01-08','1',1,8,'時間：幾點和幾點半'),('1-01-09','1',1,9,'其他'),('1-02-01','1',2,1,'100以內的數'),('1-02-02','1',2,2,'20以內的加減'),('1-02-03','1',2,3,'單位長度量測'),('1-02-04','1',2,4,'認識錢幣'),('1-02-05','1',2,5,'圖形和形體'),('1-02-06','1',2,6,'年曆：認識月、日、星期幾'),('1-02-07','1',2,7,'二位數的加減'),('1-02-08','1',2,8,'加減應用'),('1-02-09','1',2,9,'分類紀錄'),('1-02-10','1',2,10,'其他'),('1-03-01','1',3,1,'200以內的數'),('1-03-02','1',3,2,'二位數的直式加法'),('1-03-03','1',3,3,'二位數的直式減法'),('1-03-04','1',3,4,'量量看幾公分'),('1-03-05','1',3,5,'兩步驟的加減'),('1-03-06','1',3,6,'時間：幾點幾分'),('1-03-07','1',3,7,'連加與倍數'),('1-03-08','1',3,8,'九九乘法'),('1-03-09','1',3,9,'平面、直線和角'),('1-03-10','1',3,10,'其他'),('1-04-01','1',4,1,'1000以內的數'),('1-04-02','1',4,2,'三位數的加減'),('1-04-03','1',4,3,'容量與重量'),('1-04-04','1',4,4,'長度：公尺和公分'),('1-04-05','1',4,5,'年曆：推算年、月、星期'),('1-04-06','1',4,6,'兩步驟乘法'),('1-04-07','1',4,7,'分裝與平分'),('1-04-08','1',4,8,'面的大小'),('1-04-09','1',4,9,'平面圖形與立體形體'),('1-04-10','1',4,10,'分數、分類統計與其他'),('1-05-01','1',5,1,'數線'),('1-05-02','1',5,2,'10000以內的數'),('1-05-03','1',5,3,'四位數的加減'),('1-05-04','1',5,4,'認識圓和角'),('1-05-05','1',5,5,'乘法'),('1-05-06','1',5,6,'容量：公升和毫升'),('1-05-07','1',5,7,'二位數除以一位數'),('1-05-08','1',5,8,'重量：公斤和公克'),('1-05-09','1',5,9,'時間：年月日時分秒運算'),('1-05-10','1',5,10,'分數：認識分數'),('1-05-11','1',5,11,'尋找規律與其他'),('1-06-01','1',6,1,'周界和周長'),('1-06-02','1',6,2,'分數：同分母分數加減'),('1-06-03','1',6,3,'面積'),('1-06-04','1',6,4,'三位數除以一位數'),('1-06-05','1',6,5,'小數：一位小數與加減'),('1-06-06','1',6,6,'長度：毫米'),('1-06-07','1',6,7,'加減併式與估算'),('1-06-08','1',6,8,'乘法與除法'),('1-06-09','1',6,9,'統計圖表'),('1-06-10','1',6,10,'其他'),('1-07-01','1',7,1,'一億以內的數'),('1-07-02','1',7,2,'角度'),('1-07-03','1',7,3,'乘法'),('1-07-04','1',7,4,'除法'),('1-07-05','1',7,5,'長度：公里、公尺、公分'),('1-07-06','1',7,6,'整數的四則計算'),('1-07-07','1',7,7,'分數：真分數、假分數、帶分數'),('1-07-08','1',7,8,'認識三角形'),('1-07-09','1',7,9,'長度、重量、容量的複名數計算'),('1-07-10','1',7,10,'分數：同分母分數運算'),('1-07-11','1',7,11,'其他'),('1-08-01','1',8,1,'認識大數'),('1-08-02','1',8,2,'概數'),('1-08-03','1',8,3,'分數：等值分數'),('1-08-04','1',8,4,'時間：時間的換算'),('1-08-05','1',8,5,'體積：立方公分'),('1-08-06','1',8,6,'小數：二位小數'),('1-08-07','1',8,7,'小數：小數與分數的互換'),('1-08-08','1',8,8,'四邊形'),('1-08-09','1',8,9,'方形的周長和面積'),('1-08-10','1',8,10,'統計圖表：長條圖、折線圖'),('1-08-11','1',8,11,'數量規律與其他'),('1-09-01','1',9,1,'整數與計算規則'),('1-09-02','1',9,2,'小數：四位以上的小數與估算'),('1-09-03','1',9,3,'因數與倍數'),('1-09-04','1',9,4,'分數：擴分、約分和通分'),('1-09-05','1',9,5,'多邊形角度'),('1-09-06','1',9,6,'長方體、正多面體和球'),('1-09-07','1',9,7,'平面圖形的面積'),('1-09-08','1',9,8,'時間：乘除法運算'),('1-09-09','1',9,9,'分數：異分母分數的加減'),('1-09-10','1',9,10,'扇形'),('1-09-11','1',9,11,'乘法和除法'),('1-09-12','1',9,12,'其他'),('1-10-01','1',10,1,'分數：分數的乘法'),('1-10-02','1',10,2,'線對稱圖形'),('1-10-03','1',10,3,'體積的計算'),('1-10-04','1',10,4,'體積、容積與容量'),('1-10-05','1',10,5,'小數：小數的乘法'),('1-10-06','1',10,6,'生活中的大單位'),('1-10-07','1',10,7,'比率與百分率'),('1-10-08','1',10,8,'正方體與長方體的表面積'),('1-10-09','1',10,9,'未知數運算'),('1-10-10','1',10,10,'整數、分數、小數除以整數'),('1-10-11','1',10,11,'其他'),('1-11-01','1',11,1,'最大公因數與最小公倍數'),('1-11-02','1',11,2,'分數：分數的除法'),('1-11-03','1',11,3,'小數：三位以下小數的除法'),('1-11-04','1',11,4,'比、比值與成正比'),('1-11-05','1',11,5,'縮圖、放大圖與比例尺'),('1-11-06','1',11,6,'圓周長、圓面積與扇形面積'),('1-11-07','1',11,7,'圓的複合圖形'),('1-11-08','1',11,8,'柱體與錐體'),('1-11-09','1',11,9,'統計圖表'),('1-11-10','1',11,10,'其他'),('1-12-01','1',12,1,'分數、小數混合四則運算'),('1-12-02','1',12,2,'柱體的體積與表面積'),('1-12-03','1',12,3,'速度與速率'),('1-12-04','1',12,4,'等量公理'),('1-12-05','1',12,5,'怎樣解題'),('1-12-06','1',12,6,'算術的應用問題'),('1-12-07','1',12,7,'基準量與比較量'),('1-12-08','1',12,8,'其他'),('1-13-01','1',13,1,'整數的運算'),('1-13-02','1',13,2,'絕對值'),('1-13-03','1',13,3,'小數的運算'),('1-13-04','1',13,4,'分數的運算'),('1-13-05','1',13,5,'一元一次方程式'),('2-01-01','2',1,1,'10以內的數'),('2-01-02','2',1,2,'比長短'),('2-01-03','2',1,3,'順序與多少'),('2-01-04','2',1,4,'分與合'),('2-01-05','2',1,5,'認識形狀'),('2-01-06','2',1,6,'10以內的加法'),('2-01-07','2',1,7,'10以內的減法'),('2-01-08','2',1,8,'30以內的數'),('2-01-09','2',1,9,'時間'),('2-01-10','2',1,10,'其他'),('2-02-01','2',2,1,'20以內的加法'),('2-02-02','2',2,2,'長度'),('2-02-03','2',2,3,'20以內的減法'),('2-02-04','2',2,4,'100以內的數'),('2-02-05','2',2,5,'形狀與形體'),('2-02-06','2',2,6,'數數看有多少元'),('2-02-07','2',2,7,'幾月幾日星期幾'),('2-02-08','2',2,8,'兩位數的加減法'),('2-02-09','2',2,9,'分類整理'),('2-02-10','2',2,10,'其他'),('2-03-01','2',3,1,'200以內的數'),('2-03-02','2',3,2,'二位數的加減法'),('2-03-03','2',3,3,'認識公分'),('2-03-04','2',3,4,'加減應用'),('2-03-05','2',3,5,'容量'),('2-03-06','2',3,6,'加減兩步驟'),('2-03-07','2',3,7,'乘法(一)'),('2-03-08','2',3,8,'時間'),('2-03-09','2',3,9,'乘法(二)'),('2-03-10','2',3,10,'面的大小比較'),('2-03-11','2',3,11,'其他'),('2-04-01','2',4,1,'1000以內的數'),('2-04-02','2',4,2,'重量'),('2-04-03','2',4,3,'加加減減'),('2-04-04','2',4,4,'平面圖形與立體形體'),('2-04-05','2',4,5,'乘法'),('2-04-06','2',4,6,'公尺與公分'),('2-04-07','2',4,7,'乘與加減兩步驟'),('2-04-08','2',4,8,'年、月、日'),('2-04-09','2',4,9,'分裝與平分'),('2-04-10','2',4,10,'認識分數'),('2-04-11','2',4,11,'其他'),('2-05-01','2',5,1,'10000以內的數'),('2-05-02','2',5,2,'角與形狀'),('2-05-03','2',5,3,'10000以內的加減'),('2-05-04','2',5,4,'乘法'),('2-05-05','2',5,5,'毫米與數線'),('2-05-06','2',5,6,'除法'),('2-05-07','2',5,7,'公斤與公克'),('2-05-08','2',5,8,'分數'),('2-05-09','2',5,9,'列表與規律'),('2-05-10','2',5,10,'其他'),('2-06-01','2',6,1,'除法'),('2-06-02','2',6,2,'公升與毫升'),('2-06-03','2',6,3,'分數與加減'),('2-06-04','2',6,4,'圓'),('2-06-05','2',6,5,'兩步驟應用問題'),('2-06-06','2',6,6,'一位小數'),('2-06-07','2',6,7,'時間'),('2-06-08','2',6,8,'乘與除'),('2-06-09','2',6,9,'面積'),('2-06-10','2',6,10,'其他'),('2-07-01','2',7,1,'一億以內的數'),('2-07-02','2',7,2,'乘法'),('2-07-03','2',7,3,'角度'),('2-07-04','2',7,4,'除法'),('2-07-05','2',7,5,'公里'),('2-07-06','2',7,6,'假分數與帶分數'),('2-07-07','2',7,7,'三角形與全等'),('2-07-08','2',7,8,'兩步驟問題與併式'),('2-07-09','2',7,9,'二位小數'),('2-07-10','2',7,10,'統計圖表'),('2-07-11','2',7,11,'其他'),('2-08-01','2',8,1,'概數'),('2-08-02','2',8,2,'四則運算'),('2-08-03','2',8,3,'垂直、平行與四邊形'),('2-08-04','2',8,4,'分數（一）'),('2-08-05','2',8,5,'周長與面積'),('2-08-06','2',8,6,'小數乘法'),('2-08-07','2',8,7,'體積'),('2-08-08','2',8,8,'分數（二） '),('2-08-09','2',8,9,'時間的計算'),('2-08-10','2',8,10,'規律'),('2-08-11','2',8,11,'其他'),('2-09-01','2',9,1,'折線圖'),('2-09-02','2',9,2,'倍數與因數'),('2-09-03','2',9,3,'平面圖形'),('2-09-04','2',9,4,'公倍數與公因數'),('2-09-05','2',9,5,'立體形體'),('2-09-06','2',9,6,'整數四則運算'),('2-09-07','2',9,7,'擴、約分與加減'),('2-09-08','2',9,8,'面積'),('2-09-09','2',9,9,'乘以幾分之一'),('2-09-10','2',9,10,'扇形'),('2-09-11','2',9,11,'其他'),('2-10-01','2',10,1,'數的十進位結構'),('2-10-02','2',10,2,'分數'),('2-10-03','2',10,3,'長方體與正方體的體積'),('2-10-04','2',10,4,'小數'),('2-10-05','2',10,5,'生活中的大單位'),('2-10-06','2',10,6,'時間的乘除'),('2-10-07','2',10,7,'表面積'),('2-10-08','2',10,8,'比率與百分率'),('2-10-09','2',10,9,'容積'),('2-10-10','2',10,10,'線對稱圖形'),('2-10-11','2',10,11,'其他'),('2-11-01','2',11,1,'最大公因數與最小公倍數'),('2-11-02','2',11,2,'分數的除法'),('2-11-03','2',11,3,'長條圖與折線圖'),('2-11-04','2',11,4,'小數的除法'),('2-11-05','2',11,5,'圓周長與扇形弧長'),('2-11-06','2',11,6,'比、比值與正比'),('2-11-07','2',11,7,'縮放圖與比例尺'),('2-11-08','2',11,8,'圓與扇形面積'),('2-11-09','2',11,9,'規律問題'),('2-11-10','2',11,10,'等量公理'),('2-11-11','2',11,11,'其他'),('2-12-01','2',12,1,'小數與分數的四則運算'),('2-12-02','2',12,2,'角柱與圓柱'),('2-12-03','2',12,3,'速率'),('2-12-04','2',12,4,'圓形圖'),('2-12-05','2',12,5,'基準量與比較量'),('2-12-06','2',12,6,'怎樣解題'),('2-12-07','2',12,7,'其他'),('3-01-01','3',1,1,'10以內的數'),('3-01-02','3',1,2,'比長短'),('3-01-03','3',1,3,'排順序、比多少'),('3-01-04','3',1,4,'分與合'),('3-01-05','3',1,5,'方盒、圓罐、球'),('3-01-06','3',1,6,'30以內的數'),('3-01-07','3',1,7,'10以內的加法'),('3-01-08','3',1,8,'10以內的減法'),('3-01-09','3',1,9,'幾點鐘'),('3-01-10','3',1,10,'其他'),('3-02-01','3',2,1,'50以內的數'),('3-02-02','3',2,2,'18以內的加法'),('3-02-03','3',2,3,'圖形與分類'),('3-02-04','3',2,4,'18以內的減法'),('3-02-05','3',2,5,'有多長'),('3-02-06','3',2,6,'100以內的數'),('3-02-07','3',2,7,'認識錢幣'),('3-02-08','3',2,8,'二位數的加減'),('3-02-09','3',2,9,'幾月幾日星期幾'),('3-02-10','3',2,10,'其他'),('3-03-01','3',3,1,'200以內的數'),('3-03-02','3',3,2,'二位數的直式加減'),('3-03-03','3',3,3,'量長度'),('3-03-04','3',3,4,'加減關係與應用'),('3-03-05','3',3,5,'面積的大小比較'),('3-03-06','3',3,6,'兩步驟的加減'),('3-03-07','3',3,7,'2、5、4、8的乘法'),('3-03-08','3',3,8,'幾時幾分'),('3-03-09','3',3,9,'3、6、9、7的乘法'),('3-03-10','3',3,10,'容量與重量'),('3-03-11','3',3,11,'其他'),('3-04-01','3',4,1,'1000以內的數'),('3-04-02','3',4,2,'三位數的加減'),('3-04-03','3',4,3,'平面圖形'),('3-04-04','3',4,4,'年、月、日'),('3-04-05','3',4,5,'乘法'),('3-04-06','3',4,6,'兩步驟應用問題'),('3-04-07','3',4,7,'公尺和公分'),('3-04-08','3',4,8,'分類與立體形體'),('3-04-09','3',4,9,'分分看'),('3-04-10','3',4,10,'分數'),('3-04-11','3',4,11,'其他'),('3-05-01','3',5,1,'10000以內的數'),('3-05-02','3',5,2,'四位數的加減'),('3-05-03','3',5,3,'毫米'),('3-05-04','3',5,4,'乘法'),('3-05-05','3',5,5,'角'),('3-05-06','3',5,6,'面積'),('3-05-07','3',5,7,'除法'),('3-05-08','3',5,8,'公升和毫升'),('3-05-09','3',5,9,'分數'),('3-05-10','3',5,10,'其他'),('3-06-01','3',6,1,'分數的加減'),('3-06-02','3',6,2,'除法'),('3-06-03','3',6,3,'尋找規律'),('3-06-04','3',6,4,'公斤和公克'),('3-06-05','3',6,5,'小數'),('3-06-06','3',6,6,'圓'),('3-06-07','3',6,7,'乘法與除法'),('3-06-08','3',6,8,'時間'),('3-06-09','3',6,9,'統計表'),('3-06-10','3',6,10,'其他'),('3-07-01','3',7,1,'一億以內的數'),('3-07-02','3',7,2,'整數的乘法'),('3-07-03','3',7,3,'角度'),('3-07-04','3',7,4,'整數的除法'),('3-07-05','3',7,5,'三角形'),('3-07-06','3',7,6,'整數四則計算'),('3-07-07','3',7,7,'公里'),('3-07-08','3',7,8,'分數'),('3-07-09','3',7,9,'小數'),('3-07-10','3',7,10,'統計圖'),('3-07-11','3',7,11,'其他'),('3-08-01','3',8,1,'多位數的乘與除'),('3-08-02','3',8,2,'四邊形'),('3-08-03','3',8,3,'簡化計算'),('3-08-04','3',8,4,'周長與面積'),('3-08-05','3',8,5,'小數乘法'),('3-08-06','3',8,6,'等值分數'),('3-08-07','3',8,7,'數量規律'),('3-08-08','3',8,8,'概數'),('3-08-09','3',8,9,'時間的計算'),('3-08-10','3',8,10,'立方公分'),('3-08-11','3',8,11,'其他'),('3-09-01','3',9,1,'多位小數與加減'),('3-09-02','3',9,2,'因數與公因數'),('3-09-03','3',9,3,'倍數與公倍數'),('3-09-04','3',9,4,'擴分、約分與通分'),('3-09-05','3',9,5,'多邊形與扇形'),('3-09-06','3',9,6,'異分母分數的加減'),('3-09-07','3',9,7,'線對稱圖形'),('3-09-08','3',9,8,'整數四則運算'),('3-09-09','3',9,9,'面積'),('3-09-10','3',9,10,'柱體、錐體和球'),('3-09-11','3',9,11,'其他'),('3-10-01','3',10,1,'體積'),('3-10-02','3',10,2,'分數的計算'),('3-10-03','3',10,3,'容積'),('3-10-04','3',10,4,'小數的乘法'),('3-10-05','3',10,5,'億以上的數'),('3-10-06','3',10,6,'整數、小數除以整數'),('3-10-07','3',10,7,'表面積'),('3-10-08','3',10,8,'比率與百分率'),('3-10-09','3',10,9,'時間的乘除'),('3-10-10','3',10,10,'生活中的大單位與折線圖'),('3-10-11','3',10,11,'其他'),('3-11-01','3',11,1,'最大公因數與最小公倍數'),('3-11-02','3',11,2,'分數除法'),('3-11-03','3',11,3,'數量關係'),('3-11-04','3',11,4,'小數除法'),('3-11-05','3',11,5,'長條圖與折線圖'),('3-11-06','3',11,6,'圓周率與圓周長'),('3-11-07','3',11,7,'圓面積'),('3-11-08','3',11,8,'等量公理與應用'),('3-11-09','3',11,9,'比、比值與成正比'),('3-11-10','3',11,10,'縮圖、放大圖與比例尺'),('3-11-11','3',11,11,'其他'),('3-12-01','3',12,1,'分數與小數的計算'),('3-12-02','3',12,2,'速率'),('3-12-03','3',12,3,'形體關係、體積與表面積'),('3-12-04','3',12,4,'基準量與比較量'),('3-12-05','3',12,5,'怎樣解題'),('3-12-06','3',12,6,'圓形圖'),('3-12-07','3',12,7,'其他'),('4-01-01','4',1,1,'數到10'),('4-01-02','4',1,2,'比長短'),('4-01-03','4',1,3,'分與合'),('4-01-04','4',1,4,'順序和多少'),('4-01-05','4',1,5,'數到30'),('4-01-06','4',1,6,'加一加'),('4-01-07','4',1,7,'認識形狀'),('4-01-08','4',1,8,'減一減與加減應用'),('4-01-09','4',1,9,'讀鐘錶'),('4-01-10','4',1,10,'其他'),('4-02-01','4',2,1,'數到100'),('4-02-02','4',2,2,'18以內的加法'),('4-02-03','4',2,3,'長度'),('4-02-04','4',2,4,'18以內的減法'),('4-02-05','4',2,5,'圖形和形體'),('4-02-06','4',2,6,'幾月幾日'),('4-02-07','4',2,7,'錢幣'),('4-02-08','4',2,8,'二位數的加減'),('4-02-09','4',2,9,'做紀錄'),('4-02-10','4',2,10,'其他'),('4-03-01','4',3,1,'數到300'),('4-03-02','4',3,2,'二位數的加法'),('4-03-03','4',3,3,'幾公分'),('4-03-04','4',3,4,'二位數的減法'),('4-03-05','4',3,5,'容量'),('4-03-06','4',3,6,'2、5、4、8的乘法'),('4-03-07','4',3,7,'幾時幾分'),('4-03-08','4',3,8,'3、6、7、9的乘法'),('4-03-09','4',3,9,'平面圖形'),('4-03-10','4',3,10,'重量'),('4-03-11','4',3,11,'其他'),('4-04-01','4',4,1,'數到1000'),('4-04-02','4',4,2,'加加減減'),('4-04-03','4',4,3,'幾公尺'),('4-04-04','4',4,4,'0、1、10的乘法'),('4-04-05','4',4,5,'年月日'),('4-04-06','4',4,6,'兩步驟的乘法'),('4-04-07','4',4,7,'分東西'),('4-04-08','4',4,8,'單位分數'),('4-04-09','4',4,9,'面的大小與立體'),('4-04-10','4',4,10,'其他'),('4-05-01','4',5,1,'數到10000'),('4-05-02','4',5,2,'四位數的加減'),('4-05-03','4',5,3,'乘法'),('4-05-04','4',5,4,'幾毫米'),('4-05-05','4',5,5,'角、正方形和長方形'),('4-05-06','4',5,6,'除法'),('4-05-07','4',5,7,'找規律'),('4-05-08','4',5,8,'分數'),('4-05-09','4',5,9,'圓'),('4-05-10','4',5,10,'其他'),('4-06-01','4',6,1,'除法'),('4-06-02','4',6,2,'公升和毫升'),('4-06-03','4',6,3,'時間'),('4-06-04','4',6,4,'兩步驟的計算'),('4-06-05','4',6,5,'面積'),('4-06-06','4',6,6,'公斤和公克'),('4-06-07','4',6,7,'分數的加減'),('4-06-08','4',6,8,'乘除的應用'),('4-06-09','4',6,9,'小數'),('4-06-10','4',6,10,'報讀表格'),('4-06-11','4',6,11,'其他'),('4-07-01','4',7,1,'一億以內的數'),('4-07-02','4',7,2,'乘法'),('4-07-03','4',7,3,'角度'),('4-07-04','4',7,4,'除法'),('4-07-05','4',7,5,'三角形'),('4-07-06','4',7,6,'分數'),('4-07-07','4',7,7,'數量關係'),('4-07-08','4',7,8,'整數四則'),('4-07-09','4',7,9,'小數'),('4-07-10','4',7,10,'長度'),('4-07-11','4',7,11,'其他'),('4-08-01','4',8,1,'統計圖表'),('4-08-02','4',8,2,'分數的加減和整數倍'),('4-08-03','4',8,3,'概數'),('4-08-04','4',8,4,'小數乘以整數'),('4-08-05','4',8,5,'四邊形'),('4-08-06','4',8,6,'周長和面積'),('4-08-07','4',8,7,'等值分數'),('4-08-08','4',8,8,'時間的加減'),('4-08-09','4',8,9,'立方公分'),('4-08-10','4',8,10,'其他'),('4-09-01','4',9,1,'數的十進位結構'),('4-09-02','4',9,2,'因數和倍數'),('4-09-03','4',9,3,'多邊形'),('4-09-04','4',9,4,'擴分、約分和通分'),('4-09-05','4',9,5,'線對稱圖形'),('4-09-06','4',9,6,'異分母分數的加減'),('4-09-07','4',9,7,'整數四則計算'),('4-09-08','4',9,8,'平行四邊形、三角形和梯形的面積'),('4-09-09','4',9,9,'時間的乘除'),('4-09-10','4',9,10,'正方體和長方體'),('4-09-11','4',9,11,'其他'),('4-10-01','4',10,1,'分數的計算'),('4-10-02','4',10,2,'小數的乘法'),('4-10-03','4',10,3,'扇形'),('4-10-04','4',10,4,'體積'),('4-10-05','4',10,5,'整數、小數除以整數'),('4-10-06','4',10,6,'生活中的大單位'),('4-10-07','4',10,7,'柱體、錐體和球體'),('4-10-08','4',10,8,'比率和百分率'),('4-10-09','4',10,9,'容積和容量'),('4-10-10','4',10,10,'長條圖和折線圖'),('4-10-11','4',10,11,'其他'),('4-11-01','4',11,1,'質因數分解和短除法'),('4-11-02','4',11,2,'分數的除法'),('4-11-03','4',11,3,'小數的除法'),('4-11-04','4',11,4,'比和比值'),('4-11-05','4',11,5,'圓周率和圓面積'),('4-11-06','4',11,6,'扇形面積'),('4-11-07','4',11,7,'正比'),('4-11-08','4',11,8,'速率'),('4-11-09','4',11,9,'形體關係和柱體表面積'),('4-11-10','4',11,10,'等量公理'),('4-11-11','4',11,11,'其他'),('4-12-01','4',12,1,'柱體的體積'),('4-12-02','4',12,2,'怎樣解題(一)'),('4-12-03','4',12,3,'基準量和比較量'),('4-12-04','4',12,4,'縮圖和比例尺'),('4-12-05','4',12,5,'四則混合運算'),('4-12-06','4',12,6,'怎樣解題(二)'),('4-12-07','4',12,7,'統計圖表'),('4-12-08','4',12,8,'其他'),('5-01-03','5',1,3,''),('5-01-04','5',1,4,''),('5-01-05','5',1,5,''),('5-01-06','5',1,6,''),('5-01-07','5',1,7,''),('5-01-08','5',1,8,''),('5-01-09','5',1,9,''),('5-01-10','5',1,10,''),('5-01-11','5',1,11,''),('5-02-01','5',2,1,''),('5-02-02','5',2,2,''),('5-02-03','5',2,3,''),('5-02-04','5',2,4,''),('5-02-05','5',2,5,''),('5-02-06','5',2,6,''),('5-02-07','5',2,7,''),('5-02-08','5',2,8,''),('5-02-09','5',2,9,''),('5-02-10','5',2,10,''),('5-03-01','5',3,1,''),('5-03-02','5',3,2,''),('5-03-03','5',3,3,''),('5-03-04','5',3,4,''),('5-03-05','5',3,5,''),('5-03-06','5',3,6,''),('5-03-07','5',3,7,''),('5-03-08','5',3,8,''),('5-03-09','5',3,9,''),('5-03-10','5',3,10,''),('5-04-01','5',4,1,''),('5-04-02','5',4,2,''),('5-04-03','5',4,3,''),('5-04-04','5',4,4,''),('5-04-05','5',4,5,''),('5-04-06','5',4,6,''),('5-04-07','5',4,7,''),('5-04-08','5',4,8,''),('5-04-09','5',4,9,''),('5-04-10','5',4,10,''),('5-05-01','5',5,1,''),('5-05-02','5',5,2,''),('5-05-03','5',5,3,''),('5-05-04','5',5,4,''),('5-05-05','5',5,5,''),('5-05-06','5',5,6,''),('5-05-07','5',5,7,''),('5-05-08','5',5,8,''),('5-05-09','5',5,9,''),('5-05-10','5',5,10,''),('5-06-01','5',6,1,''),('5-06-02','5',6,2,''),('5-06-03','5',6,3,''),('5-06-04','5',6,4,''),('5-06-05','5',6,5,''),('5-06-06','5',6,6,''),('5-06-07','5',6,7,''),('5-06-08','5',6,8,''),('5-06-09','5',6,9,''),('5-06-10','5',6,10,''),('5-07-01','5',7,1,''),('5-07-02','5',7,2,''),('5-07-03','5',7,3,''),('5-07-04','5',7,4,''),('5-07-05','5',7,5,''),('5-07-06','5',7,6,''),('5-07-07','5',7,7,''),('5-07-08','5',7,8,''),('5-07-09','5',7,9,''),('5-07-10','5',7,10,''),('5-08-01','5',8,1,''),('5-08-02','5',8,2,''),('5-08-03','5',8,3,''),('5-08-04','5',8,4,''),('5-08-05','5',8,5,''),('5-08-06','5',8,6,''),('5-08-07','5',8,7,''),('5-08-08','5',8,8,''),('5-08-09','5',8,9,''),('5-08-10','5',8,10,''),('5-08-11','5',8,11,''),('5-09-01','5',9,1,''),('5-09-02','5',9,2,''),('5-09-03','5',9,3,''),('5-09-04','5',9,4,''),('5-09-05','5',9,5,''),('5-09-06','5',9,6,''),('5-09-07','5',9,7,''),('5-09-08','5',9,8,''),('5-09-09','5',9,9,''),('5-09-10','5',9,10,''),('5-10-01','5',10,1,''),('5-10-02','5',10,2,''),('5-10-03','5',10,3,''),('5-10-04','5',10,4,''),('5-10-05','5',10,5,''),('5-10-06','5',10,6,''),('5-10-07','5',10,7,''),('5-10-08','5',10,8,''),('5-10-09','5',10,9,''),('5-10-10','5',10,10,''),('5-11-01','5',11,1,''),('5-11-02','5',11,2,''),('5-11-03','5',11,3,''),('5-11-04','5',11,4,''),('5-11-05','5',11,5,''),('5-11-06','5',11,6,''),('5-11-07','5',11,7,''),('5-11-08','5',11,8,''),('5-11-09','5',11,9,''),('5-11-10','5',11,10,''),('5-12-01','5',12,1,''),('5-12-02','5',12,2,''),('5-12-03','5',12,3,''),('5-12-04','5',12,4,''),('5-12-05','5',12,5,''),('5-12-06','5',12,6,''),('5-12-07','5',12,7,'');
/*!40000 ALTER TABLE `edition_list_112` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-04 11:45:12
