/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;



/**
 *
 * @author victor
 */

public class Obra implements Serializable {

    private static final long serialVersionUID = 1L;

    private int idObra;

    private String titulo;

    private String fecha;
  
    private String consejos;
    
    private String tipo;
    
    public Obra() {
    }
    public Obra(int _idObra, String _titulo,String _fecha,String _tipo) {
        idObra = _idObra;
        titulo = _titulo;
        fecha = _fecha;
        tipo = _tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getTipo() {
        return tipo;
    }

    public Obra(Integer idObra) {
        this.idObra = idObra;
    }

    public Integer getIdObra() {
        return idObra;
    }

    public void setIdObra(Integer idObra) {
        this.idObra = idObra;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getConsejos() {
        return consejos;
    }

    public void setConsejos(String consejos) {
        this.consejos = consejos;
    }

    

    @Override
    public String toString() {
        return "model.Obra[ idObra=" + idObra + " ]";
    }
    
}
