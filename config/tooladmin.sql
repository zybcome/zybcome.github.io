/*
 Navicat Premium Data Transfer

 Source Server         : zooif
 Source Server Type    : MySQL
 Source Server Version : 50562
 Source Host           : 198.13.33.140:3306
 Source Schema         : tooladmin

 Target Server Type    : MySQL
 Target Server Version : 50562
 File Encoding         : 65001

 Date: 09/11/2022 08:57:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017D9292C11878707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017D9292C11878707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017D9292C11878707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
INSERT INTO `QRTZ_LOCKS` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `QRTZ_LOCKS` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RuoyiScheduler', 'vultr.guest1667391847515', 1667955446433, 15000);
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RuoyiScheduler', 'zybcome1667955383429', 1667955451681, 15000);

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1667955390000, -1, 5, 'PAUSED', 'CRON', 1667955386000, 0, NULL, 2, '');
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1667955405000, -1, 5, 'PAUSED', 'CRON', 1667955391000, 0, NULL, 2, '');
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1667955400000, -1, 5, 'PAUSED', 'CRON', 1667955396000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'sys_analysis', '解析记录', NULL, NULL, 'SysAnalysis', 'crud', 'com.ruoyi.system', 'system', 'analysis', '解析记录', 'zybcome', '0', '/', '{\"parentMenuId\":1}', 'admin', '2022-03-11 16:09:54', '', '2022-03-11 16:11:44', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, '1', 'analysis_id', '解析ID', 'bigint(20)', 'Long', 'analysisId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-03-11 16:09:54', '', '2022-03-11 16:11:44');
INSERT INTO `gen_table_column` VALUES (2, '1', 'analysis_ip', 'ip地址', 'varchar(100)', 'String', 'analysisIp', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-03-11 16:09:54', '', '2022-03-11 16:11:44');
INSERT INTO `gen_table_column` VALUES (3, '1', 'analysis_link', '解析连接', 'varchar(100)', 'String', 'analysisLink', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-03-11 16:09:54', '', '2022-03-11 16:11:44');
INSERT INTO `gen_table_column` VALUES (4, '1', 'analysis_text', '解析文本', 'varchar(100)', 'String', 'analysisText', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-03-11 16:09:54', '', '2022-03-11 16:11:44');
INSERT INTO `gen_table_column` VALUES (5, '1', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2022-03-11 16:09:54', '', '2022-03-11 16:11:44');
INSERT INTO `gen_table_column` VALUES (6, '1', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2022-03-11 16:09:54', '', '2022-03-11 16:11:44');
INSERT INTO `gen_table_column` VALUES (7, '1', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2022-03-11 16:09:54', '', '2022-03-11 16:11:44');
INSERT INTO `gen_table_column` VALUES (8, '1', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2022-03-11 16:09:54', '', '2022-03-11 16:11:44');
INSERT INTO `gen_table_column` VALUES (9, '1', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2022-03-11 16:09:54', '', '2022-03-11 16:11:44');
INSERT INTO `gen_table_column` VALUES (10, '1', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 10, 'admin', '2022-03-11 16:09:54', '', '2022-03-11 16:11:44');

-- ----------------------------
-- Table structure for sys_analysis
-- ----------------------------
DROP TABLE IF EXISTS `sys_analysis`;
CREATE TABLE `sys_analysis`  (
  `analysis_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '解析ID',
  `analysis_ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ip地址',
  `analysis_link` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '解析连接',
  `analysis_text` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '解析文本',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`analysis_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 114 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_analysis
-- ----------------------------
INSERT INTO `sys_analysis` VALUES (1, '127.0.0.1', 'http://v26.idouyinvod.com/086bfb8ee9450c3e3d75a78c720d7982/622b180b/video/tos/cn/tos-cn-ve-15-alinc2/7eb34110bcd944169d3a741958dbf6a6/?a=1128&br=355&bt=355&cd=0%7C0%7C0%7C0&ch=0&cr=0&cs=0&cv=1&dr=0&ds=3&er=&ft=OR_LrzZZI0rQ1lTzWTh9D8FxuhsdbIwJtqY&l=2022031116355501020405304608009ABB&lr=&mime_type=video_mp4&net=0&pl=0&qs=0&rc=anZzZDo6ZjtoOjMzNGkzM0ApNjVoNTszODs0NzZnNGk0Z2cpaGRqbGRoaGRmc19oYXI0MHNqYC0tZC0wc3MvLS1hX182LmJfYzEyLzFhOmNwb2wrbStqdDo%3D&vl=&vr=', '2.02 xFh:/ 国家卫健委就返乡政策作出了最新回应：防止一刀切、防止层层加码  https://v.douyin.com/LYew7yJ/ 复制此链接，打开Dou音搜索，直接观看视频！', '0', '', '2022-03-11 16:35:55', '', NULL, NULL);
INSERT INTO `sys_analysis` VALUES (2, '127.0.0.1', 'http://v5-j.douyinvod.com/56c439c3b960152ec34e1acf9eb8f39a/622b1a1f/video/tos/cn/tos-cn-ve-15-alinc2/7eb34110bcd944169d3a741958dbf6a6/?a=1128&br=355&bt=355&cd=0%7C0%7C0%7C0&ch=0&cr=0&cs=0&cv=1&dr=0&ds=3&er=&ft=OR_LrzZZI0rQ1lTzWTh9D8FxuhsdeNwJtqY&l=2022031116444701020917416626011880&lr=&mime_type=video_mp4&net=0&pl=0&qs=0&rc=anZzZDo6ZjtoOjMzNGkzM0ApNjVoNTszODs0NzZnNGk0Z2cpaGRqbGRoaGRmc19oYXI0MHNqYC0tZC0wc3MvLS1hX182LmJfYzEyLzFhOmNwb2wrbStqdDo%3D&vl=&vr=', '2.02 xFh:/ 国家卫健委就返乡政策作出了最新回应：防止一刀切、防止层层加码  https://v.douyin.com/LYew7yJ/ 复制此链接，打开Dou音搜索，直接观看视频！', '0', '', '2022-03-11 16:44:47', '', NULL, NULL);
INSERT INTO `sys_analysis` VALUES (3, '127.0.0.1', 'http://v26.douyinvod.com/531c424eea442dd724ddb40fcab0b012/622b1e84/video/tos/cn/tos-cn-ve-15-alinc2/7eb34110bcd944169d3a741958dbf6a6/?a=1128&br=355&bt=355&cd=0%7C0%7C0%7C0&ch=0&cr=0&cs=0&cv=1&dr=0&ds=3&er=&ft=OR_LrzZZI0rQ1lTzWTh9D8Fxuhsd_6xJtqY&l=202203111703320102111692240A007FE0&lr=&mime_type=video_mp4&net=0&pl=0&qs=0&rc=anZzZDo6ZjtoOjMzNGkzM0ApNjVoNTszODs0NzZnNGk0Z2cpaGRqbGRoaGRmc19oYXI0MHNqYC0tZC0wc3MvLS1hX182LmJfYzEyLzFhOmNwb2wrbStqdDo%3D&vl=&vr=', '2.02 xFh:/ 国家卫健委就返乡政策作出了最新回应：防止一刀切、防止层层加码  https://v.douyin.com/LYew7yJ/ 复制此链接，打开Dou音搜索，直接观看视频！', '0', '', '2022-03-11 17:03:33', '', NULL, NULL);
INSERT INTO `sys_analysis` VALUES (4, '127.0.0.1', 'http://v97.douyinvod.com/fb97aaf60f270f6054d00f6d047d2d1f/622b1ea2/video/tos/cn/tos-cn-ve-15-alinc2/7eb34110bcd944169d3a741958dbf6a6/?a=1128&br=355&bt=355&cd=0%7C0%7C0%7C0&ch=0&cr=0&cs=0&cv=1&dr=0&ds=3&er=&ft=OR_LrzZZI0rQ1lTzWTh9D8Fxuhsdd.xJtqY&l=202203111704020100150202051C007AF1&lr=&mime_type=video_mp4&net=0&pl=0&qs=0&rc=anZzZDo6ZjtoOjMzNGkzM0ApNjVoNTszODs0NzZnNGk0Z2cpaGRqbGRoaGRmc19oYXI0MHNqYC0tZC0wc3MvLS1hX182LmJfYzEyLzFhOmNwb2wrbStqdDo%3D&vl=&vr=', '2.02 xFh:/ 国家卫健委就返乡政策作出了最新回应：防止一刀切、防止层层加码  https://v.douyin.com/LYew7yJ/ 复制此链接，打开Dou音搜索，直接观看视频！', '0', 'zybcome', '2022-03-11 17:04:02', '', NULL, NULL);
INSERT INTO `sys_analysis` VALUES (5, '127.0.0.1', 'http://v5-j.douyinvod.com/4601aeeb5694b731beba487d28745478/622b201d/video/tos/cn/tos-cn-ve-15-alinc2/7eb34110bcd944169d3a741958dbf6a6/?a=1128&br=355&bt=355&cd=0%7C0%7C0%7C0&ch=0&cr=0&cs=0&cv=1&dr=0&ds=3&er=&ft=OR_LrzZZI0rQ1lTzWTh9D8FxuhsdVWxJtqY&l=202203111710210102080970994D00E486&lr=&mime_type=video_mp4&net=0&pl=0&qs=0&rc=anZzZDo6ZjtoOjMzNGkzM0ApNjVoNTszODs0NzZnNGk0Z2cpaGRqbGRoaGRmc19oYXI0MHNqYC0tZC0wc3MvLS1hX182LmJfYzEyLzFhOmNwb2wrbStqdDo%3D&vl=&vr=', '2.02 xFh:/ 国家卫健委就返乡政策作出了最新回应：防止一刀切、防止层层加码  https://v.douyin.com/LYew7yJ/ 复制此链接，打开Dou音搜索，直接观看视频！', '0', 'zybcome', '2022-03-11 17:10:21', '', NULL, NULL);
INSERT INTO `sys_analysis` VALUES (6, '127.0.0.1', 'http://v97.douyinvod.com/c7b98aaf9bf80400c35e0d57439b4d22/622b2050/video/tos/cn/tos-cn-ve-15-alinc2/7eb34110bcd944169d3a741958dbf6a6/?a=1128&br=355&bt=355&cd=0%7C0%7C0%7C0&ch=0&cr=0&cs=0&cv=1&dr=0&ds=3&er=&ft=OR_LrzZZI0rQ1lTzWTh9D8FxuhsdQ-xJtqY&l=202203111711120102100680181900F52E&lr=&mime_type=video_mp4&net=0&pl=0&qs=0&rc=anZzZDo6ZjtoOjMzNGkzM0ApNjVoNTszODs0NzZnNGk0Z2cpaGRqbGRoaGRmc19oYXI0MHNqYC0tZC0wc3MvLS1hX182LmJfYzEyLzFhOmNwb2wrbStqdDo%3D&vl=&vr=', '2.02 xFh:/ 国家卫健委就返乡政策作出了最新回应：防止一刀切、防止层层加码  https://v.douyin.com/LYew7yJ/ 复制此链接，打开Dou音搜索，直接观看视频！', '0', 'zybcome', '2022-03-11 17:11:13', '', NULL, NULL);
INSERT INTO `sys_analysis` VALUES (7, '218.28.225.114', 'http://v26.douyinvod.com/234b412cad16a5c225a431bdc154420d/622ec4bd/video/tos/cn/tos-cn-ve-15-alinc2/7eb34110bcd944169d3a741958dbf6a6/?a=1128&br=355&bt=355&cd=0%7C0%7C0%7C0&ch=0&cr=0&cs=0&cv=1&dr=0&ds=3&er=&ft=YbbdSWWFBiwqka4kagD12DiOOd3w&l=2022031411293301020810513814E733CB&lr=&mime_type=video_mp4&net=0&pl=0&qs=0&rc=anZzZDo6ZjtoOjMzNGkzM0ApNjVoNTszODs0NzZnNGk0Z2cpaGRqbGRoaGRmc19oYXI0MHNqYC0tZC0wc3MvLS1hX182LmJfYzEyLzFhOmNwb2wrbStqdDo%3D&vl=&vr=', '2.02 xFh:/ 国家卫健委就返乡政策作出了最新回应：防止一刀切、防止层层加码  https://v.douyin.com/LYew7yJ/ 复制此链接，打开Dou音搜索，直接观看视频！', '0', '', '2022-03-14 11:29:34', '', NULL, NULL);
INSERT INTO `sys_analysis` VALUES (8, '218.28.225.114', 'http://v11-x.douyinvod.com/e8d488b557a990a6f5a8a0981499c5ec/622ec90c/video/tos/cn/tos-cn-ve-15-alinc2/7eb34110bcd944169d3a741958dbf6a6/?a=1128&br=355&bt=355&cd=0%7C0%7C0%7C0&ch=0&cr=0&cs=0&cv=1&dr=0&ds=3&er=&ft=YbbdSWWFBiwqka4kagD12P~OOd3w&l=202203141147560102121452313700CEF0&lr=&mime_type=video_mp4&net=0&pl=0&qs=0&rc=anZzZDo6ZjtoOjMzNGkzM0ApNjVoNTszODs0NzZnNGk0Z2cpaGRqbGRoaGRmc19oYXI0MHNqYC0tZC0wc3MvLS1hX182LmJfYzEyLzFhOmNwb2wrbStqdDo%3D&vl=&vr=', '2.02 xFh:/ 国家卫健委就返乡政策作出了最新回应：防止一刀切、防止层层加码  https://v.douyin.com/LYew7yJ/ 复制此链接，打开Dou音搜索，直接观看视频！', '0', '', '2022-03-14 11:47:57', '', NULL, NULL);
INSERT INTO `sys_analysis` VALUES (9, '218.28.225.114', 'http://v1.douyinvod.com/2629041eabf84ef6b0ad839157935d8e/622ec911/video/tos/cn/tos-cn-ve-15-alinc2/7eb34110bcd944169d3a741958dbf6a6/?a=1128&br=355&bt=355&cd=0%7C0%7C0%7C0&ch=0&cr=0&cs=0&cv=1&dr=0&ds=3&er=&ft=YbbdSWWFBiwqka4kagD12Z~OOd3w&l=202203141148010102080380664B00C704&lr=&mime_type=video_mp4&net=0&pl=0&qs=0&rc=anZzZDo6ZjtoOjMzNGkzM0ApNjVoNTszODs0NzZnNGk0Z2cpaGRqbGRoaGRmc19oYXI0MHNqYC0tZC0wc3MvLS1hX182LmJfYzEyLzFhOmNwb2wrbStqdDo%3D&vl=&vr=', '2.02 xFh:/ 国家卫健委就返乡政策作出了最新回应：防止一刀切、防止层层加码  https://v.douyin.com/LYew7yJ/ 复制此链接，打开Dou音搜索，直接观看视频！', '0', '', '2022-03-14 11:48:01', '', NULL, NULL);
INSERT INTO `sys_analysis` VALUES (10, '218.28.225.114', 'http://v3.douyinvod.com/d04623fa17127ceba9136cdd5f6bb6bd/622ec93f/video/tos/cn/tos-cn-ve-15-alinc2/7eb34110bcd944169d3a741958dbf6a6/?a=1128&br=355&bt=355&cd=0%7C0%7C0%7C0&ch=0&cr=0&cs=0&cv=1&dr=0&ds=3&er=&ft=YbbdSWWFBiwqka4kagD12oDOOd3w&l=20220314114847010212201214320075E9&lr=&mime_type=video_mp4&net=0&pl=0&qs=0&rc=anZzZDo6ZjtoOjMzNGkzM0ApNjVoNTszODs0NzZnNGk0Z2cpaGRqbGRoaGRmc19oYXI0MHNqYC0tZC0wc3MvLS1hX182LmJfYzEyLzFhOmNwb2wrbStqdDo%3D&vl=&vr=', '2.02 xFh:/ 国家卫健委就返乡政策作出了最新回应：防止一刀切、防止层层加码  https://v.douyin.com/LYew7yJ/ 复制此链接，打开Dou音搜索，直接观看视频！', '0', '', '2022-03-14 11:48:48', '', NULL, NULL);
INSERT INTO `sys_analysis` VALUES (11, '218.28.225.114', 'http://v5-i.douyinvod.com/75c2be565c9330ef570d708d13dac04c/622ec944/video/tos/cn/tos-cn-ve-15-alinc2/7eb34110bcd944169d3a741958dbf6a6/?a=1128&br=355&bt=355&cd=0%7C0%7C0%7C0&ch=0&cr=0&cs=0&cv=1&dr=0&ds=3&er=&ft=YbbdSWWFBiwqka4kagD12ADOOd3w&l=202203141148520102090950784E00BD90&lr=&mime_type=video_mp4&net=0&pl=0&qs=0&rc=anZzZDo6ZjtoOjMzNGkzM0ApNjVoNTszODs0NzZnNGk0Z2cpaGRqbGRoaGRmc19oYXI0MHNqYC0tZC0wc3MvLS1hX182LmJfYzEyLzFhOmNwb2wrbStqdDo%3D&vl=&vr=', '2.02 xFh:/ 国家卫健委就返乡政策作出了最新回应：防止一刀切、防止层层加码  https://v.douyin.com/LYew7yJ/ 复制此链接，打开Dou音搜索，直接观看视频！', '0', '', '2022-03-14 11:48:53', '', NULL, NULL);
INSERT INTO `sys_analysis` VALUES (12, '127.0.0.1', 'http://v3-ppx.ixigua.com/cdfaa9fb3e46773dc54f3a86d5cd35db/6231991e/video/tos/cn/tos-cn-ve-0076/06fa8452f3354c10b1420c64a35bd8d3/?a=1319\\u0026br=589\\u0026bt=589\\u0026cd=0%7C0%7C0%7C0\\u0026ch=0\\u0026cr=0\\u0026cs=0\\u0026cv=1\\u0026dr=6\\u0026ds=6\\u0026eid=2048\\u0026er=\\u0026ft=XEAS8qq3mbjPSzITz7V0yEwR7fuJG5BiM5\\u0026l=20220316150015010142038139160CFF11\\u0026lr=\\u0026mime_type=video_mp4\\u0026net=0\\u0026pl=0\\u0026qs=0\\u0026rc=M3ZocmQ6ZnQ6OTMzNGYzM0ApZmU1NGU0ODw8NztkZmdlaWcyMy82cjRfYzNgLS1kMWFzczE2M2BfYi1fLWI0YDBjMTI6Yw%3D%3D\\u0026vl=\\u0026vr=', 'https://h5.pipix.com/s/NkT13sx/', '0', 'superadmin', '2022-03-16 15:00:16', '', NULL, '皮皮虾');
INSERT INTO `sys_analysis` VALUES (13, '127.0.0.1', 'http://v3-ppx.ixigua.com/2caae0630e373507ed82b43df45ad5e2/6231996c/video/tos/cn/tos-cn-ve-0076/06fa8452f3354c10b1420c64a35bd8d3/?a=1319\\u0026br=589\\u0026bt=589\\u0026cd=0%7C0%7C0%7C0\\u0026ch=0\\u0026cr=0\\u0026cs=0\\u0026cv=1\\u0026dr=6\\u0026ds=6\\u0026eid=2048\\u0026er=\\u0026ft=XEAS8qq3mbjPSzITz7V0yEwR7fuPp5BiM5\\u0026l=20220316150132010141083020100D124D\\u0026lr=\\u0026mime_type=video_mp4\\u0026net=0\\u0026pl=0\\u0026qs=0\\u0026rc=M3ZocmQ6ZnQ6OTMzNGYzM0ApZmU1NGU0ODw8NztkZmdlaWcyMy82cjRfYzNgLS1kMWFzczE2M2BfYi1fLWI0YDBjMTI6Yw%3D%3D\\u0026vl=\\u0026vr=', 'https://h5.pipix.com/s/NkT13sx/', '0', 'superadmin', '2022-03-16 15:01:34', '', NULL, '皮皮虾');
INSERT INTO `sys_analysis` VALUES (14, '218.28.225.114', 'http://v3-ppx.ixigua.com/d2845a07c4c274c133b1afff23e262af/62319be3/video/tos/cn/tos-cn-ve-0076/06fa8452f3354c10b1420c64a35bd8d3/?a=1319\\u0026br=589\\u0026bt=589\\u0026cd=0%7C0%7C0%7C0\\u0026ch=0\\u0026cr=0\\u0026cs=0\\u0026cv=1\\u0026dr=6\\u0026ds=6\\u0026eid=2048\\u0026er=\\u0026ft=YGOdHWWFBiwqka4kagD125twgd3w\\u0026l=20220316151204010131135163140D5FC2\\u0026lr=\\u0026mime_type=video_mp4\\u0026net=0\\u0026pl=0\\u0026qs=0\\u0026rc=M3ZocmQ6ZnQ6OTMzNGYzM0ApZmU1NGU0ODw8NztkZmdlaWcyMy82cjRfYzNgLS1kMWFzczE2M2BfYi1fLWI0YDBjMTI6Yw%3D%3D\\u0026vl=\\u0026vr=', 'https://h5.pipix.com/s/NkT13sx/', '0', 'zybcome', '2022-03-16 15:12:05', '', NULL, '皮皮虾');
INSERT INTO `sys_analysis` VALUES (15, '127.0.0.1', 'http://v97.douyinvod.com/d37fbda7611be36814faeb7016dfc36a/62319d31/video/tos/cn/tos-cn-ve-15-alinc2/7eb34110bcd944169d3a741958dbf6a6/?a=1128&br=355&bt=355&cd=0%7C0%7C0%7C0&ch=0&cr=0&cs=0&cv=1&dr=0&ds=3&er=&ft=OR_LrzZZI0rQ1lTzWTh9D8FxuhsdUqYytqY&l=2022031615173701021206120104006764&lr=&mime_type=video_mp4&net=0&pl=0&qs=0&rc=anZzZDo6ZjtoOjMzNGkzM0ApNjVoNTszODs0NzZnNGk0Z2cpaGRqbGRoaGRmc19oYXI0MHNqYC0tZC0wc3MvLS1hX182LmJfYzEyLzFhOmNwb2wrbStqdDo%3D&vl=&vr=', '2.02 xFh:/ 国家卫健委就返乡政策作出了最新回应：防止一刀切、防止层层加码  https://v.douyin.com/LYew7yJ/ 复制此链接，打开Dou音搜索，直接观看视频！', '0', 'superadmin', '2022-03-16 15:17:38', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (16, '182.118.238.18', 'http://v6-ppx.ixigua.com/67c8d54dd224f45315354a2c35b17a68/6231a05c/video/tos/cn/tos-cn-ve-0076/06fa8452f3354c10b1420c64a35bd8d3/?a=1319\\u0026br=589\\u0026bt=589\\u0026cd=0%7C0%7C0%7C0\\u0026ch=0\\u0026cr=0\\u0026cs=0\\u0026cv=1\\u0026dr=6\\u0026ds=6\\u0026eid=2048\\u0026er=\\u0026ft=YGOdHWWFBiwqka4kagD12ybIgd3w\\u0026l=20220316153109010135173091260E7B48\\u0026lr=\\u0026mime_type=video_mp4\\u0026net=0\\u0026pl=0\\u0026qs=0\\u0026rc=M3ZocmQ6ZnQ6OTMzNGYzM0ApZmU1NGU0ODw8NztkZmdlaWcyMy82cjRfYzNgLS1kMWFzczE2M2BfYi1fLWI0YDBjMTI6Yw%3D%3D\\u0026vl=\\u0026vr=', 'https://h5.pipix.com/s/NkT13sx/', '0', 'zybcome', '2022-03-16 15:31:10', '', NULL, '皮皮虾');
INSERT INTO `sys_analysis` VALUES (17, '182.118.238.18', 'http://v6-ppx.ixigua.com/6bdb15522223421cdd1c3044f26393aa/6231a07c/video/tos/cn/tos-cn-ve-0076/06fa8452f3354c10b1420c64a35bd8d3/?a=1319\\u0026br=589\\u0026bt=589\\u0026cd=0%7C0%7C0%7C0\\u0026ch=0\\u0026cr=0\\u0026cs=0\\u0026cv=1\\u0026dr=6\\u0026ds=6\\u0026eid=2048\\u0026er=\\u0026ft=YGOdHWWFBiwqka4kagD12D5Igd3w\\u0026l=20220316153141010131038086180EC8DF\\u0026lr=\\u0026mime_type=video_mp4\\u0026net=0\\u0026pl=0\\u0026qs=0\\u0026rc=M3ZocmQ6ZnQ6OTMzNGYzM0ApZmU1NGU0ODw8NztkZmdlaWcyMy82cjRfYzNgLS1kMWFzczE2M2BfYi1fLWI0YDBjMTI6Yw%3D%3D\\u0026vl=\\u0026vr=', 'https://h5.pipix.com/s/NkT13sx/', '0', 'zybcome', '2022-03-16 15:31:41', '', NULL, '皮皮虾');
INSERT INTO `sys_analysis` VALUES (18, '127.0.0.1', 'http://v3-ppx.ixigua.com/a4d07d37e8541d85f1f69747ba7e7901/62399b38/video/tos/cn/tos-cn-ve-0076/18542cfb673a4f60afe244d719af9fa0/?a=1319\\u0026br=683\\u0026bt=683\\u0026cd=0%7C0%7C0%7C0\\u0026ch=0\\u0026cr=0\\u0026cs=0\\u0026cv=1\\u0026dr=6\\u0026ds=6\\u0026eid=2048\\u0026er=\\u0026ft=XEAS8qq3mbjPSzITz7V0yEwR7fulZ5~iM5\\u0026l=20220322164730010133044164200272C3\\u0026lr=\\u0026mime_type=video_mp4\\u0026net=0\\u0026pl=0\\u0026qs=0\\u0026rc=amV0cWg6ZnA7ODMzNGYzM0ApaTkzM2VmZWQzNzpmO2Y5Nmdwb3NlcjRnLjZgLS1kMS9zc2IzMDY2XmI2NV4vLzZeXmE6Yw%3D%3D\\u0026vl=\\u0026vr=', 'https://h5.pipix.com/s/L7sfrgy/', '0', 'zybcome', '2022-03-22 16:47:31', '', NULL, '皮皮虾');
INSERT INTO `sys_analysis` VALUES (19, '127.0.0.1', 'http://v3-ppx.ixigua.com/e912977589d26a351fe15631d9a2153b/62399b39/video/tos/cn/tos-cn-ve-0076/18542cfb673a4f60afe244d719af9fa0/?a=1319\\u0026br=683\\u0026bt=683\\u0026cd=0%7C0%7C0%7C0\\u0026ch=0\\u0026cr=0\\u0026cs=0\\u0026cv=1\\u0026dr=6\\u0026ds=6\\u0026eid=2048\\u0026er=\\u0026ft=XEAS8qq3mbjPSzITz7V0yEwR7fu1Z5~iM5\\u0026l=202203221647310101330281550A026311\\u0026lr=\\u0026mime_type=video_mp4\\u0026net=0\\u0026pl=0\\u0026qs=0\\u0026rc=amV0cWg6ZnA7ODMzNGYzM0ApaTkzM2VmZWQzNzpmO2Y5Nmdwb3NlcjRnLjZgLS1kMS9zc2IzMDY2XmI2NV4vLzZeXmE6Yw%3D%3D\\u0026vl=\\u0026vr=', 'https://h5.pipix.com/s/L7sfrgy/', '0', 'zybcome', '2022-03-22 16:47:31', '', NULL, '皮皮虾');
INSERT INTO `sys_analysis` VALUES (20, '127.0.0.1', 'http://v6-ppx.ixigua.com/87e4c4935c0cd6e832f74da872265d6c/62399b54/video/tos/cn/tos-cn-ve-0076/18542cfb673a4f60afe244d719af9fa0/?a=1319\\u0026br=683\\u0026bt=683\\u0026cd=0%7C0%7C0%7C0\\u0026ch=0\\u0026cr=0\\u0026cs=0\\u0026cv=1\\u0026dr=6\\u0026ds=6\\u0026eid=2048\\u0026er=\\u0026ft=XEAS8qq3mbjPSzITz7V0yEwR7fukZ5~iM5\\u0026l=2022032216475801013103921313026832\\u0026lr=\\u0026mime_type=video_mp4\\u0026net=0\\u0026pl=0\\u0026qs=0\\u0026rc=amV0cWg6ZnA7ODMzNGYzM0ApaTkzM2VmZWQzNzpmO2Y5Nmdwb3NlcjRnLjZgLS1kMS9zc2IzMDY2XmI2NV4vLzZeXmE6Yw%3D%3D\\u0026vl=\\u0026vr=', 'https://h5.pipix.com/s/L7sfrgy/', '0', 'zybcome', '2022-03-22 16:47:59', '', NULL, '皮皮虾');
INSERT INTO `sys_analysis` VALUES (21, '127.0.0.1', 'http://v6-ppx.ixigua.com/25fadd6208c46760fbe98255243dd240/624d50fe/video/tos/cn/tos-cn-ve-0076/06fa8452f3354c10b1420c64a35bd8d3/?a=1319\\u0026br=589\\u0026bt=589\\u0026cd=0%7C0%7C0%7C0\\u0026ch=0\\u0026cr=0\\u0026cs=0\\u0026cv=1\\u0026dr=6\\u0026ds=6\\u0026eid=2048\\u0026er=\\u0026ft=XEAS8qq3mbjPSzITz7V0yEwR7fuwt97iM5\\u0026l=202204061535590101351730871403D193\\u0026lr=\\u0026mime_type=video_mp4\\u0026net=0\\u0026pl=0\\u0026qs=0\\u0026rc=M3ZocmQ6ZnQ6OTMzNGYzM0ApZmU1NGU0ODw8NztkZmdlaWcyMy82cjRfYzNgLS1kMWFzczE2M2BfYi1fLWI0YDBjMTI6Yw%3D%3D\\u0026vl=\\u0026vr=', 'https://h5.pipix.com/s/NkT13sx/', '0', 'zybcome', '2022-04-06 15:36:00', '', NULL, '皮皮虾');
INSERT INTO `sys_analysis` VALUES (22, '127.0.0.1', 'http://v6-ppx.ixigua.com/fecf26c9ee08243ec867fc8eabbe2fda/624d5110/video/tos/cn/tos-cn-ve-0076/06fa8452f3354c10b1420c64a35bd8d3/?a=1319\\u0026br=589\\u0026bt=589\\u0026cd=0%7C0%7C0%7C0\\u0026ch=0\\u0026cr=0\\u0026cs=0\\u0026cv=1\\u0026dr=6\\u0026ds=6\\u0026eid=2048\\u0026er=\\u0026ft=XEAS8qq3mbjPSzITz7V0yEwR7fuQt97iM5\\u0026l=2022040615361701013819015309042017\\u0026lr=\\u0026mime_type=video_mp4\\u0026net=0\\u0026pl=0\\u0026qs=0\\u0026rc=M3ZocmQ6ZnQ6OTMzNGYzM0ApZmU1NGU0ODw8NztkZmdlaWcyMy82cjRfYzNgLS1kMWFzczE2M2BfYi1fLWI0YDBjMTI6Yw%3D%3D\\u0026vl=\\u0026vr=', 'https://h5.pipix.com/s/NkT13sx/', '0', 'zybcome', '2022-04-06 15:36:25', '', NULL, '皮皮虾');
INSERT INTO `sys_analysis` VALUES (23, '218.28.225.114', 'http://v6-ppx.ixigua.com/212c11083a62b05831869cd09977633c/62bd21d1/video/tos/cn/tos-cn-ve-0076/06fa8452f3354c10b1420c64a35bd8d3/?a=1319\\u0026ch=0\\u0026cr=0\\u0026dr=6\\u0026cd=0%7C0%7C0%7C0\\u0026cv=1\\u0026br=589\\u0026bt=589\\u0026cs=0\\u0026ds=6\\u0026eid=2048\\u0026ft=b_XcommnPEC2Th7ThWwUxTuQDcHC~sbcIWDIn\\u0026mime_type=video_mp4\\u0026qs=0\\u0026rc=Nzw5ZmVoM2UzaDpmNmk3OEBpM3ZocmQ6ZnQ6OTMzNGYzM0BgXy8uXy4yNjYxNV5gYV9jYSMyMy82cjRfYzNgLS1kMWFzcw%3D%3D\\u0026l=202206301108340101351730872335192D', 'https://h5.pipix.com/s/NkT13sx/', '0', 'zybcome', '2022-06-30 11:08:35', '', NULL, '皮皮虾');
INSERT INTO `sys_analysis` VALUES (24, '218.28.225.114', 'https://v5-e.douyinvod.com/2b3e03d0602fa45042d620bbb20b537f/62bd22b0/video/tos/cn/tos-cn-ve-15c001-alinc2/f9c2312fbcec4e6cbc95a2df798a77a5/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=842&bt=842&btag=80000&cs=0&ds=6&ft=raapL0071FOvWHhWH6xRZ_s2jxvXySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=ZjM6ZDc7MzhkPDQ2O2Q3NEBpanM8dGY6ZmZqZDMzNGkzM0BfXi00M2FiX2MxMi5jNjE0YSNraGxfcjQwYnJgLS1kLWFzcw%3D%3D&l=2022063011102701021001913635036018', '4.38 Wzt:/ %%星火成炬 星火成炬，当老外爱上中文！%%搞笑 %%万万没想到  https://v.douyin.com/YgQgkTF/ 复制此链接，打开Dou音搜索，直接观看视频！', '0', 'zybcome', '2022-06-30 11:10:28', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (25, '178.128.118.131', 'http://v6-ppx.ixigua.com/b6fa76f3384ec41c5a823839fcd248b5/62bd22ae/video/tos/cn/tos-cn-ve-0076/18542cfb673a4f60afe244d719af9fa0/?a=1319\\u0026ch=0\\u0026cr=0\\u0026dr=6\\u0026cd=0%7C0%7C0%7C0\\u0026cv=1\\u0026br=683\\u0026bt=683\\u0026cs=0\\u0026ds=6\\u0026eid=2048\\u0026ft=b_XcommnPEC2Th7ThWwUxddQDcHC~sbcIWDIn\\u0026mime_type=video_mp4\\u0026qs=0\\u0026rc=aDk2PDxkaDw7ZDU1PGRkZ0BpamV0cWg6ZnA7ODMzNGYzM0BjMy0tX2BfXi0xNGA1YDMwYSNwb3NlcjRnLjZgLS1kMS9zcw%3D%3D\\u0026l=202206301112240101311371010937A0FC', 'https://h5.pipix.com/s/L7sfrgy/', '0', 'zybcome', '2022-06-30 11:12:25', '', NULL, '皮皮虾');
INSERT INTO `sys_analysis` VALUES (26, '222.137.46.28', 'https://v5-g.douyinvod.com/12731782485e323ef6eb28759f778965/62ceaf7c/video/tos/cn/tos-cn-ve-15c001-alinc2/208fca27842b4383823f47166fb90e6e/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=715&bt=715&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_s2EyzXySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=aGc0ZzdlNDs3PGhlOjs8OUBpam51djY6ZjxrZDMzNGkzM0BfXi0xNF4xX2AxNmMtNS4zYSMyMXA2cjRvL2FgLS1kLWFzcw%3D%3D&l=202207131841390102061201500E0501EB', '5.61 VYz:/ 艾特全世界最可爱的人来看 # 萌宠 # 治愈# 旺仔小乔爱你 https://v.douyin.com/2Fh5fPh/ 复制此链接，打开Dou音搜索，直接观看视频！', '0', '', '2022-07-13 18:41:40', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (27, '222.137.46.28', 'https://v6.douyinvod.com/6668d1c9a0cc02dd09c54bd012372299/62ceb0ad/video/tos/cn/tos-cn-ve-15-alinc2/afc83070029c41dc86dd7923ec9ce36f/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=938&bt=938&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sB3yzXySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=OzVpNjNpPDs6OGc2NTpnOEBpajxleTo6Zmg4OjMzNGkzM0AuLjQwMTY0NS4xM2FjYjE2YSNjMDJlcjRnbl9gLS1kLTBzcw%3D%3D&l=20220713184458010208164169250584E6', '1.58 pda:/ 可爱有趣的小猫视频一# 家有萌宠 # 逗猫 # 成精的萌宠 # 治愈猫咪 https://v.douyin.com/2FkeVuP/ 复制此链接，打开Dou音搜索，直接观看视频！', '0', '', '2022-07-13 18:44:58', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (28, '222.137.46.28', 'https://v6.douyinvod.com/dfd4ba8ef347123a9f10514e19dae62a/62ceb094/video/tos/cn/tos-cn-ve-15c001-alinc2/cda07ea22cf44b09a4d5201aaf7613a2/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=2106&bt=2106&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_swryzXySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=ZmgzOzY6MzZkNzM4ODw8ZkBpMzNvZmk6ZnBzOzMzNGkzM0BfLTIuY2MxX2IxLl4wMmBfYSM2c2BocjRnam5gLS1kLS9zcw%3D%3D&l=202207131845370102080390961D05D488', '6.43 tEU:/ 可可爱爱……# 神奇动物在抖音 # 治愈 # 萌宠 https://v.douyin.com/2FhvC31/ 复制此链接，打开Dou音搜索，直接观看视频！', '0', '', '2022-07-13 18:45:38', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (29, '222.137.46.28', 'https://v26.idouyinvod.com/73c1a6858f15fb7ed20c016e717f7f80/62ceb096/video/tos/cn/tos-cn-ve-15c001-alinc2/cda07ea22cf44b09a4d5201aaf7613a2/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=2106&bt=2106&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_snryzXySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=ZmgzOzY6MzZkNzM4ODw8ZkBpMzNvZmk6ZnBzOzMzNGkzM0BfLTIuY2MxX2IxLl4wMmBfYSM2c2BocjRnam5gLS1kLS9zcw%3D%3D&l=202207131845390102120611951006A14E', '6.43 tEU:/ 可可爱爱……# 神奇动物在抖音 # 治愈 # 萌宠 https://v.douyin.com/2FhvC31/ 复制此链接，打开Dou音搜索，直接观看视频！', '0', '', '2022-07-13 18:45:40', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (30, '218.28.225.114', 'https://v26.douyinvod.com/7e915686007414fffb0eee935f7be772/62d22309/video/tos/cn/tos-cn-ve-15c001-alinc2/577323753e704bb497248347830f8f1c/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=712&bt=712&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sbzT0XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=NWc0Ojg0MzdmOjZmPDRmOkBpajxwPGk6ZnV3ZTMzNGkzM0AtYzZeLWIvXmIxMWJgXzJgYSNtNjNhcjRnYDVgLS1kLS9zcw%3D%3D&l=202207160930490102081671662430C701', '9.97 RkP:/ 复制打开抖音，看看【涵笑半步癫的作品】# 画线救救火柴人 # 画线火柴人 # 火柴人 https://v.douyin.com/26oQ7SA/', '0', 'zybcome', '2022-07-16 09:30:50', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (31, '218.28.225.114', 'https://v6.douyinvod.com/fc42e3d3943a842f07dc92885b4c0426/62d22316/video/tos/cn/tos-cn-ve-15c001-alinc2/ec08ebec0b4a4b4599a98b41403669f7/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=443&bt=443&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sFzT0XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=OTk5OWQ2Nzg3Njw2PDVmOEBpM2RnOjU6Zjl4ZTMzNGkzM0A2YjVeLy00XzUxMTUtMzIwYSNxcWMucjRnbjVgLS1kLS9zcw%3D%3D&l=202207160931160102091590151D315DF5', '4.87 kPx:/ 复制打开抖音，看看【多多游戏酱的作品】# 画线救救火柴人 # 画线火柴人 # 火柴人 # 游戏 ... https://v.douyin.com/26oHo6V/', '0', 'zybcome', '2022-07-16 09:31:16', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (32, '218.28.225.114', 'https://v6-x.douyinvod.com/0ccd577028485ce4941d7834e3b29599/62d22324/video/tos/cn/tos-cn-ve-15c001-alinc2/ec08ebec0b4a4b4599a98b41403669f7/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=443&bt=443&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_s6zT0XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=OTk5OWQ2Nzg3Njw2PDVmOEBpM2RnOjU6Zjl4ZTMzNGkzM0A2YjVeLy00XzUxMTUtMzIwYSNxcWMucjRnbjVgLS1kLS9zcw%3D%3D&l=202207160931300102081741731A326D18', '4.87 kPx:/ 复制打开抖音，看看【多多游戏酱的作品】# 画线救救火柴人 # 画线火柴人 # 火柴人 # 游戏 ... https://v.douyin.com/26oHo6V/', '0', 'zybcome', '2022-07-16 09:31:31', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (33, '218.28.225.114', 'https://v11.douyinvod.com/873301c77bd5900b9601a95ecc859104/62d22344/video/tos/cn/tos-cn-ve-15c001-alinc2/ec08ebec0b4a4b4599a98b41403669f7/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=443&bt=443&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_s~9T0XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=OTk5OWQ2Nzg3Njw2PDVmOEBpM2RnOjU6Zjl4ZTMzNGkzM0A2YjVeLy00XzUxMTUtMzIwYSNxcWMucjRnbjVgLS1kLS9zcw%3D%3D&l=2022071609320201020803810548309B06', '4.87 kPx:/ 复制打开抖音，看看【多多游戏酱的作品】# 画线救救火柴人 # 画线火柴人 # 火柴人 # 游戏 ... https://v.douyin.com/26oHo6V/', '0', 'zybcome', '2022-07-16 09:32:02', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (34, '218.28.225.114', 'https://v1.douyinvod.com/d231fee60ab0dd16a44d0e9400d1b2a7/62d22354/video/tos/cn/tos-cn-ve-15c001-alinc2/ec08ebec0b4a4b4599a98b41403669f7/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=443&bt=443&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sc9T0XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=OTk5OWQ2Nzg3Njw2PDVmOEBpM2RnOjU6Zjl4ZTMzNGkzM0A2YjVeLy00XzUxMTUtMzIwYSNxcWMucjRnbjVgLS1kLS9zcw%3D%3D&l=202207160932180102120691421E30EF54', '4.87 kPx:/ 复制打开抖音，看看【多多游戏酱的作品】# 画线救救火柴人 # 画线火柴人 # 火柴人 # 游戏 ... https://v.douyin.com/26oHo6V/', '0', 'zybcome', '2022-07-16 09:32:19', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (35, '218.28.225.114', 'https://v5.douyinvod.com/c8c785a275e8508fda2a61fad585d73c/62d22356/video/tos/cn/tos-cn-ve-15c001-alinc2/997950ff244e423387ee28f572346bb1/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=1075&bt=1075&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sI9T0XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=NGVoZDQ6OTVpNmY7ZGg8PEBpM3ZkZzM6Zmt5ZTMzNGkzM0A2MTU2Li82NTUxMzZgNWNjYSMwZTBocjRnZjVgLS1kLTBzcw%3D%3D&l=202207160932430102121460914832EABC', '0.20 ica:/ 复制打开抖音，看看【奥特曼爱游戏的作品】# 火柴人# 学生党 # 画线救救火柴人 # 抖音游戏 # ... https://v.douyin.com/26oCnJN/', '0', 'zybcome', '2022-07-16 09:32:43', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (36, '218.28.225.114', 'https://v13.douyinvod.com/27b267fb2c5f765964dba93bb2bb5ad6/62d22379/video/tos/cn/tos-cn-ve-15c001-alinc2/adca14845c0f44fdabc79866157af353/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=495&bt=495&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sTvT0XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=ZzwzOGhpNTM8NzM2aDdoNUBpajZoOGc6ZjR5ZTMzNGkzM0AyMmMvYTRjNmIxYGNfNC02YSNsNmFocjRnaTVgLS1kLS9zcw%3D%3D&l=202207160932550102080372052233DB2D', '1.28 EhO:/ 复制打开抖音，看看【多多游戏酱的作品】# 画线火柴人 # 火柴人 # 画线救救火柴人 # 学生党... https://v.douyin.com/26oHrC8/', '0', 'zybcome', '2022-07-16 09:32:56', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (37, '218.28.225.114', 'https://v26.douyinvod.com/a5f42299f10f30e002aa1af31b3d39a8/62d22380/video/tos/cn/tos-cn-ve-15c001-alinc2/adca14845c0f44fdabc79866157af353/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=495&bt=495&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_s.vT0XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=ZzwzOGhpNTM8NzM2aDdoNUBpajZoOGc6ZjR5ZTMzNGkzM0AyMmMvYTRjNmIxYGNfNC02YSNsNmFocjRnaTVgLS1kLS9zcw%3D%3D&l=202207160933020102080731041932B27B', '1.28 EhO:/ 复制打开抖音，看看【多多游戏酱的作品】# 画线火柴人 # 火柴人 # 画线救救火柴人 # 学生党... https://v.douyin.com/26oHrC8/', '0', 'zybcome', '2022-07-16 09:33:03', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (38, '218.28.225.114', 'https://v11-x.douyinvod.com/8dec489e30c74a37db3604c4840a1668/62d22399/video/tos/cn/tos-cn-ve-15c001-alinc2/e9d05c6bce3340688652fc1c49f24847/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=403&bt=403&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sqvT0XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=aDc6ZGU5NzU3NjU8M2hkO0BpM3lkPDs6ZjMzZTMzNGkzM0AuLWNhNS0zXi0xLjY1XjEtYSMubWUucjQwLzZgLS1kLWFzcw%3D%3D&l=20220716093326010208121079422E6AD0', '9.79 mDU:/ 复制打开抖音，看看【小焱·Game的作品】# 搞笑 # 火柴人 # 抖音游戏 就很离谱 https://v.douyin.com/26oDfoQ/', '0', 'zybcome', '2022-07-16 09:33:26', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (39, '218.28.225.114', 'https://v5.douyinvod.com/daed5cdbb71da7afb0a9aa10c3b3e44c/62d223bb/video/tos/cn/tos-cn-ve-15c001-alinc2/7ca1532a1eac48d7a52a7813c23ba14d/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&br=718&bt=718&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sjvT0XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=OWdmOzZkNmU8PDo0OzM8NEBpajtxcTg6ZmYzZTMzNGkzM0A0LjBeLjM0Xl8xYTIxXy42YSNgMmVpcjRvcjZgLS1kLWFzcw%3D%3D&l=2022071609334901021203607931327BED', '1.00 HIv:/ 复制打开抖音，看看【大猫游戏队长的作品】# 画线救救火柴人 # 画线火柴人 # 火柴人 # 学生党... https://v.douyin.com/26oxyUK/', '0', 'zybcome', '2022-07-16 09:33:49', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (40, '222.137.31.199', 'https://v26.douyinvod.com/a94f5909ded9a77881608da64943dee5/62d7f06a/video/tos/cn/tos-cn-ve-15c001-alinc2/77ffbc3a3dc04f3794e8b4131cff2ed7/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=1534&bt=1534&btag=80000&cs=0&ds=6&ft=raapL0071FOvWHhWH6xRZ_s5331XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=ZmY0N2Q5ZjQ1OjpoM2hlOEBpM3hwPDY6ZjRxZTMzNGkzM0AuLjAwMDZjNjYxYy5jNC5jYSM1NF9ucjRna19gLS1kLS9zcw%3D%3D&l=20220720190821010208167165360B8DAC', '6.46 Oxs:/ 复制打开抖音，看看【最火小游戏的作品】# 快来吃雪糕 # 抖音小游戏 https://v.douyin.com/2y5kkTg/', '0', '', '2022-07-20 19:08:21', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (41, '103.86.50.50', 'https://v5-f.douyinvod.com/dc19bddb4f6139aee8c09b71c64cdecc/62d7f0f9/video/tos/cn/tos-cn-ve-15c001-alinc2/77ffbc3a3dc04f3794e8b4131cff2ed7/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=1534&bt=1534&btag=80000&cs=0&ds=6&ft=raapL0071FOvWHhWH6xRZ_sZL31XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=ZmY0N2Q5ZjQ1OjpoM2hlOEBpM3hwPDY6ZjRxZTMzNGkzM0AuLjAwMDZjNjYxYy5jNC5jYSM1NF9ucjRna19gLS1kLS9zcw%3D%3D&l=20220720191044010208039066080D3FB7', '6.46 Oxs:/ 复制打开抖音，看看【最火小游戏的作品】# 快来吃雪糕 # 抖音小游戏 https://v.douyin.com/2y5kkTg/', '0', '', '2022-07-20 19:10:45', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (42, '222.137.31.199', 'https://v9.douyinvod.com/466d6815b93cffff55341d8d21c632b7/62d7f370/video/tos/cn/tos-cn-ve-15c001-alinc2/eb28b367fa6c4ca597d6f1216095c379/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&br=580&bt=580&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sQv31XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=Zjs2OjRpZWc6aGY4aWhoZUBpM3ZoZDc6ZmdmZTMzNGkzM0BiYTQtYF8yXjAxMjBfYGBeYSMwcy1xcjRfMDRgLS1kLTBzcw%3D%3D&l=20220720192155010212081088020DA3A6', '4.89 oQk:/ 复制打开抖音，看看【阳光很温柔的作品】毕业之后你有多久没有认真学习了? 认真读一本书，或... https://v.douyin.com/2yaG1Qt/', '0', '', '2022-07-20 19:21:56', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (43, '222.137.31.199', 'https://v5-f.douyinvod.com/263b497ab9a531fb7a030f168ec7203f/62d7f389/video/tos/cn/tos-cn-ve-15c001-alinc2/ef16353ea42741d2a1cca9bcad927fcd/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=1004&bt=1004&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sRv31XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=PGg0aGhoZWRoaGg0aWU5ZkBpajl5PDc6ZnY1ZTMzNGkzM0BfNTE0YDBeXzYxNC8wYTBiYSMwNGwycjQwLzVgLS1kLTBzcw%3D%3D&l=20220720192220010211173074180DD33C', '7.46 baA:/ 复制打开抖音，看看【阳光很温柔的作品】生活这么辛苦，学习这么累，不如来跳舞呀# 动漫 # 治... https://v.douyin.com/2ymrpwX/', '0', '', '2022-07-20 19:22:20', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (44, '222.137.31.199', 'https://v11-x.douyinvod.com/06b44deff4ab594fb711019b81e3a54d/62d7f392/video/tos/cn/tos-cn-ve-15c001-alinc2/ef16353ea42741d2a1cca9bcad927fcd/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=1004&bt=1004&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_s0v31XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=PGg0aGhoZWRoaGg0aWU5ZkBpajl5PDc6ZnY1ZTMzNGkzM0BfNTE0YDBeXzYxNC8wYTBiYSMwNGwycjQwLzVgLS1kLTBzcw%3D%3D&l=202207201922290102121361382D0CE51E', '7.46 baA:/ 复制打开抖音，看看【阳光很温柔的作品】生活这么辛苦，学习这么累，不如来跳舞呀# 动漫 # 治... https://v.douyin.com/2ymrpwX/', '0', '', '2022-07-20 19:22:30', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (45, '222.137.31.199', 'https://v11.douyinvod.com/ac0d86fc9f3b704358385b4138060e3c/62d7f3ab/video/tos/cn/tos-cn-ve-15c001-alinc2/7c44fe0e4dae481da2bc4c43c125b18a/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&br=644&bt=644&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_siT31XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=aDdlNjdnM2k8OjZlOzZlZUBpamRmNzQ6ZnNwZTMzNGkzM0AuMjUwMjZeNl4xYzRgYzVhYSNmXy1hcjRvXjVgLS1kLTBzcw%3D%3D&l=202207201922460102080350701C0F15E0', '4.66 foq:/ 复制打开抖音，看看【阳光很温柔的作品】不知道是哪里出了问题，总感觉自己不是很能融入到他们... https://v.douyin.com/2ymrWGk/', '0', '', '2022-07-20 19:22:47', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (46, '218.28.225.114', 'https://v11.douyinvod.com/7b58ea732acea4b1ef06d8368c5d753d/62d8d709/video/tos/cn/tos-cn-ve-15c001-alinc2/7c44fe0e4dae481da2bc4c43c125b18a/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&br=644&bt=644&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sFNB2XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=aDdlNjdnM2k8OjZlOzZlZUBpamRmNzQ6ZnNwZTMzNGkzM0AuMjUwMjZeNl4xYzRgYzVhYSNmXy1hcjRvXjVgLS1kLTBzcw%3D%3D&l=202207211132520102061171363E02B075', '4.66 foq:/ 复制打开抖音，看看【阳光很温柔的作品】不知道是哪里出了问题，总感觉自己不是很能融入到他们... https://v.douyin.com/2ymrWGk/', '0', 'zybcome', '2022-07-21 11:32:52', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (47, '218.28.225.114', 'https://v1.douyinvod.com/7e2f49677af5ac17a64edb570cdd1d1f/62d8d7a3/video/tos/cn/tos-cn-ve-15c001-alinc2/7c44fe0e4dae481da2bc4c43c125b18a/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&br=644&bt=644&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_saSB2XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=aDdlNjdnM2k8OjZlOzZlZUBpamRmNzQ6ZnNwZTMzNGkzM0AuMjUwMjZeNl4xYzRgYzVhYSNmXy1hcjRvXjVgLS1kLTBzcw%3D%3D&l=202207211135260102060992190103201A', '4.66 foq:/ 复制打开抖音，看看【阳光很温柔的作品】不知道是哪里出了问题，总感觉自己不是很能融入到他们... https://v.douyin.com/2ymrWGk/', '0', 'zybcome', '2022-07-21 11:35:27', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (48, '218.28.225.114', 'https://v26.idouyinvod.com/fdb29f11102aafab75bbec89c7b2960b/62d8d7ac/video/tos/cn/tos-cn-ve-15c001-alinc2/ef16353ea42741d2a1cca9bcad927fcd/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=1004&bt=1004&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sm8B2XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=PGg0aGhoZWRoaGg0aWU5ZkBpajl5PDc6ZnY1ZTMzNGkzM0BfNTE0YDBeXzYxNC8wYTBiYSMwNGwycjQwLzVgLS1kLTBzcw%3D%3D&l=2022072111354301020915904901031CFB', '7.46 baA:/ 复制打开抖音，看看【阳光很温柔的作品】生活这么辛苦，学习这么累，不如来跳舞呀# 动漫 # 治... https://v.douyin.com/2ymrpwX/', '0', 'zybcome', '2022-07-21 11:35:44', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (49, '218.28.225.114', 'https://v9.douyinvod.com/04c825771e525b6a13ea1d36a591510d/62d8d7bb/video/tos/cn/tos-cn-ve-15c001-alinc2/ef16353ea42741d2a1cca9bcad927fcd/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=1004&bt=1004&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sK8B2XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=PGg0aGhoZWRoaGg0aWU5ZkBpajl5PDc6ZnY1ZTMzNGkzM0BfNTE0YDBeXzYxNC8wYTBiYSMwNGwycjQwLzVgLS1kLTBzcw%3D%3D&l=202207211135580102080171300D02DB0A', '7.46 baA:/ 复制打开抖音，看看【阳光很温柔的作品】生活这么辛苦，学习这么累，不如来跳舞呀# 动漫 # 治... https://v.douyin.com/2ymrpwX/', '0', 'zybcome', '2022-07-21 11:35:59', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (50, '218.28.225.114', 'https://v26.douyinvod.com/a399a9f4cf851547e4802a2fe1677abb/62d8d7c9/video/tos/cn/tos-cn-ve-15c001-alinc2/ef16353ea42741d2a1cca9bcad927fcd/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=1004&bt=1004&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sR8B2XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=PGg0aGhoZWRoaGg0aWU5ZkBpajl5PDc6ZnY1ZTMzNGkzM0BfNTE0YDBeXzYxNC8wYTBiYSMwNGwycjQwLzVgLS1kLTBzcw%3D%3D&l=202207211136120102080372053702ED13', '7.46 baA:/ 复制打开抖音，看看【阳光很温柔的作品】生活这么辛苦，学习这么累，不如来跳舞呀# 动漫 # 治... https://v.douyin.com/2ymrpwX/', '0', 'zybcome', '2022-07-21 11:36:12', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (51, '218.28.225.114', 'https://v1.douyinvod.com/55614e9ef33ac42d3118766b6ab875dd/62d8d811/video/tos/cn/tos-cn-ve-15c001-alinc2/ef16353ea42741d2a1cca9bcad927fcd/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=1004&bt=1004&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sZ-B2XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=PGg0aGhoZWRoaGg0aWU5ZkBpajl5PDc6ZnY1ZTMzNGkzM0BfNTE0YDBeXzYxNC8wYTBiYSMwNGwycjQwLzVgLS1kLTBzcw%3D%3D&l=20220721113724010208121092080345AD', '7.46 baA:/ 复制打开抖音，看看【阳光很温柔的作品】生活这么辛苦，学习这么累，不如来跳舞呀# 动漫 # 治... https://v.douyin.com/2ymrpwX/', '0', 'zybcome', '2022-07-21 11:37:24', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (52, '218.28.225.114', 'https://v5-j.douyinvod.com/7cf89bdededa8cf9260793fa35aa963f/62d8d830/video/tos/cn/tos-cn-ve-15c001-alinc2/7c44fe0e4dae481da2bc4c43c125b18a/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&br=644&bt=644&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_stZB2XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=aDdlNjdnM2k8OjZlOzZlZUBpamRmNzQ6ZnNwZTMzNGkzM0AuMjUwMjZeNl4xYzRgYzVhYSNmXy1hcjRvXjVgLS1kLTBzcw%3D%3D&l=2022072111374701021005704047033E98', '4.66 foq:/ 复制打开抖音，看看【阳光很温柔的作品】不知道是哪里出了问题，总感觉自己不是很能融入到他们... https://v.douyin.com/2ymrWGk/', '0', 'zybcome', '2022-07-21 11:37:48', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (53, '218.28.225.114', 'https://v5-j.douyinvod.com/eb4a9a04a6a7b6ec269d1e808b1ae864/62d8d8d8/video/tos/cn/tos-cn-ve-15c001-alinc2/7c44fe0e4dae481da2bc4c43c125b18a/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&br=644&bt=644&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_s-MB2XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=aDdlNjdnM2k8OjZlOzZlZUBpamRmNzQ6ZnNwZTMzNGkzM0AuMjUwMjZeNl4xYzRgYzVhYSNmXy1hcjRvXjVgLS1kLTBzcw%3D%3D&l=202207211140350102121380472A0346B9', '4.66 foq:/ 复制打开抖音，看看【阳光很温柔的作品】不知道是哪里出了问题，总感觉自己不是很能融入到他们... https://v.douyin.com/2ymrWGk/', '0', 'zybcome', '2022-07-21 11:40:36', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (54, '218.28.225.114', 'https://v13.douyinvod.com/57bd1edeb725d7d5a5118ca0551160f4/62d8d9c9/video/tos/cn/tos-cn-ve-15c001-alinc2/7c44fe0e4dae481da2bc4c43c125b18a/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&br=644&bt=644&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sFRB2XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=aDdlNjdnM2k8OjZlOzZlZUBpamRmNzQ6ZnNwZTMzNGkzM0AuMjUwMjZeNl4xYzRgYzVhYSNmXy1hcjRvXjVgLS1kLTBzcw%3D%3D&l=202207211144360102040510930A03A9A5', '4.66 foq:/ 复制打开抖音，看看【阳光很温柔的作品】不知道是哪里出了问题，总感觉自己不是很能融入到他们... https://v.douyin.com/2ymrWGk/', '0', 'zybcome', '2022-07-21 11:44:37', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (55, '218.28.225.114', 'https://v26.idouyinvod.com/bda01412ee7ac56cf39270215223d8fd/62d8d9cd/video/tos/cn/tos-cn-ve-15c001-alinc2/ef16353ea42741d2a1cca9bcad927fcd/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=1004&bt=1004&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sVRB2XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=PGg0aGhoZWRoaGg0aWU5ZkBpajl5PDc6ZnY1ZTMzNGkzM0BfNTE0YDBeXzYxNC8wYTBiYSMwNGwycjQwLzVgLS1kLTBzcw%3D%3D&l=2022072111444801021203409141040EBB', '7.46 baA:/ 复制打开抖音，看看【阳光很温柔的作品】生活这么辛苦，学习这么累，不如来跳舞呀# 动漫 # 治... https://v.douyin.com/2ymrpwX/', '0', 'zybcome', '2022-07-21 11:44:49', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (56, '218.28.225.114', 'https://v26.douyinvod.com/2e3a956228b89b1811cb1ce39ef3c7d6/62d8dbda/video/tos/cn/tos-cn-ve-15c001-alinc2/7c44fe0e4dae481da2bc4c43c125b18a/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&br=644&bt=644&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_s0DB2XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=aDdlNjdnM2k8OjZlOzZlZUBpamRmNzQ6ZnNwZTMzNGkzM0AuMjUwMjZeNl4xYzRgYzVhYSNmXy1hcjRvXjVgLS1kLTBzcw%3D%3D&l=20220721115325010210049025120468FB', '4.66 foq:/ 复制打开抖音，看看【阳光很温柔的作品】不知道是哪里出了问题，总感觉自己不是很能融入到他们... https://v.douyin.com/2ymrWGk/', '0', 'zybcome', '2022-07-21 11:53:26', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (57, '218.28.225.114', 'https://v26.douyinvod.com/06b36749d8ed7a8c01074048dd03acf2/62d8dbe9/video/tos/cn/tos-cn-ve-15c001-alinc2/7c44fe0e4dae481da2bc4c43c125b18a/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&br=644&bt=644&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sraB2XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=aDdlNjdnM2k8OjZlOzZlZUBpamRmNzQ6ZnNwZTMzNGkzM0AuMjUwMjZeNl4xYzRgYzVhYSNmXy1hcjRvXjVgLS1kLTBzcw%3D%3D&l=202207211153400102081020842804B479', '4.66 foq:/ 复制打开抖音，看看【阳光很温柔的作品】不知道是哪里出了问题，总感觉自己不是很能融入到他们... https://v.douyin.com/2ymrWGk/', '0', 'zybcome', '2022-07-21 11:53:41', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (58, '182.118.236.221', 'https://v27.douyinvod.com/376e962f72d40333235d8037ac13b29a/62d90265/video/tos/cn/tos-cn-ve-15c001-alinc2/42f3bd5ed0144603ab0c0b0bd9c6269f/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=2219&bt=2219&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_saj02XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=Nzs3aDY6aTZpaDhkaWQ7NUBpM25ocGg6ZnVoZTMzNGkzM0BeMTBjLmFfXi8xNDFgNjReYSMyZTM1cjRfZmBgLS1kLWFzcw%3D%3D&l=202207211437500102120610924A01E8EC', '9.28 lCU:/ 复制打开抖音，看看【阿布学长的作品】# 抖音小游戏入口 # 学生党 https://v.douyin.com/2fEP6eD/', '0', '', '2022-07-21 14:37:51', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (59, '182.118.236.221', 'https://v6-x.douyinvod.com/ca96210f5d8692f2a73c550f820989f8/62d9027f/video/tos/cn/tos-cn-ve-15c001-alinc2/9b595ec19a9048df898e5030220542c4/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=1902&bt=1902&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sAU02XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=NTY6ZjpnZDtkOWdoZ2Y7NUBpMzpmdjs6ZjNoZTMzNGkzM0BiM2IvYzRhNmExMTU2LjYyYSMubmFecjQwZmBgLS1kLWFzcw%3D%3D&l=202207211438150102080360912D01E3B5', '6.46 eOx:/ 复制打开抖音，看看【阿布学长的作品】# 抖音小游戏入口 # 学生党 https://v.douyin.com/2fEP9LB/', '0', '', '2022-07-21 14:38:16', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (60, '182.118.236.221', 'https://v5-i.douyinvod.com/abc48fa8d4fe8f5cdd66ce12b64ae7d7/62d902ac/video/tos/cn/tos-cn-ve-15c001-alinc2/0de3fe46224c45b2884d762ac964113c/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=2246&bt=2246&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sYO02XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=M2c3Nzo0OTs4NWloOmg5OkBpM29pNGQ6ZnVoZTMzNGkzM0BjL18uYzJeNTIxMjBiM2FeYSMzX2IvcjRfZGBgLS1kLWFzcw%3D%3D&l=202207211438560102091590282301E1E9', '6.69 IVY:/ 复制打开抖音，看看【阿布学长的作品】# 抖音小游戏入口 # 学生党 https://v.douyin.com/2fEAbR9/', '0', '', '2022-07-21 14:38:56', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (61, '218.28.225.114', 'https://v27.douyinvod.com/6a04fb43ba23ede90d2c5620de25b096/62d90467/video/tos/cn/tos-cn-ve-15c001-alinc2/7c44fe0e4dae481da2bc4c43c125b18a/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&br=644&bt=644&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_ssq02XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=aDdlNjdnM2k8OjZlOzZlZUBpamRmNzQ6ZnNwZTMzNGkzM0AuMjUwMjZeNl4xYzRgYzVhYSNmXy1hcjRvXjVgLS1kLTBzcw%3D%3D&l=202207211446260102081660484C026F12', '4.66 foq:/ 复制打开抖音，看看【阳光很温柔的作品】不知道是哪里出了问题，总感觉自己不是很能融入到他们... https://v.douyin.com/2ymrWGk/', '0', 'zybcome', '2022-07-21 14:46:27', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (62, '182.118.232.37', 'https://v26.idouyinvod.com/0eeafd8b83cd71da65e704833f9b00a8/62d91327/video/tos/cn/tos-cn-ve-15c001-alinc2/3d32ef35616947e8b7bef4a46224b5cf/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=345&bt=345&btag=80000&cs=0&ds=6&ft=raapL0071FOvWHhWH6xRZ_sJ9V2XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=Z2g2PDU8OTw1NjQzZjpkNkBpamk8a2c6ZjQ3ZTMzNGkzM0BiYTA0YV5gNTAxLjIzLi1hYSM1cy1ucjQwXjZgLS1kLS9zcw%3D%3D&l=202207211549250102120611961B06E889', '9.48 AGI:/ 复制打开抖音，看看【最火小游戏的作品】# 全民拼拼乐 # 抖音小游戏 https://v.douyin.com/2P8qrQb/', '0', '', '2022-07-21 15:49:26', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (63, '218.28.225.114', 'https://v11-x.douyinvod.com/47cf5cf74987869b970594fd5b8b9e58/62d9164f/video/tos/cn/tos-cn-ve-15c001-alinc2/7c44fe0e4dae481da2bc4c43c125b18a/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&br=644&bt=644&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sBkV2XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=aDdlNjdnM2k8OjZlOzZlZUBpamRmNzQ6ZnNwZTMzNGkzM0AuMjUwMjZeNl4xYzRgYzVhYSNmXy1hcjRvXjVgLS1kLTBzcw%3D%3D&l=202207211602500102120440354501092D', '4.66 foq:/ 复制打开抖音，看看【阳光很温柔的作品】不知道是哪里出了问题，总感觉自己不是很能融入到他们... https://v.douyin.com/2ymrWGk/', '0', 'zybcome', '2022-07-21 16:02:51', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (64, '103.86.50.50', 'https://v5-h.douyinvod.com/b65dbc7e7f37d1f5d021a2ace8285133/62d9491f/video/tos/cn/tos-cn-ve-15c001-alinc2/bd31d843f5f1407397569e63aad94861/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=3191&bt=3191&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_ssf72XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=Mzw5ZTg0ZjwzMzZlaWY7O0BpM3JzPGc6ZnlwZTMzNGkzM0AxL142MjJfX18xLjMvXmFjYSNtcHFycjRfal9gLS1kLS9zcw%3D%3D&l=202207211939460102081641492904ACED', 'https://v.douyin.com/2Pufp57/', '0', '', '2022-07-21 19:39:47', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (65, '222.137.31.115', 'https://v9.douyinvod.com/594f3de3f5cb4285b2f623e0c6aa03e7/62d94965/video/tos/cn/tos-cn-ve-15c001-alinc2/bd31d843f5f1407397569e63aad94861/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=3191&bt=3191&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sgi72XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=Mzw5ZTg0ZjwzMzZlaWY7O0BpM3JzPGc6ZnlwZTMzNGkzM0AxL142MjJfX18xLjMvXmFjYSNtcHFycjRfal9gLS1kLS9zcw%3D%3D&l=202207211940550102081651031704ACB7', 'https://v.douyin.com/2Pufp57/', '0', '', '2022-07-21 19:40:56', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (66, '222.137.31.115', 'https://v26.idouyinvod.com/18befccd9ca4df774fd634af32550e84/62d94996/video/tos/cn/tos-cn-ve-15c001-alinc2/bd31d843f5f1407397569e63aad94861/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=3191&bt=3191&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sCi72XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=Mzw5ZTg0ZjwzMzZlaWY7O0BpM3JzPGc6ZnlwZTMzNGkzM0AxL142MjJfX18xLjMvXmFjYSNtcHFycjRfal9gLS1kLS9zcw%3D%3D&l=202207211941450102080360833B04CB88', 'https://v.douyin.com/2Pufp57/', '0', '', '2022-07-21 19:41:45', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (67, '222.137.31.115', 'https://v5-i.douyinvod.com/d72411aa8571f8e336a8d49760e3c7e4/62d949db/video/tos/cn/tos-cn-ve-15c001-alinc2/9c4dd3353d1f4f91a96f17330f0febac/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=3187&bt=3187&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sMR72XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=Zzc6ODVmNGQ4OjhkaWRlaEBpM3B0NGQ6ZmlwZTMzNGkzM0AvYC80Li9gX2IxMTU1NjEuYSNhZy1ycjRfa19gLS1kLS9zcw%3D%3D&l=202207211942520102091581332F04D12A', 'https://v.douyin.com/2PuuFF1/', '0', '', '2022-07-21 19:42:52', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (68, '222.137.31.115', 'https://v5-j.douyinvod.com/b61adceea8561f64f8f3ec31b675d977/62d949ff/video/tos/cn/tos-cn-ve-15c001-alinc2/0ff378a06fdb4bd8a43c9517e268e884/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=3327&bt=3327&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_s2272XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=aTk5NTY6PDs2ZTc1ZWllOkBpank5bTg6ZjhwZTMzNGkzM0AtX2FiLTUvNmAxXjNiMjUtYSNfaGxhcjQwbF9gLS1kLS9zcw%3D%3D&l=2022072119433101021210208648048CC3', 'https://v.douyin.com/2Pu6gE7/', '0', '', '2022-07-21 19:43:32', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (69, '207.148.68.198', 'https://v5-i.douyinvod.com/b08cb9dcc7c6b90018255ab551bc0db6/62d964d2/video/tos/cn/tos-cn-ve-15c001-alinc2/5c9fab884d964214848201edb1b32dd7/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=363&bt=363&btag=80000&cs=0&ds=6&ft=raapL0071FOvWHhWH6xRZ_s74j2XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=aDU5aDtlO2c3OzVpZjtoOUBpMzNwNzU6ZmpkZTMzNGkzM0BjYDQvYWAwXmIxYTIyYzAwYSM2NTNicjRnNWBgLS1kLWFzcw%3D%3D&l=202207212137260102091701654A0F9E7B', 'https://v.douyin.com/2PpxVp4/', '0', '', '2022-07-21 21:37:27', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (70, '218.28.225.114', 'https://v11.douyinvod.com/925d6682c0fa6a81caef041735e92309/62da0530/video/tos/cn/tos-cn-ve-15c001-alinc2/0ff378a06fdb4bd8a43c9517e268e884/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=3327&bt=3327&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sQYR2XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=aTk5NTY6PDs2ZTc1ZWllOkBpank5bTg6ZjhwZTMzNGkzM0AtX2FiLTUvNmAxXjNiMjUtYSNfaGxhcjQwbF9gLS1kLS9zcw%3D%3D&l=20220722090212010209158132242FDF71', '2.35 mDh:/ 复制打开抖音，看看【熊来了的作品】# 抖音游戏 # 解压小游戏 # 休闲游戏 # 学生党 https://v.douyin.com/2Pu6gE7/', '0', 'zybcome', '2022-07-22 09:02:12', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (71, '218.28.225.114', 'https://v5-f.douyinvod.com/b8c79274b8d0bc2bb8ebf2c926af66ba/62da056b/video/tos/cn/tos-cn-ve-15c001-alinc2/5c9fab884d964214848201edb1b32dd7/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=363&bt=363&btag=80000&cs=0&ds=6&ft=raapL0071FOvWHhWH6xRZ_s1YR2XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=aDU5aDtlO2c3OzVpZjtoOUBpMzNwNzU6ZmpkZTMzNGkzM0BjYDQvYWAwXmIxYTIyYzAwYSM2NTNicjRnNWBgLS1kLWFzcw%3D%3D&l=202207220902390102101010204C2F0A94', '9.76 YzT:/ 复制打开抖音，看看【被子封印的鱼的作品】# 全民烧脑新版 # 救救狗狗 # 抖音游戏 # 学生党 ... https://v.douyin.com/2PpxVp4/', '0', 'zybcome', '2022-07-22 09:02:40', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (72, '218.28.225.114', 'https://v6-x.douyinvod.com/791bcbfb7d45f4d3cff3e9a6b71323a4/62da0554/video/tos/cn/tos-cn-ve-15c001-alinc2/0ff378a06fdb4bd8a43c9517e268e884/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=3327&bt=3327&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_seYR2XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=aTk5NTY6PDs2ZTc1ZWllOkBpank5bTg6ZjhwZTMzNGkzM0AtX2FiLTUvNmAxXjNiMjUtYSNfaGxhcjQwbF9gLS1kLS9zcw%3D%3D&l=20220722090248010208102100153009C3', '2.35 mDh:/ 复制打开抖音，看看【熊来了的作品】# 抖音游戏 # 解压小游戏 # 休闲游戏 # 学生党 https://v.douyin.com/2Pu6gE7/', '0', 'zybcome', '2022-07-22 09:02:49', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (73, '218.28.225.114', 'https://v26.douyinvod.com/b04e244ccd37541429174862255e0be0/62da05d7/video/tos/cn/tos-cn-ve-15c001-alinc2/0ff378a06fdb4bd8a43c9517e268e884/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=3327&bt=3327&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sIJR2XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=aTk5NTY6PDs2ZTc1ZWllOkBpank5bTg6ZjhwZTMzNGkzM0AtX2FiLTUvNmAxXjNiMjUtYSNfaGxhcjQwbF9gLS1kLS9zcw%3D%3D&l=20220722090459010209146166302D0C05', '2.35 mDh:/ 复制打开抖音，的作品】# 抖音游戏 # 解压小游戏 # 休闲游戏 # 学生党 https://v.douyin.com/2Pu6gE7/', '0', 'zybcome', '2022-07-22 09:05:00', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (74, '218.28.225.114', 'https://v27.douyinvod.com/2b66697552151cd8f051c859ef184a77/62da07b0/video/tos/cn/tos-cn-ve-15c001-alinc2/0ff378a06fdb4bd8a43c9517e268e884/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=3327&bt=3327&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sQ8R2XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=aTk5NTY6PDs2ZTc1ZWllOkBpank5bTg6ZjhwZTMzNGkzM0AtX2FiLTUvNmAxXjNiMjUtYSNfaGxhcjQwbF9gLS1kLS9zcw%3D%3D&l=2022072209125201021206914248302C77', '2.35 mDh:/ 复制打开抖音，看看【熊来了的作品】# 抖音游戏 # 解压小游戏 # 休闲游戏 # 学生党 https://v.douyin.com/2Pu6gE7/', '0', 'zybcome', '2022-07-22 09:12:53', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (75, '182.119.38.255', 'https://v11.douyinvod.com/df334a288c356dbed9904fb41f62de06/62da3b29/video/tos/cn/tos-cn-ve-15c001-alinc2/d46bbfb8bb9c4d5eb261fdbf271ec24e/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=1243&bt=1243&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sMIp2XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=ODM6OGU6NTs7ZjllaTw6NEBpanU3ZWk6ZmczZTMzNGkzM0AvMV80LjJeNS0xYjYyYGJhYSNkLTZfcjQwX2FgLS1kLWFzcw%3D%3D&l=202207221252120102080372200C08F7DA', 'https://v.douyin.com/25byhuY/', '0', '', '2022-07-22 12:52:12', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (76, '182.119.38.255', 'https://v26.douyinvod.com/237206730dc5310ef044ba793a421690/62da3b52/video/tos/cn/tos-cn-ve-15c001-alinc2/7f28a1b30e1a4f3593d078c53e599f31/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=1284&bt=1284&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_spmp2XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=ZTY8aDdlNTlpaTVoOzQ7NUBpamo1dzw6ZjZ4ZTMzNGkzM0A2MS9fLjUyXmExNS1fMGE2YSNkb2xlcjQwcmBgLS1kLWFzcw%3D%3D&l=202207221253010102091581361C08A632', 'https://v.douyin.com/25b93hD/', '0', '', '2022-07-22 12:53:02', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (77, '182.119.38.255', 'https://v5-h.douyinvod.com/460aec594360bb0ea004e8a5bc5d0862/62da3b7b/video/tos/cn/tos-cn-ve-15c001-alinc2/1613b1edd48842dfac93763a6a385875/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=1391&bt=1391&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_smPp2XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=OTw3ZGVkZ2Y5MzY3PDczZUBpang0cTQ6ZnI2ZTMzNGkzM0AwXzEvXl5eXjMxNC5fLmNhYSNvYWNfcjRnNF9gLS1kLS9zcw%3D%3D&l=2022072212533501020812110524092FA4', 'https://v.douyin.com/25btPnR/', '0', '', '2022-07-22 12:53:36', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (78, '222.137.46.65', 'https://v5-h.douyinvod.com/71c5f6bf15bbd127a55a62119ec6bf4e/62e6497e/video/tos/cn/tos-cn-ve-15c001-alinc2/7f28a1b30e1a4f3593d078c53e599f31/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=1284&bt=1284&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_syiv5XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=ZTY8aDdlNTlpaTVoOzQ7NUBpamo1dzw6ZjZ4ZTMzNGkzM0A2MS9fLjUyXmExNS1fMGE2YSNkb2xlcjQwcmBgLS1kLWFzcw%3D%3D&l=20220731162040010212146091294E1842', '5.12 yTL:/ 复制打开抖音，看看【天痕游戏馆的作品】游戏 https://v.douyin.com/25b93hD/', '0', '', '2022-07-31 16:20:41', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (79, '171.13.212.213', 'https://v83-016.douyinvod.com/682effa0a45a71d49d5cf514e71071a3/62e72b44/video/tos/cn/tos-cn-ve-15c001-alinc2/0af290a9d67a4e9a809ce796e2bf2466/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=1832&bt=1832&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_slmU5XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=Nzk1OWZpN2Y6Mzw8NjNoM0BpMzd4azc6ZndsZTMzNGkzM0AyYDUyNDYxXzIxLzIvMTExYSM1aG80cjQwbGZgLS1kLS9zcw%3D%3D&l=202208010824090102061230533C8A05C7', 'https://v.douyin.com/2nfTYKp/', '0', '', '2022-08-01 08:24:10', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (80, '171.13.212.213', 'https://v11.douyinvod.com/715e92bfb6d63c3d6135bc1c7d56c504/62e72b46/video/tos/cn/tos-cn-ve-15c001-alinc2/0af290a9d67a4e9a809ce796e2bf2466/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=1832&bt=1832&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sGmU5XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=Nzk1OWZpN2Y6Mzw8NjNoM0BpMzd4azc6ZndsZTMzNGkzM0AyYDUyNDYxXzIxLzIvMTExYSM1aG80cjQwbGZgLS1kLS9zcw%3D%3D&l=202208010824100102091461464D855B73', 'https://v.douyin.com/2nfTYKp/', '0', '', '2022-08-01 08:24:11', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (81, '106.34.179.21', 'https://v9.douyinvod.com/3c90ca412ddeb489a74c17d90ad1b0cb/62e72c70/video/tos/cn/tos-cn-ve-15c001-alinc2/0af290a9d67a4e9a809ce796e2bf2466/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=1832&bt=1832&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sN~U5XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=Nzk1OWZpN2Y6Mzw8NjNoM0BpMzd4azc6ZndsZTMzNGkzM0AyYDUyNDYxXzIxLzIvMTExYSM1aG80cjQwbGZgLS1kLS9zcw%3D%3D&l=202208010829090102020921334B8C89DD', 'https://v.douyin.com/2nfTYKp/', '0', '', '2022-08-01 08:29:10', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (82, '218.28.225.114', 'https://v6.douyinvod.com/2da1161ce70df1e4b5942a4aecf21b15/62e75af8/video/tos/cn/tos-cn-ve-15c001-alinc2/577323753e704bb497248347830f8f1c/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=712&bt=712&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sCBo5XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=NWc0Ojg0MzdmOjZmPDRmOkBpajxwPGk6ZnV3ZTMzNGkzM0AtYzZeLWIvXmIxMWJgXzJgYSNtNjNhcjRnYDVgLS1kLS9zcw%3D%3D&l=20220801114705010208017132009BA4A1', '9.97 RkP:/ 复制打开抖音，看看【涵笑半步癫的作品】# 画线救救火柴人 # 画线火柴人 # 火柴人 https://v.douyin.com/26oQ7SA/', '0', 'zybcome', '2022-08-01 11:47:05', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (83, '218.28.225.114', 'https://v5-j.douyinvod.com/b0c01234f2be568d98a6bbfe03423a6d/62e75cd2/video/tos/cn/tos-cn-ve-15c001-alinc2/7ca1532a1eac48d7a52a7813c23ba14d/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=718&bt=718&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sQWo5XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=OWdmOzZkNmU8PDo0OzM8NEBpajtxcTg6ZmYzZTMzNGkzM0A0LjBeLjM0Xl8xYTIxXy42YSNgMmVpcjRvcjZgLS1kLWFzcw%3D%3D&l=202208011155000102080171533D9E34BB', '1.00 HIv:/ 复制打开抖音，看看【大猫游戏队长的作品】# 画线救救火柴人 # 画线火柴人 # 火柴人 # 学生党... https://v.douyin.com/26oxyUK/', '0', 'zybcome', '2022-08-01 11:55:01', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (84, '218.28.225.114', 'https://v3.douyinvod.com/ed1ce363471b671ae165f408628ce95e/62e75d51/video/tos/cn/tos-cn-ve-15c001-alinc2/ec08ebec0b4a4b4599a98b41403669f7/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=443&bt=443&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sUyo5XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=OTk5OWQ2Nzg3Njw2PDVmOEBpM2RnOjU6Zjl4ZTMzNGkzM0A2YjVeLy00XzUxMTUtMzIwYSNxcWMucjRnbjVgLS1kLS9zcw%3D%3D&l=2022080111571901020801608638942C19', 'https://v.douyin.com/26oHo6V/', '0', 'zybcome', '2022-08-01 11:57:20', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (85, '218.28.225.114', 'https://v1.douyinvod.com/a8529f2f91f63e62a5b2ecebf1f48523/62e75d4f/video/tos/cn/tos-cn-ve-15c001-alinc2/ef16353ea42741d2a1cca9bcad927fcd/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=1004&bt=1004&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_s6yo5XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=PGg0aGhoZWRoaGg0aWU5ZkBpajl5PDc6ZnY1ZTMzNGkzM0BfNTE0YDBeXzYxNC8wYTBiYSMwNGwycjQwLzVgLS1kLTBzcw%3D%3D&l=20220801115738010212104071089BD7A0', 'https://v.douyin.com/2ymrpwX/', '0', 'zybcome', '2022-08-01 11:57:38', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (86, '218.28.225.114', 'https://v9.douyinvod.com/0ee389227fc1d7f0bfd7b2c5390de525/62e75d5d/video/tos/cn/tos-cn-ve-15c001-alinc2/7c44fe0e4dae481da2bc4c43c125b18a/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=644&bt=644&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_seyo5XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=aDdlNjdnM2k8OjZlOzZlZUBpamRmNzQ6ZnNwZTMzNGkzM0AuMjUwMjZeNl4xYzRgYzVhYSNmXy1hcjRvXjVgLS1kLTBzcw%3D%3D&l=202208011157440102080370882A00023D', 'https://v.douyin.com/2ymrWGk/', '0', 'zybcome', '2022-08-01 11:57:44', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (87, '218.28.225.114', 'https://v3-x.douyinvod.com/35e884d1f337540f9564af8775d53deb/62e77e59/video/tos/cn/tos-cn-ve-15c001-alinc2/ef16353ea42741d2a1cca9bcad927fcd/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=1004&bt=1004&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sMlg5XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=PGg0aGhoZWRoaGg0aWU5ZkBpajl5PDc6ZnY1ZTMzNGkzM0BfNTE0YDBeXzYxNC8wYTBiYSMwNGwycjQwLzVgLS1kLTBzcw%3D%3D&l=2022080114183601020914614829039865', 'https://v.douyin.com/2ymrpwX/', '0', 'zybcome', '2022-08-01 14:18:36', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (88, '218.28.225.114', 'https://v9.douyinvod.com/75c0424aa3a5ae064e61b6a3d515d545/62e77f88/video/tos/cn/tos-cn-ve-15c001-alinc2/ef16353ea42741d2a1cca9bcad927fcd/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=1004&bt=1004&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sGEg5XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=PGg0aGhoZWRoaGg0aWU5ZkBpajl5PDc6ZnY1ZTMzNGkzM0BfNTE0YDBeXzYxNC8wYTBiYSMwNGwycjQwLzVgLS1kLTBzcw%3D%3D&l=202208011423390102121012330B043F1E', 'https://v.douyin.com/2ymrpwX/', '0', 'zybcome', '2022-08-01 14:23:40', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (89, '218.28.225.114', 'https://v3-x.douyinvod.com/48d40d43c17c71ae707a4627d3c50852/62e78061/video/tos/cn/tos-cn-ve-15c001-alinc2/7c44fe0e4dae481da2bc4c43c125b18a/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=644&bt=644&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sM3g5XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=aDdlNjdnM2k8OjZlOzZlZUBpamRmNzQ6ZnNwZTMzNGkzM0AuMjUwMjZeNl4xYzRgYzVhYSNmXy1hcjRvXjVgLS1kLTBzcw%3D%3D&l=202208011427070102122020733304A3E8', 'https://v.douyin.com/2ymrWGk/', '0', 'zybcome', '2022-08-01 14:27:08', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (90, '218.28.225.114', 'https://v9.douyinvod.com/d36699ad9d480a426c038abbea451754/62e78066/video/tos/cn/tos-cn-ve-15c001-alinc2/7c44fe0e4dae481da2bc4c43c125b18a/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=644&bt=644&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sWrg5XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=aDdlNjdnM2k8OjZlOzZlZUBpamRmNzQ6ZnNwZTMzNGkzM0AuMjUwMjZeNl4xYzRgYzVhYSNmXy1hcjRvXjVgLS1kLTBzcw%3D%3D&l=2022080114271301021205523233048ACE', 'https://v.douyin.com/2ymrWGk/', '0', 'zybcome', '2022-08-01 14:27:14', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (91, '218.28.225.114', 'https://v5.douyinvod.com/8b6e7997ff080f37c2ca7776dd9c09ca/62e780ae/video/tos/cn/tos-cn-ve-15c001-alinc2/7c44fe0e4dae481da2bc4c43c125b18a/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=644&bt=644&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sLLg5XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=aDdlNjdnM2k8OjZlOzZlZUBpamRmNzQ6ZnNwZTMzNGkzM0AuMjUwMjZeNl4xYzRgYzVhYSNmXy1hcjRvXjVgLS1kLTBzcw%3D%3D&l=202208011428250102121700724E04598B', 'https://v.douyin.com/2ymrWGk/', '0', 'zybcome', '2022-08-01 14:28:25', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (92, '218.28.225.114', 'https://v83-016.douyinvod.com/ebb7ce76c652f96d9f877e16edc23e0a/62e781bb/video/tos/cn/tos-cn-ve-15c001-alinc2/7c44fe0e4dae481da2bc4c43c125b18a/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=644&bt=644&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_s7Cg5XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=aDdlNjdnM2k8OjZlOzZlZUBpamRmNzQ6ZnNwZTMzNGkzM0AuMjUwMjZeNl4xYzRgYzVhYSNmXy1hcjRvXjVgLS1kLTBzcw%3D%3D&l=202208011432540101980911643504E570', 'https://v.douyin.com/2ymrWGk/', '0', 'zybcome', '2022-08-01 14:32:55', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (93, '218.28.225.114', 'https://v9.douyinvod.com/8bf7c46a34276c7cd0a5ca7cdbeb8b7b/62e781ea/video/tos/cn/tos-cn-ve-15c001-alinc2/7c44fe0e4dae481da2bc4c43c125b18a/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=644&bt=644&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sJog5XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=aDdlNjdnM2k8OjZlOzZlZUBpamRmNzQ6ZnNwZTMzNGkzM0AuMjUwMjZeNl4xYzRgYzVhYSNmXy1hcjRvXjVgLS1kLTBzcw%3D%3D&l=202208011433410102020890281D04AA90', 'https://v.douyin.com/2ymrWGk/', '0', 'zybcome', '2022-08-01 14:33:42', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (94, '218.28.225.114', 'https://v5-g.douyinvod.com/163011f9d470f682e9e51614e36dbaa7/62e78266/video/tos/cn/tos-cn-ve-15c001-alinc2/7c44fe0e4dae481da2bc4c43c125b18a/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=644&bt=644&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sWUg5XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=aDdlNjdnM2k8OjZlOzZlZUBpamRmNzQ6ZnNwZTMzNGkzM0AuMjUwMjZeNl4xYzRgYzVhYSNmXy1hcjRvXjVgLS1kLTBzcw%3D%3D&l=202208011435450102080370822C0572EB', 'https://v.douyin.com/2ymrWGk/', '0', 'zybcome', '2022-08-01 14:35:45', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (95, '218.28.225.114', 'https://v83-016.douyinvod.com/8422f758549a2162107a63c3d730e6bf/62e782a5/video/tos/cn/tos-cn-ve-15c001-alinc2/7c44fe0e4dae481da2bc4c43c125b18a/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=644&bt=644&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sYOg5XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=aDdlNjdnM2k8OjZlOzZlZUBpamRmNzQ6ZnNwZTMzNGkzM0AuMjUwMjZeNl4xYzRgYzVhYSNmXy1hcjRvXjVgLS1kLTBzcw%3D%3D&l=202208011436480102122022031A0527F6', 'https://v.douyin.com/2ymrWGk/', '0', 'zybcome', '2022-08-01 14:36:49', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (96, '218.28.225.114', 'https://v9.douyinvod.com/6e675124a2673209acf79eada4009965/62e782f4/video/tos/cn/tos-cn-ve-15c001-alinc2/7c44fe0e4dae481da2bc4c43c125b18a/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=644&bt=644&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_smzg5XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=aDdlNjdnM2k8OjZlOzZlZUBpamRmNzQ6ZnNwZTMzNGkzM0AuMjUwMjZeNl4xYzRgYzVhYSNmXy1hcjRvXjVgLS1kLTBzcw%3D%3D&l=2022080114380701020816510421001055', 'https://v.douyin.com/2ymrWGk/', '0', 'zybcome', '2022-08-01 14:38:07', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (97, '127.0.0.1', 'https://v26.douyinvod.com/b92ccda7796a306e4be174e87ad683cd/62e786d5/video/tos/cn/tos-cn-ve-15c001-alinc2/7c44fe0e4dae481da2bc4c43c125b18a/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=644&bt=644&btag=80000&cs=0&ds=3&ft=GYTg38VVyw3CRKm80mo~xj7ScoAwHXO_yKaVJExq4UD0PD&mime_type=video_mp4&qs=0&rc=aDdlNjdnM2k8OjZlOzZlZUBpamRmNzQ6ZnNwZTMzNGkzM0AuMjUwMjZeNl4xYzRgYzVhYSNmXy1hcjRvXjVgLS1kLTBzcw%3D%3D&l=202208011454400102080372050E0174A7', 'https://v.douyin.com/2ymrWGk/', '0', 'zybcome', '2022-08-01 14:54:41', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (98, '127.0.0.1', 'https://v26.douyinvod.com/ef9adf3b4eb0d603fd380372a881327c/62e78890/video/tos/cn/tos-cn-ve-15c001-alinc2/7c44fe0e4dae481da2bc4c43c125b18a/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=644&bt=644&btag=80000&cs=0&ds=3&ft=GYTg38VVyw3CRKm80mo~xj7ScoAwHX3FyKaVJExq4UD0PD&mime_type=video_mp4&qs=0&rc=aDdlNjdnM2k8OjZlOzZlZUBpamRmNzQ6ZnNwZTMzNGkzM0AuMjUwMjZeNl4xYzRgYzVhYSNmXy1hcjRvXjVgLS1kLTBzcw%3D%3D&l=2022080115020201021209922624021226', 'https://v.douyin.com/2ymrWGk/', '0', 'zybcome', '2022-08-01 15:02:03', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (99, '127.0.0.1', 'https://v26.douyinvod.com/f5a2947cab0e26963b558d8166d0e64d/62e78bb6/video/tos/cn/tos-cn-ve-15-alinc2/6409c12b143d45dc89afdd4f54f10ed5/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=763&bt=763&btag=80000&cs=0&ds=3&ft=GYTg38VVyw3CRKm80mo~xj7ScoAwHXGuyKaVJExq4UD0PD&mime_type=video_mp4&qs=0&rc=NTk5ZWkzN2U5PDpoaTdpNEBpanNsa2k6ZmdmOjMzNGkzM0BiXy5iNGIvNS4xNi1jLTEvYSNvXjZkcjQwZmdgLS1kLS9zcw%3D%3D&l=2022080115152601020914813247033D14', '0.79 FHI:/ 你是不是屌丝，一试就知道%艾特你想艾特的人 %内容过于真实 @DOU+小助手  https://v.douyin.com/L8xweUj/ 复制此链接，打开Dou音搜索，直接观看视频！', '0', 'zybcome', '2022-08-01 15:15:27', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (100, '127.0.0.1', 'https://v1.douyinvod.com/0ac34b0fcfbe0754eb0c02f86cf5cfeb/62e78cb9/video/tos/cn/tos-cn-ve-15c001-alinc2/577323753e704bb497248347830f8f1c/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=712&bt=712&btag=80000&cs=0&ds=3&ft=GYTg38VVyw3CRKm80mo~xj7ScoAwHXDLyKaVJExq4UD0PD&mime_type=video_mp4&qs=0&rc=NWc0Ojg0MzdmOjZmPDRmOkBpajxwPGk6ZnV3ZTMzNGkzM0AtYzZeLWIvXmIxMWJgXzJgYSNtNjNhcjRnYDVgLS1kLS9zcw%3D%3D&l=202208011519220102081051392503913B', '9.97 RkP:/ 复制打开抖音，看看【涵笑半步癫的作品】# 画线救救火柴人 # 画线火柴人 # 火柴人 https://v.douyin.com/26oQ7SA/', '0', 'zybcome', '2022-08-01 15:19:23', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (101, '218.28.225.114', 'https://v26.douyinvod.com/752766b50015e124e19262aef45c41f5/62e7abd4/video/tos/cn/tos-cn-ve-15c001-alinc2/7c44fe0e4dae481da2bc4c43c125b18a/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=644&bt=644&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_s1DO5XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=aDdlNjdnM2k8OjZlOzZlZUBpamRmNzQ6ZnNwZTMzNGkzM0AuMjUwMjZeNl4xYzRgYzVhYSNmXy1hcjRvXjVgLS1kLTBzcw%3D%3D&l=20220801173231010212039012200DF359', '4.66 foq:/ 复制打开抖音，看看【阳光很温柔的作品】不知道是哪里出了问题，总感觉自己不是很能融入到他们... https://v.douyin.com/2ymrWGk/', '0', 'zybcome', '2022-08-01 17:32:32', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (102, '218.28.225.114', 'https://v27.douyinvod.com/309c45654745d2db1c3a69a628c3c788/62e7abf3/video/tos/cn/tos-cn-ve-15c001-alinc2/7c44fe0e4dae481da2bc4c43c125b18a/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=644&bt=644&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_s.aO5XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=aDdlNjdnM2k8OjZlOzZlZUBpamRmNzQ6ZnNwZTMzNGkzM0AuMjUwMjZeNl4xYzRgYzVhYSNmXy1hcjRvXjVgLS1kLTBzcw%3D%3D&l=20220801173302010204057100350E10EC', '4.66 foq:/ 复制打开抖音，看看【阳光很温柔的作品】不知道是哪里出了问题，总感觉自己不是很能融入到他们... https://v.douyin.com/2ymrWGk/', '0', 'zybcome', '2022-08-01 17:33:03', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (103, '218.28.225.114', 'https://v3-z.douyinvod.com/332a7fbea3d6b8b1a9d5b15b54db4d10/62e7ac91/video/tos/cn/tos-cn-ve-15c001-alinc2/7ca1532a1eac48d7a52a7813c23ba14d/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=718&bt=718&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sn~O5XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=OWdmOzZkNmU8PDo0OzM8NEBpajtxcTg6ZmYzZTMzNGkzM0A0LjBeLjM0Xl8xYTIxXy42YSNgMmVpcjRvcjZgLS1kLWFzcw%3D%3D&l=20220801173515010208073131200E0560', '1.00 HIv:/ 复制打开抖音，看看【大猫游戏队长的作品】# 画线救救火柴人 # 画线火柴人 # 火柴人 # 学生党... https://v.douyin.com/26oxyUK/', '0', 'zybcome', '2022-08-01 17:35:16', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (104, '218.28.225.114', 'https://v83-016.douyinvod.com/a6f3996c5a1eb84b59560d05593fdd1c/62e7affb/video/tos/cn/tos-cn-ve-15-alinc2/f55e06d7e0234a3bb6fe5b7613e29d4f/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=1525&bt=1525&btag=80001&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_s7lH5XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=ODU8ZTZpNTQ0aGY0OTloNUBpanZnNjQ6ZnYzOTMzNGkzM0AtNi4wNDAxNjExM2MuNTYwYSM1NmgycjRvMGVgLS1kLS9zcw%3D%3D&l=20220801174246010208102081470FE6B7', '0.76 Jvs:/ 带大家瞅瞅最舒适的法拉利跑车%法拉利罗马 %法拉利 %王稳健   https://v.douyin.com/LSebgqS/ 复制此链接，打开Dou音搜索，直接观看视频！', '0', 'zybcome', '2022-08-01 17:42:46', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (105, '218.28.225.114', 'https://v83-016.douyinvod.com/0abe26b0535115072e5d62a0546b93d9/62e7b06e/video/tos/cn/tos-cn-ve-15c001-alinc2/7ca1532a1eac48d7a52a7813c23ba14d/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=718&bt=718&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sV3H5XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=OWdmOzZkNmU8PDo0OzM8NEBpajtxcTg6ZmYzZTMzNGkzM0A0LjBeLjM0Xl8xYTIxXy42YSNgMmVpcjRvcjZgLS1kLWFzcw%3D%3D&l=2022080117514401020812109343104645', '1.00 HIv:/ 复制打开抖音，看看【大猫游戏队长的作品】# 画线救救火柴人 # 画线火柴人 # 火柴人 # 学生党... https://v.douyin.com/26oxyUK/', '0', 'zybcome', '2022-08-01 17:51:45', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (106, '127.0.0.1', 'http://v6-ppx.ixigua.com/e5a15267e8a3dcd70f981c0085cb946a/62e7b224/video/tos/cn/tos-cn-ve-0076/9a0d19223a8c49e89be0d1b18d691de7/?a=1319\\u0026ch=0\\u0026cr=0\\u0026dr=6\\u0026cd=0%7C0%7C0%7C0\\u0026cv=1\\u0026br=776\\u0026bt=776\\u0026cs=0\\u0026ds=6\\u0026eid=2048\\u0026ft=e-KGN22Hj4u9GyB8yqsQ1-C5qSYNAmXEDtGjWKv8yq8\\u0026mime_type=video_mp4\\u0026qs=0\\u0026rc=OTM3aWQ1Ojc6PGUzaDQ1NUBpajlzaTQ6ZnFwPDMzNGYzM0AtMy0yNjZiXi8xNjBiMzIwYSNsMGM0cjRvZTZgLS1kMTBzcw%3D%3D\\u0026l=202208011758120101351620491800A6CE', 'https://h5.pipix.com/s/27Vc8Ph/', '0', 'zybcome', '2022-08-01 17:58:13', '', NULL, '皮皮虾');
INSERT INTO `sys_analysis` VALUES (107, '127.0.0.1', 'http://v6-ppx.ixigua.com/2dbb83d392e7bc1126ba58daddea508b/62e7b35d/video/tos/cn/tos-cn-ve-0076/9a0d19223a8c49e89be0d1b18d691de7/?a=1319\\u0026ch=0\\u0026cr=0\\u0026dr=6\\u0026cd=0%7C0%7C0%7C0\\u0026cv=1\\u0026br=776\\u0026bt=776\\u0026cs=0\\u0026ds=6\\u0026eid=2048\\u0026ft=e-KGN22Hj4u9GyB8yqsQ1-C5qSYKMmXEDtGjWKv8yq8\\u0026mime_type=video_mp4\\u0026qs=0\\u0026rc=OTM3aWQ1Ojc6PGUzaDQ1NUBpajlzaTQ6ZnFwPDMzNGYzM0AtMy0yNjZiXi8xNjBiMzIwYSNsMGM0cjRvZTZgLS1kMTBzcw%3D%3D\\u0026l=202208011803250101310570681D0121CF', 'https://h5.pipix.com/s/27Vc8Ph/', '0', 'zybcome', '2022-08-01 18:03:26', '', NULL, '皮皮虾');
INSERT INTO `sys_analysis` VALUES (108, '218.28.225.114', 'http://v3-ppx.ixigua.com/d3a703b37d8645499d201f6b119be4de/62e7b3ed/video/tos/cn/tos-cn-ve-0076/9a0d19223a8c49e89be0d1b18d691de7/?a=1319\\u0026ch=0\\u0026cr=0\\u0026dr=6\\u0026cd=0%7C0%7C0%7C0\\u0026cv=1\\u0026br=776\\u0026bt=776\\u0026cs=0\\u0026ds=6\\u0026eid=2048\\u0026ft=b_XcommnPEC2Th7ThWwUx1D7.cHC~sbcIWDIn\\u0026mime_type=video_mp4\\u0026qs=0\\u0026rc=OTM3aWQ1Ojc6PGUzaDQ1NUBpajlzaTQ6ZnFwPDMzNGYzM0AtMy0yNjZiXi8xNjBiMzIwYSNsMGM0cjRvZTZgLS1kMTBzcw%3D%3D\\u0026l=20220801180549010133034021070131BF', 'https://h5.pipix.com/s/27Vc8Ph/', '0', 'zybcome', '2022-08-01 18:05:49', '', NULL, '皮皮虾');
INSERT INTO `sys_analysis` VALUES (109, '218.28.225.114', 'http://v3-ppx.ixigua.com/0139e5b7fc708ed20f6cbd8eca61ed3a/62e7b53b/video/tos/cn/tos-cn-ve-0076/9a0d19223a8c49e89be0d1b18d691de7/?a=1319\\u0026ch=0\\u0026cr=0\\u0026dr=6\\u0026cd=0%7C0%7C0%7C0\\u0026cv=1\\u0026br=776\\u0026bt=776\\u0026cs=0\\u0026ds=6\\u0026eid=2048\\u0026ft=b_XcommnPEC2Th7ThWwUxAA7.cHC~sbcIWDIn\\u0026mime_type=video_mp4\\u0026qs=0\\u0026rc=OTM3aWQ1Ojc6PGUzaDQ1NUBpajlzaTQ6ZnFwPDMzNGYzM0AtMy0yNjZiXi8xNjBiMzIwYSNsMGM0cjRvZTZgLS1kMTBzcw%3D%3D\\u0026l=20220801181123010140205171100131F8', 'https://h5.pipix.com/s/27Vc8Ph/', '0', 'zybcome', '2022-08-01 18:11:24', '', NULL, '皮皮虾');
INSERT INTO `sys_analysis` VALUES (110, '106.34.179.21', 'https://v9.douyinvod.com/716ce5576d9a2dc95e7ea949c77632e3/62e7b69f/video/tos/cn/tos-cn-ve-15c001-alinc2/0af290a9d67a4e9a809ce796e2bf2466/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=1832&bt=1832&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_srAH5XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=Nzk1OWZpN2Y6Mzw8NjNoM0BpMzd4azc6ZndsZTMzNGkzM0AyYDUyNDYxXzIxLzIvMTExYSM1aG80cjQwbGZgLS1kLS9zcw%3D%3D&l=202208011818440102040570692B129B0D', 'https://v.douyin.com/2nfTYKp/', '0', '', '2022-08-01 18:18:44', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (111, '182.118.239.29', '错误', '3.53 xse:/ 复制打开抖音，看看【晚风千千的图文作品】# ootd穿搭 # 做个酷girl https://v.douyin.com/MhJVYnG/', '0', '', '2022-10-15 10:59:43', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (112, '182.119.37.9', '错误', 'https://v.douyin.com/M7rCSya/', '0', 'zybcome', '2022-11-02 20:26:28', '', NULL, '抖音');
INSERT INTO `sys_analysis` VALUES (113, '182.119.37.9', '错误', 'https://v.douyin.com/M7kA3p1/', '0', 'zybcome', '2022-11-02 20:27:59', '', NULL, '抖音');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2021-12-07 09:47:11', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2021-12-07 09:47:11', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-12-07 09:47:11', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaOnOff', 'true', 'Y', 'admin', '2021-12-07 09:47:11', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2021-12-07 09:47:11', '', NULL, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '订单管理系统', 0, 'zybcome', '15888888888', '944416588@qq.com', '0', '0', 'admin', '2021-12-07 09:47:11', 'admin', '2021-12-07 10:46:55');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-07 09:47:11', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-07 09:47:11', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-07 09:47:11', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-07 09:47:11', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-07 09:47:11', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-07 09:47:11', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-07 09:47:11', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-07 09:47:11', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-07 09:47:11', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-12-07 09:47:11', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-12-07 09:47:11', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-12-07 09:47:11', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-12-07 09:47:11', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-12-07 09:47:11', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-12-07 09:47:11', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-12-07 09:47:11', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-12-07 09:47:11', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-12-07 09:47:11', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-12-07 09:47:11', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-12-07 09:47:11', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-12-07 09:47:11', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-12-07 09:47:11', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-12-07 09:47:11', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-12-07 09:47:11', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-12-07 09:47:11', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-12-07 09:47:11', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-12-07 09:47:11', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-12-07 09:47:11', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-12-07 09:47:11', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-12-07 09:47:11', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-12-07 09:47:11', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-12-07 09:47:11', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-12-07 09:47:11', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-12-07 09:47:11', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-12-07 09:47:11', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-12-07 09:47:11', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-12-07 09:47:11', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2021-12-07 09:47:11', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2021-12-07 09:47:11', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2021-12-07 09:47:11', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2021-12-07 09:47:11', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2021-12-07 09:47:11', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2021-12-07 09:47:11', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2021-12-07 09:47:11', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2021-12-07 09:47:11', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2021-12-07 09:47:11', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2021-12-07 09:47:11', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2021-12-07 09:47:11', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 415 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'superadmin', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-12-07 10:17:11');
INSERT INTO `sys_logininfor` VALUES (101, 'superadmin', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '1', '登录用户：superadmin 不存在', '2021-12-07 10:19:34');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2021-12-07 10:19:47');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-07 10:21:05');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-12-07 10:21:57');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-07 10:22:00');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-07 10:45:14');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-07 11:05:44');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-07 11:42:09');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-07 14:06:44');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-07 14:08:59');
INSERT INTO `sys_logininfor` VALUES (111, 'superadmin', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-03-07 16:03:50');
INSERT INTO `sys_logininfor` VALUES (112, 'superadmin', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-03-07 16:07:35');
INSERT INTO `sys_logininfor` VALUES (113, '944416588@qq.com', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '注册成功', '2022-03-07 17:50:28');
INSERT INTO `sys_logininfor` VALUES (114, '944416588@qq.com', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-07 17:50:41');
INSERT INTO `sys_logininfor` VALUES (115, '944416588@qq.com', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-07 17:55:29');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-03-07 17:55:41');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-07 17:55:56');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-07 18:01:14');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-07 18:01:17');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-07 18:02:34');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-07 18:02:38');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-07 18:02:51');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-08 17:25:49');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-08 17:26:02');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 09:23:09');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-09 09:26:15');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 09:26:19');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-09 09:42:38');
INSERT INTO `sys_logininfor` VALUES (129, 'zybcome', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '注册成功', '2022-03-09 09:43:20');
INSERT INTO `sys_logininfor` VALUES (130, 'zybcome', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '1', '图片验证码错误', '2022-03-09 09:43:30');
INSERT INTO `sys_logininfor` VALUES (131, 'zybcome', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 09:43:34');
INSERT INTO `sys_logininfor` VALUES (132, 'zybcome', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-09 09:45:36');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-03-09 09:47:34');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '1', '图片验证码错误', '2022-03-09 09:47:39');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '1', '图片验证码错误', '2022-03-09 09:47:43');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 09:47:46');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-09 10:00:46');
INSERT INTO `sys_logininfor` VALUES (138, 'zybcome', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '注册成功', '2022-03-09 10:02:10');
INSERT INTO `sys_logininfor` VALUES (139, 'zybcome', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '注册成功', '2022-03-09 10:07:42');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 10:08:11');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-09 10:14:27');
INSERT INTO `sys_logininfor` VALUES (142, 'zybcome', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '注册成功', '2022-03-09 10:14:55');
INSERT INTO `sys_logininfor` VALUES (143, 'zybcome', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '注册成功', '2022-03-09 11:01:17');
INSERT INTO `sys_logininfor` VALUES (144, 'zybcome', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 11:06:01');
INSERT INTO `sys_logininfor` VALUES (145, 'zybcome', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 11:11:32');
INSERT INTO `sys_logininfor` VALUES (146, 'zybcome', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-09 11:11:55');
INSERT INTO `sys_logininfor` VALUES (147, 'zybcome', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 11:11:58');
INSERT INTO `sys_logininfor` VALUES (148, 'zybcome', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-09 11:12:37');
INSERT INTO `sys_logininfor` VALUES (149, 'zybcome', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 11:12:42');
INSERT INTO `sys_logininfor` VALUES (150, 'zybcome', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-09 11:17:37');
INSERT INTO `sys_logininfor` VALUES (151, 'zybcome', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 11:17:41');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 17:11:35');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 17:13:13');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 17:14:17');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 17:15:28');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '图片验证码错误', '2022-03-09 17:16:49');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '图片验证码错误', '2022-03-09 17:16:49');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '图片验证码错误', '2022-03-09 17:16:49');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '图片验证码错误', '2022-03-09 17:16:50');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '图片验证码错误', '2022-03-09 17:16:50');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '图片验证码错误', '2022-03-09 17:16:50');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '图片验证码错误', '2022-03-09 17:16:50');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '图片验证码错误', '2022-03-09 17:16:53');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 17:16:57');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 17:17:51');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '图片验证码错误', '2022-03-09 17:23:08');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 17:23:12');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 17:24:45');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 17:25:16');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 17:25:31');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 17:37:51');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 18:03:15');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 18:05:06');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 18:06:17');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-09 18:06:59');
INSERT INTO `sys_logininfor` VALUES (176, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-10 09:18:00');
INSERT INTO `sys_logininfor` VALUES (177, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-10 09:29:11');
INSERT INTO `sys_logininfor` VALUES (178, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-10 09:58:46');
INSERT INTO `sys_logininfor` VALUES (179, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-10 10:00:15');
INSERT INTO `sys_logininfor` VALUES (180, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-10 10:06:00');
INSERT INTO `sys_logininfor` VALUES (181, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-10 10:06:43');
INSERT INTO `sys_logininfor` VALUES (182, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-10 10:07:31');
INSERT INTO `sys_logininfor` VALUES (183, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-10 10:08:26');
INSERT INTO `sys_logininfor` VALUES (184, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-10 10:25:54');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-10 10:56:37');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-10 10:59:59');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-10 11:05:32');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-10 11:06:28');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-10 11:07:56');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '图片验证码错误', '2022-03-10 11:28:16');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-10 11:28:19');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-10 14:14:56');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-10 14:15:11');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-10 14:54:07');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '图片验证码错误', '2022-03-10 14:58:46');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-10 14:58:49');
INSERT INTO `sys_logininfor` VALUES (197, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-10 14:59:02');
INSERT INTO `sys_logininfor` VALUES (198, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '注册成功', '2022-03-10 17:32:00');
INSERT INTO `sys_logininfor` VALUES (199, 'zybcom', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '注册成功', '2022-03-10 17:33:06');
INSERT INTO `sys_logininfor` VALUES (200, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '注册成功', '2022-03-10 17:35:48');
INSERT INTO `sys_logininfor` VALUES (201, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '注册成功', '2022-03-10 17:40:54');
INSERT INTO `sys_logininfor` VALUES (202, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '注册成功', '2022-03-10 17:45:42');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-10 17:56:01');
INSERT INTO `sys_logininfor` VALUES (204, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '注册成功', '2022-03-11 09:20:02');
INSERT INTO `sys_logininfor` VALUES (205, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-11 09:20:15');
INSERT INTO `sys_logininfor` VALUES (206, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '注册成功', '2022-03-11 09:21:01');
INSERT INTO `sys_logininfor` VALUES (207, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '登录用户：zybcome 不存在', '2022-03-11 09:54:20');
INSERT INTO `sys_logininfor` VALUES (208, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '登录用户：zybcome 不存在', '2022-03-11 09:55:05');
INSERT INTO `sys_logininfor` VALUES (209, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '登录用户：zybcome 不存在', '2022-03-11 09:55:54');
INSERT INTO `sys_logininfor` VALUES (210, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '注册成功', '2022-03-11 09:56:28');
INSERT INTO `sys_logininfor` VALUES (211, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-11 09:56:35');
INSERT INTO `sys_logininfor` VALUES (212, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-11 10:03:13');
INSERT INTO `sys_logininfor` VALUES (213, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-11 10:04:56');
INSERT INTO `sys_logininfor` VALUES (214, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-11 10:05:09');
INSERT INTO `sys_logininfor` VALUES (215, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-11 10:18:09');
INSERT INTO `sys_logininfor` VALUES (216, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-11 10:22:50');
INSERT INTO `sys_logininfor` VALUES (217, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-11 10:23:13');
INSERT INTO `sys_logininfor` VALUES (218, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-11 10:23:33');
INSERT INTO `sys_logininfor` VALUES (219, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-11 10:27:05');
INSERT INTO `sys_logininfor` VALUES (220, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-11 10:27:24');
INSERT INTO `sys_logininfor` VALUES (221, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-11 10:29:27');
INSERT INTO `sys_logininfor` VALUES (222, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-11 10:33:06');
INSERT INTO `sys_logininfor` VALUES (223, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-11 10:35:49');
INSERT INTO `sys_logininfor` VALUES (224, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-11 10:36:41');
INSERT INTO `sys_logininfor` VALUES (225, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-11 10:43:56');
INSERT INTO `sys_logininfor` VALUES (226, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-11 10:45:06');
INSERT INTO `sys_logininfor` VALUES (227, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-11 10:45:44');
INSERT INTO `sys_logininfor` VALUES (228, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-11 10:46:51');
INSERT INTO `sys_logininfor` VALUES (229, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-11 11:04:21');
INSERT INTO `sys_logininfor` VALUES (230, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-11 11:04:31');
INSERT INTO `sys_logininfor` VALUES (231, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-11 11:04:33');
INSERT INTO `sys_logininfor` VALUES (232, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-11 11:05:08');
INSERT INTO `sys_logininfor` VALUES (233, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-11 11:05:10');
INSERT INTO `sys_logininfor` VALUES (234, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-11 11:05:31');
INSERT INTO `sys_logininfor` VALUES (235, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-11 11:05:36');
INSERT INTO `sys_logininfor` VALUES (236, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-11 11:05:48');
INSERT INTO `sys_logininfor` VALUES (237, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-11 11:05:58');
INSERT INTO `sys_logininfor` VALUES (238, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-11 14:47:19');
INSERT INTO `sys_logininfor` VALUES (239, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-11 15:26:49');
INSERT INTO `sys_logininfor` VALUES (240, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-11 15:27:18');
INSERT INTO `sys_logininfor` VALUES (241, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-03-11 16:09:02');
INSERT INTO `sys_logininfor` VALUES (242, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-11 16:09:07');
INSERT INTO `sys_logininfor` VALUES (243, 'zybcome', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-11 16:09:25');
INSERT INTO `sys_logininfor` VALUES (244, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-11 16:18:21');
INSERT INTO `sys_logininfor` VALUES (245, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-03-11 16:18:25');
INSERT INTO `sys_logininfor` VALUES (246, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-11 16:18:31');
INSERT INTO `sys_logininfor` VALUES (247, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-11 16:19:49');
INSERT INTO `sys_logininfor` VALUES (248, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-11 16:19:52');
INSERT INTO `sys_logininfor` VALUES (249, 'zybcome', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-11 16:20:36');
INSERT INTO `sys_logininfor` VALUES (250, 'admin', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-11 16:20:42');
INSERT INTO `sys_logininfor` VALUES (251, 'admin', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-11 16:21:37');
INSERT INTO `sys_logininfor` VALUES (252, 'admin', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-11 16:21:39');
INSERT INTO `sys_logininfor` VALUES (253, 'admin', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-11 16:26:07');
INSERT INTO `sys_logininfor` VALUES (254, 'admin', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '1', '图片验证码错误', '2022-03-11 16:26:11');
INSERT INTO `sys_logininfor` VALUES (255, 'admin', '192.168.20.36', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-11 16:26:13');
INSERT INTO `sys_logininfor` VALUES (256, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-11 16:34:35');
INSERT INTO `sys_logininfor` VALUES (257, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-11 16:39:22');
INSERT INTO `sys_logininfor` VALUES (258, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-11 17:03:54');
INSERT INTO `sys_logininfor` VALUES (259, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-11 17:11:15');
INSERT INTO `sys_logininfor` VALUES (260, 'admin', '218.28.225.114', 'XX XX', 'Chrome 9', 'Windows 10', '1', '图片验证码错误', '2022-03-14 11:26:10');
INSERT INTO `sys_logininfor` VALUES (261, 'admin', '218.28.225.114', 'XX XX', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-14 11:26:13');
INSERT INTO `sys_logininfor` VALUES (262, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-14 11:49:22');
INSERT INTO `sys_logininfor` VALUES (263, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 9', 'Windows 10', '1', '图片验证码错误', '2022-03-14 13:58:41');
INSERT INTO `sys_logininfor` VALUES (264, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-14 13:58:44');
INSERT INTO `sys_logininfor` VALUES (265, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-14 14:01:12');
INSERT INTO `sys_logininfor` VALUES (266, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-14 14:01:18');
INSERT INTO `sys_logininfor` VALUES (267, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-14 14:01:24');
INSERT INTO `sys_logininfor` VALUES (268, 'superadmin', '218.28.225.114', 'XX XX', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-14 14:09:01');
INSERT INTO `sys_logininfor` VALUES (269, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-14 14:15:32');
INSERT INTO `sys_logininfor` VALUES (270, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-14 14:15:36');
INSERT INTO `sys_logininfor` VALUES (271, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-14 14:19:46');
INSERT INTO `sys_logininfor` VALUES (272, 'chen', '120.194.6.133', 'XX XX', 'Chrome Mobile', 'Android 1.x', '1', '图片验证码错误', '2022-03-14 14:20:43');
INSERT INTO `sys_logininfor` VALUES (273, 'chen', '120.194.6.133', 'XX XX', 'Chrome Mobile', 'Android 1.x', '1', '图片验证码错误', '2022-03-14 14:21:14');
INSERT INTO `sys_logininfor` VALUES (274, 'chen', '120.194.6.133', 'XX XX', 'Chrome Mobile', 'Android 1.x', '0', '注册成功', '2022-03-14 14:24:02');
INSERT INTO `sys_logininfor` VALUES (275, 'chen', '120.194.6.133', 'XX XX', 'Chrome Mobile', 'Android 1.x', '1', '用户不存在/密码错误', '2022-03-14 14:24:39');
INSERT INTO `sys_logininfor` VALUES (276, 'chen', '120.194.6.133', 'XX XX', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2022-03-14 14:24:53');
INSERT INTO `sys_logininfor` VALUES (277, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-14 15:27:17');
INSERT INTO `sys_logininfor` VALUES (278, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-14 16:20:07');
INSERT INTO `sys_logininfor` VALUES (279, 'superadmin', '218.28.225.114', 'XX XX', 'Chrome 9', 'Windows 10', '1', '图片验证码错误', '2022-03-14 16:22:03');
INSERT INTO `sys_logininfor` VALUES (280, 'superadmin', '218.28.225.114', 'XX XX', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-14 16:22:05');
INSERT INTO `sys_logininfor` VALUES (281, 'chen', '115.158.64.117', 'XX XX', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2022-03-14 16:22:14');
INSERT INTO `sys_logininfor` VALUES (282, 'superamdin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '登录用户：superamdin 不存在', '2022-03-14 16:31:23');
INSERT INTO `sys_logininfor` VALUES (283, 'amdin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '登录用户：amdin 不存在', '2022-03-14 16:31:28');
INSERT INTO `sys_logininfor` VALUES (284, 'superadmin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-14 16:31:36');
INSERT INTO `sys_logininfor` VALUES (285, 'superadmin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-14 16:40:15');
INSERT INTO `sys_logininfor` VALUES (286, 'superadmin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-03-14 16:40:25');
INSERT INTO `sys_logininfor` VALUES (287, 'superadmin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-03-14 16:40:34');
INSERT INTO `sys_logininfor` VALUES (288, 'superadmin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-03-14 16:40:42');
INSERT INTO `sys_logininfor` VALUES (289, 'superadmin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '图片验证码错误', '2022-03-14 16:40:56');
INSERT INTO `sys_logininfor` VALUES (290, 'superadmin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-03-14 16:40:59');
INSERT INTO `sys_logininfor` VALUES (291, 'superadmin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-14 16:41:22');
INSERT INTO `sys_logininfor` VALUES (292, 'superadmin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-14 16:42:50');
INSERT INTO `sys_logininfor` VALUES (293, 'superadmin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-14 16:42:57');
INSERT INTO `sys_logininfor` VALUES (294, 'superadmin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-14 16:43:26');
INSERT INTO `sys_logininfor` VALUES (295, 'superadmin', '218.28.225.114', 'XX XX', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-14 16:48:37');
INSERT INTO `sys_logininfor` VALUES (296, 'superadmin', '218.28.225.114', 'XX XX', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-14 16:48:45');
INSERT INTO `sys_logininfor` VALUES (297, 'superadmin', '218.28.225.114', 'XX XX', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-14 16:48:49');
INSERT INTO `sys_logininfor` VALUES (298, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 9', 'Windows 10', '1', '图片验证码错误', '2022-03-14 16:48:55');
INSERT INTO `sys_logininfor` VALUES (299, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-03-14 16:48:59');
INSERT INTO `sys_logininfor` VALUES (300, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-14 16:49:03');
INSERT INTO `sys_logininfor` VALUES (301, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-14 16:50:08');
INSERT INTO `sys_logininfor` VALUES (302, 'superadmin', '122.114.164.206', 'XX XX', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-15 16:56:35');
INSERT INTO `sys_logininfor` VALUES (303, 'admin', '122.114.164.206', 'XX XX', 'Chrome 9', 'Windows 10', '1', '登录用户：admin 不存在', '2022-03-16 10:21:13');
INSERT INTO `sys_logininfor` VALUES (304, 'superadmin', '122.114.164.206', 'XX XX', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-16 10:21:23');
INSERT INTO `sys_logininfor` VALUES (305, 'superadmin', '122.114.164.206', 'XX XX', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-16 10:21:32');
INSERT INTO `sys_logininfor` VALUES (306, 'zybcome', '122.114.164.206', 'XX XX', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-03-16 10:21:38');
INSERT INTO `sys_logininfor` VALUES (307, 'zybcome', '122.114.164.206', 'XX XX', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-16 10:21:45');
INSERT INTO `sys_logininfor` VALUES (308, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-03-16 14:57:52');
INSERT INTO `sys_logininfor` VALUES (309, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-03-16 14:57:57');
INSERT INTO `sys_logininfor` VALUES (310, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '登录用户：admin 不存在', '2022-03-16 14:58:04');
INSERT INTO `sys_logininfor` VALUES (311, 'superadmin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-16 14:58:14');
INSERT INTO `sys_logininfor` VALUES (312, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-03-16 15:11:47');
INSERT INTO `sys_logininfor` VALUES (313, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-16 15:11:51');
INSERT INTO `sys_logininfor` VALUES (314, 'zybcome', '182.118.238.18', 'XX XX', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2022-03-16 15:30:52');
INSERT INTO `sys_logininfor` VALUES (315, 'superadmin', '218.28.225.114', 'XX XX', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-16 16:07:49');
INSERT INTO `sys_logininfor` VALUES (316, 'superadmin', '218.28.225.114', 'XX XX', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-19 16:54:26');
INSERT INTO `sys_logininfor` VALUES (317, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-22 15:58:41');
INSERT INTO `sys_logininfor` VALUES (318, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-03-22 15:58:45');
INSERT INTO `sys_logininfor` VALUES (319, 'superadmin', '218.28.225.114', 'XX XX', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-22 16:04:18');
INSERT INTO `sys_logininfor` VALUES (320, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-22 16:47:16');
INSERT INTO `sys_logininfor` VALUES (321, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-03-29 18:02:58');
INSERT INTO `sys_logininfor` VALUES (322, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-29 18:03:07');
INSERT INTO `sys_logininfor` VALUES (323, 'superadmin', '218.28.225.114', 'XX XX', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-03-31 11:20:17');
INSERT INTO `sys_logininfor` VALUES (324, 'superadmin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-06 15:33:45');
INSERT INTO `sys_logininfor` VALUES (325, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-06 15:35:54');
INSERT INTO `sys_logininfor` VALUES (326, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-07 16:37:50');
INSERT INTO `sys_logininfor` VALUES (327, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2022-04-07 18:08:19');
INSERT INTO `sys_logininfor` VALUES (328, 'superadmin', '218.28.225.114', 'XX XX', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-08 11:10:53');
INSERT INTO `sys_logininfor` VALUES (329, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-04-08 11:16:11');
INSERT INTO `sys_logininfor` VALUES (330, 'superadmin', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-12 09:08:30');
INSERT INTO `sys_logininfor` VALUES (331, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2022-04-16 16:39:44');
INSERT INTO `sys_logininfor` VALUES (332, 'superadmin', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-04-16 18:08:52');
INSERT INTO `sys_logininfor` VALUES (333, '17703721217', '123.161.49.230', 'XX XX', 'Chrome 8', 'Windows 7', '0', '注册成功', '2022-05-15 17:56:10');
INSERT INTO `sys_logininfor` VALUES (334, '17703721217', '123.161.49.230', 'XX XX', 'Chrome 8', 'Windows 7', '0', '登录成功', '2022-05-15 17:56:22');
INSERT INTO `sys_logininfor` VALUES (335, '18838534868', '218.28.225.114', 'XX XX', 'Chrome 8', 'Windows 10', '0', '注册成功', '2022-05-31 17:10:16');
INSERT INTO `sys_logininfor` VALUES (336, '18838534868', '218.28.225.114', 'XX XX', 'Chrome 8', 'Windows 10', '0', '登录成功', '2022-05-31 17:10:31');
INSERT INTO `sys_logininfor` VALUES (337, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-06-08 09:07:02');
INSERT INTO `sys_logininfor` VALUES (338, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-06-08 09:07:09');
INSERT INTO `sys_logininfor` VALUES (339, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-08 09:07:21');
INSERT INTO `sys_logininfor` VALUES (340, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-08 10:03:00');
INSERT INTO `sys_logininfor` VALUES (341, 'superadmin', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-08 11:44:29');
INSERT INTO `sys_logininfor` VALUES (342, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-08 14:12:22');
INSERT INTO `sys_logininfor` VALUES (343, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-06-08 15:16:11');
INSERT INTO `sys_logininfor` VALUES (344, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '1', '图片验证码错误', '2022-06-08 15:16:18');
INSERT INTO `sys_logininfor` VALUES (345, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '1', '图片验证码错误', '2022-06-08 15:16:21');
INSERT INTO `sys_logininfor` VALUES (346, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-06-08 15:16:24');
INSERT INTO `sys_logininfor` VALUES (347, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-08 15:16:53');
INSERT INTO `sys_logininfor` VALUES (348, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-08 15:22:08');
INSERT INTO `sys_logininfor` VALUES (349, 'zybcome', '122.114.164.206', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-13 09:57:47');
INSERT INTO `sys_logininfor` VALUES (350, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-15 15:01:43');
INSERT INTO `sys_logininfor` VALUES (351, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-29 16:43:47');
INSERT INTO `sys_logininfor` VALUES (352, 'admin', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '1', '登录用户：admin 不存在', '2022-06-30 11:06:32');
INSERT INTO `sys_logininfor` VALUES (353, 'superadmin', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-30 11:06:41');
INSERT INTO `sys_logininfor` VALUES (354, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-06-30 11:08:28');
INSERT INTO `sys_logininfor` VALUES (355, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-06-30 11:14:08');
INSERT INTO `sys_logininfor` VALUES (356, 'superadmin', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-09 15:44:19');
INSERT INTO `sys_logininfor` VALUES (357, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-16 09:30:47');
INSERT INTO `sys_logininfor` VALUES (358, 'zybcome', '218.28.225.114', 'XX XX', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2022-07-21 11:32:44');
INSERT INTO `sys_logininfor` VALUES (359, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-21 14:46:15');
INSERT INTO `sys_logininfor` VALUES (360, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-21 16:02:41');
INSERT INTO `sys_logininfor` VALUES (361, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-07-22 09:02:05');
INSERT INTO `sys_logininfor` VALUES (362, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2022-07-22 09:04:01');
INSERT INTO `sys_logininfor` VALUES (363, 'superadmin', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-08-01 09:18:26');
INSERT INTO `sys_logininfor` VALUES (364, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-08-01 11:29:36');
INSERT INTO `sys_logininfor` VALUES (365, 'superadmin', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-08-01 11:30:05');
INSERT INTO `sys_logininfor` VALUES (366, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2022-08-01 11:46:55');
INSERT INTO `sys_logininfor` VALUES (367, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-08-01 11:52:48');
INSERT INTO `sys_logininfor` VALUES (368, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-08-01 14:18:05');
INSERT INTO `sys_logininfor` VALUES (369, 'superadmin', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '1', '图片验证码错误', '2022-08-01 14:42:35');
INSERT INTO `sys_logininfor` VALUES (370, 'superadmin', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-08-01 14:42:38');
INSERT INTO `sys_logininfor` VALUES (371, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-08-01 14:57:56');
INSERT INTO `sys_logininfor` VALUES (372, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-08-01 14:57:58');
INSERT INTO `sys_logininfor` VALUES (373, 'superadmin', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-08-01 16:13:21');
INSERT INTO `sys_logininfor` VALUES (374, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：admin 不存在', '2022-08-01 16:27:44');
INSERT INTO `sys_logininfor` VALUES (375, 'superadmin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-08-01 16:27:55');
INSERT INTO `sys_logininfor` VALUES (376, 'superadmin', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-08-01 16:56:53');
INSERT INTO `sys_logininfor` VALUES (377, 'superadmin', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-08-01 16:57:38');
INSERT INTO `sys_logininfor` VALUES (378, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-08-01 17:32:26');
INSERT INTO `sys_logininfor` VALUES (379, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2022-08-01 17:34:44');
INSERT INTO `sys_logininfor` VALUES (380, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '1', '图片验证码错误', '2022-08-01 17:41:45');
INSERT INTO `sys_logininfor` VALUES (381, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-08-01 17:41:47');
INSERT INTO `sys_logininfor` VALUES (382, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-08-01 17:51:28');
INSERT INTO `sys_logininfor` VALUES (383, 'zybcome', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-08-01 17:54:42');
INSERT INTO `sys_logininfor` VALUES (384, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-08-01 18:04:27');
INSERT INTO `sys_logininfor` VALUES (385, 'superadmin', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-08-01 18:04:55');
INSERT INTO `sys_logininfor` VALUES (386, 'superadmin', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-08-02 11:19:50');
INSERT INTO `sys_logininfor` VALUES (387, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-08-03 14:17:14');
INSERT INTO `sys_logininfor` VALUES (388, 'superadmin', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-08-03 15:13:36');
INSERT INTO `sys_logininfor` VALUES (389, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-08-22 20:01:56');
INSERT INTO `sys_logininfor` VALUES (390, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-08-23 11:52:37');
INSERT INTO `sys_logininfor` VALUES (391, 'superadmin', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-08-30 15:20:17');
INSERT INTO `sys_logininfor` VALUES (392, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-09-06 14:03:08');
INSERT INTO `sys_logininfor` VALUES (393, 'admin', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '1', '登录用户：admin 不存在', '2022-09-24 11:00:05');
INSERT INTO `sys_logininfor` VALUES (394, 'superadmin', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-09-24 11:00:11');
INSERT INTO `sys_logininfor` VALUES (395, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-09-24 14:51:11');
INSERT INTO `sys_logininfor` VALUES (396, 'admin', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '1', '登录用户：admin 不存在', '2022-09-24 15:54:29');
INSERT INTO `sys_logininfor` VALUES (397, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-09-24 15:54:40');
INSERT INTO `sys_logininfor` VALUES (398, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-09-24 15:54:48');
INSERT INTO `sys_logininfor` VALUES (399, 'superadmin', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-09-24 15:54:56');
INSERT INTO `sys_logininfor` VALUES (400, 'admin', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '1', '登录用户：admin 不存在', '2022-09-24 15:59:55');
INSERT INTO `sys_logininfor` VALUES (401, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-09-24 16:00:00');
INSERT INTO `sys_logininfor` VALUES (402, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-09-24 16:23:28');
INSERT INTO `sys_logininfor` VALUES (403, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-09-24 16:56:17');
INSERT INTO `sys_logininfor` VALUES (404, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-09-24 16:57:54');
INSERT INTO `sys_logininfor` VALUES (405, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '1', '图片验证码错误', '2022-09-24 16:57:59');
INSERT INTO `sys_logininfor` VALUES (406, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-09-24 16:58:03');
INSERT INTO `sys_logininfor` VALUES (407, 'zybcome', '198.13.33.140', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-09-24 17:32:37');
INSERT INTO `sys_logininfor` VALUES (408, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-09-24 17:35:23');
INSERT INTO `sys_logininfor` VALUES (409, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-09-24 17:35:25');
INSERT INTO `sys_logininfor` VALUES (410, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-09-24 17:52:29');
INSERT INTO `sys_logininfor` VALUES (411, 'zybcome', '182.119.36.161', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-09-24 20:02:05');
INSERT INTO `sys_logininfor` VALUES (412, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-09-26 09:33:44');
INSERT INTO `sys_logininfor` VALUES (413, 'zybcome', '218.28.225.114', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-09-26 12:41:24');
INSERT INTO `sys_logininfor` VALUES (414, 'zybcome', '182.119.37.9', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-11-02 12:24:45');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2001 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2021-12-07 09:47:11', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2021-12-07 09:47:11', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2021-12-07 09:47:11', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2021-12-07 09:47:11', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2021-12-07 09:47:11', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2021-12-07 09:47:11', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2021-12-07 09:47:11', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2021-12-07 09:47:11', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2021-12-07 09:47:11', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2021-12-07 09:47:11', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2021-12-07 09:47:11', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2021-12-07 09:47:11', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2021-12-07 09:47:11', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2021-12-07 09:47:11', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2021-12-07 09:47:11', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2021-12-07 09:47:11', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2021-12-07 09:47:11', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2021-12-07 09:47:11', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2021-12-07 09:47:11', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2021-12-07 09:47:11', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2021-12-07 09:47:11', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2021-12-07 09:47:11', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2021-12-07 09:47:11', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 7, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '解析管理', 1, 10, 'analysis', 'system/analysis/index', '', 1, 0, 'C', '0', '0', 'system:analysis:list', 'build', 'admin', '2022-03-11 16:16:44', 'admin', '2022-03-11 16:26:58', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2021-12-07 09:47:11', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2021-12-07 09:47:11', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 171 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"订单管理系统\",\"leader\":\"zybcome\",\"deptId\":100,\"orderNum\":\"0\",\"delFlag\":\"0\",\"params\":{},\"parentId\":0,\"createBy\":\"admin\",\"children\":[],\"createTime\":1638841631000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0\",\"email\":\"944416588@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-07 10:46:55');
INSERT INTO `sys_oper_log` VALUES (101, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL, '/system/user/export', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{\"dataScope\":\"\"}}', NULL, 0, NULL, '2022-03-07 11:42:14');
INSERT INTO `sys_oper_log` VALUES (102, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', NULL, '/system/user/resetPwd', '192.168.20.36', '内网IP', '{\"admin\":false,\"password\":\"$2a$10$D8HJo72N9o7fn/xkcBbJj.X0NPkFYpdVd1Mcc2QKwhpu511X4iBvC\",\"updateBy\":\"admin\",\"params\":{},\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-07 18:01:57');
INSERT INTO `sys_oper_log` VALUES (103, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '192.168.20.36', '内网IP', '{\"flag\":false,\"roleId\":100,\"admin\":false,\"params\":{},\"roleSort\":\"3\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"kehu\",\"roleName\":\"客户\",\"deptIds\":[],\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-09 09:30:48');
INSERT INTO `sys_oper_log` VALUES (104, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '192.168.20.36', '内网IP', '{\"roles\":[],\"phonenumber\":\"\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[],\"loginIp\":\"\",\"email\":\"zybcome@sina.com\",\"nickName\":\"zybcome\",\"sex\":\"0\",\"avatar\":\"\",\"params\":{},\"userName\":\"zybcome\",\"userId\":103,\"createBy\":\"\",\"roleIds\":[100],\"createTime\":1646791651000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-09 10:08:27');
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_analysis', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-11 16:09:54');
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"zybcome\",\"columns\":[{\"capJavaField\":\"AnalysisId\",\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"analysisId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"解析ID\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1646986194000,\"tableId\":1,\"pk\":true,\"columnName\":\"analysis_id\"},{\"capJavaField\":\"AnalysisIp\",\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"analysisIp\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"ip地址\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1646986194000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"analysis_ip\"},{\"capJavaField\":\"AnalysisLink\",\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"analysisLink\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"解析连接\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1646986194000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"analysis_link\"},{\"capJavaField\":\"AnalysisText\",\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"analysisText\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"解析文本\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-11 16:11:44');
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-11 16:11:47');
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/sys_analysis', '127.0.0.1', '内网IP', '{tableName=sys_analysis}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-11 16:11:52');
INSERT INTO `sys_oper_log` VALUES (109, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2022-03-11 16:11:53');
INSERT INTO `sys_oper_log` VALUES (110, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"analysis\",\"icon\":\"build\",\"orderNum\":\"10\",\"menuName\":\"解析管理\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"analysis\",\"component\":\"analysis\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"analysis\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-11 16:16:44');
INSERT INTO `sys_oper_log` VALUES (111, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"analysis\",\"icon\":\"build\",\"orderNum\":\"10\",\"menuName\":\"解析管理\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"analysis\",\"component\":\"analysis\",\"children\":[],\"createTime\":1646986604000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"C\",\"perms\":\"system:analysis:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-11 16:17:00');
INSERT INTO `sys_oper_log` VALUES (112, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"analysis\",\"icon\":\"build\",\"orderNum\":\"10\",\"menuName\":\"解析管理\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"analysis\",\"component\":\"system/analysis/index\",\"children\":[],\"createTime\":1646986604000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"C\",\"perms\":\"system:analysis:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-11 16:17:24');
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"analysis\",\"icon\":\"build\",\"orderNum\":\"10\",\"menuName\":\"解析管理\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"analysis\",\"component\":\"system/analysis/index\",\"children\":[],\"createTime\":1646986604000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"C\",\"perms\":\"system:analysis:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-11 16:17:36');
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '192.168.20.36', '内网IP', '{\"visible\":\"0\",\"query\":\"analysis\",\"icon\":\"build\",\"orderNum\":\"10\",\"menuName\":\"解析管理\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"analysis\",\"component\":\"system/analysis/index\",\"children\":[],\"createTime\":1646986604000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"C\",\"perms\":\"system:analysis:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-11 16:21:13');
INSERT INTO `sys_oper_log` VALUES (115, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '192.168.20.36', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1638841631000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2000,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,3,114,115,1055,1056,1058,1057,1059,1060,116,4],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-11 16:21:26');
INSERT INTO `sys_oper_log` VALUES (116, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '192.168.20.36', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"build\",\"orderNum\":\"10\",\"menuName\":\"解析管理\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"analysis\",\"component\":\"system/analysis/index\",\"children\":[],\"createTime\":1646986604000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"C\",\"perms\":\"system:analysis:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-11 16:26:58');
INSERT INTO `sys_oper_log` VALUES (117, '在线用户', 7, 'com.ruoyi.web.controller.monitor.SysUserOnlineController.forceLogout()', 'DELETE', 1, 'superadmin', NULL, '/monitor/online/a728ea2b-4edd-426a-9ee6-5a887aad8c99', '218.28.225.114', 'XX XX', '{tokenId=a728ea2b-4edd-426a-9ee6-5a887aad8c99}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-14 14:25:38');
INSERT INTO `sys_oper_log` VALUES (118, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'superadmin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"15555536670\",\"admin\":true,\"loginDate\":1647246697000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1],\"loginIp\":\"127.0.0.1\",\"email\":\"944416588@qq.com\",\"nickName\":\"zybcome\",\"sex\":\"0\",\"deptId\":103,\"avatar\":\"\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"superadmin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1638841631000,\"status\":\"0\"}', NULL, 1, '不允许操作超级管理员用户', '2022-03-14 16:35:27');
INSERT INTO `sys_oper_log` VALUES (119, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'superadmin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"15555536670\",\"admin\":true,\"loginDate\":1647246697000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1],\"loginIp\":\"127.0.0.1\",\"email\":\"944416588@qq.com\",\"nickName\":\"zybcome\",\"sex\":\"0\",\"deptId\":103,\"avatar\":\"\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"superadmin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1638841631000,\"status\":\"0\"}', NULL, 1, '不允许操作超级管理员用户', '2022-03-14 16:35:29');
INSERT INTO `sys_oper_log` VALUES (120, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'superadmin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"15555536670\",\"admin\":true,\"loginDate\":1647246697000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1],\"loginIp\":\"127.0.0.1\",\"email\":\"944416588@qq.com\",\"nickName\":\"zybcome\",\"sex\":\"0\",\"deptId\":103,\"avatar\":\"\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"superadmin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1638841631000,\"status\":\"0\"}', NULL, 1, '不允许操作超级管理员用户', '2022-03-14 16:35:29');
INSERT INTO `sys_oper_log` VALUES (121, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'superadmin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"15555536670\",\"admin\":true,\"loginDate\":1647246697000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1],\"loginIp\":\"127.0.0.1\",\"email\":\"944416588@qq.com\",\"nickName\":\"zybcome\",\"sex\":\"0\",\"deptId\":103,\"avatar\":\"\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"superadmin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1638841631000,\"status\":\"0\"}', NULL, 1, '不允许操作超级管理员用户', '2022-03-14 16:35:30');
INSERT INTO `sys_oper_log` VALUES (122, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'superadmin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"15555536670\",\"admin\":true,\"loginDate\":1647246697000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1],\"loginIp\":\"127.0.0.1\",\"email\":\"944416588@qq.com\",\"nickName\":\"zybcome\",\"sex\":\"0\",\"deptId\":103,\"avatar\":\"\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"superadmin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1638841631000,\"status\":\"0\"}', NULL, 1, '不允许操作超级管理员用户', '2022-03-14 16:35:36');
INSERT INTO `sys_oper_log` VALUES (123, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'superadmin', NULL, '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"$2a$10$yrHLRkeWUH.e/7VsiMpjOecZc8Tvl6FxU3xJ1wvlrb7iy6lBCMkLW\",\"updateBy\":\"superadmin\",\"params\":{},\"userId\":116}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-03-14 16:39:41');
INSERT INTO `sys_oper_log` VALUES (124, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'superadmin', NULL, '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"$2a$10$gwMliUDCo2kWOtk5414ouOL4scF/0J0x3Bj7tF3EoNIouHOx9Jhc6\",\"updateBy\":\"superadmin\",\"params\":{},\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-14 16:39:52');
INSERT INTO `sys_oper_log` VALUES (125, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'superadmin', NULL, '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"$2a$10$arCLfKhbNQnICDUq9p53rOB8P72btedicdOjFWkvlXKQOpso5LVdu\",\"updateBy\":\"superadmin\",\"params\":{},\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-14 16:41:41');
INSERT INTO `sys_oper_log` VALUES (126, '在线用户', 7, 'com.ruoyi.web.controller.monitor.SysUserOnlineController.forceLogout()', 'DELETE', 1, 'superadmin', NULL, '/monitor/online/abc59b2d-ec45-41eb-a4b8-53358784797a', '218.28.225.114', 'XX XX', '{tokenId=abc59b2d-ec45-41eb-a4b8-53358784797a}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-03-16 16:07:55');
INSERT INTO `sys_oper_log` VALUES (127, '解析皮皮虾', 1, 'com.ruoyi.web.controller.system.SysPipixiaController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/pipixia', '127.0.0.1', '内网IP', 'https://h5.pipix.com/s/L7sfrgy/', '{\"msg\":\"操作成功\",\"code\":200,\"videoUrl\":\"http://v3-ppx.ixigua.com/a4d07d37e8541d85f1f69747ba7e7901/62399b38/video/tos/cn/tos-cn-ve-0076/18542cfb673a4f60afe244d719af9fa0/?a=1319\\\\u0026br=683\\\\u0026bt=683\\\\u0026cd=0%7C0%7C0%7C0\\\\u0026ch=0\\\\u0026cr=0\\\\u0026cs=0\\\\u0026cv=1\\\\u0026dr=6\\\\u0026ds=6\\\\u0026eid=2048\\\\u0026er=\\\\u0026ft=XEAS8qq3mbjPSzITz7V0yEwR7fulZ5~iM5\\\\u0026l=20220322164730010133044164200272C3\\\\u0026lr=\\\\u0026mime_type=video_mp4\\\\u0026net=0\\\\u0026pl=0\\\\u0026qs=0\\\\u0026rc=amV0cWg6ZnA7ODMzNGYzM0ApaTkzM2VmZWQzNzpmO2Y5Nmdwb3NlcjRnLjZgLS1kMS9zc2IzMDY2XmI2NV4vLzZeXmE6Yw%3D%3D\\\\u0026vl=\\\\u0026vr=\"}', 0, NULL, '2022-03-22 16:47:30');
INSERT INTO `sys_oper_log` VALUES (128, '解析皮皮虾', 1, 'com.ruoyi.web.controller.system.SysPipixiaController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/pipixia', '127.0.0.1', '内网IP', 'https://h5.pipix.com/s/L7sfrgy/', '{\"msg\":\"操作成功\",\"code\":200,\"videoUrl\":\"http://v3-ppx.ixigua.com/e912977589d26a351fe15631d9a2153b/62399b39/video/tos/cn/tos-cn-ve-0076/18542cfb673a4f60afe244d719af9fa0/?a=1319\\\\u0026br=683\\\\u0026bt=683\\\\u0026cd=0%7C0%7C0%7C0\\\\u0026ch=0\\\\u0026cr=0\\\\u0026cs=0\\\\u0026cv=1\\\\u0026dr=6\\\\u0026ds=6\\\\u0026eid=2048\\\\u0026er=\\\\u0026ft=XEAS8qq3mbjPSzITz7V0yEwR7fu1Z5~iM5\\\\u0026l=202203221647310101330281550A026311\\\\u0026lr=\\\\u0026mime_type=video_mp4\\\\u0026net=0\\\\u0026pl=0\\\\u0026qs=0\\\\u0026rc=amV0cWg6ZnA7ODMzNGYzM0ApaTkzM2VmZWQzNzpmO2Y5Nmdwb3NlcjRnLjZgLS1kMS9zc2IzMDY2XmI2NV4vLzZeXmE6Yw%3D%3D\\\\u0026vl=\\\\u0026vr=\"}', 0, NULL, '2022-03-22 16:47:31');
INSERT INTO `sys_oper_log` VALUES (129, '解析皮皮虾', 1, 'com.ruoyi.web.controller.system.SysPipixiaController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/pipixia', '127.0.0.1', '内网IP', 'https://h5.pipix.com/s/L7sfrgy/', '{\"msg\":\"操作成功\",\"code\":200,\"videoUrl\":\"http://v6-ppx.ixigua.com/87e4c4935c0cd6e832f74da872265d6c/62399b54/video/tos/cn/tos-cn-ve-0076/18542cfb673a4f60afe244d719af9fa0/?a=1319\\\\u0026br=683\\\\u0026bt=683\\\\u0026cd=0%7C0%7C0%7C0\\\\u0026ch=0\\\\u0026cr=0\\\\u0026cs=0\\\\u0026cv=1\\\\u0026dr=6\\\\u0026ds=6\\\\u0026eid=2048\\\\u0026er=\\\\u0026ft=XEAS8qq3mbjPSzITz7V0yEwR7fukZ5~iM5\\\\u0026l=2022032216475801013103921313026832\\\\u0026lr=\\\\u0026mime_type=video_mp4\\\\u0026net=0\\\\u0026pl=0\\\\u0026qs=0\\\\u0026rc=amV0cWg6ZnA7ODMzNGYzM0ApaTkzM2VmZWQzNzpmO2Y5Nmdwb3NlcjRnLjZgLS1kMS9zc2IzMDY2XmI2NV4vLzZeXmE6Yw%3D%3D\\\\u0026vl=\\\\u0026vr=\"}', 0, NULL, '2022-03-22 16:47:59');
INSERT INTO `sys_oper_log` VALUES (130, '解析抖音', 1, 'com.ruoyi.web.controller.system.SysTiktokController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/tiktok', '127.0.0.1', '内网IP', '9.97 RkP:/ 复制打开抖音，看看【涵笑半步癫的作品】# 画线救救火柴人 # 画线火柴人 # 火柴人 https://v.douyin.com/26oQ7SA/', '{\"msg\":\"操作成功\",\"code\":200,\"videoUrl\":\"https://v1.douyinvod.com/0ac34b0fcfbe0754eb0c02f86cf5cfeb/62e78cb9/video/tos/cn/tos-cn-ve-15c001-alinc2/577323753e704bb497248347830f8f1c/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=712&bt=712&btag=80000&cs=0&ds=3&ft=GYTg38VVyw3CRKm80mo~xj7ScoAwHXDLyKaVJExq4UD0PD&mime_type=video_mp4&qs=0&rc=NWc0Ojg0MzdmOjZmPDRmOkBpajxwPGk6ZnV3ZTMzNGkzM0AtYzZeLWIvXmIxMWJgXzJgYSNtNjNhcjRnYDVgLS1kLS9zcw%3D%3D&l=202208011519220102081051392503913B\"}', 0, NULL, '2022-08-01 15:19:22');
INSERT INTO `sys_oper_log` VALUES (131, '解析抖音', 1, 'com.ruoyi.web.controller.system.SysTiktokController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/tiktok', '218.28.225.114', 'XX XX', '4.66 foq:/ 复制打开抖音，看看【阳光很温柔的作品】不知道是哪里出了问题，总感觉自己不是很能融入到他们... https://v.douyin.com/2ymrWGk/', '{\"msg\":\"操作成功\",\"code\":200,\"videoUrl\":\"https://v26.douyinvod.com/752766b50015e124e19262aef45c41f5/62e7abd4/video/tos/cn/tos-cn-ve-15c001-alinc2/7c44fe0e4dae481da2bc4c43c125b18a/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=644&bt=644&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_s1DO5XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=aDdlNjdnM2k8OjZlOzZlZUBpamRmNzQ6ZnNwZTMzNGkzM0AuMjUwMjZeNl4xYzRgYzVhYSNmXy1hcjRvXjVgLS1kLTBzcw%3D%3D&l=20220801173231010212039012200DF359\"}', 0, NULL, '2022-08-01 17:32:32');
INSERT INTO `sys_oper_log` VALUES (132, '解析抖音', 1, 'com.ruoyi.web.controller.system.SysTiktokController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/tiktok', '218.28.225.114', 'XX XX', '4.66 foq:/ 复制打开抖音，看看【阳光很温柔的作品】不知道是哪里出了问题，总感觉自己不是很能融入到他们... https://v.douyin.com/2ymrWGk/', '{\"msg\":\"操作成功\",\"code\":200,\"videoUrl\":\"https://v27.douyinvod.com/309c45654745d2db1c3a69a628c3c788/62e7abf3/video/tos/cn/tos-cn-ve-15c001-alinc2/7c44fe0e4dae481da2bc4c43c125b18a/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=644&bt=644&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_s.aO5XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=aDdlNjdnM2k8OjZlOzZlZUBpamRmNzQ6ZnNwZTMzNGkzM0AuMjUwMjZeNl4xYzRgYzVhYSNmXy1hcjRvXjVgLS1kLTBzcw%3D%3D&l=20220801173302010204057100350E10EC\"}', 0, NULL, '2022-08-01 17:33:03');
INSERT INTO `sys_oper_log` VALUES (133, '解析抖音', 1, 'com.ruoyi.web.controller.system.SysTiktokController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/tiktok', '218.28.225.114', 'XX XX', '9.79 mDU:/ 复制打开抖音，看看【小焱·Game的作品】# 搞笑 # 火柴人 # 抖音游戏 就很离谱 https://v.douyin.com/26oDfoQ/', '{\"msg\":\"解析错误\",\"code\":500}', 0, NULL, '2022-08-01 17:34:52');
INSERT INTO `sys_oper_log` VALUES (134, '解析抖音', 1, 'com.ruoyi.web.controller.system.SysTiktokController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/tiktok', '218.28.225.114', 'XX XX', '1.00 HIv:/ 复制打开抖音，看看【大猫游戏队长的作品】# 画线救救火柴人 # 画线火柴人 # 火柴人 # 学生党... https://v.douyin.com/26oxyUK/', '{\"msg\":\"操作成功\",\"code\":200,\"videoUrl\":\"https://v3-z.douyinvod.com/332a7fbea3d6b8b1a9d5b15b54db4d10/62e7ac91/video/tos/cn/tos-cn-ve-15c001-alinc2/7ca1532a1eac48d7a52a7813c23ba14d/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=718&bt=718&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sn~O5XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=OWdmOzZkNmU8PDo0OzM8NEBpajtxcTg6ZmYzZTMzNGkzM0A0LjBeLjM0Xl8xYTIxXy42YSNgMmVpcjRvcjZgLS1kLWFzcw%3D%3D&l=20220801173515010208073131200E0560\"}', 0, NULL, '2022-08-01 17:35:15');
INSERT INTO `sys_oper_log` VALUES (135, '解析抖音', 1, 'com.ruoyi.web.controller.system.SysTiktokController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/tiktok', '218.28.225.114', 'XX XX', '0.76 Jvs:/ 带大家瞅瞅最舒适的法拉利跑车%法拉利罗马 %法拉利 %王稳健   https://v.douyin.com/LSebgqS/ 复制此链接，打开Dou音搜索，直接观看视频！', '{\"msg\":\"操作成功\",\"code\":200,\"videoUrl\":\"https://v83-016.douyinvod.com/a6f3996c5a1eb84b59560d05593fdd1c/62e7affb/video/tos/cn/tos-cn-ve-15-alinc2/f55e06d7e0234a3bb6fe5b7613e29d4f/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=1525&bt=1525&btag=80001&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_s7lH5XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=ODU8ZTZpNTQ0aGY0OTloNUBpanZnNjQ6ZnYzOTMzNGkzM0AtNi4wNDAxNjExM2MuNTYwYSM1NmgycjRvMGVgLS1kLS9zcw%3D%3D&l=20220801174246010208102081470FE6B7\"}', 0, NULL, '2022-08-01 17:42:46');
INSERT INTO `sys_oper_log` VALUES (136, '解析抖音', 1, 'com.ruoyi.web.controller.system.SysTiktokController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/tiktok', '218.28.225.114', 'XX XX', '1.00 HIv:/ 复制打开抖音，看看【大猫游戏队长的作品】# 画线救救火柴人 # 画线火柴人 # 火柴人 # 学生党... https://v.douyin.com/26oxyUK/', '{\"msg\":\"操作成功\",\"code\":200,\"videoUrl\":\"https://v83-016.douyinvod.com/0abe26b0535115072e5d62a0546b93d9/62e7b06e/video/tos/cn/tos-cn-ve-15c001-alinc2/7ca1532a1eac48d7a52a7813c23ba14d/?a=1128&ch=0&cr=0&dr=0&cd=0%7C0%7C0%7C0&cv=1&br=718&bt=718&btag=80000&cs=0&ds=3&ft=raapL0071FOvWHhWH6xRZ_sV3H5XySY~JXTMvTh&mime_type=video_mp4&qs=0&rc=OWdmOzZkNmU8PDo0OzM8NEBpajtxcTg6ZmYzZTMzNGkzM0A0LjBeLjM0Xl8xYTIxXy42YSNgMmVpcjRvcjZgLS1kLWFzcw%3D%3D&l=2022080117514401020812109343104645\"}', 0, NULL, '2022-08-01 17:51:44');
INSERT INTO `sys_oper_log` VALUES (137, '解析皮皮虾', 1, 'com.ruoyi.web.controller.system.SysPipixiaController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/pipixia', '218.28.225.114', 'XX XX', 'https://h5.pipix.com/item/6760726159849167115?cell_type=8&cell_id=6783984417216928004&carrier_region=&region=&language=&app_id=1319', NULL, 1, '1', '2022-08-01 17:52:17');
INSERT INTO `sys_oper_log` VALUES (138, '解析皮皮虾', 1, 'com.ruoyi.web.controller.system.SysPipixiaController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/pipixia', '218.28.225.114', 'XX XX', 'https://h5.pipix.com/item/7012809344429332773?app_id=1319&app=super&timestamp=1645080985&carrier_region=cn&region=cn&language=zh&utm_source=weixin', NULL, 1, '1', '2022-08-01 17:52:23');
INSERT INTO `sys_oper_log` VALUES (139, '解析皮皮虾', 1, 'com.ruoyi.web.controller.system.SysPipixiaController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/pipixia', '218.28.225.114', 'XX XX', 'https://h5.pipix.com/item/7012809344429332773?app_id=1319&app=super&timestamp=1645080985&carrier_region=cn&region=cn&language=zh&utm_source=weixin', NULL, 1, '1', '2022-08-01 17:53:11');
INSERT INTO `sys_oper_log` VALUES (140, '解析皮皮虾', 1, 'com.ruoyi.web.controller.system.SysPipixiaController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/pipixia', '127.0.0.1', '内网IP', 'https://h5.pipix.com/item/7012809344429332773?app_id=1319&app=super&timestamp=1645080985&carrier_region=cn&region=cn&language=zh&utm_source=weixin', NULL, 1, '1', '2022-08-01 17:54:51');
INSERT INTO `sys_oper_log` VALUES (141, '解析皮皮虾', 1, 'com.ruoyi.web.controller.system.SysPipixiaController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/pipixia', '127.0.0.1', '内网IP', 'https://h5.pipix.com/item/7012809344429332773?app_id=1319&app=super&timestamp=1645080985&carrier_region=cn&region=cn&language=zh&utm_source=weixin', NULL, 1, '1', '2022-08-01 17:56:01');
INSERT INTO `sys_oper_log` VALUES (142, '解析皮皮虾', 1, 'com.ruoyi.web.controller.system.SysPipixiaController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/pipixia', '127.0.0.1', '内网IP', 'https://h5.pipix.com/item/7012809344429332773?app_id=1319&app=super&timestamp=1645080985&carrier_region=cn&region=cn&language=zh&utm_source=weixin', NULL, 1, '1', '2022-08-01 17:58:12');
INSERT INTO `sys_oper_log` VALUES (143, '解析皮皮虾', 1, 'com.ruoyi.web.controller.system.SysPipixiaController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/pipixia', '127.0.0.1', '内网IP', 'https://h5.pipix.com/s/27Vc8Ph/', '{\"msg\":\"操作成功\",\"code\":200,\"videoUrl\":\"http://v6-ppx.ixigua.com/e5a15267e8a3dcd70f981c0085cb946a/62e7b224/video/tos/cn/tos-cn-ve-0076/9a0d19223a8c49e89be0d1b18d691de7/?a=1319\\\\u0026ch=0\\\\u0026cr=0\\\\u0026dr=6\\\\u0026cd=0%7C0%7C0%7C0\\\\u0026cv=1\\\\u0026br=776\\\\u0026bt=776\\\\u0026cs=0\\\\u0026ds=6\\\\u0026eid=2048\\\\u0026ft=e-KGN22Hj4u9GyB8yqsQ1-C5qSYNAmXEDtGjWKv8yq8\\\\u0026mime_type=video_mp4\\\\u0026qs=0\\\\u0026rc=OTM3aWQ1Ojc6PGUzaDQ1NUBpajlzaTQ6ZnFwPDMzNGYzM0AtMy0yNjZiXi8xNjBiMzIwYSNsMGM0cjRvZTZgLS1kMTBzcw%3D%3D\\\\u0026l=202208011758120101351620491800A6CE\"}', 0, NULL, '2022-08-01 17:58:12');
INSERT INTO `sys_oper_log` VALUES (144, '解析皮皮虾', 1, 'com.ruoyi.web.controller.system.SysPipixiaController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/pipixia', '127.0.0.1', '内网IP', 'https://h5.pipix.com/s/27Vc8Ph/', NULL, 1, '1', '2022-08-01 17:59:09');
INSERT INTO `sys_oper_log` VALUES (145, '解析皮皮虾', 1, 'com.ruoyi.web.controller.system.SysPipixiaController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/pipixia', '127.0.0.1', '内网IP', 'https://h5.pipix.com/s/27Vc8Ph/', NULL, 1, '1', '2022-08-01 17:59:49');
INSERT INTO `sys_oper_log` VALUES (146, '解析皮皮虾', 1, 'com.ruoyi.web.controller.system.SysPipixiaController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/pipixia', '127.0.0.1', '内网IP', 'https://h5.pipix.com/s/27Vc8Ph/', '{\"msg\":\"操作成功\",\"code\":200,\"videoUrl\":\"http://v6-ppx.ixigua.com/2dbb83d392e7bc1126ba58daddea508b/62e7b35d/video/tos/cn/tos-cn-ve-0076/9a0d19223a8c49e89be0d1b18d691de7/?a=1319\\\\u0026ch=0\\\\u0026cr=0\\\\u0026dr=6\\\\u0026cd=0%7C0%7C0%7C0\\\\u0026cv=1\\\\u0026br=776\\\\u0026bt=776\\\\u0026cs=0\\\\u0026ds=6\\\\u0026eid=2048\\\\u0026ft=e-KGN22Hj4u9GyB8yqsQ1-C5qSYKMmXEDtGjWKv8yq8\\\\u0026mime_type=video_mp4\\\\u0026qs=0\\\\u0026rc=OTM3aWQ1Ojc6PGUzaDQ1NUBpajlzaTQ6ZnFwPDMzNGYzM0AtMy0yNjZiXi8xNjBiMzIwYSNsMGM0cjRvZTZgLS1kMTBzcw%3D%3D\\\\u0026l=202208011803250101310570681D0121CF\"}', 0, NULL, '2022-08-01 18:03:25');
INSERT INTO `sys_oper_log` VALUES (147, '解析抖音', 1, 'com.ruoyi.web.controller.system.SysTiktokController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/tiktok', '218.28.225.114', 'XX XX', 'https://h5.pipix.com/s/27Vc8Ph/', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-08-01 18:04:32');
INSERT INTO `sys_oper_log` VALUES (148, '解析抖音', 1, 'com.ruoyi.web.controller.system.SysTiktokController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/tiktok', '218.28.225.114', 'XX XX', 'https://h5.pipix.com/s/27Vc8Ph/', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-08-01 18:04:33');
INSERT INTO `sys_oper_log` VALUES (149, '解析抖音', 1, 'com.ruoyi.web.controller.system.SysTiktokController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/tiktok', '218.28.225.114', 'XX XX', 'https://h5.pipix.com/s/27Vc8Ph/', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-08-01 18:04:34');
INSERT INTO `sys_oper_log` VALUES (150, '解析抖音', 1, 'com.ruoyi.web.controller.system.SysTiktokController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/tiktok', '218.28.225.114', 'XX XX', 'https://h5.pipix.com/s/27Vc8Ph/', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-08-01 18:04:34');
INSERT INTO `sys_oper_log` VALUES (151, '解析抖音', 1, 'com.ruoyi.web.controller.system.SysTiktokController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/tiktok', '218.28.225.114', 'XX XX', 'https://h5.pipix.com/s/27Vc8Ph/', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-08-01 18:04:34');
INSERT INTO `sys_oper_log` VALUES (152, '解析抖音', 1, 'com.ruoyi.web.controller.system.SysTiktokController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/tiktok', '218.28.225.114', 'XX XX', 'https://h5.pipix.com/s/27Vc8Ph/', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-08-01 18:04:34');
INSERT INTO `sys_oper_log` VALUES (153, '解析抖音', 1, 'com.ruoyi.web.controller.system.SysTiktokController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/tiktok', '218.28.225.114', 'XX XX', 'https://h5.pipix.com/s/27Vc8Ph/', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-08-01 18:04:40');
INSERT INTO `sys_oper_log` VALUES (154, '解析抖音', 1, 'com.ruoyi.web.controller.system.SysTiktokController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/tiktok', '218.28.225.114', 'XX XX', 'https://h5.pipix.com/s/27Vc8Ph/', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-08-01 18:05:01');
INSERT INTO `sys_oper_log` VALUES (155, '解析抖音', 1, 'com.ruoyi.web.controller.system.SysTiktokController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/tiktok', '218.28.225.114', 'XX XX', 'https://h5.pipix.com/s/27Vc8Ph/', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-08-01 18:05:06');
INSERT INTO `sys_oper_log` VALUES (156, '解析皮皮虾', 1, 'com.ruoyi.web.controller.system.SysPipixiaController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/pipixia', '218.28.225.114', 'XX XX', 'https://h5.pipix.com/s/27Vc8Ph/', '{\"msg\":\"操作成功\",\"code\":200,\"videoUrl\":\"http://v3-ppx.ixigua.com/d3a703b37d8645499d201f6b119be4de/62e7b3ed/video/tos/cn/tos-cn-ve-0076/9a0d19223a8c49e89be0d1b18d691de7/?a=1319\\\\u0026ch=0\\\\u0026cr=0\\\\u0026dr=6\\\\u0026cd=0%7C0%7C0%7C0\\\\u0026cv=1\\\\u0026br=776\\\\u0026bt=776\\\\u0026cs=0\\\\u0026ds=6\\\\u0026eid=2048\\\\u0026ft=b_XcommnPEC2Th7ThWwUx1D7.cHC~sbcIWDIn\\\\u0026mime_type=video_mp4\\\\u0026qs=0\\\\u0026rc=OTM3aWQ1Ojc6PGUzaDQ1NUBpajlzaTQ6ZnFwPDMzNGYzM0AtMy0yNjZiXi8xNjBiMzIwYSNsMGM0cjRvZTZgLS1kMTBzcw%3D%3D\\\\u0026l=20220801180549010133034021070131BF\"}', 0, NULL, '2022-08-01 18:05:49');
INSERT INTO `sys_oper_log` VALUES (157, '解析抖音', 1, 'com.ruoyi.web.controller.system.SysTiktokController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/tiktok', '218.28.225.114', 'XX XX', 'https://h5.pipix.com/s/27Vc8Ph/', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-08-01 18:08:12');
INSERT INTO `sys_oper_log` VALUES (158, '解析抖音', 1, 'com.ruoyi.web.controller.system.SysTiktokController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/tiktok', '218.28.225.114', 'XX XX', 'https://h5.pipix.com/s/27Vc8Ph/', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-08-01 18:08:13');
INSERT INTO `sys_oper_log` VALUES (159, '解析抖音', 1, 'com.ruoyi.web.controller.system.SysTiktokController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/tiktok', '218.28.225.114', 'XX XX', 'https://h5.pipix.com/s/27Vc8Ph/', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-08-01 18:08:13');
INSERT INTO `sys_oper_log` VALUES (160, '解析抖音', 1, 'com.ruoyi.web.controller.system.SysTiktokController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/tiktok', '218.28.225.114', 'XX XX', 'https://h5.pipix.com/s/27Vc8Ph/', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-08-01 18:08:14');
INSERT INTO `sys_oper_log` VALUES (161, '解析抖音', 1, 'com.ruoyi.web.controller.system.SysTiktokController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/tiktok', '218.28.225.114', 'XX XX', 'https://h5.pipix.com/s/27Vc8Ph/', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-08-01 18:08:14');
INSERT INTO `sys_oper_log` VALUES (162, '解析抖音', 1, 'com.ruoyi.web.controller.system.SysTiktokController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/tiktok', '218.28.225.114', 'XX XX', 'https://h5.pipix.com/s/27Vc8Ph/', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-08-01 18:08:14');
INSERT INTO `sys_oper_log` VALUES (163, '解析抖音', 1, 'com.ruoyi.web.controller.system.SysTiktokController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/tiktok', '218.28.225.114', 'XX XX', 'https://h5.pipix.com/s/27Vc8Ph/', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-08-01 18:08:14');
INSERT INTO `sys_oper_log` VALUES (164, '解析皮皮虾', 1, 'com.ruoyi.web.controller.system.SysPipixiaController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/pipixia', '218.28.225.114', 'XX XX', '操作失败', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-08-01 18:09:11');
INSERT INTO `sys_oper_log` VALUES (165, '解析皮皮虾', 1, 'com.ruoyi.web.controller.system.SysPipixiaController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/pipixia', '218.28.225.114', 'XX XX', '操作失败', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-08-01 18:09:16');
INSERT INTO `sys_oper_log` VALUES (166, '解析皮皮虾', 1, 'com.ruoyi.web.controller.system.SysPipixiaController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/pipixia', '218.28.225.114', 'XX XX', '操作失败', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-08-01 18:09:20');
INSERT INTO `sys_oper_log` VALUES (167, '解析抖音', 1, 'com.ruoyi.web.controller.system.SysTiktokController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/tiktok', '218.28.225.114', 'XX XX', '操作失败', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-08-01 18:09:48');
INSERT INTO `sys_oper_log` VALUES (168, '解析皮皮虾', 1, 'com.ruoyi.web.controller.system.SysPipixiaController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/pipixia', '218.28.225.114', 'XX XX', 'https://h5.pipix.com/s/27Vc8Ph/', '{\"msg\":\"操作成功\",\"code\":200,\"videoUrl\":\"http://v3-ppx.ixigua.com/0139e5b7fc708ed20f6cbd8eca61ed3a/62e7b53b/video/tos/cn/tos-cn-ve-0076/9a0d19223a8c49e89be0d1b18d691de7/?a=1319\\\\u0026ch=0\\\\u0026cr=0\\\\u0026dr=6\\\\u0026cd=0%7C0%7C0%7C0\\\\u0026cv=1\\\\u0026br=776\\\\u0026bt=776\\\\u0026cs=0\\\\u0026ds=6\\\\u0026eid=2048\\\\u0026ft=b_XcommnPEC2Th7ThWwUxAA7.cHC~sbcIWDIn\\\\u0026mime_type=video_mp4\\\\u0026qs=0\\\\u0026rc=OTM3aWQ1Ojc6PGUzaDQ1NUBpajlzaTQ6ZnFwPDMzNGYzM0AtMy0yNjZiXi8xNjBiMzIwYSNsMGM0cjRvZTZgLS1kMTBzcw%3D%3D\\\\u0026l=20220801181123010140205171100131F8\"}', 0, NULL, '2022-08-01 18:11:23');
INSERT INTO `sys_oper_log` VALUES (169, '解析抖音', 1, 'com.ruoyi.web.controller.system.SysTiktokController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/tiktok', '182.119.37.9', 'XX XX', 'https://v.douyin.com/M7rCSya/', '{\"msg\":\"操作成功\",\"code\":200,\"videoUrl\":\"错误\"}', 0, NULL, '2022-11-02 12:26:29');
INSERT INTO `sys_oper_log` VALUES (170, '解析抖音', 1, 'com.ruoyi.web.controller.system.SysTiktokController.getUrls()', 'POST', 1, 'zybcome', NULL, '/system/tiktok', '182.119.37.9', 'XX XX', 'https://v.douyin.com/M7kA3p1/', '{\"msg\":\"操作成功\",\"code\":200,\"videoUrl\":\"错误\"}', 0, NULL, '2022-11-02 12:27:59');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2021-12-07 09:47:11', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2021-12-07 09:47:11', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2021-12-07 09:47:11', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2021-12-07 09:47:11', 'admin', '2022-03-11 16:21:26', '普通角色');
INSERT INTO `sys_role` VALUES (100, '客户', 'kehu', 3, '1', 1, 1, '0', '0', 'admin', '2022-03-09 09:30:48', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 2000);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 120 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'superadmin', '若依', '00', 'ry@163.com', '15555536670', '0', '', '$2a$10$gwMliUDCo2kWOtk5414ouOL4scF/0J0x3Bj7tF3EoNIouHOx9Jhc6', '0', '0', '218.28.225.114', '2022-09-24 15:54:56', 'admin', '2021-12-07 09:47:11', '', '2022-09-24 15:54:56', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$D8HJo72N9o7fn/xkcBbJj.X0NPkFYpdVd1Mcc2QKwhpu511X4iBvC', '1', '1', '127.0.0.1', '2021-12-07 09:47:11', 'admin', '2021-12-07 09:47:11', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (100, NULL, 'zybcome', 'zybcome', '00', 'zybcome@sina.com', '', '0', '', '$2a$10$arCLfKhbNQnICDUq9p53rOB8P72btedicdOjFWkvlXKQOpso5LVdu', '0', '0', '182.119.37.9', '2022-11-02 20:24:45', '', '2022-03-11 09:56:28', 'superadmin', '2022-11-02 12:24:45', NULL);
INSERT INTO `sys_user` VALUES (101, NULL, 'chen', 'chen', '00', '1105954198@qq.com', '', '0', '', '$2a$10$EpO67bGu5TOCZm7wKV2MHOvWkEY0fA61/WODouGeaEvcX5hemS23y', '0', '0', '115.158.64.117', '2022-03-14 16:22:15', '', '2022-03-14 14:24:02', '', '2022-03-14 16:22:14', NULL);
INSERT INTO `sys_user` VALUES (118, NULL, '17703721217', '17703721217', '00', '3211515644@qq.com', '', '0', '', '$2a$10$Wp2WDflELPFH4h1M87WGzejMmHhLn1vAxA4Mt/WEr86/x2d2j9Su6', '0', '0', '123.161.49.230', '2022-05-15 17:56:22', '', '2022-05-15 17:56:10', '', '2022-05-15 17:56:22', NULL);
INSERT INTO `sys_user` VALUES (119, NULL, '18838534868', '18838534868', '00', '1487211728@qq.com', '', '0', '', '$2a$10$q2Kq9X6FUaF9yJqW1B4qHOyiW2vve3jY4hxYlFL7iPHO3RkH.iOay', '0', '0', '218.28.225.114', '2022-05-31 17:10:31', '', '2022-05-31 17:10:16', '', '2022-05-31 17:10:31', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (108, 100);
INSERT INTO `sys_user_role` VALUES (109, 100);
INSERT INTO `sys_user_role` VALUES (110, 100);
INSERT INTO `sys_user_role` VALUES (111, 100);
INSERT INTO `sys_user_role` VALUES (112, 100);
INSERT INTO `sys_user_role` VALUES (113, 100);
INSERT INTO `sys_user_role` VALUES (114, 100);
INSERT INTO `sys_user_role` VALUES (115, 100);
INSERT INTO `sys_user_role` VALUES (116, 100);
INSERT INTO `sys_user_role` VALUES (117, 100);
INSERT INTO `sys_user_role` VALUES (118, 100);
INSERT INTO `sys_user_role` VALUES (119, 100);

SET FOREIGN_KEY_CHECKS = 1;
