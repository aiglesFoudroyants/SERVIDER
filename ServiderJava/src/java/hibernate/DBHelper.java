/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hibernate;

import hibernate.model.*;
import hibernate.model.Utilisateur;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author 1322931
 */
public class DBHelper {

    private static final DBHelper instance = new DBHelper();

    public static DBHelper getInstance() {
        return instance;
    }

    public String[] getListeTousTypesService(String entree, String langue) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<TypeService> listeTousTypesService;

        session.beginTransaction();
        Query query = session.createSQLQuery("select * from typeservice where sType" + langue + " like '" + entree + "%'")
                .addEntity(TypeService.class);
        listeTousTypesService = (List<TypeService>) query.list();
        session.getTransaction().commit();
        session.close();

        return genererTableauLangue(listeTousTypesService, langue);
    }

    public Commentaire[] getListeTousCommentairesCLient(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Commentaire> listeCommentaires;

        session.beginTransaction();
        Query query = session.createSQLQuery("select c.*, u.sNom, u.sPrenom,"
                + " u.sCheminImgProfile from commentaire c"
                + " join utilisateur u on u.idUtilisateur = c.commentateurId"
                + " where c.receveurId = " + id + " and c.bReceveurClientOuService = true"
                + " order by c.dDateCommentaire;")
                .addEntity(Commentaire.class);
        listeCommentaires = (List<Commentaire>) query.list();
        session.getTransaction().commit();
        session.close();
        return listeCommentaires.toArray(new Commentaire[listeCommentaires.size()]);
    }

    public Commentaire[] getListeTousCommentairesService(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Commentaire> listeCommentaires;

        session.beginTransaction();
        Query query = session.createSQLQuery("select c.*, u.sNom, u.sPrenom, "
                + " u.sCheminImgProfile from commentaire c"
                + " join utilisateur u on u.idUtilisateur = c.commentateurId"
                + " where c.receveurId = " + id + " and c.bReceveurClientOuService = false"
                + " order by c.dDateCommentaire;")
                .addEntity(Commentaire.class);
        listeCommentaires = (List<Commentaire>) query.list();
        session.getTransaction().commit();
        session.close();
        return listeCommentaires.toArray(new Commentaire[listeCommentaires.size()]);
    }

    private String[] genererTableauLangue(List<TypeService> listeTousTypesService, String langue) {
        String[] tabStringLangue = new String[listeTousTypesService.size()];

        for (int i = 0; i < tabStringLangue.length; i++) {
            String typeService = "";

            switch (langue) {
                case "fr":
                    typeService = listeTousTypesService.get(i).getTypeFr();
                    break;
                case "en":
                    typeService = listeTousTypesService.get(i).getTypeEn();
                    break;
            }

            tabStringLangue[i] = typeService;
        }
       
        return tabStringLangue;
    }

    public int authentification(String email, String password) {
        int idUser = -1;

        Utilisateur utilisateur;
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        Query query = session.createSQLQuery(
                "select * from utilisateur where sCourriel = '"
                + email + "' and sPassword = '" + password + "';"
        ).addEntity(Utilisateur.class);
        utilisateur = (Utilisateur) query.uniqueResult();
        if (utilisateur != null) {
            System.out.println("not null");
            idUser = utilisateur.getIdUtilisateur();
        }

        return idUser;
    }

    public String getAllPays() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Pays> listePays;
        StringBuilder xml = new StringBuilder("<root><paysGroup>");

        session.beginTransaction();
        Query query = session.createSQLQuery("select * from pays")
                .addEntity(Pays.class);
        listePays = (List<Pays>) query.list();
        session.getTransaction().commit();
        session.close();

        for (Pays pays : listePays) {
            xml.append(pays.getXml());
        }
        xml.append("</paysGroup></root>");

        return xml.toString();
    }

    public String getAllProvinces() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Province> listeProvinces;
        StringBuilder xml = new StringBuilder("<root><provinces>");

        session.beginTransaction();
        Query query = session.createSQLQuery("select * from province")
                .addEntity(Province.class);
        listeProvinces = (List<Province>) query.list();
        session.getTransaction().commit();
        session.close();

        for (Province province : listeProvinces) {
            xml.append(province.getXml());
        }
        xml.append("</provinces></root>");

        return xml.toString();
    }

    public String getAllGenres() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Genre> listeGenres;
        StringBuilder xml = new StringBuilder("<root><genres>");

        session.beginTransaction();
        Query query = session.createSQLQuery("select * from sexe")
                .addEntity(Genre.class);
        listeGenres = (List<Genre>) query.list();
        session.getTransaction().commit();
        session.close();

        for (Genre genre : listeGenres) {
            xml.append(genre.getXml());
        }
        xml.append("</genres></root>");

        return xml.toString();
    }

    public String getAllLangues() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Langue> listeLangues;
        StringBuilder xml = new StringBuilder("<root><langues>");

        session.beginTransaction();
        Query query = session.createSQLQuery("select * from langue")
                .addEntity(Langue.class);
        listeLangues = (List<Langue>) query.list();
        session.getTransaction().commit();
        session.close();

        for (Langue langue : listeLangues) {
            xml.append(langue.getXml());
        }
        xml.append("</langues></root>");

        return xml.toString();
    }

    public int insererUtilisateur(Utilisateur utilisateur) {
        int id;
        Session session = HibernateUtil.getSessionFactory().openSession();

        session.beginTransaction();
        id = (int) session.save(utilisateur);
        session.getTransaction().commit();
        session.close();

        return id;
    }

    public Utilisateur getUtilisateur(int id) {
        Utilisateur utilisateur;
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        Query query = session.createSQLQuery(
                "select * from utilisateur where idUtilisateur = '"
                + id + "';"
        ).addEntity(Utilisateur.class);
        utilisateur = (Utilisateur) query.uniqueResult();
        session.getTransaction().commit();
        session.close();

        return utilisateur;
    }

    public StatusUtilisateur getStatusUtilisateur(int id) {

        StatusUtilisateur statusUtilisateur = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        Query query = session.createSQLQuery(
                "select * from StatusUtilisateur where idStatusUtilisateur = '"
                + id + "';"
        ).addEntity(StatusUtilisateur.class);
        statusUtilisateur = (StatusUtilisateur) query.uniqueResult();
        session.getTransaction().commit();
        session.close();
        return statusUtilisateur;
    }

    public int[] getIdsTypeServiceParNom(String[] nomServices, String langue) {
        System.out.println(langue);
        int[] id = new int[nomServices.length];
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        for (int i = 0; i < nomServices.length; i++) {
            id[i] = getIdTypeServiceParNom(nomServices[i], langue, session);
        }
        session.getTransaction().commit();
        session.close();
        return id;
    }
    
    private int getIdTypeServiceParNom(String nomServices, String langue, Session session) {
        int id;
        
        Query query = session.createSQLQuery(
                    "select * from typeService where sType" + langue + " = '"
                    + nomServices + "';"
            ).addEntity(TypeService.class);
            id = ((TypeService) query.uniqueResult()).getId();
        
        return id;
    }

    public int insererService(int utilisateurId, int typeServiceId) {
        int id;
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        Service service = new Service(utilisateurId, typeServiceId);
        id = (int) session.save(service);
        session.getTransaction().commit();
        session.close();
        return id;

    }

    
    public List<Annonce> getRecherche(String entree, String langue){
        List<Annonce> annonces;
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        int typeServiceId = getIdTypeServiceParNom(entree, langue, session);
        Query query = session.createSQLQuery(
                "select A.* from Annonce A"
                + "join Service S"
                + "on A.serviceId == S.idService"
                + " where S.typeServiceId = " + typeServiceId + ";"
        ).addEntity(Annonce.class);
        
        annonces = (List<Annonce>) query.list();
        return annonces;
    }

}
