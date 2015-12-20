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
import hibernate.model.Utilisateur;
import java.util.HashMap;
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
    public ModelAndView recherche(@RequestParam(required = true) String recherche) {
        Map<String, Object> map = new HashMap();
        map.put("recherche", recherche);
        return new ModelAndView("recherche", map);
    }

    @RequestMapping("/inscription")
    public ModelAndView inscription() {
        return new ModelAndView("inscription");
    }

    @RequestMapping(value = "/profil")
    public ModelAndView profil() {
        return new ModelAndView("profil");
    }

    @RequestMapping(value = "/nouveau_commentaire")
    public ModelAndView nouveau_commentaire(@RequestParam(required = true) String idReceveur,
            @RequestParam(required = true) String idContrat,
            @RequestParam(required = true) String bClientOuService,
            @RequestParam(required = true) String idTypeDeService) {
        Map<String, Object> map = new HashMap();
        map.put("idReceveur", idReceveur);
        map.put("idContrat", idContrat);
        map.put("bClientOuService", bClientOuService);
        map.put("idTypeDeService", idTypeDeService);
        return new ModelAndView("nouveau_commentaire", map);
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
        int[] idServices = helper.getIdsTypeServiceParNom(gson.fromJson(services, String[].class), langue);
        for (int idService : idServices) {
            helper.insererService(utilisateur.getIdUtilisateur(), idService);
        }
        return "{}";
    }

    @RequestMapping(value = "/updateUtilisateur", method = RequestMethod.POST)
    public @ResponseBody
    String updateUtilisateur(@RequestParam String user) {
        DBHelper helper = DBHelper.getInstance();
        Gson gson = new Gson();
        Utilisateur utilisateur = gson.fromJson(user, Utilisateur.class);
        helper.updateUtilisateur(utilisateur);
        return "{}";
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
    String getStatusUtilisateur(@RequestParam String id) {
        DBHelper helper = DBHelper.getInstance();
        Gson gson = new Gson();
        return gson.toJson(helper.getStatusUtilisateur(Integer.parseInt(id)));
    }

    @RequestMapping(value = "/getCommentairesClient", method = RequestMethod.GET)
    public @ResponseBody
    String getCommentairesClient(@RequestParam String id) {
        int idAsInt = Integer.parseInt(id);
        return new Gson().toJson(DBHelper.getInstance().getListeTousCommentairesCLient(idAsInt));
    }

    @RequestMapping(value = "/getCommentairesService", method = RequestMethod.GET)
    public @ResponseBody
    String getCommentairesService(@RequestParam String id) {
        int idAsInt = Integer.parseInt(id);
        return new Gson().toJson(DBHelper.getInstance().getListeTousCommentairesService(idAsInt));
    }

    @RequestMapping(value = "/getResultatRecherche", method = RequestMethod.GET)
    public @ResponseBody
    String getResultatRecherche(@RequestParam String TypeService, @RequestParam String langue) {
        DBHelper helper = DBHelper.getInstance();
        return new Gson().toJson(helper.getRecherche(Integer.parseInt(TypeService), langue));
    }

    @RequestMapping(value = "/getResultatRechercheTypeID", method = RequestMethod.GET)
    public @ResponseBody
    String getResultatRechercheTypeID(@RequestParam String entree, @RequestParam String langue) {
        DBHelper helper = DBHelper.getInstance();
        return Integer.toString(helper.getIdTypeServiceParRecherche(entree, langue));
    }

}
