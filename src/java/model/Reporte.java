/*
 * To change this license header; choose License Headers in Project Properties.
 * To change this template file; choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author ACIE-PC
 */
public class Reporte {
    
    private int _idReporte = 0;
    private Date _fecha_inicio = null;
    private Date _fecha_resolucion = null;
    private Date _fecha_conclusion = null;
    private String _etiqueta = "";
    private String _contenido = ""; 
    private int _idUsuarioLevanta = 0;
    private int _idUsuarioAsigna = 0;
    private int _idUsuarioCierra = 0; 
    private int _idUsuarioEscritor = 0; 
    private String _usuarioLevanta = "";

    public String getUsuarioLevanta() {
        return _usuarioLevanta;
    }

    public void setUsuarioLevanta(String _usuarioLevanta) {
        this._usuarioLevanta = _usuarioLevanta;
    }

    public String getUsuarioAsigna() {
        return _usuarioAsigna;
    }

    public void setUsuarioAsigna(String _usuarioAsigna) {
        this._usuarioAsigna = _usuarioAsigna;
    }

    public String getUsuarioCierra() {
        return _usuarioCierra;
    }

    public void setUsuarioCierra(String _usuarioCierra) {
        this._usuarioCierra = _usuarioCierra;
    }
    private String _usuarioAsigna = "";
    private String _usuarioCierra = "";
    
    public Reporte() {
    }

    public Reporte(Date fecha_inicio, String contenido, int idUsuarioEscritor, int idUsuarioLevanta) {
        _fecha_inicio = fecha_inicio;
        _contenido = contenido; 
        _idUsuarioEscritor = idUsuarioEscritor; 
        _idUsuarioLevanta = idUsuarioLevanta; 
    }
    public Reporte(int idReporte,Date fecha_inicio,Date fecha_resolucion,Date fecha_conclusion,
            String etiqueta, String contenido, int idUsuarioLevanta, int idUsuarioAsigna,
            int idUsuarioCierra, int idUsuarioEscritor, String usuarioLevanta, String usuarioAsigna,
            String usuarioCierra) {
        _idReporte = idReporte;
        _fecha_inicio = fecha_inicio;
        _fecha_resolucion = fecha_resolucion;
        _fecha_conclusion = fecha_conclusion;
        _etiqueta = etiqueta;
        _contenido = contenido; 
        _idUsuarioLevanta = idUsuarioLevanta;
        _idUsuarioAsigna = idUsuarioAsigna;
        _idUsuarioCierra = idUsuarioCierra; 
        _idUsuarioEscritor = idUsuarioEscritor; 
        _usuarioLevanta = usuarioLevanta;
        _usuarioAsigna = usuarioLevanta;
        _usuarioCierra = usuarioLevanta;
    }
    
    public Reporte(int idReporte,Date fecha_inicio,Date fecha_resolucion,Date fecha_conclusion,
            String etiqueta, String contenido,int idUsuarioEscritor, String usuarioLevanta, 
            String usuarioAsigna,String usuarioCierra) {
        _idReporte = idReporte;
        _fecha_inicio = fecha_inicio;
        _fecha_resolucion = fecha_resolucion;
        _fecha_conclusion = fecha_conclusion;
        _etiqueta = etiqueta;
        _contenido = contenido; 
        _usuarioLevanta = usuarioLevanta;
        _usuarioCierra = usuarioCierra;
        _usuarioAsigna = usuarioAsigna;
        _idUsuarioEscritor = idUsuarioEscritor; 
        
    }

    public int getIdReporte() {
        return _idReporte;
    }

    public Date getFecha_inicio() {
        return _fecha_inicio;
    }

    public Date getFecha_resolucion() {
        return _fecha_resolucion;
    }

    public Date getFecha_conclusion() {
        return _fecha_conclusion;
    }

    public String getEtiqueta() {
        return _etiqueta;
    }

    public String getContenido() {
        return _contenido;
    }

    public int getIdUsuarioLevanta() {
        return _idUsuarioLevanta;
    }

    public int getIdUsuarioAsigna() {
        return _idUsuarioAsigna;
    }

    public int getIdUsuarioCierra() {
        return _idUsuarioCierra;
    }

    public int getIdUsuarioEscritor() {
        return _idUsuarioEscritor;
    }

    public void setIdReporte(int _idReporte) {
        this._idReporte = _idReporte;
    }

    public void setFecha_inicio(Date _fecha_inicio) {
        this._fecha_inicio = _fecha_inicio;
    }

    public void setFecha_resolucion(Date _fecha_resolucion) {
        this._fecha_resolucion = _fecha_resolucion;
    }

    public void setFecha_conclusion(Date _fecha_conclusion) {
        this._fecha_conclusion = _fecha_conclusion;
    }

    public void setEtiqueta(String _etiqueta) {
        this._etiqueta = _etiqueta;
    }

    public void setContenido(String _contenido) {
        this._contenido = _contenido;
    }

    public void setIdUsuarioLevanta(int _idUsuarioLevanta) {
        this._idUsuarioLevanta = _idUsuarioLevanta;
    }

    public void setIdUsuarioAsigna(int _idUsuarioAsigna) {
        this._idUsuarioAsigna = _idUsuarioAsigna;
    }

    public void setIdUsuarioCierra(int _idUsuarioCierra) {
        this._idUsuarioCierra = _idUsuarioCierra;
    }

    public void setIdUsuarioEscritor(int _idUsuarioEscritor) {
        this._idUsuarioEscritor = _idUsuarioEscritor;
    }
    
    
    
    
}
