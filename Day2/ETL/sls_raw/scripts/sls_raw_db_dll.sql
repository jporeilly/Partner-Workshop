-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;


-- -----------------------------------------------------
-- Schema sls_raw
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sls_raw` DEFAULT CHARACTER SET latin1 ;
USE `sls_raw` ;

-- -----------------------------------------------------
-- Table `sls_raw`.`customer`
-- -----------------------------------------------------
CREATE TABLE `customer` (
  `customer_id` INT(20) NOT NULL AUTO_INCREMENT,
  `prefix` VARCHAR(45) DEFAULT NULL,
  `first_name` VARCHAR(45) DEFAULT NULL,
  `surname` VARCHAR(45) DEFAULT NULL,
  `full_name` VARCHAR(45) DEFAULT NULL,
  `address` VARCHAR(255) DEFAULT NULL,
  `city` VARCHAR(45) DEFAULT NULL,
  `country` VARCHAR(45) DEFAULT NULL,
  `last_updated` DATE DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB 
AUTO_INCREMENT = 0
DEFAULT CHARSET=latin1;


-- -----------------------------------------------------
-- Table `sls_raw`.`lens_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sls_raw`.`lens_category` (
  `lens_category_id` INT(20) NOT NULL AUTO_INCREMENT,
  `lens_category` VARCHAR(45) DEFAULT NULL,
  `count` INT(10) DEFAULT NULL,
  PRIMARY KEY (`lens_category_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sls_raw`.`lens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sls_raw`.`lens` (
  `lens_id` INT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) DEFAULT NULL,
  `year`INT(10) DEFAULT NULL,
  `lens_category_id` INT(10) DEFAULT NULL,
  `focal_length_min` INT(10) DEFAULT NULL,
  `focal_length_max` INT(10) DEFAULT NULL,
  `aperture_max` INT(10) DEFAULT NULL,
  `aperture_min` INT(10) DEFAULT NULL,
  `focusing_distance_min` INT(10) DEFAULT NULL,
  `filter_size` INT(10) DEFAULT NULL,
  PRIMARY KEY (`lens_id`),
  INDEX `idx_lens_category` (`lens_category_id` ASC))
 ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sls_raw`.`sales_channel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sls_raw`.`sales_channel` (
  `sales_channel_id` INT(20) NOT NULL AUTO_INCREMENT,
  `sales_channel` VARCHAR(45) DEFAULT NULL,
  PRIMARY KEY (`sales_channel_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sls_raw`.`store`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sls_raw`.`store` (
  `store_id` INT(20) NOT NULL AUTO_INCREMENT,
  `store_name` VARCHAR(100) DEFAULT NULL,
  `store_country` VARCHAR(45) DEFAULT NULL,
  `store_city` VARCHAR(45) DEFAULT NULL,
  PRIMARY KEY (`store_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sls_raw`.`sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sls_raw`.`sales` (
  `sales_id` INT(20) NOT NULL AUTO_INCREMENT,
  `date` DATE DEFAULT NULL,
  `customer_id` INT(20) NOT NULL,
  `lens_id` INT(20) NOT NULL,
  `sales_channel_id` INT(20) NOT NULL,
  `store_id` INT(20) NOT NULL,
  `amount` INT(10) DEFAULT NULL,
  PRIMARY KEY (`sales_id`),
  INDEX `fk_customer_id_idx` (`customer_id` ASC),
  INDEX `fk_lens_id_idx` (`lens_id` ASC),
  INDEX `fk_sale_sales_channel_idx` (`sales_channel_id` ASC),
  INDEX `fk_store_id_idx` (`store_id` ASC))
  ENGINE = InnoDB
AUTO_INCREMENT = 0
DEFAULT CHARACTER SET = latin1;


SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
