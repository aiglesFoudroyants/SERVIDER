/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import hibernate.DBHelper;
import hibernate.model.Commentaire;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import hibernate.model.ModelCommentaire;
import hibernate.model.Utilisateur;
import java.util.List;
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

    @RequestMapping("/welcome")
    public ModelAndView helloWorld() {
        String message = "<br><div style='text-align:center;'>"
                + "<h3>Bonjour tout le monde</h3>"
                + "*******Ce message provient de AppController.java **********"
                + "</div><br><br>";
        return new ModelAndView("welcome", "message", message);
    }

    @RequestMapping("/index")
    public ModelAndView index() {
        return new ModelAndView("index");
    }

    @RequestMapping("/inscription")
    public ModelAndView inscription() {
        return new ModelAndView("inscription");
    }

    @RequestMapping("/profil")
    public ModelAndView profil() {
        Commentaire[] tabCommentaires = DBHelper.getInstance().getListeTousCommentaires();
        return new ModelAndView("profil", "commentaires", tabCommentaires);
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
        typesServices = new String(typesServices.getBytes("UTF-8"), "UTF-8");
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
        return helper.getAllPays();
    }

    @RequestMapping(value = "/province", method = RequestMethod.GET)
    public @ResponseBody
    String getAllProvinces() {
        DBHelper helper = DBHelper.getInstance();
        return helper.getAllProvinces();
    }

    @RequestMapping(value = "/genre", method = RequestMethod.GET)
    public @ResponseBody
    String getAllGenres() {
        DBHelper helper = DBHelper.getInstance();
        return helper.getAllGenres();
    }

    @RequestMapping(value = "/langue", method = RequestMethod.GET)
    public @ResponseBody
    String getAllLangues() {
        DBHelper helper = DBHelper.getInstance();
        return helper.getAllLangues();
    }

    @RequestMapping(value = "/insertUtilisateur", method = RequestMethod.POST)
    public @ResponseBody
    String insertUtilisateur(@RequestParam String paysID, @RequestParam String provinceID,
            @RequestParam String sexeID, @RequestParam String langueID,
            @RequestParam String sNomCompagnie, @RequestParam String sNom,
            @RequestParam String sPrenom, @RequestParam String sPassword,
            @RequestParam String sCourriel, @RequestParam String sAdresse,
            @RequestParam String sCodePostal, @RequestParam String sVille) {
        DBHelper helper = DBHelper.getInstance();
        return String.valueOf(helper.insererUtilisateur(new Utilisateur(Integer.parseInt(paysID),
                Integer.parseInt(provinceID), Integer.parseInt(sexeID),
                Integer.parseInt(langueID), sNomCompagnie, sNom, sPrenom,
                sPassword, sCourriel, sAdresse, sCodePostal, sVille)));
    }
}
