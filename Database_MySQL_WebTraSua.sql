--  --
--  MySQL Workbench Migration
--  Migrated Schemata: thestarbuck
--  Source Schemata: thestarbuck
--  Created: Tue Nov  9 16:35:37 2021
--  Workbench Version: 8.0.27

SET FOREIGN_KEY_CHECKS = 0;
--  --
--  Schema thestarbuck
--  --
DROP SCHEMA
IF
	EXISTS `thestarbuck`;
CREATE SCHEMA
IF
	NOT EXISTS `thestarbuck`;


	USE `thestarbuck`;
--  --
--  Table thestarbuck.Account
--  --
CREATE TABLE
IF
	NOT EXISTS `Account` (
		`id_ac` VARCHAR ( 6 ) NOT NULL,
		`ac_username` VARCHAR ( 255 ) NOT NULL,
		`ac_fullname` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NULL,
		`ac_active` BOOL NOT NULL DEFAULT 0,
		`ac_mobile` VARCHAR ( 10 ) NOT NULL,
		`ac_email` VARCHAR ( 100 ) NULL,
		`ac_emailVerifiedAt` DATETIME ( 6 ),
		`ac_password` VARCHAR ( 100 ) NOT NULL,
		`ac_avatar` VARCHAR ( 255 ) NULL,
		`ac_addressId` VARCHAR ( 6 ) NULL,
		`ac_about` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NULL,
		`ac_rememberToken` VARCHAR ( 100 ) CHARACTER
		SET 'utf8mb4' ,
		`ac_lastLogin` DATETIME ( 6 ),
		`ac_groupId` VARCHAR ( 10 ) NOT NULL DEFAULT 'MEMBER',
		`createdDate` DATETIME ( 6 ) NOT NULL,
		`modifiedDate` DATETIME ( 6 ) NULL DEFAULT NULL,
		`createdBy` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NOT NULL,
		`modifiedBy` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NULL DEFAULT NULL,
		PRIMARY KEY(`id_ac`)
	) ;
CREATE TABLE
IF
	NOT EXISTS `PublicKey` (
		`keyID` VARCHAR ( 6 ) NOT NULL,
		`accountID` VARCHAR ( 6 ) NOT NULL,
		`typeCypher` VARCHAR ( 100 ) NULL,
        `startDate` DATETIME ( 6 ) NOT NULL,
        `endDate` DATETIME ( 6 ) NOT NULL,
        `content`  VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NULL DEFAULT NULL,
		`status` VARCHAR ( 100 ) NULL,
		PRIMARY KEY(`keyID`),
		FOREIGN KEY ( `accountID` ) REFERENCES `Account` ( `id_ac` ) ON DELETE NO ACTION ON UPDATE NO ACTION
	) ;
--  --
--  Table thestarbuck.Address
--  --
CREATE TABLE
IF
	NOT EXISTS `Address` (
		`id_ad` VARCHAR ( 6 ) NOT NULL,
		`ad_userId` VARCHAR ( 6 ) NOT NULL,
		`ad_provinceCode` VARCHAR(50) NOT NULL,
		`ad_districtCode` VARCHAR(50) NOT NULL,
		`ad_wardCode` VARCHAR(50) NOT NULL,
		`ad_addressDetail` VARCHAR ( 255 ) CHARACTER SET 'utf8mb4' NOT NULL,
		`createdDate` DATETIME ( 6 ) NOT NULL,
		`modifiedDate` DATETIME ( 6 ) NULL DEFAULT NULL,
		`createdBy` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NOT NULL,
		`modifiedBy` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NULL DEFAULT NULL,
		PRIMARY KEY (`id_ad`),
		FOREIGN KEY ( `ad_userId` ) REFERENCES `Account` ( `id_ac` ) ON DELETE NO ACTION ON UPDATE NO ACTION
		) ;

--  --
--  Table thestarbuck.Orders
--  --
CREATE TABLE
IF
	NOT EXISTS `Orders` (
		`id_od` VARCHAR ( 6 ) NOT NULL,
		`od_acId` VARCHAR ( 6 ) NOT NULL,
		`od_sessionId` VARCHAR ( 100 ) NOT NULL,
		`od_name` VARCHAR ( 100 )  NULL,
		`od_phone` VARCHAR ( 100 )  NULL,
		`od_email` VARCHAR ( 100 )  NULL,
		`od_token` VARCHAR ( 100 ) NOT NULL,
		`od_status` VARCHAR ( 10 ) CHARACTER
		SET 'utf8mb4' NOT NULL ,
		`od_address` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NULL,
		`od_subTotal` DOUBLE NOT NULL DEFAULT 0,
		`od_itemDiscount` DOUBLE NOT NULL DEFAULT 0,
		`od_tax` DOUBLE NOT NULL DEFAULT 0,
		`od_shipping` DOUBLE NOT NULL DEFAULT 0,
		`od_grandTotal` DOUBLE NOT NULL DEFAULT 0,
		`od_promo` VARCHAR ( 50 ) NULL DEFAULT NULL,
		`od_note` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NULL DEFAULT NULL,
		`createdDate` DATETIME ( 6 ) NOT NULL,
		`modifiedDate` DATETIME ( 6 ) NULL DEFAULT NULL,
		`createdBy` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NOT NULL,
		`modifiedBy` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NULL DEFAULT NULL,
		PRIMARY KEY ( `id_od` ),
		CONSTRAINT `FK_orders_modified_1A0B8D4B` FOREIGN KEY ( `od_acId` ) REFERENCES `Account` ( `id_ac` ) ON DELETE NO ACTION ON UPDATE NO ACTION
	);
--  --
--  Table thestarbuck.OrderItem
--  --
CREATE TABLE
IF
	NOT EXISTS `OrderItem` (
		`oi_prId` VARCHAR ( 6 ) NOT NULL,
		`oi_orId` VARCHAR ( 6 ) NOT NULL,
		`oi_quantify` SMALLINT NOT NULL DEFAULT 0,
		`oi_note` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NULL DEFAULT NULL,
		`createdDate` DATETIME ( 6 ) NOT NULL,
		`modifiedDate` DATETIME ( 6 ) NULL,
		`createdBy` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NOT NULL,
		`modifiedBy` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NULL,
		PRIMARY KEY ( `oi_prId`,`oi_orId` ),
		CONSTRAINT `FK__OrderItem__modif__20B88ADA` FOREIGN KEY ( `oi_prId` ) REFERENCES `Product` ( `id_pr` ) ON DELETE NO ACTION ON UPDATE NO ACTION,
		CONSTRAINT `FK__OrderItem__oi_or__21ACAF13` FOREIGN KEY ( `oi_orId` ) REFERENCES `Orders` ( `id_od` ) ON DELETE NO ACTION ON UPDATE NO ACTION
	);

CREATE TABLE
IF
	NOT EXISTS `Feedback` (
		`id_fe` VARCHAR ( 6 ) NOT NULL,
		`fe_acId` VARCHAR ( 6 ) NOT NULL,
		`fe_prId` VARCHAR(6) NOT NULL,
		`fe_content` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NULL,
		`fe_rate` INT NOT NULL DEFAULT 1,
		`fe_status` VARCHAR ( 10 ) CHARACTER
		SET 'utf8mb4' NOT NULL DEFAULT 0,
		`createdDate` DATETIME ( 6 ) NOT NULL,
		`modifiedDate` DATETIME ( 6 ) NULL,
		`createdBy` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NOT NULL,
		`modifiedBy` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NULL,
		PRIMARY KEY ( `id_fe` ),
		CONSTRAINT `FK__Feedback__modifi__30EEF2A3` FOREIGN KEY ( `fe_acId` ) REFERENCES `Account` ( `id_ac` ) ON DELETE NO ACTION ON UPDATE NO ACTION
	);
--  --
--  Table thestarbuck.Slide
--  --
CREATE TABLE
IF
	NOT EXISTS `Slide` (
		`id_sl` VARCHAR ( 6 ) NOT NULL,
		`sl_image` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NULL,
		`sl_note` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NULL,
		`sl_greeting_h2` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NULL,
			`sl_greeting1_span` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NULL,
			`sl_greeting2_p` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NULL,
		`sl_active` BOOL NULL DEFAULT 0,
		`createdDate` DATETIME ( 6 ) NOT NULL,
		`modifiedDate` DATETIME ( 6 ) NULL,
		`createdBy` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NOT NULL,
		`modifiedBy` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NULL,
	PRIMARY KEY ( `id_sl` )
	);

--  --
--  Table thestarbuck.Bill
--  --
CREATE TABLE
IF
	NOT EXISTS `Bill` (
		`id_bi` VARCHAR ( 6 ) NOT NULL,
		`bi_orId` VARCHAR ( 6 ) NOT NULL,
		`bi_detail` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NULL DEFAULT NULL,
		`bi_active` BOOL NULL DEFAULT 0,
		`createdDate` DATETIME ( 6 ) NOT NULL,
		`modifiedDate` DATETIME ( 6 ) NULL,
		`createdBy` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NOT NULL,
		`modifiedBy` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NULL,
		PRIMARY KEY ( `id_bi` ),
		CONSTRAINT `FK__Bill__bi_orId__430DA2DE` FOREIGN KEY ( `bi_orId` ) REFERENCES `Orders` ( `id_od` ) ON DELETE NO ACTION ON UPDATE NO ACTION
	);

--  --
--  Table thestarbuck.Contact
--  --
CREATE TABLE
IF
	NOT EXISTS `Contact` (
		`id_co` VARCHAR ( 6 ) NOT NULL,
		`co_acId` VARCHAR ( 6 ) NOT NULL,
		`co_locate` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NULL DEFAULT NULL,
		`co_email` VARCHAR ( 100 ) NULL,
		`co_mobile` VARCHAR ( 10 ) NULL,
		`co_message` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NULL DEFAULT NULL,
		`co_active` BOOL NOT NULL DEFAULT 0,
		`createdDate` DATETIME ( 6 ) NOT NULL,
		`modifiedDate` DATETIME ( 6 ) NULL,
		`createdBy` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NOT NULL,
		`modifiedBy` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NULL,
	PRIMARY KEY ( `id_co` ),
	FOREIGN KEY ( `co_acId` ) REFERENCES `Account` ( `id_ac` ) ON DELETE NO ACTION ON UPDATE NO ACTION
	);
--  --
--  Table thestarbuck.Category
--  --
CREATE TABLE
IF
	NOT EXISTS `Category` (
		`id_cs` VARCHAR ( 6 ) NOT NULL,
		`cs_name` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NOT NULL,
		`cs_icon` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NULL,
		`cs_avatar` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NULL,
		`cs_active` BOOL NOT NULL DEFAULT 1,
		`createdDate` DATETIME ( 6 ) NOT NULL,
		`modifiedDate` DATETIME ( 6 ) NULL DEFAULT NULL,
		`createdBy` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NOT NULL,
		`modifiedBy` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NULL DEFAULT NULL,
		PRIMARY KEY ( `id_cs` )
	);

--  --
--  Table thestarbuck.Product
--  --
CREATE TABLE
IF
	NOT EXISTS `Product` (
		`id_pr` VARCHAR ( 6 ) NOT NULL,
		`pr_name` VARCHAR ( 255 ) NOT NULL,
		`pr_csId` VARCHAR(6) NULL,
		`pr_ingredients` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NOT NULL,
		`pr_price` FLOAT ( 24, 2 ) NOT NULL DEFAULT 0.0,
		`pr_discount` FLOAT ( 24, 2) NOT NULL DEFAULT 0.0,
		`pr_quantity` INT NOT NULL DEFAULT 0,
		`pr_active` BOOL NOT NULL DEFAULT 1,
		`pr_hot` INT NOT NULL DEFAULT 0,
		`pr_view` INT NULL DEFAULT 0,
		`pr_description` VARCHAR ( 500 ) CHARACTER
		SET 'utf8mb4' NULL,
		`pr_image` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NOT NULL,
		`pr_descriptionSeo` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NULL,
		`pr_keywordSeo` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NULL,
		`pr_titleSeo` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NULL,
		`pr_note` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NULL,
		`createdDate` DATETIME ( 6 ) NOT NULL,
		`modifiedDate` DATETIME ( 6 ) NULL DEFAULT NULL,
		`createdBy` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NOT NULL,
		`modifiedBy` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NULL DEFAULT NULL,
	PRIMARY KEY ( `id_pr` )
	);

DROP TABLE IF EXISTS `Topping`;
CREATE TABLE `Topping`(
		`id_tp` VARCHAR(6) PRIMARY KEY NOT NULL,
		`tp_name` VARCHAR(255) NULL,
		`tp_quantity` INT NOT NULL DEFAULT 0,
		`tp_price` FLOAT NOT NULL DEFAULT 0,
		`createdDate` DATETIME ( 6 ) NOT NULL,
		`modifiedDate` DATETIME ( 6 ) NULL DEFAULT NULL,
		`createdBy` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NOT NULL,
		`modifiedBy` VARCHAR ( 255 ) CHARACTER
		SET 'utf8mb4' NULL DEFAULT NULL
);

DROP TABLE IF EXISTS `ToppingOrder`;
CREATE TABLE `ToppingOrder`(
	`to_tpId` VARCHAR(6) NOT NULL,
	`to_orId` VARCHAR(6) NOT NULL,
	PRIMARY KEY ( `to_tpId`,`to_orId` ),
	FOREIGN KEY (`to_tpId`) REFERENCES `Topping`(`id_tp`)ON DELETE NO ACTION ON UPDATE NO ACTION,
	FOREIGN KEY (`to_orId`) REFERENCES `Orders`(`id_od`) ON DELETE NO ACTION ON UPDATE NO ACTION
);
DROP TABLE IF EXISTS `Account_Product_like`;
CREATE TABLE `Account_Product_like`(
	`ap_acId` VARCHAR(6),
	`ap_prId` VARCHAR(6),
	CONSTRAINT `PK_Account_Product_like` PRIMARY KEY (`ap_acId`,`ap_prId`),
	FOREIGN KEY (`ap_acId`) REFERENCES `Account`(`id_ac`),
	FOREIGN KEY (`ap_prId`) REFERENCES `Product`(`id_pr`)
);

CREATE TABLE
IF
	NOT EXISTS `Post` (
		`id_po` VARCHAR ( 6 ) NOT NULL,
		`po_title` TEXT NULL,
		`po_description` MEDIUMTEXT NULL,
		`po_content` LONGTEXT CHARACTER
		SET 'utf8mb4' NULL,
		`po_author` VARCHAR( 100 ) CHARACTER
		SET 'utf8mb4' NULL,
		`po_url_image` VARCHAR ( 255 ) NOT NULL,
		`po_url_Post` VARCHAR ( 255 ) NOT NULL,
		`date` VARCHAR ( 10 ) NULL DEFAULT NULL,
		PRIMARY KEY ( `id_po` )
	);
--  -- FUNCTION --
DROP FUNCTION IF EXISTS func_autoid;
 DELIMITER $$
CREATE FUNCTION `func_autoid`(lastuserid VARCHAR ( 6 ),
		prefix VARCHAR ( 2 ),
		size TINYINT
		) RETURNS varchar(6) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
BEGIN--  Khoi tao first id
				DECLARE num_nextuserid INT;
				DECLARE nextuserid VARCHAR(6);
				DECLARE temp INT;
				SET size = 6;
				IF lastuserid = ''  THEN
								SET lastuserid = CONCAT(prefix ,REPEAT('0',size -  CHAR_LENGTH( prefix )));
				END IF;
				SET lastuserid = TRIM( lastuserid ); --  get stt hien tai + 1
				SET num_nextuserid = CAST(REPLACE ( lastuserid, prefix, '' ) AS UNSIGNED)+ 1 ;
				SET nextuserid = prefix; --  WHILE LOOP
				SET temp = 0;
				WHILE CHAR_LENGTH(CONCAT(nextuserid,CONVERT ( num_nextuserid, CHAR ))) < size DO
						BEGIN
								SET nextuserid = CONCAT(prefix,CONVERT(REPEAT( '0', temp ),CHAR));
								SET temp = temp + 1;
						END;
				END WHILE;
				RETURN CONCAT(nextuserid,num_nextuserid);
END$$;
DELIMITER ;
--  View thestarbuck.tr_NextAccountID
--  --
--  USE `thestarbuck`;
 -- CREATE TRIGGER--
 -- Tao id_ac for Account
 DROP TRIGGER IF EXISTS tr_NextPublicKeyID;
 DELIMITER $$
 CREATE TRIGGER tr_NextPublicKeyID
 BEFORE INSERT ON `PublicKey`
 FOR EACH ROW
 BEGIN
				DECLARE lastAccID VARCHAR(6);
				SET lastAccID = (SELECT `keyID` FROM `PublicKey` ORDER BY `keyID` DESC LIMIT 1);
				IF lastAccID IS NULL THEN
						SET lastAccID = '';
				END IF;
				IF NEW.`keyID` = '' OR NEW.`keyID` IS NULL	THEN
						SET NEW.`keyID`= func_autoid(lastAccID, 'pk', 6);
				END IF;
 END$$;
 DELIMITER ;

 DROP TRIGGER IF EXISTS tr_NextAccountID;
 DELIMITER $$
 CREATE TRIGGER tr_NextAccountID
 BEFORE INSERT ON `Account`
 FOR EACH ROW
 BEGIN
				DECLARE lastAccID VARCHAR(6);
				SET lastAccID = (SELECT `id_ac` FROM `Account` ORDER BY `id_ac` DESC LIMIT 1);
				IF lastAccID IS NULL THEN
						SET lastAccID = '';
				END IF;
				IF NEW.`id_ac` = '' OR NEW.`id_ac` IS NULL	THEN
						SET NEW.`id_ac`= func_autoid(lastAccID, 'ac', 6);
				END IF;
 END$$;
 DELIMITER ;
 -- Tao id_po for Post
 DROP TRIGGER IF EXISTS tr_NextPostID;
 DELIMITER $$
 CREATE TRIGGER tr_NextPostID
 BEFORE INSERT ON `Post`
 FOR EACH ROW
 BEGIN
				DECLARE lastAccID VARCHAR(6);
				SET lastAccID = (SELECT `id_po` FROM `Post` ORDER BY `id_po` DESC LIMIT 1);
				IF lastAccID IS NULL THEN
						SET lastAccID = '';
				END IF;
				IF NEW.`id_po` = '' OR NEW.`id_po` IS NULL	THEN
						SET NEW.`id_po`= func_autoid(lastAccID, 'po', 6);
				END IF;
 END$$;
 DELIMITER ;
-- -- Tao id_ad for Address
 DROP TRIGGER IF EXISTS tr_NextAddressID;
 DELIMITER $$
 CREATE TRIGGER tr_NextAddressID
 BEFORE INSERT ON `Address`
 FOR EACH ROW
 BEGIN
				DECLARE lastAddressID VARCHAR(6);
				SET lastAddressID = (SELECT `id_ad` FROM `Address` ORDER BY `id_ad` DESC LIMIT 1);
				IF lastAddressID IS NULL THEN
						SET lastAddressID = '';
				END IF;
				IF NEW.`id_ad` = '' OR NEW.`id_ad` IS NULL	THEN
						SET NEW.`id_ad`= func_autoid(lastAddressID, 'ad', 6);
				END IF;
 END$$;
 DELIMITER ;

