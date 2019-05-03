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

public class Tipo implements Serializable {

    private static final long serialVersionUID = 1L;
    
    private Integer idTipo;
    
    private String nombre;
    
    private Integer numVersos;
    
    private Integer rima;
    

    public Tipo() {
    }

    public Tipo(Integer idTipo) {
        this.idTipo = idTipo;
    }

    public Integer getIdTipo() {
        return idTipo;
    }

    public void setIdTipo(Integer idTipo) {
        this.idTipo = idTipo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Integer getNumVersos() {
        return numVersos;
    }

    public void setNumVersos(Integer numVersos) {
        this.numVersos = numVersos;
    }

    public Integer getRima() {
        return rima;
    }

    public void setRima(Integer rima) {
        this.rima = rima;
    }

    

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idTipo != null ? idTipo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Tipo)) {
            return false;
        }
        Tipo other = (Tipo) object;
        if ((this.idTipo == null && other.idTipo != null) || (this.idTipo != null && !this.idTipo.equals(other.idTipo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Tipo[ idTipo=" + idTipo + " ]";
    }
    
}
