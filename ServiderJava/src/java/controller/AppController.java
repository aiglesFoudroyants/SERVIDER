/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import hibernate.DBHelper;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import hibernate.model.ModelCommentaire;
import java.nio.charset.Charset;
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

    @RequestMapping("/inscription")
    public ModelAndView inscription() {
        return new ModelAndView("inscription");
    }

    @RequestMapping("/profil")
    public ModelAndView profi() {
        ArrayList<ModelCommentaire> list = new ArrayList<>();
        list.add(new ModelCommentaire("Bob Lelouch", "le meilleur chanteur mexicain au monde 8/8"));
        list.add(new ModelCommentaire("John Doe", "parfait!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"));

        return new ModelAndView("profil", "nameList", list);
    }

    @RequestMapping(value = "/typesServices", method = RequestMethod.GET)
    public @ResponseBody
    String getTousTypesService(@RequestParam String entree, @RequestParam String langue) throws UnsupportedEncodingException {
        DBHelper helper = DBHelper.getInstance();
        String typesServices = String.join(",", helper.getListeTousTypesService(entree, langue));
        typesServices = new String(typesServices.getBytes("UTF-8"), "UTF-8");
        System.out.println("In String " + typesServices);
        return typesServices;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public @ResponseBody
    String getIdLogin(@RequestParam String email, @RequestParam String password) throws UnsupportedEncodingException {
        DBHelper helper = DBHelper.getInstance();
        int idUser = helper.authentification(email, password);
        return idUser > 0 ? "true" : "false";
    }

}
