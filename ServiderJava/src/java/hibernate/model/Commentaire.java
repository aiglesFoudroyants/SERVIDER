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
 * @author hugo
 */
@Entity
@Table(name = "commentaire")
public class Commentaire implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idCommentaire", nullable = false)
    private int idCommentaire;
    @Column(name = "receveurId", nullable = false)
    private int receveurId;
    @Column(name = "commentateurId", nullable = false)
    private int commentateurId;
    @Column(name = "typeServiceId", nullable = false)
    private int typeServiceId;
    @Column(name = "bReceveurClientOuService", nullable = false)
    private boolean bReceveurClientOuService;
    @Column(name = "lCommentaire", nullable = false)
    private String lCommentaire;
    @Column(name = "lReponse", nullable = true)
    private String lReponse;
    @Column(name = "lPrive", nullable = true)
    private String lPrive;
    @Column(name = "iCritere1", nullable = false)
    private int iCritere1;
    @Column(name = "iCritere2", nullable = false)
    private int iCritere2;
    @Column(name = "iCritere3", nullable = false)
    private int iCritere3;
    @Column(name = "dlCritereAvg", nullable = false)
    private double dlCritereAvg;
    @Column(name = "bRecommendation", nullable = false)
    private boolean bRecommendation;
    @Column(name = "dDateCommentaire", nullable = false)
    private Date dDateCommentaire;
    @Column(name = "sNom", nullable = false)
    private String sNom;

    public Commentaire() {
    }

    public int getIdCommentaire() {
        return idCommentaire;
    }

    public void setIdCommentaire(int idCommentaire) {
        this.idCommentaire = idCommentaire;
    }

    public int getReceveurId() {
        return receveurId;
    }

    public void setReceveurId(int receveurId) {
        this.receveurId = receveurId;
    }

    public int getCommentateurId() {
        return commentateurId;
    }

    public void setCommentateurId(int commentateurId) {
        this.commentateurId = commentateurId;
    }

    public int getTypeServiceId() {
        return typeServiceId;
    }

    public void setTypeServiceId(int typeServiceId) {
        this.typeServiceId = typeServiceId;
    }

    public boolean isbReceveurClientOuService() {
        return bReceveurClientOuService;
    }

    public void setbReceveurClientOuService(boolean bReceveurClientOuService) {
        this.bReceveurClientOuService = bReceveurClientOuService;
    }

    public String getlCommentaire() {
        return lCommentaire;
    }

    public void setlCommentaire(String lCommentaire) {
        this.lCommentaire = lCommentaire;
    }

    public String getlReponse() {
        return lReponse;
    }

    public void setlReponse(String lReponse) {
        this.lReponse = lReponse;
    }

    public String getlPrive() {
        return lPrive;
    }

    public void setlPrive(String lPrive) {
        this.lPrive = lPrive;
    }

    public int getiCritere1() {
        return iCritere1;
    }

    public void setiCritere1(int iCritere1) {
        this.iCritere1 = iCritere1;
    }

    public int getiCritere2() {
        return iCritere2;
    }

    public void setiCritere2(int iCritere2) {
        this.iCritere2 = iCritere2;
    }

    public int getiCritere3() {
        return iCritere3;
    }

    public void setiCritere3(int iCritere3) {
        this.iCritere3 = iCritere3;
    }

    public double getDlCritereAvg() {
        return dlCritereAvg;
    }

    public void setDlCritereAvg(double dlCritereAvg) {
        this.dlCritereAvg = dlCritereAvg;
    }

    public boolean isbRecommendation() {
        return bRecommendation;
    }

    public void setbRecommendation(boolean bRecommendation) {
        this.bRecommendation = bRecommendation;
    }

    public Date getdDateCommentaire() {
        return dDateCommentaire;
    }

    public void setdDateCommentaire(Date dDateCommentaire) {
        this.dDateCommentaire = dDateCommentaire;
    }

    public String getsNom() {
        return sNom;
    }

    public void setsNom(String sNom) {
        this.sNom = sNom;
    }

}
