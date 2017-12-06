/*
Navicat MySQL Data Transfer

Source Server         : MyConn
Source Server Version : 50151
Source Host           : localhost:3306
Source Database       : pms

Target Server Type    : MYSQL
Target Server Version : 50151
File Encoding         : 65001

Date: 2013-04-27 09:33:23
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `dept`
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2072655DBCA2FF` (`parentId`),
  CONSTRAINT `FK2072655DBCA2FF` FOREIGN KEY (`parentId`) REFERENCES `dept` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO dept VALUES ('1', '最高部门', '顶级部门', null);
INSERT INTO dept VALUES ('2', '人事部', '刘蒙建立的部门', '1');
INSERT INTO dept VALUES ('3', '研发部', '康静建立的部门', '1');
INSERT INTO dept VALUES ('4', '财务部', '薛鑫建立的部门', '1');
INSERT INTO dept VALUES ('6', '公关部', '康静主管的部门', '2');
INSERT INTO dept VALUES ('7', 'Java研发部', '研发Java项目', '3');
INSERT INTO dept VALUES ('8', '公款吃喝部', null, '4');
INSERT INTO dept VALUES ('18', '后勤部', null, '1');
INSERT INTO dept VALUES ('22', '仓储部', null, '18');
INSERT INTO dept VALUES ('23', '新部门1', '康静建立的部门111', '3');
INSERT INTO dept VALUES ('24', 'C研发部', '康静建立的部门111', '3');
INSERT INTO dept VALUES ('26', '新部门1', '康静主管的部门', '1');
INSERT INTO dept VALUES ('27', 's', '康静主管的部门', '26');

-- ----------------------------
-- Table structure for `deptchange`
-- ----------------------------
DROP TABLE IF EXISTS `deptchange`;
CREATE TABLE `deptchange` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `approveStatus` varchar(255) DEFAULT NULL,
  `processDate` datetime DEFAULT NULL,
  `processResult` varchar(255) DEFAULT NULL,
  `empId` int(11) DEFAULT NULL,
  `formerDeptId` int(11) DEFAULT NULL,
  `latterDeptId` int(11) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `empId` (`empId`),
  KEY `FK45945275ABAF7896` (`empId`),
  KEY `FK45945275DC3FBD8B` (`formerDeptId`),
  KEY `FK45945275DC59C27C` (`latterDeptId`),
  CONSTRAINT `FK45945275ABAF7896` FOREIGN KEY (`empId`) REFERENCES `emp` (`id`),
  CONSTRAINT `FK45945275DC3FBD8B` FOREIGN KEY (`formerDeptId`) REFERENCES `dept` (`id`),
  CONSTRAINT `FK45945275DC59C27C` FOREIGN KEY (`latterDeptId`) REFERENCES `dept` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deptchange
-- ----------------------------
INSERT INTO deptchange VALUES ('13', '已审批', '2013-04-26 09:14:18', '通过', '2', '2', '4', 'fdvgdfg ');
INSERT INTO deptchange VALUES ('21', '已审批', '2013-04-26 09:53:32', '通过', '12', '22', '23', 'dfdsf');

-- ----------------------------
-- Table structure for `dimission`
-- ----------------------------
DROP TABLE IF EXISTS `dimission`;
CREATE TABLE `dimission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leaveDate` date DEFAULT NULL,
  `leaveType` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `approveStatus` varchar(255) DEFAULT NULL,
  `empId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `empId` (`empId`),
  KEY `FK3D476547ABAF7896` (`empId`),
  CONSTRAINT `FK3D476547ABAF7896` FOREIGN KEY (`empId`) REFERENCES `emp` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dimission
-- ----------------------------
INSERT INTO dimission VALUES ('13', '2013-04-22', '主动离职', 'asdasdasdasd', '已审批', '2');
INSERT INTO dimission VALUES ('14', '2013-04-25', '辞退', '不想要了,太闹心了....', '已审批', '12');

-- ----------------------------
-- Table structure for `emp`
-- ----------------------------
DROP TABLE IF EXISTS `emp`;
CREATE TABLE `emp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `diploma` varchar(255) DEFAULT NULL,
  `empStatus` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `entryType` varchar(255) DEFAULT NULL,
  `hiredate` date DEFAULT NULL,
  `idCard` varchar(255) DEFAULT NULL,
  `nation` varchar(255) DEFAULT NULL,
  `conversionDate` date DEFAULT NULL,
  `deptId` int(11) DEFAULT NULL,
  `province` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK110A8C8199DDA` (`deptId`),
  CONSTRAINT `FK110A8C8199DDA` FOREIGN KEY (`deptId`) REFERENCES `dept` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emp
-- ----------------------------
INSERT INTO emp VALUES ('1', 'admin', 'admin', null, null, '在职', null, null, '试用期入职', null, null, null, null, null, null, null);
INSERT INTO emp VALUES ('2', 'lm', 'wc', '1990-07-27', null, '在职', null, null, '试用期入职', '2013-04-02', null, null, '2013-04-10', '2', null, null);
INSERT INTO emp VALUES ('3', 'kj', 'wc', '2013-04-03', '本科', '试用期', null, null, '试用期入职', '2013-04-04', null, null, null, null, null, null);
INSERT INTO emp VALUES ('4', '刘蒙', 'wc', '1990-07-07', '本科', '在职', '15035681595', '男', '直接入职', '2013-11-11', '111', '汉族', '2013-04-25', '2', '山西', null);
INSERT INTO emp VALUES ('6', '康静', 'wc', '1990-07-07', '大专', '试用期', '110', '男', '试用期入职', '2013-11-11', '007', '蒙古族', null, '2', '北京', null);
INSERT INTO emp VALUES ('7', '薛鑫', 'wc', '2013-04-01', '本科', '试用期', '114', '女', '试用期入职', '2013-04-10', '111', '汉族', null, '8', '山西', null);
INSERT INTO emp VALUES ('8', 'wly', 'wc', '2013-04-12', '硕士', '在职', '120', '男', '直接入职', '2013-04-03', '001', '汉族', '2013-04-03', '2', '山西', null);
INSERT INTO emp VALUES ('9', '测试用', 'wc', '2013-04-02', '硕士', '试用期', '111', '男', '试用期入职', '2013-04-04', '222', '汉族', null, '8', '山西', null);
INSERT INTO emp VALUES ('10', '再试一次', 'wc', '2013-04-01', '硕士', '在职', '', '男', '试用期入职', '2013-04-02', '', '汉族', '2013-04-25', '18', '山西', null);
INSERT INTO emp VALUES ('11', '康静1', 'wc', '2013-04-01', '硕士', '在职', '119', '男', '试用期入职', '2013-04-24', '007', '汉族', '2013-04-25', '2', '山西', null);
INSERT INTO emp VALUES ('12', '薛鑫1', 'wc', '2013-04-01', '大专', '离职', '000', '男', '直接入职', '2013-04-25', '444', '少数名族', '2013-04-25', null, '山西', null);
INSERT INTO emp VALUES ('13', '薛大鑫', 'wc', '2013-04-01', '大专', '试用期', '119', '男', '试用期入职', '2013-04-30', '119', '少数名族', null, '8', '山西', null);
INSERT INTO emp VALUES ('14', '王良宇', 'wc', '2013-04-01', '硕士', '在职', '150123', '男', '试用期入职', '2013-04-03', 'asdasd', '汉族', '2013-04-25', '4', '山西', null);
INSERT INTO emp VALUES ('15', 'Boss', 'wc', '2013-04-26', '硕士', '在职', '119', '男', '直接入职', '2013-04-27', '007', '汉族', '2013-04-27', '2', '山西', null);
INSERT INTO emp VALUES ('16', '张部门', 'wc', '2013-04-17', '硕士', '在职', '110', '男', '直接入职', '2013-04-26', '110', '汉族', '2013-04-26', '2', '山西', null);
INSERT INTO emp VALUES ('17', '李人事', 'wc', '2013-04-10', '硕士', '在职', '111', '男', '直接入职', '2013-04-27', '234', '汉族', '2013-04-27', '2', '山西', null);
INSERT INTO emp VALUES ('18', '王助理', 'wc', '2013-04-25', '硕士', '在职', '999', '女', '直接入职', '2013-04-27', '221', '汉族', '2013-04-27', '4', '山西', null);
INSERT INTO emp VALUES ('19', '赵职员', 'wc', '2013-04-08', '硕士', '在职', '119', '男', '直接入职', '2013-04-24', '222', '汉族', '2013-04-24', '2', '山西', null);

-- ----------------------------
-- Table structure for `emp_role`
-- ----------------------------
DROP TABLE IF EXISTS `emp_role`;
CREATE TABLE `emp_role` (
  `empId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  KEY `FK466CED8DABAF7896` (`empId`),
  KEY `FK466CED8DE08ED9FC` (`roleId`),
  CONSTRAINT `FK466CED8DABAF7896` FOREIGN KEY (`empId`) REFERENCES `emp` (`id`),
  CONSTRAINT `FK466CED8DE08ED9FC` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emp_role
-- ----------------------------
INSERT INTO emp_role VALUES ('12', '4');
INSERT INTO emp_role VALUES ('13', '4');
INSERT INTO emp_role VALUES ('14', '6');
INSERT INTO emp_role VALUES ('15', '1');
INSERT INTO emp_role VALUES ('16', '2');
INSERT INTO emp_role VALUES ('17', '3');
INSERT INTO emp_role VALUES ('18', '6');
INSERT INTO emp_role VALUES ('19', '7');

-- ----------------------------
-- Table structure for `postgo`
-- ----------------------------
DROP TABLE IF EXISTS `postgo`;
CREATE TABLE `postgo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `requirement` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of postgo
-- ----------------------------
INSERT INTO postgo VALUES ('4', '急招实训部经理', '2013-04-11 00:00:00', '2013-04-27 00:00:00', '市巡警李', '4', '.....................', '急招实训部经理', '刘蒙');
INSERT INTO postgo VALUES ('5', '招boss', '2013-04-28 00:00:00', '2013-04-28 00:00:00', '老板', '1', '条件是...', '招boss', '薛鑫');

-- ----------------------------
-- Table structure for `privilege`
-- ----------------------------
DROP TABLE IF EXISTS `privilege`;
CREATE TABLE `privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK196D1691FBCE19A1` (`parentId`),
  CONSTRAINT `FK196D1691FBCE19A1` FOREIGN KEY (`parentId`) REFERENCES `privilege` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of privilege
-- ----------------------------
INSERT INTO privilege VALUES ('1', '系统管理', null, null);
INSERT INTO privilege VALUES ('2', '岗位管理', 'roleAction_list', '1');
INSERT INTO privilege VALUES ('3', '部门管理', 'deptAction', '1');
INSERT INTO privilege VALUES ('4', '员工管理', 'empAction_list', '1');
INSERT INTO privilege VALUES ('5', '岗位列表', 'roleAction_list', '2');
INSERT INTO privilege VALUES ('6', '岗位删除', 'roleAction_delete', '2');
INSERT INTO privilege VALUES ('7', '岗位添加', 'roleAction_add', '2');
INSERT INTO privilege VALUES ('8', '岗位修改', 'roleAction_edit', '2');
INSERT INTO privilege VALUES ('9', '部门列表', 'deptAction_list', '3');
INSERT INTO privilege VALUES ('10', '部门删除', 'deptAction_delete', '3');
INSERT INTO privilege VALUES ('11', '部门添加', 'deptAction_add', '3');
INSERT INTO privilege VALUES ('12', '部门修改', 'deptAction_edit', '3');
INSERT INTO privilege VALUES ('13', '员工列表', 'empAction_list', '4');
INSERT INTO privilege VALUES ('14', '员工添加', 'empAction_add', '4');
INSERT INTO privilege VALUES ('15', '员工初始化密码', 'empAction_initPassword', '4');
INSERT INTO privilege VALUES ('16', '试用期管理', null, null);
INSERT INTO privilege VALUES ('17', '游客来访', '', null);
INSERT INTO privilege VALUES ('18', '招聘信息', 'postGoAction_checkList2', '17');
INSERT INTO privilege VALUES ('19', '填写简历', 'page/zhaopin/resume_add.jsp', '17');
INSERT INTO privilege VALUES ('20', '招聘管理', null, null);
INSERT INTO privilege VALUES ('21', '招聘信息', 'postGoAction_checkList', '20');
INSERT INTO privilege VALUES ('22', '简历管理', 'visitorAction_visitorList', '20');
INSERT INTO privilege VALUES ('23', '试用期员工', 'probationAction_list', '16');
INSERT INTO privilege VALUES ('24', '个人中心', '', null);
INSERT INTO privilege VALUES ('25', '我的桌面', 'selfAction_getMyInfo', '24');
INSERT INTO privilege VALUES ('26', '审核部门调动', 'deptChangeAction_getAll', '24');

-- ----------------------------
-- Table structure for `probation`
-- ----------------------------
DROP TABLE IF EXISTS `probation`;
CREATE TABLE `probation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) DEFAULT NULL,
  `result` varchar(255) DEFAULT NULL,
  `processDate` datetime DEFAULT NULL,
  `probationStatus` varchar(255) DEFAULT NULL,
  `empId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `empId` (`empId`),
  KEY `FK344484A0ABAF7896` (`empId`),
  CONSTRAINT `FK344484A0ABAF7896` FOREIGN KEY (`empId`) REFERENCES `emp` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of probation
-- ----------------------------
INSERT INTO probation VALUES ('20', '光吃不做', '不予录用', '2013-04-25 00:16:14', '已处理', '9');
INSERT INTO probation VALUES ('21', 'wcwcwc', '允许入职', '2013-04-25 00:24:16', '已处理', '10');
INSERT INTO probation VALUES ('22', '表现出色', '允许入职', '2013-04-25 09:30:46', '已处理', '11');
INSERT INTO probation VALUES ('23', null, null, null, '待处理', '13');
INSERT INTO probation VALUES ('24', '表现良好 ', '允许入职', '2013-04-25 15:59:09', '已处理', '14');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO role VALUES ('1', '系统管理员', '管理部门,岗位和员工');
INSERT INTO role VALUES ('2', '部门经理', '管理部门和员工部门调动');
INSERT INTO role VALUES ('3', '人事部经理', '试用期管理和新员工入职');
INSERT INTO role VALUES ('4', '游客', '只能访问招聘信息和填写简历');
INSERT INTO role VALUES ('6', '人事部经理助理', '管理招聘信息,审核简历');
INSERT INTO role VALUES ('7', '职员', '普通员工');

-- ----------------------------
-- Table structure for `role_privilege`
-- ----------------------------
DROP TABLE IF EXISTS `role_privilege`;
CREATE TABLE `role_privilege` (
  `privilegeId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  KEY `FK45FBD628C4DAA1E8` (`privilegeId`),
  KEY `FK45FBD628E08ED9FC` (`roleId`),
  CONSTRAINT `FK45FBD628C4DAA1E8` FOREIGN KEY (`privilegeId`) REFERENCES `privilege` (`id`),
  CONSTRAINT `FK45FBD628E08ED9FC` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_privilege
-- ----------------------------
INSERT INTO role_privilege VALUES ('17', '4');
INSERT INTO role_privilege VALUES ('18', '4');
INSERT INTO role_privilege VALUES ('19', '4');
INSERT INTO role_privilege VALUES ('24', '7');
INSERT INTO role_privilege VALUES ('25', '7');
INSERT INTO role_privilege VALUES ('20', '6');
INSERT INTO role_privilege VALUES ('21', '6');
INSERT INTO role_privilege VALUES ('22', '6');
INSERT INTO role_privilege VALUES ('1', '3');
INSERT INTO role_privilege VALUES ('4', '3');
INSERT INTO role_privilege VALUES ('13', '3');
INSERT INTO role_privilege VALUES ('14', '3');
INSERT INTO role_privilege VALUES ('15', '3');
INSERT INTO role_privilege VALUES ('16', '3');
INSERT INTO role_privilege VALUES ('20', '3');
INSERT INTO role_privilege VALUES ('21', '3');
INSERT INTO role_privilege VALUES ('22', '3');
INSERT INTO role_privilege VALUES ('23', '3');
INSERT INTO role_privilege VALUES ('24', '3');
INSERT INTO role_privilege VALUES ('26', '3');
INSERT INTO role_privilege VALUES ('1', '1');
INSERT INTO role_privilege VALUES ('2', '1');
INSERT INTO role_privilege VALUES ('3', '1');
INSERT INTO role_privilege VALUES ('4', '1');
INSERT INTO role_privilege VALUES ('5', '1');
INSERT INTO role_privilege VALUES ('6', '1');
INSERT INTO role_privilege VALUES ('7', '1');
INSERT INTO role_privilege VALUES ('8', '1');
INSERT INTO role_privilege VALUES ('9', '1');
INSERT INTO role_privilege VALUES ('10', '1');
INSERT INTO role_privilege VALUES ('11', '1');
INSERT INTO role_privilege VALUES ('12', '1');
INSERT INTO role_privilege VALUES ('13', '1');
INSERT INTO role_privilege VALUES ('14', '1');
INSERT INTO role_privilege VALUES ('15', '1');
INSERT INTO role_privilege VALUES ('16', '1');
INSERT INTO role_privilege VALUES ('20', '1');
INSERT INTO role_privilege VALUES ('21', '1');
INSERT INTO role_privilege VALUES ('22', '1');
INSERT INTO role_privilege VALUES ('23', '1');
INSERT INTO role_privilege VALUES ('24', '1');
INSERT INTO role_privilege VALUES ('25', '1');
INSERT INTO role_privilege VALUES ('26', '1');
INSERT INTO role_privilege VALUES ('1', '2');
INSERT INTO role_privilege VALUES ('3', '2');
INSERT INTO role_privilege VALUES ('9', '2');
INSERT INTO role_privilege VALUES ('10', '2');
INSERT INTO role_privilege VALUES ('11', '2');
INSERT INTO role_privilege VALUES ('12', '2');

-- ----------------------------
-- Table structure for `visitor`
-- ----------------------------
DROP TABLE IF EXISTS `visitor`;
CREATE TABLE `visitor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `hometown` varchar(255) DEFAULT NULL,
  `workTime` int(11) DEFAULT NULL,
  `idCard` varchar(255) DEFAULT NULL,
  `zongJiao` varchar(255) DEFAULT NULL,
  `politics` varchar(255) DEFAULT NULL,
  `citizenship` varchar(255) DEFAULT NULL,
  `nation` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `profession` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `confirm` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `school` varchar(255) DEFAULT NULL,
  `edu` varchar(255) DEFAULT NULL,
  `career` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of visitor
-- ----------------------------
INSERT INTO visitor VALUES ('5', '刘蒙', '0', null, '', '0', '', '佛教', '团员', '中国', '汉族', '男', '', '确定', '已审核', 'upload/2.gif', '', '', '', '', '', '', '');
INSERT INTO visitor VALUES ('6', '萌神蒙神', '277', '2013-04-17 00:00:00', 'wc', '2', '111', '佛教', '团员', '中国', '汉族', '男', '', '确定', '已审核', 'upload/icon_query.gif', '赏析', '110', '030052', '110@.com', '鬼泣7', '问道90', '魔兽09');
INSERT INTO visitor VALUES ('7', '萌神蒙神', '277', '2013-04-24 00:00:00', 'wc', '2', '111', '佛教', '团员', '中国', '汉族', '男', 'ceo', null, '未审核', 'upload/1.gif', 'asdasd', '110', '030052', '110@.com', '鬼泣7', '问道90', '魔兽09');
INSERT INTO visitor VALUES ('9', '刘蒙', '12', '2013-04-08 00:00:00', '', '0', '', '佛教', '团员', '中国', '维吾尔族', '男', '', null, '未审核', 'upload/1.gif', '', '', '', '', '', '', '');
INSERT INTO visitor VALUES ('12', '火云邪神', '12', '2013-04-10 00:00:00', '河北', '10', '2342343535435', '佛教', '团员', '中国', '汉族', '男', 'boss', '确定', '已审核', 'upload/g.gif', '山西', '110', '2343243', '110@163.com', '郭德纲发的', '第三方闪光灯', '带给人让国人');
