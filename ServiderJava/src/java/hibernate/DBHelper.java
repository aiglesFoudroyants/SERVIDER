/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hibernate;

import hibernate.model.TypeService;
import java.util.List;
import org.hibernate.Session;

/**
 *
 * @author 1322931
 */
public class DBHelper {
    
    private static DBHelper instance = new DBHelper();
    
    public static DBHelper getInstance(){
        return instance;
    }

    public String[] getListeTousTypesService(String entree, String langue) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<TypeService> listeTousTypesService;

        session.beginTransaction();
        listeTousTypesService = (List<TypeService>) session.createQuery("from typeservice where sType" + langue + " like " + entree + "*").list();

        session.getTransaction().commit();
        session.close();
        
        return genererTableauLangue(listeTousTypesService, langue);
    }
    
    private String[] genererTableauLangue(List<TypeService> listeTousTypesService, String langue){
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
}
