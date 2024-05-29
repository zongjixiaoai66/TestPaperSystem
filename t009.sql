/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `t009`;
CREATE DATABASE IF NOT EXISTS `t009` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `t009`;

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='配置文件';

DELETE FROM `config`;
INSERT INTO `config` (`id`, `name`, `value`) VALUES
	(1, 'picture1', 'http://localhost:8080/ssms0i0l/upload/picture1.jpg'),
	(2, 'picture2', 'http://localhost:8080/ssms0i0l/upload/picture2.jpg'),
	(3, 'picture3', 'http://localhost:8080/ssms0i0l/upload/picture3.jpg'),
	(6, 'homepage', NULL);

DROP TABLE IF EXISTS `exampaper`;
CREATE TABLE IF NOT EXISTS `exampaper` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name` varchar(200) NOT NULL COMMENT '试卷名称',
  `time` int NOT NULL COMMENT '考试时长(分钟)',
  `status` int NOT NULL DEFAULT '0' COMMENT '试卷状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1647918412278 DEFAULT CHARSET=utf8mb3 COMMENT='试卷表';

DELETE FROM `exampaper`;
INSERT INTO `exampaper` (`id`, `addtime`, `name`, `time`, `status`) VALUES
	(1647918412277, '2022-03-22 03:06:52', '数学课程', 15, 1);

DROP TABLE IF EXISTS `examquestion`;
CREATE TABLE IF NOT EXISTS `examquestion` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `paperid` bigint NOT NULL COMMENT '所属试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `type` bigint DEFAULT '0' COMMENT '试题类型，0：单选题 1：多选题 2：判断题 3：填空题（暂不考虑多项填空）',
  `sequence` bigint DEFAULT '100' COMMENT '试题排序，值越大排越前面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1647921474046 DEFAULT CHARSET=utf8mb3 COMMENT='试题表';

DELETE FROM `examquestion`;
INSERT INTO `examquestion` (`id`, `addtime`, `paperid`, `papername`, `questionname`, `options`, `score`, `answer`, `analysis`, `type`, `sequence`) VALUES
	(1647921324919, '2022-03-22 03:55:24', 1647918412277, '数学课程', '100 * 199 = ?', '[]', 10, '19900', '乘法', 3, 1),
	(1647921375232, '2022-03-22 03:56:15', 1647918412277, '数学课程', '33 * 10 = ？', '[{"text":"A.1","code":"A"},{"text":"B.2","code":"B"},{"text":"C.3","code":"C"},{"text":"D.330","code":"D"}]', 11, 'D', '无', 0, 2),
	(1647921425169, '2022-03-22 03:57:04', 1647918412277, '数学课程', '大于10的数？', '[{"text":"A.1","code":"A"},{"text":"B.3","code":"B"},{"text":"C.4","code":"C"},{"text":"D.11","code":"D"}]', 11, 'D', '无', 1, 4),
	(1647921474045, '2022-03-22 03:57:53', 1647918412277, '数学课程', '11 - 11', '[{"text":"A.对","code":"A"},{"text":"B.错","code":"B"}]', 11, 'A', '无', 2, 4);

DROP TABLE IF EXISTS `examrecord`;
CREATE TABLE IF NOT EXISTS `examrecord` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `paperid` bigint NOT NULL COMMENT '试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionid` bigint NOT NULL COMMENT '试题id（外键）',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `myscore` bigint NOT NULL DEFAULT '0' COMMENT '试题得分',
  `myanswer` varchar(200) DEFAULT NULL COMMENT '考生答案',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1702386357362 DEFAULT CHARSET=utf8mb3 COMMENT='考试记录表';

DELETE FROM `examrecord`;
INSERT INTO `examrecord` (`id`, `addtime`, `userid`, `username`, `paperid`, `papername`, `questionid`, `questionname`, `options`, `score`, `answer`, `analysis`, `myscore`, `myanswer`) VALUES
	(1616316250090, '2021-03-21 08:44:09', 1616315867511, NULL, 1616316031301, 'java课程设计', 1616316104798, 'java是什么语言', '[{"text":"A.高级语言","code":"A"},{"text":"B.低级语言","code":"B"},{"text":"C.程序语言","code":"C"},{"text":"D.外国语言","code":"D"}]', 5, 'A', 'java是高级语言', 5, 'A'),
	(1616316259374, '2021-03-21 08:44:18', 1616315867511, NULL, 1616316031301, 'java课程设计', 1616316137994, 'java是什么，请详细说明', '[]', 20, 'java就是...', 'java是是是', 0, 'fff'),
	(1616316262591, '2021-03-21 08:44:22', 1616315867511, NULL, 1616316031301, 'java课程设计', 1616316212867, 'java怎么了', '[{"text":"A.对","code":"A"},{"text":"B.错","code":"B"}]', 5, 'A', 'jva手术室', 5, 'A'),
	(1616316268815, '2021-03-21 08:44:28', 1616315867511, NULL, 1616316031301, 'java课程设计', 1616316184668, 'java事实上', '[{"text":"A.22","code":"A"},{"text":"B.54","code":"B"},{"text":"C.cd","code":"C"},{"text":"D.1的","code":"D"}]', 10, 'A,C', 'java是', 10, 'A,C'),
	(1702386352688, '2023-12-12 13:05:51', 1647921197255, NULL, 1647918412277, '数学课程', 1647921324919, '100 * 199 = ?', '[]', 10, '19900', '乘法', 10, '19900'),
	(1702386357361, '2023-12-12 13:05:56', 1647921197255, NULL, 1647918412277, '数学课程', 1647921375232, '33 * 10 = ？', '[{"text":"A.1","code":"A"},{"text":"B.2","code":"B"},{"text":"C.3","code":"C"},{"text":"D.330","code":"D"}]', 11, 'D', '无', 11, 'D');

