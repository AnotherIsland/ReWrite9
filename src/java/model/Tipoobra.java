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

public class Tipoobra implements Serializable {

    private static final long serialVersionUID = 1L;
    
    private Integer idTipoObra;
    
    private String tipoObra;
    
    public Tipoobra() {
    }

    public Tipoobra(Integer idTipoObra) {
        this.idTipoObra = idTipoObra;
    }

    public Integer getIdTipoObra() {
        return idTipoObra;
    }

    public void setIdTipoObra(Integer idTipoObra) {
        this.idTipoObra = idTipoObra;
    }

    public String getTipoObra() {
        return tipoObra;
    }

    public void setTipoObra(String tipoObra) {
        this.tipoObra = tipoObra;
    }

    

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idTipoObra != null ? idTipoObra.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Tipoobra)) {
            return false;
        }
        Tipoobra other = (Tipoobra) object;
        if ((this.idTipoObra == null && other.idTipoObra != null) || (this.idTipoObra != null && !this.idTipoObra.equals(other.idTipoObra))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Tipoobra[ idTipoObra=" + idTipoObra + " ]";
    }
    
}
