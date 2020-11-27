drop database ac03Nicolas;

create database ac03Nicolas;
use ac03Nicolas;


-- Tabela Planeta
create table Planeta (
idPlaneta int primary key auto_increment,
nomePlaneta varchar (45),
especie varchar (45)
);
select * from Planeta;


-- Tabela Raça
create table Raça (
idRaca int primary key auto_increment,
nomeEspecie varchar (40),
nomeAlien varchar (45),
caracteristica_fisica varchar (45),
habilidade varchar (45),
fkPlaneta int,
foreign key (fkPlaneta) references ,
  INDEX `fk_Raça_Planeta_idx` (`fkPlaneta` ASC) VISIBLE,
  CONSTRAINT `fk_Raça_Planeta`
    FOREIGN KEY (`fkPlaneta`)
    REFERENCES `mydb`.`Planeta` (`idPlaneta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Omnitrix`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Omnitrix` (
  `idOmnitrix` INT NOT NULL,
  `usuarios` VARCHAR(45) NULL,
  `tecnologia` VARCHAR(45) NULL,
  PRIMARY KEY (`idOmnitrix`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Transporte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Transporte` (
  `idCaminhao` INT NOT NULL,
  `carga` VARCHAR(45) NULL,
  `qtd_carga` INT NULL,
  PRIMARY KEY (`idCaminhao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Sorveteria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Sorveteria` (
  `idSorveteria` INT NOT NULL,
  `sabores` VARCHAR(45) NULL,
  `preco` INT NULL,
  `fkCaminhao` INT NOT NULL,
  PRIMARY KEY (`idSorveteria`, `fkCaminhao`),
  INDEX `fk_Sorveteria_Transporte1_idx` (`fkCaminhao` ASC) VISIBLE,
  CONSTRAINT `fk_Sorveteria_Transporte1`
    FOREIGN KEY (`fkCaminhao`)
    REFERENCES `mydb`.`Transporte` (`idCaminhao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `idCliente` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `senha_pedido` VARCHAR(45) NULL,
  `idade` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Sorveteria_has_Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Sorveteria_has_Cliente` (
  `fkSorveteria` INT NOT NULL,
  `fkCliente` INT NOT NULL,
  `mesa` VARCHAR(45) NULL,
  `pedido` VARCHAR(45) NULL,
  PRIMARY KEY (`fkSorveteria`, `fkCliente`),
  INDEX `fk_Sorveteria_has_Cliente_Cliente1_idx` (`fkCliente` ASC) VISIBLE,
  INDEX `fk_Sorveteria_has_Cliente_Sorveteria1_idx` (`fkSorveteria` ASC) VISIBLE,
  CONSTRAINT `fk_Sorveteria_has_Cliente_Sorveteria1`
    FOREIGN KEY (`fkSorveteria`)
    REFERENCES `mydb`.`Sorveteria` (`idSorveteria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sorveteria_has_Cliente_Cliente1`
    FOREIGN KEY (`fkCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
