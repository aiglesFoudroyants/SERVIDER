 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.portlet.ModelAndView;

/**
 *
 * @author 1257837
 */


@Controller
public class AppController {

    @RequestMapping("/")
    public String visiterAccueil() {
        return "home";
    }
    
    @RequestMapping("/inscription")
    public ModelAndView visiterInscription(Model model) {
        ModelAndView mv = new ModelAndView();
        mv.setView("inscription");
        return mv;
    }    
     @RequestMapping("/welcome")
    public org.springframework.web.servlet.ModelAndView helloWorld () {
        String message = "<br><div style='text-align:center;'>"
                + "<h3>Bonjour tout le monde</h3>"
                + "*******Ce message provient de AppController.java **********"
                + "</div><br><br>";
        return new org.springframework.web.servlet.ModelAndView("welcome", "message", message);  
    }
}
