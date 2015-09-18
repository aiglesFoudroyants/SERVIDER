#Autentification au login
select idUtilisateur from utilisateur
where sCourriel = "1322931@bdeb.qc.ca"
and sPassword = "gr007,,";

#Affiche tout les services
select distinct t.sTypeFr, t.sTypeEn from service s
join typeservice t on
s.typeServiceId = t.idTypeService
where t.sTypeFr like ("plombier%");

#va chercher toutes les annonces concernant un type de service
select a.* from annonce a
join service s on a.serviceId = s.idService
where typeServiceId = 1;

#Vérifie que le courriel n'existe pas
select idUtilisateur from utilisateur
where sCourriel = "24@bdeb.qc.ca";

#Affiche tous les pays
select sNomFr, sNomEn from pays;

#Affiche toutes les provinces/états d'un pays
select sNomFr, sNomEn from province
where paysId = 1;

#Tout les types de services
select sTypeFr, sTypeEn from typeservice;

#Cherche les messages adressé à un compte
select * from message 
where receveurId = 1;

#Cherche les commentaires adressé à un compte(service);
select * from commentaire
where 
