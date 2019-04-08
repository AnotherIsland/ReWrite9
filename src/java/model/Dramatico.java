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

public class Dramatico implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer idDramatico;


    private Actos idActos;

    public Dramatico() {
    }

    public Dramatico(Integer idDramatico) {
        this.idDramatico = idDramatico;
    }

    public Integer getIdDramatico() {
        return idDramatico;
    }

    public void setIdDramatico(Integer idDramatico) {
        this.idDramatico = idDramatico;
    }



    public Actos getIdActos() {
        return idActos;
    }

    public void setIdActos(Actos idActos) {
        this.idActos = idActos;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idDramatico != null ? idDramatico.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Dramatico)) {
            return false;
        }
        Dramatico other = (Dramatico) object;
        if ((this.idDramatico == null && other.idDramatico != null) || (this.idDramatico != null && !this.idDramatico.equals(other.idDramatico))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Dramatico[ idDramatico=" + idDramatico + " ]";
    }
    
}
