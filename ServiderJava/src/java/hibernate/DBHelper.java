/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hibernate;

import hibernate.model.*;
import hibernate.model.Utilisateur;
import java.util.Arrays;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author 1322931
 */
public class DBHelper {

    private static DBHelper instance = new DBHelper();

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
        System.out.println("ICIIIIIIIIIIIIIIIIIIIIIII " + Arrays.toString(tabStringLangue));
        return tabStringLangue;
    }

    public int authentification(String email, String password) {
        int idUser = -1;

        Utilisateur utilisateur;
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        Query query = session.createSQLQuery(
                "select idUtilisateur from utilisateur where sCourriel = '"
                + email + "' and sPassword = '" + password + "';"
        ).addEntity(Utilisateur.class);
        utilisateur = (Utilisateur) query.uniqueResult();
        if (utilisateur != null) {
            idUser = utilisateur.getIdUtilisateur();
        }

        return idUser;
    }
    
    public String getAllPays(){
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
    
    public String getAllProvinces(){
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
    }}