-- -- Tao id_od for Orders
 DROP TRIGGER IF EXISTS tr_NextOrdersID;
 DELIMITER $$
 CREATE TRIGGER tr_NextOrderID
 BEFORE INSERT ON `Orders`
 FOR EACH ROW
 BEGIN
				DECLARE lastOrderID VARCHAR(6);
				SET lastOrderID = (SELECT `id_od` FROM `Orders` ORDER BY `id_od` DESC LIMIT 1);
				IF lastOrderID IS NULL THEN
						SET lastOrderID = '';
				END IF;
				IF NEW.`id_od` = '' OR NEW.`id_od` IS NULL	THEN
						SET NEW.`id_od`= func_autoid(lastOrderID, 'od', 6);
				END IF;
 END$$;
 DELIMITER ;

-- -- Tao id_fe of FeedBack
 DROP TRIGGER IF EXISTS tr_NextFeedbackID;
 DELIMITER $$
 CREATE TRIGGER tr_NextFeedbackID
 BEFORE INSERT ON `Feedback`
 FOR EACH ROW
 BEGIN
				DECLARE lastFeedbackID VARCHAR(6);
				SET lastFeedbackID = (SELECT `id_fe` FROM `Feedback` ORDER BY `id_fe` DESC LIMIT 1);
				IF lastFeedbackID IS NULL THEN
						SET lastFeedbackID = '';
				END IF;
				IF NEW.`id_fe` = '' OR NEW.`id_fe` IS NULL	THEN
						SET NEW.`id_fe`= func_autoid(lastFeedbackID, 'fe', 6);
				END IF;
 END$$;
 DELIMITER ;

-- -- Tao id_sl for Slide
 DROP TRIGGER IF EXISTS tr_NextSlideID;
 DELIMITER $$
 CREATE TRIGGER tr_NextSlideID
 BEFORE INSERT ON `Slide`
 FOR EACH ROW
 BEGIN
				DECLARE lastSlideID VARCHAR(6);
				SET lastSlideID = (SELECT `id_sl` FROM `Slide` ORDER BY `id_sl` DESC LIMIT 1);
				IF lastSlideID IS NULL THEN
						SET lastSlideID = '';
				END IF;
				IF NEW.`id_sl` = '' OR NEW.`id_sl` IS NULL	THEN
						SET NEW.`id_sl`= func_autoid(lastSlideID, 'sl', 6);
				END IF;
 END$$;
 DELIMITER ;

--  -- Tao id_in for Address
 DROP TRIGGER IF EXISTS tr_NextAddressID;
 DELIMITER $$
 CREATE TRIGGER tr_NextAddressID
 BEFORE INSERT ON `Address`
 FOR EACH ROW
 BEGIN
				DECLARE lastAddressID VARCHAR(6);
				SET lastAddressID = (SELECT `id_ad` FROM `Address` ORDER BY `id_ad` DESC LIMIT 1);
				IF lastAddressID IS NULL THEN
						SET lastAddressID = '';
				END IF;
				IF NEW.`id_ad` = '' OR NEW.`id_ad` IS NULL	THEN
						SET NEW.`id_ad`= func_autoid(lastAddressID, 'ad', 6);
				END IF;
 END$$;
 DELIMITER ;

 -- -- Tao id_bi for Bill
  DROP TRIGGER IF EXISTS tr_NextBillID;
 DELIMITER $$
 CREATE TRIGGER tr_NextBillID
 BEFORE INSERT ON `Bill`
 FOR EACH ROW
 BEGIN
				DECLARE lastBillID VARCHAR(6);
				SET lastBillID = (SELECT `id_bi` FROM `Bill` ORDER BY `id_bi` DESC LIMIT 1);
				IF lastBillID IS NULL THEN
						SET lastBillID = '';
				END IF;
				IF NEW.`id_bi` = '' OR NEW.`id_bi` IS NULL	THEN
						SET NEW.`id_bi`= func_autoid(lastBillID, 'bi', 6);
				END IF;
 END$$;
 DELIMITER ;

-- -- Tao id_Contact
 DROP TRIGGER IF EXISTS tr_NextContactID;
 DELIMITER $$
 CREATE TRIGGER tr_NextContactID
 BEFORE INSERT ON `Contact`
 FOR EACH ROW
 BEGIN
				DECLARE lastContactID VARCHAR(6);
				SET lastContactID = (SELECT `id_co` FROM `Contact` ORDER BY `id_co` DESC LIMIT 1);
				IF lastContactID IS NULL THEN
						SET lastContactID = '';
				END IF;
				IF NEW.`id_co` = '' OR NEW.`id_co` IS NULL	THEN
						SET NEW.`id_co`= func_autoid(lastContactID, 'co', 6);
				END IF;
 END$$;
 DELIMITER ;

--  -- Tao id_cs for Category
 DROP TRIGGER IF EXISTS tr_NextCategoryID;
 DELIMITER $$
 CREATE TRIGGER tr_NextCategoryID
 BEFORE INSERT ON `Category`
 FOR EACH ROW
 BEGIN
				DECLARE lastCategoryID VARCHAR(6);
				SET lastCategoryID = (SELECT `id_cs` FROM `Category` ORDER BY `id_cs` DESC LIMIT 1);
				IF lastCategoryID IS NULL THEN
						SET lastCategoryID = '';
				END IF;
				IF NEW.`id_cs` = '' OR NEW.`id_cs` IS NULL	THEN
						SET NEW.`id_cs`= func_autoid(lastCategoryID, 'cs', 6);
				END IF;
 END$$;
 DELIMITER ;

--  -- Tao id_pr for Product
  DROP TRIGGER IF EXISTS tr_NextProductID;
 DELIMITER $$
 CREATE TRIGGER tr_NextProductID
 BEFORE INSERT ON `Product`
 FOR EACH ROW
 BEGIN
				DECLARE lastProductID VARCHAR(6);
				SET lastProductID = (SELECT `id_pr` FROM `Product` ORDER BY `id_pr` DESC LIMIT 1);
				IF lastProductID IS NULL THEN
						SET lastProductID = '';
				END IF;
				IF NEW.`id_pr` = '' OR NEW.`id_pr` IS NULL	THEN
						SET NEW.`id_pr`= func_autoid(lastProductID, 'pr', 6);
				END IF;
 END$$;
 DELIMITER ;

	 -- -- Tao id_ci for Slide
  DROP TRIGGER IF EXISTS tr_NextSlideID;
 DELIMITER $$
 CREATE TRIGGER tr_NextSlideID
 BEFORE INSERT ON `Slide`
 FOR EACH ROW
 BEGIN
				DECLARE lastSlideID VARCHAR(6);
				SET lastSlideID = (SELECT `id_sl` FROM `Slide` ORDER BY `id_sl` DESC LIMIT 1);
				IF lastSlideID IS NULL THEN
						SET lastSlideID = '';
				END IF;
				IF NEW.`id_sl` = '' OR NEW.`id_sl` IS NULL	THEN
						SET NEW.`id_sl`= func_autoid(lastSlideID, 'sl', 6);
				END IF;
 END$$;
 DELIMITER ;

 	 -- -- Tao id_ci for Slide
 DROP TRIGGER IF EXISTS tr_NextToppingID;
 DELIMITER $$
 CREATE TRIGGER tr_NextToppingID
 BEFORE INSERT ON `Topping`
 FOR EACH ROW
 BEGIN
				DECLARE lastToppingID VARCHAR(6);
				SET lastToppingID = (SELECT `id_tp` FROM `Topping` ORDER BY `id_tp` DESC LIMIT 1);
				IF lastToppingID IS NULL THEN
						SET lastToppingID = '';
				END IF;
				IF NEW.`id_tp` = '' OR NEW.`id_tp` IS NULL	THEN
						SET NEW.`id_tp`= func_autoid(lastToppingID, 'tp', 6);
				END IF;
 END$$;
 DELIMITER ;

SET FOREIGN_KEY_CHECKS = 1;

--  import data
-- Account
INSERT INTO `Account` VALUES ('ac0001', 'kyanh01', 'Nguyễn Kỳ Anh', 1, '111111111', '19130011@st.hcmuaf.edu.vn', '2021-08-11', 'c4ca4238a0b923820dcc509a6f75849b', NULL, NULL, NULL, NULL, NULL, 'MOD', '2020-09-12', '2020-09-12', 'NONE', 'NONE');
INSERT INTO `Account` VALUES ('ac0002', 'lethanh01', 'Nguyễn Lê Thành', 1, '1111111', '19130206@st.hcmuaf.edu.vn', '2021-08-11', 'c4ca4238a0b923820dcc509a6f75849b', NULL, NULL, NULL, NULL, NULL, 'MOD', '2020-09-12', '2020-09-12', 'NONE', 'NONE');
INSERT INTO `Account` VALUES ('ac0003', 'minhnhu01', 'Dương Thị Minh Như', 1, '365448301', '19130163@st.hcmuaf.edu.vn', '2021-08-11', 'c4ca4238a0b923820dcc509a6f75849b', NULL, NULL, NULL, NULL, NULL, 'MOD', '2020-09-12', '2020-09-12', 'NONE', 'NONE');
INSERT INTO `Account` VALUES ('ac0004', 'sebastion', 'Sebastion', 1, '0791 125 9', 'sebastion@gmail.com', '2021-09-12', 'c4ca4238a0b923820dcc509a6f75849b', 'https://i.pravatar.cc/500?img=33', NULL, NULL, NULL, '2021-09-12', 'MEMBER', '2020-09-12', '2020-09-12', 'NONE', 'NONE');
INSERT INTO `Account` VALUES ('ac0005', 'aadya', 'Aadya', 1, '0522 702 6', 'aadya@gmail.com', '2021-09-12', 'c4ca4238a0b923820dcc509a6f75849b', 'https://i.pravatar.cc/500?img=44', NULL, NULL, NULL, '2021-09-12', 'MEMBER', '2020-09-12', '2020-09-12', 'NONE', 'NONE');

