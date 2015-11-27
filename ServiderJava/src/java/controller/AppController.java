/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import hibernate.DBHelper;
import hibernate.model.Commentaire;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import hibernate.model.ModelCommentaire;
import hibernate.model.Utilisateur;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author rhammami
 */
@Controller
public class AppController {

    @RequestMapping("/index")
    public ModelAndView index() {
        return new ModelAndView("index");
    }
    
    @RequestMapping("/recherche")
    public ModelAndView recherche(@RequestParam(required=true) String recherche) {
        Map<String, Object> map = new HashMap();
        map.put("recherche", recherche);
        return new ModelAndView("recherche", map);
    }

    @RequestMapping("/inscription")
    public ModelAndView inscription() {
        return new ModelAndView("inscription");
    }

    @RequestMapping("/profil")
    public ModelAndView profil() {
        Map<String, Object> map = new HashMap();
        Commentaire[] tabCommentaires = DBHelper.getInstance().getListeTousCommentaires();

        map.put("commentaires", tabCommentaires);

        return new ModelAndView("profil", map);
    }

    @RequestMapping("/recuperation")
    public ModelAndView recuprationMotDePasse() {
        return new ModelAndView("recuperation");
    }

    @RequestMapping(value = "/typesServices", method = RequestMethod.GET)
    public @ResponseBody
    String getTousTypesService(@RequestParam String entree, @RequestParam String langue) throws UnsupportedEncodingException {
        DBHelper helper = DBHelper.getInstance();
        String typesServices = String.join(",", helper.getListeTousTypesService(entree, langue));
        typesServices = StringEscapeUtils.escapeHtml4(typesServices);
        return typesServices;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public @ResponseBody
    String getIdLogin(@RequestParam String email, @RequestParam String password) throws UnsupportedEncodingException {
        DBHelper helper = DBHelper.getInstance();
        return String.valueOf(helper.authentification(email, password));
    }

    @RequestMapping(value = "/pays", method = RequestMethod.GET)
    public @ResponseBody
    String getAllPays() {
        DBHelper helper = DBHelper.getInstance();
        String pays = StringEscapeUtils.escapeHtml4(helper.getAllPays());
        return pays;
    }

    @RequestMapping(value = "/province", method = RequestMethod.GET)
    public @ResponseBody
    String getAllProvinces() {
        DBHelper helper = DBHelper.getInstance();
        String provinces = StringEscapeUtils.escapeHtml4(helper.getAllProvinces());
        return provinces;
    }

    @RequestMapping(value = "/genre", method = RequestMethod.GET)
    public @ResponseBody
    String getAllGenres() {
        DBHelper helper = DBHelper.getInstance();
        String genres = StringEscapeUtils.escapeHtml4(helper.getAllGenres());
        return genres;
    }

    @RequestMapping(value = "/langue", method = RequestMethod.GET)
    public @ResponseBody
    String getAllLangues() {
        DBHelper helper = DBHelper.getInstance();
        String langues = StringEscapeUtils.escapeHtml4(helper.getAllLangues());
        return langues;
    }

    @RequestMapping(value = "/insertUtilisateur", method = RequestMethod.POST)
    public @ResponseBody
    String insertUtilisateur(@RequestParam String user, @RequestParam String services, @RequestParam String langue) {
        DBHelper helper = DBHelper.getInstance();
        Gson gson = new Gson();
        Utilisateur utilisateur = gson.fromJson(user, Utilisateur.class);
        utilisateur.setStatusUtilisateur(1);
        utilisateur.setIdUtilisateur(helper.insererUtilisateur(utilisateur));
        int[] idServices = helper.getIdTypeServiceParNom(gson.fromJson(services, String[].class), langue);
        for (int idService : idServices) {
            helper.insererService(utilisateur.getIdUtilisateur(), idService);
        }
        return null/* String.valueOf(helper.insererUtilisateur(new Utilisateur(Integer.parseInt(paysID),
                Integer.parseInt(provinceID), Integer.parseInt(sexeID),
                Integer.parseInt(langueID), sNom, sPrenom,
                sPassword, sCourriel, sAdresse, sCodePostal, sVille)))*/;
    }

    @RequestMapping(value = "/getUtilisateur", method = RequestMethod.GET)
    public @ResponseBody
    String getUtilisateur(@RequestParam String id) {
        DBHelper helper = DBHelper.getInstance();
        Gson gson = new Gson();
        return gson.toJson(helper.getUtilisateur(Integer.parseInt(id)));
    }

    @RequestMapping(value = "/getStatusUtilisateur", method = RequestMethod.GET)
    public @ResponseBody
    String getStatusUtilisateur(@RequestParam String id ) {
        DBHelper helper = DBHelper.getInstance();
        Gson gson = new Gson();
        return gson.toJson(helper.getStatusUtilisateur(Integer.parseInt(id)));
    }
}
