-- MySQL Workbe... *** SQLINES FOR EVALUATION USE ONLY *** 

/* SQLINES EVALUATION VERSION TRUNCATES VARIABLE NAMES AND COMMENTS. */
/* OBTAIN A LICENSE AT WWW.SQLINES.COM FOR FULL CONVERSION. THANK YOU. */

/* SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0; */
/* SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0; */
/* SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES'; */

-- ------------... *** SQLINES FOR EVALUATION USE ONLY *** 
-- Schema Servi... *** SQLINES FOR EVALUATION USE ONLY *** 
-- ------------... *** SQLINES FOR EVALUATION USE ONLY *** 

-- ------------... *** SQLINES FOR EVALUATION USE ONLY *** 
-- Schema Servi... *** SQLINES FOR EVALUATION USE ONLY *** 
-- ------------... *** SQLINES FOR EVALUATION USE ONLY *** 
CREATE USER ServiderBd IDENTIFIED BY ServiderBd /* DEFAULT CHARACTER SET utf8 */ /* COLLATE utf8_general_ci */ ;
ALTER SESSION SET CURRENT_SCHEMA = ServiderBd ;

-- ------------... *** SQLINES FOR EVALUATION USE ONLY *** 
-- Table `Servi... *** SQLINES FOR EVALUATION USE ONLY *** 
-- ------------... *** SQLINES FOR EVALUATION USE ONLY *** 
CREATE TABLE ServiderBd.Pays (
  idPays NUMBER(10) NOT NULL ,
  sNomFr VARCHAR2(45) NOT NULL ,
  sNomEn VARCHAR2(45) NOT NULL ,
  sAbreviation VARCHAR2(10) NOT NULL ,
  PRIMARY KEY (idPays)  COMMENT '')
ENGINE = InnoDB;


-- ------------... *** SQLINES FOR EVALUATION USE ONLY *** 
-- Table `Servi... *** SQLINES FOR EVALUATION USE ONLY *** 
-- ------------... *** SQLINES FOR EVALUATION USE ONLY *** 
CREATE TABLE ServiderBd.Province (
  idProvince NUMBER(10) NOT NULL ,
  paysId NUMBER(10) NOT NULL ,
  sNomFr VARCHAR2(45) NOT NULL ,
  sNomEn VARCHAR2(45) NOT NULL ,
  sAbreviation VARCHAR2(10) NOT NULL ,
  PRIMARY KEY (idProvince)  COMMENT '',
  INDEX `fk_province_Pays1_idx` (paysId ASC)  COMMENT '',
  CONSTRAINT fk_province_Pays1
    FOREIGN KEY (paysId)
    REFERENCES `ServiderBd`.`Pays` (idPays)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- ------------... *** SQLINES FOR EVALUATION USE ONLY *** 
-- Table `Servi... *** SQLINES FOR EVALUATION USE ONLY *** 
-- ------------... *** SQLINES FOR EVALUATION USE ONLY *** 
CREATE TABLE ServiderBd.StatusUtilisateur (
  idStatusUtilisateur NUMBER(10) NOT NULL ,
  sStatutFr VARCHAR2(45) NOT NULL ,
  sStatutEn VARCHAR2(45) NOT NULL ,
  PRIMARY KEY (idStatusUtilisateur)  COMMENT '')
ENGINE = InnoDB;


-- ------------... *** SQLINES FOR EVALUATION USE ONLY *** 
-- Table `Servi... *** SQLINES FOR EVALUATION USE ONLY *** 
-- ------------... *** SQLINES FOR EVALUATION USE ONLY *** 
CREATE TABLE ServiderBd.Sexe (
  idSexe NUMBER(10) NOT NULL ,
  sSexeFr VARCHAR2(45) NOT NULL ,
  sSexeEn VARCHAR2(45) NOT NULL ,
  PRIMARY KEY (idSexe)  COMMENT '')
ENGINE = InnoDB;


-- ------------... *** SQLINES FOR EVALUATION USE ONLY *** 
-- Table `Servi... *** SQLINES FOR EVALUATION USE ONLY *** 
-- ------------... *** SQLINES FOR EVALUATION USE ONLY *** 
CREATE TABLE ServiderBd.Langue (
  idLangue NUMBER(10) NOT NULL ,
  sLangueFr VARCHAR2(45) NOT NULL ,
  sLangueEn VARCHAR2(45) NOT NULL ,
  PRIMARY KEY (idLangue)  COMMENT '')
ENGINE = InnoDB;


-- ------------... *** SQLINES FOR EVALUATION USE ONLY *** 
-- Table `Servi... *** SQLINES FOR EVALUATION USE ONLY *** 
-- ------------... *** SQLINES FOR EVALUATION USE ONLY *** 
CREATE TABLE ServiderBd.Utilisateur (
  idUtilisateur NUMBER(10) NOT NULL ,
  paysId NUMBER(10) NOT NULL ,
  provinceId NUMBER(10) NOT NULL ,
  statusUtilisateurId NUMBER(10) NOT NULL ,
  sexeId NUMBER(10) NOT NULL ,
  langueId NUMBER(10) NOT NULL ,
  sNomCompagnie VARCHAR2(45) NULL ,
  sNom VARCHAR2(45) NOT NULL ,
  sPrenom VARCHAR2(45) NOT NULL ,
  sPassword VARCHAR2(45) NOT NULL ,
  sCourriel VARCHAR2(45) NOT NULL ,
  bVerifCourriel NUMBER(3) NOT NULL ,
  bVerifFacebook NUMBER(3) NOT NULL ,
  bVerifLinkedIn NUMBER(3) NOT NULL ,
  bVerifTwitter NUMBER(3) NOT NULL ,
  sFacebook VARCHAR2(500) NULL ,
  sLinkedIn VARCHAR2(500) NULL ,
  sTwitter VARCHAR2(500) NULL ,
  sTelephone VARCHAR2(45) NULL ,
  sAdresse VARCHAR2(45) NULL ,
  sCodePostal VARCHAR2(10) NULL ,
  sVille VARCHAR2(45) NULL ,
  dLastConnected TIMESTAMP(0) NULL ,
  dlRatingClient BINARY_DOUBLE NULL ,
  dlRatingService BINARY_DOUBLE NULL ,
  sCheminImgProfile VARCHAR2(255) NULL ,
  lDescription CLOB NULL ,
  PRIMARY KEY (idUtilisateur)  COMMENT '',
  INDEX `fk_utilisateur_Pays1_idx` (paysId ASC)  COMMENT '',
  INDEX `fk_utilisateur_province1_idx` (provinceId ASC)  COMMENT '',
  INDEX `fk_Utilisateur_StatusUtilisateur1_idx` (statusUtilisateurId ASC)  COMMENT '',
  INDEX `fk_Utilisateur_Sexe1_idx` (sexeId ASC)  COMMENT '',
  INDEX `fk_Utilisateur_Langue1_idx` (langueId ASC)  COMMENT '',
  CONSTRAINT fk_utilisateur_Pays1
    FOREIGN KEY (paysId)
    REFERENCES `ServiderBd`.`Pays` (idPays)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_utilisateur_province1
    FOREIGN KEY (provinceId)
    REFERENCES `ServiderBd`.`Province` (idProvince)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Utilisateur_StatusUtilisateur1
    FOREIGN KEY (statusUtilisateurId)
    REFERENCES `ServiderBd`.`StatusUtilisateur` (idStatusUtilisateur)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Utilisateur_Sexe1
    FOREIGN KEY (sexeId)
    REFERENCES `ServiderBd`.`Sexe` (idSexe)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Utilisateur_Langue1
    FOREIGN KEY (langueId)
    REFERENCES `ServiderBd`.`Langue` (idLangue)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- ------------... *** SQLINES FOR EVALUATION USE ONLY *** 
-- Table `Servi... *** SQLINES FOR EVALUATION USE ONLY *** 
-- ------------... *** SQLINES FOR EVALUATION USE ONLY *** 
CREATE TABLE ServiderBd.TypeService (
  idTypeService NUMBER(10) NOT NULL ,
  sTypeFr VARCHAR2(45) NOT NULL ,
  sTypeEn VARCHAR2(45) NOT NULL ,
  PRIMARY KEY (idTypeService)  COMMENT '')
ENGINE = InnoDB;


-- ------------... *** SQLINES FOR EVALUATION USE ONLY *** 
-- Table `Servi... *** SQLINES FOR EVALUATION USE ONLY *** 
-- ------------... *** SQLINES FOR EVALUATION USE ONLY *** 
CREATE TABLE ServiderBd.Service (
  idService NUMBER(10) NOT NULL ,
  utilisateurId NUMBER(10) NOT NULL ,
  typeServiceId NUMBER(10) NOT NULL ,
  bActif NUMBER(3) NOT NULL ,
  PRIMARY KEY (idService)  COMMENT '',
  INDEX `fk_Service_Utilisateur1_idx` (utilisateurId ASC)  COMMENT '',
  INDEX `fk_Service_TypeService1_idx` (typeServiceId ASC)  COMMENT '',
  CONSTRAINT fk_Service_Utilisateur1
    FOREIGN KEY (utilisateurId)
    REFERENCES `ServiderBd`.`Utilisateur` (idUtilisateur)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Service_TypeService1
    FOREIGN KEY (typeServiceId)
    REFERENCES `ServiderBd`.`TypeService` (idTypeService)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- ------------... *** SQLINES FOR EVALUATION USE ONLY *** 
-- Table `Servi... *** SQLINES FOR EVALUATION USE ONLY *** 
-- ------------... *** SQLINES FOR EVALUATION USE ONLY *** 
CREATE TABLE ServiderBd.Annonce (
  idAnnonce NUMBER(10) NOT NULL ,
  serviceId NUMBER(10) NOT NULL ,
  utilisateurId NUMBER(10) NOT NULL ,
  bActif NUMBER(3) NOT NULL ,
  sDescription VARCHAR2(45) NULL ,
  sTarif VARCHAR2(45) NULL ,
  sAddresse VARCHAR2(45) NULL ,
  PRIMARY KEY (idAnnonce)  COMMENT '',
  INDEX `fk_serviceUtilisateur_utilisateur1_idx` (utilisateurId ASC)  COMMENT '',
  INDEX `fk_Annonce_Service1_idx` (serviceId ASC)  COMMENT '',
  CONSTRAINT fk_serviceUtilisateur_utilisateur1
    FOREIGN KEY (utilisateurId)
    REFERENCES `ServiderBd`.`Utilisateur` (idUtilisateur)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Annonce_Service1
    FOREIGN KEY (serviceId)
    REFERENCES `ServiderBd`.`Service` (idService)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- ------------... *** SQLINES FOR EVALUATION USE ONLY *** 
-- Table `Servi... *** SQLINES FOR EVALUATION USE ONLY *** 
-- ------------... *** SQLINES FOR EVALUATION USE ONLY *** 
CREATE TABLE ServiderBd.StatusContrat (
  idStatusContrat NUMBER(10) NOT NULL ,
  sStatutFr VARCHAR2(45) NOT NULL ,
  sStatutEn VARCHAR2(45) NOT NULL ,
  PRIMARY KEY (idStatusContrat)  COMMENT '')
ENGINE = InnoDB;


-- ------------... *** SQLINES FOR EVALUATION USE ONLY *** 
-- Table `Servi... *** SQLINES FOR EVALUATION USE ONLY *** 
-- ------------... *** SQLINES FOR EVALUATION USE ONLY *** 
CREATE TABLE ServiderBd.Commentaire (
  idCommentaire NUMBER(10) NOT NULL ,
  receveurId NUMBER(10) NOT NULL ,
  commentateurId NUMBER(10) NOT NULL ,
  typeServiceId NUMBER(10) NOT NULL ,
  bReceveurClientOuService NUMBER(3) NOT NULL ,
  lCommentaire CLOB NOT NULL ,
  lReponse CLOB NULL ,
  lPrive CLOB NULL ,
  iCritere1 NUMBER(10) NOT NULL ,
  iCritere2 NUMBER(10) NOT NULL ,
  iCritere3 NUMBER(10) NOT NULL ,
  dlCritereAvg BINARY_DOUBLE NOT NULL ,
  bRecommendation NUMBER(3) NOT NULL ,
  dDateCommentaire TIMESTAMP(0) NOT NULL ,
  PRIMARY KEY (idCommentaire)  COMMENT '',
  INDEX `fk_Commentaire_Utilisateur1_idx` (receveurId ASC)  COMMENT '',
  INDEX `fk_Commentaire_Utilisateur2_idx` (commentateurId ASC)  COMMENT '',
  INDEX `fk_Commentaire_TypeService1_idx` (typeServiceId ASC)  COMMENT '',
  CONSTRAINT fk_Commentaire_Utilisateur1
    FOREIGN KEY (receveurId)
    REFERENCES `ServiderBd`.`Utilisateur` (idUtilisateur)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Commentaire_Utilisateur2
    FOREIGN KEY (commentateurId)
    REFERENCES `ServiderBd`.`Utilisateur` (idUtilisateur)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Commentaire_TypeService1
    FOREIGN KEY (typeServiceId)
    REFERENCES `ServiderBd`.`TypeService` (idTypeService)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- ------------... *** SQLINES FOR EVALUATION USE ONLY *** 
-- Table `Servi... *** SQLINES FOR EVALUATION USE ONLY *** 
-- ------------... *** SQLINES FOR EVALUATION USE ONLY *** 
CREATE TABLE ServiderBd.Contrat (
  idContrat NUMBER(10) NOT NULL ,
  clientId NUMBER(10) NOT NULL ,
  annonceurId NUMBER(10) NOT NULL ,
  annonceId NUMBER(10) NOT NULL ,
  statusContratId NUMBER(10) NOT NULL ,
  commentaireAuClientId NUMBER(10) NULL ,
  commentaireAuServiceId NUMBER(10) NULL ,
  dlPrixEstime BINARY_DOUBLE NULL ,
  dDateProposition TIMESTAMP(0) NULL ,
  dDateAcceptation TIMESTAMP(0) NULL ,
  dHeureDebut TIMESTAMP(0) NULL ,
  dHeureFin TIMESTAMP(0) NULL ,
  PRIMARY KEY (idContrat)  COMMENT '',
  INDEX `fk_Contrat_serviceUtilisateur1_idx` (annonceId ASC)  COMMENT '',
  INDEX `fk_Contrat_utilisateur1_idx` (clientId ASC)  COMMENT '',
  INDEX `fk_Contrat_StatusContrat1_idx` (statusContratId ASC)  COMMENT '',
  INDEX `fk_Contrat_Commentaire1_idx` (commentaireAuClientId ASC)  COMMENT '',
  INDEX `fk_Contrat_Commentaire2_idx` (commentaireAuServiceId ASC)  COMMENT '',
  CONSTRAINT fk_Contrat_serviceUtilisateur1
    FOREIGN KEY (annonceId)
    REFERENCES `ServiderBd`.`Annonce` (idAnnonce)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Contrat_utilisateur1
    FOREIGN KEY (clientId)
    REFERENCES `ServiderBd`.`Utilisateur` (idUtilisateur)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Contrat_StatusContrat1
    FOREIGN KEY (statusContratId)
    REFERENCES `ServiderBd`.`StatusContrat` (idStatusContrat)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Contrat_Commentaire1
    FOREIGN KEY (commentaireAuClientId)
    REFERENCES `ServiderBd`.`Commentaire` (idCommentaire)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_Contrat_Commentaire2
    FOREIGN KEY (commentaireAuServiceId)
    REFERENCES `ServiderBd`.`Commentaire` (idCommentaire)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- ------------... *** SQLINES FOR EVALUATION USE ONLY *** 
-- Table `Servi... *** SQLINES FOR EVALUATION USE ONLY *** 
-- ------------... *** SQLINES FOR EVALUATION USE ONLY *** 
CREATE TABLE ServiderBd.ville (
  idville NUMBER(10) NOT NULL ,
  nom VARCHAR2(45) NULL ,
  PRIMARY KEY (idville)  COMMENT '')
ENGINE = InnoDB;


-- ------------... *** SQLINES FOR EVALUATION USE ONLY *** 
-- Table `Servi... *** SQLINES FOR EVALUATION USE ONLY *** 
-- ------------... *** SQLINES FOR EVALUATION USE ONLY *** 
CREATE TABLE ServiderBd.Indisponibilite (
  idDisponibilite NUMBER(10) NOT NULL ,
  annonceId NUMBER(10) NOT NULL ,
  dHeureDebut TIMESTAMP(0) NOT NULL ,
  dHeureFin TIMESTAMP(0) NOT NULL ,
  bReserve NUMBER(3) NOT NULL ,
  PRIMARY KEY (idDisponibilite)  COMMENT '',
  INDEX `fk_Disponibilite_ContratUtilisateur1_idx` (annonceId ASC)  COMMENT '',
  CONSTRAINT fk_Disponibilite_ContratUtilisateur1
    FOREIGN KEY (annonceId)
    REFERENCES `ServiderBd`.`Annonce` (idAnnonce)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- ------------... *** SQLINES FOR EVALUATION USE ONLY *** 
-- Table `Servi... *** SQLINES FOR EVALUATION USE ONLY *** 
-- ------------... *** SQLINES FOR EVALUATION USE ONLY *** 
CREATE TABLE ServiderBd.message (
  idMessage NUMBER(10) NOT NULL ,
  envoyeurId NUMBER(10) NOT NULL ,
  receveurId NUMBER(10) NOT NULL ,
  contratId NUMBER(10) NOT NULL ,
  bVisible NUMBER(3) NOT NULL ,
  sContenu CLOB NULL ,
  dEnvoie TIMESTAMP(0) NULL ,
  PRIMARY KEY (idMessage)  COMMENT '',
  INDEX `fk_message_Utilisateur1_idx` (envoyeurId ASC)  COMMENT '',
  INDEX `fk_message_Contrat1_idx` (contratId ASC)  COMMENT '',
  INDEX `fk_message_Utilisateur2_idx` (receveurId ASC)  COMMENT '',
  CONSTRAINT fk_message_Utilisateur1
    FOREIGN KEY (envoyeurId)
    REFERENCES `ServiderBd`.`Utilisateur` (idUtilisateur)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_message_Contrat1
    FOREIGN KEY (contratId)
    REFERENCES `ServiderBd`.`Contrat` (idContrat)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_message_Utilisateur2
    FOREIGN KEY (receveurId)
    REFERENCES `ServiderBd`.`Utilisateur` (idUtilisateur)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

ALTER SESSION SET CURRENT_SCHEMA = ServiderBd;

ALTER SESSION SET CURRENT_SCHEMA = ServiderBd$$
CREATE OR REPLACE TRIGGER ServiderBd.Utilisateur_BEFORE_UPDATE BEFORE UPDATE ON Utilisateur FOR EACH ROW
BEGIN
	if :new.statusUtilisateurId = 2 then
		:new.dLastConnected := sysdate;
    end if;
END;
$$

ALTER SESSION SET CURRENT_SCHEMA = ServiderBd$$
CREATE OR REPLACE TRIGGER ServiderBd.Commentaire_AFTER_INSERT AFTER INSERT ON Commentaire FOR EACH ROW
BEGIN
	if :new.bReceveurClientOuService then
		update utilisateur 
		set dlRatingClient = 
		(select avg(dlCritereAvg)
		from commentaire
		where commentaire.receveurId = :new.receveurId and
		commentaire.bReceveurClientOuService = :new.bReceveurClientOuService)
        where utilisateur.idUtilisateur = :new.receveurId;
	else
		update utilisateur 
		set dlRatingService = 
		(select avg(dlCritereAvg)
		from commentaire
		where commentaire.receveurId = :new.receveurId and
		commentaire.bReceveurClientOuService = :new.bReceveurClientOuService)
        where utilisateur.idUtilisateur = :new.receveurId;
	end if;
END;
$$



/* SET SQL_MODE=@OLD_SQL_MODE; */
/* SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS; */
/* SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS; */