DROP TABLE IF EXISTS `laoshi`;
CREATE TABLE IF NOT EXISTS `laoshi` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `laoshizhanghao` varchar(200) NOT NULL COMMENT '老师账号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `laoshixingming` varchar(200) NOT NULL COMMENT '老师姓名',
  `chushengriqi` date DEFAULT NULL COMMENT '出生日期',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `laoshishouji` varchar(200) DEFAULT NULL COMMENT '老师手机',
  `laoshiyouxiang` varchar(200) DEFAULT NULL COMMENT '老师邮箱',
  `zhaopian` varchar(200) DEFAULT NULL COMMENT '照片',
  PRIMARY KEY (`id`),
  UNIQUE KEY `laoshizhanghao` (`laoshizhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=1647921644161 DEFAULT CHARSET=utf8mb3 COMMENT='老师';

DELETE FROM `laoshi`;
INSERT INTO `laoshi` (`id`, `addtime`, `laoshizhanghao`, `mima`, `laoshixingming`, `chushengriqi`, `xingbie`, `laoshishouji`, `laoshiyouxiang`, `zhaopian`) VALUES
	(1647921249230, '2022-03-22 03:54:09', '20000', '123456', '111', '1997-03-03', '女', '18912121211', '1212@qq.com', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png'),
	(1647921644160, '2022-03-22 04:00:44', '20002', '123456', '20002', NULL, NULL, '18271832111', '11@qq.com', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png');

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `introduction` longtext COMMENT '简介',
  `picture` varchar(200) NOT NULL COMMENT '图片',
  `content` longtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1647921502673 DEFAULT CHARSET=utf8mb3 COMMENT='公告通知';

DELETE FROM `news`;
INSERT INTO `news` (`id`, `addtime`, `title`, `introduction`, `picture`, `content`) VALUES
	(1647921502672, '2022-03-22 03:58:22', '数学准备考试', '111', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png', '<p>11<img src="https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png"></p>');

DROP TABLE IF EXISTS `token`;
CREATE TABLE IF NOT EXISTS `token` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COMMENT='token表';

DELETE FROM `token`;
INSERT INTO `token` (`id`, `userid`, `username`, `tablename`, `role`, `token`, `addtime`, `expiratedtime`) VALUES
	(1, 1, 'abo', 'users', '管理员', 'lqerjokuiur1sfaxbsjed1tra074hvij', '2021-03-21 08:37:12', '2023-12-12 14:04:39'),
	(2, 1616315919930, '21', 'laoshi', '管理员', 'pdegxdykn9ovjhnnd0hz2c97al106lni', '2021-03-21 08:40:01', '2021-03-21 09:40:02'),
	(3, 1616315867511, '12', 'xuesheng', '学生', '7j22odd7nrydmo9d7gdj6y5w883l0cjq', '2021-03-21 08:43:51', '2021-03-21 09:43:51'),
	(4, 1647920226017, '10000', 'xuesheng', '学生', '10pllpx510hn5sm5nz7j5f1jqmg0mbr3', '2022-03-22 03:37:14', '2022-03-22 04:37:15'),
	(5, 1647921197255, '10001', 'xuesheng', '学生', 'dlbvqlhor563ex5vrb80epoppt4y9wuk', '2022-03-22 03:58:46', '2023-12-12 14:05:32'),
	(6, 1647921249230, '20000', 'laoshi', '管理员', '2tcow03dt0ui4cdka0uxg1q7wg0xrajd', '2022-03-22 03:59:47', '2023-12-12 14:06:21'),
	(7, 1647921617075, '10002', 'xuesheng', '学生', 'w2ieio75tgdk2fc4eg58bl141mva4eim', '2022-03-22 04:00:25', '2022-03-22 05:00:25'),
	(8, 1647921644160, '20002', 'laoshi', '管理员', 'ca4yydmmiem0dbhqky65mq9zipthxglj', '2022-03-22 04:00:50', '2022-03-22 05:00:51');

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='用户表';

DELETE FROM `users`;
INSERT INTO `users` (`id`, `username`, `password`, `role`, `addtime`) VALUES
	(1, 'admin', '123456', '管理员', '2021-03-21 08:35:06');

DROP TABLE IF EXISTS `xuesheng`;
CREATE TABLE IF NOT EXISTS `xuesheng` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xuehao` varchar(200) NOT NULL COMMENT '学号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `xingming` varchar(200) NOT NULL COMMENT '姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `chushengriqi` date DEFAULT NULL COMMENT '出生日期',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  `youxiang` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `zhaopian` varchar(200) DEFAULT NULL COMMENT '照片',
  PRIMARY KEY (`id`),
  UNIQUE KEY `xuehao` (`xuehao`)
) ENGINE=InnoDB AUTO_INCREMENT=1647921617076 DEFAULT CHARSET=utf8mb3 COMMENT='学生';

DELETE FROM `xuesheng`;
INSERT INTO `xuesheng` (`id`, `addtime`, `xuehao`, `mima`, `xingming`, `xingbie`, `chushengriqi`, `shouji`, `youxiang`, `zhaopian`) VALUES
	(1647921197255, '2022-03-22 03:53:17', '10001', '123456', '张三', '男', '1989-12-16', '16718919211', '10961232938@qq.com', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png'),
	(1647921617075, '2022-03-22 04:00:17', '10002', '123456', '10002', NULL, NULL, '18161718188', '22@qq.com', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
