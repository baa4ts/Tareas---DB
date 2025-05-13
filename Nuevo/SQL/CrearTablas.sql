-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Concesionario
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Concesionario
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Concesionario` DEFAULT CHARACTER SET utf8 ;
USE `Concesionario` ;

-- -----------------------------------------------------
-- Table `Concesionario`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Concesionario`.`Clientes` (
  `CodigoCliente` INT NOT NULL,
  `NombreCliente` VARCHAR(45) NULL,
  `ApellidosCliente` VARCHAR(45) NULL,
  `DireccionCliente` VARCHAR(45) NULL,
  `Poblacion` VARCHAR(45) NULL,
  `CodigoPostal` INT NULL,
  `Provincia` VARCHAR(45) NULL,
  `Telefono` VARCHAR(45) NULL,
  `FechaNacimiento` DATETIME NULL,
  PRIMARY KEY (`CodigoCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Concesionario`.`CochesVendidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Concesionario`.`CochesVendidos` (
  `Matricula` VARCHAR(45) NOT NULL,
  `Marca` VARCHAR(45) NULL,
  `Modelo` VARCHAR(45) NULL,
  `Color` VARCHAR(45) NULL,
  `Precio` VARCHAR(45) NULL,
  `ExtrasInstalados` VARCHAR(45) NULL,
  PRIMARY KEY (`Matricula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Concesionario`.`Revisiones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Concesionario`.`Revisiones` (
  `NumeroRevisiones` INT NOT NULL,
  `CambioAceite` TINYINT NULL,
  `CambioFiltro` TINYINT NULL,
  `RevisionFrenos` TINYINT NULL,
  `Otros` VARCHAR(45) NULL,
  PRIMARY KEY (`NumeroRevisiones`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
