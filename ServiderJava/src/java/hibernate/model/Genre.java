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
@Table(name = "Sexe")
public class Genre  implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idSexe", nullable = false)
    private int id;
    
    @Column(name = "sSexeFr", nullable = false)
    private String sexeFr;
   
    @Column(name = "sSexeEn", nullable = false)
    private String sexeEn;

    public Genre(int id, String nomFr, String nomEn) {
        this.id = id;
        this.sexeFr = nomFr;
        this.sexeEn = nomEn;
    }

    public Genre() {
    }

    public int getId() {
        return id;
    }

    public String getSexeFr() {
        return sexeFr;
    }

    public String getSexeEn() {
        return sexeEn;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setSexeFr(String nomFr) {
        this.sexeFr = nomFr;
    }

    public void setSexeEn(String nomEn) {
        this.sexeEn = nomEn;
    }

    public String getXml(){
        return "<genre><id>" + getId() + "</id><sexeFr>" + getSexeFr()+ "</sexeFr><sexeEn>" + getSexeEn()+ "</sexeEn></genre>";
    }
}