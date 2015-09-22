#Autentification au login
select idUtilisateur from utilisateur
where sCourriel = "1322931@bdeb.qc.ca"
and sPassword = "gr007,,";

#Accéder aux données d'un utilisateur
select * 
from utilisateur u
where u.idUtilisateur = 1;

#Accéder aux données minimales d'un utilisateur
select u.snom, u.sprenom
from utilisateur u
where u.idUtilisateur = 1;

#Sélectionne la liste du combobox de recherche
select distinct t.sTypeFr, t.sTypeEn from service s
join typeservice t 
on s.typeServiceId = t.idTypeService
where t.sTypeFr like ("plombier%");

#Sélectionne toutes les annonces concernant un type de service
select a.* from annonce a
join service s 
on a.serviceId = s.idService
where typeServiceId = 1;

#Vérifie que le courriel existe
select count(*) as nbCourriel from utilisateur
where sCourriel = "24@bdeb.qc.ca";

#Sélectionne tous les pays
select sNomFr, sNomEn
from pays;

#Sélectionne les sexes
select sSexeFr, sSexeEn
from sexe;

#Sélectionne les langues
select sLangueFr, sLangueEn
from langue;

#Sélectionne tous les status
select sStatutEn, sStatutFr
from statusContrat;

#Sélectionne toutes les provinces/états d'un pays
select sNomFr, sNomEn
from province
where paysId = 1;

#Tous les types de services
select sTypeFr, sTypeEn
from typeservice;

#Sélectionne les messages adressé à un compte
select * from message 
where receveurId = 1;

#Sélectionne les messages concernant une annonce
select * from message 
where contratId = 1;

#Sélectionne un message spécifique
select * from message 
where idMessage = 1;

#Sélectionne les commentaires adressé à un compte(service);
select c.lCommentaire, c.dlCritereAvg, c.bRecommendation, c.dDateCommentaire, c.lReponse, c.typeServiceId, u.sNom, u.sPrenom from commentaire c
join utilisateur u
on u.idUtilisateur = c.commentateurId
where c.receveurId = 1 and c.bReceveurClientOuService = false
order by c.dDateCommentaire;

#Sélectionne les commentaires adressé à un compte(client);
select c.lCommentaire, c.dlCritereAvg, c.bRecommendation, c.dDateCommentaire, c.lReponse, c.typeServiceId, u.sNom, u.sPrenom from commentaire c
join utilisateur u
on u.idUtilisateur = c.commentateurId
where c.receveurId = 1 and c.bReceveurClientOuService = true
order by c.dDateCommentaire;

#Sélectionne les annonces d'un utilisateur
select a.sDescription, a.sTarif, a.sAddresse, s.typeServiceId
from annonce a
join service s
on s.idService = a.serviceId
where a.bActif = true and s.bActif = true and s.utilisateurId = 2
order by s.typeServiceId;

#Sélectionne mes transactions en tant que client
select c.statusContratId, c.dlPrixEstime, u.sNom, u.sPrenom
from contrat c
join utilisateur u
on u.idUtilisateur = c.annonceurId
where clientId = 1;

#Sélectionne mes transactions en tant que fournisseur de service
select c.statusContratId, u.sNom, u.sPrenom 
from contrat c
join utilisateur u
on u.idUtilisateur = c.clientId
where annonceurId = 2;

#Ajout d'un nouvel utilisateur
insert into Utilisateur(paysId,provinceId,statusUtilisateurId,sexeId,langueId,sNom,sPrenom,sPassword,sCourriel,bVerifCourriel,bVerifFacebook,bVerifLinkedIn,bVerifTwitter,sTelephone,
sAdresse,sCodePostal,sVille,dlRatingClient,dlRatingService)  values(1,1,1,2,1,'Lamarre', 'Gabriel', 'gr007,,','1302743@bdeb.qc.ca', false, false, false, false,'(514)325-6642',
'5048 rue de la Gare','h1g2b7','Montréal-Noir');

#Ajout d'un nouvel utilisateur d'affaires
insert into Utilisateur(paysId,provinceId,statusUtilisateurId,sexeId,langueId,snomCompagnie,sNom,sPrenom,sPassword,sCourriel,bVerifCourriel,bVerifFacebook,bVerifLinkedIn,bVerifTwitter,sTelephone,
sAdresse,sCodePostal,sVille,dlRatingClient,dlRatingService)  values(1,1,1,2,1,'Bob inc','Lamarre', 'Gabriel', 'gr007,,','1302743@bdeb.qc.ca', false, false, false, false,'(514)325-6642',
'5048 rue de la Gare','h1g2b7','Montréal-Noir');

#Ajout de services à l'inscription
insert into service(utilisateurId, typeServiceId, bActif) 
values (1,1,true);
 
#Changement de mot de passe
update utilisateur 
set spassword = 'gr007,,'
where utilisateur.idUtilisateur = 1;

#Déconnexion
update utilisateur
set statusUtilisateur = 2
where utilisateur.idUtilisateur = 1;

#Connexion
update utilisateur
set statusUtilisateur = 1
where utilisateur.idUtilisateur = 1;

#Inactivité
update utilisateur
set statusUtilisateur = 3
where utilisateur.idUtilisateur = 1;
