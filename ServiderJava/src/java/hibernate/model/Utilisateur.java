/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hibernate.model;

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
@Table(name = "Utilisateur")
public class Utilisateur {
    

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idUtilisateur", nullable = false)
    private int idUtilisateur;
    @Column(name = "paysId", nullable = false)
    private int paysID;
    @Column(name = "provinceID", nullable = false)
    private int provinceID;
    @Column(name = "StatusUtilisateur", nullable = false)
    private int StatusUtilisateur;
    @Column(name = "sexeId", nullable = false)
    private int sexeID;
    @Column(name = "langueID", nullable = false)
    private int langueID;
    @Column(name = "sNomCompagnie", nullable = true)
    private String sNomCompagnie;
    @Column(name = "sNom", nullable = false)
    private String sNom;
    @Column(name = "sPrenom", nullable = false)
    private String sPrenom;
    @Column(name = "sPassword", nullable = false)
    private String sPassword;
    @Column(name = "sCourriel", nullable = false)
    private String sCourriel;
    @Column(name = "bVerifCouriel", nullable = false)
    private boolean bVerifCouriel;
    @Column(name = "bVerifFacebook", nullable = false)
    private boolean bVerifFacebook;
    @Column(name = "bVerifLinkedIn", nullable = false)
    private boolean bVerifLinkedIn;
    @Column(name = "bVerifTwitter", nullable = false)
    private boolean bVerifTwitter;
    @Column(name = "sFacebook", nullable = true)
    private String sFacebook;
    @Column(name = "sLinkedIn", nullable = true)
    private String sLinkedIn;
    @Column(name = "sTwitter", nullable = true)
    private String sTwitter;
    @Column(name = "sTelephone", nullable = true)
    private String sTelephone;
    @Column(name = "sAdresse", nullable = true)
    private String sAdresse;
    @Column(name = "sCodePostal", nullable = true)
    private String sCodePostal;
    @Column(name = "sVile", nullable = true)
    private String sVile;
    @Column(name = "dLastConnected", nullable = true)
    private Date dLastConnected;
    @Column(name = "dlRaitingClient", nullable = true)
    private double dlRaitingClient;
    @Column(name = "dlRaitingServices", nullable = true)
    private double dlRaitingServices;
    @Column(name = "sCheminImgProfile", nullable = true)
    private String sCheminImgProfile;

    public Utilisateur(int idUtilisateur, int paysID, int provinceID, int StatusUtilisateur, int sexeID, int langueID, String sNomCompagnie, String sNom, String sPrenom, String sPassword, String sCourriel, boolean bVerifCouriel, boolean bVerifFacebook, boolean bVerifLinkedIn, boolean bVerifTwitter, String sFacebook, String sLinkedIn, String sTwitter, String sTelephone, String sAdresse, String sCodePostal, String sVile, Date dLastConnected, double dlRaitingClient, double dlRaitingServices, String sCheminImgProfile) {
        this.idUtilisateur = idUtilisateur;
        this.paysID = paysID;
        this.provinceID = provinceID;
        this.StatusUtilisateur = StatusUtilisateur;
        this.sexeID = sexeID;
        this.langueID = langueID;
        this.sNomCompagnie = sNomCompagnie;
        this.sNom = sNom;
        this.sPrenom = sPrenom;
        this.sPassword = sPassword;
        this.sCourriel = sCourriel;
        this.bVerifCouriel = bVerifCouriel;
        this.bVerifFacebook = bVerifFacebook;
        this.bVerifLinkedIn = bVerifLinkedIn;
        this.bVerifTwitter = bVerifTwitter;
        this.sFacebook = sFacebook;
        this.sLinkedIn = sLinkedIn;
        this.sTwitter = sTwitter;
        this.sTelephone = sTelephone;
        this.sAdresse = sAdresse;
        this.sCodePostal = sCodePostal;
        this.sVile = sVile;
        this.dLastConnected = dLastConnected;
        this.dlRaitingClient = dlRaitingClient;
        this.dlRaitingServices = dlRaitingServices;
        this.sCheminImgProfile = sCheminImgProfile;
    }
    
    
    

    public int getIdUtilisateur() {
        return idUtilisateur;
    }

    public void setIdUtilisateur(int idUtilisateur) {
        this.idUtilisateur = idUtilisateur;
    }

