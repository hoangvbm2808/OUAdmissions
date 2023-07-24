-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: ouadmissions
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
-- Table structure for table `banner`
--

DROP TABLE IF EXISTS `banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banner` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `content` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner`
--

LOCK TABLES `banner` WRITE;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `post_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comment_user_idx` (`user_id`),
  KEY `fk_comment_post_idx` (`post_id`),
  CONSTRAINT `fk_comment_post` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  CONSTRAINT `fk_comment_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'Thông tin bổ ích quá',2,1),(2,'Mình vừa đủ điểm đậu ngành CNTT lun',2,2);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(1000) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `education_program` varchar(1000) DEFAULT NULL,
  `website` varchar(45) DEFAULT NULL,
  `introduce_video` varchar(45) DEFAULT NULL,
  `average_score` double DEFAULT NULL,
  `typeoftrainning_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_department_type_idx` (`typeoftrainning_id`),
  CONSTRAINT `fk_department_type` FOREIGN KEY (`typeoftrainning_id`) REFERENCES `typeoftrainning` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Khoa Công Nghệ Thông Tin (CNTT) được thành lập từ tháng 09/1990 và là một trong những Khoa được thành lập đầu tiên của trường Đại Học Mở Tp. Hồ Chí Minh. Trải qua hơn 25 năm xây dựng và phát triển, hiện nay Khoa có đội ngũ giảng viên cơ hữu giàu kinh nghiệm và tận tâm gồm các Tiến sĩ, Thạc sĩ tốt nghiệp từ các trường danh tiếng trong và ngoài nước cùng với các giảng viên thỉnh giảng đến từ các trường Đại học, viện nghiên cứu uy tín ở TP HCM. Khoa đã đào tạo và cung cấp nguồn nhân lực có chất lượng cho xã hội với số lượng xấp xỉ 5.000 cử nhân khoa học hệ chính quy khối ngành Công nghệ thông tin (Khoa học máy tính, Tin học, Hệ thống thông tin quản lý) và hàng ngàn cử nhân Tin học hệ không chính quy.','Công nghệ thông tin','Khoa hiện đang đào tạo bậc học Đại Học (4 năm) với 5 chương trình: Khoa học máy tính, Công nghệ thông tin, Công nghệ thông tin tăng cường tiếng Nhật,  Hệ thống thông tin quản lý  thuộc chương trình hệ đào tạo đại trà và ngành Khoa học máy tính (chất lượng cao).','www.it.ou.edu.vn',NULL,24,1),(2,'Tập trung trang bị cho sinh viên những kiến thức lý thuyết và thực tiễn về kế toán và quản trị tài chính tại các doanh nghiệp. Ngoài ra, sinh viên còn được cung cấp thêm các kiến thức bổ trợ về hoạt động của ngân hàng thương mại, về thị trường tài chính và các kỹ năng đầu tư, quản lý danh mục đầu tư trên thị trường tài chính.','Tài chính - Ngân hàng','Chương trình đào tạo được xây dựng trên cơ sở thực tế môi trường kinh tế - tài chính Việt Nam, đồng thời tham khảo các chương trình đào tạo tiên tiến của các nước phát triển và đặc biệt gắn liền với chương trình đào tạo để lấy các chứng chỉ hành nghề quốc tế như CFA, ACCA, CPA.',NULL,NULL,NULL,1),(3,'Khoa Kế toán – Kiểm toán đào tạo và cung cấp nguồn nhân lực kế toán, kiểm toán cho các doanh nghiệp và tổ chức trong nền kinh tế. Khoa có quan hệ hợp tác chặt chẽ với các doanh nghiệp, công ty kiểm toán và với các tổ chức nghề nghiệp như Hội Kế toán TP. HCM (HAA), Hội Kiểm toán viên hành nghề (VACPA), Hội Kế toán công chứng Anh quốc (ACCA).','Kế toán - Kiểm toán','Khoa tuyển sinh trong hệ thống tuyển sinh đại học chung của Nhà trường, thực hiện theo quy định của Bộ Giáo dục và Đào tạo. Các tổ hợp xét tuyển: Toán, Lý, Hóa; Toán, Lý, Anh; Toán, Văn, Anh; Toán, Hóa, Anh. Mã ngành: 7340301',NULL,NULL,NULL,1),(4,'Khoa Luật đào tạo hai ngành Luật và Luật Kinh tế. Sinh viên tốt nghiệp được cấp bằng cử nhân Luật và cử nhân Luật Kinh tế có trình độ chuyên môn vững vàng về kiến thức luật học và kiến thức bổ trợ khác. Bên cạnh đó, Khoa chú trọng rèn luyện các kỹ năng chuyên môn và các kỹ năng mềm, hình thành thái độ đúng đắn đối với nghề nghiệp, cộng đồng, xã hội. Sinh viên sẽ được học tập và làm việc với đội ngũ Giảng viên, Luật sư, Thẩm phán có trình độ chuyên môn cao, nhiệt tình trong các buổi học tại giảng đường, sinh hoạt ngoại khóa, các cuộc thi học thuật, hoạt động của các câu lạc bộ sinh viên, các buổi học tập thực tế tại tòa án, công ty Luật.','Luật','Cử nhân Luật và Cử nhân Luật kinh tế',NULL,NULL,NULL,1),(5,'Khoa Ngoại Ngữ, được thành lập năm 1990, hỗ trợ những nguyên lý học tập và giảng dạy mới. Sứ mạng của chúng tôi, phát huy những kiến thức và kỹ năng bền vững cho công việc và đời sống, đã giúp cho Khoa có tiềm năng trong nhiệm vụ giáo dục. Chúng tôi nỗ lực thiết lập một môi trường học tập để học viên và giảng viên luôn được khích lệ để hoàn thành tốt nhất công việc được giao. Trong cộng đồng sống động và gắn bó với tri thức người học và người dạy ở những độ tuổi và kinh nghiệm nghề nghiệp khác nhau sẽ làm phong phú nhiệm vụ học tập suốt đời.','Ngoại ngữ','Chương trình đào tạo nhằm cung cấp kiến thức về lý thuyết tiếng Anh, văn hóa, văn học của các nước sử dụng tiếng Anh như Anh, Mỹ, kiến thức chuyên ngành nền tảng để ứng dụng trong công tác chuyên môn và hội nhập xã hội.',NULL,NULL,NULL,1),(6,'Công nghệ sinh học (CNSH) là một trong 4 hướng công nghệ và sản xuất được nhà nước xếp hàng ưu tiên lâu dài, mục tiêu của việc phát triển và ứng dụng CNSH ở Việt Nam là xây dựng công nghiệp sinh học trở thành một ngành kinh tế - kỹ thuật công nghệ cao, sản xuất được các sản phẩm chủ lực, thiết yếu và đóng góp quan trọng vào sự tăng trưởng của nền kinh tế quốc dân (Trích “Nghị quyết của Chính phủ số 18/CP” ra ngày 11/03/94: Phát triển CNSH ở Việt Nam đến năm 2010” và “Quyết định số 14/2008/QĐ-TTg” ban hành ngày 22/1/2008” về việc phê duyệt “Kế hoạch tổng thể phát triển và ứng dụng CNSH ở Việt Nam đến năm 2020\").','Công nghệ sinh học','Khoa có lực lượng giảng viên đầy tâm huyết và giàu kinh nghiệm gồm: 4 PGS.TS, 14 TS, 15 ThS với 06 nghiên cứu sinh, 01 cử nhân và ngoài ra còn có 01 trợ lý phụ trách đào tạo, 01 trợ lý phụ trách sinh viên kiên quản lý hóa chất, lịch làm việc của các phòng thí nghiệm, 01 chuyên viên phụ trách trang thiết bị, máy móc 08 phòng thí nghiệm của Khoa.',NULL,NULL,NULL,1),(7,'Trong thời gian vừa qua, Khoa Quản trị kinh doanh không ngừng nỗ lực cải tiến làm mới giáo trình, tài liệu học tập, nội dung giảng dạy, áp dụng nhiều phương pháp giảng dạy tiên tiến. Ngoài ra, sinh viên còn được tạo điều kiện rèn luyện kỹ năng, gắn kết thực tế qua việc tham gia các chương trình học thuật và nhiều hoạt động câu lạc bộ, đội nhóm phong phú do Khoa tổ chức.','Quản trị kinh doanh','Khi tốt nghiệp, sinh viên được cấp Bằng Đại học chính quy ngành Quản tri kinh doanh với chuyên môn thuộc 01 trong 04 chuyên ngành đào tạo sau Quản trị Kinh doanh quốc tế, Quản trị Du Lịch, Quản trị Nhân lực, Quản trị Marketing.',NULL,NULL,NULL,1),(8,'Khoa Kinh tế và Quản lý công được thành lập năm 2007 trên cơ sở tách khoa Kinh tế - Quản trị Kinh doanh thành khoa Kinh tế và khoa Quản trị Kinh doanh. Đến năm 2010, khoa Kinh tế đổi tên thành khoa Kinh tế và Luật để phù hợp với hai ngành đào tạo của khoa là ngành Kinh tế và ngành Luật Kinh tế. Tháng 10 năm 2015, khoa Kinh tế và Luật tách thành hai khoa là khoa Luật và khoa Kinh tế và Quản lý công. ','Kinh tế và Quản lý Công','Khoa kinh tế và Quản lý công có 2 ngành đào tạo: -Ngành Kinh tế, bắt đầu đào tạo từ năm 2006. -Ngành Quản trị công, bắt đầu đào tạo từ năm 2016.',NULL,NULL,NULL,1),(9,'Khoa Xã hội học - Công tác xã hội - Đông Nam Á được hình thành dựa trên sự sáp nhập của hai khoa: Khoa Đông Nam Á học và Khoa Xã hội học và Công tác xã hội vào tháng 6/2011. (Khoa Xã hội học và Công tác xã hội được thành lập vào tháng 5 năm 1992 với tên gọi Khoa Phụ nữ học. Năm 2003 được đổi tên thành Khoa Xã hội học, đến tháng 3/2010 đổi tên là Khoa Xã hội học & Công tác xã hội; Khoa Đông Nam Á học được thành lập vào năm 1991). Sau đây gọi tắt là Khoa XHH-CTXH-ĐNAH.','Xã hội học -Công tác xã hội - Đông Nam Á',NULL,NULL,NULL,NULL,1),(10,'Khoa Xây dựng và Điện trực thuộc Trường Đại Học Mở TP.HCM, có nhiệm vụ đào tạo Kỹ sư Xây dựng và cử nhân Quản lý Xây dựng, nghiên cứu ứng dụng, chuyển giao công nghệ và phục vụ giảng dạy, sản xuất. Số SV của Khoa hiện khoảng 2000 SV không chính quy, 1200 SV chính quy, xây dựng chương trình đào tạo và phối hợp đào tạo với Khoa Đào Tạo Đặc Biệt 80 SV chương trình chất lương cao, Khoa Sau Đại Học 120 HV Cao Học.','Xây dựng và Điện',NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livestream`
--

DROP TABLE IF EXISTS `livestream`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livestream` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `content` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livestream`
--

LOCK TABLES `livestream` WRITE;
/*!40000 ALTER TABLE `livestream` DISABLE KEYS */;
INSERT INTO `livestream` VALUES (1,'Khoa học vui số 1','Ngày phát: 09/01/2023'),(2,'Từ kiến thức XH đến thị trường LĐ','Ngày phát: 16/01/2023'),(3,'Giới thiệu các ngành Đào tạo của khoa ĐTĐB','Ngày phát: 13/02/2023'),(4,'GIỚI THIỆU TỔNG QUÁT TS 2023','Ngày phát: 16/02/2023');
/*!40000 ALTER TABLE `livestream` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(1000) DEFAULT NULL,
  `content` varchar(3000) DEFAULT NULL,
  `typeoftrainning_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_post_type_idx` (`typeoftrainning_id`),
  CONSTRAINT `fk_post_type` FOREIGN KEY (`typeoftrainning_id`) REFERENCES `typeoftrainning` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'Thông báo Ngưỡng điểm nhận hồ sơ đăng ký xét tuyển Kết quả thi tốt nghiệp THPT năm 2023','THÔNG BÁO',1),(2,'THÔNG TIN TUYỂN SINH NĂM 2023 TRƯỜNG ĐẠI HỌC MỞ TP. HCM - (MÃ TRƯỜNG: MBS)','Thông tin tuyển sinh Đại học chính quy năm 2023 ',1),(3,'Thông báo danh sách thí sinh đủ điều kiện tham gia chương trình liên kết quốc tế năm 2023','Trường Đại học Mở Thành phố Hồ Chí Minh chúc mừng các thí sinh đã đủ điều kiện tham gia Chương trình liên kết quốc tế năm 2023. (Danh sách đính kèm).Thời gian nhập học dự kiến: 15/09/2023. Hình thức nộp: Thí sinh có thể nộp bằng cách: - Cách 1: Nộp trực tiếp tại Văn phòng 007, Trường Đại học Mở Thành phố Hồ Chí Minh – Số 97 Võ Văn Tần, Phường Võ Thị Sáu, Quận 3, Thành phố Hồ Chí Minh. (Từ 8g00 đến 16g00 các ngày trong tuần từ thứ 2 đến thứ 6) - Cách 2: Gửi hồ sơ theo đường bưu điện về địa chỉ: Văn phòng 007, Trường Đại học Mở Thành phố Hồ Chí Minh – Số 97 Võ Văn Tần, P. Võ Thị Sáu, Quận 3, Thành phố Hồ Chí Minh. Lưu ý: Tất cả hồ sơ sinh viên nộp cho nhà Trường là bản sao y chứng thực hoặc bản photo có kèm bản chính để đối chiếu, yêu cầu thí sinh mang theo bản chính để kiểm tra, đối chiếu. Nhà Trường không nhận hồ sơ bản chính.',1),(4,'Thông báo về việc sử dụng kết quả quy đổi chứng chỉ Ngoại ngữ thành điểm xét tuyển môn Ngoại ngữ trong tuyển sinh đại học chính quy năm 2023','Thí sinh trúng tuyển vào Trường Đại học Mở Thành phố Hồ Chí Minh năm 2023 có sử dụng chứng chỉ để quy đổi điểm xét tuyển môn Ngoại ngữ được nhà Trường thực hiện xác minh tính hợp pháp của chứng chỉ. Trường hợp chứng chỉ không hợp lệ, kết quả trúng tuyển của thí sinh sẽ bị hủy bỏ theo quy chế hiện hành.',1),(5,'Thông báo kết quả đợt xét tuyển theo đề án riêng (học bạ) vào Đại học chính quy năm 2023','Thí sinh chịu hoàn toàn trách nhiệm với những thông tin đã khai báo khi đăng ký xét tuyển. Sau khi thí sinh làm thủ tục Nhập học nhà trường sẽ tiến hành Hậu kiểm hồ sơ. Trường hợp có bất kỳ sai sót (thông tin cá nhân, điểm, ưu tiên…), nhà trường sẽ ra quyết định kỷ luật và buộc thí sinh thôi học.',1),(6,'Thông báo về việc không tổ chức mở lớp tuyển sinh Đại học bằng thứ 2 - Liên thông Cao đẳng lên Đại học chính quy năm 2022','Căn cứ Thông tư số 08/2022/TT-BGDĐT ngày 06/6/2022 của Bộ trưởng Bộ GDĐT về việc ban hành Quy chế tuyển sinh đại học, tuyển sinh cao đẳng ngành Giáo dục Mầm non; Căn cứ Quyết định số 1793/QĐ-ĐHM ngày 12/7/2022 của Trường Đại học Mở Thành phố Hồ Chí Minh về việc ban hành Đề án tuyển sinh đại học năm 2022; Căn cứ Thông báo số 1232/TB-ĐHM ngày 13/7/2022 của Trường Đại học Mở Thành phố Hồ Chí Minh về việc tuyển sinh đào tạo trình độ đại học với đối tượng tốt nghiệp đại học (đại học bằng thứ 2), hình thức đào tạo chính quy năm 2022; Căn cứ Thông báo số 1233/TB-ĐHM ngày 13/7/2022 của Trường Đại học Mở Thành phố Hồ Chí Minh về việc tuyển sinh trình độ đại học với đối tượng tốt nghiệp cao đẳng (liên thông cao đẳng – đại học), hình thức đào tạo chính quy năm 2022; Căn cứ Kết luận của Hội đồng tuyển sinh đại học chính quy năm 2022 tại phiên họp ngày 11/10/2022. Căn cứ theo số lượng hồ sơ đăng ký xét tuyển đại học Bằng thứ 2 và Liên thông Cao đẳng – Đại học chính quy năm 2022. Trường Đại học Mở Thành phố Hồ Chí Minh thông báo không mở lớp tất cả các ngành tuyển sinh đại học bằng thứ 2 và liên thông cao đẳng – đại học (do số lượng hồ sơ đăng ký không đủ số lượng để mở lớp đào tạo). Học viên sẽ được hoàn trả hồ sơ và lệ phí xét tuyển tại phòng Quản lý đào tạo (005) - 97 Võ Văn Tần, Quận 3, TP.HCM từ ngày 17/10/2022. Học viên có thể đăng ký học chương trình Vừa làm vừa học hoặc chương trình đào tạo từ xa của Trường tại Trung tâm đào tạo từ xa. Trân trọng./.',2),(7,'Thông báo tuyển sinh trình độ đào tạo đại học với đối tượng tốt nghiệp đại học (Đại học bằng thứ 2) - hình thức đào tạo chính quy năm 2022','TẢI HỒ SƠ 01. Sơ yếu lý lịch. 02. Phiếu đăng ký học. 03. Biên nhận hồ sơ - gởi Học viên. 04. Biên nhân hồ sơ - bản Lưu.',2),(8,'Thông báo tuyển sinh đào tạo trình độ đại học với đối tượng tốt nghiệp cao đẳng - hình thức đào tạo chính quy 2022','TẢI HỒ SƠ 01. Sơ yếu lý lịch. 02. Phiếu đăng ký học. 03. Biên nhận hồ sơ - gởi Học viên. 04. Biên nhân hồ sơ - bản Lưu.',2),(9,'Thông tin các loại tài khoản Văn bằng 2, Liên thông CĐ-ĐH, Khóa 2021','- Sinh viên Thời gian đăng nhập: Bắt đầu từ ngày: 01/10/2021. Dự kiến bắt đầu thời gian học kỳ 1: 18/10/2021. Tài khoản Học viên thực hiện đăng nhập để kiểm tra hoạt động của tài khoản và thường xuyên theo dõi và sử dụng các loại tài khoản này để kịp thời cập nhật những thông tin liên quan đến học tập và thời khóa biểu',2),(10,'Thủ tục nhập học Tân sinh viên Văn bằng 2 - Liên thông Khóa 2021','HƯỚNG DẪN HỌC VIÊN TRÚNG TUYỂN',2),(11,'Thông báo Ngưỡng điểm nhận hồ sơ đăng ký xét tuyển Kết quả thi tốt nghiệp THPT năm 2023','THÔNG BÁO',3),(12,'THÔNG TIN TUYỂN SINH NĂM 2023 TRƯỜNG ĐẠI HỌC MỞ TP. HCM - (MÃ TRƯỜNG: MBS)','Thông tin tuyển sinh Đại học chính quy năm 2023 ',3),(13,'Thông báo danh sách thí sinh đủ điều kiện tham gia chương trình liên kết quốc tế năm 2023','Trường Đại học Mở Thành phố Hồ Chí Minh chúc mừng các thí sinh đã đủ điều kiện tham gia Chương trình liên kết quốc tế năm 2023. (Danh sách đính kèm).Thời gian nhập học dự kiến: 15/09/2023. Hình thức nộp: Thí sinh có thể nộp bằng cách: - Cách 1: Nộp trực tiếp tại Văn phòng 007, Trường Đại học Mở Thành phố Hồ Chí Minh – Số 97 Võ Văn Tần, Phường Võ Thị Sáu, Quận 3, Thành phố Hồ Chí Minh. (Từ 8g00 đến 16g00 các ngày trong tuần từ thứ 2 đến thứ 6) - Cách 2: Gửi hồ sơ theo đường bưu điện về địa chỉ: Văn phòng 007, Trường Đại học Mở Thành phố Hồ Chí Minh – Số 97 Võ Văn Tần, P. Võ Thị Sáu, Quận 3, Thành phố Hồ Chí Minh. Lưu ý: Tất cả hồ sơ sinh viên nộp cho nhà Trường là bản sao y chứng thực hoặc bản photo có kèm bản chính để đối chiếu, yêu cầu thí sinh mang theo bản chính để kiểm tra, đối chiếu. Nhà Trường không nhận hồ sơ bản chính.',3),(14,'Thông báo Ngưỡng điểm nhận hồ sơ đăng ký xét tuyển Kết quả thi tốt nghiệp THPT năm 2023','THÔNG BÁO',3),(15,'THÔNG TIN TUYỂN SINH NĂM 2023 TRƯỜNG ĐẠI HỌC MỞ TP. HCM - (MÃ TRƯỜNG: MBS)','Thông tin tuyển sinh Đại học chính quy năm 2023 ',3),(16,'Thông báo về việc không tổ chức mở lớp tuyển sinh Đại học bằng thứ 2 - Liên thông Cao đẳng lên Đại học chính quy năm 2022','Căn cứ Thông tư số 08/2022/TT-BGDĐT ngày 06/6/2022 của Bộ trưởng Bộ GDĐT về việc ban hành Quy chế tuyển sinh đại học, tuyển sinh cao đẳng ngành Giáo dục Mầm non; Căn cứ Quyết định số 1793/QĐ-ĐHM ngày 12/7/2022 của Trường Đại học Mở Thành phố Hồ Chí Minh về việc ban hành Đề án tuyển sinh đại học năm 2022; Căn cứ Thông báo số 1232/TB-ĐHM ngày 13/7/2022 của Trường Đại học Mở Thành phố Hồ Chí Minh về việc tuyển sinh đào tạo trình độ đại học với đối tượng tốt nghiệp đại học (đại học bằng thứ 2), hình thức đào tạo chính quy năm 2022; Căn cứ Thông báo số 1233/TB-ĐHM ngày 13/7/2022 của Trường Đại học Mở Thành phố Hồ Chí Minh về việc tuyển sinh trình độ đại học với đối tượng tốt nghiệp cao đẳng (liên thông cao đẳng – đại học), hình thức đào tạo chính quy năm 2022; Căn cứ Kết luận của Hội đồng tuyển sinh đại học chính quy năm 2022 tại phiên họp ngày 11/10/2022. Căn cứ theo số lượng hồ sơ đăng ký xét tuyển đại học Bằng thứ 2 và Liên thông Cao đẳng – Đại học chính quy năm 2022. Trường Đại học Mở Thành phố Hồ Chí Minh thông báo không mở lớp tất cả các ngành tuyển sinh đại học bằng thứ 2 và liên thông cao đẳng – đại học (do số lượng hồ sơ đăng ký không đủ số lượng để mở lớp đào tạo). Học viên sẽ được hoàn trả hồ sơ và lệ phí xét tuyển tại phòng Quản lý đào tạo (005) - 97 Võ Văn Tần, Quận 3, TP.HCM từ ngày 17/10/2022. Học viên có thể đăng ký học chương trình Vừa làm vừa học hoặc chương trình đào tạo từ xa của Trường tại Trung tâm đào tạo từ xa. Trân trọng./.',4),(17,'Thông báo tuyển sinh trình độ đào tạo đại học với đối tượng tốt nghiệp đại học (Đại học bằng thứ 2) - hình thức đào tạo chính quy năm 2022','TẢI HỒ SƠ 01. Sơ yếu lý lịch. 02. Phiếu đăng ký học. 03. Biên nhận hồ sơ - gởi Học viên. 04. Biên nhân hồ sơ - bản Lưu.',4),(18,'Thông báo tuyển sinh đào tạo trình độ đại học với đối tượng tốt nghiệp cao đẳng - hình thức đào tạo chính quy 2022','TẢI HỒ SƠ 01. Sơ yếu lý lịch. 02. Phiếu đăng ký học. 03. Biên nhận hồ sơ - gởi Học viên. 04. Biên nhân hồ sơ - bản Lưu.',4),(19,'Thông tin các loại tài khoản Văn bằng 2, Liên thông CĐ-ĐH, Khóa 2021','- Sinh viên Thời gian đăng nhập: Bắt đầu từ ngày: 01/10/2021. Dự kiến bắt đầu thời gian học kỳ 1: 18/10/2021. Tài khoản Học viên thực hiện đăng nhập để kiểm tra hoạt động của tài khoản và thường xuyên theo dõi và sử dụng các loại tài khoản này để kịp thời cập nhật những thông tin liên quan đến học tập và thời khóa biểu',4),(20,'Thủ tục nhập học Tân sinh viên Văn bằng 2 - Liên thông Khóa 2021','HƯỚNG DẪN HỌC VIÊN TRÚNG TUYỂN',4),(21,'Thông báo về việc không tổ chức mở lớp tuyển sinh Đại học bằng thứ 2 - Liên thông Cao đẳng lên Đại học chính quy năm 2022','Căn cứ Thông tư số 08/2022/TT-BGDĐT ngày 06/6/2022 của Bộ trưởng Bộ GDĐT về việc ban hành Quy chế tuyển sinh đại học, tuyển sinh cao đẳng ngành Giáo dục Mầm non; Căn cứ Quyết định số 1793/QĐ-ĐHM ngày 12/7/2022 của Trường Đại học Mở Thành phố Hồ Chí Minh về việc ban hành Đề án tuyển sinh đại học năm 2022; Căn cứ Thông báo số 1232/TB-ĐHM ngày 13/7/2022 của Trường Đại học Mở Thành phố Hồ Chí Minh về việc tuyển sinh đào tạo trình độ đại học với đối tượng tốt nghiệp đại học (đại học bằng thứ 2), hình thức đào tạo chính quy năm 2022; Căn cứ Thông báo số 1233/TB-ĐHM ngày 13/7/2022 của Trường Đại học Mở Thành phố Hồ Chí Minh về việc tuyển sinh trình độ đại học với đối tượng tốt nghiệp cao đẳng (liên thông cao đẳng – đại học), hình thức đào tạo chính quy năm 2022; Căn cứ Kết luận của Hội đồng tuyển sinh đại học chính quy năm 2022 tại phiên họp ngày 11/10/2022. Căn cứ theo số lượng hồ sơ đăng ký xét tuyển đại học Bằng thứ 2 và Liên thông Cao đẳng – Đại học chính quy năm 2022. Trường Đại học Mở Thành phố Hồ Chí Minh thông báo không mở lớp tất cả các ngành tuyển sinh đại học bằng thứ 2 và liên thông cao đẳng – đại học (do số lượng hồ sơ đăng ký không đủ số lượng để mở lớp đào tạo). Học viên sẽ được hoàn trả hồ sơ và lệ phí xét tuyển tại phòng Quản lý đào tạo (005) - 97 Võ Văn Tần, Quận 3, TP.HCM từ ngày 17/10/2022. Học viên có thể đăng ký học chương trình Vừa làm vừa học hoặc chương trình đào tạo từ xa của Trường tại Trung tâm đào tạo từ xa. Trân trọng./.',5),(22,'Thông báo tuyển sinh trình độ đào tạo đại học với đối tượng tốt nghiệp đại học (Đại học bằng thứ 2) - hình thức đào tạo chính quy năm 2022','TẢI HỒ SƠ 01. Sơ yếu lý lịch. 02. Phiếu đăng ký học. 03. Biên nhận hồ sơ - gởi Học viên. 04. Biên nhân hồ sơ - bản Lưu.',5),(23,'Thông báo tuyển sinh đào tạo trình độ đại học với đối tượng tốt nghiệp cao đẳng - hình thức đào tạo chính quy 2022','TẢI HỒ SƠ 01. Sơ yếu lý lịch. 02. Phiếu đăng ký học. 03. Biên nhận hồ sơ - gởi Học viên. 04. Biên nhân hồ sơ - bản Lưu.',5),(24,'Thông tin các loại tài khoản Văn bằng 2, Liên thông CĐ-ĐH, Khóa 2021','- Sinh viên Thời gian đăng nhập: Bắt đầu từ ngày: 01/10/2021. Dự kiến bắt đầu thời gian học kỳ 1: 18/10/2021. Tài khoản Học viên thực hiện đăng nhập để kiểm tra hoạt động của tài khoản và thường xuyên theo dõi và sử dụng các loại tài khoản này để kịp thời cập nhật những thông tin liên quan đến học tập và thời khóa biểu',5),(25,'Thủ tục nhập học Tân sinh viên Văn bằng 2 - Liên thông Khóa 2021','HƯỚNG DẪN HỌC VIÊN TRÚNG TUYỂN',5);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(45) DEFAULT NULL,
  `livestream_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_question_livestream_idx` (`user_id`),
  KEY `fk_question_livestream_idx1` (`livestream_id`),
  CONSTRAINT `fk_question_livestream` FOREIGN KEY (`livestream_id`) REFERENCES `livestream` (`id`),
  CONSTRAINT `fk_question_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,'Nghiên cứu này làm khó không ạ?',1,2);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typeoftrainning`
--

DROP TABLE IF EXISTS `typeoftrainning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `typeoftrainning` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typeoftrainning`
--

LOCK TABLES `typeoftrainning` WRITE;
/*!40000 ALTER TABLE `typeoftrainning` DISABLE KEYS */;
INSERT INTO `typeoftrainning` VALUES (1,'Hệ chính quy'),(2,'Hệ liên thông'),(3,'Cao học'),(4,'Thạc sĩ'),(5,'Đào tạo từ xa');
/*!40000 ALTER TABLE `typeoftrainning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `user_role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Nguyễn ','Admin','adminnguyen2002@gmail.com','0987654323','admin','123',_binary '','admin'),(2,'Trần ','Hoa','hoatran2001@gmail.com','0978675453','hoatran','123',_binary '','user'),(3,'Huỳnh','Hoàng','hoanghuynh2001@gmail.com','0978675453','hoanghuynh','123',_binary '','consultant');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-24 14:17:17
