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
 * @author hugo
 */

@Entity
@Table(name = "StatusUtilisateur")
public class StatusUtilisateur implements Serializable{
       @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idStatusUtilisateur", nullable = false)
    private int idStatusUtilisateur;
    @Column(name = "sStatutFr", nullable = false)
    private String sStatutFr;
    @Column(name = "sStatutEn", nullable = false)
    private String sStatutEn;

    public StatusUtilisateur() {
    }

    
    
    public StatusUtilisateur(int StatusUtilisateur, String sStatutFr, String sStatutEn) {
        this.idStatusUtilisateur = StatusUtilisateur;
        this.sStatutFr = sStatutFr;
        this.sStatutEn = sStatutEn;
    }

    public int getIdStatusUtilisateur() {
        return idStatusUtilisateur;
    }
    

    public void setIdStatusUtilisateur(int idStatusUtilisateur) {
        this.idStatusUtilisateur = idStatusUtilisateur;
    }

    public String getsStatutFr() {
        return sStatutFr;
    }

    public void setsStatutFr(String sStatutFr) {
        this.sStatutFr = sStatutFr;
    }

    public String getsStatutEn() {
        return sStatutEn;
    }

    public void setsStatutEn(String sStatutEn) {
        this.sStatutEn = sStatutEn;
    }
    
    
    
}
