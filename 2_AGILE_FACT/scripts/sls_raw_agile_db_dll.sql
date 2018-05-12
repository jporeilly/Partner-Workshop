-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema sls_raw_agile
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `sls_raw_agile` ;

-- -----------------------------------------------------
-- Schema sls_raw_agile
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sls_raw_agile` DEFAULT CHARACTER SET latin1 ;
USE `sls_raw_agile` ;

-- -----------------------------------------------------
-- Table `sls_raw_agile`.`agile_fact_sales`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sls_raw_agile`.`agile_fact_sales` ;

CREATE TABLE IF NOT EXISTS `sls_raw_agile`.`agile_fact_sales` (
  `sales_id` BIGINT(20) NULL DEFAULT NULL,
  `sale_date` DATETIME NULL DEFAULT NULL,
  `customer_id` BIGINT(20) NULL DEFAULT NULL,
  `sales_channel_id` BIGINT(20) NULL DEFAULT NULL,
  `sales_channel` VARCHAR(45) NULL DEFAULT NULL,
  `sales` DOUBLE NULL DEFAULT NULL,
  `lens_id` BIGINT(20) NULL DEFAULT NULL,
  `lens_name` VARCHAR(120) NULL DEFAULT NULL,
  `lens_year` INT(10) NULL DEFAULT NULL,
  `focal_length_min` INT(10) NULL DEFAULT NULL,
  `focal_length_max` INT(10) NULL DEFAULT NULL,
  `aperture_max` DOUBLE NULL DEFAULT NULL,
  `aperture_min` DOUBLE NULL DEFAULT NULL,
  `focusing_distance_min` INT(10) NULL DEFAULT NULL,
  `filter_size` INT(10) NULL DEFAULT NULL,
  `lens_category` VARCHAR(45) NULL DEFAULT NULL,
  `customer_name` VARCHAR(45) NULL DEFAULT NULL,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  `city` VARCHAR(45) NULL DEFAULT NULL,
  `country` VARCHAR(45) NULL DEFAULT NULL,
  `store_id` BIGINT(20) NULL DEFAULT NULL,
  `store_name` VARCHAR(100) NULL DEFAULT NULL,
  `store_country` VARCHAR(45) NULL DEFAULT NULL,
  `store_city` VARCHAR(45) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

