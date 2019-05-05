/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author ACIE
 */
public class Consejo {
    
    private int _idConsejo = 0;
    private int _idObra = 0;
    private int _idUsuario = 0;
    private String _consejo = "";
    private String _categoria = "";
    private String _usuario = "";
    
    public Consejo() {
    }
    
    public Consejo(int idConsejo, int idObra, int idUsuario, String consejo, String categoria, String usuario) {
        this._idConsejo = idConsejo;
        this._idObra = idObra;
        this._idUsuario = idUsuario;
        this._consejo = consejo;
        this._categoria = categoria;
        this._usuario = usuario;
    }   

    public String getUsuario() {
        return _usuario;
    }

    public void setUsuario(String _usuario) {
        this._usuario = _usuario;
    }
    
    

    public int getIdConsejo() {
        return _idConsejo;
    }

    public void setIdConsejo(int _idConsejo) {
        this._idConsejo = _idConsejo;
    }

    public int getIdObra() {
        return _idObra;
    }

    public void setIdObra(int _idObra) {
        this._idObra = _idObra;
    }

    public int getIdUsuario() {
        return _idUsuario;
    }

    public void setIdUsuario(int _idUsuario) {
        this._idUsuario = _idUsuario;
    }

    public String getConsejo() {
        return _consejo;
    }

    public void setConsejo(String _consejo) {
        this._consejo = _consejo;
    }

    public String getCategoria() {
        return _categoria;
    }

    public void setCategoria(String _categoria) {
        this._categoria = _categoria;
    }

    @Override
    public String toString() {
        return "Consejo{" + "_idConsejo=" + _idConsejo + ", _idObra=" + _idObra + ", _idUsuario=" + _idUsuario + ", _consejo=" + _consejo + ", _categoria=" + _categoria + ", _usuario=" + _usuario + '}';
    }

    
}
