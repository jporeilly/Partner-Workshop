-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

-- -----------------------------------------------------
-- Schema sls_dma
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sls_dma` DEFAULT CHARACTER SET latin1 ;
USE `sls_dma` ;

-- -----------------------------------------------------
-- Table `sls_dma`.`dim_customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sls_dma`.`dim_customer` (
  `customer_tk` INT(20) NOT NULL,
  `version` INT(10) NULL DEFAULT NULL,
  `date_from` DATETIME DEFAULT NULL,
  `date_to` DATETIME DEFAULT NULL,
  `customer_id` INT(20) NULL DEFAULT NULL,
  `prefix` VARCHAR(10) NULL DEFAULT NULL,
  `customer_name` VARCHAR(45) NULL DEFAULT NULL,
  `first_name` VARCHAR(45) NULL DEFAULT NULL,
  `surname` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  `city` VARCHAR(45) NULL DEFAULT NULL,
  `country` VARCHAR(45) NULL DEFAULT NULL,
  `last_updated` DATETIME,
  PRIMARY KEY (`customer_tk`),
  INDEX `idx_dim_customer_lookup` (`customer_id` ASC),
  INDEX `idx_dim_customer_tk` (`customer_tk` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sls_dma`.`dim_date`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sls_dma`.`dim_date` (
  `date_tk` INT(20) NOT NULL,
  `date` DATE,
  `year` INT(10) DEFAULT NULL,
  `quarter` INT(10) DEFAULT NULL,
  `month` INT(10) DEFAULT NULL,
  `month_long` VARCHAR(45) DEFAULT NULL,
  `week_of_year` INT(10) DEFAULT NULL,
  `day_of_year` INT(10) DEFAULT NULL,
  `day_of_month` INT(10) DEFAULT NULL,
  `day_of_week` INT(10) DEFAULT NULL,
  `day_of_week_long` VARCHAR(45) DEFAULT NULL,
  `store_id` INT(10) DEFAULT NULL,
  PRIMARY KEY (`date_tk`),
  INDEX `idx_dim_date_lookup` (`date` ASC),
  INDEX `idx_dim_date_tk` (`date_tk` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sls_dma`.`dim_lens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sls_dma`.`dim_lens` (
  `lens_tk` INT(20) NOT NULL,
  `version` INT(10) NULL DEFAULT NULL,
  `date_from` DATETIME,
  `date_to` DATETIME,
  `lens_id` BIGINT(20) NULL DEFAULT NULL,
  `lens_name` VARCHAR(100) NULL DEFAULT NULL,
  `lens_year` INT(10) NULL DEFAULT NULL,
  `lens_category` VARCHAR(45) NULL DEFAULT NULL,
  `focal_length_min` INT(10) NULL DEFAULT NULL,
  `focal_length_max` INT(10) NULL DEFAULT NULL,
  `aperture_min` DOUBLE NULL DEFAULT NULL,
  `aperture_max` DOUBLE NULL DEFAULT NULL,
  `focusing_distance_min` INT(10) NULL DEFAULT NULL,
  `filter_size` INT(10) NULL DEFAULT NULL,
  PRIMARY KEY (`lens_tk`),
  INDEX `idx_dim_lens_lookup` (`lens_id` ASC),
  INDEX `idx_dim_lens_tk` (`lens_tk` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sls_dma`.`dim_store`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sls_dma`.`dim_store` (
  `store_tk` INT(20) NOT NULL,
  `version` INT(11) NULL DEFAULT NULL,
  `date_to` DATETIME DEFAULT NULL,
  `date_from` DATETIME DEFAULT NULL,
  `store_id` BIGINT(20) NULL DEFAULT NULL,
  `store_name` VARCHAR(100) NULL DEFAULT NULL,
  `store_country` VARCHAR(50) NULL DEFAULT NULL,
  `store_city` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`store_tk`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `sls_dma`.`fact_sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sls_dma`.`fact_sales` (
  `date_tk` INT(20) NULL DEFAULT NULL,
  `sales_date` DATETIME DEFAULT NULL,
  `sales_channel` VARCHAR(45) NULL DEFAULT NULL,
  `lens_tk` INT(10) NULL DEFAULT NULL,
  `customer_tk` INT(10) NULL DEFAULT NULL,
  `store_tk` INT(10) NULL DEFAULT NULL,
  `sales` DOUBLE NULL DEFAULT NULL,
  INDEX `idx_customer_tk` (`customer_tk` ASC),
  INDEX `idx_lens_tk` (`lens_tk` ASC),
  INDEX `idx_sales_channel` (`sales_channel` ASC),
  INDEX `fk_store_tk_idx` (`store_tk` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
