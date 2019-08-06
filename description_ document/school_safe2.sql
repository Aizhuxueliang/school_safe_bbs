/*
 Navicat Premium Data Transfer

 Source Server         : mysql_54
 Source Server Type    : MySQL
 Source Server Version : 50527
 Source Host           : 39.105.54.45:3306
 Source Schema         : ssm

 Target Server Type    : MySQL
 Target Server Version : 50527
 File Encoding         : 65001

 Date: 05/08/2019 16:46:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Login` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '111111', 1);
INSERT INTO `admin` VALUES (3, 'xiaozhang', '111111', 4);
INSERT INTO `admin` VALUES (6, 'jiaoshi', '111111', 3);

-- ----------------------------
-- Table structure for bao
-- ----------------------------
DROP TABLE IF EXISTS `bao`;
CREATE TABLE `bao`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `grade` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `admin_id` int(11) NULL DEFAULT NULL,
  `intime` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_id`(`admin_id`) USING BTREE,
  CONSTRAINT `bao_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of bao
-- ----------------------------
INSERT INTO `bao` VALUES (11, '教学设备安全', '差', 'cdsrf', 3, '2019-05-01');
INSERT INTO `bao` VALUES (12, '饮食安全检查', '好', 'r45tv', 3, '2019-05-01');
INSERT INTO `bao` VALUES (13, '我也不知道干啥', '好', 'xsscxscscscs', 3, '2019-05-01');
INSERT INTO `bao` VALUES (14, '图书馆安全', '一般', '注意防火防盗', 3, '2019-05-03');
INSERT INTO `bao` VALUES (15, '教室安全检查', '一般', '部分的股份', 3, '2019-05-01');

-- ----------------------------
-- Table structure for board
-- ----------------------------
DROP TABLE IF EXISTS `board`;
CREATE TABLE `board`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `intime` date NULL DEFAULT NULL,
  `answer` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `client_id`(`client_id`) USING BTREE,
  CONSTRAINT `board_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of board
-- ----------------------------
INSERT INTO `board` VALUES (3, 39, '学校消防通道经常赌塞', '一些来探孩子的家长总喜欢把车停在消防通道，希望管理！', '2019-04-23', '');

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES (39, 'test', '111111', '男', '15947554410', '赤峰市', 'zhu@03.com');
INSERT INTO `client` VALUES (40, 'test001', '111111', '男', '15951447844', '南京', '1@1.com');
INSERT INTO `client` VALUES (41, 'zhuxueliang', '111111', '女', '15147362138', '呼和浩特市', '3299246873@qq.com');
INSERT INTO `client` VALUES (42, 'user', '111111', '男', '15147362138', '内蒙古工业大学', '3299246873@qq.com');
INSERT INTO `client` VALUES (43, 'test2', '123456', '男', '12345678910', '呼和浩特', '3299246873@qq.com');

-- ----------------------------
-- Table structure for connection
-- ----------------------------
DROP TABLE IF EXISTS `connection`;
CREATE TABLE `connection`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `News_ID` int(11) NULL DEFAULT NULL,
  `Client_ID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `News_ID`(`News_ID`) USING BTREE,
  INDEX `Client_ID`(`Client_ID`) USING BTREE,
  CONSTRAINT `connection_ibfk_1` FOREIGN KEY (`News_ID`) REFERENCES `news` (`ID`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `connection_ibfk_2` FOREIGN KEY (`Client_ID`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of connection
-- ----------------------------
INSERT INTO `connection` VALUES (1, 37, 39);

-- ----------------------------
-- Table structure for introduce
-- ----------------------------
DROP TABLE IF EXISTS `introduce`;
CREATE TABLE `introduce`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of introduce
-- ----------------------------
INSERT INTO `introduce` VALUES (1, '简介', '<p><span>校园安全与在校师生、学生家长和社会有着切身的关系。近年，高校校园安全事件时有发生，使一些学生和教师遭受了不同程度的伤害，校园安全问题不可忽视。找出安全问题出在哪，并有针对性地加以解决，成为促进高校安全管理工作开展，打造和谐、稳定校园环境，保证高校教学、科研有序进行的有效条件。</span></p>');
INSERT INTO `introduce` VALUES (2, '联系我们', '<div class=\"contact-us\"> <h1><br></h1> <p>火警电话：119</p><p>医院救护：120</p><p>校园安全保障处：12345678910</p><p>地址：内蒙古工业大学（金川校区）</p></div>');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `Hot` int(11) NULL DEFAULT NULL,
  `InTime` datetime NULL DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NewsType_ID` int(11) NULL DEFAULT NULL,
  `zan` int(11) NULL DEFAULT NULL,
  `src` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Client_ID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `NewsType_ID`(`NewsType_ID`) USING BTREE,
  INDEX `Client_ID`(`Client_ID`) USING BTREE,
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`NewsType_ID`) REFERENCES `newstype` (`ID`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `news_ibfk_2` FOREIGN KEY (`Client_ID`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (34, '学校作业涉黄', '<p><span>今天上午</span><span>11</span><span>时许，浦东新区教育局将一份《上海市民办中芯学校关于学生寒假作业问题的情况说明》传至佰佰安全网，其中，涉事学校已对所犯错误做了初步自查自纠。这份源于上海市民办中芯学校的情况说明中写道，</span><span>1</span><span>月</span><span>16</span><span>日，学校接到中文部八年级学生反映，所发英语寒假作业存在不健康内容。学校高度重视，立即采取措施，责令教务处立即对所发寒假作业进行紧急收回。</span></p><p><span><img src=\"/school_safe2/file/7/04ca2849-8af6-4fab-9399-99c5acd5528e.jpg\" alt=\"04ca2849-8af6-4fab-9399-99c5acd5528e.jpg\"><br></span></p>', 56, '2019-05-11 20:43:14', 'images/no.jpg', 1, 0, '已处理', 39);
INSERT INTO `news` VALUES (35, '女生在厕所被扇耳光踢打', '<p><span>针对热传的</span><span>“一中学女生在厕所被多人扇耳光、踢打”的视频，</span><span>1</span><span>月</span><span>17</span><span>日上午，从湖南邵阳市新宁县官方获悉，事发新宁县丰田中学，目前欺凌事件已妥善解决。新宁县丰田乡政府负责人介绍，视频中欺凌事件于</span><span>1</span><span>月</span><span>15</span><span>日，事发丰田乡的丰田中学。参与欺凌的钟某、罗某、陈某（均为未成年人）书面向被受欺凌的韦某赔礼道歉，并赔偿韦某一定的损失费；韦某原谅钟某、罗某、陈某对其伤害的行为，同时放弃追究她们相关法律责任的权力。</span></p><p><span><img src=\"/school_safe2/file/7/6c668545-bc22-463c-bfba-1687f5143529.jpg\" alt=\"6c668545-bc22-463c-bfba-1687f5143529.jpg\"><br></span></p>', 54, '2019-05-11 20:45:10', 'images/no.jpg', 5, 0, '已处理', 39);
INSERT INTO `news` VALUES (37, '学校爆发冬季传染病疫情', '<p><span style=\"text-align: justify;\">通知强调，各地教育行政部门和学校要密切关注冬季传染病疫情，加强流感等呼吸道传染病，以及以手足口病为主的肠道传染病的防控工作。要严格执行食品安全有关法律法规，认真组织开展学校食堂食品安全日常自查和定期检查，重点检查学校食堂卫生状况，及时发现食品安全管理中存在的问题，消除安全隐患。要强化制度落实，加强监督管理，坚决防止食物中毒事件的发生，确保师生健康安全。</span></p><p><span style=\"text-align: justify;\"><img src=\"/school_safe2/file/7/8708e9fa-0eaf-4b44-9813-d54f717f4faf.jpg\" alt=\"8708e9fa-0eaf-4b44-9813-d54f717f4faf.jpg\"><br></span></p>', 111, '2019-05-11 20:50:10', 'images/no.jpg', 1, 0, '未处理', 39);
INSERT INTO `news` VALUES (38, '社会车辆近期经常出现在校园内', '<p><span style=\"text-align: justify;\">通知还强调，各地教育行政部门和学校要加强学生心理健康教育工作，坚决防止因心理障碍引发自杀或伤害他人事件发生。要认真开展学生心理健康状况摸排，重点做好家庭贫困学生、学习困难学生、情感困惑学生、言行异常学生，中高考学生，留守儿童、外来务工人员子女、单亲家庭等特殊群体学生的心理辅导与咨询工作，帮助他们化解心理压力，克服心理障碍。同时，要积极开展心理健康教育宣传活动，加强生命教育，帮助学生正确认识生命、尊重生命、珍爱生命、保护生命。</span></p><p><span style=\"text-align: justify;\"><img src=\"/school_safe2/file/7/2eee56b6-b45f-4af6-81df-c0e7eb741dd2.jpg\" alt=\"2eee56b6-b45f-4af6-81df-c0e7eb741dd2.jpg\"><br></span></p><p><span style=\"text-align: justify;\"><br></span></p>', 104, '2019-05-11 20:51:42', 'images/no.jpg', 8, 0, '拒绝处理', 39);
INSERT INTO `news` VALUES (64, '三年级学生在校猝死', '<p>校园是广大学子们学习的地方，社会未来的希望亦是国家为了的栋梁。但若是这样该有多好，近几年来校园安全事故频发，不免让人愤怒与惋惜。接下来将由法律快车小编为您整理有关校园安全事故案例的资料。以供大家参考与学习。</p><p>20XX年XX月XX日下午，XX中学初三年级学生XXX在体育课练习400米跑后出现了双手支撑双膝后趴伏在地面的情况，同学们发现他的脸上磕出了血，并立即呼喊上课的体育老师并对XXX展开了心肺复苏、人工呼吸，并第一时间拨打了120电话。“心肺复苏我们一直做到120医生到达为止。”在送到医院后，2点40分左右XXX在医院曾经一度恢复了心跳和呼吸，但是下午2点55分又停止了呼吸和心跳，死因为心源性猝死。+校园是培养人才的地方，但如果连学生的安全都无法保障，谈何培养人才？通过阅读以上全文想必你已经对校园安全事故案例有了一定的了解。以上便是法律快车小编为您整理的有关校园安全事故案例。若你还有其他问题，欢迎咨询法律快车律师。</p><p><img src=\"/school_safe2/file/7/a8208bc7-6033-40ec-8535-e34a9c25e4fd.jpg\" alt=\"a8208bc7-6033-40ec-8535-e34a9c25e4fd.jpg\"><br></p>', 38, '2019-06-13 19:33:13', 'images/no.jpg', 5, 0, '已处理', 39);
INSERT INTO `news` VALUES (65, '宿舍突然没电了', '<p>上海商学院徐汇校区一学生宿舍楼发生火灾，火势迅速蔓延导致烟火过大，其中4名女生在消防队员赶到之前从6楼宿舍阳台跳楼逃生，不幸全部遇难。</p><p><img src=\"/school_safe2/file/7/46c185e6-2bb2-4b7b-9b05-caedb0ba816b.jpg\" alt=\"46c185e6-2bb2-4b7b-9b05-caedb0ba816b.jpg\"><br></p><p>火灾事故初步判断原因是，寝室里头天晚上使用“热得快”停电后没有拔下插头，第二天早晨宿舍来电后因电流过大引发热得快过热并将周围可燃物引燃所致。</p><p><img src=\"/school_safe2/file/7/3c2a4107-c5ec-4d44-9a1a-36d3b27dc9cf.jpg\" alt=\"3c2a4107-c5ec-4d44-9a1a-36d3b27dc9cf.jpg\"><br></p>', 26, '2019-06-13 19:39:18', 'images/no.jpg', 1, 0, '正在处理', 39);
INSERT INTO `news` VALUES (66, '很多学生出现腹痛、呕吐等症状', '<p>学生在校园内一小吃部吃完晚饭后，很多学生出现腹痛、呕吐等症状，随后这些学生别紧急送往盱眙各医院进行救治，记者昨天下午从救治中毒症状学生最多的盱眙县人民医院获悉，中毒的28名学生已全部出院返校上课。</p><p><img src=\"/school_safe2/file/7/1ad7f341-1d1e-42c4-b77c-8c5a633cca92.gif\" alt=\"1ad7f341-1d1e-42c4-b77c-8c5a633cca92.gif\"><br></p><p>记者在昨天的采访中获悉，中毒的28名学生全部是在该校园内无证经营的小吃部吃的炒饭、炒面等食物，而且该小吃部6日刚营业，做的第一顿饭就毒倒28名初中生。目前经医院确诊，此次中毒事件的罪魁祸首为亚硝酸盐。但目前亚硝酸盐的来源还是个迷。</p><p><br></p>', 45, '2019-06-13 19:41:30', 'images/no.jpg', 1, 0, '已处理', 39);

-- ----------------------------
-- Table structure for newstype
-- ----------------------------
DROP TABLE IF EXISTS `newstype`;
CREATE TABLE `newstype`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of newstype
-- ----------------------------
INSERT INTO `newstype` VALUES (1, '校园安全');
INSERT INTO `newstype` VALUES (3, '防火板块');
INSERT INTO `newstype` VALUES (4, '防盗板块');
INSERT INTO `newstype` VALUES (5, '活动安全');
INSERT INTO `newstype` VALUES (8, '交通安全');

-- ----------------------------
-- Table structure for pinglun
-- ----------------------------
DROP TABLE IF EXISTS `pinglun`;
CREATE TABLE `pinglun`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `News_ID` int(11) NULL DEFAULT NULL,
  `Client_ID` int(11) NULL DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `Intime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `Jin_ID`(`News_ID`) USING BTREE,
  INDEX `Client_ID`(`Client_ID`) USING BTREE,
  CONSTRAINT `pinglun_ibfk_2` FOREIGN KEY (`Client_ID`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `pinglun_ibfk_3` FOREIGN KEY (`News_ID`) REFERENCES `news` (`ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pinglun
-- ----------------------------
INSERT INTO `pinglun` VALUES (3, 37, 39, '发人人', '&nbsp;飞天狗', '2019-06-12 20:25:51');

-- ----------------------------
-- Table structure for typeconnection
-- ----------------------------
DROP TABLE IF EXISTS `typeconnection`;
CREATE TABLE `typeconnection`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NewsType_ID` int(11) NULL DEFAULT NULL,
  `Client_ID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `NewsType_ID`(`NewsType_ID`) USING BTREE,
  INDEX `Client_ID`(`Client_ID`) USING BTREE,
  CONSTRAINT `typeconnection_ibfk_1` FOREIGN KEY (`NewsType_ID`) REFERENCES `newstype` (`ID`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `typeconnection_ibfk_2` FOREIGN KEY (`Client_ID`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
