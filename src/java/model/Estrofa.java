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

public class Estrofa implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer idEstrofa;

    private String versos;

    private Collection<Lirico> liricoCollection;

    public Estrofa() {
    }

    public Estrofa(Integer idEstrofa) {
        this.idEstrofa = idEstrofa;
    }

    public Integer getIdEstrofa() {
        return idEstrofa;
    }

    public void setIdEstrofa(Integer idEstrofa) {
        this.idEstrofa = idEstrofa;
    }

    public String getVersos() {
        return versos;
    }

    public void setVersos(String versos) {
        this.versos = versos;
    }

    @XmlTransient
    public Collection<Lirico> getLiricoCollection() {
        return liricoCollection;
    }

    public void setLiricoCollection(Collection<Lirico> liricoCollection) {
        this.liricoCollection = liricoCollection;
    }



    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idEstrofa != null ? idEstrofa.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Estrofa)) {
            return false;
        }
        Estrofa other = (Estrofa) object;
        if ((this.idEstrofa == null && other.idEstrofa != null) || (this.idEstrofa != null && !this.idEstrofa.equals(other.idEstrofa))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Estrofa[ idEstrofa=" + idEstrofa + " ]";
    }
    
}
