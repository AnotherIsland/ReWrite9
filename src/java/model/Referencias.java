/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;

import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author victor
 */

public class Referencias implements Serializable {

    private static final long serialVersionUID = 1L;
    
    private Integer idReferencias;

    private String tipoRef;

    private String autor;

    private String año;

    private Date fechaConsulta;

    private String datos;
 
    public Referencias() {
    }

    public Referencias(Integer idReferencias) {
        this.idReferencias = idReferencias;
    }

    public Integer getIdReferencias() {
        return idReferencias;
    }

    public void setIdReferencias(Integer idReferencias) {
        this.idReferencias = idReferencias;
    }

    public String getTipoRef() {
        return tipoRef;
    }

    public void setTipoRef(String tipoRef) {
        this.tipoRef = tipoRef;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public String getAño() {
        return año;
    }

    public void setAño(String año) {
        this.año = año;
    }

    public Date getFechaConsulta() {
        return fechaConsulta;
    }

    public void setFechaConsulta(Date fechaConsulta) {
        this.fechaConsulta = fechaConsulta;
    }

    public String getDatos() {
        return datos;
    }

    public void setDatos(String datos) {
        this.datos = datos;
    }


    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idReferencias != null ? idReferencias.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Referencias)) {
            return false;
        }
        Referencias other = (Referencias) object;
        if ((this.idReferencias == null && other.idReferencias != null) || (this.idReferencias != null && !this.idReferencias.equals(other.idReferencias))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Referencias[ idReferencias=" + idReferencias + " ]";
    }
    
}
