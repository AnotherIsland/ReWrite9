/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Collection;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author victor
 */

public class Apendices implements Serializable {

    private static final long serialVersionUID = 1L;
    private Integer idApendices;
    private String titulo;
    private String contenido;


    public Apendices() {
    }

    public Apendices(Integer idApendices) {
        this.idApendices = idApendices;
    }

    public Integer getIdApendices() {
        return idApendices;
    }

    public void setIdApendices(Integer idApendices) {
        this.idApendices = idApendices;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }



    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idApendices != null ? idApendices.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Apendices)) {
            return false;
        }
        Apendices other = (Apendices) object;
        if ((this.idApendices == null && other.idApendices != null) || (this.idApendices != null && !this.idApendices.equals(other.idApendices))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Apendices[ idApendices=" + idApendices + " ]";
    }
    
}
