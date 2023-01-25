-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema PSP
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `PSP` ;

-- -----------------------------------------------------
-- Schema PSP
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PSP` DEFAULT CHARACTER SET utf8 ;
USE `PSP` ;

-- -----------------------------------------------------
-- Table `PSP`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PSP`.`user` ;

CREATE TABLE IF NOT EXISTS `PSP`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `image` VARCHAR(100) NULL,
  `country` VARCHAR(45) NULL,
  `description` VARCHAR(240) NULL,
  `last_login` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `user_UNIQUE` (`user` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PSP`.`stadistics`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PSP`.`stadistics` ;

CREATE TABLE IF NOT EXISTS `PSP`.`stadistics` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `losses` INT NOT NULL,
  `victories` INT NOT NULL,
  `hours` DOUBLE NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`, `user_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_stadistics_user_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_stadistics_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `PSP`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PSP`.`party`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PSP`.`party` ;

CREATE TABLE IF NOT EXISTS `PSP`.`party` (
  `id` INT NOT NULL,
  `winner` INT NOT NULL,
  `date` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PSP`.`user_has_party`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PSP`.`user_has_party` ;

CREATE TABLE IF NOT EXISTS `PSP`.`user_has_party` (
  `user_id` INT NOT NULL,
  `party_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `party_id`),
  INDEX `fk_user_has_party_party1_idx` (`party_id` ASC) VISIBLE,
  INDEX `fk_user_has_party_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_party_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `PSP`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_party_party1`
    FOREIGN KEY (`party_id`)
    REFERENCES `PSP`.`party` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PSP`.`turn`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PSP`.`turn` ;

CREATE TABLE IF NOT EXISTS `PSP`.`turn` (
  `id` INT NOT NULL,
  `player` VARCHAR(45) NOT NULL,
  `next` INT NULL,
  `party_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `end` TINYINT NOT NULL,
  PRIMARY KEY (`id`, `party_id`),
  INDEX `fk_turno_party1_idx` (`party_id` ASC) VISIBLE,
  INDEX `fk_turno_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_turno_party1`
    FOREIGN KEY (`party_id`)
    REFERENCES `PSP`.`party` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_turno_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `PSP`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PSP`.`token`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PSP`.`token` ;

CREATE TABLE IF NOT EXISTS `PSP`.`token` (
  `id` INT NOT NULL,
  `token` VARCHAR(200) NULL,
  `caducity` TIMESTAMP NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`, `user_id`),
  INDEX `fk_token_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_token_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `PSP`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
