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

public class Narrativo implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer idNarrativo;

    private String exposicion;

    private String desarrollo;

    private String desenlace;
  
    private String climax;

    public Narrativo() {
    }

    public Narrativo(Integer idNarrativo) {
        this.idNarrativo = idNarrativo;
    }

    public Integer getIdNarrativo() {
        return idNarrativo;
    }

    public void setIdNarrativo(Integer idNarrativo) {
        this.idNarrativo = idNarrativo;
    }

    public String getExposicion() {
        return exposicion;
    }

    public void setExposicion(String exposicion) {
        this.exposicion = exposicion;
    }

    public String getDesarrollo() {
        return desarrollo;
    }

    public void setDesarrollo(String desarrollo) {
        this.desarrollo = desarrollo;
    }

    public String getDesenlace() {
        return desenlace;
    }

    public void setDesenlace(String desenlace) {
        this.desenlace = desenlace;
    }

    public String getClimax() {
        return climax;
    }

    public void setClimax(String climax) {
        this.climax = climax;
    }

   

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idNarrativo != null ? idNarrativo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Narrativo)) {
            return false;
        }
        Narrativo other = (Narrativo) object;
        if ((this.idNarrativo == null && other.idNarrativo != null) || (this.idNarrativo != null && !this.idNarrativo.equals(other.idNarrativo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Narrativo[ idNarrativo=" + idNarrativo + " ]";
    }
    
}
