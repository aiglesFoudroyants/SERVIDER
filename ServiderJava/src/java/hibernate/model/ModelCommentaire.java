/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hibernate.model;

/**
 *
 * @author hugo
 */
public class ModelCommentaire {
    public String nom;
    public String commentaire;

    public ModelCommentaire(String nomCommentateur, String commentaire) {
        this.nom = nomCommentateur;
        this.commentaire = commentaire;
    }

    
    public String getNomCommentateru() {
        return nom;
    }

    public void setNomCommentater(String nomCommentater) {
        this.nom = nomCommentater;
    }

    public String getCommentaire() {
        return commentaire;
    }

    public void setCommentaire(String commentaire) {
        this.commentaire = commentaire;
    }
    
    
    
}
