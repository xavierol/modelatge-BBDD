-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
SHOW WARNINGS;
-- -----------------------------------------------------
-- Schema cul_ampolla
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cul_ampolla
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cul_ampolla` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `cul_ampolla` ;

-- -----------------------------------------------------
-- Table `cul_ampolla`.`supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cul_ampolla`.`supplier` (
  `idSupplier` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(80) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `postalCode` INT(8) NOT NULL,
  `country` VARCHAR(25) NOT NULL,
  `phone` INT(11) NOT NULL,
  `fax` INT(11) NOT NULL,
  `nif` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`idSupplier`),
  UNIQUE INDEX `nif_UNIQUE` (`nif` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `cul_ampolla`.`brand`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cul_ampolla`.`brand` (
  `idBrand` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `supplierId` INT(11) NOT NULL,
  PRIMARY KEY (`idBrand`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  INDEX `supplierId_idx` (`supplierId` ASC),
  CONSTRAINT `supplierId`
    FOREIGN KEY (`supplierId`)
    REFERENCES `cul_ampolla`.`supplier` (`idSupplier`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `cul_ampolla`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cul_ampolla`.`customer` (
  `idCustomer` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `postalAddress` VARCHAR(15) NOT NULL,
  `phone` INT(11) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `registryDate` DATETIME NOT NULL,
  `recomBy` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idCustomer`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `cul_ampolla`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cul_ampolla`.`employee` (
  `idEmployee` INT(4) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `dni` VARCHAR(10) NOT NULL,
  `adress` VARCHAR(45) NULL DEFAULT NULL,
  `city` VARCHAR(45) NULL DEFAULT NULL,
  `country` VARCHAR(45) NULL DEFAULT NULL,
  `postalCode` INT(8) NULL DEFAULT NULL,
  PRIMARY KEY (`idEmployee`),
  UNIQUE INDEX `dni_UNIQUE` (`dni` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `cul_ampolla`.`glasses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cul_ampolla`.`glasses` (
  `idGlasses` INT(11) NOT NULL AUTO_INCREMENT,
  `brandId` INT(11) NOT NULL,
  `modelName` VARCHAR(45) NOT NULL,
  `gradLeft` VARCHAR(10) NOT NULL,
  `gradRight` VARCHAR(10) NOT NULL,
  `frameType` ENUM('metal', 'floating', 'paste') NOT NULL,
  `frameColor` VARCHAR(20) NOT NULL,
  `glassColor` VARCHAR(20) NOT NULL,
  `price` INT(6) NOT NULL,
  PRIMARY KEY (`idGlasses`),
  INDEX `brandId_idx` (`brandId` ASC),
  CONSTRAINT `brandId`
    FOREIGN KEY (`brandId`)
    REFERENCES `cul_ampolla`.`brand` (`idBrand`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `cul_ampolla`.`invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cul_ampolla`.`invoice` (
  `idInvoice` INT(11) NOT NULL,
  `date` DATETIME NOT NULL,
  `customerId` INT(11) NOT NULL,
  PRIMARY KEY (`idInvoice`),
  INDEX `customerId_idx` (`customerId` ASC),
  CONSTRAINT `customerId`
    FOREIGN KEY (`customerId`)
    REFERENCES `cul_ampolla`.`customer` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `cul_ampolla`.`invoice_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cul_ampolla`.`invoice_detail` (
  `invoice_DetailId` INT(12) NOT NULL,
  `glassesId` INT(11) NOT NULL,
  `amount` INT(4) NOT NULL,
  `price` INT(8) NOT NULL,
  `invoiceId` INT(11) NOT NULL,
  `employeeId` INT(4) NOT NULL,
  PRIMARY KEY (`invoice_DetailId`),
  INDEX `invoiceId_idx` (`invoiceId` ASC),
  INDEX `glassesId_idx` (`glassesId` ASC),
  INDEX `employeeId_idx` (`employeeId` ASC),
  CONSTRAINT `employeeId`
    FOREIGN KEY (`employeeId`)
    REFERENCES `cul_ampolla`.`employee` (`idEmployee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `glassesId`
    FOREIGN KEY (`glassesId`)
    REFERENCES `cul_ampolla`.`glasses` (`idGlasses`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `invoiceId`
    FOREIGN KEY (`invoiceId`)
    REFERENCES `cul_ampolla`.`invoice` (`idInvoice`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
