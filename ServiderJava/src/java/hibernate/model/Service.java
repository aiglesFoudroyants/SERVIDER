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
@Table(name = "Service")
public class Service implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idService", nullable = false)
    private int id;
    
    @Column(name = "utilisateurId", nullable = false)
    private int utilisateurId;
    
    @Column(name = "typeServiceId", nullable = false)
    private int typeServiceId;

    @Column(name = "bActif", nullable = false)
    private boolean actif;

    public Service() {
    }

    public Service(int utilisateurId, int typeServiceId) {
        this.utilisateurId = utilisateurId;
        this.typeServiceId = typeServiceId;
        this.actif = false;
    }   
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUtilisateurId(int utilisateurId) {
        this.utilisateurId = utilisateurId;
    }

    public void setTypeServiceId(int typeServiceId) {
        this.typeServiceId = typeServiceId;
    }
    
    

    public int getUtilisateurId() {
        return utilisateurId;
    }
    
    public int getTypeServiceId() {
        return typeServiceId;
    }

    public boolean isActif() {
        return actif;
    }

    public void setActif(boolean actif) {
        this.actif = actif;
    }

    
}
