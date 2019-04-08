
package model;

import java.sql.Date;

public class Mantenimiento {
    private int _idreporteMant = 0;
    private String _contenido = null;
    private Date _fecha_inicio = null;
    private Date _fecha_conclusion = null;
    private int _idUsuario1Levanta = 0;
    private int _idUsuario1Asigna = 0;
    
    
    public Mantenimiento() {
    }

    public Mantenimiento(Date fecha_inicio, String contenido, int idUsuario1Levanta) {
        _fecha_inicio = fecha_inicio;
        _contenido = contenido; 
        _idUsuario1Levanta = idUsuario1Levanta; 
    }
    public Mantenimiento(int idreporteMant,Date fecha_inicio,Date fecha_conclusion, 
            String contenido, int idUsuario1Levanta, int idUsuario1Asigna) {
        _idreporteMant = idreporteMant;
        _fecha_inicio = fecha_inicio;
        _fecha_conclusion = fecha_conclusion;
        _contenido = contenido; 
        _idUsuario1Levanta = idUsuario1Levanta;
        _idUsuario1Asigna = idUsuario1Asigna;
    }
    
    public Mantenimiento(int idreporteMant,Date fecha_inicio,Date fecha_conclusion,
            String contenido) {
        _idreporteMant = idreporteMant;
        _fecha_inicio = fecha_inicio;
        _fecha_conclusion = fecha_conclusion;
        _contenido = contenido;
    }

    public int getIdreporteMant() {
        return _idreporteMant;
    }

    public void setIdreporteMant(int _idreporteMant) {
        this._idreporteMant = _idreporteMant;
    }

    public String getContenido() {
        return _contenido;
    }

    public void setContenido(String _contenido) {
        this._contenido = _contenido;
    }

    public Date getFecha_inicio() {
        return _fecha_inicio;
    }

    public void setFecha_inicio(Date _fecha_inicio) {
        this._fecha_inicio = _fecha_inicio;
    }

    public Date getFecha_conclusion() {
        return _fecha_conclusion;
    }

    public void setFecha_conclusion(Date _fecha_conclusion) {
        this._fecha_conclusion = _fecha_conclusion;
    }

    public int getIdUsuario1Levanta() {
        return _idUsuario1Levanta;
    }

    public void setIdUsuario1Levanta(int _idUsuario1Levanta) {
        this._idUsuario1Levanta = _idUsuario1Levanta;
    }

    public int getIdUsuario1Asigna() {
        return _idUsuario1Asigna;
    }

    public void setIdUsuario1Asigna(int _idUsuario1Asigna) {
        this._idUsuario1Asigna = _idUsuario1Asigna;
    }

    
    
}
