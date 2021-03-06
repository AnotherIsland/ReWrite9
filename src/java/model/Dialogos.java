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

public class Dialogos implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer idDialogos;

    private String contenido;

    private String acotaciones;

  

    public Dialogos() {
    }

    public Dialogos(Integer idDialogos) {
        this.idDialogos = idDialogos;
    }

    public Integer getIdDialogos() {
        return idDialogos;
    }

    public void setIdDialogos(Integer idDialogos) {
        this.idDialogos = idDialogos;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public String getAcotaciones() {
        return acotaciones;
    }

    public void setAcotaciones(String acotaciones) {
        this.acotaciones = acotaciones;
    }


    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idDialogos != null ? idDialogos.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Dialogos)) {
            return false;
        }
        Dialogos other = (Dialogos) object;
        if ((this.idDialogos == null && other.idDialogos != null) || (this.idDialogos != null && !this.idDialogos.equals(other.idDialogos))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Dialogos[ idDialogos=" + idDialogos + " ]";
    }
    
}
