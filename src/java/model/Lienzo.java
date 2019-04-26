/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author ACIE-PC
 */
public class Lienzo {
    private String contenido;
    private int idlienzo;

    public Lienzo(String contenido, int idlienzo) {
        this.contenido = contenido;
        this.idlienzo = idlienzo;
    }

    public Lienzo() {
    }

    @Override
    public String toString() {
        return "Lienzo{" + "contenido=" + contenido + ", idlienzo=" + idlienzo + '}';
    }
    
    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public int getIdlienzo() {
        return idlienzo;
    }

    public void setIdlienzo(int idlienzo) {
        this.idlienzo = idlienzo;
    }
    
    
}
