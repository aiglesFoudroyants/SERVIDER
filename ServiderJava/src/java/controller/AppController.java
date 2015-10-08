/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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

        return new ModelAndView("profil");
    }
    
}
