/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Collection;



/**
 *
 * @author victor
 */

public class Ensayo implements Serializable {

    private static final long serialVersionUID = 1L;
  
    private Integer idEnsayo;
  
    private String intro;

    private String desarrollo;
    
    private String conclusion;
 
    private String referencias;




    public Ensayo() {
    }

    public Ensayo(Integer idEnsayo) {
        this.idEnsayo = idEnsayo;
    }

    public Ensayo(Integer idEnsayo, String intro, String desarrollo, String conclusion, String referencias) {
        this.idEnsayo = idEnsayo;
        this.intro = intro;
        this.desarrollo = desarrollo;
        this.conclusion = conclusion;
        this.referencias = referencias;
    }
    
    

    public Integer getIdEnsayo() {
        return idEnsayo;
    }

    public void setIdEnsayo(Integer idEnsayo) {
        this.idEnsayo = idEnsayo;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public String getDesarrollo() {
        return desarrollo;
    }

    public void setDesarrollo(String desarrollo) {
        this.desarrollo = desarrollo;
    }
    
        public String getReferencias() {
        return referencias;
    }

    public void setReferencias(String referencias) {
        this.referencias = referencias;
    }

    public String getConclusion() {
        return conclusion;
    }

    public void setConclusion(String conclusion) {
        this.conclusion = conclusion;
    }

    

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idEnsayo != null ? idEnsayo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Ensayo)) {
            return false;
        }
        Ensayo other = (Ensayo) object;
        if ((this.idEnsayo == null && other.idEnsayo != null) || (this.idEnsayo != null && !this.idEnsayo.equals(other.idEnsayo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Ensayo[ idEnsayo=" + idEnsayo + " ]";
    }
    
}
