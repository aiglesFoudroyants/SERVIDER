-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema ServiderBd
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ServiderBd
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ServiderBd` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `ServiderBd` ;

-- -----------------------------------------------------
-- Table `ServiderBd`.`Pays`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ServiderBd`.`Pays` (
  `idPays` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `sNomFr` VARCHAR(45) NOT NULL COMMENT '',
  `sNomEn` VARCHAR(45) NOT NULL COMMENT '',
  `sAbreviation` VARCHAR(10) NOT NULL COMMENT '',
  PRIMARY KEY (`idPays`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ServiderBd`.`Province`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ServiderBd`.`Province` (
  `idProvince` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `paysId` INT NOT NULL COMMENT '',
  `sNomFr` VARCHAR(45) NOT NULL COMMENT '',
  `sNomEn` VARCHAR(45) NOT NULL COMMENT '',
  `sAbreviation` VARCHAR(10) NOT NULL COMMENT '',
  PRIMARY KEY (`idProvince`)  COMMENT '',
  INDEX `fk_province_Pays1_idx` (`paysId` ASC)  COMMENT '',
  CONSTRAINT `fk_province_Pays1`
    FOREIGN KEY (`paysId`)
    REFERENCES `ServiderBd`.`Pays` (`idPays`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ServiderBd`.`StatusUtilisateur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ServiderBd`.`StatusUtilisateur` (
  `idStatusUtilisateur` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `sStatutFr` VARCHAR(45) NOT NULL COMMENT '',
  `sStatutEn` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`idStatusUtilisateur`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ServiderBd`.`Sexe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ServiderBd`.`Sexe` (
  `idSexe` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `sSexeFr` VARCHAR(45) NOT NULL COMMENT '',
  `sSexeEn` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`idSexe`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ServiderBd`.`Langue`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ServiderBd`.`Langue` (
  `idLangue` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `sLangueFr` VARCHAR(45) NOT NULL COMMENT '',
  `sLangueEn` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`idLangue`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ServiderBd`.`Utilisateur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ServiderBd`.`Utilisateur` (
  `idUtilisateur` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `paysId` INT NOT NULL COMMENT '',
  `provinceId` INT NOT NULL COMMENT '',
  `statusUtilisateurId` INT NOT NULL COMMENT '',
  `sexeId` INT NOT NULL COMMENT '',
  `langueId` INT NOT NULL COMMENT '',
  `sNomCompagnie` VARCHAR(45) NULL COMMENT '',
  `sNom` VARCHAR(45) NOT NULL COMMENT '',
  `sPrenom` VARCHAR(45) NOT NULL COMMENT '',
  `sPassword` VARCHAR(45) NOT NULL COMMENT '',
  `sCourriel` VARCHAR(45) NOT NULL COMMENT '',
  `bVerifCourriel` TINYINT(1) NOT NULL COMMENT '',
  `bVerifFacebook` TINYINT(1) NOT NULL COMMENT '',
  `bVerifLinkedIn` TINYINT(1) NOT NULL COMMENT '',
  `bVerifTwitter` TINYINT(1) NOT NULL COMMENT '',
  `sFacebook` VARCHAR(500) NULL COMMENT '',
  `sLinkedIn` VARCHAR(500) NULL COMMENT '',
  `sTwitter` VARCHAR(500) NULL COMMENT '',
  `sTelephone` VARCHAR(45) NULL COMMENT '',
  `sAdresse` VARCHAR(45) NULL COMMENT '',
  `sCodePostal` VARCHAR(10) NULL COMMENT '',
  `sVille` VARCHAR(45) NULL COMMENT '',
  `dLastConnected` DATETIME NULL COMMENT '',
  `dlRatingClient` DOUBLE NULL COMMENT '',
  `dlRatingService` DOUBLE NULL COMMENT '',
  `sCheminImgProfile` VARCHAR(255) NULL COMMENT '',
  `lDescription` LONGTEXT NULL COMMENT '',
  PRIMARY KEY (`idUtilisateur`)  COMMENT '',
  INDEX `fk_utilisateur_Pays1_idx` (`paysId` ASC)  COMMENT '',
  INDEX `fk_utilisateur_province1_idx` (`provinceId` ASC)  COMMENT '',
  INDEX `fk_Utilisateur_StatusUtilisateur1_idx` (`statusUtilisateurId` ASC)  COMMENT '',
  INDEX `fk_Utilisateur_Sexe1_idx` (`sexeId` ASC)  COMMENT '',
  INDEX `fk_Utilisateur_Langue1_idx` (`langueId` ASC)  COMMENT '',
  CONSTRAINT `fk_utilisateur_Pays1`
    FOREIGN KEY (`paysId`)
    REFERENCES `ServiderBd`.`Pays` (`idPays`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_utilisateur_province1`
    FOREIGN KEY (`provinceId`)
    REFERENCES `ServiderBd`.`Province` (`idProvince`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Utilisateur_StatusUtilisateur1`
    FOREIGN KEY (`statusUtilisateurId`)
    REFERENCES `ServiderBd`.`StatusUtilisateur` (`idStatusUtilisateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Utilisateur_Sexe1`
    FOREIGN KEY (`sexeId`)
    REFERENCES `ServiderBd`.`Sexe` (`idSexe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Utilisateur_Langue1`
    FOREIGN KEY (`langueId`)
    REFERENCES `ServiderBd`.`Langue` (`idLangue`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ServiderBd`.`TypeService`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ServiderBd`.`TypeService` (
  `idTypeService` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `sTypeFr` VARCHAR(45) NOT NULL COMMENT '',
  `sTypeEn` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`idTypeService`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ServiderBd`.`Service`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ServiderBd`.`Service` (
  `idService` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `utilisateurId` INT NOT NULL COMMENT '',
  `typeServiceId` INT NOT NULL COMMENT '',
  `bActif` TINYINT(1) NOT NULL COMMENT '',
  PRIMARY KEY (`idService`)  COMMENT '',
  INDEX `fk_Service_Utilisateur1_idx` (`utilisateurId` ASC)  COMMENT '',
  INDEX `fk_Service_TypeService1_idx` (`typeServiceId` ASC)  COMMENT '',
  CONSTRAINT `fk_Service_Utilisateur1`
    FOREIGN KEY (`utilisateurId`)
    REFERENCES `ServiderBd`.`Utilisateur` (`idUtilisateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Service_TypeService1`
    FOREIGN KEY (`typeServiceId`)
    REFERENCES `ServiderBd`.`TypeService` (`idTypeService`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ServiderBd`.`Annonce`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ServiderBd`.`Annonce` (
  `idAnnonce` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `serviceId` INT NOT NULL COMMENT '',
  `utilisateurId` INT NOT NULL COMMENT '',
  `bActif` TINYINT(1) NOT NULL COMMENT '',
  `sDescription` VARCHAR(45) NULL COMMENT '',
  `sTarif` VARCHAR(45) NULL COMMENT '',
  `sAddresse` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`idAnnonce`)  COMMENT '',
  INDEX `fk_serviceUtilisateur_utilisateur1_idx` (`utilisateurId` ASC)  COMMENT '',
  INDEX `fk_Annonce_Service1_idx` (`serviceId` ASC)  COMMENT '',
  CONSTRAINT `fk_serviceUtilisateur_utilisateur1`
    FOREIGN KEY (`utilisateurId`)
    REFERENCES `ServiderBd`.`Utilisateur` (`idUtilisateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Annonce_Service1`
    FOREIGN KEY (`serviceId`)
    REFERENCES `ServiderBd`.`Service` (`idService`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ServiderBd`.`StatusContrat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ServiderBd`.`StatusContrat` (
  `idStatusContrat` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `sStatutFr` VARCHAR(45) NOT NULL COMMENT '',
  `sStatutEn` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`idStatusContrat`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ServiderBd`.`Commentaire`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ServiderBd`.`Commentaire` (
  `idCommentaire` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `receveurId` INT NOT NULL COMMENT '',
  `commentateurId` INT NOT NULL COMMENT '',
  `typeServiceId` INT NOT NULL COMMENT '',
  `bReceveurClientOuService` TINYINT(1) NOT NULL COMMENT '',
  `lCommentaire` LONGTEXT NOT NULL COMMENT '',
  `lReponse` LONGTEXT NULL COMMENT '',
  `lPrive` LONGTEXT NULL COMMENT '',
  `iCritere1` INT NOT NULL COMMENT '',
  `iCritere2` INT NOT NULL COMMENT '',
  `iCritere3` INT NOT NULL COMMENT '',
  `dlCritereAvg` DOUBLE NOT NULL COMMENT '',
  `bRecommendation` TINYINT(1) NOT NULL COMMENT '',
  `dDateCommentaire` DATETIME NOT NULL COMMENT '',
  PRIMARY KEY (`idCommentaire`)  COMMENT '',
  INDEX `fk_Commentaire_Utilisateur1_idx` (`receveurId` ASC)  COMMENT '',
  INDEX `fk_Commentaire_Utilisateur2_idx` (`commentateurId` ASC)  COMMENT '',
  INDEX `fk_Commentaire_TypeService1_idx` (`typeServiceId` ASC)  COMMENT '',
  CONSTRAINT `fk_Commentaire_Utilisateur1`
    FOREIGN KEY (`receveurId`)
    REFERENCES `ServiderBd`.`Utilisateur` (`idUtilisateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Commentaire_Utilisateur2`
    FOREIGN KEY (`commentateurId`)
    REFERENCES `ServiderBd`.`Utilisateur` (`idUtilisateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Commentaire_TypeService1`
    FOREIGN KEY (`typeServiceId`)
    REFERENCES `ServiderBd`.`TypeService` (`idTypeService`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ServiderBd`.`Contrat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ServiderBd`.`Contrat` (
  `idContrat` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `clientId` INT NOT NULL COMMENT '',
  `annonceurId` INT NOT NULL COMMENT '',
  `annonceId` INT NOT NULL COMMENT '',
  `statusContratId` INT NOT NULL COMMENT '',
  `commentaireAuClientId` INT NULL COMMENT '',
  `commentaireAuServiceId` INT NULL COMMENT '',
  `dlPrixEstime` DOUBLE NULL COMMENT '',
  `dDateProposition` DATETIME NULL COMMENT '',
  `dDateAcceptation` DATETIME NULL COMMENT '',
  `dHeureDebut` DATETIME NULL COMMENT '',
  `dHeureFin` DATETIME NULL COMMENT '',
  PRIMARY KEY (`idContrat`)  COMMENT '',
  INDEX `fk_Contrat_serviceUtilisateur1_idx` (`annonceId` ASC)  COMMENT '',
  INDEX `fk_Contrat_utilisateur1_idx` (`clientId` ASC)  COMMENT '',
  INDEX `fk_Contrat_StatusContrat1_idx` (`statusContratId` ASC)  COMMENT '',
  INDEX `fk_Contrat_Commentaire1_idx` (`commentaireAuClientId` ASC)  COMMENT '',
  INDEX `fk_Contrat_Commentaire2_idx` (`commentaireAuServiceId` ASC)  COMMENT '',
  CONSTRAINT `fk_Contrat_serviceUtilisateur1`
    FOREIGN KEY (`annonceId`)
    REFERENCES `ServiderBd`.`Annonce` (`idAnnonce`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Contrat_utilisateur1`
    FOREIGN KEY (`clientId`)
    REFERENCES `ServiderBd`.`Utilisateur` (`idUtilisateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Contrat_StatusContrat1`
    FOREIGN KEY (`statusContratId`)
    REFERENCES `ServiderBd`.`StatusContrat` (`idStatusContrat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Contrat_Commentaire1`
    FOREIGN KEY (`commentaireAuClientId`)
    REFERENCES `ServiderBd`.`Commentaire` (`idCommentaire`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Contrat_Commentaire2`
    FOREIGN KEY (`commentaireAuServiceId`)
    REFERENCES `ServiderBd`.`Commentaire` (`idCommentaire`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ServiderBd`.`ville`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ServiderBd`.`ville` (
  `idville` INT NOT NULL COMMENT '',
  `nom` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`idville`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ServiderBd`.`Indisponibilite`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ServiderBd`.`Indisponibilite` (
  `idDisponibilite` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `annonceId` INT NOT NULL COMMENT '',
  `dHeureDebut` DATETIME NOT NULL COMMENT '',
  `dHeureFin` DATETIME NOT NULL COMMENT '',
  `bReserve` TINYINT(1) NOT NULL COMMENT '',
  PRIMARY KEY (`idDisponibilite`)  COMMENT '',
  INDEX `fk_Disponibilite_ContratUtilisateur1_idx` (`annonceId` ASC)  COMMENT '',
  CONSTRAINT `fk_Disponibilite_ContratUtilisateur1`
    FOREIGN KEY (`annonceId`)
    REFERENCES `ServiderBd`.`Annonce` (`idAnnonce`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ServiderBd`.`message`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ServiderBd`.`message` (
  `idMessage` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `envoyeurId` INT NOT NULL COMMENT '',
  `receveurId` INT NOT NULL COMMENT '',
  `contratId` INT NOT NULL COMMENT '',
  `bVisible` TINYINT(1) NOT NULL COMMENT '',
  `sContenu` LONGTEXT NULL COMMENT '',
  `dEnvoie` DATETIME NULL COMMENT '',
  PRIMARY KEY (`idMessage`)  COMMENT '',
  INDEX `fk_message_Utilisateur1_idx` (`envoyeurId` ASC)  COMMENT '',
  INDEX `fk_message_Contrat1_idx` (`contratId` ASC)  COMMENT '',
  INDEX `fk_message_Utilisateur2_idx` (`receveurId` ASC)  COMMENT '',
  CONSTRAINT `fk_message_Utilisateur1`
    FOREIGN KEY (`envoyeurId`)
    REFERENCES `ServiderBd`.`Utilisateur` (`idUtilisateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_message_Contrat1`
    FOREIGN KEY (`contratId`)
    REFERENCES `ServiderBd`.`Contrat` (`idContrat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_message_Utilisateur2`
    FOREIGN KEY (`receveurId`)
    REFERENCES `ServiderBd`.`Utilisateur` (`idUtilisateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `ServiderBd`;

DELIMITER $$
USE `ServiderBd`$$
CREATE DEFINER = CURRENT_USER TRIGGER `ServiderBd`.`Utilisateur_BEFORE_UPDATE` BEFORE UPDATE ON `Utilisateur` FOR EACH ROW
BEGIN
	if new.statusUtilisateurId = 2 then
		set new.dLastConnected = sysdate();
    end if;
END
$$

USE `ServiderBd`$$
CREATE DEFINER = CURRENT_USER TRIGGER `ServiderBd`.`Commentaire_AFTER_INSERT` AFTER INSERT ON `Commentaire` FOR EACH ROW
BEGIN
	if new.bReceveurClientOuService then
		update utilisateur 
		set dlRatingClient = 
		(select avg(dlCritereAvg)
		from commentaire
		where commentaire.receveurId = new.receveurId and
		commentaire.bReceveurClientOuService = new.bReceveurClientOuService)
        where utilisateur.idUtilisateur = new.receveurId;
	else
		update utilisateur 
		set dlRatingService = 
		(select avg(dlCritereAvg)
		from commentaire
		where commentaire.receveurId = new.receveurId and
		commentaire.bReceveurClientOuService = new.bReceveurClientOuService)
        where utilisateur.idUtilisateur = new.receveurId;
	end if;
END
$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
