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

public class Resumen implements Serializable {

    private static final long serialVersionUID = 1L;
    private Integer idResumen;
    private String contenido;
    private String claves;
    private String referencias;

 
    private Integer idReferencias;

    public Resumen() {
        
    }

    public Resumen(Integer idResumen, String contenido, String claves, String referencias) {
        this.idResumen = idResumen;
        this.contenido = contenido;
        this.claves = claves;
        this.referencias = referencias;
    }
    
    

    public Resumen(Integer idResumen) {
        this.idResumen = idResumen;
    }

    public Integer getIdResumen() {
        return idResumen;
    }

    public void setIdResumen(Integer idResumen) {
        this.idResumen = idResumen;
    }
    
       public String getReferencias() {
        return referencias;
    }

    public void setReferencias(String referencias) {
        this.referencias = referencias;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public String getClaves() {
        return claves;
    }

    public void setClaves(String claves) {
        this.claves = claves;
    }

    public Integer getIdReferencias() {
        return idReferencias;
    }

    public void setIdReferencias(Integer idReferencias) {
        this.idReferencias = idReferencias;
    }


    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idResumen != null ? idResumen.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Resumen)) {
            return false;
        }
        Resumen other = (Resumen) object;
        if ((this.idResumen == null && other.idResumen != null) || (this.idResumen != null && !this.idResumen.equals(other.idResumen))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Resumen[ idResumen=" + idResumen + " ]";
    }
    
}
