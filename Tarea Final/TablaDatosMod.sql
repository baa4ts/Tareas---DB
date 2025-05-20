-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Concesionario
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Concesionario` DEFAULT CHARACTER SET utf8mb4 ;
USE `Concesionario` ;

-- -----------------------------------------------------
-- Tabla: Clientes
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clientes` (
  `CodigoCliente` INT NOT NULL,
  `NombreCliente` VARCHAR(15),
  `ApellidosCliente` VARCHAR(30),
  `DireccionCliente` VARCHAR(30),
  `Poblacion` VARCHAR(15),
  `CodigoPostal` INT,
  `Provincia` VARCHAR(15),
  `Telefono` VARCHAR(15),
  `FechaNacimiento` DATE,
  PRIMARY KEY (`CodigoCliente`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabla: CochesVendidos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CochesVendidos` (
  `Matricula` VARCHAR(7) NOT NULL,
  `Marca` VARCHAR(15),
  `Modelo` VARCHAR(20),
  `Color` VARCHAR(12),
  `Precio` DECIMAL(10,2),
  `ExtrasInstalados` TEXT,
  PRIMARY KEY (`Matricula`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabla: Revisiones
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Revisiones` (
  `NumeroRevisiones` INT NOT NULL,
  `CambioAceite` TINYINT NOT NULL,
  `CambioFiltro` TINYINT NOT NULL,
  `RevisionFrenos` TINYINT NOT NULL,
  `Otros` VARCHAR(45),
  PRIMARY KEY (`NumeroRevisiones`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabla: Compra
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Compra` (
  `CodigoCliente` INT NOT NULL,
  `Matricula` VARCHAR(7) NOT NULL,
  PRIMARY KEY (`CodigoCliente`, `Matricula`),
  INDEX `idx_MatriculaCompra` (`Matricula` ASC),
  CONSTRAINT `FK_Compra_Cliente`
    FOREIGN KEY (`CodigoCliente`)
    REFERENCES `Clientes` (`CodigoCliente`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_Compra_Coche`
    FOREIGN KEY (`Matricula`)
    REFERENCES `CochesVendidos` (`Matricula`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Tabla: Tiene
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tiene` (
  `NumeroRevisiones` INT NOT NULL,
  `Matricula` VARCHAR(7) NOT NULL,
  PRIMARY KEY (`NumeroRevisiones`, `Matricula`),
  INDEX `idx_MatriculaTiene` (`Matricula` ASC),
  CONSTRAINT `FK_Tiene_Revisiones`
    FOREIGN KEY (`NumeroRevisiones`)
    REFERENCES `Revisiones` (`NumeroRevisiones`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_Tiene_Coche`
    FOREIGN KEY (`Matricula`)
    REFERENCES `CochesVendidos` (`Matricula`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE = InnoDB;

-- Restaurar configuraciones anteriores
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



USE `Concesionario`;

-- 1) INSERT en Clientes (fechas en DD/MM/YY tal cual en el PDF)
INSERT INTO `Clientes`
  (CodigoCliente, NombreCliente, ApellidosCliente, DireccionCliente,
   Poblacion, CodigoPostal, Provincia, Telefono, FechaNacimiento)
VALUES
  (100, 'Antonio', 'García Pérez',   'Astilleros, 3',      'Valencia', 46011, 'Valencia', '963689521', STR_TO_DATE('15/08/60','%d/%m/%y')),
  (101, 'Carlos',  'Pérez Ruiz',      'Magallanes, 21',     'Utiel',    46300, 'Valencia', '962485147', STR_TO_DATE('26/04/58','%d/%m/%y')),
  (105, 'Luis',    'Rodríguez Más',    'Juan de Mena, 11',   'Gandía',   46700, 'Valencia', '962965478', STR_TO_DATE('30/03/61','%d/%m/%y')),
  (112, 'Jaime',   'Juangrán Sornes',  'Balmes, 21',         'Valencia', 46014, 'Valencia', '963684596', STR_TO_DATE('31/01/68','%d/%m/%y')),
  (225, 'Alfonso','Prats Montolla',    'Séneca, 23',         'Sagunto',  46500, 'Valencia', '963547852', STR_TO_DATE('28/04/69','%d/%m/%y')),
  (260, 'José',    'Navarro Lard',     'Río Segura, 14',     'Valencia', 46002, 'Valencia', '963874569', STR_TO_DATE('15/05/64','%d/%m/%y')),
  (289, 'Elisa',   'Úbeda Sansón',     'Valencia, 4',        'Sagunto',  46500, 'Valencia', '963547812', STR_TO_DATE('10/07/62','%d/%m/%y')),
  (352, 'Eva',     'San Martín',       'Villafranca, 34',    'Alzira',   46600, 'Valencia', '962401589', STR_TO_DATE('12/08/65','%d/%m/%y')),
  (365, 'Gerardo', 'Hernández Luis',   'Salinas, 8',         'Valencia', 46002, 'Valencia', '963589621', STR_TO_DATE('02/01/65','%d/%m/%y')),
  (390, 'Carlos',  'Prats Ruiz',       'Ercilla, 8',         'Valencia', 46005, 'Valencia', '963589654', STR_TO_DATE('03/05/67','%d/%m/%y')),
  (810, 'Lourdes','Oliver Peris',      'Gran vía, 34',       'Valencia', 46007, 'Valencia', '963587412', STR_TO_DATE('25/06/64','%d/%m/%y')),
  (822, 'Sergio', 'Larred Navas',      'Blasco Ibáñez, 65',  'Valencia', 46005, 'Valencia', '963589621', STR_TO_DATE('25/12/67','%d/%m/%y')),
  (860, 'Joaquín','Árboles Onsins',    'Gandía, 8',          'Xátiva',   46800, 'Valencia', '963758963', STR_TO_DATE('04/05/69','%d/%m/%y')),
  (861, 'Joaquín','Árboles Onsins',    'Gandía, 8',          'Xátiva',   46800, 'Valencia', '963758963', STR_TO_DATE('04/05/69','%d/%m/%y'))
;

-- 2) INSERT en CochesVendidos
INSERT INTO `CochesVendidos`
  (Matricula, Marca, Modelo, Color, Precio, ExtrasInstalados)
VALUES
  ('V2360OX', 'Opel',    'Corsa 1.2 Sport',    'Azul',    2100000.00, 'Antena eléctrica'),
  ('V1010PB', 'Ford',    'Probe 2.0 16V',      'Blanco',  2860000.00, ''),
  ('V4578OB', 'Ford',    'Orion 1.8 Ghia',     'Negro',   2600000.00, 'Aire Acondicionado'),
  ('V7648OU', 'Citroen', 'Xantia 16V',         'Negro',   2480000.00, 'Airbag'),
  ('V3543NC', 'Ford',    'Escort 1.6 Ghia',    'Rojo',    2500000.00, ''),
  ('V7632NX', 'Citroen', 'Zx Turbo-D',         'Rojo',    2800000.00, 'Aire Acondicionado, Airbag'),
  ('V8018LJ', 'Ford',    'Fiesta 1.4 CLX',     'Azul',    1950000.00, 'Elevalunas eléctricos'),
  ('V2565NB', 'Renault', 'Clio 1.7 S',         'Blanco',  2100000.00, ''),
  ('V7642OU', 'Ford',    'Mondeo 1.8 GLX',     'Blanco',  3100000.00, ''),
  ('V1234LC', 'Audi',    '100 2.3',            'Verde',   3510000.00, 'Climatizador'),
  ('V9834LH', 'Peugeot', '205 GTI',            'Rojo',    2450000.00, '')
;

select CodigoCliente from Clientes where NombreCliente = "Gerardo" into @ClienteVar;
update Clientes set NombreCliente = "Alfredo" WHERE CodigoCliente = @ClienteVar;

-- 3) INSERT en Revisiones
INSERT INTO `Revisiones`
  (NumeroRevisiones, CambioAceite, CambioFiltro, RevisionFrenos, Otros)
VALUES
  (  1, 1, 0, 0, 'Revisar luces'),
  (  2, 1, 1, 0, 'Cambiar limpias'),
  (  3, 0, 1, 1, 'Arreglar alarma'),
  (  4, 0, 1, 1, 'Ajustar tablero'),
  (  5, 1, 1, 1, 'Cambiar limpias, revisar luces'),
  (  6, 0, 0, 1, 'Cambiar luz interior'),
  (  7, 1, 1, 0, ''),
  (  8, 0, 0, 0, ''),
  (  9, 1, 0, 1, 'Regular encendido'),
  ( 10, 0, 1, 0, 'Reparar puerta delantera'),
  ( 11, 0, 0, 0, ''),
  ( 12, 1, 1, 1, ''),
  ( 13, 0, 1, 0, 'Cambiar limpias'),
  ( 14, 0, 1, 0, '')
;

-- 4) INSERT en Compra (relaciona Clientes ↔ CochesVendidos)
INSERT INTO `Compra`
  (CodigoCliente, Matricula)
VALUES
  (100, 'V2360OX'),
  (101, 'V1010PB'),
  (105, 'V4578OB'),
  (225, 'V7648OU'),
  (260, 'V3543NC'),
  (289, 'V7632NX'),
  (352, 'V8018LJ'),
  (390, 'V2565NB'),
  (810, 'V7642OU'),
  (822, 'V1234LC'),
  (860, 'V9834LH')
;

-- 5) INSERT en Tiene (relaciona Revisiones ↔ CochesVendidos)
INSERT INTO `Tiene`
  (NumeroRevisiones, Matricula)
VALUES
  ( 1, 'V7632NX'),
  ( 2, 'V7632NX'),
  ( 3, 'V4578OB'),
  ( 4, 'V2360OX'),
  ( 5, 'V2565NB'),
  ( 6, 'V7648OU'),
  ( 7, 'V2565NB'),
  ( 8, 'V8018LJ'),
  ( 9, 'V3543NC'),
  (10, 'V8018LJ'),
  (11, 'V3543NC'),
  (12, 'V1234LC'),
  (13, 'V9834LH'),
  (14, 'V1010PB')
;
