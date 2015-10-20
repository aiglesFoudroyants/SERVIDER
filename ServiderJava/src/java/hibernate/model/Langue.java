/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hibernate.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author gabriel
 */

@Entity
@Table(name = "Langue")
public class Langue  implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idLangue", nullable = false)
    private int id;
    
    @Column(name = "sLangueFr", nullable = false)
    private String langueFr;
   
    @Column(name = "sLangueEn", nullable = false)
    private String langueEn;

    public Langue(int id, String nomFr, String nomEn) {
        this.id = id;
        this.langueFr = nomFr;
        this.langueEn = nomEn;
    }

    public Langue() {
    }

    public int getId() {
        return id;
    }

    public String getLangueFr() {
        return langueFr;
    }

    public String getLangueEn() {
        return langueEn;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setLangueFr(String langueFr) {
        this.langueFr = langueFr;
    }

    public void setLangueEn(String langueEn) {
        this.langueEn = langueEn;
    }
    
    public String getXml(){
        return "<langue><id>" + getId() + "</id><langueFr>" + getLangueFr()+ "</langueFr><langueEn>" + getLangueEn()+ "</langueEn></langue>";
    }
}