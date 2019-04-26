/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author victor
 */

public class Lirico implements Serializable {

    private static final long serialVersionUID = 1L;
    
    private Integer idLirico;
 
    private Estrofa idEstrofa;
    
    private String contenido;

    public Lirico(Integer idLirico, String contenido) {
        this.idLirico = idLirico;
        this.contenido = contenido;
    }
    
    


    public Lirico() {
    }

    public Lirico(Integer idLirico) {
        this.idLirico = idLirico;
    }

    public Integer getIdLirico() {
        return idLirico;
    }

    public void setIdLirico(Integer idLirico) {
        this.idLirico = idLirico;
    }

    public Estrofa getIdEstrofa() {
        return idEstrofa;
    }

    public void setIdEstrofa(Estrofa idEstrofa) {
        this.idEstrofa = idEstrofa;
    }


    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idLirico != null ? idLirico.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Lirico)) {
            return false;
        }
        Lirico other = (Lirico) object;
        if ((this.idLirico == null && other.idLirico != null) || (this.idLirico != null && !this.idLirico.equals(other.idLirico))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Lirico[ idLirico=" + idLirico + " ]";
    }
    
}
