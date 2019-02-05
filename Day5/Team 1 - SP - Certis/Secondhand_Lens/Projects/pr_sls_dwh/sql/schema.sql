-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema agile_sls_raw
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema agile_sls_raw
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `agile_sls_raw` DEFAULT CHARACTER SET latin1 ;
-- -----------------------------------------------------
-- Schema sls_dma
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sls_dma
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sls_dma` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema sls_raw
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sls_raw
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sls_raw` DEFAULT CHARACTER SET latin1 ;
USE `agile_sls_raw` ;

-- -----------------------------------------------------
-- Table `agile_sls_raw`.`agile_fact_sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agile_sls_raw`.`agile_fact_sales` (
  `sales_date` DATETIME NULL DEFAULT NULL,
  `customer_name` VARCHAR(255) NULL DEFAULT NULL,
  `last_name` VARCHAR(255) NULL DEFAULT NULL,
  `first_name` VARCHAR(255) NULL DEFAULT NULL,
  `country` VARCHAR(255) NULL DEFAULT NULL,
  `city` VARCHAR(255) NULL DEFAULT NULL,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  `sales_channel` VARCHAR(255) NULL DEFAULT NULL,
  `sales` DOUBLE NULL DEFAULT NULL,
  `lens_name` VARCHAR(255) NULL DEFAULT NULL,
  `fmin` DOUBLE NULL DEFAULT NULL,
  `fmax` DOUBLE NULL DEFAULT NULL,
  `amin` DOUBLE NULL DEFAULT NULL,
  `amax` DOUBLE NULL DEFAULT NULL,
  `FocusMin` DOUBLE NULL DEFAULT NULL,
  `Filter` DOUBLE NULL DEFAULT NULL,
  `lens_category` VARCHAR(255) NULL DEFAULT NULL,
  `store_name` VARCHAR(255) NULL DEFAULT NULL,
  `store_country` VARCHAR(255) NULL DEFAULT NULL,
  `store_city` VARCHAR(255) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

USE `sls_dma` ;

-- -----------------------------------------------------
-- Table `sls_dma`.`dim_customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sls_dma`.`dim_customer` (
  `customer_tk` INT(10) NOT NULL,
  `version` INT(10) NULL DEFAULT NULL,
  `date_from` DATETIME NULL DEFAULT NULL,
  `date_to` DATETIME NULL DEFAULT NULL,
  `customer_id` INT(101) NULL DEFAULT NULL,
  `customer_name` VARCHAR(45) NULL DEFAULT NULL,
  `first_name` VARCHAR(45) NULL DEFAULT NULL,
  `last_name` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(45) NULL DEFAULT NULL,
  `city` VARCHAR(45) NULL DEFAULT NULL,
  `country` VARCHAR(45) NULL DEFAULT NULL,
  `last_updated` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`customer_tk`),
  INDEX `idx_DIM_CUSTOMER_lookup` (`customer_id` ASC),
  INDEX `idx_DIM_CUSTOMER_tk` (`customer_tk` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sls_dma`.`dim_date`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sls_dma`.`dim_date` (
  `date` DATETIME NULL DEFAULT NULL,
  `year` INT(10) NULL DEFAULT NULL,
  `quarter` INT(10) NULL DEFAULT NULL,
  `month` INT(10) NULL DEFAULT NULL,
  `week_of_year` INT(10) NULL DEFAULT NULL,
  `day_of_year` INT(10) NULL DEFAULT NULL,
  `day_of_month` INT(10) NULL DEFAULT NULL,
  `day_of_week` INT(10) NULL DEFAULT NULL,
  `month_long` VARCHAR(45) NULL DEFAULT NULL,
  `day_of_week_long` VARCHAR(45) NULL DEFAULT NULL,
  `date_tk` INT(10) NOT NULL,
  PRIMARY KEY (`date_tk`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sls_dma`.`dim_lens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sls_dma`.`dim_lens` (
  `lens_tk` INT(10) NOT NULL,
  `version` INT(10) NULL DEFAULT NULL,
  `date_from` DATETIME NULL DEFAULT NULL,
  `date_to` DATETIME NULL DEFAULT NULL,
  `lens_id` INT(10) NULL DEFAULT NULL,
  `lens_name` VARCHAR(255) NULL DEFAULT NULL,
  `lens_category_id` INT(10) NULL DEFAULT NULL,
  `lens_category` VARCHAR(45) NULL DEFAULT NULL,
  `fmin` DOUBLE NULL DEFAULT NULL,
  `fmax` DOUBLE NULL DEFAULT NULL,
  `amax` DOUBLE NULL DEFAULT NULL,
  `amin` DOUBLE NULL DEFAULT NULL,
  `focusmin` DOUBLE NULL DEFAULT NULL,
  `filter` DOUBLE NULL DEFAULT NULL,
  PRIMARY KEY (`lens_tk`),
  INDEX `idx_dim_lens_lookup` (`lens_id` ASC),
  INDEX `idx_dim_lens_tk` (`lens_tk` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sls_dma`.`dim_store`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sls_dma`.`dim_store` (
  `store_tk` INT(10) NOT NULL,
  `version` INT(10) NULL DEFAULT NULL,
  `date_from` DATETIME NULL DEFAULT NULL,
  `date_to` DATETIME NULL DEFAULT NULL,
  `store_id` INT(10) NULL DEFAULT NULL,
  `store_name` VARCHAR(45) NULL DEFAULT NULL,
  `store_country` VARCHAR(45) NULL DEFAULT NULL,
  `store_city` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`store_tk`),
  INDEX `idx_dim_store_lookup` (`store_id` ASC),
  INDEX `idx_dim_store_tk` (`store_tk` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `sls_dma`.`fact_sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sls_dma`.`fact_sales` (
  `sales_date` DATETIME NULL DEFAULT NULL,
  `sales` DOUBLE NULL DEFAULT NULL,
  `sales_channel` VARCHAR(45) NULL DEFAULT NULL,
  `lens_tk` INT(10) NULL DEFAULT NULL,
  `customer_tk` INT(10) NULL DEFAULT NULL,
  `date_tk` INT(10) NULL DEFAULT NULL,
  `store_tk` INT(10) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

USE `sls_raw` ;

-- -----------------------------------------------------
-- Table `sls_raw`.`customer`
-- -----------------------------------------------------
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
AUTO_INCREMENT = 26
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sls_raw`.`lens`
-- -----------------------------------------------------
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
AUTO_INCREMENT = 449
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sls_raw`.`lens_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sls_raw`.`lens_category` (
  `lens_category_id` INT(10) NOT NULL AUTO_INCREMENT,
  `lens_category` TINYTEXT NULL DEFAULT NULL,
  `count` INT(10) NULL DEFAULT NULL,
  PRIMARY KEY (`lens_category_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sls_raw`.`sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sls_raw`.`sales` (
  `date` DATE NULL DEFAULT NULL,
  `customer_id` INT(10) NULL DEFAULT NULL,
  `lens_id` INT(10) NULL DEFAULT NULL,
  `sales_channel_id` INT(10) NULL DEFAULT NULL,
  `amount` DOUBLE NULL DEFAULT NULL,
  `store_id` INT(10) NULL DEFAULT NULL,
  `sales_id` INT(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sales_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 100
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sls_raw`.`sales_channel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sls_raw`.`sales_channel` (
  `sales_channel_id` INT(10) NOT NULL AUTO_INCREMENT,
  `sales_channel` TINYTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`sales_channel_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sls_raw`.`store`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sls_raw`.`store` (
  `store_name` TINYTEXT NULL DEFAULT NULL,
  `store_country` TINYTEXT NULL DEFAULT NULL,
  `store_city` TINYTEXT NULL DEFAULT NULL,
  `store_id` INT(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`store_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
