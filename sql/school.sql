/*
 Navicat Premium Data Transfer

 Source Server         : nongda
 Source Server Type    : MySQL
 Source Server Version : 50162
 Source Host           : localhost:3306
 Source Schema         : school

 Target Server Type    : MySQL
 Target Server Version : 50162
 File Encoding         : 65001

 Date: 27/04/2020 15:15:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for department_review
-- ----------------------------
DROP TABLE IF EXISTS `department_review`;
CREATE TABLE `department_review`  (
  `priority` int(255) UNSIGNED NOT NULL AUTO_INCREMENT,
  `no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rolelevel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `review` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` date NOT NULL,
  PRIMARY KEY (`priority`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of department_review
-- ----------------------------
INSERT INTO `department_review` VALUES (1, 'S19161001', '女', '同学', '系部工作做得很到位，作为学生我们很有幸能在这样的系里过完我们的大学时光。', '2019-08-20');
INSERT INTO `department_review` VALUES (2, 'S19161002', '男', '同学', '每天都会检查我们出勤情况，大家积极性都很高，这样学习才能进步。', '2019-08-23');
INSERT INTO `department_review` VALUES (3, 'S19163003', '女', '同学', '系里什么时候能管理一下选课时间段的教务处，我和室友都挤不进去啊，等挤进去自己想要的课就没了，难受。', '2019-08-27');
INSERT INTO `department_review` VALUES (5, 'T19100002', '女', '教师', '管理严格十分有必要，调动学生和老师的积极性，才能为系里坐出成绩，支持支持！', '2019-09-28');
INSERT INTO `department_review` VALUES (6, 'S19164003', '女', '同学', '系学生会将于2020年5月18日下午15时进行寝室卫生大检查，希望大家积极配合。', '2019-10-14');
INSERT INTO `department_review` VALUES (7, 'S19162002', '男', '同学', '同吐槽网课问题，教务处真的是太挤了，希望系部协商，把选课时间错开。', '2019-11-15');
INSERT INTO `department_review` VALUES (8, 'S19163002', '女', '同学', '临近毕业，大四的没有课程，出去实习系里很支持，我室友就去了，既能增长见识，又能节省开销，简直nice！', '2019-12-20');
INSERT INTO `department_review` VALUES (9, 'T19070001', '男', '教师', '关于系部的管理制度，虽然有的同学不是很支持，但真真实实是有效的，希望大家克制一下，养成一个良好的学习习惯对大家以后的学习工作都是受益匪浅的。', '2019-12-31');
INSERT INTO `department_review` VALUES (10, 'S19165002', '女', '同学', '希望系里多组织集体活动和竞赛，对于组织者和参与者都是一种锻炼，以后找工作正需要这种组织力和凝聚力。', '2020-03-14');
INSERT INTO `department_review` VALUES (11, 'S19166002', '男', '同学', '希望系里能多优化优化微信小程序，除了查成绩课表还可以加一下其他功能。', '2020-04-01');
INSERT INTO `department_review` VALUES (15, 'admin', '官方', '系统管理员', '经过系里技术人员不眠不休的努力，系统并发能力已经大大提升。同时，各院之间也开始实行了分批选课，稍后会宣布每个院分配的时间段，希望大家都选到自己满意的课程。', '2020-04-08');

-- ----------------------------
-- Table structure for students
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students`  (
  `no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int(4) UNSIGNED NULL DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stuclass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dormitory` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cscore` int(4) UNSIGNED NULL DEFAULT NULL,
  `osscore` int(4) UNSIGNED NULL DEFAULT NULL,
  `ciscore` int(4) UNSIGNED NULL DEFAULT NULL,
  `sescore` int(4) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES ('S19161001', '赵敏', 22, '女', '微机1601', '北一610', 90, 88, 85, 70);
INSERT INTO `students` VALUES ('S19161002', '张无忌', 23, '男', '微机1601', '北二610', 77, 79, 65, 83);
INSERT INTO `students` VALUES ('S19161003', '杨逍', 23, '男', '微机1601', '北二610', 82, 64, 71, 68);
INSERT INTO `students` VALUES ('S19161004', '周芷若', 21, '女', '微机1601', '北一610', 70, 71, 70, 77);
INSERT INTO `students` VALUES ('S19161005', '张三丰', 24, '男', '微机1601', '北二610', 80, 55, 68, 80);
INSERT INTO `students` VALUES ('S19162001', '姜子牙', 24, '男', '微机1602', '北二616', 72, 38, 62, 66);
INSERT INTO `students` VALUES ('S19162002', '申公豹', 23, '男', '微机1602', '北二616', 68, 71, 80, 69);
INSERT INTO `students` VALUES ('S19162003', '赵公明', 24, '男', '微机1602', '北二616', 61, 67, 77, 72);
INSERT INTO `students` VALUES ('S19162004', '苏妲己', 22, '女', '微机1602', '北一616', 60, 60, 60, 60);
INSERT INTO `students` VALUES ('S19162005', '土行孙', 22, '男', '微机1602', '北二616', 60, 54, 76, 46);
INSERT INTO `students` VALUES ('S19163001', '贾宝玉', 22, '男', '微机1603', '北二622', 38, 59, 42, 48);
INSERT INTO `students` VALUES ('S19163002', '林黛玉', 21, '女', '微机1603', '北一622', 100, 98, 93, 99);
INSERT INTO `students` VALUES ('S19163003', '贾迎春', 21, '女', '微机1603', '北一622', 87, 78, 75, 84);
INSERT INTO `students` VALUES ('S19163004', '贾探春', 21, '女', '微机1603', '北一622', 71, 76, 74, 70);
INSERT INTO `students` VALUES ('S19163005', '贾惜春', 21, '女', '微机1603', '北一622', 62, 50, 40, 74);
INSERT INTO `students` VALUES ('S19164001', '宋江', 22, '男', '微机1604', '北二628', 70, 61, 53, 74);
INSERT INTO `students` VALUES ('S19164002', '鲁智深', 23, '男', '微机1604', '北二628', 68, 69, 66, 54);
INSERT INTO `students` VALUES ('S19164003', '孙二娘', 22, '女', '微机1604', '北一628', 52, 60, 60, 71);
INSERT INTO `students` VALUES ('S19164004', '武松', 24, '男', '微机1604', '北二628', 93, 98, 91, 87);
INSERT INTO `students` VALUES ('S19164005', '林冲', 23, '男', '微机1604', '北二628', 73, 76, 73, 60);
INSERT INTO `students` VALUES ('S19165001', '刘备', 23, '男', '微机1605', '北二634', 38, 26, 40, 55);
INSERT INTO `students` VALUES ('S19165002', '孙尚香', 22, '女', '微机1605', '北一634', 66, 63, 69, 70);
INSERT INTO `students` VALUES ('S19165003', '诸葛亮', 24, '男', '微机1605', '北二634', 60, 50, 71, 62);
INSERT INTO `students` VALUES ('S19165004', '黄月英', 23, '女', '微机1605', '北一634', 82, 80, 77, 81);
INSERT INTO `students` VALUES ('S19165005', '赵子龙', 21, '男', '微机1605', '北二634', 92, 90, 90, 88);
INSERT INTO `students` VALUES ('S19166001', '唐玄奘', 22, '男', '微机1606', '北二640', 80, 70, 71, 60);
INSERT INTO `students` VALUES ('S19166002', '孙悟空', 22, '男', '微机1606', '北二640', 99, 80, 73, 60);
INSERT INTO `students` VALUES ('S19166003', '白骨精', 21, '女', '微机1606', '北一640', 79, 78, 71, 68);
INSERT INTO `students` VALUES ('S19166004', '嫦娥', 23, '女', '微机1606', '北一640', 46, 52, 60, 60);
INSERT INTO `students` VALUES ('S19166005', '哪吒', 22, '男', '微机1606', '北二640', 70, 65, 60, 42);

-- ----------------------------
-- Table structure for teachclass
-- ----------------------------
DROP TABLE IF EXISTS `teachclass`;
CREATE TABLE `teachclass`  (
  `no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teaclass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`no`, `teaclass`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of teachclass
-- ----------------------------
INSERT INTO `teachclass` VALUES ('T19070001', '微机1601');
INSERT INTO `teachclass` VALUES ('T19070001', '微机1602');
INSERT INTO `teachclass` VALUES ('T19070001', '微机1603');
INSERT INTO `teachclass` VALUES ('T19070002', '微机1604');
INSERT INTO `teachclass` VALUES ('T19070002', '微机1605');
INSERT INTO `teachclass` VALUES ('T19070002', '微机1606');
INSERT INTO `teachclass` VALUES ('T19080001', '微机1601');
INSERT INTO `teachclass` VALUES ('T19080001', '微机1602');
INSERT INTO `teachclass` VALUES ('T19080001', '微机1603');
INSERT INTO `teachclass` VALUES ('T19080002', '微机1604');
INSERT INTO `teachclass` VALUES ('T19080002', '微机1605');
INSERT INTO `teachclass` VALUES ('T19080002', '微机1606');
INSERT INTO `teachclass` VALUES ('T19090001', '微机1601');
INSERT INTO `teachclass` VALUES ('T19090001', '微机1602');
INSERT INTO `teachclass` VALUES ('T19090001', '微机1603');
INSERT INTO `teachclass` VALUES ('T19090002', '微机1604');
INSERT INTO `teachclass` VALUES ('T19090002', '微机1605');
INSERT INTO `teachclass` VALUES ('T19090002', '微机1606');
INSERT INTO `teachclass` VALUES ('T19100001', '微机1601');
INSERT INTO `teachclass` VALUES ('T19100001', '微机1602');
INSERT INTO `teachclass` VALUES ('T19100001', '微机1603');
INSERT INTO `teachclass` VALUES ('T19100002', '微机1604');
INSERT INTO `teachclass` VALUES ('T19100002', '微机1605');
INSERT INTO `teachclass` VALUES ('T19100002', '微机1606');

-- ----------------------------
-- Table structure for teachers
-- ----------------------------
DROP TABLE IF EXISTS `teachers`;
CREATE TABLE `teachers`  (
  `no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int(4) UNSIGNED NULL DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `clata` int(4) UNSIGNED NOT NULL DEFAULT 0,
  `clatb` int(4) UNSIGNED NOT NULL DEFAULT 0,
  `clatc` int(4) UNSIGNED NOT NULL DEFAULT 0,
  `temea` int(4) UNSIGNED NOT NULL DEFAULT 0,
  `temeb` int(4) UNSIGNED NOT NULL DEFAULT 0,
  `temec` int(4) UNSIGNED NOT NULL DEFAULT 0,
  `wocoa` int(4) UNSIGNED NOT NULL DEFAULT 0,
  `wocob` int(4) UNSIGNED NOT NULL DEFAULT 0,
  `wococ` int(4) UNSIGNED NOT NULL DEFAULT 0,
  `qaata` int(4) UNSIGNED NOT NULL DEFAULT 0,
  `qaatb` int(4) UNSIGNED NOT NULL DEFAULT 0,
  `qaatc` int(4) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of teachers
-- ----------------------------
INSERT INTO `teachers` VALUES ('T19070001', '李白', 42, '男', '软件工程', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `teachers` VALUES ('T19070002', '杜甫', 42, '男', '软件工程', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `teachers` VALUES ('T19080001', '白居易', 41, '男', '计算机网络', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `teachers` VALUES ('T19080002', '李商隐', 41, '男', '计算机网络', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `teachers` VALUES ('T19090001', '李清照', 40, '女', '操作系统', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `teachers` VALUES ('T19090002', '辛弃疾', 40, '男', '操作系统', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `teachers` VALUES ('T19100001', '苏轼', 39, '男', 'C程序设计', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `teachers` VALUES ('T19100002', '上官婉儿', 39, '女', 'C程序设计', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rolelevel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('admin', 'admin', '系统管理员');
INSERT INTO `users` VALUES ('S19161001', 'S19161001', '学生');
INSERT INTO `users` VALUES ('S19161002', 'S19161002', '学生');
INSERT INTO `users` VALUES ('S19161003', 'S19161003', '学生');
INSERT INTO `users` VALUES ('S19161004', 'S19161004', '学生');
INSERT INTO `users` VALUES ('S19161005', 'S19161005', '学生');
INSERT INTO `users` VALUES ('S19162001', 'S19162001', '学生');
INSERT INTO `users` VALUES ('S19162002', 'S19162002', '学生');
INSERT INTO `users` VALUES ('S19162003', 'S19162003', '学生');
INSERT INTO `users` VALUES ('S19162004', 'S19162004', '学生');
INSERT INTO `users` VALUES ('S19162005', 'S19162005', '学生');
INSERT INTO `users` VALUES ('S19163001', 'S19163001', '学生');
INSERT INTO `users` VALUES ('S19163002', 'S19163002', '学生');
INSERT INTO `users` VALUES ('S19163003', 'S19163003', '学生');
INSERT INTO `users` VALUES ('S19163004', 'S19163004', '学生');
INSERT INTO `users` VALUES ('S19163005', 'S19163005', '学生');
INSERT INTO `users` VALUES ('S19164001', 'S19164001', '学生');
INSERT INTO `users` VALUES ('S19164002', 'S19164002', '学生');
INSERT INTO `users` VALUES ('S19164003', 'S19164003', '学生');
INSERT INTO `users` VALUES ('S19164004', 'S19164004', '学生');
INSERT INTO `users` VALUES ('S19164005', 'S19164005', '学生');
INSERT INTO `users` VALUES ('S19165001', 'S19165001', '学生');
INSERT INTO `users` VALUES ('S19165002', 'S19165002', '学生');
INSERT INTO `users` VALUES ('S19165003', 'S19165003', '学生');
INSERT INTO `users` VALUES ('S19165004', 'S19165004', '学生');
INSERT INTO `users` VALUES ('S19165005', 'S19165005', '学生');
INSERT INTO `users` VALUES ('S19166001', 'S19166001', '学生');
INSERT INTO `users` VALUES ('S19166002', 'S19166002', '学生');
INSERT INTO `users` VALUES ('S19166003', 'S19166003', '学生');
INSERT INTO `users` VALUES ('S19166004', 'S19166004', '学生');
INSERT INTO `users` VALUES ('S19166005', 'S19166005', '学生');
INSERT INTO `users` VALUES ('T19070001', 'T19070001', '教师');
INSERT INTO `users` VALUES ('T19070002', 'T19070002', '教师');
INSERT INTO `users` VALUES ('T19080001', 'T19080001', '教师');
INSERT INTO `users` VALUES ('T19080002', 'T19080002', '教师');
INSERT INTO `users` VALUES ('T19090001', 'T19090001', '教师');
INSERT INTO `users` VALUES ('T19090002', 'T19090002', '教师');
INSERT INTO `users` VALUES ('T19100001', 'T19100001', '教师');
INSERT INTO `users` VALUES ('T19100002', 'T19100002', '教师');

SET FOREIGN_KEY_CHECKS = 1;
