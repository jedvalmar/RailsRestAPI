SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `control_alumnos` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `control_alumnos` ;

-- -----------------------------------------------------
-- Table `control_alumnos`.`centros`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `control_alumnos`.`centros` (
  `id_centro` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_centro`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `control_alumnos`.`carreras`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `control_alumnos`.`carreras` (
  `id_carrera` INT NOT NULL AUTO_INCREMENT ,
  `id_centro` INT NOT NULL ,
  `nombre` VARCHAR(45) NOT NULL ,
  `descripcion` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_carrera`, `id_centro`) ,
  INDEX `FK_centros_carreras` (`id_centro` ASC) ,
  CONSTRAINT `FK_centros_carreras`
    FOREIGN KEY (`id_centro` )
    REFERENCES `control_alumnos`.`centros` (`id_centro` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `control_alumnos`.`materias`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `control_alumnos`.`materias` (
  `id_materias` INT NOT NULL AUTO_INCREMENT ,
  `id_carrera` INT NOT NULL ,
  `materia` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_materias`, `id_carrera`) ,
  INDEX `fk_materias_carreras1` (`id_carrera` ASC) ,
  CONSTRAINT `fk_materias_carreras1`
    FOREIGN KEY (`id_carrera` )
    REFERENCES `control_alumnos`.`carreras` (`id_carrera` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `control_alumnos`.`prerrequisitos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `control_alumnos`.`prerrequisitos` (
  `id_prerrequisito` INT NOT NULL AUTO_INCREMENT ,
  `id_materias` INT NOT NULL ,
  `prerrequisito` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_prerrequisito`, `id_materias`) ,
  INDEX `fk_prerrequisitos_materias1` (`id_materias` ASC) ,
  CONSTRAINT `fk_prerrequisitos_materias1`
    FOREIGN KEY (`id_materias` )
    REFERENCES `control_alumnos`.`materias` (`id_materias` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `control_alumnos`.`periodos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `control_alumnos`.`periodos` (
  `id_periodo` INT NOT NULL ,
  `periodo` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_periodo`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `control_alumnos`.`tiposestatus`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `control_alumnos`.`tiposestatus` (
  `id_tiposestatus` INT NOT NULL AUTO_INCREMENT ,
  `tipoestatus` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_tiposestatus`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `control_alumnos`.`maestros`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `control_alumnos`.`maestros` (
  `id_maestro` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `apepat` VARCHAR(45) NOT NULL ,
  `apemat` VARCHAR(45) NOT NULL ,
  `domicilio` VARCHAR(45) NOT NULL ,
  `cp` INT NOT NULL ,
  `colonia` VARCHAR(45) NOT NULL ,
  `municipio` VARCHAR(45) NOT NULL ,
  `estado` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_maestro`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `control_alumnos`.`cursos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `control_alumnos`.`cursos` (
  `id_curso` INT NOT NULL AUTO_INCREMENT ,
  `id_materias` INT NOT NULL ,
  `id_maestro` INT NOT NULL ,
  `curso` VARCHAR(45) NOT NULL ,
  `id_periodo` INT NOT NULL ,
  `id_tiposestatus` INT NOT NULL ,
  PRIMARY KEY (`id_curso`, `id_materias`, `id_maestro`) ,
  INDEX `fk_cursos_periodos1` (`id_periodo` ASC) ,
  INDEX `fk_cursos_materias1` (`id_materias` ASC) ,
  INDEX `fk_cursos_tiposestatus1` (`id_tiposestatus` ASC) ,
  INDEX `fk_cursos_maestros1` (`id_maestro` ASC) ,
  CONSTRAINT `fk_cursos_periodos1`
    FOREIGN KEY (`id_periodo` )
    REFERENCES `control_alumnos`.`periodos` (`id_periodo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cursos_materias1`
    FOREIGN KEY (`id_materias` )
    REFERENCES `control_alumnos`.`materias` (`id_materias` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cursos_tiposestatus1`
    FOREIGN KEY (`id_tiposestatus` )
    REFERENCES `control_alumnos`.`tiposestatus` (`id_tiposestatus` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cursos_maestros1`
    FOREIGN KEY (`id_maestro` )
    REFERENCES `control_alumnos`.`maestros` (`id_maestro` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `control_alumnos`.`tiposusuarios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `control_alumnos`.`tiposusuarios` (
  `id_tipousuario` INT NOT NULL AUTO_INCREMENT ,
  `tipousuario` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_tipousuario`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `control_alumnos`.`usuarios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `control_alumnos`.`usuarios` (
  `id_usuario` INT NOT NULL ,
  `id_tipousuario` INT NOT NULL ,
  `nombre` VARCHAR(45) NOT NULL ,
  `contrasena` VARCHAR(45) NOT NULL ,
  `estatus` TINYINT NOT NULL ,
  PRIMARY KEY (`id_usuario`) ,
  INDEX `FK_usuario_tiposusuarios` (`id_tipousuario` ASC) ,
  CONSTRAINT `FK_usuario_tiposusuarios`
    FOREIGN KEY (`id_tipousuario` )
    REFERENCES `control_alumnos`.`tiposusuarios` (`id_tipousuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `control_alumnos`.`alumnos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `control_alumnos`.`alumnos` (
  `id_alumno` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `apepat` VARCHAR(45) NOT NULL ,
  `apemat` VARCHAR(45) NOT NULL ,
  `domicilio` VARCHAR(45) NOT NULL ,
  `cp` INT NOT NULL ,
  `colonia` VARCHAR(45) NOT NULL ,
  `municipio` VARCHAR(45) NOT NULL ,
  `estado` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_alumno`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `control_alumnos`.`cursosalumnos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `control_alumnos`.`cursosalumnos` (
  `id_cursoalumno` INT NOT NULL AUTO_INCREMENT ,
  `id_curso` INT NOT NULL ,
  `id_alumno` INT NOT NULL ,
  PRIMARY KEY (`id_cursoalumno`, `id_curso`, `id_alumno`) ,
  INDEX `fk_cursosalumnos_cursos1` (`id_curso` ASC) ,
  INDEX `fk_cursosalumnos_alumnos1` (`id_alumno` ASC) ,
  CONSTRAINT `fk_cursosalumnos_cursos1`
    FOREIGN KEY (`id_curso` )
    REFERENCES `control_alumnos`.`cursos` (`id_curso` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cursosalumnos_alumnos1`
    FOREIGN KEY (`id_alumno` )
    REFERENCES `control_alumnos`.`alumnos` (`id_alumno` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `control_alumnos`.`tiposcontactos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `control_alumnos`.`tiposcontactos` (
  `id_tipocontacto` INT NOT NULL ,
  `tipocontacto` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_tipocontacto`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `control_alumnos`.`contactosmts`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `control_alumnos`.`contactosmts` (
  `id_tipocontacto` INT NOT NULL ,
  `id_maestro` INT NOT NULL ,
  `contacto` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_tipocontacto`, `id_maestro`) ,
  INDEX `fk_contactosmts_maestros1` (`id_maestro` ASC) ,
  INDEX `fk_contactosmts_tiposcontactos1` (`id_tipocontacto` ASC) ,
  CONSTRAINT `fk_contactosmts_maestros1`
    FOREIGN KEY (`id_maestro` )
    REFERENCES `control_alumnos`.`maestros` (`id_maestro` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contactosmts_tiposcontactos1`
    FOREIGN KEY (`id_tipocontacto` )
    REFERENCES `control_alumnos`.`tiposcontactos` (`id_tipocontacto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `control_alumnos`.`contactosals`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `control_alumnos`.`contactosals` (
  `id_tipocontacto` INT NOT NULL ,
  `id_alumno` INT NOT NULL ,
  `contacto` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_tipocontacto`, `id_alumno`) ,
  INDEX `fk_contactosals_alumnos1` (`id_alumno` ASC) ,
  INDEX `fk_contactosals_tiposcontactos1` (`id_tipocontacto` ASC) ,
  CONSTRAINT `fk_contactosals_alumnos1`
    FOREIGN KEY (`id_alumno` )
    REFERENCES `control_alumnos`.`alumnos` (`id_alumno` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contactosals_tiposcontactos1`
    FOREIGN KEY (`id_tipocontacto` )
    REFERENCES `control_alumnos`.`tiposcontactos` (`id_tipocontacto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `control_alumnos`.`razones`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `control_alumnos`.`razones` (
  `id_razon` INT NOT NULL AUTO_INCREMENT ,
  `descripcion` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_razon`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `control_alumnos`.`parciales`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `control_alumnos`.`parciales` (
  `id_parcial` INT NOT NULL AUTO_INCREMENT ,
  `id_cursoalumno` INT NOT NULL ,
  `parcial` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_parcial`, `id_cursoalumno`) ,
  INDEX `fk_parciales_cursosalumnos1` (`id_cursoalumno` ASC) ,
  CONSTRAINT `fk_parciales_cursosalumnos1`
    FOREIGN KEY (`id_cursoalumno` )
    REFERENCES `control_alumnos`.`cursosalumnos` (`id_cursoalumno` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `control_alumnos`.`calificaciones`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `control_alumnos`.`calificaciones` (
  `id_calificacion` INT NOT NULL AUTO_INCREMENT ,
  `id_parcial` INT NOT NULL ,
  `calificacion` FLOAT NOT NULL ,
  `id_razon` INT NOT NULL ,
  PRIMARY KEY (`id_calificacion`, `id_parcial`) ,
  INDEX `fk_calificaciones_razones1` (`id_razon` ASC) ,
  INDEX `fk_calificaciones_parciales1` (`id_parcial` ASC) ,
  CONSTRAINT `fk_calificaciones_razones1`
    FOREIGN KEY (`id_razon` )
    REFERENCES `control_alumnos`.`razones` (`id_razon` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_calificaciones_parciales1`
    FOREIGN KEY (`id_parcial` )
    REFERENCES `control_alumnos`.`parciales` (`id_parcial` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
