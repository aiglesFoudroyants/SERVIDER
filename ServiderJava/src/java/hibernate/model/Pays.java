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
@Table(name = "Pays")
public class Pays  implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idPays", nullable = false)
    private int id;
    
    @Column(name = "sNomFr", nullable = false)
    private String nomFr;
   
    @Column(name = "sNomEn", nullable = false)
    private String nomEn;
    
    @Column(name = "sAbreviation", nullable = false)
    private String abreviation;

    public Pays(int id, String nomFr, String nomEn, String abreviation) {
        this.id = id;
        this.nomFr = nomFr;
        this.nomEn = nomEn;
        this.abreviation = abreviation;
    }

    public Pays() {
    }

    public int getId() {
        return id;
    }

    public String getNomFr() {
        return nomFr;
    }

    public String getNomEn() {
        return nomEn;
    }

    public String getAbreviation() {
        return abreviation;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNomFr(String nomFr) {
        this.nomFr = nomFr;
    }

    public void setNomEn(String nomEn) {
        this.nomEn = nomEn;
    }

    public void setAbreviation(String abreviation) {
        this.abreviation = abreviation;
    }
    
    public String getXml(){
        return "<pays><id>" + getId() + "</id><nomFr>" + getNomFr()+ "</nomFr><nomEn>" + getNomEn()+ "</nomEn><abreviation>" + getAbreviation()+ "</abreviation></pays>";
    }
}
