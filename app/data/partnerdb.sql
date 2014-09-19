/*
Navicat MySQL Data Transfer

Source Server         : LOCAL
Source Server Version : 50616
Source Host           : localhost:3306
Source Database       : partnerdb

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2014-09-19 13:34:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bulk_sms_template
-- ----------------------------
DROP TABLE IF EXISTS `bulk_sms_template`;
CREATE TABLE `bulk_sms_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(128) NOT NULL,
  `alias` varchar(100) DEFAULT NULL,
  `description` varchar(128) NOT NULL,
  `client_id` int(4) NOT NULL,
  `body` text NOT NULL,
  `comments` text,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bulk_sms_template
-- ----------------------------
INSERT INTO `bulk_sms_template` VALUES ('2', 'amaco_licenses_renewal', 'Amaco Vehicle Renewal', 'Amaco Vehicle licenses renuwal', '4', ' Dear Customer;\r\n Your policy FOR vehicle Reg NO {registration}  is due for renewal/extension on {date}.  Kindly arrange to renew it.\r\nContact your AGENT / BROKER OR AMACO.\r\n', 'Placeholders: {name}=> The Admin full name, {username}=>admin username, {email}=>admin email,{password} => The new password, {link}=> Login link ', '2013-09-28 02:43:30', '7');
INSERT INTO `bulk_sms_template` VALUES ('5', 'new_user', 'New Users', 'Email sent to a new user when informing the user of his/her new account.', '28', '<p>\r\n	       Hi {name},\r\n</p>\r\n<p>\r\n	       Your account for {site_name} has been created. These are your login details:\r\n</p>\r\n<ul>\r\n	<li>Username :<strong>{username}</strong> or <strong>{email}</strong></li>\r\n	<li>Password:<strong>{password}</strong></li>\r\n</ul>\r\n        To login now please  <a target=\"_blank\" rel=\"nofollow\" href=\"http://{link}\">click here</a>\r\n<p>\r\n	    or copy and paste this link to your browser: {link}\r\n</p>\r\n<p>\r\n	  Smart County Team\r\n</p>', null, '2013-12-17 14:58:05', '7');
INSERT INTO `bulk_sms_template` VALUES ('9', 'my_sms_reminder', 'Sms Predictor', 'Sms to Remind users to predict', '27', '<p>\r\n	Hi {number}\r\n</p>\r\n<p>\r\n	Please subscribe to {service} for change to win {present}\r\n</p>', null, '2014-07-08 18:50:55', '1');

-- ----------------------------
-- Table structure for citizen
-- ----------------------------
DROP TABLE IF EXISTS `citizen`;
CREATE TABLE `citizen` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `person_id` int(11) unsigned NOT NULL,
  `national_id_no` varchar(30) DEFAULT NULL,
  `passport_no` varchar(30) DEFAULT NULL,
  `kra_pin` varchar(30) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `last_modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of citizen
-- ----------------------------

-- ----------------------------
-- Table structure for console_tasks
-- ----------------------------
DROP TABLE IF EXISTS `console_tasks`;
CREATE TABLE `console_tasks` (
  `id` varchar(30) NOT NULL,
  `last_run` timestamp NULL DEFAULT NULL,
  `execution_type` varchar(20) NOT NULL DEFAULT 'continuous',
  `status` varchar(10) NOT NULL DEFAULT 'Active',
  `threads` int(11) NOT NULL DEFAULT '0',
  `max_threads` int(11) NOT NULL DEFAULT '100',
  `sleep` int(11) NOT NULL DEFAULT '10',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of console_tasks
-- ----------------------------
INSERT INTO `console_tasks` VALUES ('cleanUp', null, 'default', 'Active', '0', '0', '0');
INSERT INTO `console_tasks` VALUES ('sendEmail', null, 'continuous', 'Active', '0', '2', '10');

-- ----------------------------
-- Table structure for console_task_queue
-- ----------------------------
DROP TABLE IF EXISTS `console_task_queue`;
CREATE TABLE `console_task_queue` (
  `id` varchar(128) NOT NULL,
  `params` longtext NOT NULL,
  `task` varchar(30) NOT NULL,
  `progress_message` text,
  `progress_status` varchar(20) NOT NULL DEFAULT 'Progress',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `max_attempts` tinyint(2) NOT NULL DEFAULT '3',
  `attempts` int(11) NOT NULL DEFAULT '0',
  `pop_key` varchar(128) DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task` (`task`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of console_task_queue
-- ----------------------------
INSERT INTO `console_task_queue` VALUES ('41cdb3b7ea3640b32319c9384f1ac5642d4d5183', 'a:5:{s:9:\"from_name\";s:38:\"Welcome:: Furahia Mobile Solutions Ltd\";s:10:\"from_email\";s:22:\"noreply@toamaoni.co.ke\";s:8:\"to_email\";s:19:\"admin@partner.co.ke\";s:7:\"subject\";s:13:\"Login Details\";s:7:\"message\";s:567:\"<p>\r\n	     Hi ,\r\n</p>\r\n<p>\r\n	     Your account for Welcome:: Furahia Mobile Solutions Ltd has been created. These are your login details:\r\n</p>\r\n<ul>\r\n	<li>Username :<strong>partner</strong> or <strong>admin@partner.co.ke</strong></li>\r\n	<li>Password:<strong>partner</strong></li>\r\n</ul>\r\n      To login now please  <a target=\"_blank\" rel=\"nofollow\" href=\"http://http://localhost:5310/partner/auth/default/login\">click here</a>\r\n<p>\r\n	  or copy and paste this link to your browser: http://localhost:5310/partner/auth/default/login\r\n</p>\r\n<p>\r\n	Smart County Team\r\n</p>\";}', 'sendEmail', null, 'Progress', '2014-07-01 10:10:59', '3', '0', null, '1');
INSERT INTO `console_task_queue` VALUES ('6157e3bacbd750f9f370d87def6db98142d1b50b', 'a:5:{s:9:\"from_name\";s:28:\"Furahia Mobile Client Portal\";s:10:\"from_email\";s:22:\"noreply@toamaoni.co.ke\";s:8:\"to_email\";s:25:\"solomon@furahiamobile.com\";s:7:\"subject\";s:13:\"Login Details\";s:7:\"message\";s:579:\"<p>\r\n	     Hi ,\r\n</p>\r\n<p>\r\n	     Your account for Furahia Mobile Client Portal has been created. These are your login details:\r\n</p>\r\n<ul>\r\n	<li>Username :<strong>Solomon</strong> or <strong>solomon@furahiamobile.com</strong></li>\r\n	<li>Password:<strong>Solomon@Admin</strong></li>\r\n</ul>\r\n      To login now please  <a target=\"_blank\" rel=\"nofollow\" href=\"http://http://197.155.66.218:5050/partner/auth/default/login\">click here</a>\r\n<p>\r\n	  or copy and paste this link to your browser: http://197.155.66.218:5050/partner/auth/default/login\r\n</p>\r\n<p>\r\n	Smart County Team\r\n</p>\";}', 'sendEmail', null, 'Progress', '2014-07-18 12:45:24', '3', '0', null, '1');
INSERT INTO `console_task_queue` VALUES ('6cab03f0ce73d51835d62435aa765c12e4e87478', 'a:5:{s:9:\"from_name\";s:38:\"Welcome:: Furahia Mobile Solutions Ltd\";s:10:\"from_email\";s:22:\"noreply@toamaoni.co.ke\";s:8:\"to_email\";s:19:\"asali@partner.co.ke\";s:7:\"subject\";s:13:\"Login Details\";s:7:\"message\";s:576:\"<p>\r\n	     Hi Felix Aduol,\r\n</p>\r\n<p>\r\n	     Your account for Welcome:: Furahia Mobile Solutions Ltd has been created. These are your login details:\r\n</p>\r\n<ul>\r\n	<li>Username :<strong>asali</strong> or <strong>asali@partner.co.ke</strong></li>\r\n	<li>Password:<strong>partner</strong></li>\r\n</ul>\r\n      To login now please  <a target=\"_blank\" rel=\"nofollow\" href=\"http://http://localhost:5310/partner/auth/default/login\">click here</a>\r\n<p>\r\n	  or copy and paste this link to your browser: http://localhost:5310/partner/auth/default/login\r\n</p>\r\n<p>\r\n	Smart County Team\r\n</p>\";}', 'sendEmail', null, 'Progress', '2014-07-01 10:08:27', '3', '0', null, '1');
INSERT INTO `console_task_queue` VALUES ('f876cf670f67fb4b4899f4b8a18c6b6e6011eeec', 'a:5:{s:9:\"from_name\";s:38:\"Welcome:: Furahia Mobile Solutions Ltd\";s:10:\"from_email\";s:22:\"noreply@toamaoni.co.ke\";s:8:\"to_email\";s:22:\"team@furahiamobile.com\";s:7:\"subject\";s:13:\"Login Details\";s:7:\"message\";s:568:\"<p>\r\n	     Hi ,\r\n</p>\r\n<p>\r\n	     Your account for Welcome:: Furahia Mobile Solutions Ltd has been created. These are your login details:\r\n</p>\r\n<ul>\r\n	<li>Username :<strong>team</strong> or <strong>team@furahiamobile.com</strong></li>\r\n	<li>Password:<strong>team2014</strong></li>\r\n</ul>\r\n      To login now please  <a target=\"_blank\" rel=\"nofollow\" href=\"http://http://localhost:5310/partner/auth/default/login\">click here</a>\r\n<p>\r\n	  or copy and paste this link to your browser: http://localhost:5310/partner/auth/default/login\r\n</p>\r\n<p>\r\n	Smart County Team\r\n</p>\";}', 'sendEmail', null, 'Progress', '2014-06-27 13:05:07', '3', '0', null, '1');

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `telephone1` varchar(15) DEFAULT NULL,
  `telephone2` varchar(15) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact_person_id` int(11) unsigned DEFAULT NULL,
  `status` enum('Open','Closed') NOT NULL DEFAULT 'Open',
  `country_id` int(11) unsigned DEFAULT NULL,
  `location` varchar(128) DEFAULT NULL,
  `latitude` varchar(30) DEFAULT NULL,
  `longitude` varchar(30) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) unsigned DEFAULT NULL,
  `last_modified` timestamp NULL DEFAULT NULL,
  `last_modified_by` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`),
  KEY `contact_person_id` (`contact_person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('1', 'Furahia Mobile', '0207585552', '', 'team@furahiamobile.com', '', null, 'Open', '1', 'HQ', '', '', '2014-02-10 19:30:22', '1', '2014-06-24 23:57:03', '1');
INSERT INTO `dept` VALUES ('2', 'Tando Solutions', '', '', '', '', null, 'Open', '115', '', '', '', '2014-09-11 11:46:39', '1', null, null);
INSERT INTO `dept` VALUES ('3', 'Kinde Engineering', '', '', '', '', null, 'Open', '97', '', '', '', '2014-09-11 11:47:41', '1', null, null);

-- ----------------------------
-- Table structure for dept_user
-- ----------------------------
DROP TABLE IF EXISTS `dept_user`;
CREATE TABLE `dept_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `person_id` int(11) unsigned NOT NULL,
  `dept_id` int(11) unsigned NOT NULL,
  `has_left` tinyint(1) NOT NULL DEFAULT '0',
  `reason_for_leaving` varchar(255) DEFAULT NULL,
  `date_left` timestamp NULL DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) unsigned DEFAULT NULL,
  `last_modified` timestamp NULL DEFAULT NULL,
  `last_modified_by` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `person_id` (`person_id`),
  KEY `store_id` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dept_user
-- ----------------------------
INSERT INTO `dept_user` VALUES ('1', '8', '1', '1', null, '2014-07-09 10:56:45', '2014-02-10 19:31:58', '1', '2014-07-09 10:56:45', '1');
INSERT INTO `dept_user` VALUES ('2', '2', '1', '0', null, null, '2014-06-27 13:05:07', '1', null, null);

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `person_id` int(11) unsigned NOT NULL,
  `level_id` smallint(6) unsigned NOT NULL,
  `id_no` varchar(30) DEFAULT NULL,
  `staff_no` varchar(30) NOT NULL,
  `passport_no` varchar(30) DEFAULT NULL,
  `dept_id` int(11) unsigned DEFAULT NULL,
  `employment_date` date DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) unsigned DEFAULT NULL,
  `last_modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `person_id` (`person_id`),
  KEY `level_id` (`level_id`),
  KEY `dept_id` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of employee
-- ----------------------------

-- ----------------------------
-- Table structure for employee_level
-- ----------------------------
DROP TABLE IF EXISTS `employee_level`;
CREATE TABLE `employee_level` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) unsigned DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of employee_level
-- ----------------------------

-- ----------------------------
-- Table structure for modules_enabled
-- ----------------------------
DROP TABLE IF EXISTS `modules_enabled`;
CREATE TABLE `modules_enabled` (
  `id` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'Enabled',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of modules_enabled
-- ----------------------------
INSERT INTO `modules_enabled` VALUES ('bulk', 'Bulk Smes', '', 'Enabled', '2014-02-10 19:22:45', '1');
INSERT INTO `modules_enabled` VALUES ('call', 'Call Manager', '', 'Enabled', '2014-09-11 11:59:49', '1');
INSERT INTO `modules_enabled` VALUES ('dept', 'Department Module', '', 'Enabled', '2014-02-10 19:19:15', '1');
INSERT INTO `modules_enabled` VALUES ('hr', 'Human Resouce Module', null, 'Enabled', '2014-02-10 19:22:21', '1');
INSERT INTO `modules_enabled` VALUES ('importcsv', 'Import CSV', '', 'Enabled', '2014-07-16 17:22:01', '1');
INSERT INTO `modules_enabled` VALUES ('parking', 'Parking Module', '', 'Enabled', '2014-02-10 19:20:41', '1');
INSERT INTO `modules_enabled` VALUES ('reports', 'Reports Module', '', 'Enabled', '2014-02-10 19:23:05', '1');
INSERT INTO `modules_enabled` VALUES ('subs', 'Subs Manager', '', 'Enabled', '2014-02-10 19:23:53', '1');

-- ----------------------------
-- Table structure for msg_email_outbox
-- ----------------------------
DROP TABLE IF EXISTS `msg_email_outbox`;
CREATE TABLE `msg_email_outbox` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sent_by` int(11) DEFAULT NULL,
  `from_name` varchar(64) DEFAULT NULL,
  `from_email` varchar(128) NOT NULL,
  `to_email` varchar(128) NOT NULL,
  `to_name` varchar(60) DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `date_queued` timestamp NULL DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `to_email` (`to_email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of msg_email_outbox
-- ----------------------------

-- ----------------------------
-- Table structure for parking_clumped
-- ----------------------------
DROP TABLE IF EXISTS `parking_clumped`;
CREATE TABLE `parking_clumped` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vehicle_id` int(11) unsigned NOT NULL,
  `street_id` int(11) unsigned DEFAULT NULL,
  `county_id` int(11) unsigned NOT NULL,
  `clumping_reason` varchar(500) NOT NULL,
  `exact_location` varchar(255) NOT NULL,
  `latitude` varchar(30) DEFAULT NULL,
  `longitude` varchar(30) DEFAULT NULL,
  `time_clumped` datetime NOT NULL,
  `clumping_status` enum('Clumped','Unclumped') NOT NULL DEFAULT 'Clumped',
  `clumped_by` int(11) unsigned NOT NULL,
  `time_unclumped` datetime DEFAULT NULL,
  `unclumped_by` int(11) unsigned DEFAULT NULL,
  `comments` varchar(500) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) unsigned DEFAULT NULL,
  `last_modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vehicle_id` (`vehicle_id`),
  KEY `street_id` (`street_id`),
  KEY `county_id` (`county_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of parking_clumped
-- ----------------------------

-- ----------------------------
-- Table structure for parking_fees
-- ----------------------------
DROP TABLE IF EXISTS `parking_fees`;
CREATE TABLE `parking_fees` (
  `id` varchar(60) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` varchar(500) NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) unsigned DEFAULT NULL,
  `last_modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of parking_fees
-- ----------------------------

-- ----------------------------
-- Table structure for parking_fee_matrix
-- ----------------------------
DROP TABLE IF EXISTS `parking_fee_matrix`;
CREATE TABLE `parking_fee_matrix` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `street_id` int(11) unsigned NOT NULL,
  `county_id` int(11) unsigned NOT NULL,
  `parking_fee_id` varchar(60) NOT NULL,
  `parking_package_id` varchar(30) NOT NULL,
  `amount` decimal(10,0) NOT NULL DEFAULT '0',
  `description` varchar(500) DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) unsigned DEFAULT NULL,
  `last_modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `county_id` (`county_id`),
  KEY `street_id` (`street_id`),
  KEY `parking_fee_id` (`parking_fee_id`),
  KEY `parking_package_id` (`parking_package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of parking_fee_matrix
-- ----------------------------

-- ----------------------------
-- Table structure for parking_parkage
-- ----------------------------
DROP TABLE IF EXISTS `parking_parkage`;
CREATE TABLE `parking_parkage` (
  `id` varchar(30) NOT NULL,
  `name` varchar(60) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of parking_parkage
-- ----------------------------

-- ----------------------------
-- Table structure for parking_payments
-- ----------------------------
DROP TABLE IF EXISTS `parking_payments`;
CREATE TABLE `parking_payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vehicle_id` int(11) unsigned NOT NULL,
  `street_id` int(11) unsigned DEFAULT NULL,
  `county_id` int(11) unsigned NOT NULL,
  `parking_fee_matrix_id` int(11) unsigned DEFAULT NULL,
  `payment_datetime` datetime NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `payment_status` enum('Completed','Pending') NOT NULL DEFAULT 'Completed',
  `payment_method` varchar(30) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `county_id` (`county_id`),
  KEY `street_id` (`street_id`),
  KEY `vehicle_id` (`vehicle_id`),
  KEY `parking_fee_matrix_id` (`parking_fee_matrix_id`),
  KEY `payment_method` (`payment_method`),
  KEY `payment_status` (`payment_status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of parking_payments
-- ----------------------------

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `middle_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) NOT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `birthdate_estimated` tinyint(1) NOT NULL DEFAULT '0',
  `country_id` int(11) unsigned DEFAULT NULL,
  `profile_image` varchar(128) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) unsigned DEFAULT NULL,
  `last_modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES ('1', 'James', 'M', 'Makau', 'Male', '2014-07-01', '0', null, null, '2014-07-01 10:13:31', null, null);
INSERT INTO `person` VALUES ('4', 'Asali', null, 'Partner', null, null, '0', null, '', '2014-07-01 10:10:59', '1', null);
INSERT INTO `person` VALUES ('5', 'Brands', null, 'Media', null, null, '0', null, null, '2014-07-04 11:39:37', '1', null);
INSERT INTO `person` VALUES ('8', 'Furahia', null, 'Furahia Team', null, null, '0', null, 'b3a9d4bc0a42ca9b933416835434025a.PNG', '2014-07-09 10:56:45', '1', '2014-07-09 11:05:26');
INSERT INTO `person` VALUES ('9', 'Solomon', null, 'Njuguna', null, null, '0', null, null, '2014-07-18 12:45:24', '1', null);
INSERT INTO `person` VALUES ('10', 'Amaco', null, 'Admin', null, null, '0', null, '5950eabf38be76a66394a6e7d121854b.png', '2014-07-21 17:19:03', '1', null);

-- ----------------------------
-- Table structure for person_address
-- ----------------------------
DROP TABLE IF EXISTS `person_address`;
CREATE TABLE `person_address` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `person_id` int(11) unsigned NOT NULL,
  `phone1` varchar(15) DEFAULT NULL,
  `phone2` varchar(15) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `residence` varchar(255) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `last_modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `person_id` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of person_address
-- ----------------------------
INSERT INTO `person_address` VALUES ('1', '8', '254725830529', '', null, 'P O Box 6911-00300', 'Panesars Center, 3rd Fl MSA RD', '2014-07-09 10:57:37', '1', null);

-- ----------------------------
-- Table structure for region_country
-- ----------------------------
DROP TABLE IF EXISTS `region_country`;
CREATE TABLE `region_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique ID of the county (system generated)',
  `name` varchar(128) NOT NULL COMMENT 'Country name',
  `country_code` varchar(4) DEFAULT NULL COMMENT 'Country code e.g 254 for Kenya',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of region_country
-- ----------------------------
INSERT INTO `region_country` VALUES ('1', 'Kenya', '254', '2012-12-28 17:07:56');
INSERT INTO `region_country` VALUES ('3', 'Andorra', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('4', 'United Arab Emirates', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('5', 'Afghanistan', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('6', 'Antigua and Barbuda', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('7', 'Anguilla', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('8', 'Albania', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('9', 'Armenia', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('10', 'Netherlands Antilles', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('11', 'Angola', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('12', 'Antarctica', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('13', 'Argentina', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('14', 'American Samoa', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('15', 'Austria', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('16', 'Australia', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('17', 'Aruba', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('18', 'Aland Islands', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('19', 'Azerbaijan', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('20', 'Bosnia and Herzegovina', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('21', 'Barbados', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('22', 'Bangladesh', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('23', 'Belgium', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('24', 'Burkina Faso', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('25', 'Bulgaria', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('26', 'Bahrain', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('27', 'Burundi', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('28', 'Benin', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('29', 'Bermuda', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('30', 'Brunei Darussalam', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('31', 'Bolivia', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('32', 'Brazil', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('33', 'Bahamas', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('34', 'Bhutan', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('35', 'Bouvet Island', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('36', 'Botswana', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('37', 'Belarus', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('38', 'Belize', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('39', 'Canada', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('40', 'Caribbean Nations', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('41', 'Cocos (Keeling) Islands', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('42', 'Democratic Republic of the Congo', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('43', 'Central African Republic', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('44', 'Congo', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('45', 'Switzerland', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('46', 'Cote D\'Ivoire', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('47', 'Cook Islands', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('48', 'Chile', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('49', 'Cameroon', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('50', 'China', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('51', 'Colombia', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('52', 'Costa Rica', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('53', 'Serbia and Montenegro', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('54', 'Cuba', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('55', 'Cape Verde', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('56', 'Christmas Island', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('57', 'Cyprus', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('58', 'Czech Republic', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('59', 'Germany', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('60', 'Djibouti', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('61', 'Denmark', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('62', 'Dominica', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('63', 'Dominican Republic', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('64', 'Algeria', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('65', 'Ecuador', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('66', 'Estonia', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('67', 'Egypt', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('68', 'Western Sahara', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('69', 'Eritrea', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('70', 'Spain', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('71', 'Ethiopia', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('72', 'Finland', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('73', 'Fiji', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('74', 'Falkland Islands (Malvinas)', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('75', 'Federated States of Micronesia', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('76', 'Faroe Islands', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('77', 'France', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('78', 'France, Metropolitan', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('79', 'Gabon', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('80', 'United Kingdom', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('81', 'Grenada', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('82', 'Georgia', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('83', 'French Guiana', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('84', 'Ghana', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('85', 'Gibraltar', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('86', 'Greenland', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('87', 'Gambia', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('88', 'Guinea', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('89', 'Guadeloupe', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('90', 'Equatorial Guinea', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('91', 'Greece', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('92', 'S. Georgia and S. Sandwich Islands', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('93', 'Guatemala', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('94', 'Guam', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('95', 'Guinea-Bissau', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('96', 'Guyana', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('97', 'Hong Kong', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('98', 'Heard Island and McDonald Islands', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('99', 'Honduras', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('100', 'Croatia', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('101', 'Haiti', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('102', 'Hungary', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('103', 'Indonesia', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('104', 'Ireland', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('105', 'Israel', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('106', 'India', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('107', 'British Indian Ocean Territory', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('108', 'Iraq', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('109', 'Iran', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('110', 'Iceland', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('111', 'Italy', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('112', 'Jamaica', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('113', 'Jordan', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('114', 'Japan', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('115', 'Kenya', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('116', 'Kyrgyzstan', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('117', 'Cambodia', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('118', 'Kiribati', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('119', 'Comoros', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('120', 'Saint Kitts and Nevis', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('121', 'Korea (North)', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('122', 'Korea', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('123', 'Kuwait', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('124', 'Cayman Islands', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('125', 'Kazakhstan', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('126', 'Laos', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('127', 'Lebanon', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('128', 'Saint Lucia', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('129', 'Liechtenstein', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('130', 'Sri Lanka', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('131', 'Liberia', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('132', 'Lesotho', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('133', 'Lithuania', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('134', 'Luxembourg', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('135', 'Latvia', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('136', 'Libya', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('137', 'Morocco', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('138', 'Monaco', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('139', 'Moldova', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('140', 'Madagascar', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('141', 'Marshall Islands', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('142', 'Macedonia', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('143', 'Mali', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('144', 'Myanmar', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('145', 'Mongolia', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('146', 'Macao', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('147', 'Northern Mariana Islands', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('148', 'Martinique', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('149', 'Mauritania', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('150', 'Montserrat', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('151', 'Malta', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('152', 'Mauritius', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('153', 'Maldives', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('154', 'Malawi', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('155', 'Mexico', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('156', 'Malaysia', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('157', 'Mozambique', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('158', 'Namibia', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('159', 'New Caledonia', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('160', 'Niger', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('161', 'Norfolk Island', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('162', 'Nigeria', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('163', 'Nicaragua', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('164', 'Netherlands', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('165', 'Norway', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('166', 'Nepal', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('167', 'Nauru', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('168', 'Niue', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('169', 'New Zealand', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('170', 'Sultanate of Oman', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('171', 'Other', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('172', 'Panama', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('173', 'Peru', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('174', 'French Polynesia', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('175', 'Papua New Guinea', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('176', 'Philippines', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('177', 'Pakistan', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('178', 'Poland', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('179', 'Saint Pierre and Miquelon', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('180', 'Pitcairn', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('181', 'Puerto Rico', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('182', 'Palestinian Territory', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('183', 'Portugal', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('184', 'Palau', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('185', 'Paraguay', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('186', 'Qatar', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('187', 'Reunion', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('188', 'Romania', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('189', 'Russian Federation', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('190', 'Rwanda', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('191', 'Saudi Arabia', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('192', 'Solomon Islands', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('193', 'Seychelles', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('194', 'Sudan', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('195', 'Sweden', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('196', 'Singapore', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('197', 'Saint Helena', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('198', 'Slovenia', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('199', 'Svalbard and Jan Mayen', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('200', 'Slovak Republic', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('201', 'Sierra Leone', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('202', 'San Marino', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('203', 'Senegal', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('204', 'Somalia', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('205', 'Suriname', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('206', 'Sao Tome and Principe', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('207', 'El Salvador', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('208', 'Syria', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('209', 'Swaziland', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('210', 'Turks and Caicos Islands', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('211', 'Chad', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('212', 'French Southern Territories', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('213', 'Togo', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('214', 'Thailand', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('215', 'Tajikistan', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('216', 'Tokelau', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('217', 'Timor-Leste', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('218', 'Turkmenistan', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('219', 'Tunisia', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('220', 'Tonga', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('221', 'East Timor', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('222', 'Turkey', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('223', 'Trinidad and Tobago', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('224', 'Tuvalu', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('225', 'Taiwan', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('226', 'Tanzania', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('227', 'Ukraine', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('228', 'Uganda', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('229', 'United States', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('230', 'Uruguay', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('231', 'Uzbekistan', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('232', 'Vatican City State (Holy See)', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('233', 'Saint Vincent and the Grenadines', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('234', 'Venezuela', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('235', 'Virgin Islands (British)', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('236', 'Virgin Islands (U.S.)', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('237', 'Viet Nam', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('238', 'Vanuatu', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('239', 'Wallis and Futuna', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('240', 'Samoa', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('241', 'Yemen', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('242', 'Mayotte', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('243', 'Yugoslavia', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('244', 'South Africa', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('245', 'Zambia', null, '2013-01-30 12:56:12');
INSERT INTO `region_country` VALUES ('246', 'Zimbabwe', null, '2013-01-30 12:56:12');

-- ----------------------------
-- Table structure for region_county
-- ----------------------------
DROP TABLE IF EXISTS `region_county`;
CREATE TABLE `region_county` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `country_id` int(11) unsigned DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) unsigned DEFAULT NULL,
  `last_modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of region_county
-- ----------------------------

-- ----------------------------
-- Table structure for region_streets
-- ----------------------------
DROP TABLE IF EXISTS `region_streets`;
CREATE TABLE `region_streets` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `county_id` int(11) unsigned NOT NULL,
  `sub_county_id` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(500) DEFAULT NULL,
  `latitude` varchar(30) DEFAULT NULL,
  `longitude` varchar(30) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) unsigned DEFAULT NULL,
  `last_modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_county_id` (`sub_county_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of region_streets
-- ----------------------------

-- ----------------------------
-- Table structure for region_sub_county
-- ----------------------------
DROP TABLE IF EXISTS `region_sub_county`;
CREATE TABLE `region_sub_county` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `county_id` int(11) unsigned NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `county_id` (`county_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of region_sub_county
-- ----------------------------

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(64) NOT NULL DEFAULT 'system',
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_key` (`category`,`key`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES ('1', 'general', 'currency', 's:3:\"KES\";');
INSERT INTO `settings` VALUES ('2', 'general', 'pagination', 's:2:\"30\";');
INSERT INTO `settings` VALUES ('3', 'general', 'default_timezone', 's:14:\"Africa/Nairobi\";');
INSERT INTO `settings` VALUES ('4', 'email', 'email_mailer', 's:4:\"smtp\";');
INSERT INTO `settings` VALUES ('5', 'email', 'email_sendmail_command', 's:0:\"\";');
INSERT INTO `settings` VALUES ('6', 'email', 'email_host', 's:22:\"mail.smartcounty.co.ke\";');
INSERT INTO `settings` VALUES ('7', 'email', 'email_port', 's:3:\"465\";');
INSERT INTO `settings` VALUES ('8', 'email', 'email_username', 's:25:\"noreply@smartcounty.co.ke\";');
INSERT INTO `settings` VALUES ('9', 'email', 'email_password', 's:0:\"\";');
INSERT INTO `settings` VALUES ('10', 'email', 'email_security', 's:3:\"ssl\";');
INSERT INTO `settings` VALUES ('11', 'email', 'email_master_theme', 's:22:\"<p>\r\n	 {content}\r\n</p>\";');

-- ----------------------------
-- Table structure for settings_country
-- ----------------------------
DROP TABLE IF EXISTS `settings_country`;
CREATE TABLE `settings_country` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique ID of the county (system generated)',
  `name` varchar(128) NOT NULL COMMENT 'Country name',
  `country_code` varchar(4) DEFAULT NULL COMMENT 'Country code e.g 254 for Kenya',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of settings_country
-- ----------------------------
INSERT INTO `settings_country` VALUES ('1', 'Kenya', '254', '2012-12-28 17:07:56');
INSERT INTO `settings_country` VALUES ('3', 'Andorra', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('4', 'United Arab Emirates', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('5', 'Afghanistan', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('6', 'Antigua and Barbuda', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('7', 'Anguilla', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('8', 'Albania', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('9', 'Armenia', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('10', 'Netherlands Antilles', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('11', 'Angola', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('12', 'Antarctica', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('13', 'Argentina', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('14', 'American Samoa', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('15', 'Austria', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('16', 'Australia', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('17', 'Aruba', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('18', 'Aland Islands', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('19', 'Azerbaijan', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('20', 'Bosnia and Herzegovina', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('21', 'Barbados', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('22', 'Bangladesh', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('23', 'Belgium', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('24', 'Burkina Faso', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('25', 'Bulgaria', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('26', 'Bahrain', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('27', 'Burundi', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('28', 'Benin', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('29', 'Bermuda', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('30', 'Brunei Darussalam', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('31', 'Bolivia', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('32', 'Brazil', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('33', 'Bahamas', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('34', 'Bhutan', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('35', 'Bouvet Island', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('36', 'Botswana', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('37', 'Belarus', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('38', 'Belize', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('39', 'Canada', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('40', 'Caribbean Nations', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('41', 'Cocos (Keeling) Islands', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('42', 'Democratic Republic of the Congo', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('43', 'Central African Republic', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('44', 'Congo', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('45', 'Switzerland', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('46', 'Cote D\'Ivoire', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('47', 'Cook Islands', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('48', 'Chile', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('49', 'Cameroon', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('50', 'China', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('51', 'Colombia', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('52', 'Costa Rica', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('53', 'Serbia and Montenegro', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('54', 'Cuba', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('55', 'Cape Verde', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('56', 'Christmas Island', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('57', 'Cyprus', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('58', 'Czech Republic', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('59', 'Germany', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('60', 'Djibouti', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('61', 'Denmark', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('62', 'Dominica', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('63', 'Dominican Republic', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('64', 'Algeria', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('65', 'Ecuador', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('66', 'Estonia', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('67', 'Egypt', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('68', 'Western Sahara', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('69', 'Eritrea', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('70', 'Spain', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('71', 'Ethiopia', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('72', 'Finland', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('73', 'Fiji', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('74', 'Falkland Islands (Malvinas)', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('75', 'Federated States of Micronesia', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('76', 'Faroe Islands', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('77', 'France', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('78', 'France, Metropolitan', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('79', 'Gabon', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('80', 'United Kingdom', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('81', 'Grenada', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('82', 'Georgia', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('83', 'French Guiana', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('84', 'Ghana', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('85', 'Gibraltar', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('86', 'Greenland', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('87', 'Gambia', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('88', 'Guinea', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('89', 'Guadeloupe', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('90', 'Equatorial Guinea', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('91', 'Greece', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('92', 'S. Georgia and S. Sandwich Islands', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('93', 'Guatemala', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('94', 'Guam', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('95', 'Guinea-Bissau', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('96', 'Guyana', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('97', 'Hong Kong', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('98', 'Heard Island and McDonald Islands', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('99', 'Honduras', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('100', 'Croatia', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('101', 'Haiti', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('102', 'Hungary', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('103', 'Indonesia', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('104', 'Ireland', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('105', 'Israel', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('106', 'India', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('107', 'British Indian Ocean Territory', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('108', 'Iraq', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('109', 'Iran', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('110', 'Iceland', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('111', 'Italy', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('112', 'Jamaica', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('113', 'Jordan', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('114', 'Japan', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('115', 'Kenya', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('116', 'Kyrgyzstan', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('117', 'Cambodia', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('118', 'Kiribati', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('119', 'Comoros', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('120', 'Saint Kitts and Nevis', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('121', 'Korea (North)', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('122', 'Korea', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('123', 'Kuwait', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('124', 'Cayman Islands', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('125', 'Kazakhstan', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('126', 'Laos', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('127', 'Lebanon', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('128', 'Saint Lucia', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('129', 'Liechtenstein', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('130', 'Sri Lanka', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('131', 'Liberia', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('132', 'Lesotho', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('133', 'Lithuania', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('134', 'Luxembourg', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('135', 'Latvia', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('136', 'Libya', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('137', 'Morocco', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('138', 'Monaco', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('139', 'Moldova', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('140', 'Madagascar', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('141', 'Marshall Islands', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('142', 'Macedonia', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('143', 'Mali', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('144', 'Myanmar', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('145', 'Mongolia', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('146', 'Macao', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('147', 'Northern Mariana Islands', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('148', 'Martinique', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('149', 'Mauritania', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('150', 'Montserrat', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('151', 'Malta', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('152', 'Mauritius', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('153', 'Maldives', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('154', 'Malawi', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('155', 'Mexico', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('156', 'Malaysia', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('157', 'Mozambique', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('158', 'Namibia', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('159', 'New Caledonia', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('160', 'Niger', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('161', 'Norfolk Island', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('162', 'Nigeria', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('163', 'Nicaragua', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('164', 'Netherlands', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('165', 'Norway', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('166', 'Nepal', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('167', 'Nauru', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('168', 'Niue', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('169', 'New Zealand', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('170', 'Sultanate of Oman', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('171', 'Other', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('172', 'Panama', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('173', 'Peru', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('174', 'French Polynesia', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('175', 'Papua New Guinea', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('176', 'Philippines', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('177', 'Pakistan', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('178', 'Poland', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('179', 'Saint Pierre and Miquelon', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('180', 'Pitcairn', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('181', 'Puerto Rico', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('182', 'Palestinian Territory', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('183', 'Portugal', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('184', 'Palau', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('185', 'Paraguay', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('186', 'Qatar', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('187', 'Reunion', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('188', 'Romania', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('189', 'Russian Federation', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('190', 'Rwanda', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('191', 'Saudi Arabia', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('192', 'Solomon Islands', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('193', 'Seychelles', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('194', 'Sudan', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('195', 'Sweden', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('196', 'Singapore', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('197', 'Saint Helena', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('198', 'Slovenia', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('199', 'Svalbard and Jan Mayen', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('200', 'Slovak Republic', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('201', 'Sierra Leone', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('202', 'San Marino', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('203', 'Senegal', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('204', 'Somalia', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('205', 'Suriname', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('206', 'Sao Tome and Principe', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('207', 'El Salvador', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('208', 'Syria', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('209', 'Swaziland', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('210', 'Turks and Caicos Islands', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('211', 'Chad', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('212', 'French Southern Territories', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('213', 'Togo', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('214', 'Thailand', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('215', 'Tajikistan', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('216', 'Tokelau', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('217', 'Timor-Leste', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('218', 'Turkmenistan', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('219', 'Tunisia', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('220', 'Tonga', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('221', 'East Timor', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('222', 'Turkey', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('223', 'Trinidad and Tobago', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('224', 'Tuvalu', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('225', 'Taiwan', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('226', 'Tanzania', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('227', 'Ukraine', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('228', 'Uganda', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('229', 'United States', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('230', 'Uruguay', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('231', 'Uzbekistan', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('232', 'Vatican City State (Holy See)', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('233', 'Saint Vincent and the Grenadines', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('234', 'Venezuela', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('235', 'Virgin Islands (British)', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('236', 'Virgin Islands (U.S.)', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('237', 'Viet Nam', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('238', 'Vanuatu', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('239', 'Wallis and Futuna', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('240', 'Samoa', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('241', 'Yemen', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('242', 'Mayotte', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('243', 'Yugoslavia', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('244', 'South Africa', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('245', 'Zambia', null, '2013-01-30 12:56:12');
INSERT INTO `settings_country` VALUES ('246', 'Zimbabwe', null, '2013-01-30 12:56:12');

-- ----------------------------
-- Table structure for settings_currency
-- ----------------------------
DROP TABLE IF EXISTS `settings_currency`;
CREATE TABLE `settings_currency` (
  `id` varchar(60) NOT NULL,
  `symbol` varchar(30) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  UNIQUE KEY `name` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of settings_currency
-- ----------------------------
INSERT INTO `settings_currency` VALUES ('KES', 'KSh. ', '2013-10-11 14:07:05', null);
INSERT INTO `settings_currency` VALUES ('USD', '\'&dollar;\'', '2014-01-22 01:43:00', null);

-- ----------------------------
-- Table structure for settings_email_template
-- ----------------------------
DROP TABLE IF EXISTS `settings_email_template`;
CREATE TABLE `settings_email_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(128) NOT NULL,
  `description` varchar(128) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `from` varchar(255) NOT NULL,
  `comments` text,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of settings_email_template
-- ----------------------------
INSERT INTO `settings_email_template` VALUES ('2', 'amaco_licenses_renewal', 'Amaco Vehicle licenses renuwal', 'AMACO Licence Renuwal', '<p>\r\n	   Dear Customer;\r\n</p>\r\n<p>\r\n	   Your policy FOR vehicle Reg NO {<strong>registration</strong>}  is due for renewal/extension on {<strong>date</strong>}.  Kindly arrange to renew it.\r\n</p>\r\n<p>\r\n	   Contact your AGENT / BROKER OR AMACO.\r\n</p>', 'noreply@toamaoni.co.ke', 'Placeholders: {name}=> The Admin full name, {username}=>admin username, {email}=>admin email,{password} => The new password, {link}=> Login link ', '2013-09-28 02:43:30', '2');
INSERT INTO `settings_email_template` VALUES ('3', 'forgot_password', 'Email sent to a user who forgot his/her password to asssist in password recovery', 'Password Recovery', '<p>\r\n	  Hello {name},\r\n</p>\r\n  Please <a target=\"_blank\" rel=\"nofollow\" href=\"http://{link}\">click here</a> or copy and paste this link: {link} to your browser to change your password.<br>\r\n<p>\r\n	    If you never initiated this password recovery process, please just ignore this email.\r\n</p>\r\n<p>\r\n	  Smart County Team\r\n</p>', 'noreply@toamaoni.co.ke', 'Placehoders: {name}=>The name of the user, {link}=>link for reseting password', '2013-09-28 02:43:48', '2');
INSERT INTO `settings_email_template` VALUES ('5', 'new_user', 'Email sent to a new user when informing the user of his/her new account.', 'Login Details', '<p>\r\n	     Hi {name},\r\n</p>\r\n<p>\r\n	     Your account for {site_name} has been created. These are your login details:\r\n</p>\r\n<ul>\r\n	<li>Username :<strong>{username}</strong> or <strong>{email}</strong></li>\r\n	<li>Password:<strong>{password}</strong></li>\r\n</ul>\r\n      To login now please  <a target=\"_blank\" rel=\"nofollow\" href=\"http://{link}\">click here</a>\r\n<p>\r\n	  or copy and paste this link to your browser: {link}\r\n</p>\r\n<p>\r\n	Smart County Team\r\n</p>', 'noreply@toamaoni.co.ke', null, '2013-12-17 14:58:05', '1');

-- ----------------------------
-- Table structure for settings_timezone
-- ----------------------------
DROP TABLE IF EXISTS `settings_timezone`;
CREATE TABLE `settings_timezone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=462 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of settings_timezone
-- ----------------------------
INSERT INTO `settings_timezone` VALUES ('2', 'Africa/Abidjan');
INSERT INTO `settings_timezone` VALUES ('3', 'Africa/Accra');
INSERT INTO `settings_timezone` VALUES ('4', 'Africa/Addis_Ababa');
INSERT INTO `settings_timezone` VALUES ('5', 'Africa/Algiers');
INSERT INTO `settings_timezone` VALUES ('6', 'Africa/Asmara');
INSERT INTO `settings_timezone` VALUES ('7', 'Africa/Asmera');
INSERT INTO `settings_timezone` VALUES ('8', 'Africa/Bamako');
INSERT INTO `settings_timezone` VALUES ('9', 'Africa/Bangui');
INSERT INTO `settings_timezone` VALUES ('10', 'Africa/Banjul');
INSERT INTO `settings_timezone` VALUES ('11', 'Africa/Bissau');
INSERT INTO `settings_timezone` VALUES ('12', 'Africa/Blantyre');
INSERT INTO `settings_timezone` VALUES ('13', 'Africa/Brazzaville');
INSERT INTO `settings_timezone` VALUES ('14', 'Africa/Bujumbura');
INSERT INTO `settings_timezone` VALUES ('15', 'Africa/Cairo');
INSERT INTO `settings_timezone` VALUES ('16', 'Africa/Casablanca');
INSERT INTO `settings_timezone` VALUES ('17', 'Africa/Ceuta');
INSERT INTO `settings_timezone` VALUES ('18', 'Africa/Conakry');
INSERT INTO `settings_timezone` VALUES ('19', 'Africa/Dakar');
INSERT INTO `settings_timezone` VALUES ('20', 'Africa/Dar_es_Salaam');
INSERT INTO `settings_timezone` VALUES ('21', 'Africa/Djibouti');
INSERT INTO `settings_timezone` VALUES ('22', 'Africa/Douala');
INSERT INTO `settings_timezone` VALUES ('23', 'Africa/El_Aaiun');
INSERT INTO `settings_timezone` VALUES ('24', 'Africa/Freetown');
INSERT INTO `settings_timezone` VALUES ('25', 'Africa/Gaborone');
INSERT INTO `settings_timezone` VALUES ('26', 'Africa/Harare');
INSERT INTO `settings_timezone` VALUES ('27', 'Africa/Johannesburg');
INSERT INTO `settings_timezone` VALUES ('28', 'Africa/Kampala');
INSERT INTO `settings_timezone` VALUES ('29', 'Africa/Khartoum');
INSERT INTO `settings_timezone` VALUES ('30', 'Africa/Kigali');
INSERT INTO `settings_timezone` VALUES ('31', 'Africa/Kinshasa');
INSERT INTO `settings_timezone` VALUES ('32', 'Africa/Lagos');
INSERT INTO `settings_timezone` VALUES ('33', 'Africa/Libreville');
INSERT INTO `settings_timezone` VALUES ('34', 'Africa/Lome');
INSERT INTO `settings_timezone` VALUES ('35', 'Africa/Luanda');
INSERT INTO `settings_timezone` VALUES ('36', 'Africa/Lubumbashi');
INSERT INTO `settings_timezone` VALUES ('37', 'Africa/Lusaka');
INSERT INTO `settings_timezone` VALUES ('38', 'Africa/Malabo');
INSERT INTO `settings_timezone` VALUES ('39', 'Africa/Maputo');
INSERT INTO `settings_timezone` VALUES ('40', 'Africa/Maseru');
INSERT INTO `settings_timezone` VALUES ('41', 'Africa/Mbabane');
INSERT INTO `settings_timezone` VALUES ('42', 'Africa/Mogadishu');
INSERT INTO `settings_timezone` VALUES ('43', 'Africa/Monrovia');
INSERT INTO `settings_timezone` VALUES ('44', 'Africa/Nairobi');
INSERT INTO `settings_timezone` VALUES ('45', 'Africa/Ndjamena');
INSERT INTO `settings_timezone` VALUES ('46', 'Africa/Niamey');
INSERT INTO `settings_timezone` VALUES ('47', 'Africa/Nouakchott');
INSERT INTO `settings_timezone` VALUES ('48', 'Africa/Ouagadougou');
INSERT INTO `settings_timezone` VALUES ('49', 'Africa/Porto-Novo');
INSERT INTO `settings_timezone` VALUES ('50', 'Africa/Sao_Tome');
INSERT INTO `settings_timezone` VALUES ('51', 'Africa/Timbuktu');
INSERT INTO `settings_timezone` VALUES ('52', 'Africa/Tripoli');
INSERT INTO `settings_timezone` VALUES ('53', 'Africa/Tunis');
INSERT INTO `settings_timezone` VALUES ('54', 'Africa/Windhoek');
INSERT INTO `settings_timezone` VALUES ('55', 'America/Adak');
INSERT INTO `settings_timezone` VALUES ('56', 'America/Anchorage');
INSERT INTO `settings_timezone` VALUES ('57', 'America/Anguilla');
INSERT INTO `settings_timezone` VALUES ('58', 'America/Antigua');
INSERT INTO `settings_timezone` VALUES ('59', 'America/Araguaina');
INSERT INTO `settings_timezone` VALUES ('60', 'America/Argentina/Buenos_Aires');
INSERT INTO `settings_timezone` VALUES ('61', 'America/Argentina/Catamarca');
INSERT INTO `settings_timezone` VALUES ('62', 'America/Argentina/ComodRivadavia');
INSERT INTO `settings_timezone` VALUES ('63', 'America/Argentina/Cordoba');
INSERT INTO `settings_timezone` VALUES ('64', 'America/Argentina/Jujuy');
INSERT INTO `settings_timezone` VALUES ('65', 'America/Argentina/La_Rioja');
INSERT INTO `settings_timezone` VALUES ('66', 'America/Argentina/Mendoza');
INSERT INTO `settings_timezone` VALUES ('67', 'America/Argentina/Rio_Gallegos');
INSERT INTO `settings_timezone` VALUES ('68', 'America/Argentina/Salta');
INSERT INTO `settings_timezone` VALUES ('69', 'America/Argentina/San_Juan');
INSERT INTO `settings_timezone` VALUES ('70', 'America/Argentina/San_Luis');
INSERT INTO `settings_timezone` VALUES ('71', 'America/Argentina/Tucuman');
INSERT INTO `settings_timezone` VALUES ('72', 'America/Argentina/Ushuaia');
INSERT INTO `settings_timezone` VALUES ('73', 'America/Aruba');
INSERT INTO `settings_timezone` VALUES ('74', 'America/Asuncion');
INSERT INTO `settings_timezone` VALUES ('75', 'America/Atikokan');
INSERT INTO `settings_timezone` VALUES ('76', 'America/Atka');
INSERT INTO `settings_timezone` VALUES ('77', 'America/Bahia');
INSERT INTO `settings_timezone` VALUES ('78', 'America/Bahia_Banderas');
INSERT INTO `settings_timezone` VALUES ('79', 'America/Barbados');
INSERT INTO `settings_timezone` VALUES ('80', 'America/Belem');
INSERT INTO `settings_timezone` VALUES ('81', 'America/Belize');
INSERT INTO `settings_timezone` VALUES ('82', 'America/Blanc-Sablon');
INSERT INTO `settings_timezone` VALUES ('83', 'America/Boa_Vista');
INSERT INTO `settings_timezone` VALUES ('84', 'America/Bogota');
INSERT INTO `settings_timezone` VALUES ('85', 'America/Boise');
INSERT INTO `settings_timezone` VALUES ('86', 'America/Buenos_Aires');
INSERT INTO `settings_timezone` VALUES ('87', 'America/Cambridge_Bay');
INSERT INTO `settings_timezone` VALUES ('88', 'America/Campo_Grande');
INSERT INTO `settings_timezone` VALUES ('89', 'America/Cancun');
INSERT INTO `settings_timezone` VALUES ('90', 'America/Caracas');
INSERT INTO `settings_timezone` VALUES ('91', 'America/Catamarca');
INSERT INTO `settings_timezone` VALUES ('92', 'America/Cayenne');
INSERT INTO `settings_timezone` VALUES ('93', 'America/Cayman');
INSERT INTO `settings_timezone` VALUES ('94', 'America/Chicago');
INSERT INTO `settings_timezone` VALUES ('95', 'America/Chihuahua');
INSERT INTO `settings_timezone` VALUES ('96', 'America/Coral_Harbour');
INSERT INTO `settings_timezone` VALUES ('97', 'America/Cordoba');
INSERT INTO `settings_timezone` VALUES ('98', 'America/Costa_Rica');
INSERT INTO `settings_timezone` VALUES ('99', 'America/Cuiaba');
INSERT INTO `settings_timezone` VALUES ('100', 'America/Curacao');
INSERT INTO `settings_timezone` VALUES ('101', 'America/Danmarkshavn');
INSERT INTO `settings_timezone` VALUES ('102', 'America/Dawson');
INSERT INTO `settings_timezone` VALUES ('103', 'America/Dawson_Creek');
INSERT INTO `settings_timezone` VALUES ('104', 'America/Denver');
INSERT INTO `settings_timezone` VALUES ('105', 'America/Detroit');
INSERT INTO `settings_timezone` VALUES ('106', 'America/Dominica');
INSERT INTO `settings_timezone` VALUES ('107', 'America/Edmonton');
INSERT INTO `settings_timezone` VALUES ('108', 'America/Eirunepe');
INSERT INTO `settings_timezone` VALUES ('109', 'America/El_Salvador');
INSERT INTO `settings_timezone` VALUES ('110', 'America/Ensenada');
INSERT INTO `settings_timezone` VALUES ('111', 'America/Fortaleza');
INSERT INTO `settings_timezone` VALUES ('112', 'America/Fort_Wayne');
INSERT INTO `settings_timezone` VALUES ('113', 'America/Glace_Bay');
INSERT INTO `settings_timezone` VALUES ('114', 'America/Godthab');
INSERT INTO `settings_timezone` VALUES ('115', 'America/Goose_Bay');
INSERT INTO `settings_timezone` VALUES ('116', 'America/Grand_Turk');
INSERT INTO `settings_timezone` VALUES ('117', 'America/Grenada');
INSERT INTO `settings_timezone` VALUES ('118', 'America/Guadeloupe');
INSERT INTO `settings_timezone` VALUES ('119', 'America/Guatemala');
INSERT INTO `settings_timezone` VALUES ('120', 'America/Guayaquil');
INSERT INTO `settings_timezone` VALUES ('121', 'America/Guyana');
INSERT INTO `settings_timezone` VALUES ('122', 'America/Halifax');
INSERT INTO `settings_timezone` VALUES ('123', 'America/Havana');
INSERT INTO `settings_timezone` VALUES ('124', 'America/Hermosillo');
INSERT INTO `settings_timezone` VALUES ('125', 'America/Indiana/Indianapolis');
INSERT INTO `settings_timezone` VALUES ('126', 'America/Indiana/Knox');
INSERT INTO `settings_timezone` VALUES ('127', 'America/Indiana/Marengo');
INSERT INTO `settings_timezone` VALUES ('128', 'America/Indiana/Petersburg');
INSERT INTO `settings_timezone` VALUES ('129', 'America/Indianapolis');
INSERT INTO `settings_timezone` VALUES ('130', 'America/Indiana/Tell_City');
INSERT INTO `settings_timezone` VALUES ('131', 'America/Indiana/Vevay');
INSERT INTO `settings_timezone` VALUES ('132', 'America/Indiana/Vincennes');
INSERT INTO `settings_timezone` VALUES ('133', 'America/Indiana/Winamac');
INSERT INTO `settings_timezone` VALUES ('134', 'America/Inuvik');
INSERT INTO `settings_timezone` VALUES ('135', 'America/Iqaluit');
INSERT INTO `settings_timezone` VALUES ('136', 'America/Jamaica');
INSERT INTO `settings_timezone` VALUES ('137', 'America/Jujuy');
INSERT INTO `settings_timezone` VALUES ('138', 'America/Juneau');
INSERT INTO `settings_timezone` VALUES ('139', 'America/Kentucky/Louisville');
INSERT INTO `settings_timezone` VALUES ('140', 'America/Kentucky/Monticello');
INSERT INTO `settings_timezone` VALUES ('141', 'America/Knox_IN');
INSERT INTO `settings_timezone` VALUES ('142', 'America/La_Paz');
INSERT INTO `settings_timezone` VALUES ('143', 'America/Lima');
INSERT INTO `settings_timezone` VALUES ('144', 'America/Los_Angeles');
INSERT INTO `settings_timezone` VALUES ('145', 'America/Louisville');
INSERT INTO `settings_timezone` VALUES ('146', 'America/Maceio');
INSERT INTO `settings_timezone` VALUES ('147', 'America/Managua');
INSERT INTO `settings_timezone` VALUES ('148', 'America/Manaus');
INSERT INTO `settings_timezone` VALUES ('149', 'America/Marigot');
INSERT INTO `settings_timezone` VALUES ('150', 'America/Martinique');
INSERT INTO `settings_timezone` VALUES ('151', 'America/Matamoros');
INSERT INTO `settings_timezone` VALUES ('152', 'America/Mazatlan');
INSERT INTO `settings_timezone` VALUES ('153', 'America/Mendoza');
INSERT INTO `settings_timezone` VALUES ('154', 'America/Menominee');
INSERT INTO `settings_timezone` VALUES ('155', 'America/Merida');
INSERT INTO `settings_timezone` VALUES ('156', 'America/Metlakatla');
INSERT INTO `settings_timezone` VALUES ('157', 'America/Mexico_City');
INSERT INTO `settings_timezone` VALUES ('158', 'America/Miquelon');
INSERT INTO `settings_timezone` VALUES ('159', 'America/Moncton');
INSERT INTO `settings_timezone` VALUES ('160', 'America/Monterrey');
INSERT INTO `settings_timezone` VALUES ('161', 'America/Montevideo');
INSERT INTO `settings_timezone` VALUES ('162', 'America/Montreal');
INSERT INTO `settings_timezone` VALUES ('163', 'America/Montserrat');
INSERT INTO `settings_timezone` VALUES ('164', 'America/Nassau');
INSERT INTO `settings_timezone` VALUES ('165', 'America/New_York');
INSERT INTO `settings_timezone` VALUES ('166', 'America/Nipigon');
INSERT INTO `settings_timezone` VALUES ('167', 'America/Nome');
INSERT INTO `settings_timezone` VALUES ('168', 'America/Noronha');
INSERT INTO `settings_timezone` VALUES ('169', 'America/North_Dakota/Beulah');
INSERT INTO `settings_timezone` VALUES ('170', 'America/North_Dakota/Center');
INSERT INTO `settings_timezone` VALUES ('171', 'America/North_Dakota/New_Salem');
INSERT INTO `settings_timezone` VALUES ('172', 'America/Ojinaga');
INSERT INTO `settings_timezone` VALUES ('173', 'America/Panama');
INSERT INTO `settings_timezone` VALUES ('174', 'America/Pangnirtung');
INSERT INTO `settings_timezone` VALUES ('175', 'America/Paramaribo');
INSERT INTO `settings_timezone` VALUES ('176', 'America/Phoenix');
INSERT INTO `settings_timezone` VALUES ('177', 'America/Port-au-Prince');
INSERT INTO `settings_timezone` VALUES ('178', 'America/Porto_Acre');
INSERT INTO `settings_timezone` VALUES ('179', 'America/Port_of_Spain');
INSERT INTO `settings_timezone` VALUES ('180', 'America/Porto_Velho');
INSERT INTO `settings_timezone` VALUES ('181', 'America/Puerto_Rico');
INSERT INTO `settings_timezone` VALUES ('182', 'America/Rainy_River');
INSERT INTO `settings_timezone` VALUES ('183', 'America/Rankin_Inlet');
INSERT INTO `settings_timezone` VALUES ('184', 'America/Recife');
INSERT INTO `settings_timezone` VALUES ('185', 'America/Regina');
INSERT INTO `settings_timezone` VALUES ('186', 'America/Resolute');
INSERT INTO `settings_timezone` VALUES ('187', 'America/Rio_Branco');
INSERT INTO `settings_timezone` VALUES ('188', 'America/Rosario');
INSERT INTO `settings_timezone` VALUES ('189', 'America/Santa_Isabel');
INSERT INTO `settings_timezone` VALUES ('190', 'America/Santarem');
INSERT INTO `settings_timezone` VALUES ('191', 'America/Santiago');
INSERT INTO `settings_timezone` VALUES ('192', 'America/Santo_Domingo');
INSERT INTO `settings_timezone` VALUES ('193', 'America/Sao_Paulo');
INSERT INTO `settings_timezone` VALUES ('194', 'America/Scoresbysund');
INSERT INTO `settings_timezone` VALUES ('195', 'America/Shiprock');
INSERT INTO `settings_timezone` VALUES ('196', 'America/Sitka');
INSERT INTO `settings_timezone` VALUES ('197', 'America/St_Barthelemy');
INSERT INTO `settings_timezone` VALUES ('198', 'America/St_Johns');
INSERT INTO `settings_timezone` VALUES ('199', 'America/St_Kitts');
INSERT INTO `settings_timezone` VALUES ('200', 'America/St_Lucia');
INSERT INTO `settings_timezone` VALUES ('201', 'America/St_Thomas');
INSERT INTO `settings_timezone` VALUES ('202', 'America/St_Vincent');
INSERT INTO `settings_timezone` VALUES ('203', 'America/Swift_Current');
INSERT INTO `settings_timezone` VALUES ('204', 'America/Tegucigalpa');
INSERT INTO `settings_timezone` VALUES ('205', 'America/Thule');
INSERT INTO `settings_timezone` VALUES ('206', 'America/Thunder_Bay');
INSERT INTO `settings_timezone` VALUES ('207', 'America/Tijuana');
INSERT INTO `settings_timezone` VALUES ('208', 'America/Toronto');
INSERT INTO `settings_timezone` VALUES ('209', 'America/Tortola');
INSERT INTO `settings_timezone` VALUES ('210', 'America/Vancouver');
INSERT INTO `settings_timezone` VALUES ('211', 'America/Virgin');
INSERT INTO `settings_timezone` VALUES ('212', 'America/Whitehorse');
INSERT INTO `settings_timezone` VALUES ('213', 'America/Winnipeg');
INSERT INTO `settings_timezone` VALUES ('214', 'America/Yakutat');
INSERT INTO `settings_timezone` VALUES ('215', 'America/Yellowknife');
INSERT INTO `settings_timezone` VALUES ('216', 'Antarctica/Casey');
INSERT INTO `settings_timezone` VALUES ('217', 'Antarctica/Davis');
INSERT INTO `settings_timezone` VALUES ('218', 'Antarctica/DumontDUrville');
INSERT INTO `settings_timezone` VALUES ('219', 'Antarctica/Macquarie');
INSERT INTO `settings_timezone` VALUES ('220', 'Antarctica/Mawson');
INSERT INTO `settings_timezone` VALUES ('221', 'Antarctica/McMurdo');
INSERT INTO `settings_timezone` VALUES ('222', 'Antarctica/Palmer');
INSERT INTO `settings_timezone` VALUES ('223', 'Antarctica/Rothera');
INSERT INTO `settings_timezone` VALUES ('224', 'Antarctica/South_Pole');
INSERT INTO `settings_timezone` VALUES ('225', 'Antarctica/Syowa');
INSERT INTO `settings_timezone` VALUES ('226', 'Antarctica/Vostok');
INSERT INTO `settings_timezone` VALUES ('227', 'Arctic/Longyearbyen');
INSERT INTO `settings_timezone` VALUES ('228', 'Asia/Aden');
INSERT INTO `settings_timezone` VALUES ('229', 'Asia/Almaty');
INSERT INTO `settings_timezone` VALUES ('230', 'Asia/Amman');
INSERT INTO `settings_timezone` VALUES ('231', 'Asia/Anadyr');
INSERT INTO `settings_timezone` VALUES ('232', 'Asia/Aqtau');
INSERT INTO `settings_timezone` VALUES ('233', 'Asia/Aqtobe');
INSERT INTO `settings_timezone` VALUES ('234', 'Asia/Ashgabat');
INSERT INTO `settings_timezone` VALUES ('235', 'Asia/Ashkhabad');
INSERT INTO `settings_timezone` VALUES ('236', 'Asia/Baghdad');
INSERT INTO `settings_timezone` VALUES ('237', 'Asia/Bahrain');
INSERT INTO `settings_timezone` VALUES ('238', 'Asia/Baku');
INSERT INTO `settings_timezone` VALUES ('239', 'Asia/Bangkok');
INSERT INTO `settings_timezone` VALUES ('240', 'Asia/Beirut');
INSERT INTO `settings_timezone` VALUES ('241', 'Asia/Bishkek');
INSERT INTO `settings_timezone` VALUES ('242', 'Asia/Brunei');
INSERT INTO `settings_timezone` VALUES ('243', 'Asia/Calcutta');
INSERT INTO `settings_timezone` VALUES ('244', 'Asia/Choibalsan');
INSERT INTO `settings_timezone` VALUES ('245', 'Asia/Chongqing');
INSERT INTO `settings_timezone` VALUES ('246', 'Asia/Chungking');
INSERT INTO `settings_timezone` VALUES ('247', 'Asia/Colombo');
INSERT INTO `settings_timezone` VALUES ('248', 'Asia/Dacca');
INSERT INTO `settings_timezone` VALUES ('249', 'Asia/Damascus');
INSERT INTO `settings_timezone` VALUES ('250', 'Asia/Dhaka');
INSERT INTO `settings_timezone` VALUES ('251', 'Asia/Dili');
INSERT INTO `settings_timezone` VALUES ('252', 'Asia/Dubai');
INSERT INTO `settings_timezone` VALUES ('253', 'Asia/Dushanbe');
INSERT INTO `settings_timezone` VALUES ('254', 'Asia/Gaza');
INSERT INTO `settings_timezone` VALUES ('255', 'Asia/Harbin');
INSERT INTO `settings_timezone` VALUES ('256', 'Asia/Ho_Chi_Minh');
INSERT INTO `settings_timezone` VALUES ('257', 'Asia/Hong_Kong');
INSERT INTO `settings_timezone` VALUES ('258', 'Asia/Hovd');
INSERT INTO `settings_timezone` VALUES ('259', 'Asia/Irkutsk');
INSERT INTO `settings_timezone` VALUES ('260', 'Asia/Istanbul');
INSERT INTO `settings_timezone` VALUES ('261', 'Asia/Jakarta');
INSERT INTO `settings_timezone` VALUES ('262', 'Asia/Jayapura');
INSERT INTO `settings_timezone` VALUES ('263', 'Asia/Jerusalem');
INSERT INTO `settings_timezone` VALUES ('264', 'Asia/Kabul');
INSERT INTO `settings_timezone` VALUES ('265', 'Asia/Kamchatka');
INSERT INTO `settings_timezone` VALUES ('266', 'Asia/Karachi');
INSERT INTO `settings_timezone` VALUES ('267', 'Asia/Kashgar');
INSERT INTO `settings_timezone` VALUES ('268', 'Asia/Kathmandu');
INSERT INTO `settings_timezone` VALUES ('269', 'Asia/Katmandu');
INSERT INTO `settings_timezone` VALUES ('270', 'Asia/Kolkata');
INSERT INTO `settings_timezone` VALUES ('271', 'Asia/Krasnoyarsk');
INSERT INTO `settings_timezone` VALUES ('272', 'Asia/Kuala_Lumpur');
INSERT INTO `settings_timezone` VALUES ('273', 'Asia/Kuching');
INSERT INTO `settings_timezone` VALUES ('274', 'Asia/Kuwait');
INSERT INTO `settings_timezone` VALUES ('275', 'Asia/Macao');
INSERT INTO `settings_timezone` VALUES ('276', 'Asia/Macau');
INSERT INTO `settings_timezone` VALUES ('277', 'Asia/Magadan');
INSERT INTO `settings_timezone` VALUES ('278', 'Asia/Makassar');
INSERT INTO `settings_timezone` VALUES ('279', 'Asia/Manila');
INSERT INTO `settings_timezone` VALUES ('280', 'Asia/Muscat');
INSERT INTO `settings_timezone` VALUES ('281', 'Asia/Nicosia');
INSERT INTO `settings_timezone` VALUES ('282', 'Asia/Novokuznetsk');
INSERT INTO `settings_timezone` VALUES ('283', 'Asia/Novosibirsk');
INSERT INTO `settings_timezone` VALUES ('284', 'Asia/Omsk');
INSERT INTO `settings_timezone` VALUES ('285', 'Asia/Oral');
INSERT INTO `settings_timezone` VALUES ('286', 'Asia/Phnom_Penh');
INSERT INTO `settings_timezone` VALUES ('287', 'Asia/Pontianak');
INSERT INTO `settings_timezone` VALUES ('288', 'Asia/Pyongyang');
INSERT INTO `settings_timezone` VALUES ('289', 'Asia/Qatar');
INSERT INTO `settings_timezone` VALUES ('290', 'Asia/Qyzylorda');
INSERT INTO `settings_timezone` VALUES ('291', 'Asia/Rangoon');
INSERT INTO `settings_timezone` VALUES ('292', 'Asia/Riyadh');
INSERT INTO `settings_timezone` VALUES ('293', 'Asia/Saigon');
INSERT INTO `settings_timezone` VALUES ('294', 'Asia/Sakhalin');
INSERT INTO `settings_timezone` VALUES ('295', 'Asia/Samarkand');
INSERT INTO `settings_timezone` VALUES ('296', 'Asia/Seoul');
INSERT INTO `settings_timezone` VALUES ('297', 'Asia/Shanghai');
INSERT INTO `settings_timezone` VALUES ('298', 'Asia/Singapore');
INSERT INTO `settings_timezone` VALUES ('299', 'Asia/Taipei');
INSERT INTO `settings_timezone` VALUES ('300', 'Asia/Tashkent');
INSERT INTO `settings_timezone` VALUES ('301', 'Asia/Tbilisi');
INSERT INTO `settings_timezone` VALUES ('302', 'Asia/Tehran');
INSERT INTO `settings_timezone` VALUES ('303', 'Asia/Tel_Aviv');
INSERT INTO `settings_timezone` VALUES ('304', 'Asia/Thimbu');
INSERT INTO `settings_timezone` VALUES ('305', 'Asia/Thimphu');
INSERT INTO `settings_timezone` VALUES ('306', 'Asia/Tokyo');
INSERT INTO `settings_timezone` VALUES ('307', 'Asia/Ujung_Pandang');
INSERT INTO `settings_timezone` VALUES ('308', 'Asia/Ulaanbaatar');
INSERT INTO `settings_timezone` VALUES ('309', 'Asia/Ulan_Bator');
INSERT INTO `settings_timezone` VALUES ('310', 'Asia/Urumqi');
INSERT INTO `settings_timezone` VALUES ('311', 'Asia/Vientiane');
INSERT INTO `settings_timezone` VALUES ('312', 'Asia/Vladivostok');
INSERT INTO `settings_timezone` VALUES ('313', 'Asia/Yakutsk');
INSERT INTO `settings_timezone` VALUES ('314', 'Asia/Yekaterinburg');
INSERT INTO `settings_timezone` VALUES ('315', 'Asia/Yerevan');
INSERT INTO `settings_timezone` VALUES ('316', 'Atlantic/Azores');
INSERT INTO `settings_timezone` VALUES ('317', 'Atlantic/Bermuda');
INSERT INTO `settings_timezone` VALUES ('318', 'Atlantic/Canary');
INSERT INTO `settings_timezone` VALUES ('319', 'Atlantic/Cape_Verde');
INSERT INTO `settings_timezone` VALUES ('320', 'Atlantic/Faeroe');
INSERT INTO `settings_timezone` VALUES ('321', 'Atlantic/Faroe');
INSERT INTO `settings_timezone` VALUES ('322', 'Atlantic/Jan_Mayen');
INSERT INTO `settings_timezone` VALUES ('323', 'Atlantic/Madeira');
INSERT INTO `settings_timezone` VALUES ('324', 'Atlantic/Reykjavik');
INSERT INTO `settings_timezone` VALUES ('325', 'Atlantic/South_Georgia');
INSERT INTO `settings_timezone` VALUES ('326', 'Atlantic/Stanley');
INSERT INTO `settings_timezone` VALUES ('327', 'Atlantic/St_Helena');
INSERT INTO `settings_timezone` VALUES ('328', 'Australia/ACT');
INSERT INTO `settings_timezone` VALUES ('329', 'Australia/Adelaide');
INSERT INTO `settings_timezone` VALUES ('330', 'Australia/Brisbane');
INSERT INTO `settings_timezone` VALUES ('331', 'Australia/Broken_Hill');
INSERT INTO `settings_timezone` VALUES ('332', 'Australia/Canberra');
INSERT INTO `settings_timezone` VALUES ('333', 'Australia/Currie');
INSERT INTO `settings_timezone` VALUES ('334', 'Australia/Darwin');
INSERT INTO `settings_timezone` VALUES ('335', 'Australia/Eucla');
INSERT INTO `settings_timezone` VALUES ('336', 'Australia/Hobart');
INSERT INTO `settings_timezone` VALUES ('337', 'Australia/LHI');
INSERT INTO `settings_timezone` VALUES ('338', 'Australia/Lindeman');
INSERT INTO `settings_timezone` VALUES ('339', 'Australia/Lord_Howe');
INSERT INTO `settings_timezone` VALUES ('340', 'Australia/Melbourne');
INSERT INTO `settings_timezone` VALUES ('341', 'Australia/North');
INSERT INTO `settings_timezone` VALUES ('342', 'Australia/NSW');
INSERT INTO `settings_timezone` VALUES ('343', 'Australia/Perth');
INSERT INTO `settings_timezone` VALUES ('344', 'Australia/Queensland');
INSERT INTO `settings_timezone` VALUES ('345', 'Australia/South');
INSERT INTO `settings_timezone` VALUES ('346', 'Australia/Sydney');
INSERT INTO `settings_timezone` VALUES ('347', 'Australia/Tasmania');
INSERT INTO `settings_timezone` VALUES ('348', 'Australia/Victoria');
INSERT INTO `settings_timezone` VALUES ('349', 'Australia/West');
INSERT INTO `settings_timezone` VALUES ('350', 'Australia/Yancowinna');
INSERT INTO `settings_timezone` VALUES ('351', 'Europe/Amsterdam');
INSERT INTO `settings_timezone` VALUES ('352', 'Europe/Andorra');
INSERT INTO `settings_timezone` VALUES ('353', 'Europe/Athens');
INSERT INTO `settings_timezone` VALUES ('354', 'Europe/Belfast');
INSERT INTO `settings_timezone` VALUES ('355', 'Europe/Belgrade');
INSERT INTO `settings_timezone` VALUES ('356', 'Europe/Berlin');
INSERT INTO `settings_timezone` VALUES ('357', 'Europe/Bratislava');
INSERT INTO `settings_timezone` VALUES ('358', 'Europe/Brussels');
INSERT INTO `settings_timezone` VALUES ('359', 'Europe/Bucharest');
INSERT INTO `settings_timezone` VALUES ('360', 'Europe/Budapest');
INSERT INTO `settings_timezone` VALUES ('361', 'Europe/Chisinau');
INSERT INTO `settings_timezone` VALUES ('362', 'Europe/Copenhagen');
INSERT INTO `settings_timezone` VALUES ('363', 'Europe/Dublin');
INSERT INTO `settings_timezone` VALUES ('364', 'Europe/Gibraltar');
INSERT INTO `settings_timezone` VALUES ('365', 'Europe/Guernsey');
INSERT INTO `settings_timezone` VALUES ('366', 'Europe/Helsinki');
INSERT INTO `settings_timezone` VALUES ('367', 'Europe/Isle_of_Man');
INSERT INTO `settings_timezone` VALUES ('368', 'Europe/Istanbul');
INSERT INTO `settings_timezone` VALUES ('369', 'Europe/Jersey');
INSERT INTO `settings_timezone` VALUES ('370', 'Europe/Kaliningrad');
INSERT INTO `settings_timezone` VALUES ('371', 'Europe/Kiev');
INSERT INTO `settings_timezone` VALUES ('372', 'Europe/Lisbon');
INSERT INTO `settings_timezone` VALUES ('373', 'Europe/Ljubljana');
INSERT INTO `settings_timezone` VALUES ('374', 'Europe/London');
INSERT INTO `settings_timezone` VALUES ('375', 'Europe/Luxembourg');
INSERT INTO `settings_timezone` VALUES ('376', 'Europe/Madrid');
INSERT INTO `settings_timezone` VALUES ('377', 'Europe/Malta');
INSERT INTO `settings_timezone` VALUES ('378', 'Europe/Mariehamn');
INSERT INTO `settings_timezone` VALUES ('379', 'Europe/Minsk');
INSERT INTO `settings_timezone` VALUES ('380', 'Europe/Monaco');
INSERT INTO `settings_timezone` VALUES ('381', 'Europe/Moscow');
INSERT INTO `settings_timezone` VALUES ('382', 'Europe/Nicosia');
INSERT INTO `settings_timezone` VALUES ('383', 'Europe/Oslo');
INSERT INTO `settings_timezone` VALUES ('384', 'Europe/Paris');
INSERT INTO `settings_timezone` VALUES ('385', 'Europe/Podgorica');
INSERT INTO `settings_timezone` VALUES ('386', 'Europe/Prague');
INSERT INTO `settings_timezone` VALUES ('387', 'Europe/Riga');
INSERT INTO `settings_timezone` VALUES ('388', 'Europe/Rome');
INSERT INTO `settings_timezone` VALUES ('389', 'Europe/Samara');
INSERT INTO `settings_timezone` VALUES ('390', 'Europe/San_Marino');
INSERT INTO `settings_timezone` VALUES ('391', 'Europe/Sarajevo');
INSERT INTO `settings_timezone` VALUES ('392', 'Europe/Simferopol');
INSERT INTO `settings_timezone` VALUES ('393', 'Europe/Skopje');
INSERT INTO `settings_timezone` VALUES ('394', 'Europe/Sofia');
INSERT INTO `settings_timezone` VALUES ('395', 'Europe/Stockholm');
INSERT INTO `settings_timezone` VALUES ('396', 'Europe/Tallinn');
INSERT INTO `settings_timezone` VALUES ('397', 'Europe/Tirane');
INSERT INTO `settings_timezone` VALUES ('398', 'Europe/Tiraspol');
INSERT INTO `settings_timezone` VALUES ('399', 'Europe/Uzhgorod');
INSERT INTO `settings_timezone` VALUES ('400', 'Europe/Vaduz');
INSERT INTO `settings_timezone` VALUES ('401', 'Europe/Vatican');
INSERT INTO `settings_timezone` VALUES ('402', 'Europe/Vienna');
INSERT INTO `settings_timezone` VALUES ('403', 'Europe/Vilnius');
INSERT INTO `settings_timezone` VALUES ('404', 'Europe/Volgograd');
INSERT INTO `settings_timezone` VALUES ('405', 'Europe/Warsaw');
INSERT INTO `settings_timezone` VALUES ('406', 'Europe/Zagreb');
INSERT INTO `settings_timezone` VALUES ('407', 'Europe/Zaporozhye');
INSERT INTO `settings_timezone` VALUES ('408', 'Europe/Zurich');
INSERT INTO `settings_timezone` VALUES ('409', 'Indian/Antananarivo');
INSERT INTO `settings_timezone` VALUES ('410', 'Indian/Chagos');
INSERT INTO `settings_timezone` VALUES ('411', 'Indian/Christmas');
INSERT INTO `settings_timezone` VALUES ('412', 'Indian/Cocos');
INSERT INTO `settings_timezone` VALUES ('413', 'Indian/Comoro');
INSERT INTO `settings_timezone` VALUES ('414', 'Indian/Kerguelen');
INSERT INTO `settings_timezone` VALUES ('415', 'Indian/Mahe');
INSERT INTO `settings_timezone` VALUES ('416', 'Indian/Maldives');
INSERT INTO `settings_timezone` VALUES ('417', 'Indian/Mauritius');
INSERT INTO `settings_timezone` VALUES ('418', 'Indian/Mayotte');
INSERT INTO `settings_timezone` VALUES ('419', 'Indian/Reunion');
INSERT INTO `settings_timezone` VALUES ('420', 'Pacific/Apia');
INSERT INTO `settings_timezone` VALUES ('421', 'Pacific/Auckland');
INSERT INTO `settings_timezone` VALUES ('422', 'Pacific/Chatham');
INSERT INTO `settings_timezone` VALUES ('423', 'Pacific/Chuuk');
INSERT INTO `settings_timezone` VALUES ('424', 'Pacific/Easter');
INSERT INTO `settings_timezone` VALUES ('425', 'Pacific/Efate');
INSERT INTO `settings_timezone` VALUES ('426', 'Pacific/Enderbury');
INSERT INTO `settings_timezone` VALUES ('427', 'Pacific/Fakaofo');
INSERT INTO `settings_timezone` VALUES ('428', 'Pacific/Fiji');
INSERT INTO `settings_timezone` VALUES ('429', 'Pacific/Funafuti');
INSERT INTO `settings_timezone` VALUES ('430', 'Pacific/Galapagos');
INSERT INTO `settings_timezone` VALUES ('431', 'Pacific/Gambier');
INSERT INTO `settings_timezone` VALUES ('432', 'Pacific/Guadalcanal');
INSERT INTO `settings_timezone` VALUES ('433', 'Pacific/Guam');
INSERT INTO `settings_timezone` VALUES ('434', 'Pacific/Honolulu');
INSERT INTO `settings_timezone` VALUES ('435', 'Pacific/Johnston');
INSERT INTO `settings_timezone` VALUES ('436', 'Pacific/Kiritimati');
INSERT INTO `settings_timezone` VALUES ('437', 'Pacific/Kosrae');
INSERT INTO `settings_timezone` VALUES ('438', 'Pacific/Kwajalein');
INSERT INTO `settings_timezone` VALUES ('439', 'Pacific/Majuro');
INSERT INTO `settings_timezone` VALUES ('440', 'Pacific/Marquesas');
INSERT INTO `settings_timezone` VALUES ('441', 'Pacific/Midway');
INSERT INTO `settings_timezone` VALUES ('442', 'Pacific/Nauru');
INSERT INTO `settings_timezone` VALUES ('443', 'Pacific/Niue');
INSERT INTO `settings_timezone` VALUES ('444', 'Pacific/Norfolk');
INSERT INTO `settings_timezone` VALUES ('445', 'Pacific/Noumea');
INSERT INTO `settings_timezone` VALUES ('446', 'Pacific/Pago_Pago');
INSERT INTO `settings_timezone` VALUES ('447', 'Pacific/Palau');
INSERT INTO `settings_timezone` VALUES ('448', 'Pacific/Pitcairn');
INSERT INTO `settings_timezone` VALUES ('449', 'Pacific/Pohnpei');
INSERT INTO `settings_timezone` VALUES ('450', 'Pacific/Ponape');
INSERT INTO `settings_timezone` VALUES ('451', 'Pacific/Port_Moresby');
INSERT INTO `settings_timezone` VALUES ('452', 'Pacific/Rarotonga');
INSERT INTO `settings_timezone` VALUES ('453', 'Pacific/Saipan');
INSERT INTO `settings_timezone` VALUES ('454', 'Pacific/Samoa');
INSERT INTO `settings_timezone` VALUES ('455', 'Pacific/Tahiti');
INSERT INTO `settings_timezone` VALUES ('456', 'Pacific/Tarawa');
INSERT INTO `settings_timezone` VALUES ('457', 'Pacific/Tongatapu');
INSERT INTO `settings_timezone` VALUES ('458', 'Pacific/Truk');
INSERT INTO `settings_timezone` VALUES ('459', 'Pacific/Wake');
INSERT INTO `settings_timezone` VALUES ('460', 'Pacific/Wallis');
INSERT INTO `settings_timezone` VALUES ('461', 'Pacific/Yap');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `email` varchar(128) NOT NULL,
  `status` enum('Pending','Active','Blocked') NOT NULL DEFAULT 'Pending',
  `timezone` varchar(60) DEFAULT NULL,
  `password` varchar(128) NOT NULL,
  `salt` varchar(128) NOT NULL,
  `password_reset_code` varchar(128) DEFAULT NULL,
  `password_reset_date` timestamp NULL DEFAULT NULL,
  `password_reset_request_date` timestamp NULL DEFAULT NULL,
  `activation_code` varchar(128) DEFAULT NULL,
  `user_level` varchar(30) NOT NULL,
  `client_id` int(5) NOT NULL,
  `role_id` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `last_modified` timestamp NULL DEFAULT NULL,
  `last_modified_by` int(11) unsigned DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `user_level` (`user_level`),
  KEY `role_id` (`role_id`),
  KEY `client_id` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'admin', 'jacjimus@gmail.com', 'Active', 'Africa/Nairobi', 'werwsa453dsss56542c1fbf9ab3e663d1d9b924eb4d51df', 'werwsa453dsss56', null, '2014-02-09 13:49:14', '2014-02-09 13:48:16', null, 'ENGINEER', '0', '2', '2014-02-06 00:56:19', null, '2014-07-23 08:32:17', '1', '2014-09-17 16:42:25');
INSERT INTO `users` VALUES ('4', 'partner', 'admin@partner.co.ke', 'Active', 'Africa/Nairobi', '29370f7f458aec187f650404a3187f16fd8a93e34f8b287b543393202754a5a9', '29370f7f458aec187f650404a3187f16', null, null, null, null, 'CLIENT', '27', '2', '2014-07-01 10:10:58', '1', '2014-07-04 19:48:31', '4', '2014-09-02 15:22:11');
INSERT INTO `users` VALUES ('5', 'brands', 'info@bransmedia.co.ke', 'Active', 'Africa/Nairobi', '1f9d662186507e106483cfd2e69060a5cddbe15cc06f02c0722a58fdc3dbe1c6', '1f9d662186507e106483cfd2e69060a5', null, null, null, null, 'CLIENT', '17', '4', '2014-07-04 11:39:37', '1', '2014-08-19 11:18:53', '8', '2014-08-19 11:28:04');
INSERT INTO `users` VALUES ('8', 'team', 'team@furahiamobile.com', 'Active', 'Africa/Nairobi', 'f2c42c81d2493d2b5258f9b7782b3073b7c3b1d3d98804510e95ea385122c638', 'f2c42c81d2493d2b5258f9b7782b3073', null, null, null, null, 'ADMIN', '0', '1', '2014-07-09 10:56:45', '1', '2014-07-23 08:35:17', '1', '2014-09-09 13:59:52');
INSERT INTO `users` VALUES ('9', 'Solomon', 'solomon@furahiamobile.com', 'Active', 'Africa/Nairobi', '69e6aef3f550bfb5e31924d572908415d3544f70e868c2a84d980650e6183045', '69e6aef3f550bfb5e31924d572908415', null, null, null, null, 'ADMIN', '0', '1', '2014-07-18 12:45:24', '1', '2014-07-23 08:30:16', '1', '2014-07-18 12:46:05');
INSERT INTO `users` VALUES ('10', 'amaco', 'kenedy.koros@amaco.co.ke', 'Active', 'Africa/Nairobi', '3f0660de5098701cf127fc80fb050848a636237b2fd8aad9c33f562534c511cc', '3f0660de5098701cf127fc80fb050848', null, null, null, null, 'CLIENT', '4', '5', '2014-07-21 17:19:03', '1', '2014-08-19 11:25:43', '1', '2014-09-03 07:53:19');

-- ----------------------------
-- Table structure for user_activity
-- ----------------------------
DROP TABLE IF EXISTS `user_activity`;
CREATE TABLE `user_activity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `type` enum('login','create','update','delete') NOT NULL,
  `description` text NOT NULL,
  `ip_address` varchar(30) DEFAULT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=373 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user_activity
-- ----------------------------
INSERT INTO `user_activity` VALUES ('1', '1', 'login', 'mconyango signed in successfully', '127.0.0.1', '2014-02-08 15:12:48');
INSERT INTO `user_activity` VALUES ('2', '1', 'login', 'mconyango signed in successfully', '127.0.0.1', '2014-02-08 15:33:11');
INSERT INTO `user_activity` VALUES ('3', '1', 'login', 'mconyango signed in successfully', '127.0.0.1', '2014-02-08 15:37:34');
INSERT INTO `user_activity` VALUES ('4', '1', 'login', 'mconyango signed in successfully', '127.0.0.1', '2014-02-08 21:58:42');
INSERT INTO `user_activity` VALUES ('5', '1', 'login', 'mconyango signed in successfully', '127.0.0.1', '2014-02-09 02:23:33');
INSERT INTO `user_activity` VALUES ('6', '1', 'login', 'mconyango signed in successfully', '127.0.0.1', '2014-02-09 13:48:06');
INSERT INTO `user_activity` VALUES ('7', '1', 'login', 'mconyango signed in successfully', '127.0.0.1', '2014-02-09 13:49:23');
INSERT INTO `user_activity` VALUES ('8', '1', 'login', 'mconyango signed in successfully', '127.0.0.1', '2014-02-10 11:58:21');
INSERT INTO `user_activity` VALUES ('9', '1', 'login', 'mconyango signed in successfully', '127.0.0.1', '2014-02-10 13:16:10');
INSERT INTO `user_activity` VALUES ('10', '1', 'login', 'mconyango signed in successfully', '127.0.0.1', '2014-02-10 13:27:42');
INSERT INTO `user_activity` VALUES ('11', '1', 'login', 'mconyango signed in successfully', '127.0.0.1', '2014-02-10 13:33:58');
INSERT INTO `user_activity` VALUES ('16', '1', 'login', 'mconyango signed in successfully', '127.0.0.1', '2014-02-10 19:11:52');
INSERT INTO `user_activity` VALUES ('17', '1', 'login', 'mconyango signed in successfully', '127.0.0.1', '2014-02-10 19:53:01');
INSERT INTO `user_activity` VALUES ('18', '1', 'login', 'admin signed in successfully', '::1', '2014-06-24 23:51:51');
INSERT INTO `user_activity` VALUES ('19', '1', 'login', 'admin signed in successfully', '::1', '2014-06-25 00:33:21');
INSERT INTO `user_activity` VALUES ('20', '1', 'login', 'admin signed in successfully', '::1', '2014-06-26 11:26:32');
INSERT INTO `user_activity` VALUES ('21', '1', 'login', 'admin signed in successfully', '::1', '2014-06-26 11:36:19');
INSERT INTO `user_activity` VALUES ('22', '1', 'login', 'admin signed in successfully', '::1', '2014-06-26 13:06:33');
INSERT INTO `user_activity` VALUES ('23', '1', 'login', 'admin signed in successfully', '::1', '2014-06-26 14:07:10');
INSERT INTO `user_activity` VALUES ('24', '1', 'login', 'admin signed in successfully', '::1', '2014-06-26 16:06:44');
INSERT INTO `user_activity` VALUES ('25', '1', 'login', 'admin signed in successfully', '::1', '2014-06-27 13:02:19');
INSERT INTO `user_activity` VALUES ('27', '1', 'login', 'admin signed in successfully', '::1', '2014-06-27 13:12:41');
INSERT INTO `user_activity` VALUES ('28', '1', 'login', 'admin signed in successfully', '::1', '2014-06-27 13:51:40');
INSERT INTO `user_activity` VALUES ('29', '1', 'login', 'admin signed in successfully', '::1', '2014-06-30 10:22:33');
INSERT INTO `user_activity` VALUES ('30', '1', 'login', 'admin signed in successfully', '::1', '2014-06-30 11:05:27');
INSERT INTO `user_activity` VALUES ('31', '1', 'login', 'admin signed in successfully', '::1', '2014-06-30 13:15:26');
INSERT INTO `user_activity` VALUES ('32', '1', 'login', 'admin signed in successfully', '::1', '2014-06-30 14:17:45');
INSERT INTO `user_activity` VALUES ('33', '1', 'login', 'admin signed in successfully', '::1', '2014-06-30 15:35:12');
INSERT INTO `user_activity` VALUES ('34', '1', 'login', 'admin signed in successfully', '::1', '2014-06-30 16:21:11');
INSERT INTO `user_activity` VALUES ('35', '1', 'login', 'admin signed in successfully', '::1', '2014-07-01 09:14:36');
INSERT INTO `user_activity` VALUES ('36', '1', 'login', 'admin signed in successfully', '::1', '2014-07-01 09:52:51');
INSERT INTO `user_activity` VALUES ('37', '4', 'login', 'partner signed in successfully', '::1', '2014-07-01 10:11:28');
INSERT INTO `user_activity` VALUES ('38', '1', 'login', 'admin signed in successfully', '::1', '2014-07-01 10:12:14');
INSERT INTO `user_activity` VALUES ('39', '1', 'login', 'admin signed in successfully', '::1', '2014-07-01 10:42:45');
INSERT INTO `user_activity` VALUES ('40', '1', 'login', 'admin signed in successfully', '::1', '2014-07-01 10:49:03');
INSERT INTO `user_activity` VALUES ('41', '1', 'login', 'admin signed in successfully', '::1', '2014-07-01 10:50:23');
INSERT INTO `user_activity` VALUES ('42', '1', 'login', 'admin signed in successfully', '::1', '2014-07-01 10:50:44');
INSERT INTO `user_activity` VALUES ('43', '1', 'login', 'admin signed in successfully', '::1', '2014-07-01 11:18:21');
INSERT INTO `user_activity` VALUES ('44', '4', 'login', 'partner signed in successfully', '::1', '2014-07-01 13:32:44');
INSERT INTO `user_activity` VALUES ('45', '1', 'login', 'admin signed in successfully', '::1', '2014-07-01 14:04:02');
INSERT INTO `user_activity` VALUES ('46', '1', 'login', 'admin signed in successfully', '192.168.1.6', '2014-07-01 14:05:58');
INSERT INTO `user_activity` VALUES ('47', '1', 'login', 'admin signed in successfully', '192.168.1.6', '2014-07-01 14:06:12');
INSERT INTO `user_activity` VALUES ('48', '1', 'login', 'admin signed in successfully', '::1', '2014-07-01 14:06:16');
INSERT INTO `user_activity` VALUES ('49', '1', 'login', 'admin signed in successfully', '::1', '2014-07-01 14:06:30');
INSERT INTO `user_activity` VALUES ('50', '1', 'login', 'admin signed in successfully', '::1', '2014-07-01 14:08:07');
INSERT INTO `user_activity` VALUES ('51', '4', 'login', 'partner signed in successfully', '192.168.1.6', '2014-07-01 14:09:04');
INSERT INTO `user_activity` VALUES ('52', '1', 'login', 'admin signed in successfully', '::1', '2014-07-01 14:09:50');
INSERT INTO `user_activity` VALUES ('53', '1', 'login', 'admin signed in successfully', '192.168.1.6', '2014-07-01 14:12:47');
INSERT INTO `user_activity` VALUES ('54', '1', 'login', 'admin signed in successfully', '192.168.1.6', '2014-07-01 14:14:37');
INSERT INTO `user_activity` VALUES ('55', '1', 'login', 'admin signed in successfully', '192.168.1.6', '2014-07-01 14:15:15');
INSERT INTO `user_activity` VALUES ('56', '1', 'login', 'admin signed in successfully', '192.168.1.6', '2014-07-01 14:15:25');
INSERT INTO `user_activity` VALUES ('57', '1', 'login', 'admin signed in successfully', '192.168.1.6', '2014-07-01 14:17:40');
INSERT INTO `user_activity` VALUES ('58', '1', 'login', 'admin signed in successfully', '192.168.1.6', '2014-07-01 14:20:42');
INSERT INTO `user_activity` VALUES ('59', '1', 'login', 'admin signed in successfully', '192.168.1.6', '2014-07-01 14:25:10');
INSERT INTO `user_activity` VALUES ('60', '1', 'login', 'admin signed in successfully', '::1', '2014-07-01 14:30:20');
INSERT INTO `user_activity` VALUES ('61', '1', 'login', 'admin signed in successfully', '192.168.1.6', '2014-07-01 14:31:53');
INSERT INTO `user_activity` VALUES ('62', '1', 'login', 'admin signed in successfully', '192.168.1.6', '2014-07-01 14:42:17');
INSERT INTO `user_activity` VALUES ('63', '1', 'login', 'admin signed in successfully', '192.168.1.6', '2014-07-01 14:42:58');
INSERT INTO `user_activity` VALUES ('64', '1', 'login', 'admin signed in successfully', '192.168.1.6', '2014-07-01 14:43:30');
INSERT INTO `user_activity` VALUES ('65', '1', 'login', 'admin signed in successfully', '192.168.1.6', '2014-07-01 14:43:49');
INSERT INTO `user_activity` VALUES ('66', '1', 'login', 'admin signed in successfully', '192.168.1.6', '2014-07-01 14:44:08');
INSERT INTO `user_activity` VALUES ('67', '1', 'login', 'admin signed in successfully', '192.168.1.6', '2014-07-01 14:44:44');
INSERT INTO `user_activity` VALUES ('68', '1', 'login', 'admin signed in successfully', '192.168.1.6', '2014-07-01 14:45:54');
INSERT INTO `user_activity` VALUES ('69', '1', 'login', 'admin signed in successfully', '192.168.1.6', '2014-07-01 14:46:39');
INSERT INTO `user_activity` VALUES ('70', '1', 'login', 'admin signed in successfully', '192.168.1.6', '2014-07-01 14:58:55');
INSERT INTO `user_activity` VALUES ('71', '1', 'login', 'admin signed in successfully', '192.168.1.6', '2014-07-01 15:00:09');
INSERT INTO `user_activity` VALUES ('72', '1', 'login', 'admin signed in successfully', '192.168.1.6', '2014-07-01 15:02:48');
INSERT INTO `user_activity` VALUES ('73', '1', 'login', 'admin signed in successfully', '::1', '2014-07-01 15:05:05');
INSERT INTO `user_activity` VALUES ('74', '1', 'login', 'admin signed in successfully', '192.168.1.6', '2014-07-01 15:09:14');
INSERT INTO `user_activity` VALUES ('75', '1', 'login', 'admin signed in successfully', '192.168.1.6', '2014-07-01 15:22:49');
INSERT INTO `user_activity` VALUES ('76', '4', 'login', 'partner signed in successfully', '192.168.1.6', '2014-07-01 15:26:57');
INSERT INTO `user_activity` VALUES ('77', '1', 'login', 'admin signed in successfully', '192.168.1.6', '2014-07-01 15:33:34');
INSERT INTO `user_activity` VALUES ('78', '1', 'login', 'admin signed in successfully', '192.168.1.6', '2014-07-01 15:33:52');
INSERT INTO `user_activity` VALUES ('79', '1', 'login', 'admin signed in successfully', '192.168.1.6', '2014-07-01 15:35:36');
INSERT INTO `user_activity` VALUES ('80', '1', 'login', 'admin signed in successfully', '::1', '2014-07-04 11:35:48');
INSERT INTO `user_activity` VALUES ('81', '5', 'login', 'brands signed in successfully', '::1', '2014-07-04 11:39:56');
INSERT INTO `user_activity` VALUES ('82', '4', 'login', 'partner signed in successfully', '::1', '2014-07-04 11:41:42');
INSERT INTO `user_activity` VALUES ('83', '1', 'login', 'admin signed in successfully', '::1', '2014-07-04 12:59:26');
INSERT INTO `user_activity` VALUES ('84', '1', 'login', 'admin signed in successfully', '::1', '2014-07-04 16:40:29');
INSERT INTO `user_activity` VALUES ('85', '1', 'login', 'admin signed in successfully', '192.168.1.6', '2014-07-04 17:19:47');
INSERT INTO `user_activity` VALUES ('86', '1', 'login', 'admin signed in successfully', '::1', '2014-07-04 17:23:06');
INSERT INTO `user_activity` VALUES ('87', '1', 'login', 'admin signed in successfully', '192.168.1.6', '2014-07-04 17:31:28');
INSERT INTO `user_activity` VALUES ('88', '1', 'login', 'admin signed in successfully', '::1', '2014-07-04 18:23:56');
INSERT INTO `user_activity` VALUES ('89', '4', 'login', 'partner signed in successfully', '::1', '2014-07-04 18:24:15');
INSERT INTO `user_activity` VALUES ('90', '1', 'login', 'admin signed in successfully', '::1', '2014-07-04 18:56:55');
INSERT INTO `user_activity` VALUES ('91', '4', 'login', 'partner signed in successfully', '::1', '2014-07-04 19:37:53');
INSERT INTO `user_activity` VALUES ('92', '4', 'login', 'partner signed in successfully', '41.215.30.108', '2014-07-04 19:40:21');
INSERT INTO `user_activity` VALUES ('93', '1', 'login', 'admin signed in successfully', '::1', '2014-07-04 19:41:45');
INSERT INTO `user_activity` VALUES ('94', '4', 'login', 'partner signed in successfully', '::1', '2014-07-04 19:47:57');
INSERT INTO `user_activity` VALUES ('95', '4', 'login', 'partner signed in successfully', '::1', '2014-07-04 19:48:49');
INSERT INTO `user_activity` VALUES ('96', '1', 'login', 'admin signed in successfully', '::1', '2014-07-07 09:29:25');
INSERT INTO `user_activity` VALUES ('97', '1', 'login', 'admin signed in successfully', '::1', '2014-07-07 11:53:14');
INSERT INTO `user_activity` VALUES ('98', '1', 'login', 'admin signed in successfully', '::1', '2014-07-07 11:56:20');
INSERT INTO `user_activity` VALUES ('99', '1', 'login', 'admin signed in successfully', '192.168.1.6', '2014-07-07 11:59:08');
INSERT INTO `user_activity` VALUES ('100', '1', 'login', 'admin signed in successfully', '192.168.1.6', '2014-07-07 12:00:12');
INSERT INTO `user_activity` VALUES ('101', '1', 'login', 'admin signed in successfully', '192.168.1.6', '2014-07-07 12:11:05');
INSERT INTO `user_activity` VALUES ('102', '1', 'login', 'admin signed in successfully', '192.168.1.6', '2014-07-07 12:55:06');
INSERT INTO `user_activity` VALUES ('103', '1', 'login', 'admin signed in successfully', '192.168.1.6', '2014-07-07 12:55:28');
INSERT INTO `user_activity` VALUES ('104', '1', 'login', 'admin signed in successfully', '::1', '2014-07-07 14:16:52');
INSERT INTO `user_activity` VALUES ('105', '1', 'login', 'admin signed in successfully', '192.168.1.6', '2014-07-07 14:17:54');
INSERT INTO `user_activity` VALUES ('106', '1', 'login', 'admin signed in successfully', '::1', '2014-07-07 15:56:03');
INSERT INTO `user_activity` VALUES ('107', '1', 'login', 'admin signed in successfully', '192.168.1.6', '2014-07-07 15:56:13');
INSERT INTO `user_activity` VALUES ('108', '1', 'login', 'admin signed in successfully', '192.168.1.6', '2014-07-07 16:10:02');
INSERT INTO `user_activity` VALUES ('109', '1', 'login', 'admin signed in successfully', '105.52.170.189', '2014-07-08 00:02:58');
INSERT INTO `user_activity` VALUES ('110', '1', 'login', 'admin signed in successfully', '::1', '2014-07-08 13:06:58');
INSERT INTO `user_activity` VALUES ('112', '1', 'login', 'admin signed in successfully', '::1', '2014-07-08 13:11:19');
INSERT INTO `user_activity` VALUES ('113', '1', 'login', 'admin signed in successfully', '::1', '2014-07-08 14:58:59');
INSERT INTO `user_activity` VALUES ('114', '1', 'login', 'admin signed in successfully', '::1', '2014-07-08 15:49:21');
INSERT INTO `user_activity` VALUES ('116', '1', 'login', 'admin signed in successfully', '::1', '2014-07-08 16:34:13');
INSERT INTO `user_activity` VALUES ('118', '1', 'login', 'admin signed in successfully', '::1', '2014-07-08 16:34:56');
INSERT INTO `user_activity` VALUES ('120', '1', 'login', 'admin signed in successfully', '::1', '2014-07-08 16:49:49');
INSERT INTO `user_activity` VALUES ('122', '1', 'login', 'admin signed in successfully', '::1', '2014-07-08 16:56:39');
INSERT INTO `user_activity` VALUES ('124', '1', 'login', 'admin signed in successfully', '::1', '2014-07-08 17:33:06');
INSERT INTO `user_activity` VALUES ('126', '1', 'login', 'admin signed in successfully', '127.0.0.1', '2014-07-08 18:16:49');
INSERT INTO `user_activity` VALUES ('128', '1', 'login', 'admin signed in successfully', '127.0.0.1', '2014-07-08 18:49:48');
INSERT INTO `user_activity` VALUES ('129', '1', 'login', 'admin signed in successfully', '127.0.0.1', '2014-07-09 09:30:11');
INSERT INTO `user_activity` VALUES ('130', '1', 'login', 'admin signed in successfully', '127.0.0.1', '2014-07-09 09:56:55');
INSERT INTO `user_activity` VALUES ('131', '1', 'login', 'admin signed in successfully', '127.0.0.1', '2014-07-09 10:06:15');
INSERT INTO `user_activity` VALUES ('132', '1', 'login', 'admin signed in successfully', '127.0.0.1', '2014-07-09 10:50:06');
INSERT INTO `user_activity` VALUES ('133', '8', 'login', 'team signed in successfully', '127.0.0.1', '2014-07-09 11:01:03');
INSERT INTO `user_activity` VALUES ('134', '8', 'login', 'team signed in successfully', '127.0.0.1', '2014-07-09 11:05:39');
INSERT INTO `user_activity` VALUES ('135', '8', 'login', 'team signed in successfully', '127.0.0.1', '2014-07-09 11:07:33');
INSERT INTO `user_activity` VALUES ('136', '1', 'login', 'admin signed in successfully', '127.0.0.1', '2014-07-09 11:21:19');
INSERT INTO `user_activity` VALUES ('137', '1', 'login', 'admin signed in successfully', '::1', '2014-07-09 18:41:11');
INSERT INTO `user_activity` VALUES ('138', '1', 'login', 'admin signed in successfully', '::1', '2014-07-10 11:32:50');
INSERT INTO `user_activity` VALUES ('139', '1', 'login', 'admin signed in successfully', '::1', '2014-07-12 12:14:29');
INSERT INTO `user_activity` VALUES ('140', '1', 'login', 'admin signed in successfully', '::1', '2014-07-12 13:49:39');
INSERT INTO `user_activity` VALUES ('141', '1', 'login', 'admin signed in successfully', '::1', '2014-07-13 19:46:16');
INSERT INTO `user_activity` VALUES ('142', '1', 'login', 'admin signed in successfully', '::1', '2014-07-13 20:24:58');
INSERT INTO `user_activity` VALUES ('143', '1', 'login', 'admin signed in successfully', '::1', '2014-07-13 21:44:23');
INSERT INTO `user_activity` VALUES ('144', '1', 'login', 'admin signed in successfully', '::1', '2014-07-14 14:46:37');
INSERT INTO `user_activity` VALUES ('145', '1', 'login', 'admin signed in successfully', '::1', '2014-07-14 16:59:23');
INSERT INTO `user_activity` VALUES ('146', '1', 'login', 'admin signed in successfully', '::1', '2014-07-15 08:35:47');
INSERT INTO `user_activity` VALUES ('147', '1', 'login', 'admin signed in successfully', '::1', '2014-07-15 16:18:43');
INSERT INTO `user_activity` VALUES ('148', '1', 'login', 'admin signed in successfully', '::1', '2014-07-16 08:18:26');
INSERT INTO `user_activity` VALUES ('150', '1', 'login', 'admin signed in successfully', '::1', '2014-07-16 14:48:18');
INSERT INTO `user_activity` VALUES ('151', '4', 'login', 'partner signed in successfully', '::1', '2014-07-16 14:53:21');
INSERT INTO `user_activity` VALUES ('153', '1', 'login', 'admin signed in successfully', '::1', '2014-07-16 15:24:39');
INSERT INTO `user_activity` VALUES ('154', '1', 'login', 'admin signed in successfully', '::1', '2014-07-16 16:21:53');
INSERT INTO `user_activity` VALUES ('155', '1', 'login', 'admin signed in successfully', '::1', '2014-07-16 19:11:56');
INSERT INTO `user_activity` VALUES ('156', '1', 'login', 'admin signed in successfully', '::1', '2014-07-16 22:36:58');
INSERT INTO `user_activity` VALUES ('157', '1', 'login', 'admin signed in successfully', '::1', '2014-07-17 08:48:14');
INSERT INTO `user_activity` VALUES ('158', '1', 'login', 'admin signed in successfully', '::1', '2014-07-17 10:06:29');
INSERT INTO `user_activity` VALUES ('159', '1', 'login', 'admin signed in successfully', '::1', '2014-07-17 13:55:50');
INSERT INTO `user_activity` VALUES ('160', '1', 'login', 'admin signed in successfully', '::1', '2014-07-17 14:35:23');
INSERT INTO `user_activity` VALUES ('161', '1', 'login', 'admin signed in successfully', '::1', '2014-07-17 15:24:06');
INSERT INTO `user_activity` VALUES ('162', '1', 'login', 'admin signed in successfully', '::1', '2014-07-17 15:58:33');
INSERT INTO `user_activity` VALUES ('163', '1', 'login', 'admin signed in successfully', '::1', '2014-07-17 20:22:58');
INSERT INTO `user_activity` VALUES ('164', '1', 'login', 'admin signed in successfully', '::1', '2014-07-18 10:08:49');
INSERT INTO `user_activity` VALUES ('165', '1', 'login', 'admin signed in successfully', '41.215.30.108', '2014-07-18 10:21:44');
INSERT INTO `user_activity` VALUES ('166', '1', 'login', 'admin signed in successfully', '41.215.30.108', '2014-07-18 10:57:59');
INSERT INTO `user_activity` VALUES ('167', '1', 'login', 'admin signed in successfully', '41.215.30.108', '2014-07-18 12:38:18');
INSERT INTO `user_activity` VALUES ('168', '1', 'login', 'admin signed in successfully', '41.215.30.108', '2014-07-18 12:41:05');
INSERT INTO `user_activity` VALUES ('169', '9', 'login', 'Solomon signed in successfully', '41.215.30.108', '2014-07-18 12:46:05');
INSERT INTO `user_activity` VALUES ('170', '4', 'login', 'partner signed in successfully', '154.122.58.163', '2014-07-18 15:06:11');
INSERT INTO `user_activity` VALUES ('171', '4', 'login', 'partner signed in successfully', '192.168.1.40', '2014-07-18 15:22:02');
INSERT INTO `user_activity` VALUES ('172', '1', 'login', 'admin signed in successfully', '192.168.1.40', '2014-07-18 15:22:14');
INSERT INTO `user_activity` VALUES ('173', '4', 'login', 'partner signed in successfully', '192.168.1.40', '2014-07-18 15:27:27');
INSERT INTO `user_activity` VALUES ('174', '4', 'login', 'partner signed in successfully', '154.122.58.163', '2014-07-18 15:39:41');
INSERT INTO `user_activity` VALUES ('175', '4', 'login', 'partner signed in successfully', '196.201.217.38', '2014-07-19 14:17:32');
INSERT INTO `user_activity` VALUES ('176', '4', 'login', 'partner signed in successfully', '196.201.217.38', '2014-07-19 14:18:50');
INSERT INTO `user_activity` VALUES ('177', '1', 'login', 'admin signed in successfully', '::1', '2014-07-21 07:46:32');
INSERT INTO `user_activity` VALUES ('178', '1', 'login', 'admin signed in successfully', '::1', '2014-07-21 08:43:37');
INSERT INTO `user_activity` VALUES ('179', '4', 'login', 'partner signed in successfully', '196.201.217.46', '2014-07-21 09:33:37');
INSERT INTO `user_activity` VALUES ('180', '4', 'login', 'partner signed in successfully', '196.201.217.46', '2014-07-21 09:33:39');
INSERT INTO `user_activity` VALUES ('181', '1', 'login', 'admin signed in successfully', '::1', '2014-07-21 10:19:02');
INSERT INTO `user_activity` VALUES ('182', '4', 'login', 'partner signed in successfully', '196.201.217.47', '2014-07-21 10:27:27');
INSERT INTO `user_activity` VALUES ('183', '1', 'login', 'admin signed in successfully', '::1', '2014-07-21 12:10:44');
INSERT INTO `user_activity` VALUES ('184', '1', 'login', 'admin signed in successfully', '::1', '2014-07-21 12:36:34');
INSERT INTO `user_activity` VALUES ('187', '1', 'login', 'admin signed in successfully', '::1', '2014-07-21 15:40:13');
INSERT INTO `user_activity` VALUES ('189', '1', 'login', 'admin signed in successfully', '41.215.30.108', '2014-07-21 16:05:25');
INSERT INTO `user_activity` VALUES ('190', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-07-21 16:06:21');
INSERT INTO `user_activity` VALUES ('191', '1', 'login', 'admin signed in successfully', '::1', '2014-07-21 17:16:44');
INSERT INTO `user_activity` VALUES ('192', '10', 'login', 'amaco signed in successfully', '::1', '2014-07-21 17:19:18');
INSERT INTO `user_activity` VALUES ('193', '10', 'login', 'amaco signed in successfully', '192.168.1.40', '2014-07-21 17:20:02');
INSERT INTO `user_activity` VALUES ('194', '10', 'login', 'amaco signed in successfully', '192.168.1.40', '2014-07-21 17:24:18');
INSERT INTO `user_activity` VALUES ('195', '10', 'login', 'amaco signed in successfully', '192.168.1.40', '2014-07-21 19:32:31');
INSERT INTO `user_activity` VALUES ('196', '4', 'login', 'partner signed in successfully', '196.201.217.47', '2014-07-22 08:43:33');
INSERT INTO `user_activity` VALUES ('197', '10', 'login', 'amaco signed in successfully', '::1', '2014-07-22 10:23:46');
INSERT INTO `user_activity` VALUES ('198', '10', 'login', 'amaco signed in successfully', '41.215.30.108', '2014-07-22 11:10:44');
INSERT INTO `user_activity` VALUES ('199', '10', 'login', 'amaco signed in successfully', '192.168.1.40', '2014-07-22 11:19:15');
INSERT INTO `user_activity` VALUES ('200', '10', 'login', 'amaco signed in successfully', '41.84.152.198', '2014-07-22 15:07:39');
INSERT INTO `user_activity` VALUES ('201', '1', 'login', 'admin signed in successfully', '::1', '2014-07-23 08:24:01');
INSERT INTO `user_activity` VALUES ('202', '1', 'login', 'admin signed in successfully', '::1', '2014-07-23 08:31:32');
INSERT INTO `user_activity` VALUES ('203', '1', 'login', 'admin signed in successfully', '::1', '2014-07-23 08:33:04');
INSERT INTO `user_activity` VALUES ('204', '8', 'login', 'team signed in successfully', '::1', '2014-07-23 08:34:21');
INSERT INTO `user_activity` VALUES ('205', '1', 'login', 'admin signed in successfully', '::1', '2014-07-23 08:34:29');
INSERT INTO `user_activity` VALUES ('206', '1', 'login', 'admin signed in successfully', '::1', '2014-07-23 08:34:58');
INSERT INTO `user_activity` VALUES ('207', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-07-23 09:41:24');
INSERT INTO `user_activity` VALUES ('208', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-07-23 11:49:16');
INSERT INTO `user_activity` VALUES ('209', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-07-23 11:57:02');
INSERT INTO `user_activity` VALUES ('210', '10', 'login', 'amaco signed in successfully', '41.84.152.198', '2014-07-23 12:42:21');
INSERT INTO `user_activity` VALUES ('211', '1', 'login', 'admin signed in successfully', '::1', '2014-07-23 14:07:29');
INSERT INTO `user_activity` VALUES ('212', '10', 'login', 'amaco signed in successfully', '::1', '2014-07-23 15:07:26');
INSERT INTO `user_activity` VALUES ('213', '1', 'login', 'admin signed in successfully', '::1', '2014-07-23 15:21:59');
INSERT INTO `user_activity` VALUES ('214', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-07-23 15:25:33');
INSERT INTO `user_activity` VALUES ('215', '10', 'login', 'amaco signed in successfully', '::1', '2014-07-23 15:38:56');
INSERT INTO `user_activity` VALUES ('216', '1', 'login', 'admin signed in successfully', '192.168.1.40', '2014-07-23 16:08:13');
INSERT INTO `user_activity` VALUES ('217', '10', 'login', 'amaco signed in successfully', '192.168.1.40', '2014-07-23 16:08:40');
INSERT INTO `user_activity` VALUES ('218', '1', 'login', 'admin signed in successfully', '::1', '2014-07-24 09:14:24');
INSERT INTO `user_activity` VALUES ('219', '4', 'login', 'partner signed in successfully', '::1', '2014-07-24 09:27:26');
INSERT INTO `user_activity` VALUES ('220', '1', 'login', 'admin signed in successfully', '::1', '2014-07-24 09:30:06');
INSERT INTO `user_activity` VALUES ('221', '1', 'login', 'admin signed in successfully', '::1', '2014-07-24 10:59:06');
INSERT INTO `user_activity` VALUES ('222', '1', 'login', 'admin signed in successfully', '::1', '2014-07-24 14:12:38');
INSERT INTO `user_activity` VALUES ('223', '10', 'login', 'amaco signed in successfully', '41.84.152.198', '2014-07-28 10:22:04');
INSERT INTO `user_activity` VALUES ('224', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-07-28 11:08:16');
INSERT INTO `user_activity` VALUES ('225', '1', 'login', 'admin signed in successfully', '197.220.126.6', '2014-07-28 11:14:36');
INSERT INTO `user_activity` VALUES ('226', '10', 'login', 'amaco signed in successfully', '41.84.152.198', '2014-07-28 13:23:58');
INSERT INTO `user_activity` VALUES ('227', '10', 'login', 'amaco signed in successfully', '41.84.152.198', '2014-07-28 14:05:13');
INSERT INTO `user_activity` VALUES ('228', '10', 'login', 'amaco signed in successfully', '41.84.152.198', '2014-07-28 14:52:51');
INSERT INTO `user_activity` VALUES ('229', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-07-28 16:00:11');
INSERT INTO `user_activity` VALUES ('230', '10', 'login', 'amaco signed in successfully', '41.84.152.198', '2014-07-28 16:49:30');
INSERT INTO `user_activity` VALUES ('231', '10', 'login', 'amaco signed in successfully', '41.215.30.108', '2014-07-28 17:04:13');
INSERT INTO `user_activity` VALUES ('232', '10', 'login', 'amaco signed in successfully', '41.215.30.108', '2014-07-28 17:30:25');
INSERT INTO `user_activity` VALUES ('233', '10', 'login', 'amaco signed in successfully', '41.84.152.198', '2014-07-28 17:56:44');
INSERT INTO `user_activity` VALUES ('234', '4', 'login', 'partner signed in successfully', '154.122.154.59', '2014-07-29 16:36:23');
INSERT INTO `user_activity` VALUES ('235', '4', 'login', 'partner signed in successfully', '196.201.216.140', '2014-07-30 08:12:32');
INSERT INTO `user_activity` VALUES ('236', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-07-30 08:27:25');
INSERT INTO `user_activity` VALUES ('237', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-07-30 09:18:39');
INSERT INTO `user_activity` VALUES ('238', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-07-30 09:18:42');
INSERT INTO `user_activity` VALUES ('239', '1', 'login', 'admin signed in successfully', '192.168.1.40', '2014-07-30 09:46:55');
INSERT INTO `user_activity` VALUES ('240', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-07-30 09:54:53');
INSERT INTO `user_activity` VALUES ('241', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-07-30 10:07:04');
INSERT INTO `user_activity` VALUES ('242', '10', 'login', 'amaco signed in successfully', '192.168.1.40', '2014-07-30 13:56:59');
INSERT INTO `user_activity` VALUES ('243', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-07-30 14:57:15');
INSERT INTO `user_activity` VALUES ('244', '1', 'login', 'admin signed in successfully', '192.168.1.40', '2014-07-30 16:37:31');
INSERT INTO `user_activity` VALUES ('245', '10', 'login', 'amaco signed in successfully', '192.168.1.40', '2014-07-30 16:58:59');
INSERT INTO `user_activity` VALUES ('246', '10', 'login', 'amaco signed in successfully', '41.84.152.198', '2014-07-30 17:31:57');
INSERT INTO `user_activity` VALUES ('247', '1', 'login', 'admin signed in successfully', '192.168.1.40', '2014-07-31 08:35:00');
INSERT INTO `user_activity` VALUES ('248', '1', 'login', 'admin signed in successfully', '192.168.1.40', '2014-07-31 08:38:10');
INSERT INTO `user_activity` VALUES ('249', '4', 'login', 'partner signed in successfully', '127.0.0.1', '2014-07-31 09:28:07');
INSERT INTO `user_activity` VALUES ('250', '1', 'login', 'admin signed in successfully', '127.0.0.1', '2014-07-31 09:28:23');
INSERT INTO `user_activity` VALUES ('251', '4', 'login', 'partner signed in successfully', '127.0.0.1', '2014-07-31 09:29:57');
INSERT INTO `user_activity` VALUES ('252', '10', 'login', 'amaco signed in successfully', '192.168.1.40', '2014-07-31 11:01:20');
INSERT INTO `user_activity` VALUES ('253', '10', 'login', 'amaco signed in successfully', '192.168.1.40', '2014-07-31 11:03:00');
INSERT INTO `user_activity` VALUES ('254', '1', 'login', 'admin signed in successfully', '127.0.0.1', '2014-07-31 11:41:49');
INSERT INTO `user_activity` VALUES ('255', '4', 'login', 'partner signed in successfully', '::1', '2014-07-31 13:20:58');
INSERT INTO `user_activity` VALUES ('256', '1', 'login', 'admin signed in successfully', '192.168.1.40', '2014-07-31 15:04:49');
INSERT INTO `user_activity` VALUES ('257', '1', 'login', 'admin signed in successfully', '192.168.1.40', '2014-07-31 17:44:17');
INSERT INTO `user_activity` VALUES ('258', '4', 'login', 'partner signed in successfully', '196.201.217.46', '2014-07-31 20:58:48');
INSERT INTO `user_activity` VALUES ('259', '1', 'login', 'admin signed in successfully', '::1', '2014-08-01 10:41:12');
INSERT INTO `user_activity` VALUES ('260', '4', 'login', 'partner signed in successfully', '196.201.217.39', '2014-08-01 15:54:10');
INSERT INTO `user_activity` VALUES ('261', '4', 'login', 'partner signed in successfully', '196.201.217.45', '2014-08-02 12:27:39');
INSERT INTO `user_activity` VALUES ('262', '4', 'login', 'partner signed in successfully', '196.201.217.45', '2014-08-02 13:59:31');
INSERT INTO `user_activity` VALUES ('263', '4', 'login', 'partner signed in successfully', '196.201.217.48', '2014-08-02 14:11:09');
INSERT INTO `user_activity` VALUES ('264', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-04 14:06:37');
INSERT INTO `user_activity` VALUES ('265', '10', 'login', 'amaco signed in successfully', '41.84.152.198', '2014-08-04 15:16:03');
INSERT INTO `user_activity` VALUES ('266', '1', 'login', 'admin signed in successfully', '192.168.1.40', '2014-08-04 15:19:33');
INSERT INTO `user_activity` VALUES ('267', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-04 15:20:11');
INSERT INTO `user_activity` VALUES ('268', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-05 09:47:45');
INSERT INTO `user_activity` VALUES ('269', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-05 09:55:26');
INSERT INTO `user_activity` VALUES ('270', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-05 09:59:30');
INSERT INTO `user_activity` VALUES ('271', '8', 'login', 'team signed in successfully', '196.201.217.38', '2014-08-05 10:44:58');
INSERT INTO `user_activity` VALUES ('272', '1', 'login', 'admin signed in successfully', '192.168.1.3', '2014-08-05 13:27:16');
INSERT INTO `user_activity` VALUES ('273', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-05 14:15:39');
INSERT INTO `user_activity` VALUES ('274', '1', 'login', 'admin signed in successfully', '41.215.30.108', '2014-08-05 14:16:39');
INSERT INTO `user_activity` VALUES ('275', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-05 14:17:15');
INSERT INTO `user_activity` VALUES ('276', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-05 15:06:56');
INSERT INTO `user_activity` VALUES ('277', '4', 'login', 'partner signed in successfully', '196.201.217.47', '2014-08-05 17:37:06');
INSERT INTO `user_activity` VALUES ('278', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-06 09:09:52');
INSERT INTO `user_activity` VALUES ('279', '10', 'login', 'amaco signed in successfully', '41.84.152.198', '2014-08-08 10:06:51');
INSERT INTO `user_activity` VALUES ('280', '10', 'login', 'amaco signed in successfully', '41.84.152.198', '2014-08-08 10:38:25');
INSERT INTO `user_activity` VALUES ('281', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-08 14:36:11');
INSERT INTO `user_activity` VALUES ('282', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-11 08:46:04');
INSERT INTO `user_activity` VALUES ('283', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-11 10:14:46');
INSERT INTO `user_activity` VALUES ('284', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-11 16:28:56');
INSERT INTO `user_activity` VALUES ('285', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-12 10:47:42');
INSERT INTO `user_activity` VALUES ('286', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-12 11:25:31');
INSERT INTO `user_activity` VALUES ('287', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-12 12:30:22');
INSERT INTO `user_activity` VALUES ('288', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-13 08:39:17');
INSERT INTO `user_activity` VALUES ('289', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-13 09:08:10');
INSERT INTO `user_activity` VALUES ('290', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-13 11:02:42');
INSERT INTO `user_activity` VALUES ('291', '1', 'login', 'admin signed in successfully', '196.201.217.48', '2014-08-14 14:37:36');
INSERT INTO `user_activity` VALUES ('292', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-15 09:15:24');
INSERT INTO `user_activity` VALUES ('293', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-15 11:33:14');
INSERT INTO `user_activity` VALUES ('294', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-15 13:11:58');
INSERT INTO `user_activity` VALUES ('295', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-18 09:04:18');
INSERT INTO `user_activity` VALUES ('296', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-18 11:30:34');
INSERT INTO `user_activity` VALUES ('297', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-19 11:11:17');
INSERT INTO `user_activity` VALUES ('298', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-19 11:11:23');
INSERT INTO `user_activity` VALUES ('299', '1', 'login', 'admin signed in successfully', '41.215.30.108', '2014-08-19 11:16:37');
INSERT INTO `user_activity` VALUES ('300', '5', 'login', 'brands signed in successfully', '41.215.30.108', '2014-08-19 11:17:22');
INSERT INTO `user_activity` VALUES ('301', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-19 11:18:20');
INSERT INTO `user_activity` VALUES ('302', '5', 'login', 'brands signed in successfully', '41.215.30.108', '2014-08-19 11:19:18');
INSERT INTO `user_activity` VALUES ('303', '1', 'login', 'admin signed in successfully', '41.215.30.108', '2014-08-19 11:22:03');
INSERT INTO `user_activity` VALUES ('304', '5', 'login', 'brands signed in successfully', '41.215.30.108', '2014-08-19 11:28:04');
INSERT INTO `user_activity` VALUES ('305', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-19 12:40:59');
INSERT INTO `user_activity` VALUES ('306', '1', 'login', 'admin signed in successfully', '192.168.1.4', '2014-08-19 15:23:14');
INSERT INTO `user_activity` VALUES ('307', '4', 'login', 'partner signed in successfully', '192.168.1.4', '2014-08-19 15:25:22');
INSERT INTO `user_activity` VALUES ('308', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-20 08:27:51');
INSERT INTO `user_activity` VALUES ('309', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-20 08:30:20');
INSERT INTO `user_activity` VALUES ('310', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-20 15:12:05');
INSERT INTO `user_activity` VALUES ('311', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-20 15:52:32');
INSERT INTO `user_activity` VALUES ('312', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-21 17:00:23');
INSERT INTO `user_activity` VALUES ('313', '1', 'login', 'admin signed in successfully', '192.168.1.4', '2014-08-22 10:44:11');
INSERT INTO `user_activity` VALUES ('314', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-22 13:32:44');
INSERT INTO `user_activity` VALUES ('315', '10', 'login', 'amaco signed in successfully', '41.84.152.198', '2014-08-25 10:05:15');
INSERT INTO `user_activity` VALUES ('316', '10', 'login', 'amaco signed in successfully', '41.84.152.198', '2014-08-25 11:17:35');
INSERT INTO `user_activity` VALUES ('317', '10', 'login', 'amaco signed in successfully', '41.84.152.198', '2014-08-25 12:02:45');
INSERT INTO `user_activity` VALUES ('318', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-25 13:31:56');
INSERT INTO `user_activity` VALUES ('319', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-26 08:27:29');
INSERT INTO `user_activity` VALUES ('320', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-26 08:51:55');
INSERT INTO `user_activity` VALUES ('321', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-26 09:15:59');
INSERT INTO `user_activity` VALUES ('322', '10', 'login', 'amaco signed in successfully', '41.84.152.198', '2014-08-26 10:54:09');
INSERT INTO `user_activity` VALUES ('323', '10', 'login', 'amaco signed in successfully', '41.84.152.198', '2014-08-26 14:59:55');
INSERT INTO `user_activity` VALUES ('324', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-27 09:03:04');
INSERT INTO `user_activity` VALUES ('325', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-27 09:08:52');
INSERT INTO `user_activity` VALUES ('326', '1', 'login', 'admin signed in successfully', '192.168.1.3', '2014-08-27 09:42:57');
INSERT INTO `user_activity` VALUES ('327', '1', 'login', 'admin signed in successfully', '192.168.1.3', '2014-08-27 10:51:00');
INSERT INTO `user_activity` VALUES ('328', '1', 'login', 'admin signed in successfully', '192.168.1.3', '2014-08-27 12:36:01');
INSERT INTO `user_activity` VALUES ('329', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-27 16:42:25');
INSERT INTO `user_activity` VALUES ('330', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-28 09:51:09');
INSERT INTO `user_activity` VALUES ('331', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-28 12:12:30');
INSERT INTO `user_activity` VALUES ('332', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-28 12:41:20');
INSERT INTO `user_activity` VALUES ('333', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-28 14:43:29');
INSERT INTO `user_activity` VALUES ('334', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-29 12:01:39');
INSERT INTO `user_activity` VALUES ('335', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-08-29 14:01:14');
INSERT INTO `user_activity` VALUES ('336', '1', 'login', 'admin signed in successfully', '192.168.1.3', '2014-09-01 12:18:21');
INSERT INTO `user_activity` VALUES ('337', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-09-02 12:18:51');
INSERT INTO `user_activity` VALUES ('338', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-09-02 14:18:00');
INSERT INTO `user_activity` VALUES ('339', '4', 'login', 'partner signed in successfully', '192.168.1.3', '2014-09-02 15:22:11');
INSERT INTO `user_activity` VALUES ('340', '10', 'login', 'amaco signed in successfully', '41.84.152.198', '2014-09-03 07:53:19');
INSERT INTO `user_activity` VALUES ('341', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-09-03 09:55:26');
INSERT INTO `user_activity` VALUES ('342', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-09-03 15:26:59');
INSERT INTO `user_activity` VALUES ('343', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-09-03 16:54:24');
INSERT INTO `user_activity` VALUES ('344', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-09-04 09:25:35');
INSERT INTO `user_activity` VALUES ('345', '1', 'login', 'admin signed in successfully', '192.168.1.3', '2014-09-05 10:32:44');
INSERT INTO `user_activity` VALUES ('346', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-09-05 10:37:43');
INSERT INTO `user_activity` VALUES ('347', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-09-05 10:48:18');
INSERT INTO `user_activity` VALUES ('348', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-09-08 09:58:37');
INSERT INTO `user_activity` VALUES ('349', '1', 'login', 'admin signed in successfully', '::1', '2014-09-08 10:09:09');
INSERT INTO `user_activity` VALUES ('350', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-09-08 11:29:46');
INSERT INTO `user_activity` VALUES ('351', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-09-08 11:41:17');
INSERT INTO `user_activity` VALUES ('352', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-09-08 15:11:30');
INSERT INTO `user_activity` VALUES ('353', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-09-08 16:28:29');
INSERT INTO `user_activity` VALUES ('354', '8', 'login', 'team signed in successfully', '41.215.30.108', '2014-09-09 13:59:52');
INSERT INTO `user_activity` VALUES ('355', '1', 'login', 'admin signed in successfully', '::1', '2014-09-10 15:26:07');
INSERT INTO `user_activity` VALUES ('356', '1', 'login', 'admin signed in successfully', '::1', '2014-09-11 12:07:36');
INSERT INTO `user_activity` VALUES ('357', '1', 'login', 'admin signed in successfully', '::1', '2014-09-11 14:32:47');
INSERT INTO `user_activity` VALUES ('358', '1', 'login', 'admin signed in successfully', '::1', '2014-09-11 15:43:56');
INSERT INTO `user_activity` VALUES ('359', '1', 'login', 'admin signed in successfully', '::1', '2014-09-11 15:56:06');
INSERT INTO `user_activity` VALUES ('360', '1', 'login', 'admin signed in successfully', '::1', '2014-09-12 09:09:11');
INSERT INTO `user_activity` VALUES ('361', '1', 'login', 'admin signed in successfully', '::1', '2014-09-12 09:20:06');
INSERT INTO `user_activity` VALUES ('362', '1', 'login', 'admin signed in successfully', '::1', '2014-09-12 15:14:29');
INSERT INTO `user_activity` VALUES ('363', '1', 'login', 'admin signed in successfully', '::1', '2014-09-12 15:53:28');
INSERT INTO `user_activity` VALUES ('364', '1', 'login', 'admin signed in successfully', '::1', '2014-09-14 09:27:20');
INSERT INTO `user_activity` VALUES ('365', '1', 'login', 'admin signed in successfully', '::1', '2014-09-14 10:40:03');
INSERT INTO `user_activity` VALUES ('366', '1', 'login', 'admin signed in successfully', '::1', '2014-09-15 09:10:46');
INSERT INTO `user_activity` VALUES ('367', '1', 'login', 'admin signed in successfully', '::1', '2014-09-15 20:23:28');
INSERT INTO `user_activity` VALUES ('368', '1', 'login', 'admin signed in successfully', '::1', '2014-09-15 21:54:00');
INSERT INTO `user_activity` VALUES ('369', '1', 'login', 'admin signed in successfully', '::1', '2014-09-16 08:28:08');
INSERT INTO `user_activity` VALUES ('370', '1', 'login', 'admin signed in successfully', '::1', '2014-09-16 20:26:03');
INSERT INTO `user_activity` VALUES ('371', '1', 'login', 'admin signed in successfully', '::1', '2014-09-16 20:30:02');
INSERT INTO `user_activity` VALUES ('372', '1', 'login', 'admin signed in successfully', '::1', '2014-09-17 16:42:25');

-- ----------------------------
-- Table structure for user_levels
-- ----------------------------
DROP TABLE IF EXISTS `user_levels`;
CREATE TABLE `user_levels` (
  `id` varchar(30) NOT NULL,
  `description` varchar(255) NOT NULL,
  `banned_resources` text,
  `banned_resources_inheritance` varchar(30) DEFAULT NULL,
  `rank` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='user types (non-functional requirement)';

-- ----------------------------
-- Records of user_levels
-- ----------------------------
INSERT INTO `user_levels` VALUES ('ADMIN', 'System Admins', null, 'ENGINEER', '3');
INSERT INTO `user_levels` VALUES ('CLIENT', 'System Users', 'HELP_DOCUMENTATION,MODULES_ENABLED,SETTINGS_CRON,SETTINGS_EMAIL,SETTINGS_GENERAL,SETTINGS_RUNTIME,SETTINGS_TAXES,USER_ACTIVITY,USER_ADMIN,USER_DEFAULT,USER_ENGINEER,USER_LEVELS,USER_RESOURCES,USER_ROLES,USER_SUPERADMIN', '', '4');
INSERT INTO `user_levels` VALUES ('ENGINEER', 'System Engineer', null, null, '1');

-- ----------------------------
-- Table structure for user_resources
-- ----------------------------
DROP TABLE IF EXISTS `user_resources`;
CREATE TABLE `user_resources` (
  `id` varchar(128) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `viewable` int(11) NOT NULL DEFAULT '1',
  `createable` int(11) NOT NULL DEFAULT '1',
  `updateable` int(11) NOT NULL DEFAULT '1',
  `deleteable` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='system resources-(non-functional requirement)';

-- ----------------------------
-- Records of user_resources
-- ----------------------------
INSERT INTO `user_resources` VALUES ('', null, '1', '1', '1', '1');
INSERT INTO `user_resources` VALUES ('BULK', 'Bulk SMSES Module', '1', '1', '1', '1');
INSERT INTO `user_resources` VALUES ('BULK_CUSTOME', 'Sending Custome Bulk Smes', '1', '1', '1', '1');
INSERT INTO `user_resources` VALUES ('BULK_GROUP', 'Bulk groups ', '1', '1', '1', '1');
INSERT INTO `user_resources` VALUES ('BULK_TEMPLATE', 'Bulk Templates', '1', '1', '1', '1');
INSERT INTO `user_resources` VALUES ('CALL_ESCALATED', 'Escalated Calls', '1', '1', '1', '1');
INSERT INTO `user_resources` VALUES ('CALL_MANAGER', 'Calls Manager', '1', '1', '1', '1');
INSERT INTO `user_resources` VALUES ('CALL_NEW', 'New Calls', '1', '1', '1', '1');
INSERT INTO `user_resources` VALUES ('CALL_PROCESSED', 'Processed Calls', '1', '1', '1', '1');
INSERT INTO `user_resources` VALUES ('CALL_REPORTS', 'Call Log Reports', '1', '1', '1', '1');
INSERT INTO `user_resources` VALUES ('CALL_WAITING', 'Received Calls', '1', '1', '1', '1');
INSERT INTO `user_resources` VALUES ('DEPT', 'Departments', '1', '1', '1', '1');
INSERT INTO `user_resources` VALUES ('HELP_DOCUMENTATION', 'Documentation', '1', '1', '1', '1');
INSERT INTO `user_resources` VALUES ('HR_LEAVE', 'Manage Staff Leave', '1', '1', '1', '1');
INSERT INTO `user_resources` VALUES ('HR_WELFARE', 'Staff Welfare', '1', '1', '1', '1');
INSERT INTO `user_resources` VALUES ('HUMAN_RESOURCE', 'Human Resource', '1', '1', '1', '1');
INSERT INTO `user_resources` VALUES ('INCOMING', 'MO Incoming smese', '1', '1', '1', '1');
INSERT INTO `user_resources` VALUES ('MESSAGE', 'Messages', '1', '1', '1', '1');
INSERT INTO `user_resources` VALUES ('MODULES_ENABLED', 'Modules Enabled', '1', '1', '1', '0');
INSERT INTO `user_resources` VALUES ('REPORTS', 'System Reports', '1', '1', '1', '1');
INSERT INTO `user_resources` VALUES ('REPORTS_PARTNERS', 'Partners Reports', '1', '1', '1', '1');
INSERT INTO `user_resources` VALUES ('REPORTS_SETUP', 'Reports Setup', '1', '1', '1', '1');
INSERT INTO `user_resources` VALUES ('REPORTS_SUBS', 'Subscription Reports', '1', '1', '1', '1');
INSERT INTO `user_resources` VALUES ('REPORTS_TERM', 'Termination Reports', '1', '1', '1', '1');
INSERT INTO `user_resources` VALUES ('RES_UNSUB', 'Unsubscribe Client', '1', '1', '1', '1');
INSERT INTO `user_resources` VALUES ('SETTINGS_CRON', 'Cron Jobs Settings', '1', '1', '1', '0');
INSERT INTO `user_resources` VALUES ('SETTINGS_EMAIL', 'Email settings', '1', '1', '1', '1');
INSERT INTO `user_resources` VALUES ('SETTINGS_GENERAL', 'General settings', '1', '1', '1', '1');
INSERT INTO `user_resources` VALUES ('SETTINGS_RUNTIME', 'System error logs', '1', '1', '1', '1');
INSERT INTO `user_resources` VALUES ('SETTINGS_TAXES', 'Tax Settings', '1', '1', '1', '1');
INSERT INTO `user_resources` VALUES ('SUBS', 'Subs Manager', '1', '1', '1', '1');
INSERT INTO `user_resources` VALUES ('SUBS_LOGS', 'Subscription Logs', '1', '1', '1', '1');
INSERT INTO `user_resources` VALUES ('USER_ACTIVITY', 'Uses activity log', '1', '0', '0', '1');
INSERT INTO `user_resources` VALUES ('USER_ADMIN', 'System admins', '1', '1', '1', '1');
INSERT INTO `user_resources` VALUES ('USER_CLIENT', 'Client Users', '1', '1', '1', '1');
INSERT INTO `user_resources` VALUES ('USER_DEFAULT', 'Members', '1', '1', '1', '1');
INSERT INTO `user_resources` VALUES ('USER_ENGINEER', 'System Engineer', '1', '1', '1', '1');
INSERT INTO `user_resources` VALUES ('USER_LEVELS', 'User Levels', '1', '1', '1', '1');
INSERT INTO `user_resources` VALUES ('USER_RESOURCES', 'System resources', '1', '1', '1', '1');
INSERT INTO `user_resources` VALUES ('USER_ROLES', 'System Roles', '1', '1', '1', '1');
INSERT INTO `user_resources` VALUES ('USER_SUPERADMIN', 'Super Admin', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `readonly` int(11) NOT NULL DEFAULT '0',
  `date_created` timestamp NULL DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COMMENT='System roles for admin users';

-- ----------------------------
-- Records of user_roles
-- ----------------------------
INSERT INTO `user_roles` VALUES ('1', 'Admin Role', 'Default system admin role ', '1', '2013-09-29 00:39:40', '1');
INSERT INTO `user_roles` VALUES ('2', 'MO Partner Role', 'Partner roles on resources', '0', '2013-10-17 17:38:57', '1');
INSERT INTO `user_roles` VALUES ('4', 'Ringtones Partners', 'All onDemand Services Partners', '0', '2013-10-17 17:58:49', '1');
INSERT INTO `user_roles` VALUES ('5', 'Bulk Sms Clients', '', '0', '2014-08-19 11:24:46', '1');

-- ----------------------------
-- Table structure for user_roles_on_resources
-- ----------------------------
DROP TABLE IF EXISTS `user_roles_on_resources`;
CREATE TABLE `user_roles_on_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `resource_id` varchar(128) NOT NULL,
  `view` int(11) NOT NULL DEFAULT '1',
  `create` int(11) NOT NULL DEFAULT '0',
  `update` int(11) NOT NULL DEFAULT '0',
  `delete` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `resource_id` (`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=latin1 COMMENT='roles on resources (non-functional requirement)';

-- ----------------------------
-- Records of user_roles_on_resources
-- ----------------------------
INSERT INTO `user_roles_on_resources` VALUES ('1', '1', 'SETTINGS_EMAIL', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('2', '1', 'SETTINGS_GENERAL', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('11', '1', 'USER_ROLES', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('12', '1', 'SETTINGS_RUNTIME', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('18', '1', 'USER_ACTIVITY', '1', '0', '0', '1');
INSERT INTO `user_roles_on_resources` VALUES ('19', '1', 'USER_ADMIN', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('20', '1', 'USER_DEFAULT', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('21', '2', 'HELP_DOCUMENTATION', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('22', '2', 'SETTINGS_EMAIL', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('23', '2', 'SETTINGS_GENERAL', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('32', '2', 'USER_ROLES', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('33', '2', 'SETTINGS_RUNTIME', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('40', '2', 'USER_ACTIVITY', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('41', '2', 'USER_DEFAULT', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('42', '4', 'HELP_DOCUMENTATION', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('43', '4', 'SETTINGS_EMAIL', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('44', '4', 'SETTINGS_GENERAL', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('53', '4', 'USER_ROLES', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('54', '4', 'SETTINGS_RUNTIME', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('61', '4', 'USER_ACTIVITY', '1', '0', '0', '1');
INSERT INTO `user_roles_on_resources` VALUES ('62', '4', 'USER_DEFAULT', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('63', '2', 'USER_LEVELS', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('64', '2', 'USER_RESOURCES', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('65', '4', 'MESSAGE', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('67', '2', 'MESSAGE', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('78', '1', 'HELP_DOCUMENTATION', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('92', '1', 'MESSAGE', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('93', '1', 'SETTINGS_CRON', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('94', '1', 'SETTINGS_TAXES', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('96', '2', 'DEPT', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('97', '2', 'BULK', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('98', '2', 'MODULES_ENABLED', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('99', '2', 'SETTINGS_CRON', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('100', '2', 'SETTINGS_TAXES', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('101', '2', 'SUBS', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('102', '2', 'USER_ADMIN', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('103', '2', 'USER_ENGINEER', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('104', '2', 'USER_SUPERADMIN', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('105', '1', 'DEPT', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('106', '1', 'BULK', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('107', '1', 'MODULES_ENABLED', '1', '1', '1', '0');
INSERT INTO `user_roles_on_resources` VALUES ('108', '1', 'SUBS', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('109', '1', 'USER_ENGINEER', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('110', '1', 'USER_LEVELS', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('111', '1', 'USER_RESOURCES', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('112', '1', 'USER_SUPERADMIN', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('113', '2', 'BULK_CUSTOME', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('114', '2', 'BULK_TEMPLATE', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('115', '2', 'USER_CLIENT', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('116', '2', 'SUBS_LOGS', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('117', '4', 'BULK', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('118', '4', 'BULK_CUSTOME', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('119', '4', 'BULK_TEMPLATE', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('120', '4', 'DEPT', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('121', '4', 'MODULES_ENABLED', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('122', '4', 'SETTINGS_CRON', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('123', '4', 'SETTINGS_TAXES', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('124', '4', 'SUBS', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('125', '4', 'SUBS_LOGS', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('126', '4', 'USER_ADMIN', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('127', '4', 'USER_ENGINEER', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('128', '4', 'USER_LEVELS', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('129', '4', 'USER_CLIENT', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('130', '4', 'USER_RESOURCES', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('131', '4', 'USER_SUPERADMIN', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('132', '1', 'BULK_CUSTOME', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('133', '1', 'BULK_TEMPLATE', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('134', '1', 'SUBS_LOGS', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('135', '1', 'USER_CLIENT', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('136', '1', 'BULK_GROUP', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('137', '2', 'BULK_GROUP', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('138', '4', 'BULK_GROUP', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('139', '4', 'INCOMING', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('140', '2', 'INCOMING', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('141', '1', 'INCOMING', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('142', '1', 'RES_UNSUB', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('143', '4', 'RES_UNSUB', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('144', '5', 'BULK', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('145', '5', 'BULK_CUSTOME', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('146', '5', 'BULK_GROUP', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('147', '5', 'BULK_TEMPLATE', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('148', '5', 'DEPT', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('149', '5', 'HELP_DOCUMENTATION', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('150', '5', 'INCOMING', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('151', '5', 'MESSAGE', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('152', '5', 'MODULES_ENABLED', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('153', '5', 'RES_UNSUB', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('154', '5', 'SETTINGS_CRON', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('155', '5', 'SETTINGS_EMAIL', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('156', '5', 'SETTINGS_GENERAL', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('157', '5', 'SETTINGS_RUNTIME', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('158', '5', 'SETTINGS_TAXES', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('159', '5', 'SUBS', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('160', '5', 'SUBS_LOGS', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('161', '5', 'USER_ACTIVITY', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('162', '5', 'USER_ADMIN', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('163', '5', 'USER_CLIENT', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('164', '5', 'USER_DEFAULT', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('165', '5', 'USER_ENGINEER', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('166', '5', 'USER_LEVELS', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('167', '5', 'USER_RESOURCES', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('168', '5', 'USER_ROLES', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('169', '5', 'USER_SUPERADMIN', '0', '0', '0', '0');
INSERT INTO `user_roles_on_resources` VALUES ('170', '1', 'REPORTS', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('171', '1', 'REPORTS_SUBS', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('172', '1', 'REPORTS_PARTNERS', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('173', '1', 'REPORTS_SETUP', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('174', '1', 'REPORTS_TERM', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('175', '1', 'HUMAN_RESOURCE', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('176', '1', 'HR_LEAVE', '1', '1', '1', '1');
INSERT INTO `user_roles_on_resources` VALUES ('177', '1', 'HR_WELFARE', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for vehicle
-- ----------------------------
DROP TABLE IF EXISTS `vehicle`;
CREATE TABLE `vehicle` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reg_no` varchar(20) NOT NULL,
  `vehicle_type` varchar(30) NOT NULL,
  `model` varchar(60) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `driver_name` varchar(60) DEFAULT NULL,
  `owner_id` int(11) unsigned DEFAULT NULL,
  `owned_by_staff` tinyint(1) NOT NULL DEFAULT '0',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) unsigned DEFAULT NULL,
  `last_modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reg_no` (`reg_no`),
  KEY `vehicle_type_id` (`vehicle_type`),
  KEY `owner_id` (`owner_id`),
  KEY `vehicle_type_id_2` (`vehicle_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vehicle
-- ----------------------------

-- ----------------------------
-- Table structure for vehicle_type
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_type`;
CREATE TABLE `vehicle_type` (
  `id` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of vehicle_type
-- ----------------------------

-- ----------------------------
-- View structure for users_view
-- ----------------------------
DROP VIEW IF EXISTS `users_view`;
CREATE ALGORITHM=MERGE DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `users_view` AS select `a`.`id` AS `id`,`a`.`username` AS `username`,`a`.`email` AS `email`,`a`.`status` AS `status`,`a`.`timezone` AS `timezone`,`a`.`password` AS `password`,`a`.`salt` AS `salt`,`a`.`password_reset_code` AS `password_reset_code`,`a`.`password_reset_date` AS `password_reset_date`,`a`.`password_reset_request_date` AS `password_reset_request_date`,`a`.`activation_code` AS `activation_code`,`a`.`user_level` AS `user_level`,`a`.`role_id` AS `role_id`,`a`.`date_created` AS `date_created`,`a`.`created_by` AS `created_by`,`a`.`last_modified` AS `last_modified`,`a`.`last_modified_by` AS `last_modified_by`,concat(`b`.`first_name`,' ',`b`.`last_name`) AS `name`,`b`.`gender` AS `gender`,`c`.`dept_id` AS `dept_id` from ((`users` `a` join `person` `b` on((`a`.`id` = `b`.`id`))) left join `dept_user` `c` on(((`b`.`id` = `c`.`person_id`) and (`c`.`has_left` = 0)))); ;
