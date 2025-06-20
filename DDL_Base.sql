-- MySQL Script generated by MySQL Workbench
-- Wed May  7 22:34:39 2025
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema myholylib
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema myholylib
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `myholylib` DEFAULT CHARACTER SET utf8 ;
USE `myholylib` ;

-- -----------------------------------------------------
-- Table `myholylib`.`BIB_BIBLIOTECA_SEDE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `myholylib`.`BIB_BIBLIOTECA_SEDE` (
  `ID_SEDE` INT NOT NULL AUTO_INCREMENT,
  `NOMBRE` VARCHAR(100) NOT NULL,
  `DIRECCION` VARCHAR(150) NOT NULL,
  `DISTRITO` VARCHAR(50) NOT NULL,
  `TELEFONO_CONTACTO` VARCHAR(15) NOT NULL,
  `CORREO_CONTACTO` VARCHAR(100) NOT NULL,
  `ACTIVA` TINYINT(0) NOT NULL,
  PRIMARY KEY (`ID_SEDE`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myholylib`.`BIB_PERSONA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `myholylib`.`BIB_PERSONA` (
  `ID_PERSONA` INT NOT NULL AUTO_INCREMENT,
  `NOMBRE` VARCHAR(100) NOT NULL,
  `PATERNO` VARCHAR(50) NOT NULL,
  `MATERNO` VARCHAR(50) NOT NULL,
  `DIRECCION` VARCHAR(150) NOT NULL,
  `TELEFONO` VARCHAR(9) NOT NULL,
  `CORREO` VARCHAR(100) NOT NULL,
  `CONTRASENHA` VARCHAR(25) NOT NULL,
  `TIPO_PERSONA` ENUM('LECTOR', 'BIBLIOTECARIO') NOT NULL,
  `NIVEL` ENUM('BASICO', 'INTERMEDIO', 'AVANZADO') NULL,
  `TURNO` ENUM('MANHANA', 'TARDE', 'NOCHE') NULL,
  `FECHA_CONTRATO_INI` DATE NULL,
  `FECHA_CONTRATO_FIN` DATE NULL,
  `VIGENTE` TINYINT(0) NULL,
  `SEDE_IDSEDE` INT NOT NULL,
  PRIMARY KEY (`ID_PERSONA`),
  INDEX `fk_BIB_PERSONA_BIB_SEDE1_idx` (`SEDE_IDSEDE` ASC) VISIBLE,
  CONSTRAINT `fk_BIB_PERSONA_BIB_SEDE1`
    FOREIGN KEY (`SEDE_IDSEDE`)
    REFERENCES `myholylib`.`BIB_BIBLIOTECA_SEDE` (`ID_SEDE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myholylib`.`BIB_PRESTAMO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `myholylib`.`BIB_PRESTAMO` (
  `ID_PRESTAMO` INT NOT NULL AUTO_INCREMENT,
  `FECHA_SOLICITUD` DATE NOT NULL,
  `FECHA_PRESTAMO` DATE NOT NULL,
  `FECHA_DEVOLUCION` DATE NOT NULL, 
  `PERSONA_IDPERSONA` INT NOT NULL,
  PRIMARY KEY (`ID_PRESTAMO`),
  INDEX `fk_BIB_PRESTAMO_BIB_PERSONA_idx` (`PERSONA_IDPERSONA` ASC) VISIBLE,
  CONSTRAINT `fk_BIB_PRESTAMO_BIB_PERSONA`
    FOREIGN KEY (`PERSONA_IDPERSONA`)
    REFERENCES `myholylib`.`BIB_PERSONA` (`ID_PERSONA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myholylib`.`BIB_REPORTE_SEDE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `myholylib`.`BIB_REPORTE_SEDE` (
  `ANHIO` INT NOT NULL,
  `MES` INT NOT NULL,
  `PRESTAMO_IDPRESTAMO` INT NOT NULL,
  `SEDE_IDSEDE` INT NOT NULL,
  `PERSONA_IDPERSONA` INT NOT NULL,
  PRIMARY KEY (`ANHIO`, `MES`, `PRESTAMO_IDPRESTAMO`, `SEDE_IDSEDE`, `PERSONA_IDPERSONA`),
  INDEX `fk_BIB_REPORTE_SEDE_BIB_SEDE1_idx` (`SEDE_IDSEDE` ASC) VISIBLE,
  INDEX `fk_BIB_REPORTE_SEDE_BIB_PRESTAMO_idx` (`PRESTAMO_IDPRESTAMO` ASC) VISIBLE,
  INDEX `fk_BIB_REPORTE_SEDE_BIB_PERSONA_idx` (`PERSONA_IDPERSONA` ASC) VISIBLE,
  CONSTRAINT `fk_BIB_REPORTE_SEDE_BIB_SEDE1`
    FOREIGN KEY (`SEDE_IDSEDE`)
    REFERENCES `myholylib`.`BIB_BIBLIOTECA_SEDE` (`ID_SEDE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BIB_REPORTE_SEDE_BIB_PRESTAMO`
    FOREIGN KEY (`PRESTAMO_IDPRESTAMO`)
    REFERENCES `myholylib`.`BIB_PRESTAMO` (`ID_PRESTAMO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BIB_REPORTE_SEDE_BIB_PERSONA`
    FOREIGN KEY (`PERSONA_IDPERSONA`)
    REFERENCES `myholylib`.`BIB_PERSONA` (`ID_PERSONA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myholylib`.`BIB_REPORTE_GENERAL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `myholylib`.`BIB_REPORTE_GENERAL` (
  `ANHIO` INT NOT NULL,
  `MES` INT NOT NULL,
  `PRESTAMO_IDPRESTAMO` INT NOT NULL,
  `PERSONA_IDPERSONA` INT NOT NULL,
  PRIMARY KEY (`ANHIO`, `PRESTAMO_IDPRESTAMO`, `MES`, `PERSONA_IDPERSONA`),
  INDEX `fk_BIB_REPORTE_GENERAL_BIB_PRESTAMO_idx` (`PRESTAMO_IDPRESTAMO` ASC) VISIBLE,
  INDEX `fk_BIB_REPORTE_GENERAL_BIB_PERSONA_idx` (`PERSONA_IDPERSONA` ASC) VISIBLE,
  CONSTRAINT `fk_BIB_REPORTE_GENERAL_BIB_PRESTAMO`
    FOREIGN KEY (`PRESTAMO_IDPRESTAMO`)
    REFERENCES `myholylib`.`BIB_PRESTAMO` (`ID_PRESTAMO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BIB_REPORTE_GENERAL_BIB_PERSONA`
    FOREIGN KEY (`PERSONA_IDPERSONA`)
    REFERENCES `myholylib`.`BIB_PERSONA` (`ID_PERSONA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myholylib`.`BIB_EDITORIAL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `myholylib`.`BIB_EDITORIAL` (
  `ID_EDITORIAL` INT NOT NULL AUTO_INCREMENT,
  `NOMBRE` VARCHAR(45) NOT NULL,
  `SITIOWEB` VARCHAR(100) NULL DEFAULT NULL,
  `PAIS` VARCHAR(50) NULL,
  PRIMARY KEY (`ID_EDITORIAL`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myholylib`.`BIB_MATERIAL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `myholylib`.`BIB_MATERIAL` (
  `ID_MATERIAL` INT NOT NULL AUTO_INCREMENT,
  `TITULO` VARCHAR(100) NOT NULL,
  `EDICION` VARCHAR(45) NULL,                               
  `NIVEL` ENUM('BASICO', 'INTERMEDIO', 'AVANZADO') NULL,
  `ANHIO_PUBLICACION` INT NULL,
  `PORTADA` VARCHAR(255) NULL,
  `EDITORIAL_IDEDITORIAL` INT NULL,  
  PRIMARY KEY (`ID_MATERIAL`),
  INDEX `fk_BIB_MATERIAL_MAT_EDITORIAL1_idx` (`EDITORIAL_IDEDITORIAL` ASC) VISIBLE,
  CONSTRAINT `fk_BIB_MATERIAL_MAT_EDITORIAL1`
    FOREIGN KEY (`EDITORIAL_IDEDITORIAL`)
    REFERENCES `myholylib`.`BIB_EDITORIAL` (`ID_EDITORIAL`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myholylib`.`BIB_TEMA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `myholylib`.`BIB_TEMA` (
  `ID_TEMA` INT NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` VARCHAR(100) NOT NULL,
  `CATEGORIA` ENUM('GENERO', 'EDAD') NOT NULL,
  `ID_TEMA_PADRE` INT NULL,
  PRIMARY KEY (`ID_TEMA`),
  INDEX `fk_BIB_TEMA_BIB_TEMA_idx` (`ID_TEMA_PADRE` ASC) VISIBLE,
  CONSTRAINT `fk_BIB_TEMA_BIB_TEMA`
    FOREIGN KEY (`ID_TEMA_PADRE`)
    REFERENCES `myholylib`.`BIB_TEMA` (`ID_TEMA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myholylib`.`BIB_EJEMPLAR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `myholylib`.`BIB_EJEMPLAR` (
  `ID_EJEMPLAR` INT NOT NULL AUTO_INCREMENT,
  `FECHA_ADQUISICION` DATE NULL,            
  `DISPONIBLE` TINYINT(0) NOT NULL,                
  `TIPO_EJEMPLAR` ENUM('FISICO', 'DIGITAL') NOT NULL,
  `FORMATO_DIGITAL` ENUM('MP3', 'PDF', 'CBR', 'PPT') NULL,
  `UBICACION` VARCHAR(70) NULL,
  `SEDE_IDSEDE` INT NOT NULL,
  `MATERIAL_IDMATERIAL` INT NOT NULL,
  PRIMARY KEY (`ID_EJEMPLAR`),
  INDEX `fk_MAT_EJEMPLAR_BIB_SEDE1_idx` (`SEDE_IDSEDE` ASC) VISIBLE,
  INDEX `fk_MAT_EJEMPLAR_BIB_MATERIAL1_idx` (`MATERIAL_IDMATERIAL` ASC) VISIBLE,
  CONSTRAINT `fk_MAT_EJEMPLAR_BIB_SEDE1`
    FOREIGN KEY (`SEDE_IDSEDE`)
    REFERENCES `myholylib`.`BIB_BIBLIOTECA_SEDE` (`ID_SEDE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MAT_EJEMPLAR_BIB_MATERIAL1`
    FOREIGN KEY (`MATERIAL_IDMATERIAL`)
    REFERENCES `myholylib`.`BIB_MATERIAL` (`ID_MATERIAL`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myholylib`.`BIB_SANCION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `myholylib`.`BIB_SANCION` (
  `ID_SANCION` INT NOT NULL AUTO_INCREMENT,
  `TIPO` ENUM('DANHO', 'PERDIDA', 'DEMORA', 'EXCEPCION') NOT NULL,
  `FECHA` DATE NOT NULL,
  `MONTO` DOUBLE NULL DEFAULT NULL,
  `DURACION` DATE NULL DEFAULT NULL,         
  `DESCRIPCION` VARCHAR(150) NULL DEFAULT NULL,        
  `PRESTAMO_IDPRESTAMO` INT NOT NULL,
  PRIMARY KEY (`ID_SANCION`),
  INDEX `fk_BIB_SANCION_BIB_PRESTAMO1_idx` (`PRESTAMO_IDPRESTAMO` ASC) VISIBLE,
  CONSTRAINT `fk_BIB_SANCION_BIB_PRESTAMO1`
    FOREIGN KEY (`PRESTAMO_IDPRESTAMO`)
    REFERENCES `myholylib`.`BIB_PRESTAMO` (`ID_PRESTAMO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myholylib`.`BIB_CREADOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `myholylib`.`BIB_CREADOR` ( 
  `ID_CREADOR` INT NOT NULL AUTO_INCREMENT,
  `NOMBRE` VARCHAR(150) NOT NULL,
  `PATERNO` VARCHAR(50) NULL,
  `MATERNO` VARCHAR(50) NULL,
  `SEUDONIMO` VARCHAR(50) NULL,
  `TIPO_CREADOR` ENUM('AUTOR', 'TRADUCTOR', 'ILUSTRADOR', 'NARRADOR', 'EDITOR', 'GUIONISTA', 'DISENADOR_EDITORIAL', 'OTRO') NOT NULL,
  `NACIONALIDAD` VARCHAR(50) NULL, 
  `ACTIVO` TINYINT(0) NOT NULL,
  PRIMARY KEY (`ID_CREADOR`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myholylib`.`BIB_PRESTAMO_EJEMPLAR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `myholylib`.`BIB_PRESTAMO_EJEMPLAR` (
  `PRESTAMO_IDPRESTAMO` INT NOT NULL,
  `EJEMPLAR_IDEJEMPLAR` INT NOT NULL,
  `ESTADO` ENUM('SOLICITADO', 'PRESTADO', 'DEVUELTO', 'ATRASADO') NOT NULL,
  `FECHA_REAL_DEVOLUCION` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`PRESTAMO_IDPRESTAMO`, `EJEMPLAR_IDEJEMPLAR`),
  INDEX `fk_BIB_PRESTAMO_has_MAT_EJEMPLAR_MAT_EJEMPLAR1_idx` (`EJEMPLAR_IDEJEMPLAR` ASC) VISIBLE,
  INDEX `fk_BIB_PRESTAMO_has_MAT_EJEMPLAR_BIB_PRESTAMO1_idx` (`PRESTAMO_IDPRESTAMO` ASC) VISIBLE,
  CONSTRAINT `fk_BIB_PRESTAMO_has_MAT_EJEMPLAR_BIB_PRESTAMO1`
    FOREIGN KEY (`PRESTAMO_IDPRESTAMO`)
    REFERENCES `myholylib`.`BIB_PRESTAMO` (`ID_PRESTAMO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BIB_PRESTAMO_has_MAT_EJEMPLAR_MAT_EJEMPLAR1`
    FOREIGN KEY (`EJEMPLAR_IDEJEMPLAR`)
    REFERENCES `myholylib`.`BIB_EJEMPLAR` (`ID_EJEMPLAR`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myholylib`.`BIB_MATERIAL_TEMA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `myholylib`.`BIB_MATERIAL_TEMA` (
  `MATERIAL_IDMATERIAL` INT NOT NULL,
  `TEMA_IDTEMA` INT NOT NULL,
  PRIMARY KEY (`MATERIAL_IDMATERIAL`, `TEMA_IDTEMA`),
  INDEX `fk_BIB_MATERIAL_has_MAT_TEMA_MAT_TEMA1_idx` (`TEMA_IDTEMA` ASC) VISIBLE,
  INDEX `fk_BIB_MATERIAL_has_MAT_TEMA_BIB_MATERIAL1_idx` (`MATERIAL_IDMATERIAL` ASC) VISIBLE,
  CONSTRAINT `fk_BIB_MATERIAL_has_MAT_TEMA_BIB_MATERIAL1`
    FOREIGN KEY (`MATERIAL_IDMATERIAL`)
    REFERENCES `myholylib`.`BIB_MATERIAL` (`ID_MATERIAL`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BIB_MATERIAL_has_MAT_TEMA_MAT_TEMA1`
    FOREIGN KEY (`TEMA_IDTEMA`)
    REFERENCES `myholylib`.`BIB_TEMA` (`ID_TEMA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myholylib`.`BIB_MATERIAL_CREADOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `myholylib`.`BIB_MATERIAL_CREADOR` (
  `MATERIAL_IDMATERIAL` INT NOT NULL,
  `CREADOR_IDCREADOR` INT NOT NULL,
  PRIMARY KEY (`MATERIAL_IDMATERIAL`, `CREADOR_IDCREADOR`),
  INDEX `fk_BIB_MATERIAL_has_BIB_CREADOR_BIB_CREADOR1_idx` (`CREADOR_IDCREADOR` ASC) VISIBLE,
  INDEX `fk_BIB_MATERIAL_has_BIB_CREADOR_BIB_MATERIAL1_idx` (`MATERIAL_IDMATERIAL` ASC) VISIBLE,
  CONSTRAINT `fk_BIB_MATERIAL_has_BIB_CREADOR_BIB_MATERIAL1`
    FOREIGN KEY (`MATERIAL_IDMATERIAL`)
    REFERENCES `myholylib`.`BIB_MATERIAL` (`ID_MATERIAL`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BIB_MATERIAL_has_BIB_CREADOR_BIB_CREADOR1`
    FOREIGN KEY (`CREADOR_IDCREADOR`)
    REFERENCES `myholylib`.`BIB_CREADOR` (`ID_CREADOR`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
