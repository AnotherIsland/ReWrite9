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

public class Actos implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer idActos;

    private String escenario;

    private Collection<Dramatico> dramaticoCollection;



    public Actos() {
    }

    public Actos(Integer idActos) {
        this.idActos = idActos;
    }

    public Integer getIdActos() {
        return idActos;
    }

    public void setIdActos(Integer idActos) {
        this.idActos = idActos;
    }

    public String getEscenario() {
        return escenario;
    }

    public void setEscenario(String escenario) {
        this.escenario = escenario;
    }


    public void setDramaticoCollection(Collection<Dramatico> dramaticoCollection) {
        this.dramaticoCollection = dramaticoCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idActos != null ? idActos.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Actos)) {
            return false;
        }
        Actos other = (Actos) object;
        if ((this.idActos == null && other.idActos != null) || (this.idActos != null && !this.idActos.equals(other.idActos))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Actos[ idActos=" + idActos + " ]";
    }
    
}
