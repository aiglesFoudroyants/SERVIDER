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
@Table(name = "Commentaire")
public class Commentaire  implements  Serializable{ 
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
    
    
    
    
    
    
    
    
    
    
}
