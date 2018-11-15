-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema sls_raw
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `sls_raw` ;

-- -----------------------------------------------------
-- Schema sls_raw
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sls_raw` DEFAULT CHARACTER SET latin1 ;
USE `sls_raw` ;

-- -----------------------------------------------------
-- Table `sls_raw`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sls_raw`.`customer` ;

CREATE TABLE IF NOT EXISTS `sls_raw`.`customer` (
  `customer_id` INT(10) NOT NULL AUTO_INCREMENT,
  `name` TINYTEXT NULL DEFAULT NULL,
  `first_name` TINYTEXT NULL DEFAULT NULL,
  `last_name` TINYTEXT NULL DEFAULT NULL,
  `address` TINYTEXT NULL DEFAULT NULL,
  `city` TINYTEXT NULL DEFAULT NULL,
  `country` TINYTEXT NULL DEFAULT NULL,
  `last_updated` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sls_raw`.`lens`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sls_raw`.`lens` ;

CREATE TABLE IF NOT EXISTS `sls_raw`.`lens` (
  `lens_id` INT(10) NOT NULL AUTO_INCREMENT,
  `name` TINYTEXT NULL DEFAULT NULL,
  `lens_category_id` INT(10) NOT NULL,
  `lens_category` TINYTEXT NULL DEFAULT NULL,
  `fmin` DOUBLE NULL DEFAULT NULL,
  `fmax` DOUBLE NULL DEFAULT NULL,
  `amax` DOUBLE NULL DEFAULT NULL,
  `amin` DOUBLE NULL DEFAULT NULL,
  `focusmin` DOUBLE NULL DEFAULT NULL,
  `filter` DOUBLE NULL DEFAULT NULL,
  `count` INT(10) NULL DEFAULT NULL,
  PRIMARY KEY (`lens_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sls_raw`.`lens_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sls_raw`.`lens_category` ;

CREATE TABLE IF NOT EXISTS `sls_raw`.`lens_category` (
  `lens_category_id` INT(10) NOT NULL AUTO_INCREMENT,
  `lens_category` TINYTEXT NULL DEFAULT NULL,
  `count` INT(10) NULL DEFAULT NULL,
  PRIMARY KEY (`lens_category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sls_raw`.`sales`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sls_raw`.`sales` ;

CREATE TABLE IF NOT EXISTS `sls_raw`.`sales` (
  `date` DATE NULL DEFAULT NULL,
  `customer_id` INT(10) NULL DEFAULT NULL,
  `lens_id` INT(10) NULL DEFAULT NULL,
  `sales_channel_id` INT(10) NULL DEFAULT NULL,
  `amount` DOUBLE NULL DEFAULT NULL,
  `store_id` INT(10) NULL DEFAULT NULL,
  `sales_id` INT(10) NOT NULL,
  PRIMARY KEY (`sales_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sls_raw`.`sales_channel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sls_raw`.`sales_channel` ;

CREATE TABLE IF NOT EXISTS `sls_raw`.`sales_channel` (
  `sales_channel_id` INT(10) NOT NULL AUTO_INCREMENT,
  `sales_channel` TINYTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`sales_channel_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sls_raw`.`store`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sls_raw`.`store` ;

CREATE TABLE IF NOT EXISTS `sls_raw`.`store` (
  `store_name` TINYTEXT NULL DEFAULT NULL,
  `store_country` TINYTEXT NULL DEFAULT NULL,
  `store_city` TINYTEXT NULL DEFAULT NULL,
  `store_id` INT(10) NOT NULL,
  PRIMARY KEY (`store_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
