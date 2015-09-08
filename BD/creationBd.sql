-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;


-- -----------------------------------------------------
-- Table `mydb`.`Pays`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pays` (
  `idPays` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `sNom` VARCHAR(45) NOT NULL COMMENT '',
  `sAbreviation` VARCHAR(10) NOT NULL COMMENT '',
  PRIMARY KEY (`idPays`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Province`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Province` (
  `idProvince` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `paysId` INT NOT NULL COMMENT '',
  `sNom` VARCHAR(45) NOT NULL COMMENT '',
  `sAbreviation` VARCHAR(10) NOT NULL COMMENT '',
  PRIMARY KEY (`idProvince`)  COMMENT '',
  INDEX `fk_province_Pays1_idx` (`paysId` ASC)  COMMENT '',
  CONSTRAINT `fk_province_Pays1`
    FOREIGN KEY (`paysId`)
    REFERENCES `mydb`.`Pays` (`idPays`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`StatusUtilisateur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`StatusUtilisateur` (
  `idStatusUtilisateur` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `sTitre` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`idStatusUtilisateur`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Utilisateur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Utilisateur` (
  `idUtilisateur` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `paysId` INT NOT NULL COMMENT '',
  `provinceId` INT NOT NULL COMMENT '',
  `statusUtilisateurId` INT NOT NULL COMMENT '',
  `sNom` VARCHAR(45) NOT NULL COMMENT '',
  `sPrenom` VARCHAR(45) NOT NULL COMMENT '',
  `sPassword` VARCHAR(45) NOT NULL COMMENT '',
  `sCourriel` VARCHAR(45) NOT NULL COMMENT '',
  `sTelephone` VARCHAR(45) NULL COMMENT '',
  `sAdresse` VARCHAR(45) NULL COMMENT '',
  `sCodePostal` VARCHAR(6) NULL COMMENT '',
  `sVille` VARCHAR(45) NULL COMMENT '',
  `dlRating` DOUBLE NULL COMMENT '',
  PRIMARY KEY (`idUtilisateur`)  COMMENT '',
  INDEX `fk_utilisateur_Pays1_idx` (`paysId` ASC)  COMMENT '',
  INDEX `fk_utilisateur_province1_idx` (`provinceId` ASC)  COMMENT '',
  INDEX `fk_Utilisateur_StatusUtilisateur1_idx` (`statusUtilisateurId` ASC)  COMMENT '',
  CONSTRAINT `fk_utilisateur_Pays1`
    FOREIGN KEY (`paysId`)
    REFERENCES `mydb`.`Pays` (`idPays`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_utilisateur_province1`
    FOREIGN KEY (`provinceId`)
    REFERENCES `mydb`.`Province` (`idProvince`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Utilisateur_StatusUtilisateur1`
    FOREIGN KEY (`statusUtilisateurId`)
    REFERENCES `mydb`.`StatusUtilisateur` (`idStatusUtilisateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TypeService`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TypeService` (
  `idTypeService` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `sTitre` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`idTypeService`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Annonce`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Annonce` (
  `idAnnonce` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `typeServiceId` INT NOT NULL COMMENT '',
  `utilisateurId` INT NOT NULL COMMENT '',
  `sDescription` VARCHAR(45) NULL COMMENT '',
  `sTarif` VARCHAR(45) NULL COMMENT '',
  `sAddresse` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`idAnnonce`)  COMMENT '',
  INDEX `fk_serviceUtilisateur_typeService1_idx` (`typeServiceId` ASC)  COMMENT '',
  INDEX `fk_serviceUtilisateur_utilisateur1_idx` (`utilisateurId` ASC)  COMMENT '',
  CONSTRAINT `fk_serviceUtilisateur_typeService1`
    FOREIGN KEY (`typeServiceId`)
    REFERENCES `mydb`.`TypeService` (`idTypeService`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_serviceUtilisateur_utilisateur1`
    FOREIGN KEY (`utilisateurId`)
    REFERENCES `mydb`.`Utilisateur` (`idUtilisateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`StatusContrat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`StatusContrat` (
  `idStatusContrat` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `sTitre` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`idStatusContrat`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Contrat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Contrat` (
  `idContrat` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `utilisateurId` INT NOT NULL COMMENT '',
  `annonceId` INT NOT NULL COMMENT '',
  `statusContratId` INT NOT NULL COMMENT '',
  `dlPrixEstime` DOUBLE NULL COMMENT '',
  `dDateProposition` DATETIME NULL COMMENT '',
  `dDateAcceptation` DATETIME NULL COMMENT '',
  `lCutilContenu` LONGTEXT NULL COMMENT '',
  `lCutilPrive` LONGTEXT NULL COMMENT '',
  `lCutilReponse` LONGTEXT NULL COMMENT '',
  `iCutilRespectEngagement` INT NULL COMMENT '',
  `iCutilPonctualite` INT NULL COMMENT '',
  `iCutilCommunication` INT NULL COMMENT '',
  `eCutilRecommandation` ENUM('oui', 'non') NULL COMMENT '',
  `dCutilDate` DATETIME NULL COMMENT '',
  `lCserviceContenu` LONGTEXT NULL COMMENT '',
  `lCservicePrive` LONGTEXT NULL COMMENT '',
  `lCserviceReponse` LONGTEXT NULL COMMENT '',
  `iCserviceQualite` INT NULL COMMENT '',
  `iCservicePonctualite` INT NULL COMMENT '',
  `iCserviceCommunication` INT NULL COMMENT '',
  `eCserviceRecommandation` ENUM('oui', 'non') NULL COMMENT '',
  PRIMARY KEY (`idContrat`)  COMMENT '',
  INDEX `fk_Contrat_serviceUtilisateur1_idx` (`annonceId` ASC)  COMMENT '',
  INDEX `fk_Contrat_utilisateur1_idx` (`utilisateurId` ASC)  COMMENT '',
  INDEX `fk_Contrat_StatusContrat1_idx` (`statusContratId` ASC)  COMMENT '',
  CONSTRAINT `fk_Contrat_serviceUtilisateur1`
    FOREIGN KEY (`annonceId`)
    REFERENCES `mydb`.`Annonce` (`idAnnonce`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Contrat_utilisateur1`
    FOREIGN KEY (`utilisateurId`)
    REFERENCES `mydb`.`Utilisateur` (`idUtilisateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Contrat_StatusContrat1`
    FOREIGN KEY (`statusContratId`)
    REFERENCES `mydb`.`StatusContrat` (`idStatusContrat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CommentaireUtilisateur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CommentaireUtilisateur` (
  `idcommentaireUtilisateur` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `Contrat_idContrat` INT NOT NULL COMMENT '',
  `respectEngagement` VARCHAR(45) NOT NULL COMMENT '',
  `ponctualite` VARCHAR(45) NOT NULL COMMENT '',
  `communication` VARCHAR(45) NOT NULL COMMENT '',
  `reconmander` TINYINT(1) NOT NULL COMMENT '',
  PRIMARY KEY (`idcommentaireUtilisateur`)  COMMENT '',
  INDEX `fk_commentaireUtilisateur_Contrat_idx` (`Contrat_idContrat` ASC)  COMMENT '',
  CONSTRAINT `fk_commentaireUtilisateur_Contrat`
    FOREIGN KEY (`Contrat_idContrat`)
    REFERENCES `mydb`.`Contrat` (`idContrat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CommentaireService`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CommentaireService` (
  `idcommentaireService` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `Contrat_idContrat` INT NOT NULL COMMENT '',
  `qualite` VARCHAR(45) NOT NULL COMMENT '',
  `ponctualite` VARCHAR(45) NOT NULL COMMENT '',
  `communication` VARCHAR(45) NOT NULL COMMENT '',
  `recommander` TINYINT(1) NOT NULL COMMENT '',
  PRIMARY KEY (`idcommentaireService`)  COMMENT '',
  INDEX `fk_commentaireService_Contrat1_idx` (`Contrat_idContrat` ASC)  COMMENT '',
  CONSTRAINT `fk_commentaireService_Contrat1`
    FOREIGN KEY (`Contrat_idContrat`)
    REFERENCES `mydb`.`Contrat` (`idContrat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ville`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ville` (
  `idville` INT NOT NULL COMMENT '',
  `nom` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`idville`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Disponibilite`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Disponibilite` (
  `idDisponibilite` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `annonceId` INT NOT NULL COMMENT '',
  `dHeureDebut` DATETIME NOT NULL COMMENT '',
  `dHeureFin` DATETIME NOT NULL COMMENT '',
  `eType` ENUM('Indisponible', 'Réservé') NULL COMMENT '',
  PRIMARY KEY (`idDisponibilite`)  COMMENT '',
  INDEX `fk_Disponibilite_ContratUtilisateur1_idx` (`annonceId` ASC)  COMMENT '',
  CONSTRAINT `fk_Disponibilite_ContratUtilisateur1`
    FOREIGN KEY (`annonceId`)
    REFERENCES `mydb`.`Annonce` (`idAnnonce`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`message`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`message` (
  `idMessage` INT NOT NULL COMMENT '',
  `utilisateurId` INT NOT NULL COMMENT '',
  `contratId` INT NOT NULL COMMENT '',
  `sContenu` LONGTEXT NULL COMMENT '',
  `dEnvoie` DATETIME NULL COMMENT '',
  PRIMARY KEY (`idMessage`)  COMMENT '',
  INDEX `fk_message_Utilisateur1_idx` (`utilisateurId` ASC)  COMMENT '',
  INDEX `fk_message_Contrat1_idx` (`contratId` ASC)  COMMENT '',
  CONSTRAINT `fk_message_Utilisateur1`
    FOREIGN KEY (`utilisateurId`)
    REFERENCES `mydb`.`Utilisateur` (`idUtilisateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_message_Contrat1`
    FOREIGN KEY (`contratId`)
    REFERENCES `mydb`.`Contrat` (`idContrat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
