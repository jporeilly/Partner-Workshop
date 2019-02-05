-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

-- -----------------------------------------------------
-- Schema agile_sls_raw
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sls_raw_agile` DEFAULT CHARACTER SET latin1 ;
USE `sls_raw_agile` ;

-- -----------------------------------------------------
-- Table `agile_sls_raw`.`agile_fact_sales`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sls_raw_agile`.`agile_fact_sales` ;

CREATE TABLE `agile_fact_sales` (
  `sales_date` DATETIME DEFAULT NULL,
  `customer_name` VARCHAR(255) DEFAULT NULL,
  `surname` VARCHAR(255) DEFAULT NULL,
  `first_name` VARCHAR(255) DEFAULT NULL,
  `city` VARCHAR(50) DEFAULT NULL,
  `country` VARCHAR(50) DEFAULT NULL,
  `address` VARCHAR(100) DEFAULT NULL,
  `sales_channel` VARCHAR(50) DEFAULT NULL,
  `sales` double DEFAULT NULL,
  `lens_name` VARCHAR(100) DEFAULT NULL,
  `fmin` double DEFAULT NULL,
  `fmax` double DEFAULT NULL,
  `amin` double DEFAULT NULL,
  `amax` double DEFAULT NULL,
  `FocusMin` double DEFAULT NULL,
  `Filter` double DEFAULT NULL,
  `lens_category` VARCHAR(50) DEFAULT NULL,
  `store_name` VARCHAR(50) DEFAULT NULL,
  `store_country` VARCHAR(50) DEFAULT NULL,
  `store_city` VARCHAR(50) DEFAULT NULL
) ENGINE=InnoDB 
  DEFAULT CHARSET=latin1;

SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