-- Product
INSERT INTO `Product` VALUES ('pr0001', 'Star Drink', 'cs0001', 'Starfruit- and kiwi-flavored juice and real kiwi fruit pieces added to coconutmilk and shaken with ice. Summer re-imagined.', 7, 0.7, 50, 1, 0, 0, 'Ice, Kiwi Starfruit Refresher Base [Water, Sugar, White Grape Juice Concentrate, Natural Flavors, Citric Acid, Natural Green Coffee Flavor, Fruit Juice For Color (Watermelon And Juito Fruit), Rebaudiside A, Turmeric For Color], Coconutmilk [Water, Coconut Cream, Cane Sugar, Contains 2 Or Less Of Tricalcium Phosphate, Coconut Water Concentrate, Sea Salt, Natural Flavors, Xanthan Gum, Gellan Gum, Corn Dextrin, Guar Gum, Vitamin A Palmitate, And Vitamin D 2], Freeze Dried Kiwi.', 'http://localhost:8080/TheStarBuck/template/web/image/products/1.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'KA', 'KA');
INSERT INTO `Product` VALUES ('pr0002', 'Dragon Drink', 'cs0001', 'Starfruit- and kiwi-flavored juice and real kiwi fruit pieces added to coconutmilk and shaken with ice. Summer re-imagined.', 7, 0.7, 50, 1, 0, 0, 'Ice, Mango Dragonfruit Refreshers Base [Water, Sugar, White Grape Juice Concentrate, Natural Flavors, Citric Acid, Natural Green Coffee Flavor, Rebaudiside A], Coconutmilk [Water, Coconut Cream, Cane Sugar, Contains 2 Or Less Of Tricalcium Phosphate, Coconut Water Concentrate, Sea Salt, Natural Flavors, Xanthan Gum, Gellan Gum, Corn Dextrin, Guar Gum, Vitamin A Palmitate, And Vitamin D 2], Freeze Dried Dragonfruit Pieces', 'http://localhost:8080/TheStarBuck/template/web/image/products/2.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'KA', 'KA');
INSERT INTO `Product` VALUES ('pr0003', 'Violet Drink', 'cs0001', 'The sweet blackberries and tart hibiscus flavor of our Very Berry Hibiscus Starbucks Refreshers® beverage swirl together with creamy coconutmilk and ice, creating refreshing (and violet-hued!) sips.', 7, 0.7, 50, 1, 0, 0, 'Ice, Berry Refresher Base [Water, Sugar, White Grape Juice Concentrate, Natural Flavor, Green Coffee Extract, Citric Acid, Erythritol, Ascorbic Acid (Vitamin C), Rebaudiside A], Coconut Milk [Water, Coconut Cream, Cane Sugar, Tricalcium Phosphate, Coconut Water Concentrate, Natural Flavors, Sea Salt, Carrageenan, Gellan Gum, Corn Dextrin, Xanthan Gum, Guar Gum, Vitamin A Palmitate, Vitamin D 2 (Ergocalciferol)], Freeze Dried Blackberries', 'http://localhost:8080/TheStarBuck/template/web/image/products/3.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'KA', 'KA');
INSERT INTO `Product` VALUES ('pr0004', 'Lemonade', 'cs0001', 'Awaken your taste buds with the zing of refreshing lemonade—this tangy, fresh sip puts a little zip in your step.', 7, 0.7, 50, 1, 0, 0, 'Lemonade [Water, Lemon Juice, Sugar, Lemon Oil], Ice.', 'http://localhost:8080/TheStarBuck/template/web/image/products/4.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'KA', 'KA');
INSERT INTO `Product` VALUES ('pr0005', 'Evolution Fresh Orange', 'cs0004', 'Once you try this orange juice—cold-pressed with oranges picked and squeezed at their peak of sweetness—youll never  back to any other. Vitamin C–packed and made with 100% juice, no added sweeteners or any artificial flavors.', 7, 0.7, 50, 1, 0, 0, 'Orange Juice.', 'http://localhost:8080/TheStarBuck/template/web/image/products/5.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'KA', 'KA');
INSERT INTO `Product` VALUES ('pr0006', 'Cappuccino', 'cs0002', 'Dark, rich espresso lies in wait under a smoothed and stretched layer of thick milk foam. An alchemy of barista artistry and craft.', 8, 0.8, 50, 1, 0, 0, 'Milk, Brewed Espresso.', 'http://localhost:8080/TheStarBuck/template/web/image/products/6.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'KA', 'KA');
INSERT INTO `Product` VALUES ('pr0007', 'Caffè Latte', 'cs0002', 'Our dark, rich espresso balanced with steamed milk and a light layer of foam. A perfect milk-forward warm-up.', 8, 0.8, 50, 1, 0, 0, 'Milk, Brewed Espresso.', 'http://localhost:8080/TheStarBuck/template/web/image/products/7.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'KA', 'KA');
INSERT INTO `Product` VALUES ('pr0008', 'Caffè Mocha', 'cs0002', 'Our rich, full-bodied espresso combined with bittersweet mocha sauce and steamed milk, then topped with sweetened whipped cream. The classic coffee drink that always sweetly satisfies.', 8, 0.8, 50, 1, 0, 0, 'Milk, Brewed Espresso, Mocha Sauce [Water, Sugar, Cocoa Processed With Alkali, Natural Flavor], Whipped Cream [Cream (Cream, Mono And Diglycerides, Carageenan), Vanilla Syrup (Sugar, Water, Natural Flavors, Potassium Sorbate, Citric Acid)]', 'http://localhost:8080/TheStarBuck/template/web/image/products/8.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'KA', 'KA');
INSERT INTO `Product` VALUES ('pr0009', 'Caffè Americano', 'cs0002', 'Espresso shots topped with hot water create a light layer of crema culminating in this wonderfully rich cup with depth and nuance. Pro Tip: For an additional boost, ask your barista to try this with an extra shot.', 8, 0.8, 50, 1, 0, 0, 'Water, Brewed Espresso.', 'http://localhost:8080/TheStarBuck/template/web/image/products/9.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'KA', 'KA');
INSERT INTO `Product` VALUES ('pr0010', 'Peach Tranquility', 'cs0002', 'A sweet fusion of peach, candied pineapple, chamomile blossoms, lemon verbena and rose hips come together in this caffeine-free herbal tea. Sip back and relax.', 5, 0.5, 50, 1, 0, 0, 'An Infusion Of [Water, Apple Pieces, Candied Pineapple Pieces (Pineapple, Sugar, Citric Acid), Rose Hip Peels, Peach Pieces (Peach, Rice Flour), Peach Pieces, Chamomile Flowers, Lemon Verbena, Artificial Flavoring]', 'http://localhost:8080/TheStarBuck/template/web/image/products/10.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'KA', 'KA');
INSERT INTO `Product` VALUES ('pr0011', 'Everything Bagel', 'cs0003', 'Our signature New York–style bagel topped with onion, garlic, salt, poppy and sesame seeds.', 9, 0.9, 50, 1, 0, 0, 'Unbleached Enriched Flour [Wheat Flour, Malted Barley Flour, Niacin, Reduced Iron, Thiamine Mononitrate, Riboflavin, Folic Acid], Water, Sugar, Sesame Seeds, Contain 2 Or Less Of Dehydrated Onion, Dehydrated Garlic, Salt, Wheat Gluten, Yeast, Toasted Chopped Onion, Poppy Seeds, Distilled Vinegar, Guar Gum, Ascorbic Acid, Enzymes, Monoglycerides.', 'http://localhost:8080/TheStarBuck/template/web/image/products/11.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'KA', 'KA');
INSERT INTO `Product` VALUES ('pr0012', 'Cheese Danish', 'cs0003', 'Our take on the traditional cheese Danish pairs flaky croissant dough with Neufchâtel cheese—a simple recipe with simple ingredients you’re sure to love.', 9, 0.9, 50, 1, 0, 0, 'Enriched Wheat Flour [Wheat Flour, Niacin, Reduced Iron, Ascorbic Acid, Thiamine Mononitrate, Riboflavin, Folic Acid, Enzyme], Neufchatel Cheese [Pasteurized Cultured Milk And Cream, Salt, Stabilizers (Xanthan, Locust Bean And Guar Gums)], Water, Butter [Cream (Milk), Natural Flavor], Sugar, Dry Whole Milk, Eggs, Yeast, Sea Salt, Sourdough [Water, Fermented Wheat Flour], Dough Conditioner [Wheat Gluten, Xanthan Gum, Ascorbic Acid, Salt, Enzymes], Lactic Acid.', 'http://localhost:8080/TheStarBuck/template/web/image/products/12.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'KA', 'KA');
INSERT INTO `Product` VALUES ('pr0013', 'Butter Croissant', 'cs0003', 'This classic croissant is made with real butter to create a golden, crunchy top with soft, flaky layers inside. The perfect match: pair it with a signature cup of Pike Place® Roast.', 9, 0.9, 50, 1, 0, 0, 'Enriched Wheat Flour [Wheat Flour, Niacin, Reduced Iron, Ascorbic Acid, Thiamine Mononitrate, Riboflavin, Folic Acid, Enzyme], Butter [Cream (Milk), Natural Flavor], Water, Sugar, Eggs, Whole Milk Powder, Yeast, Sea Salt, Sourdough [Water, Fermented Wheat Flour], Dough Conditioner [Wheat Gluten, Ascorbic Acid, Xanthan Gum, Salt, Enzymes]', 'http://localhost:8080/TheStarBuck/template/web/image/products/13.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'KA', 'KA');
INSERT INTO `Product` VALUES ('pr0014', 'Pumpkin Loaf', 'cs0003', 'A gently spiced bread with pumpkin flavors and pepitas gives you a tasty way to celebrate a seasonal favorite.', 9, 0.9, 50, 1, 0, 0, 'Sugar, Pumpkin Puree, Enriched Flour [Wheat Flour, Niacin, Reduced Iron, Thiamine Mononitrate, Riboflavin, Folic Acid], Egg, Soybean And Or Canola Oil, Enriched Flour [Wheat Flour, Malted Barley Flour, Niacin, Reduced Iron, Thiamine Mononitrate, Riboflavin, Folic Acid], Water, Pepitas [Pepitas, Safflower And Or Canola And Or Cottonseed And Or Peanut Oil, Salt], Food Starch Modified, Sea Salt, Spice, Baking Powder [Sodium Acid Pyrophosphate, Sodium Bicarbonate, Corn Starch, Monocalcium Phosphate]', 'http://localhost:8080/TheStarBuck/template/web/image/products/14.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'KA', 'KA');
INSERT INTO `Product` VALUES ('pr0015', 'Blueberry Muffin', 'cs0003', 'This delicious muffin is dotted throughout with sweet, juicy blueberries and a hint of lemon and dusted on top with sugar for a delightfully crunchy texture.', 9, 0.9, 50, 1, 0, 0, 'Sugar, Enriched Wheat Flour [Wheat Flour, Niacin, Reduced Iron, Thiamine Mononitrate, Riboflavin, Folic Acid], Blueberries, Plain Yogurt [Milk, Skim Milk, Skim Milk Powder, Whey, Bacterial Culture], Soybean And Or Canola Oil, Eggs, Honey, Baking Powder [Sodium Acid Pyrophosphate, Cornstarch, Sodium Bicarbonate, Monocalcium Phosphate], Lemon Zest [Lemon Peel, Sugar, Lemon Oil], Natural Flavor, Sea Salt, Whey [Milk], Soy Lecithin.', 'http://localhost:8080/TheStarBuck/template/web/image/products/15.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'KA', 'KA');
INSERT INTO `Product` VALUES ('pr0016', 'Kiwi Starfruit Starbucks Refreshers® Beverage', 'cs0001', 'Starfruit- and kiwi-flavored juice and real kiwi fruit pieces shaken with ice. Deliciously refreshing.', 7, 0.7, 50, 1, 0, 0, 'Ice, Kiwi Starfruit Refresher Base [Water, Sugar, White Grape Juice Concentrate, Natural Flavors, Citric Acid, Natural Green Coffee Flavor, Fruit Juice For Color (Watermelon And Juito Fruit), Rebaudiside A, Turmeric For Color], Freeze Dried Kiwi.', 'http://localhost:8080/TheStarBuck/template/web/image/products/16.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'KA', 'KA');
INSERT INTO `Product` VALUES ('pr0017', 'Kiwi Starfruit Lemonade Starbucks Refreshers® Beverage', 'cs0001', 'Starfruit- and kiwi-flavored juice, lemonade and real kiwi fruit pieces shaken with ice. A super-summer pick-me-up.', 7, 0.7, 50, 1, 0, 0, 'Ice, Kiwi Starfruit Refresher Base [Water, Sugar, White Grape Juice Concentrate, Natural Flavors, Citric Acid, Natural Green Coffee Flavor, Fruit Juice For Color (Watermelon And Juito Fruit), Rebaudiside A, Turmeric For Color], Lemonade [Water, Lemon Juice, Sugar, Lemon Oil], Freeze Dried Kiwi.', 'http://localhost:8080/TheStarBuck/template/web/image/products/17.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'KA', 'KA');
INSERT INTO `Product` VALUES ('pr0018', 'Mango Dragonfruit Starbucks Refreshers® Beverage', 'cs0001', 'This tropical-inspired pick-me-up—crafted with a refreshing combination of sweet mango and dragonfruit flavors—is hand-shaken with ice and a scoop of real diced dragonfruit. Contains caffeine.', 7, 0.7, 50, 1, 0, 0, 'Ice, Mango Dragonfruit Refreshers Base [Water, Sugar, White Grape Juice Concentrate, Natural Flavors, Citric Acid, Natural Green Coffee Flavor, Rebaudiside A], Freeze Dried Dragonfruit Pieces.', 'http://localhost:8080/TheStarBuck/template/web/image/products/18.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'KA', 'KA');
INSERT INTO `Product` VALUES ('pr0019', 'Mango Dragonfruit Lemonade Starbucks Refreshers® Beverage', 'cs0001', 'This tropical-inspired pick-me-up—crafted with a clever combination of vibrant lemonade, sweet mango and refreshing dragonfruit flavors—is hand-shaken with ice and a scoop of real diced dragonfruit. Contains caffeine.', 7, 0.7, 50, 1, 0, 0, 'Ice, Mango Dragonfruit Refreshers Base [Water, Sugar, White Grape Juice Concentrate, Natural Flavors, Citric Acid, Natural Green Coffee Flavor, Rebaudiside A], Lemonade [Water, Lemon Juice, Sugar, Lemon Oil], Freeze Dried Dragonfruit Pieces.', 'http://localhost:8080/TheStarBuck/template/web/image/products/19.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'KA', 'KA');
INSERT INTO `Product` VALUES ('pr0020', 'Strawberry Açaí Lemonade Starbucks Refreshers® Beverage', 'cs0001', 'Sweet strawberry flavors, passion fruit and açaí notes balanced with the delightful zing of lemonade, caffeine from green coffee extract and served over ice. This is the utimate pick-me-up your afternoon is calling for.', 7, 0.7, 50, 1, 0, 0, 'Ice, Strawberry Acai Base [Water, Sugar, White Grape Juice Concentrate, Citric Acid, Natural Flavors, Natural Green Coffee Flavor, Fruit And Vegetable Juice, Rebaudioside A], Lemonade [Water, Lemon Juice, Sugar, Lemon Oil], Freeze Dried Strawberries.', 'http://localhost:8080/TheStarBuck/template/web/image/products/20.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'KA', 'KA');
INSERT INTO `Product` VALUES ('pr0021', 'Very Berry Hibiscus Lemonade Starbucks Refreshers® Beverage', 'cs0001', 'Fruit juice and whole blackberries balanced with the delightful zing of lemonade, caffeine from green coffee extract and served over ice. This is the ultimate pick-me-up your afternoon is calling for.', 7, 0.7, 50, 1, 0, 0, 'Ice, Berry Refresher Base [Water, Sugar, White Grape Juice Concentrate, Natural Flavor, Green Coffee Extract, Citric Acid, Erythritol, Ascorbic Acid (Vitamin C), Rebaudiside A], Lemonade [Water, Lemon Juice, Sugar, Lemon Oil], Freeze Dried Blackberries.', 'http://localhost:8080/TheStarBuck/template/web/image/products/21.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'KA', 'KA');
INSERT INTO `Product` VALUES ('pr0022', 'Pink Drink', 'cs0001', 'Our crisp, Strawberry Açaí Refreshers® Beverage, with its accents of passion fruit, is combined with creamy coconutmilk. A fruity and refreshing sip of spring, no matter what time of year.', 7, 0.7, 50, 1, 0, 0, 'Ice, Strawberry Acai Base [Water, Sugar, White Grape Juice Concentrate, Citric Acid, Natural Flavors, Natural Green Coffee Flavor, Fruit And Vegetable Juice, Rebaudioside A], Coconutmilk [Water, Coconut Cream, Cane Sugar, Contains 2 Or Less Of Tricalcium Phosphate, Coconut Water Concentrate, Sea Salt, Natural Flavors, Xanthan Gum, Gellan Gum, Corn Dextrin, Guar Gum, Vitamin A Palmitate, And Vitamin D 2], Freeze Dried Strawberries.', 'http://localhost:8080/TheStarBuck/template/web/image/products/22.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'KA', 'KA');
INSERT INTO `Product` VALUES ('pr0023', 'Strawberry Açaí Starbucks Refreshers® Beverage', 'cs0001', 'Sweet strawberry flavors accented by passion fruit and açaí notes, caffeinated with green coffee extract—a welcoming sweet spot of refreshment.', 7, 0.7, 50, 1, 0, 0, 'Ice, Strawberry Acai Base [Water, Sugar, White Grape Juice Concentrate, Citric Acid, Natural Flavors, Natural Green Coffee Flavor, Fruit And Vegetable Juice, Rebaudioside A], Freeze Dried Strawberries.', 'http://localhost:8080/TheStarBuck/template/web/image/products/23.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'KA', 'KA');
INSERT INTO `Product` VALUES ('pr0024', 'Very Berry Hibiscus Starbucks Refreshers® Beverage', 'cs0001', 'Real fruit juice and whole blackberries shaken with Green Coffee Extract for a boost of natural energy, served over ice.', 7, 0.7, 50, 1, 0, 0, 'Ice, Berry Refresher Base [Water, Sugar, White Grape Juice Concentrate, Natural Flavor, Green Coffee Extract, Citric Acid, Erythritol, Ascorbic Acid (Vitamin C), Rebaudiside A], Water, Freeze Dried Blackberries.', 'http://localhost:8080/TheStarBuck/template/web/image/products/24.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'KA', 'KA');
INSERT INTO `Product` VALUES ('pr0025', 'Starbucks Refreshers™ Blueberry Acai', 'cs0004', 'Tangy-sweet blueberry, rich acai berry and sparkling natural caffeine are ready to invigorate your day.', 6, 0.6, 50, 1, 0, 0, 'Not available for this item.', 'http://localhost:8080/TheStarBuck/template/web/image/products/25.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'KA', 'KA');
INSERT INTO `Product` VALUES ('pr0026', 'Evolution Fresh® Organic Vital Berry', 'cs0004', 'Bright berries, orange and mango blend together for a satisfying smoothie with a delicious punch of vitamin C.', 6, 0.6, 50, 1, 0, 0, 'Organic Juices [Apple, Strawberry Puree, Raspberry Puree, Orange, Mango Puree, Acerola Cherry Puree]', 'http://localhost:8080/TheStarBuck/template/web/image/products/26.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'KA', 'KA');
INSERT INTO `Product` VALUES ('pr0027', 'Evolution Fresh® Organic Defense Up®', 'cs0004', 'A refreshing smoothie packed with bright flavor thanks to organic oranges, pineapples, mangoes, apples and acerola cherries. An excellent source of vitamin C, made with 100% juice and no added sweeteners or artificial flavors.', 6, 0.6, 50, 1, 0, 0, 'Organic Orange Juice, Organic Pineapple Juice, Organic Mango Puree, Organic Apple Juice, Organic Acerola Cherry Puree.', 'http://localhost:8080/TheStarBuck/template/web/image/products/27.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'KA', 'KA');
INSERT INTO `Product` VALUES ('pr0028', 'Evolution Fresh® Organic Super Fruit Greens', 'cs0004', 'Heres a satisfying way to get your greens: a fruit and vegetable smoothie packed with goodness including mango puree, spinach, spirulina, chlorella and Vitamin C. Made with 100% juice and no added sweeteners or artificial flavors.', 6, 0.6, 50, 1, 0, 0, 'Organic Orange Juice, Organic Mango Puree, Organic Apple Juice, Organic Pineapple Juice, Organic Cucumber Juice, Organic Spinach Juice, Organic Romaine Lettuce Juice, Organic Kale Juice, Organic Spirulina, Organic Chlorella.', 'http://localhost:8080/TheStarBuck/template/web/image/products/28.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'KA', 'KA');
INSERT INTO `Product` VALUES ('pr0029', 'Evolution Fresh® Mighty Watermelon', 'cs0004', 'A naturally refreshing and hydrating juice with just a touch of lemon, our fruit is picked at its absolute peak of sweetness then cold-pressed for maximum flavor and nutrients. 100% juice with no added sweeteners or artificial flavors.', 6, 0.6, 50, 1, 0, 0, 'Watermelon Juice, Lemon Juice.', 'http://localhost:8080/TheStarBuck/template/web/image/products/29.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'KA', 'KA');
INSERT INTO `Product` VALUES ('pr0030', 'Tree Top Apple Juice Box', 'cs0004', 'This childhood favorite contains 100% of your daily vitamin C with just the right amount of sweetness.', 6, 0.6, 50, 1, 0, 0, 'Not available for this item.', 'http://localhost:8080/TheStarBuck/template/web/image/products/30.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'KA', 'KA');
INSERT INTO `Product` VALUES ('pr0031', 'Blended Strawberry Lemonade', 'cs0001', 'Awaken your taste buds with the zing of refreshing lemonade \r\n							infused with a hint of delicious strawberry flavor and blended with ice. \r\n							A light, fresh beverage that puts a little zip in your step.', 8, 0.0, 50, 1, 0, 0, 'Ice, Lemonade [Water, Lemon Juice, Sugar, Lemon Oil], \r\n							Creme Frappuccino Syrup [Sugar, Water, Natural Flavor, Salt, Xanthan Gum, \r\n							Potassium Sorbate, Citric Acid], Strawberry Puree Sauce \r\n							[Strawberry Puree, White Grape Juice Concentrate, Water, \r\n							Fruit And Vegetable Juice For Color, Natural Flavors, Xanthan Gum, Citric Acid]', 'http://localhost:8080/TheStarBuck/template/web/image/products/31.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'ND', 'ND');
INSERT INTO `Product` VALUES ('pr0032', 'Horizon® Chocolate Organic Milk', 'cs0004', 'Great for snacks, travel and more, this organic lowfat milk box is a convenient way to experience your milk on the  and everywhere.', 5, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/32.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'ND', 'ND');
INSERT INTO `Product` VALUES ('pr0033', 'Horizon® Organic Lowfat Milk Box', 'cs0001', 'Great for snacks, travel and more, this organic lowfat milk box is a convenient way to experience your milk on the  and everywhere.', 5, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/33.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'ND', 'ND');
INSERT INTO `Product` VALUES ('pr0034', 'Milk', 'cs0002', 'Skim, 2%, soy, almond, or coconutmilk served chilled or over ice. Simply refreshing.', 4, 0, 50, 1, 0, 0, 'Milk', 'http://localhost:8080/TheStarBuck/template/web/image/products/34.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'ND', 'ND');
INSERT INTO `Product` VALUES ('pr0035', 'Horizon® Organic Vanilla Milk Box', 'cs0004', 'Grab a mini carton of organic milk to complement a treat from our pastry case or pack into a lunch bag. Enjoy a sip and a touch of tasty vanilla.', 5, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/35.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'ND', 'ND');
INSERT INTO `Product` VALUES ('pr0036', 'Galvanina Sparkling Water', 'cs0004', 'The essential refresher. Our sparking, natural mineral water will quench your thirst with effervescent ease.', 5, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/36.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'ND', 'ND');
INSERT INTO `Product` VALUES ('pr0037', 'Spindrift® Grapefruit Sparkling Water', 'cs0004', 'Pink, tangy, grapefruits squeezed into sparkling water—along with touches of orange and lemon—for an effervescent, delightfully refreshing beverage.', 5, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/37.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'ND', 'ND');
INSERT INTO `Product` VALUES ('pr0038', 'Spindrift® Raspberry Lime Sparkling Water', 'cs0004', 'Raspberry and lime squeezed into sparkling water for an effervescent, delightfully refreshing beverage.', 5, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/38.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'ND', 'ND');
INSERT INTO `Product` VALUES ('pr0039', 'Galvanina Sparkling Water - Lime', 'cs0004', 'Natural, thirst-quenching mineral water with a twist of refreshing lime.', 5, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/39.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'ND', 'ND');
INSERT INTO `Product` VALUES ('pr0040', 'Ethos® Bottled Water', 'cs0004', 'For every bottle of Ethos® water you buy, Starbucks will donate 5 cents to support \r\n							humanitarian programs in coffee-growing communities, providing clean, safe water to \r\n							those in need.', 5, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/40.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'ND', 'ND');
INSERT INTO `Product` VALUES ('pr0041', 'Hawai‘i Volcanic Water', 'cs0004', 'Hawaii`s signature natural artesian water from the Big Island—rejuvenating and replenishening.', 5, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/41.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'ND', 'ND');
INSERT INTO `Product` VALUES ('pr0042', 'Pumpkin Cream Cold Brew', 'cs0001', 'Starbucks® Cold Brew sweetened with vanilla syrup and topped with a pumpkin cream cold foam \r\n							and a dusting of pumpkin spice Topping.', 8, 0, 50, 1, 0, 0, 'Ice, Brewed Coffee, Pumpkin Cream Cold Foam [Cream (Cream, Mono And Diglycerides, Carageenan), Milk, \r\n							Pumpkin Spice Sauce (Sugar, Condensed Skim Milk, Pumpkin Puree, Contains 2 Or \r\n							Less Of Fruit And Vegetable Juice For Color, Natural Flavors, Annatto, Salt, \r\n							Potassium Sorbate), Vanilla Syrup (Sugar, Water, Natural Flavors, Potassium Sorbate, Citric Acid)], \r\n							Vanilla Syrup [Sugar, Water, Natural Flavors, Potassium Sorbate, Citric Acid], \r\n							Pumpkin Spice Toppin', 'http://localhost:8080/TheStarBuck/template/web/image/products/42.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'ND', 'ND');
INSERT INTO `Product` VALUES ('pr0043', 'Salted Caramel Cream Cold Brew', 'cs0001', 'Here`s a savory-meets-sweet refreshing beverage certain to delight: our signature, super-smooth cold brew, sweetened with a touch of caramel and topped with a salted, rich cold foam.', 8, 0, 50, 1, 0, 0, 'Ice, Brewed Coffee, Salted Caramel Cream [Vanilla Sweet Cream (Cream (Cream, Mono And Diglycerides, Carageenan), Milk, Vanilla Syrup (Sugar, Water, Natural Flavors, Potassium Sorbate, Citric Acid)), Caramel Syrup (Sugar, Water, Natural Flavor, Citric Acid, Potassium Sorbate), Salt], Vanilla Syrup [Sugar, Water, Natural Flavors, Potassium Sorbate, Citric Acid]', 'http://localhost:8080/TheStarBuck/template/web/image/products/43.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'ND', 'ND');
INSERT INTO `Product` VALUES ('pr0044', 'Honey Almondmilk Cold Brew', 'cs0001', 'Starbucks® Cold Brew lightly sweetened with honey and topped off with almondmilk for a balanced taste in every delicious sip.', 8, 0, 50, 1, 0, 0, 'Ice, Brewed Coffee, Almondmilk [Filtered Water, Almonds, Sugar, Calcium Carbonate, Sunflower Lecithin, Sea Salt, Xanthan Gum, Guar Gum, Vitamin A Palmitate, Vitamin D 2 (Ergocalciferol)], Honey Blend [Honey, Water, Natural Flavors, Potassium Sorbate, Xanthan Gum, Citric Acid]', 'http://localhost:8080/TheStarBuck/template/web/image/products/44.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'ND', 'ND');
INSERT INTO `Product` VALUES ('pr0045', 'Starbucks Reserve® Cold Brew', 'cs0001', 'Our Starbucks Reserve® Cold Brew—a nuanced, smooth cup of coffee, perfect over ice—is extraordinarily uplifting in a bold form.', 8, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/45.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'ND', 'ND');
INSERT INTO `Product` VALUES ('pr0046', 'Starbucks® Cold Brew Coffee', 'cs0001', 'Handcrafted in small batches daily, slow-steeped in cool water for 20 hours, without touching heat—Starbucks® Cold Brew is made from our custom blend of beans grown to steep long and cold for a super-smooth flavor.', 8, 0, 50, 1, 0, 0, 'Brewed Coffee, Ice', 'http://localhost:8080/TheStarBuck/template/web/image/products/46.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'ND', 'ND');
INSERT INTO `Product` VALUES ('pr0047', 'Vanilla Sweet Cream Cold Brew', 'cs0001', 'Our slow-steeped custom blend of Starbucks® Cold Brew coffee accented with vanilla and topped with a delicate float of house-made vanilla sweet cream that cascades throughout the cup. It`s over-the-top and super-smooth.', 8, 0, 50, 1, 0, 0, 'Ice, Brewed Coffee, Vanilla Sweet Cream [Cream (Cream, Mono And Diglycerides, Carageenan), Milk, Vanilla Syrup (Sugar, Water, Natural Flavors, Potassium Sorbate, Citric Acid)], Vanilla Syrup [Sugar, Water, Natural Flavors, Potassium Sorbate, Citric Acid]', 'http://localhost:8080/TheStarBuck/template/web/image/products/47.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'ND', 'ND');
INSERT INTO `Product` VALUES ('pr0048', 'Starbucks® Cold Brew Coffee with Milk', 'cs0001', 'Handcrafted in small batches daily, slow-steeped in cool water for 20 hours, without touching heat and finished with a splash of milk—Starbucks® Cold Brew is made from our custom blend of beans grown to steep long and cold for a super-smooth flavor.', 8, 0, 50, 1, 0, 0, 'Brewed Coffee, Ice, Milk', 'http://localhost:8080/TheStarBuck/template/web/image/products/48.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'ND', 'ND');
INSERT INTO `Product` VALUES ('pr0049', 'Honey Almondmilk Nitro Cold Brew', 'cs0002', 'Starbucks® Nitro Cold Brew lightly sweetened with honey and topped off with almondmilk for a balanced taste of energy throughout.', 6, 0, 50, 1, 0, 0, 'Brewed Coffee, Almondmilk [Filtered Water, Almonds, Sugar, Calcium Carbonate, Sunflower Lecithin, Sea Salt, Xanthan Gum, Guar Gum, Vitamin A Palmitate, Vitamin D 2 (Ergocalciferol)], Honey Blend [Honey, Water, Natural Flavors, Potassium Sorbate, Xanthan Gum, Citric Acid]', 'http://localhost:8080/TheStarBuck/template/web/image/products/49.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'ND', 'ND');
INSERT INTO `Product` VALUES ('pr0050', 'Starbucks Reserve® Nitro Cold Brew', 'cs0002', 'Our small-lot Starbucks Reserve® cold brew is infused with nitrogen for a naturally sweet flavor and cascading, velvety crema you can see and taste.', 6, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/50.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'ND', 'ND');
INSERT INTO `Product` VALUES ('pr0051', 'Nitro Cold Brew', 'cs0002', 'Our small-batch cold brew—slow-steeped for a super-smooth taste—gets even better. We`re infusing it with nitrogen to create a sweet flavor without sugar and cascading, velvety crema. Perfection is served.', 6, 0, 50, 1, 0, 0, 'Brewed Coffee', 'http://localhost:8080/TheStarBuck/template/web/image/products/51.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'ND', 'ND');
INSERT INTO `Product` VALUES ('pr0052', 'Vanilla Sweet Cream Nitro Cold Brew', 'cs0002', 'Served cold, straight from the tap, our Nitro Cold Brew is topped with a float of house-made vanilla sweet cream. The result: a cascade of velvety coffee that is more sippable than ever.', 6, 0, 50, 1, 0, 0, 'Brewed Coffee, Vanilla Sweet Cream [Cream (Cream, Mono And Diglycerides, Carageenan), Milk, Vanilla Syrup (Sugar, Water, Natural Flavors, Potassium Sorbate, Citric Acid)]', 'http://localhost:8080/TheStarBuck/template/web/image/products/52.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'ND', 'ND');
INSERT INTO `Product` VALUES ('pr0053', 'Iced Caffè Americano', 'cs0001', 'Espresso shots topped with cold water produce a light layer of crema, then served over ice. The result: a wonderfully rich cup with depth and nuance. Pro Tip: For an additional boost, ask your barista to try this with an extra shot.', 7, 0, 50, 1, 0, 0, 'Ice, Water, Brewed Espresso', 'http://localhost:8080/TheStarBuck/template/web/image/products/53.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'ND', 'ND');
INSERT INTO `Product` VALUES ('pr0054', 'Iced Coffee', 'cs0001', 'Freshly brewed Starbucks® Iced Coffee Blend served chilled and sweetened over ice. An absolutely, seriously, refreshingly lift to any day.', 7, 0, 50, 1, 0, 0, 'Ice, Brewed Coffee, Classic Syrup [Sugar, Water, Natural Flavors, Potassium Sorbate, Citric Acid]', 'http://localhost:8080/TheStarBuck/template/web/image/products/54.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'ND', 'ND');
INSERT INTO `Product` VALUES ('pr0055', 'Iced Coffee with Milk', 'cs0001', 'Freshly brewed Starbucks® Iced Coffee Blend with milk served chilled and sweetened over ice. An absolutely, seriously, refreshingly lift to any day.', 7, 0, 50, 1, 0, 0, 'Ice, Brewed Coffee, Milk, Classic Syrup [Sugar, Water, Natural Flavors, Potassium Sorbate, Citric Acid]', 'http://localhost:8080/TheStarBuck/template/web/image/products/55.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'ND', 'ND');
INSERT INTO `Product` VALUES ('pr0056', 'Iced Espresso', 'cs0001', 'Our smooth signature Espresso Roast over ice boasts rich, robust flavor and caramelly sweetness. A recipe of perfection at the heart of every handcrafted espresso we serve.', 7, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/56.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'ND', 'ND');
INSERT INTO `Product` VALUES ('pr0057', 'Iced Brown Sugar Oatmilk Shaken Espresso', 'cs0001', 'First we shake Starbucks® Blonde espresso, brown sugar and cinnamon together, and then top it off with oatmilk and ice for a cool lift to power you through your day.', 7, 0, 50, 1, 0, 0, 'Ice, Oatmilk [Oatmilk (Water, Oats), Low Erucic Acid Rapeseed Oil, Contains 2 Or Less Of Dipotassium Phosphate, Calcium Carbonate, Tricalcium Phosphate, Sea Salt, Dicalcium Phosphate, Riboflavin, Vitamin A, Vitamin D 2, Vitamin B 12], Brewed Espresso, Brown Sugar Syrup [Invert Sugar, Brown Sugar, Water, Natural Flavor, Salt, Preservative Potassium Sorbate], Cinnamon', 'http://localhost:8080/TheStarBuck/template/web/image/products/57.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'ND', 'ND');
INSERT INTO `Product` VALUES ('pr0058', 'Iced Chocolate Almondmilk Shaken Espresso', 'cs0001', 'Starbucks® Blonde espresso meets cocoa and notes of malt, shaken together and topped with almondmilk and ice for an invigorating treat to power you through your day.', 7, 0, 50, 1, 0, 0, 'Ice, Almondmilk [Filtered Water, Almonds, Sugar, Calcium Carbonate, Sunflower Lecithin, Sea Salt, Xanthan Gum, Guar Gum, Vitamin A Palmitate, Vitamin D 2 (Ergocalciferol)], Brewed Espresso, Chocolate Malt Powder [Cane Sugar, Cocoa Powder Processed With Alkali, Natural Malt Flavor (From Barley), Natural Flavors, Sunflower Oil]', 'http://localhost:8080/TheStarBuck/template/web/image/products/58.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'ND', 'ND');
INSERT INTO `Product` VALUES ('pr0059', 'Iced Shaken Espresso', 'cs0001', 'Made with the rich, full-bodied espresso you love—then shaken, chilled and mellowed with sweetness and a touch of milk to create a delightfully and deliciously convenient on-the- drink.', 7, 0, 50, 1, 0, 0, 'Ice, Milk, Brewed Espresso, Classic Syrup [Sugar, Water, Natural Flavors, Potassium Sorbate, Citric Acid]', 'http://localhost:8080/TheStarBuck/template/web/image/products/59.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'ND', 'ND');
INSERT INTO `Product` VALUES ('pr0060', 'Iced Flat White', 'cs0001', 'Smooth ristretto shots of espresso get the perfect amount of whole milk and ice to create a not-too-strong, not-too-creamy, just-right flavor.', 7, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/60.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'ND', 'ND');
INSERT INTO `Product` VALUES ('pr0061', 'Iced Honey Almondmilk Flat White', 'cs0001', 'This iced flat white—intentionally made with almondmilk and Starbucks Blonde® Espresso Roast poured over ice with a hint of honey—creates a perfect amount of cool, creamy, nutty sweetness.', 7, 0.7, 50, 1, 0, 0, 'Almondmilk [Filtered Water, Almonds, Sugar, Calcium Carbonate, Sunflower Lecithin, Sea Salt, Xanthan Gum, Guar Gum, Vitamin A Palmitate, Vitamin D 2 (Ergocalciferol)], Ice, Brewed Espresso, Honey Blend [Honey, Water, Natural Flavors, Potassium Sorbate, Xanthan Gum, Citric Acid].', 'http://localhost:8080/TheStarBuck/template/web/image/products/61.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Dao', 'Dao');
INSERT INTO `Product` VALUES ('pr0062', 'Iced Pumpkin Spice Latte', 'cs0001', 'Our signature espresso and milk—with the celebrated flavor combination of pumpkin, cinnamon, nutmeg and clove—served over ice. Enjoy it topped with whipped cream and real pumpkin-pie spices.', 10, 0.1, 50, 1, 0, 0, 'Milk, Ice, Pumpkin Spice Sauce [Sugar, Condensed Skim Milk, Pumpkin Puree, Contains 2 Or Less Of Fruit And Vegetable Juice For Color, Natural Flavors, Annatto, Salt, Potassium Sorbate], Brewed Espresso, Whipped Cream [Cream (Cream, Mono And Diglycerides, Carageenan), Vanilla Syrup (Sugar, Water, Natural Flavors, Potassium Sorbate, Citric Acid)], Pumpkin Spice Topping [Cinnamon, Ginger, Nutmeg, Clove, Sulfiting Agents].', 'http://localhost:8080/TheStarBuck/template/web/image/products/62.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Dao', 'Dao');
INSERT INTO `Product` VALUES ('pr0063', 'Iced Honey Oatmilk Latte', 'cs0001', 'Oatmilk and signature espresso are intentionally combined over ice with a hint of honey and a toasted honey Topping—a savory tribute to all things sweet and salty.', 7, 0.7, 50, 1, 0, 0, 'Oatmilk [Oatmilk (Water, Oats), Low Erucic Acid Rapeseed Oil, Contains 2 Or Less Of Dipotassium Phosphate, Calcium Carbonate, Tricalcium Phosphate, Sea Salt, Dicalcium Phosphate, Riboflavin, Vitamin A, Vitamin D 2, Vitamin B 12], Ice, Brewed Espresso, Honey Blend [Honey, Water, Natural Flavors, Potassium Sorbate, Xanthan Gum, Citric Acid], Toasted Honey Topping [Sugars (Sugar, Powdered Sugar, Honey), Fruit And Vegetable Colors (Apple, Carrot, Hibiscus, Pumpkin), Natural Flavor, Corn Starch].', 'http://localhost:8080/TheStarBuck/template/web/image/products/63.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Dao', 'Dao');
INSERT INTO `Product` VALUES ('pr0064', 'Starbucks Reserve® Iced Latte', 'cs0001', 'Small-lot Starbucks Reserve® espresso combined with milk and served over ice creates perfectly handcrafted sips of cool.', 7, 0.7, 50, 1, 0, 0, 'Not available for this item.', 'http://localhost:8080/TheStarBuck/template/web/image/products/64.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Dao', 'Dao');
INSERT INTO `Product` VALUES ('pr0065', 'Starbucks Reserve® Iced Hazelnut Bianco Latte', 'cs0001', 'House-made hazelnut-praline-infused milk combined with our small-lot Starbucks Reserve® espresso and served over ice—a true character of sweetly chilled nut love.', 7, 0.7, 50, 1, 0, 0, 'Not available for this item.', 'http://localhost:8080/TheStarBuck/template/web/image/products/65.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Dao', 'Dao');
INSERT INTO `Product` VALUES ('pr0066', 'Iced Caffè Latte', 'cs0001', 'Our dark, rich espresso combined with milk and served over ice. A perfect milk-forward cooldown.', 7, 0.7, 50, 1, 0, 0, 'Milk, Ice, Brewed Espresso.', 'http://localhost:8080/TheStarBuck/template/web/image/products/66.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Dao', 'Dao');
INSERT INTO `Product` VALUES ('pr0067', 'Iced Cinnamon Dolce Latte', 'cs0001', 'We add freshly steamed milk and cinnamon dolce-flavored syrup to our classic espresso and ice, topped with sweetened whipped cream and a cinnamon dolce Topping to bring you specialness in a treat.', 7, 0.7, 50, 1, 0, 0, 'Milk, Ice, Brewed Espresso, Cinnamon Dolce Syrup [Sugar, Water, Natural Flavor, Citric Acid, Potassium Sorbate], Whipped Cream [Cream (Cream, Mono And Diglycerides, Carageenan), Vanilla Syrup (Sugar, Water, Natural Flavors, Potassium Sorbate, Citric Acid)], Cinnamon Dolce Topping [Sugar, Cinnamon, Salt, Extractives Of Butter (Milk), And Other Natural Flavor].', 'http://localhost:8080/TheStarBuck/template/web/image/products/67.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Dao', 'Dao');
INSERT INTO `Product` VALUES ('pr0068', 'Iced Starbucks® Blonde Vanilla Latte', 'cs0001', 'Seriously smooth and subtly sweet Starbucks® Blonde Espresso, milk, ice and vanilla syrup come together to create a delightful twist on a beloved espresso classic.', 7, 0.7, 50, 1, 0, 0, 'Ice, Milk, Brewed Espresso, Vanilla Syrup [Sugar, Water, Natural Flavors, Potassium Sorbate, Citric Acid].', 'http://localhost:8080/TheStarBuck/template/web/image/products/68.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Dao', 'Dao');
INSERT INTO `Product` VALUES ('pr0069', 'Iced Apple Crisp Macchiato', 'cs0001', 'Layered flavors of apple and brown sugar meld like the filling of a gooey apple pie in harmony with espresso, milk, ice and a caramelized-spiced apple drizzle—a nostalgic autumn pick-me-up.', 7, 0.7, 50, 1, 0, 0, 'Milk, Ice, Brewed Espresso, Spiced Apple Drizzle [Sugars (Sugar, Brown Sugar), Water, Apple Juice Concentrate, Apple Puree, Ground Cinnamon, Pectin, Preservative Potassium Sorbate, Salt, Lemon Juice Concentrate, Sodium Citrate, Malic Acid, Caramelized Sugar (For Color And Flavor, Wheat), Xanthan Gum, Ground Nutmeg], Apple Brown Sugar Syrup [Invert Sugar, Water, Brown Sugar, Natural Flavors, Salt, Preservative Potassium Sorbate, Malic Acid].', 'http://localhost:8080/TheStarBuck/template/web/image/products/69.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Dao', 'Dao');
INSERT INTO `Product` VALUES ('pr0070', 'Iced Caramel Macchiato', 'cs0001', 'We combine our rich, full-bodied espresso with vanilla-flavored syrup, milk and ice, then top it off with a caramel drizzle for an oh-so-sweet finish.', 7, 0.7, 50, 1, 0, 0, 'Milk, Ice, Brewed Espresso, Vanilla Syrup [Sugar, Water, Natural Flavors, Potassium Sorbate, Citric Acid], Caramel Sauce [Sugar, Corn Syrup, Butter (Cream (Milk), Salt), Water, Heavy Cream, Nonfat Dry Milk, Natural Flavors, Salt, Mono Diglycerides, Soy Lecithin, Sulfites].', 'http://localhost:8080/TheStarBuck/template/web/image/products/70.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Dao', 'Dao');
INSERT INTO `Product` VALUES ('pr0071', 'Iced Caffè Mocha', 'cs0001', 'Our rich, full-bodied espresso combined with bittersweet mocha sauce, milk and ice, then topped with sweetened whipped cream. The classic iced coffee drink that always sweetly satisfies.', 10, 0.1, 50, 1, 0, 0, 'Ice, Milk, Mocha Sauce [Water, Sugar, Cocoa Processed With Alkali, Natural Flavor], Brewed Espresso, Whipped Cream [Cream (Cream, Mono And Diglycerides, Carageenan), Vanilla Syrup (Sugar, Water, Natural Flavors, Potassium Sorbate, Citric Acid)].', 'http://localhost:8080/TheStarBuck/template/web/image/products/71.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Dao', 'Dao');
INSERT INTO `Product` VALUES ('pr0072', 'Iced White Chocolate Mocha', 'cs0001', 'Our signature espresso meets white chocolate sauce, milk and ice, and then is finished off with sweetened whipped cream to create this supreme white chocolate delight.', 10, 0.1, 50, 1, 0, 0, 'Ice, Milk, White Chocolate Mocha Sauce [Sugar, Condensed Skim Milk, Coconut Oil, Cocoa Butter, Natural Flavor, Salt, Potassium Sorbate, Monoglycerides], Brewed Espresso, Whipped Cream [Cream (Cream, Mono And Diglycerides, Carageenan), Vanilla Syrup (Sugar, Water, Natural Flavors, Potassium Sorbate, Citric Acid)].', 'http://localhost:8080/TheStarBuck/template/web/image/products/72.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Dao', 'Dao');
INSERT INTO `Product` VALUES ('pr0073', 'Starbucks Reserve® Iced Dark Chocolate Mocha', 'cs0001', 'Our small-lot Starbucks Reserve® espresso—combined with cocoa and ground chocolate, then topped with cold milk and served over iced—makes a perfect mocha companion day or night.', 7, 0.7, 50, 1, 0, 0, 'Not available for this item.', 'http://localhost:8080/TheStarBuck/template/web/image/products/73.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Dao', 'Dao');
INSERT INTO `Product` VALUES ('pr0074', 'Iced Guava Black Tea', 'cs0001', 'Boldly flavored iced tea made with a combination of our guava-flavored fruit juice blend and Teavana® iced black tea, and hand-shaken with ice. A refreshing lift to any day.', 7, 0.7, 50, 1, 0, 0, 'Ice, An Infusion Of [Water, A Blend Of Black Teas], Guava Flavored Juice Blend [Water, White Grape Juice Concentrate, Natural Flavors, Guava Juice Concentrate, Colored With Fruit And Vegetable Juice (Pumpkin, Sweet Potato, Apple, Radish, Cherry), Citric Acid].', 'http://localhost:8080/TheStarBuck/template/web/image/products/74.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Dao', 'Dao');
INSERT INTO `Product` VALUES ('pr0075', 'Iced Guava Black Tea Lemonade', 'cs0001', 'Boldly flavored iced tea made with a combination of our guava-flavored fruit juice blend, Teavana® iced black tea and lemonade, and hand-shaken with ice. A refreshing lift to any day.', 7, 0.7, 50, 1, 0, 0, 'Ice, An Infusion Of [Water, A Blend Of Black Teas], Guava Flavored Juice Blend [Water, White Grape Juice Concentrate, Natural Flavors, Guava Juice Concentrate, Colored With Fruit And Vegetable Juice (Pumpkin, Sweet Potato, Apple, Radish, Cherry), Citric Acid], Lemonade [Water, Lemon Juice, Sugar, Lemon Oil].', 'http://localhost:8080/TheStarBuck/template/web/image/products/75.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Dao', 'Dao');
INSERT INTO `Product` VALUES ('pr0076', 'Iced Black Tea', 'cs0001', 'Premium black tea is shaken with ice. It\"s the ideal iced tea—a rich and flavorful black tea journey awaits you.', 7, 0.7, 50, 1, 0, 0, 'An Infusion Of [Water, A Blend Of Black Teas], Ice.', 'http://localhost:8080/TheStarBuck/template/web/image/products/76.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Dao', 'Dao');
INSERT INTO `Product` VALUES ('pr0077', 'Iced Black Tea Lemonade', 'cs0001', 'Premium black tea is shaken with refreshing lemonade and ice for this Arnold Palmer–inspired beverage. A distinguished satisfying treat.', 7, 0.7, 50, 1, 0, 0, 'Ice, Lemonade [Water, Lemon Juice, Sugar, Lemon Oil], An Infusion Of [Water, A Blend Of Black Teas].', 'http://localhost:8080/TheStarBuck/template/web/image/products/77.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Dao', 'Dao');
INSERT INTO `Product` VALUES ('pr0078', 'Iced Royal English Breakfast Tea Latte', 'cs0001', 'A select blend of rich, full-leaf black teas from India and Sri Lanka sweetened with liquid cane sugar and combined with milk and ice.', 7, 0.7, 50, 1, 0, 0, 'Not available for this item.', 'http://localhost:8080/TheStarBuck/template/web/image/products/78.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Dao', 'Dao');
INSERT INTO `Product` VALUES ('pr0079', 'Iced London Fog Tea Latte', 'cs0001', 'Bright, citrusy spark of bergamot blends with subtle hints of lavender and mixes with vanilla syrup, milk and ice to create this delicious reinvention of a classic Earl Grey tea.', 7, 0.7, 50, 1, 0, 0, 'Ice, Milk, An Infusion Of [Water, Black Tea, Bergamot Essence, Lavender Flowers], Vanilla Syrup [Sugar, Water, Natural Flavors, Potassium Sorbate, Citric Acid].', 'http://localhost:8080/TheStarBuck/template/web/image/products/79.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Dao', 'Dao');
INSERT INTO `Product` VALUES ('pr0080', 'Iced Chai Tea Latte', 'cs0001', 'Black tea infused with cinnamon, clove, and other warming spices are combined with milk and ice for the perfect balance of sweet and spicy.', 7, 0.7, 50, 1, 0, 0, 'Milk, Ice, Chai Tea Concentrate [An Infusion Of (Water, Black Tea, Cardamom, Black Pepper, Ginger, Cinnamon, Cloves, Natural Flavours, Star Anise), Sugar, Honey, Ginger Juice, Natural Flavours, Vanilla, Citric Acid].', 'http://localhost:8080/TheStarBuck/template/web/image/products/80.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Dao', 'Dao');
INSERT INTO `Product` VALUES ('pr0081', 'Iced Peach Green Tea', 'cs0001', 'This boldly flavored iced tea—made with a combination of our peach-flavored fruit juice blend and Teavana® iced green tea, and hand-shaken with ice—brings you refreshing vibes.', 7, 0.7, 50, 1, 0, 0, 'Ice, An Infusion Of [Water, A Blend Of Green Teas, Spearmint, Lemon Verbena, Lemongrass, Natural Flavor], Peach Flavored Juice Blend [Water, White Grape Juice Concentrate, Citric Acid, Natural Flavors, Fruit And Vegetable Juice For Color (Pumpkin, Sweet Potato, Apple, Radish, Cherry), Rebaudioside A].', 'http://localhost:8080/TheStarBuck/template/web/image/products/81.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Dao', 'Dao');
INSERT INTO `Product` VALUES ('pr0082', 'Iced Peach Green Tea Lemonade', 'cs0001', 'This boldly refreshing iced tea is made with a combination of our peach-flavored fruit juice blend, Teavana® iced green tea and lemonade, and hand-shaken with ice.', 7, 0.7, 50, 1, 0, 0, 'Ice, An Infusion Of [Water, A Blend Of Green Teas, Spearmint, Lemon Verbena, Lemongrass, Natural Flavor], Peach Flavored Juice Blend [Water, White Grape Juice Concentrate, Citric Acid, Natural Flavors, Fruit And Vegetable Juice For Color (Pumpkin, Sweet Potato, Apple, Radish, Cherry), Rebaudioside A], Lemonade [Water, Lemon Juice, Sugar, Lemon Oil].', 'http://localhost:8080/TheStarBuck/template/web/image/products/82.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Dao', 'Dao');
INSERT INTO `Product` VALUES ('pr0083', 'Iced Matcha Tea Latte', 'cs0001', 'Smooth and creamy matcha sweetened just right and served with milk over ice. Green has never tasted so good.', 7, 0.7, 50, 1, 0, 0, 'Milk, Ice, Matcha Tea Blend [Sugar, Ground Green Tea].', 'http://localhost:8080/TheStarBuck/template/web/image/products/83.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Dao', 'Dao');
INSERT INTO `Product` VALUES ('pr0084', 'Iced Green Tea', 'cs0001', 'Green tea blended with mint, lemongrass and lemon verbena, then given a good shake with ice. Lightly flavored and oh-so-refreshing!', 7, 0.7, 50, 1, 0, 0, 'An Infusion Of [Water, A Blend Of Green Teas, Spearmint, Lemon Verbena, Lemongrass, Natural Flavour], Ice.', 'http://localhost:8080/TheStarBuck/template/web/image/products/84.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Dao', 'Dao');
INSERT INTO `Product` VALUES ('pr0085', 'Iced Green Tea Lemonade', 'cs0001', 'Green tea blended with mint, lemongrass, lemon verbena and lemonade, then given a good shake with ice. Lightly flavored and oh-so-refreshing!', 7, 0.7, 50, 1, 0, 0, 'Ice, Lemonade [Water, Lemon Juice, Sugar, Lemon Oil], An Infusion Of [Water, A Blend Of Green Teas, Spearmint, Lemon Verbena, Lemongrass And Natural Flavour].', 'http://localhost:8080/TheStarBuck/template/web/image/products/85.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Dao', 'Dao');
INSERT INTO `Product` VALUES ('pr0086', 'Iced Matcha Lemonade', 'cs0001', 'Our finely ground Teavana® matcha green tea combined with crisp lemonade, then shaken with ice, creates a refreshingly sweet, delicious drink and a delightfully vibrant, green hue.', 7, 0.7, 50, 1, 0, 0, 'Ice, Lemonade [Water, Lemon Juice, Sugar, Lemon Oil], Matcha Tea Blend [Sugar, Ground Green Tea].', 'http://localhost:8080/TheStarBuck/template/web/image/products/86.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Dao', 'Dao');
INSERT INTO `Product` VALUES ('pr0087', 'Iced Passion Tango™ Tea', 'cs0001', 'A blend of hibiscus, lemongrass and apple, handshaken with ice. A refreshingly vibrant tea infused with the color of passion.', 7, 0.7, 50, 1, 0, 0, 'An Infusion Of [Water, Hibiscus Flowers, Citric Acid, Natural Flavors, Cinnamon, Apple, Licorice Root, Lemongrass, Fruit Juice Extract], Ice.', 'http://localhost:8080/TheStarBuck/template/web/image/products/87.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Dao', 'Dao');
INSERT INTO `Product` VALUES ('pr0088', 'Iced Passion Tango® Tea Lemonade', 'cs0001', 'Our blend of hibiscus, lemongrass and apple, handshaken with ice, lemonade and, of course, passion.', 7, 0.7, 50, 1, 0, 0, 'Ice, Lemonade [Water, Lemon Juice, Sugar, Lemon Oil], An Infusion Of [Water, Hibiscus Flowers, Citric Acid, Natural Flavors, Cinnamon, Apple, Licorice Root, Lemongrass, Fruit Juice Extract].', 'http://localhost:8080/TheStarBuck/template/web/image/products/88.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Dao', 'Dao');
INSERT INTO `Product` VALUES ('pr0089', 'Emperor’s Clouds & Mist®', 'cs0002', 'This gently smoky, softly sweet green tea—cultivated at 3,500 feet and shrouded in ethereal clouds and mist—is tasty no matter what language you say it in.', 6, 0.6, 50, 1, 0, 0, 'An Infusion Of [Water, Green Tea].', 'http://localhost:8080/TheStarBuck/template/web/image/products/89.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Dao', 'Dao');
INSERT INTO `Product` VALUES ('pr0090', 'Matcha Tea Latte', 'cs0002', 'Smooth and creamy matcha sweetened just right and served with steamed milk. This favorite will transport your senses to pure green delight.', 6, 0.6, 50, 1, 0, 0, 'Milk, Matcha Tea Blend [Sugar, Ground Green Tea].', 'http://localhost:8080/TheStarBuck/template/web/image/products/90.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Dao', 'Dao');
INSERT INTO `Product` VALUES ('pr0091', 'Honey Citrus Mint Tea', 'cs0002', 'A customer creation so popular it’s now on the menu. Jade Citrus Mint® green tea, Peach Tranquility® herbal tea, hot water, steamed lemonade and a touch of honey mingle tastefully well together for a tea that comforts from the inside out.', 6, 1, 50, 1, 0, 0, 'Lemonade [Water, Lemon Juice, Sugar, Lemon Oil], An Infusion Of [Water, Organic Green Tea, Organic Spearmint, Organic Lemon Verbena, Organic Lemongrass, Natural Flavor], An Infusion Of [Water, Apple Pieces, Candied Pineapple Pieces (Pineapple, Sugar, Citric Acid), Rose Hip Peels, Peach Pieces (Peach, Rice Flour), Peach Pieces, Chamomile Flowers, Lemon Verbena, Artificial Flavoring], Honey Blend [Honey, Water, Natural Flavors, Potassium Sorbate, Xanthan Gum, Citric Acid]', 'http://localhost:8080/TheStarBuck/template/web/image/products/91.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Nhu', 'Nhu');
INSERT INTO `Product` VALUES ('pr0092', 'Jade Citrus Mint® Brewed Tea', 'cs0002', 'Green tea, lemon verbena, lemongrass and a hint of spearmint mingle for a bright, refreshing, citrusy green tea experience.', 6, 0, 50, 1, 0, 0, 'An Infusion Of [Water, Organic Green Tea, Organic Spearmint, Organic Lemon Verbena, Organic Lemongrass, Natural Flavor]', 'http://localhost:8080/TheStarBuck/template/web/image/products/92.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Nhu', 'Nhu');
INSERT INTO `Product` VALUES ('pr0093', 'Mint Majesty®', 'cs0002', 'A blend of mint and a pinch of lemon verbena creates a refreshing flavor that s supercool for a caffeine-free herbal tea', 6, 0, 50, 1, 0, 0, 'An Infusion Of [Water, Spearmint Leaves, Peppermint Leaves, Lemon Verbena]', 'http://localhost:8080/TheStarBuck/template/web/image/products/93.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Nhu', 'Nhu');
INSERT INTO `Product` VALUES ('pr0094', 'White Hot Chocolate', 'cs0002', 'A traditional hot chocolate beverage made with white chocolate sauce and steamed milk, topped with whipped cream.', 9, 0, 50, 1, 0, 0, 'Milk, White Chocolate Mocha Sauce [Sugar, Condensed Skim Milk, Coconut Oil, Cocoa Butter, Natural Flavor, Salt, Potassium Sorbate, Monoglycerides], Whipped Cream [Cream (Cream, Mono And Diglycerides, Carageenan), Vanilla Syrup (Sugar, Water, Natural Flavors, Potassium Sorbate, Citric Acid)]', 'http://localhost:8080/TheStarBuck/template/web/image/products/94.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Nhu', 'Nhu');
INSERT INTO `Product` VALUES ('pr0095', 'Caramel Apple Spice', 'cs0002', 'Steamed apple juice complemented with cinnamon syrup, whipped cream and a caramel sauce drizzle.', 9, 0, 50, 1, 0, 0, 'Apple Juice, Cinnamon Dolce Syrup [Sugar, Water, Natural Flavor, Citric Acid, Potassium Sorbate], Whipped Cream [Cream (Cream, Mono And Diglycerides, Carageenan), Vanilla Syrup (Sugar, Water, Natural Flavors, Potassium Sorbate, Citric Acid)], Caramel Sauce [Sugar, Corn Syrup, Butter (Cream (Milk), Salt), Water, Heavy Cream, Nonfat Dry Milk, Natural Flavors, Salt, Mono Diglycerides, Soy Lecithin, Sulfites]', 'http://localhost:8080/TheStarBuck/template/web/image/products/95.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Nhu', 'Nhu');
INSERT INTO `Product` VALUES ('pr0096', 'Caramel Apple Spice', 'cs0002', 'Steamed apple juice complemented with cinnamon syrup, whipped cream and a caramel sauce drizzle.', 9, 0, 50, 1, 0, 0, 'Apple Juice, Cinnamon Dolce Syrup [Sugar, Water, Natural Flavor, Citric Acid, Potassium Sorbate], Whipped Cream [Cream (Cream, Mono And Diglycerides, Carageenan), Vanilla Syrup (Sugar, Water, Natural Flavors, Potassium Sorbate, Citric Acid)], Caramel Sauce [Sugar, Corn Syrup, Butter (Cream (Milk), Salt), Water, Heavy Cream, Nonfat Dry Milk, Natural Flavors, Salt, Mono Diglycerides, Soy Lecithin, Sulfites]', 'http://localhost:8080/TheStarBuck/template/web/image/products/96.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Nhu', 'Nhu');
INSERT INTO `Product` VALUES ('pr0097', 'Pumpkin Spice Crème', 'cs0002', 'We combine steamed milk with flavors of pumpkin, cinnamon, nutmeg and clove, then top it all off with whipped cream to create this amazing, coffee-free fall favorite.', 9, 0, 50, 1, 0, 0, 'Milk, Pumpkin Spice Sauce [Sugar, Condensed Skim Milk, Pumpkin Puree, Contains 2 Or Less Of Fruit And Vegetable Juice For Color, Natural Flavors, Annatto, Salt, Potassium Sorbate], Whipped Cream [Cream (Cream, Mono And Diglycerides, Carageenan), Vanilla Syrup (Sugar, Water, Natural Flavors, Potassium Sorbate, Citric Acid)], Pumpkin Spice Topping [Cinnamon, Ginger, Nutmeg, Clove, Sulfiting Agents]', 'http://localhost:8080/TheStarBuck/template/web/image/products/97.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Nhu', 'Nhu');
INSERT INTO `Product` VALUES ('pr0098', 'Steamed Milk', 'cs0002', 'Enjoy a warm cup of skim, 2%, soy, almond or coconutmilk steamed for your sipping pleasure.', 6, 0, 50, 1, 0, 0, 'Milk', 'http://localhost:8080/TheStarBuck/template/web/image/products/98.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Nhu', 'Nhu');
INSERT INTO `Product` VALUES ('pr0099', 'Vanilla Crème', 'cs0002', 'A smooth, frothy vanilla-flavored luxury. For those times, when you d rather not indulge in the rich flavor of our world-famous espresso, but desire a hot, creamy vanilla beverage.', 9, 0, 50, 1, 0, 0, 'Milk, Vanilla Syrup [Sugar, Water, Natural Flavors, Potassium Sorbate, Citric Acid], Whipped Cream [Cream (Cream, Mono And Diglycerides, Carageenan), Vanilla Syrup (Sugar, Water, Natural Flavors, Potassium Sorbate, Citric Acid)]', 'http://localhost:8080/TheStarBuck/template/web/image/products/99.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Nhu', 'Nhu');
INSERT INTO `Product` VALUES ('pr0100', 'Starbucks Reserve® Dark Chocolate Mocha', 'cs0002', 'Our small-lot Starbucks Reserve® espresso combined with cocoa, ground chocolate and topped with steamed milk delivers a brilliant combination of sweetness.', 10, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/100.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Nhu', 'Nhu');
INSERT INTO `Product` VALUES ('pr0101', 'Spinach, Feta & Egg White Wrap', 'cs0002', 'We bring together cage-free egg whites, spinach, feta cheese and tomatoes inside a whole-wheat wrap, then toast it to perfection. Vegetarian and protein-rich, this wrap is bound to be a tasty start to any morning.', 10, 0, 50, 1, 0, 0, 'Wrap [Water, Whole Wheat Flour, Enriched Wheat Flour (Wheat Flour, Malted Barley Flour, Niacin, Reduced Iron, Thiamin Mononitrate, Riboflavin, Folic Acid), Wrap Base (Wheat Gluten, Corn Starch, Oat Fiber, Soy Protein Isolate, Soybean Oil, Defatted Soy Flour, Sesame Flour, 2 Or Less Of Whole Wheat Flour, Dextrose), Wheat Gluten, Canola Oil, Sugar, Mold Inhibitor (Cultured Wheat Flour, Vinegar), Honey, Salt, Yeast, Ascorbic Acid, Enzymes], Egg White Omelet [Cage Free Egg Whites, Whey Powder, Corn ', 'http://localhost:8080/TheStarBuck/template/web/image/products/101.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Nhu', 'Nhu');
INSERT INTO `Product` VALUES ('pr0102', 'Roasted Ham, Swiss & Egg Sandwich', 'cs0002', 'Take hickory-smoked ham and nutty, melty Swiss cheese layered on a flaky, buttery croissant, and you’ve got the perfect wakeup call.', 15, 0, 50, 1, 0, 0, 'Croissant Roll [Enriched Wheat Flour (Wheat Flour, Niacin, Reduced Iron, Thiamin Mononitrate, Riboflavin, Folic Acid), Water, Butter (Cream), Sugar, Yeast, Salt, Eggs, Malted Barley Flour, Dough Conditioner (Wheat Gluten, Xanthan Gum, Ascorbic Acid, Enzymes)], Fried Egg Patty [Egg Whites, Egg Yolks, Milk, Food Starch Modified, Salt, Citric Acid], Uncured Ham [Pork, Water, Salt, Sugar, Celery Powder, Sea Salt, Cherry Powder, Cane Sugar], Swiss Cheese [Pasteurized Part Skim Milk, Cheese Culture, S', 'http://localhost:8080/TheStarBuck/template/web/image/products/102.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Nhu', 'Nhu');
INSERT INTO `Product` VALUES ('pr0103', 'Kale & Portabella Mushroom Sous Vide Egg Bites', 'cs0002', 'Delicious chopped kale and portabella mushrooms delicately folded into cage-free eggs with Monterey Jack and cooked using the French sous vide technique to create a velvety textur..', 15, 0, 50, 1, 0, 0, 'Cottage Cheese [Cultured Nonfat Milk, Milk, Nonfat Milk,..', 'http://localhost:8080/TheStarBuck/template/web/image/products/103.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Nhu', 'Nhu');
INSERT INTO `Product` VALUES ('pr0104', 'Bacon & Gruyère Sous Vide Egg Bites', 'cs0002', 'A foodie delight, even when you re on the . We ve taken cage-free eggs and prepared them using the French elicious, high-protein, convenient breakfast...', 12, 0, 50, 1, 0, 0, 'Cottage Cheese [Cultured Nonfat Milk, Milk, Nonfat Milk, Contains 2 Or Less Of Whey, Salt, Maltodextrin, Citric Acid, Carrageenan, Mono And Diglycerides, Locust Bean Gum, Guar Gum, Natural Flavors, Vitamin A Palmitate, Carbon Dioxide (To Maintain Freshness), Enzymes], Eggs [Eggs, Citric Acid, Water], Cheese Blend [Monterey Jack Cheese (Pasteurized Milk, Cheese Culture, Salt, Enzymes), Gruyere Cheese (Pasteurized Milk, Cheese Culture, Salt, Enzymes), Potato Starch, Powdered Cellulose, Natamycin (', 'http://localhost:8080/TheStarBuck/template/web/image/products/104.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Nhu', 'Nhu');
INSERT INTO `Product` VALUES ('pr0105', 'Egg White & Roasted Red Pepper Sous Vide Egg Bites', 'cs0002', 'Perfectly cooked cage-free egg whites prepared using the French \"sous vide\" technique result in a velvety texture bursting with flavor...', 12, 0, 50, 1, 0, 0, 'Egg Whites, Cottage Cheese [Cultured Nonfat Milk, Milk, Nonfat Milk, Contains 2 Or Less Of Whey, Salt, Maltodextrin, Citric Acid, Carrageenan, Mono And Diglycerides, Locust Bean Gum, Guar Gum, Natural Flavors, Vitamin A Palmitate, Carbon Dioxide (To Maintain Freshness), Enzymes], Monterey Jack Cheese [Pasteurized Milk, Cheese Culture, Salt, Enzymes, Potato Starch, Powdered Cellulose, Natamycin (A Natural Mold Inhibitor)], Red Bell Pepper, Rice Starch, Unsalted Butter [Pasteurized Cream, Natural ', 'http://localhost:8080/TheStarBuck/template/web/image/products/105.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Nhu', 'Nhu');
INSERT INTO `Product` VALUES ('pr0106', 'Cheese, Onion & Garlic Bagel', 'cs0003', 'Perfectly cooked cage-free egg whites prepared using the French \"sous vide\" technique result in a velvety texture bursting with flavor. ...', 12, 0, 50, 1, 0, 0, 'Egg Whites, Cottage Cheese [Cultured Nonfat Milk, Milk, Nonfat Milk, Contains 2 Or Less Of Whey, Salt, Maltodextrin, Citric Acid, Carrageenan, Mono And Diglycerides, Locust Bean Gum, Guar Gum, Natural Flavors, Vitamin A Palmitate, Carbon Dioxide (To Maintain Freshness), Enzymes], Monterey Jack Cheese [Pasteurized Milk, Cheese Culture, Salt, Enzymes, Potato Starch, Powdered Cellulose, Natamycin (A Natural Mold Inhibitor)], Red Bell Pepper, Rice Starch, Unsalted Butter [Pasteurized Cream, Natural ', 'http://localhost:8080/TheStarBuck/template/web/image/products/106.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Nhu', 'Nhu');
INSERT INTO `Product` VALUES ('pr0107', 'Marshmallow Dream Bar', 'cs0003', 'This crispy, chewy marshmallow bar, made of ooey-gooey, soft marshmallows, crispy rice, creates a sweet treat that’ll make you snack like a kid again.', 12, 0, 50, 1, 0, 0, 'Marshmallows [Corn Syrup, Sugar, Modified Corn Starch, Dextrose, Water, Gelatin, Natural Vanilla Flavor, Tetrasodium Pyrophosphate], Crisp Rice [Rice, Brown Sugar, Salt, Distilled Monoglycerides], Corn Syrup, Salted Butter [Cream (Milk), Salt], Sugar, Sea Salt, Maltodextrin, Vanilla Extract', 'http://localhost:8080/TheStarBuck/template/web/image/products/107.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Nhu', 'Nhu');
INSERT INTO `Product` VALUES ('pr0108', 'Double Chocolate Brownie', 'cs0003', 'A classic brownie made with premium chocolate and cocoa.', 12, 0, 50, 1, 0, 0, 'Sugar, Enriched Flour [Wheat Flour, Enzyme, Ascorbic Acid, Niacin, Reduced Iron, Thiamine Mononitrate, Riboflavin, Folic Acid], Eggs, Canola Oil, Milk Chocolate [Sugar, Cocoa Butter, Belgian Unsweetened Chocolate, Whole Milk Powder, Nonfat Dry Milk, Milk Fat, Soy Lecithin (As An Emulsifier), Vanilla Extract], Semi Sweet Chocolate [Unsweetened Chocolate, Sugar, Soy Lecithin], Semi Sweet Chocolate Chunks [Sugar, Chocolate Liquor, Cocoa Butter, Anhydrous Dextrose, Soy Lecithin (As An Emulsifier), V', 'http://localhost:8080/TheStarBuck/template/web/image/products/108.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Nhu', 'Nhu');
INSERT INTO `Product` VALUES ('pr0109', 'Pumpkin Cream Cheese Muffin', 'cs0003', 'This moist perfectly spiced pumpkin muffin—topped with sweet cream cheese filling and a sprinkling of chopped, spiced pepitas—offers a delightful balance of salty and sweet.', 12, 0, 50, 1, 0, 0, 'Sugar, Enriched Wheat Flour [Wheat Flour, Niacin, Reduced Iron, Thiamine Mononitrate, Riboflavin, Folic Acid], Cream Cheese Filling [Cream Cheese (Cream, Evaporated Skim Milk, Salt, Guar Gum, Propylene Glycol Alginate, Carrageenan, Locust Bean Gum, Bacterial Culture), Water, Sugar, Modified Corn Starch, Natural Vanilla Flavor, Lactic Acid, Xanthan Gum, Salt, Sodium Citrate, Locust Bean Gum, Carrageenan], Pumpkin, Eggs, Soybean And Or Canola Oil, Praline Pumpkin Seeds [Sugar, Pumpkin Seeds, Spice', 'http://localhost:8080/TheStarBuck/template/web/image/products/109.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Nhu', 'Nhu');
INSERT INTO `Product` VALUES ('pr0110', 'Pumpkin Scone', 'cs0003', 'A spiced pumpkin scone topped with sweet icing.', 12, 0, 50, 1, 0, 0, 'White Icing [Sugar, Water, Corn Syrup, Palm Oil, Contains 2 Or Less Of The Following Mono And Diglycerides, Polysorbate 60, Agar, Locust Bean Gum, Salt, Potassium Sorbate (Preservative), Citric Acid, Natural Fruit Vegetable Juice (Color)], Enriched Flour [Wheat Flour, Niacin, Iron, Thiamin Mononitrate, Riboflavin, Folic Acid], Pumpkin, Sugar, Butter, Enriched Flour [Wheat Flour, Malted Barley Flour, Niacin, Iron, Thiamin Mononitrate, Riboflavin, Folic Acid], Dry Cream Powder [Cream, Nonfat Milk ', 'http://localhost:8080/TheStarBuck/template/web/image/products/110.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Nhu', 'Nhu');
INSERT INTO `Product` VALUES ('pr0111', 'Taro Smoothy', 'cs0001', 'Taro flavor will touch your feeling and let you taste  natural delicious taro. Perfect drink for free time with friend.', 15, 0, 50, 1, 0, 0, 'Taro, Sugar, Milk, Whipped Cream [Cream (Cream, Mono And Diglycerides, Carageenan), Taro Syrup [Sugar, Water, Natural Flavors, Potassium Sorbate, Citric Acid], Iced, Marshmallows [Corn Syrup, Sugar, Modified Corn Starch, Dextrose, Water, Gelatin, Natural Vanilla Flavor, Tetrasodium Pyrophosphate],  Vanilla Sweet Cream [Cream (Cream, Mono And Diglycerides, Carageenan).', 'http://localhost:8080/TheStarBuck/template/web/image/products/111.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Nhu', 'Nhu');
INSERT INTO `Product` VALUES ('pr0112', 'Matcha Smoothy', 'cs0001', 'This smoothy make you feel matcha flavor like you re in matcha paradise. Sweet bitterness of matcha with fattiness of milk bring you a different sense. ', 15, 0, 50, 1, 0, 0, 'Matcha Power, Sugar, Milk[Chocolate], Whipped Cream [Cream (Cream, Mono And Diglycerides, Carageenan), Matcha Syrup [Sugar, Water, Natural Flavors, Potassium Sorbate, Citric Acid], Iced, Marshmallows [Sugar, Modified Corn Starch, Dextrose, Water, Gelatin, Natural Vanilla Flavor, Tetrasodium Pyrophosphate],  Vanilla Sweet Cream [Cream (Cream, Mono And Diglycerides, Carageenan).', 'http://localhost:8080/TheStarBuck/template/web/image/products/112.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Nhu', 'Nhu');
INSERT INTO `Product` VALUES ('pr0113', 'Crispy Grilled Cheese Sandwich', 'cs0001', 'A delicious blend of white Cheddar and mozzarella cheeses on sourdough bread, topped with a Parmesan butter spread.', 13, 0, 50, 1, 0, 0, 'Sourdough Bistro Bread [Enriched Wheat Flour (Wheat Flour, Niacin, Reduced Iron, Thiamine Mononitrate, Riboflavin, Folic Acid), Water, Whole Wheat Flour, Whole Grain Rye Flour, Salt, Cultured Wheat Starch, Malted Barley Flour, Yeast, Microbial Enzymes], Garlic Cheese Butter Blend [Cheddar Cheese (Pasteurized Milk, Microbial Cheese Culture, Salt, Microbial Enzymes), Butter (Pasteurized Cream, Salt), Parmesan Cheese (Pasteurized Milk, Salt, Microbial Cheese Culture, Microbial Enzymes), Low Moistur', 'http://localhost:8080/TheStarBuck/template/web/image/products/113.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Nhu', 'Nhu');
INSERT INTO `Product` VALUES ('pr0114', 'Crispy Grilled Cheese Sandwich', 'cs0001', 'A delicious blend of white Cheddar and mozzarella cheeses on sourdough bread, topped with a Parmesan butter spread.', 13, 0, 50, 1, 0, 0, 'Sourdough Bistro Bread [Enriched Wheat Flour (Wheat Flour, Niacin, Reduced Iron, Thiamine Mononitrate, Riboflavin, Folic Acid), Water, Whole Wheat Flour, Whole Grain Rye Flour, Salt, Cultured Wheat Starch, Malted Barley Flour, Yeast, Microbial Enzymes], Garlic Cheese Butter Blend [Cheddar Cheese (Pasteurized Milk, Microbial Cheese Culture, Salt, Microbial Enzymes), Butter (Pasteurized Cream, Salt), Parmesan Cheese (Pasteurized Milk, Salt, Microbial Cheese Culture, Microbial Enzymes), Low Moistur', 'http://localhost:8080/TheStarBuck/template/web/image/products/114.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Nhu', 'Nhu');
INSERT INTO `Product` VALUES ('pr0115', 'Ham & Swiss Panini', 'cs0003', 'Ham and Swiss cheese meld with Dijon butter in comforting warmth. An extraordinary feel-good taste.', 13, 0, 50, 1, 0, 0, 'Baguette [Unbleached Enriched Wheat Flour (Wheat Flour, Malted Barley Flour, Niacin, Iron, Thiamine Mononitrate, Riboflavin, Folic Acid), Water, Salt, Yeast], Uncured Ham [Ham, Water, Salt, Sugar, Vinegar, Celery Powder, Sea Salt, Cherry Powder], Swiss Cheese [Pasteurized Part Skim Milk, Cheese Culture, Salt, Enzymes], Dijon Mustard Butter Spread [Unsalted Butter (Cream (Milk), Natural Flavor (Lactic Acid)), Canola Oil, Dijon Mustard (Water, Mustard Seed, Vinegar, Salt, Citric Acid)]', 'http://localhost:8080/TheStarBuck/template/web/image/products/115.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Nhu', 'Nhu');
INSERT INTO `Product` VALUES ('pr0116', 'Turkey & Pesto Panini', 'cs0003', 'Thick-sliced turkey and melted provolone cheese stacked on a ciabatta roll, then topped with our signature basil pesto and dry-roasted red peppers. ', 13, 0, 50, 1, 0, 0, 'Ciabatta Roll [Enriched Flour (Wheat Flour, Malted Barley Flour, Niacin, Reduced Iron, Thiamine Mononitrate, Riboflavin, Folic Acid), Water, Extra Virgin Olive Oil, Sour Culture, Semolina, Yeast, Salt, Sea Salt, Acacia Gum], Turkey Breast [Turkey Breast, Water, Salt, Turbinado Sugar, Vegetable Oil (Soybean, Cottonseed And Or Peanut Oil)], Aged Provolone Cheese [Milk, Salt, Enzymes], Basil Pesto [Basil, Canola Oil, Parmesan Cheese (Milk, Cheese Culture, Salt And Enzymes), Garlic Puree (Water, Gra', 'http://localhost:8080/TheStarBuck/template/web/image/products/116.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Nhu', 'Nhu');
INSERT INTO `Product` VALUES ('pr0117', 'Chicken Caprese Panini', 'cs0003', 'Stacked with craveable ingredients, including slow-cooked chicken, mozzarella, balsamic-marinated tomatoes, basil pesto and spinach, all nestled between soft ciabatta bread. ', 13, 0, 50, 1, 0, 0, 'Ciabatta Roll [Enriched Flour (Wheat Flour, Malted Barley Flour, Niacin, Reduced Iron, Thiamine Mononitrate, Riboflavin, Folic Acid), Water, Extra Virgin Olive Oil, Sour Culture, Semolina, Yeast, Salt, Sea Salt, Acacia Gum], White Meat Chicken Slices Raised Without Antibiotics [White Meat Chicken, Water, Seasoning (Dehydrated Garlic, Dehydrated Onion, Spices, Sugar, Paprika), Salt, Vinegar, Potato Starch, Seasoning (Chicken Broth Powder, Chicken Powder, Onion Powder, Natural Flavor), Dextrose, S', 'http://localhost:8080/TheStarBuck/template/web/image/products/117.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Nhu', 'Nhu');
INSERT INTO `Product` VALUES ('pr0118', 'Chicken & Bacon Panini', 'cs0003', 'Herbed chicken is slow-cooked and piled high on toasted apple brioche, topped with our double-smoked bacon and maple mustard. ', 13, 0, 50, 1, 0, 0, 'Apple Brioche Roll [Enriched Wheat Flour (Flour, Niacin, Reduced Iron, Thiamine Mononitrate, Riboflavin, Folic Acid), Water, Sunflower Oil, Eggs, Dried Apples, Butter, Cane Sugar, Apple Butter (Apples, Apple Cider, Cinnamon), Salt, Yeast, Cultured Wheat Starch, Malted Barley Flour, Amylase], White Meat Chicken Slices Raised Without Antibiotics [White Meat Chicken, Water, Seasoning (Dehydrated Garlic, Dehydrated Onion, Spices, Sugar, Paprika), Salt, Vinegar, Potato Starch, Seasoning (Chicken Brot', 'http://localhost:8080/TheStarBuck/template/web/image/products/118.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Nhu', 'Nhu');
INSERT INTO `Product` VALUES ('pr0119', 'Tomato & Mozzarella Panini', 'cs0003', 'Roasted tomatoes, mozzarella, spinach and basil pesto layered on a toasted focaccia—a satisfyingly delicious delight.', 13, 0, 50, 1, 0, 0, 'Focaccia Roll [Enriched Flour (Wheat Flour, Malted Barley Flour, Niacin, Reduced Iron, Thiamine Mononitrate, Riboflavin, Folic Acid), Water, Sour Culture, Extra Virgin Olive Oil, Yeast, Salt, Semolina, Cultured Wheat Starch, Whole Wheat Flour, Ascorbic Acid (Dough Conditioner), Enzymes], Mozzarella Cheese [Pasteurized Part Skim Milk, Cheese Culture, Salt, Enzymes], Roasted Tomatoes [Tomatoes, Canola Oil, Garlic, Vinegar, Salt, Spices], Basil Pesto [Basil, Canola Oil, Parmesan Cheese (Milk, Chees', 'http://localhost:8080/TheStarBuck/template/web/image/products/119.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Nhu', 'Nhu');
INSERT INTO `Product` VALUES ('pr0120', 'Eggs & Gouda Protein Box', 'cs0003', 'Two cage-free hard-boiled eggs paired with Gouda and multigrain crackers, plus a blend of dried apricots and apples,..', 13, 0, 50, 1, 0, 0, 'Hard Cooked Eggs [Eggs, Citric Acid], Gouda Cheese [Pasteurized Milk, Cheese Culture, Salt, Enzymes, Annatto], Dried Apricots [Dried Apricots, Sulfur Dioxide], Multigrain Crackers [Unbleached Enriched Wheat Flour (Wheat Flour, Ascorbic Acid (Dough Conditioner), Niacin, Ferrous Sulphate, Thiamin Mononitrate, Riboflavin, Folic Acid), Whole Wheat Flour, Multigrain Mix (Cracked Wheat, Cracked Rye, Crushed Flax Seeds, Millet Meal, Cracked Triticale, Barley Grits, Sunflower Seeds, Rolled Oats, Durum S', 'http://localhost:8080/TheStarBuck/template/web/image/products/120.png', NULL, NULL, NULL, NULL, '2021-12-18 00:00:00.000000', '2021-12-18 00:00:00.000000', 'Nhu', 'Nhu');
INSERT INTO `Product` VALUES ('pr0121', 'Cheese Trio Protein Box', 'cs0003', 'Brie, Gouda and aged sharp Cheddar cheese make up the trio in the box—all paired with olive oil and sea-salt crackers, plus a blend of soft, chewy dried apricots and cranberries, for a perfectly balanced pick-me-up to enjoy any time of day.', 20, 0, 50, 1, 0, 0, 'Dried Apricots [Dried Apricots, Sulphur Dioxide], Sharp Cheddar Cheese [Pasteurized Milk, Cheese Culture, Salt, Enzymes, Annatto], Brie Cheese [Pasteurized Cultured Milk And Cream, Salt, Cheese Cultures, Enzymes, Calcium Chloride, Penicillium Candidum], Gouda Cheese [Pasteurized Milk, Cheese Culture, Salt, Enzymes, Annatto], Olive Oil Sea Salt Crackers [Enriched Unbleached Flour (Wheat Flour, Niacin, Reduced Iron, Thiamin Mononitrate, Riboflavin, Folic Acid, Malted Barley Flour), Buttermilk (Cul', 'http://localhost:8080/TheStarBuck/template/web/image/products/121.png', NULL, NULL, NULL, NULL, '2021-01-10 00:00:00.000000', '2021-01-10 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0122', 'Cheddar & Uncured Salami Protein Box', 'cs0003', 'Chock-full of fuel for your day—our charcuterie-inspired, protein-packed box with robust, flavorful salami, aged sharp Cheddar, white Cheddar, olive oil and sea-salt crackers, and a sweet and savory dried fruit and nut mix.', 20, 0, 50, 1, 0, 0, 'Sharp Cheddar [Pasteurized Milk, Cheese Culture, Salt, Enzymes, Annatto (Vegetable Color)], Dried Fruit And Nut Mix [Dried Cranberries (Cranberries, Sugar, Sunflower Oil), Roasted Salted Almonds, Walnut Pieces, Dry Roasted Salted Pepitas], Olive Oil Sea Salt Crackers [Enriched Unbleached Flour (Wheat Flour, Niacin, Reduced Iron, Thiamin Mononitrate, Riboflavin, Folic Acid, Malted Barley Flour), Buttermilk (Cultured Lowfat Milk, Salt, Sodium Citrate), Expeller Pressed Canola Oil, Cane Sugar, Extr', 'http://localhost:8080/TheStarBuck/template/web/image/products/122.png', NULL, NULL, NULL, NULL, '2021-01-11 00:00:00.000000', '2021-01-11 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0123', 'Chickpea Bites & Avocado Protein Box', 'cs0003', 'A fully plant-based portable box—with 15 g protein—delivers chickpea bites, snap peas, mini carrots, dried cranberry and nut mix, and avocado spread for a perfect on-the- moment.', 20, 0, 50, 1, 0, 0, 'Chickpea Bites [Chickpeas, Water, High Oleic Sunflower Oil, Breadcrumbs (Whole Grain Wheat Flour, Distilled Vinegar, Malted Barley Flour, Yeast, Sea Salt, Leavening (Sodium Bicarbonate), Spice Extractive), Chickpea Flour, Contains 2 Or Less Of Rice Starch, Yellow Corn Flour, Salt, Spices, Sugar, Guar Gum, Vinegar, Onion Powder, Garlic Powder, Corn Starch, Dehydrated Parsley, Toasted Sesame Oil, Maltodextrin, Cultured Dextrose, Natural Flavors, Citric Acid, Corn Syrup Solids, Extra Virgin Olive O', 'http://localhost:8080/TheStarBuck/template/web/image/products/123.png', NULL, NULL, NULL, NULL, '2021-01-12 00:00:00.000000', '2021-01-12 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0124', 'Grilled Chicken and Hummus Protein Box', 'cs0003', 'Tender and juicy sous vide grilled chicken breast paired with roasted red pepper hummus and naan bread, accompanied with baby carrots and snap peas—a whole lot of protein to get you through your day.', 20, 0, 50, 1, 0, 0, 'Grilled Sous Vide Chicken Breast [Chicken Breast, Water, Dried Vinegar Powder, Salt, Soybean Oil, Flavoring (Yeast Extract, Citrus Extract), Brown Sugar, Dehydrated Chicken Broth, Black Pepper, Garlic Juice], Red Pepper Hummus [Cooked Chickpeas (Chickpeas, Water), Canola Oil, Roasted Red Bell Pepper, Tahini (Ground Sesame), Water, Dried Roasted Garlic, Sea Salt, Citric Acid, Dried Onion, Spice, Salt], Carrots, Naan [Enriched Wheat Flour (Wheat Flour, Niacin, Reduced Iron, Ascorbic Acid (Dough Co', 'http://localhost:8080/TheStarBuck/template/web/image/products/124.png', NULL, NULL, NULL, NULL, '2021-01-13 00:00:00.000000', '2021-01-13 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0125', 'Eggs & Cheddar Protein Box', 'cs0003', 'Two cage-free hardboiled eggs, sliced tart apples, grapes and white Cheddar cheese come together with multigrain muesli bread and honey peanut butter in this protein-packed lover\'s dream.', 20, 0, 50, 1, 0, 0, 'Hard Cooked Eggs, Apples [Apples, Calcium Ascorbate (Added To Maintain Freshness And Color)], Grapes, Multigrain Muesli Bread [Enriched (Wheat Flour, Ascorbic Acid (Dough Conditioner), Niacin, Ferrous Sulphate, Thiamine Mononitrate, Riboflavin, Folic Acid), Filtered Water, Raisins (Raisins, Sunflower Oil), Organic Cane Sugar, Flax Seeds, Multigrain Mix (Cracked Wheat, Cracked Rye, Crushed Flax Seeds, Millet Meal, Cracked Triticale, Barley Grits, Sunflower Seeds, Rolled Oats, Durum Semolina), Sun', 'http://localhost:8080/TheStarBuck/template/web/image/products/125.png', NULL, NULL, NULL, NULL, '2021-01-14 00:00:00.000000', '2021-01-14 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0126', 'PB&J Protein Box', 'cs0003', 'Natural peanut butter spread on our soft, honey wheat bread and served with a side of string cheese, chocolate-covered raisins, apples, carrots and Greek yogurt ranch dip—a yummy twist on a classic, peanut-y favorite.', 20, 0, 50, 1, 0, 0, 'Peanut Butter And Jam Sandwich [Harvest Wheat Bread (Water, Enriched Flour (Wheat Flour, Malted Barley Flour, Niacin, Reduced Iron, Thiamine Mononitrate, Riboflavin, Folic Acid), Cracked Wheat, Whole Wheat Flour, Sugar, Fully Refined Soybean Oil, Yeast, Dried Wheat Sourdough, Wheat Flour, Natural Flavor, 2 Or Less Of Canola Oil, Enzymes, Salt, Wheat Gluten, Dough Improver (Malted Wheat Flour, Enzymes, Ascorbic Acid)), Peanut Butter (Peanuts, Salt), Strawberry Jam (Sugar, Strawberries, Lemon Juic', 'http://localhost:8080/TheStarBuck/template/web/image/products/126.png', NULL, NULL, NULL, NULL, '2021-01-15 00:00:00.000000', '2021-01-15 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0127', 'Cheese & Fruit Protein Box', 'cs0003', 'Brie, Gouda, aged Cheddar cheeses, olive oil crackers, apples and grapes make this the perfectly balanced box to enjoy any time of day.', 20, 0, 50, 1, 0, 0, 'Apples [Apples, Calcium Ascorbate (Added To Maintain Freshness And Color)], Grapes, Sharp Cheddar Cheese [Pasteurized Milk, Cheese Culture, Salt, Enzymes, Annatto], Brie Cheese [Pasteurized Cows Milk, Cheese Cultures, Salt, Enzymes], Olive Oil Sea Salt Crackers [Enriched Unbleached Flour (Wheat Flour, Niacin, Reduced Iron, Thiamin Mononitrate, Riboflavin, Folic Acid, Malted Barley Flour), Buttermilk (Cultured Lowfat Milk, Sodium Citrate, Salt, Vitamin A Palmitate, Vitamin D 3), Expeller Pressed ', 'http://localhost:8080/TheStarBuck/template/web/image/products/126.png', NULL, NULL, NULL, NULL, '2021-01-16 00:00:00.000000', '2021-01-16 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0128', 'Chicken & Quinoa Protein Bowl with Black Beans and Greens', 'cs0003', 'Grilled chicken tossed with a medium-spiced chile vinaigrette for a lively but not over-the-top kick and mixed with fresh greens, tomatoes, roasted corn, black beans, jicama, paprika and cotija..', 18, 0, 50, 1, 0, 0, 'White Meat Chicken Raised Without Antibiotics [White Meat Chicken, Water, Salt, Potato Starch, Onion And Garlic Powder, Spice], Spring Mix [Chard, Spinach, Tatsoi, Leaf Lettuce, Lolla Rossa, Romaine, Radicchio, Red Oak], Quinoa Blend [Water, Quinoa (White, Red)], Mild Chile Vinaigrette [Tomato Puree (Water, Tomato Paste), Pomace Olive Oil, Honey, Red And Ancho Chile Puree (Red Bell Pepper, Water, Dehydrated Red Chile Peppers, Dehydrated Ancho Chile Pepper, Lemon Juice Concentrate), Roasted Red B', 'http://localhost:8080/TheStarBuck/template/web/image/products/128.png', NULL, NULL, NULL, NULL, '2021-01-17 00:00:00.000000', '2021-01-17 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0129', 'Dipped Madeleines', 'cs0003', 'Rich, buttery and moist with lightly crisped edges to create a delicious and soft madeleine dipped in chocolaty coating.', 10, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/129.png', NULL, NULL, NULL, NULL, '2021-01-18 00:00:00.000000', '2021-01-18 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0130', 'Madeleines', 'cs0003', 'Made with quality ingredients, these rich and buttery French cakes are soft and moist in the center and baked with lightly crisped edges.', 10, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/130.png', NULL, NULL, NULL, NULL, '2021-01-19 00:00:00.000000', '2021-01-19 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0131', 'Vanilla Biscotti with Almonds', 'cs0003', 'These crispy, delicious vanilla cookies topped with crunchy almonds are love at first bite. Perfect for dipping into your favorite coffee or espresso beverage.', 10, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/131.png', NULL, NULL, NULL, NULL, '2021-01-20 00:00:00.000000', '2021-01-20 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0132', 'Shortbread Cookies', 'cs0003', 'Our two-pack of butter shortbread cookies made with quality ingredients create a melt-in-your-mouth texture in every bite.', 10, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/132.png', NULL, NULL, NULL, NULL, '2021-01-21 00:00:00.000000', '2021-01-21 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0133', 'Dark Chocolate Grahams (2-Pack)', 'cs0003', 'Two crunchy graham cookies covered with dark chocolate and topped with a milk chocolate drizzle. The perfect snack to complement your favorite latte or coffee drink.', 10, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/133.png', NULL, NULL, NULL, NULL, '2021-01-22 00:00:00.000000', '2021-01-22 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0134', 'Rip van Wafels – Honey & Oats', 'cs0003', 'A blend of vanilla, honey and oats come together to create a uniquely textured cookie—crispy and chewy goodness.', 10, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/134.png', NULL, NULL, NULL, NULL, '2021-01-23 00:00:00.000000', '2021-01-23 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0135', 'Salted Almond Chocolate Bites', 'cs0003', 'Triple chocolate-covered almonds with gray sea salt: a flavorful nutty-salty experience.', 10, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/135.png', NULL, NULL, NULL, NULL, '2021-01-24 00:00:00.000000', '2021-01-24 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0136', 'Chocolate Covered Espresso Beans', 'cs0003', 'Our espresso coffee beans (the finest and most sought-out in the world) get even better when drenched in a layer of luscious dark chocolate.', 10, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/136.png', NULL, NULL, NULL, NULL, '2021-01-25 00:00:00.000000', '2021-01-25 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0137', 'Justin’s® Dark Chocolate Peanut Butter Cups', 'cs0003', 'What happens when the best-tasting peanut butter in the world is delicately placed into the highest-quality, dark chocolate available? Peanut-butter cup perfection.', 10, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/137.png', NULL, NULL, NULL, NULL, '2021-01-26 00:00:00.000000', '2021-01-26 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0138', 'Seasonal Fruit Blend', 'cs0003', 'A delicious medley of seasonal fruit. Full of color, nutrients, ripeness and wholesome sweet goodness.', 11, 0, 50, 1, 0, 0, 'Pineapple, Mango, Strawberries, Blueberries', 'http://localhost:8080/TheStarBuck/template/web/image/products/138.png', NULL, NULL, NULL, NULL, '2021-01-27 00:00:00.000000', '2021-01-27 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0139', 'Squirrel Brand® Fruit & Nut', 'cs0003', 'Premium cashews and pure California almonds loaded with juicy cranberries and mouthwatering blueberries. Ah, such a delightful blend of sweet and savory.', 9, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/139.png', NULL, NULL, NULL, NULL, '2021-01-28 00:00:00.000000', '2021-01-28 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0140', 'Squirrel Brand® – Classic Almonds', 'cs0003', 'Pure California almonds are kettle-cooked, then finished with a hint of salt. A classic taste of wholesomeness.', 9, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/140.png', NULL, NULL, NULL, NULL, '2021-01-29 00:00:00.000000', '2021-01-29 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0141', 'Peter Rabbit™ Organics Apple & Grape', 'cs0004', 'These convenient, squeezable, resealable pouches contain USDA organic puree with grape juice concentrate and a hint of lemon. Perfect for busy moms on the .', 7, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/141.png', NULL, NULL, NULL, NULL, '2021-01-30 00:00:00.000000', '2021-01-30 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0142', 'Peter Rabbit™ Organics Strawberry Banana', 'cs0004', 'These convenient, squeezable, resealable pouches contain USDA organic banana-strawberry puree with a hint of lemon juice. Perfect for busy moms on the .', 7, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/142.png', NULL, NULL, NULL, NULL, '2021-01-31 00:00:00.000000', '2021-01-31 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0143', 'Peppermint Gum', 'cs0003', 'This frosted, sugar-free chewing gum is powerful yet cooling, giving you the ultimate refresh after enjoying a coffee or dessert.', 12, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/143.png', NULL, NULL, NULL, NULL, '2021-02-01 00:00:00.000000', '2021-02-01 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0144', 'Starbucks® BBQ Potato Chips', 'cs0003', 'Thick-cut kettle potato chips coated with tangy barbecue flavor—a smoky-sweet treat for your crunchy snack craving.', 9, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/144.png', NULL, NULL, NULL, NULL, '2021-02-02 00:00:00.000000', '2021-02-02 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0145', 'Butter Gourmet Popcorn', 'cs0003', 'Perfectly buttery with just the right amount of salt, this fluffy snack favorite makes movie theaters everywhere jealous.', 9, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/145.png', NULL, NULL, NULL, NULL, '2021-02-03 00:00:00.000000', '2021-02-03 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0146', 'Hippeas® – White Cheddar', 'cs0003', 'Crunchy, savory, organic chickpea-based snack puffs with white Cheddar flavor celebrate a new way or snacking—only 100 calories per bag.', 9, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/146.png', NULL, NULL, NULL, NULL, '2021-02-04 00:00:00.000000', '2021-02-04 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0147', 'Kettle Corn', 'cs0003', 'An irresistible blend of salty and sweet, and a crunch that always satisfies at snack time—oh-so-delcious kettle popcorn straight out of the bag and into your mouth.', 9, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/147.png', NULL, NULL, NULL, NULL, '2021-02-05 00:00:00.000000', '2021-02-05 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0148', 'POP! - Sunflower Oil & Sea Salt', 'cs0003', 'Crisp and delicate savory white popcorn is with sunflower oil and sprinkled with sea salt. Snacking doesn’t get much more enjoyable than this.', 9, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/148.png', NULL, NULL, NULL, NULL, '2021-02-06 00:00:00.000000', '2021-02-06 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0149', 'Salt & Vinegar Kettle Potato Chips', 'cs0003', 'With the perfect sprinkling of vinegar and salt, these chips add a flavorful crunch to any afternoon—a wave of pure delight.', 9, 0, 50, 1, 0, 0, 'Ingredients Potatoes, Corn Oil And Or Cottonseed Oil And Or Sunflower Oil, Maltodextrin, Salt, Sodium Diacetate, Sugar, Citric Acid, Malic Acid, Sodium Citrate', 'http://localhost:8080/TheStarBuck/template/web/image/products/149.png', NULL, NULL, NULL, NULL, '2021-02-07 00:00:00.000000', '2021-02-07 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0150', 'Simply Salted Kettle Potato Chips', 'cs0003', 'Kettle potato chips perfectly salted for a naturally delicious anytime snack—an undeniable flavorful crunch.', 9, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/150.png', NULL, NULL, NULL, NULL, '2021-02-08 00:00:00.000000', '2021-02-08 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0151', 'Sweet Potato Kettle Potato Chips', 'cs0003', 'With the perfect amount of salt, these sweet potato chips add a crispy, flavorful crunch to any afternoon—a surprising blast of salty-sweet.', 9, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/151.png', NULL, NULL, NULL, NULL, '2021-02-09 00:00:00.000000', '2021-02-09 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0152', 'Country Archer – Hickory Smoked Turkey Jerkey', 'cs0003', 'This small-batch, handcrafted turkey jerkey: hickory-smoked and prepared the way it was always intended, with slices of real turkey breast, true smoke flavor and no nonsense.', 9, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/152.png', NULL, NULL, NULL, NULL, '2021-02-10 00:00:00.000000', '2021-02-10 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0153', 'Country Archer Original Beef Jerky', 'cs0003', 'This artisan jerky unfolds with layers of incredible flavor including soy sauce, brown sugar, garlic and pineapple juice.', 20, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/153.png', NULL, NULL, NULL, NULL, '2021-02-11 00:00:00.000000', '2021-02-11 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0154', 'Moon Cheese™ – Cheddar', 'cs0003', 'Made with American Cheddar cheese to deliver a crunchy, cheesy, flavor explosion. A great snack anytime, anywhere.', 9, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/154.png', NULL, NULL, NULL, NULL, '2021-02-12 00:00:00.000000', '2021-02-12 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0155', 'String Cheese', 'cs0003', 'As a mess-free car snack or a quick add-on to round out their lunch box—this string cheese is always a fan favorite. Made with low-moisture part-skim mozzarella cheese.', 9, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/155.png', NULL, NULL, NULL, NULL, '2021-02-13 00:00:00.000000', '2021-02-13 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0156', 'Perfect Bar® – Dark Chocolate Chip Peanut Butter', 'cs0003', 'The original peanut butter bar receives an upgrade with a sprinkle of Fair Trade dark chocolate chips and a pinch of sea salt. Plus, protein-packed with 20 organic superfoods, this guilt-free -to bar satisfies any salty-sweet craving.', 9, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/156.png', NULL, NULL, NULL, NULL, '2021-02-14 00:00:00.000000', '2021-02-14 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0157', 'Perfect Bar® Peanut Butter', 'cs0003', 'One bite and you\'ll taste why this recipe is indeed \'perfect.\' Made with ground organic peanut butter and honey, and packed with organic superfoods, this bar is gluten-free, soy-free and truly tasty.', 9, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/157.png', NULL, NULL, NULL, NULL, '2021-02-15 00:00:00.000000', '2021-02-15 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0158', 'Good Squared - Urban Trail', 'cs0003', 'Each crunchy bite is filled with California-made goodness including roasted almonds, pecans, pumpkin seeds, dried cinnamon apples and puffed quinoa. These squared treats are great for outdoor time, Post-exercise time or getting-kids-breakfast-in-a-hurry t', 11, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/158.png', NULL, NULL, NULL, NULL, '2021-02-16 00:00:00.000000', '2021-02-16 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0159', 'KIND - Almond Coconut Cashew Chai', 'cs0003', 'A sweet & nutty blend of toasted coconut, almonds and cashews is combined with exotically spiced chai for a rich and delicious snack you’ll savor from beginning to end.', 9, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/159.png', NULL, NULL, NULL, NULL, '2021-02-17 00:00:00.000000', '2021-02-17 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0160', 'KIND® Blueberry Vanilla & Cashew Bar', 'cs0003', 'A chewy blend of blueberries and cashews, combined with the sweet taste of vanilla. It\'s goodness on the .', 9, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/160.png', NULL, NULL, NULL, NULL, '2021-02-18 00:00:00.000000', '2021-02-18 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0161', 'KIND® Peanut Butter Dark Chocolate Bar', 'cs0003', 'A satisfying blend of peanuts and cocoa bound together in honey. This snack bar delights from the first bite till the last.', 9, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/161.png', NULL, NULL, NULL, NULL, '2021-02-19 00:00:00.000000', '2021-02-19 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0162', 'That\'s It® – Apple + Blueberry Bar', 'cs0003', 'Fruit bars made from only two ingredients: apples and blueberries. Seriously, that\'s it!', 9, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/162.png', NULL, NULL, NULL, NULL, '2021-02-20 00:00:00.000000', '2021-02-20 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0163', 'This Bar Saves Lives™ – Dark Chocolate Cherry & Sea Salt Bar', 'cs0003', 'Packed with crunchy almonds, tart cherries and cranberries, then drizzled with antioxidant-rich dark chocolate. It\'s gluten free, kosher, made with Rainforest Alliance-certified cocoa and just plain awesome. For every bar sold, This Bar Saves Lives™ will ', 9, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/163.png', NULL, NULL, NULL, NULL, '2021-02-21 00:00:00.000000', '2021-02-21 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0164', 'This Bar Saves Lives™ – Dark Chocolate Peanut Butter & Sea Salt Bar', 'cs0003', 'A decadent blend of chocolate, crunchy almonds, creamy peanut butter and a dash of sea salt make this a tasty bar. Making it even more amazing is that it\'s gluten free, Non-GMO Project Verified, kosher, and for every bar sold, a packet of life-saving food', 9, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/164.png', NULL, NULL, NULL, NULL, '2021-02-22 00:00:00.000000', '2021-02-22 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0165', 'This Bar Saves Lives™ Madagascar Vanilla Almond & Honey Bar', 'cs0003', 'Crunchy almonds and mega-3 rich flax seeds wrapped in a dash of vanilla and honey. This delicious bar is just plain awesome. Plus, for every bar sold, This Bar Saves Lives™ will give a packet of lifesaving food to a child in need.', 9, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/165.png', NULL, NULL, NULL, NULL, '2021-02-23 00:00:00.000000', '2021-02-23 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0166', 'Blueberry & Oatmeal Jammy Sammy', 'cs0003', 'These bars from Plum Organics star sweet blueberry filling layered between a crust of oats, whole wheat and ancient grains, and are a perfect kids snack.', 9, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/166.png', NULL, NULL, NULL, NULL, '2021-02-24 00:00:00.000000', '2021-02-24 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0167', 'This Bar Saves Lives™ – Wild Blueberry Pistachio Bar', 'cs0003', 'A delicious and healthy blend of nuts, seeds and antioxidant-rich blueberries. It\'s non-GMO, gluten free, kosher and just plain awesome. For every bar sold, This Bar Saves Lives™ will give a packet of life-saving food to a child in need, in different area', 9, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/167.png', NULL, NULL, NULL, NULL, '2021-02-25 00:00:00.000000', '2021-02-25 00:00:00.000000', 'NONE', 'NONE');
INSERT INTO `Product` VALUES ('pr0168', 'Chocolate Chip Kids Clif ZBar®', 'cs0003', 'Busy kids (and parents) love this organic, whole grain bar that provides that great chocolate chip taste but without the high fructose corn syrup or artificial flavors.', 9, 0, 50, 1, 0, 0, 'Not available for this item', 'http://localhost:8080/TheStarBuck/template/web/image/products/168.png', NULL, NULL, NULL, NULL, '2021-02-26 00:00:00.000000', '2021-02-26 00:00:00.000000', 'NONE', 'NONE');

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `Orders` VALUES ('od0001', 'ac0001', 'section001', 'Nguyễn Lê Thành','0931182677',null,'token001', 'NEW', NULL, 220, 0.1, 0.01, 2, 202.2, 'none', NULL, '2021-12-18', '2021-12-18', 'thanhdev', 'thanhdev');
INSERT INTO `Orders` VALUES ('od0002', 'ac0002', 'section002', 'Nguyễn Lê Thành','0931182677',null,'token002', 'COMPLETE', NULL, 438, 0, 0.01, 5, 447.38, 'none', NULL, '2021-12-18', '2021-12-18', 'thanhdev', 'thanhdev');
INSERT INTO `Orders` VALUES ('od0003', 'ac0003', 'section003','Nguyễn Lê Thành','0931182677',null, 'token003', 'COMPLETE', NULL, 10000, 0.01, 0.01, 5, 10005, 'none', NULL, '2021-12-18', '2021-12-18', 'thanhdev', 'thanhdev');
INSERT INTO `Orders` VALUES ('od0004', 'ac0004', 'section004','Nguyễn Lê Thành','0931182677',null, 'token004', 'FAILED', NULL, 5100, 0, 0.01, 5, 5156, 'none', NULL, '2021-12-18', '2021-12-18', 'thanhdev', 'thanhdev');

-- ----------------------------
-- Records of OrderItem
-- ----------------------------
INSERT INTO `OrderItem` VALUES ( 'pr0121', 'od0001',  2, NULL, '2021-12-18', '2021-12-18', 'thanhdev', 'thanhdev');
INSERT INTO `OrderItem` VALUES ( 'pr0122', 'od0001',   3, NULL, '2021-12-18', '2021-12-18', 'thanhdev', 'thanhdev');
INSERT INTO `OrderItem` VALUES ( 'pr0123', 'od0001',  4, NULL, '2021-12-18', '2021-12-18', 'thanhdev', 'thanhdev');
INSERT INTO `OrderItem` VALUES ('pr0124', 'od0001', 2, NULL, '2021-12-18', '2021-12-18', 'thanhdev', 'thanhdev');
INSERT INTO `OrderItem` VALUES ( 'pr0125', 'od0002',  5, NULL, '2021-12-18', '2021-12-18', 'thanhdev', 'thanhdev');
INSERT INTO `OrderItem` VALUES ( 'pr0126', 'od0002',   7, NULL, '2021-12-18', '2021-12-18', 'thanhdev', 'thanhdev');
INSERT INTO `OrderItem` VALUES ('pr0127', 'od0002', 9, NULL, '2021-12-18', '2021-12-18', 'thanhdev', 'thanhdev');
INSERT INTO `OrderItem` VALUES ( 'pr0128', 'od0002', 1, NULL, '2021-12-18', '2021-12-18', 'thanhdev', 'thanhdev');
INSERT INTO `OrderItem` VALUES ('pr0129', 'od0003', 1000, NULL, '2021-12-18', '2021-12-18', 'thanhdev', 'thanhdev');
INSERT INTO `OrderItem` VALUES ( 'pr0130', 'od0004', 500, NULL, '2021-12-18', '2021-12-18', 'thanhdev', 'thanhdev');
INSERT INTO `OrderItem` VALUES ( 'pr0131', 'od0004',  10, NULL, '2021-12-18', '2021-12-18', 'thanhdev', 'thanhdev');

--  Contact
INSERT INTO `Contact` VALUES('co0001', 'ac0001',null,'19130011@st.hcmuaf.edu.vn','111111111','hello',1,'2022-09-12','2023-09-12','Dao','Dao');
INSERT INTO `Contact` VALUES( 'co0002', 'ac0001',null,'19130011@st.hcmuaf.edu.vn','111111111','hello',1,'2022-09-12','2023-09-12','Dao','Dao');
INSERT INTO `Contact` VALUES( 'co0003', 'ac0002',null,'19130206@st.hcmuaf.edu.vn','1111111','hello',1,'2022-09-12','2023-09-12','Dao','Dao');
INSERT INTO `Contact` VALUES( 'co0004', 'ac0002',null,'19130206@st.hcmuaf.edu.vn','1111111','hello',1,'2022-09-12','2023-09-12','Dao','Dao');
INSERT INTO `Contact` VALUES( 'co0005', 'ac0002',null,'19130206@st.hcmuaf.edu.vn','1111111','hello',1,'2022-09-12','2023-09-12','Dao','Dao');


-- Category
INSERT INTO `Category` VALUES ('cs0001', 'Cool drink', null, null, 1, '2022-09-12', '2022-09-12', 'KA', 'KA');
INSERT INTO `Category` VALUES ('cs0002', 'Hot drink', null, null, 1, '2022-09-12', '2022-09-12', 'KA', 'KA');
INSERT INTO `Category` VALUES ('cs0003', 'Bakery', null, null, 1, '2022-09-12', '2022-09-12', 'KA', 'KA');
INSERT INTO `Category` VALUES ('cs0004', 'Bottled water', null, null, 1, '2022-09-12', '2022-09-12', 'KA', 'KA');

-- Slide
INSERT INTO `Slide` VALUES ('sl0001', 'https://i.ibb.co/M8jxQyG/banner-mini-1.png', 'MINI', NULL, NULL, NULL, '1', '2022-01-05 23:25:35.000', '2021-12-31 23:25:38.000', 'Nhu', 'Nhu');
INSERT INTO `Slide` VALUES ('sl0002', 'https://i.ibb.co/Nms68wt/banner-mini-2.png', 'MINI', NULL, NULL, NULL, '1', '2021-10-25 23:32:53.000', '2021-11-29 23:31:29.000', 'Nhu', 'Nhu');
INSERT INTO `Slide` VALUES ('sl0003', 'https://i.ibb.co/0GZxQj0/banner-mini-3.png', 'MINI', NULL, NULL, NULL, '1', '2021-11-29 23:32:38.000', '2021-11-29 23:32:45.000', 'Nhu', 'nhu');
INSERT INTO `Slide` VALUES ('sl0004', 'https://i.ibb.co/fS7SPHp/banner-mini-4.png', 'MINI', NULL, NULL, NULL, '1', '2021-10-25 23:34:00.000', '2021-11-29 23:34:11.000', 'Nhu', 'Nhu');
INSERT INTO `Slide` VALUES ('sl0005', 'https://i.ibb.co/6PMh170/banner-mini-5.png', 'MINI', NULL, NULL, NULL, '1', '2021-11-29 23:36:03.000', '2021-11-29 23:36:07.000', 'Nhu', 'Nhu');
INSERT INTO `Slide` VALUES ('sl0006', 'https://i.ibb.co/vHkpc5T/banner-2.png', 'BANNER', 'CELEBRATE TO X-MAS', NULL, 'Come celebrate the season with our merry holiday drinks: Peppermint Mocha, Caramel Brulée Latte and Toasted White Chocolate Mocha. Cheers!', '1', '2022-01-04', '2022-01-04 22:26:35.000', 'Nhu', 'Nhu');
INSERT INTO `Slide` VALUES ('sl0007', 'https://i.ibb.co/L0myK85/title1.png', 'TITLE', 'It s not just Coffee', 'Starbucks', 'Let s check it out!', '0', '2022-01-03 22:27:49.000', '2022-01-18 22:27:53.000', 'Nhu', 'Nhu');
INSERT INTO `Slide` VALUES ('sl0008', 'https://i.ibb.co/LP8dSrR/title2.png', 'TITLE', 'It s not just Coffee', 'Starbucks', 'Let s check it out!', '0', '2022-01-04 22:28:46.000', '2022-01-04 22:28:49.000', 'Nhu', 'Nhu');
INSERT INTO `Slide` VALUES ('sl0009', 'https://i.ibb.co/jGdks8G/title3.png', 'TITLE', 'It s not just Coffee', 'Starbucks', 'Let s check it out!', '0', '2022-01-18 22:29:48.000', '2022-01-04 22:29:52.000', 'nhu', 'nhu');
INSERT INTO `Slide` VALUES ('sl0010', 'http://localhost:8080/TheStarBuck/template/web/image/thumb1.png', 'THUMB', NULL, NULL, NULL, '1', '2021-11-29 23:32:38.000', '2021-11-29 23:32:45.000', 'Nhu', 'nhu');
INSERT INTO `Slide` VALUES ('sl0011', 'http://localhost:8080/TheStarBuck/template/web/image/thumb2.png', 'THUMB', NULL, NULL, NULL, '1', '2021-10-25 23:34:00.000', '2021-11-29 23:34:11.000', 'Nhu', 'Nhu');
INSERT INTO `Slide` VALUES ('sl0012', 'http://localhost:8080/TheStarBuck/template/web/image/thumb3.png', 'THUMB', NULL, NULL, NULL, '1', '2021-11-29 23:36:03.000', '2021-11-29 23:36:07.000', 'Nhu', 'Nhu');
INSERT INTO `Slide` VALUES ('sl0013', 'http://localhost:8080/TheStarBuck/template/web/image/img1.png', 'THUMB_BIG', NULL, NULL, NULL, '1', '2021-11-29 23:32:38.000', '2021-11-29 23:32:45.000', 'Nhu', 'nhu');
INSERT INTO `Slide` VALUES ('sl0014', 'http://localhost:8080/TheStarBuck/template/web/image/img2.png', 'THUMB_BIG', NULL, NULL, NULL, '1', '2021-10-25 23:34:00.000', '2021-11-29 23:34:11.000', 'Nhu', 'Nhu');
INSERT INTO `Slide` VALUES ('sl0015', 'http://localhost:8080/TheStarBuck/template/web/image/img3.png', 'THUMB_BIG', NULL, NULL, NULL, '1', '2021-11-29 23:36:03.000', '2021-11-29 23:36:07.000', 'Nhu', 'Nhu');

INSERT INTO`Topping` VALUES ('tp0001', 'Black Bubble', '1', '50', '2021-01-10 00:00:00.000', '2021-01-10 00:00:00.000', 'KA', 'KA');
INSERT INTO `Topping` VALUES ('tp0002', 'White Bubble', '1', '50', '2021-01-10 00:00:00.000', '2021-01-10 00:00:00.000', 'KA', 'KA');
INSERT INTO `Topping` VALUES ('tp0003', 'Yarns Bubble', '1', '50', '2021-01-10 00:00:00.000', '2021-01-10 00:00:00.000', 'KA', 'KA');
INSERT INTO `Topping` VALUES ('tp0004', 'Cheese Jelly', '1', '50', '2021-01-10 00:00:00.000', '2021-01-10 00:00:00.000', 'KA', 'KA');

INSERT INTO Post VALUES ('po0001','It\'s not drink, It\'s feeling','There are many chains of coffee shops around the world, but Starbucks remains the most famous one.',' <p> There are many chains of coffee shops around the world, but Starbucks remains the most famous one. The
                company was founded in 1971 by three young men, Jerry Baldwin, Zev Siegl and Gordon Bowker. At the time
                they were all recently out of college and working at a Seattle coffee roastery called Starbucks. The
                name
                is taken from Herman Melville\'s first novel “Moby Dick”, where it symbolizes "a great white whale". </p>
              <p>Starbucks is a popular coffee shop in the United States. It has many branches and is also popular
                worldwide. Starbucks serves a variety of hot and cold drinks, pastries, and food items. It has been
                around for over four decades! In 2009, Starbucks had overseas revenue of $4.8 billion from its 12,592
                locations in 37 countries outside the U.S., making it the largest coffeehouse company in the world. <br>
                With success, We want to grow it up online to serve our guess order the Products easily. To make an
                important mark, we’re going to introduce some new Products in speacial events like: Halloween, Chrismas,
                New Year, Lunar New Year,… <br>
                One of the new Products is Halloween Feeling.
              </p>
              <div class="img_blog_shop">
                <img src="/TheStarBuck/template/web/image/img_blog_pro1.jpg" alt="" srcset="">
                <p>Halloween Feeling</p>
              </div>
              <p>This one is a great Product. Because you can taste different of spices by mixing a little bit of sour,
                a little bit of spice and can’t be without sweet like “Trick or treat” game. In this Halloween,
                Halloween Feeling’ll be shown. Let’s waiting for it. <br>
                To celebrate for Chrismas, we can’t forget appearance of Strawberry Sweety X.
              </p>
              <div class="img_blog_shop">
                <img src="/TheStarBuck/template/web/image/img_blog_pro2.jpg" alt="" srcset="">
                <p>Strawberry Sweety X</p>
              </div>
              <p>You always think strawberry should be sour and sweet, but into this drink we’ll make it better and you
                guys can feel warmer when drink, even though Strawberry Sweety X belong to cool Category. This X-mas,
                your sence is not alone anymore. <br>
                Not only introducing our newaccount Products, but also we’ll have a lot of gifts when ordering online and our
                coffee shop’ll discount lots of Products. You and we getting the special things together.<br>
                Thank you for reading this blog. Have a nice day!

              </p>','Minh Nhu','/TheStarBuck/template/web/image/img_bolg_shop.jpg','','2021-01-10');
