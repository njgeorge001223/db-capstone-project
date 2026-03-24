-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema little_lemon_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema little_lemon_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `little_lemon_db` DEFAULT CHARACTER SET utf8 ;
USE `little_lemon_db` ;

-- -----------------------------------------------------
-- Table `little_lemon_db`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`customers` (
  `customer_id` INT NOT NULL,
  `full_name` VARCHAR(255) NOT NULL,
  `contact_number` VARCHAR(45) NOT NULL,
  `email` VARCHAR(255) NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`staff` (
  `staff_id` INT NOT NULL,
  `full_name` VARCHAR(255) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  `salary` DECIMAL NOT NULL,
  PRIMARY KEY (`staff_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`bookings` (
  `booking_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `booking_date` DATE NOT NULL,
  `table_number` INT NOT NULL,
  PRIMARY KEY (`booking_id`),
  INDEX `fk_customers_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_bookings_customers`
    FOREIGN KEY (`customer_id`)
    REFERENCES `little_lemon_db`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`menu_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`menu_items` (
  `menu_items_id` INT NOT NULL,
  `course_name` VARCHAR(45) NOT NULL,
  `starter_name` VARCHAR(45) NOT NULL,
  `dessert_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`menu_items_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`menus` (
  `menu_id` INT NOT NULL,
  `menu_items_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `cuisine` VARCHAR(45) NOT NULL,
  `price` DECIMAL NOT NULL,
  PRIMARY KEY (`menu_id`),
  INDEX `fk_menu_items_idx` (`menu_items_id` ASC) VISIBLE,
  CONSTRAINT `fk_menus_menu_items1`
    FOREIGN KEY (`menu_items_id`)
    REFERENCES `little_lemon_db`.`menu_items` (`menu_items_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`orders` (
  `order_id` INT NOT NULL,
  `booking_id` INT NOT NULL,
  `menu_id` INT NOT NULL,
  `order_date` DATE NOT NULL,
  `quantity` INT NOT NULL,
  `total_cost` DECIMAL NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `fk_bookings_idx` (`booking_id` ASC) VISIBLE,
  INDEX `fk_menu_idx` (`menu_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_bookings1`
    FOREIGN KEY (`booking_id`)
    REFERENCES `little_lemon_db`.`bookings` (`booking_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_menu1`
    FOREIGN KEY (`menu_id`)
    REFERENCES `little_lemon_db`.`menus` (`menu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`order_delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`order_delivery` (
  `delivery_id` INT NOT NULL,
  `order_id` INT NOT NULL,
  `delivery_date` DATE NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`delivery_id`),
  INDEX `fk_orders_idx` (`order_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_delivery_orders1`
    FOREIGN KEY (`order_id`)
    REFERENCES `little_lemon_db`.`orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
