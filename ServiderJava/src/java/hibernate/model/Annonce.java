/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hibernate.model;

import java.io.Serializable;
import java.sql.Date;
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
@Table(name = "Annonce")
public class Annonce implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idAnnonce", nullable = false)
    private int idAnnonce;
    @Column(name = "serviceId", nullable = false)
    private int serviceId;
    @Column(name = "utilisateurId", nullable = false)
    private int utilisateurId;
    @Column(name = "bActif", nullable = false)
    private boolean bActif;
    @Column(name = "sDescription", nullable = true)
    private String sDescription;
    @Column(name = "sTarif", nullable = true)
    private String sTarif;
    @Column(name = "sAddresse", nullable = true)
    private String sAddresse;

    public Annonce() {
    }

    public int getIdAnnonce() {
        return idAnnonce;
    }

    public void setIdAnnonce(int idAnnonce) {
        this.idAnnonce = idAnnonce;
    }

    public int getServiceId() {
        return serviceId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

    public int getUtilisateurId() {
        return utilisateurId;
    }

    public void setUtilisateurId(int utilisateurId) {
        this.utilisateurId = utilisateurId;
    }

    public boolean isbActif() {
        return bActif;
    }

    public void setbActif(boolean bActif) {
        this.bActif = bActif;
    }

    public String getsDescription() {
        return sDescription;
    }

    public void setsDescription(String sDescription) {
        this.sDescription = sDescription;
    }

    public String getsTarif() {
        return sTarif;
    }

    public void setsTarif(String sTarif) {
        this.sTarif = sTarif;
    }

    public String getsAddresse() {
        return sAddresse;
    }

    public void setsAddresse(String sAddresse) {
        this.sAddresse = sAddresse;
    }
    
    
}