    public int getPaysID() {
        return paysID;
    }

    public void setPaysID(int paysID) {
        this.paysID = paysID;
    }

    public int getProvinceID() {
        return provinceID;
    }

    public void setProvinceID(int provinceID) {
        this.provinceID = provinceID;
    }

    public int getStatusUtilisateur() {
        return StatusUtilisateur;
    }

    public void setStatusUtilisateur(int StatusUtilisateur) {
        this.StatusUtilisateur = StatusUtilisateur;
    }

    public int getSexeID() {
        return sexeID;
    }

    public void setSexeID(int sexeID) {
        this.sexeID = sexeID;
    }

    public int getLangueID() {
        return langueID;
    }

    public void setLangueID(int langueID) {
        this.langueID = langueID;
    }

    public String getsNomCompagnie() {
        return sNomCompagnie;
    }

    public void setsNomCompagnie(String sNomCompagnie) {
        this.sNomCompagnie = sNomCompagnie;
    }

    public String getsNom() {
        return sNom;
    }

    public void setsNom(String sNom) {
        this.sNom = sNom;
    }

    public String getsPrenom() {
        return sPrenom;
    }

    public void setsPrenom(String sPrenom) {
        this.sPrenom = sPrenom;
    }

    public String getsPassword() {
        return sPassword;
    }

    public void setsPassword(String sPassword) {
        this.sPassword = sPassword;
    }

    public String getsCourriel() {
        return sCourriel;
    }

    public void setsCourriel(String sCourriel) {
        this.sCourriel = sCourriel;
    }

    public boolean isbVerifCouriel() {
        return bVerifCouriel;
    }

    public void setbVerifCouriel(boolean bVerifCouriel) {
        this.bVerifCouriel = bVerifCouriel;
    }

    public boolean isbVerifFacebook() {
        return bVerifFacebook;
    }

    public void setbVerifFacebook(boolean bVerifFacebook) {
        this.bVerifFacebook = bVerifFacebook;
    }

    public boolean isbVerifLinkedIn() {
        return bVerifLinkedIn;
    }

    public void setbVerifLinkedIn(boolean bVerifLinkedIn) {
        this.bVerifLinkedIn = bVerifLinkedIn;
    }

    public boolean isbVerifTwitter() {
        return bVerifTwitter;
    }

    public void setbVerifTwitter(boolean bVerifTwitter) {
        this.bVerifTwitter = bVerifTwitter;
    }

    public String getsFacebook() {
        return sFacebook;
    }

    public void setsFacebook(String sFacebook) {
        this.sFacebook = sFacebook;
    }

    public String getsLinkedIn() {
        return sLinkedIn;
    }

    public void setsLinkedIn(String sLinkedIn) {
        this.sLinkedIn = sLinkedIn;
    }

    public String getsTwitter() {
        return sTwitter;
    }

    public void setsTwitter(String sTwitter) {
        this.sTwitter = sTwitter;
    }

    public String getsTelephone() {
        return sTelephone;
    }

    public void setsTelephone(String sTelephone) {
        this.sTelephone = sTelephone;
    }

    public String getsAdresse() {
        return sAdresse;
    }

    public void setsAdresse(String sAdresse) {
        this.sAdresse = sAdresse;
    }

    public String getsCodePostal() {
        return sCodePostal;
    }

    public void setsCodePostal(String sCodePostal) {
        this.sCodePostal = sCodePostal;
    }

    public String getsVile() {
        return sVile;
    }

    public void setsVile(String sVile) {
        this.sVile = sVile;
    }

    public Date getdLastConnected() {
        return dLastConnected;
    }

    public void setdLastConnected(Date dLastConnected) {
        this.dLastConnected = dLastConnected;
    }

    public double getDlRaitingClient() {
        return dlRaitingClient;
    }

    public void setDlRaitingClient(double dlRaitingClient) {
        this.dlRaitingClient = dlRaitingClient;
    }

    public double getDlRaitingServices() {
        return dlRaitingServices;
    }

    public void setDlRaitingServices(double dlRaitingServices) {
        this.dlRaitingServices = dlRaitingServices;
    }

    public String getsCheminImgProfile() {
        return sCheminImgProfile;
    }

    public void setsCheminImgProfile(String sCheminImgProfile) {
        this.sCheminImgProfile = sCheminImgProfile;
    }
    
    

}
