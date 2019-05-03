/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Database.DataBase;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Ensayo;
import model.Lienzo;
import model.Lirico;
import model.Narrativo;
import model.Obra;
import model.Resumen;

/**
 *
 * @author ACIE-PC
 */
public class AdminObras {
    
    private Obra _obra = null;
    private Ensayo _ens = null;
    private Resumen _res = null;
    private Lirico _lir = null;
    private Narrativo _nar = null;
    private Lienzo _lie = null;
    private int _idObraTipo = 0;

    public int getIdObraTipo() {
        return _idObraTipo;
    }

    public void setIdObraTipo(int idObraTipo) {
        this._idObraTipo = idObraTipo;
    }

    public Obra getObra() {
        return _obra;
    }

    public void setObra(Obra _obra) {
        this._obra = _obra;
    }

    public Ensayo getEns() {
        return _ens;
    }

    public void setEns(Ensayo _ens) {
        this._ens = _ens;
    }

    public Resumen getRes() {
        return _res;
    }

    public void setRes(Resumen _res) {
        this._res = _res;
    }

    public Lirico getLir() {
        return _lir;
    }

    public void setLir(Lirico _lir) {
        this._lir = _lir;
    }

    public Narrativo getNar() {
        return _nar;
    }

    public void setNar(Narrativo _nar) {
        this._nar = _nar;
    }

    public Lienzo getLie() {
        return _lie;
    }

    public void setLie(Lienzo _lie) {
        this._lie = _lie;
    }
    
    public int buscaObraporTitulo(String titulo, int idUsuario ){
        DataBase db = new DataBase();
        ResultSet rs = null;
        int idObra = 0;
        
        try {
            db.connect();
            rs = db.query("select * from obra inner join relobrausu on relobrausu.idObra = obra.idObra"
                    + " where idUsuario ="+idUsuario+" and obra.titulo = '"+titulo+"';");
            if(rs.next()){
                idObra = rs.getInt("idObra");
            }                      
            db.closeConnection();
        } catch (SQLException error) {
            System.out.println(error.toString());
        }
        
        return idObra;
    }
    
    
    
    public Obra buscaObraporID(int idObra){
        
        DataBase db = new DataBase();
        ResultSet rs = null;

        //Datos a obtener de la obra
        Obra obraX = null;
        String titulo = "";
        String fecha = "";
        String tipo = "";

        try {
            db.connect();
            rs = db.query("select * from obra where idObra ="+idObra+";");
            while(rs.next()){
                idObra = rs.getInt("idObra");
                titulo = rs.getString("titulo");
                fecha = rs.getString("fecha");
                tipo = rs.getString("tipo");

                System.out.println("Obra: "+idObra+" titulo: "+titulo+" tipo: "+tipo+" fecha: "+fecha);

                obraX = new Obra(idObra, titulo, fecha, tipo);
                
                _obra = obraX;
                                
                int type = Integer.parseInt(tipo);
                String tipoo = "";
                String idObraTipo = "";

                if(type == 1){
                    tipoo = "ensayo";
                    idObraTipo = "idObra2";
                }else if(type == 2){
                    tipoo = "resumen";
                    idObraTipo = "idObra1";
                }else if(type == 3){
                    tipoo = "narrativo";
                    idObraTipo = "idObra4";
                }else if(type == 4){
                    tipoo = "lirico";
                    idObraTipo = "idObra5";
                }else if(type == 5){
                    tipoo = "lienzo";
                    idObraTipo = "idObra7";
                }
                
                buscaObraPorTipo(tipoo, idObraTipo, idObra, type);
            }                      
            db.closeConnection();
        } catch (SQLException error) {
            System.out.println(error.toString());
        }
        
        return _obra;
    }
    
    public int buscaObraPorTipo(String tipoo, String idObraTipo, int idObra, int type){
        
        DataBase db = new DataBase();
        ResultSet rs = null;

        //Variables que dependen del tipo de texto
        String intro = "";
        String desa = "";
        String conclu = "";
        String refe = " ";
        String contenido = "";
        String claves = "";
        String expo = "";
        String dese = "";
        String clim = "";

        try {
            db.connect();
            rs = db.query("select * from "+tipoo+" inner join obra on "+tipoo+"."+idObraTipo+" = obra.idObra "
                    + " where idObra ="+idObra);
                    System.out.println("select * from "+tipoo+" inner join obra on "+tipoo+"."+idObraTipo+" = obra.idObra "
                    + " where idObra ="+idObra);
            while(rs.next()){
                System.out.println("Tipo de obra consultado: "+tipoo);
                _idObraTipo = rs.getInt("id"+tipoo);
                System.out.println("ID por tipo de obra: "+_idObraTipo);
                //tipoo = rs.getString("tipo");
                if(type == 1){//Ensayo
                    intro = rs.getString("intro");
                    desa = rs.getString("desarrollo");
                    conclu = rs.getString("conclusion");
                    refe = rs.getString("referencias");
                    _ens = new Ensayo(rs.getInt("idensayo"),intro,desa,conclu,refe);
                    System.out.println("Ensayo"+rs.getInt("idensayo")+"_intro: "+intro+"_Desa: "+desa+"_Con: "+conclu+"_Ref: "+refe );
                }else if(type == 2){//Resumen
                    contenido = rs.getString("contenido");
                    claves = rs.getString("claves");
                    refe = rs.getString("referencias");
                    _res = new Resumen(rs.getInt("idresumen"),contenido,claves,refe);
                    System.out.println("Resumen"+rs.getInt("idresumen")+"_cont: "+contenido+"_claves: "+claves );
                }else if(type == 3){//Narrativo
                    expo = rs.getString("exposicion");
                    desa = rs.getString("desarrollo");
                    clim = rs.getString("climax");
                    dese = rs.getString("descenlace");
                    _nar = new Narrativo(rs.getInt("idnarrativo"),expo,desa,clim, dese);
                    System.out.println("Resumen"+rs.getInt("idnarrativo")+"_expo: "+expo+"_desa: "+desa
                            +"_clim: "+clim+"_dese: "+dese );
                }else if(type == 4){//Lirico
                    contenido = rs.getString("contenido");
                    _lir = new Lirico(rs.getInt("idlirico"),contenido);
                    System.out.println("Lirico"+rs.getInt("idlirico")+"_cont: "+contenido);
                }else if(type == 5){//Lienzo
                    contenido = rs.getString("contenido");
                    _lie = new Lienzo(contenido, rs.getInt("idlienzo"));
                    System.out.println("Lienzo"+rs.getInt("idlienzo")+"_cont: "+contenido );
                }  
                
                
            }                      
            db.closeConnection();
        } catch (SQLException error) {
            System.out.println(error.toString());
        }
        return _idObraTipo;
    }
    
    public ArrayList<String> traeClaves(String claves){
        ArrayList<String> clavs = new ArrayList();
        String guarda = "";
        
        for(int y = 0; y < claves.length();y++){ 
            if(claves.charAt(y)!='&'){
                guarda = guarda + claves.charAt(y);
            } else {
                clavs.add(guarda);
                guarda = "";
            }
        }
        return clavs;
    }
    
    public ArrayList<String> traeRefes(String refes){
        ArrayList<String> refs = new ArrayList();
        String guarda = "";
        
        for(int y = 0; y < refes.length();y++){ 
            if(refes.charAt(y)!='&'){
                guarda = guarda + refes.charAt(y);
            } else {
                refs.add(guarda);
                System.out.println(guarda);
                guarda = "";
            }
        }
        return refs;
    }
    
    public ArrayList<Obra> buscaObrasIdUsuario(int idUs){
        
        //Datos a obtener de la obra
            ArrayList <Obra> obras = new ArrayList();
            Obra obraX = null;
            int idObra = 0;
            String titulo = "";
            String fecha = "";
            String tipo = "";
            ResultSet rs = null;
            DataBase db = new DataBase();

            try {
                db.connect();
                rs = db.query("select * from obra inner join relobrausu on relobrausu.idObra = obra.idObra where idUsuario ="+idUs+";");
                while(rs.next()){
                    idObra = rs.getInt("idObra");
                    titulo = rs.getString("titulo");
                    fecha = rs.getString("fecha");
                    tipo = rs.getString("tipo");

                    obraX = new Obra(idObra, titulo, fecha, tipo);
                    obras.add(obraX);
                }                      
                db.closeConnection();
            } catch (SQLException error) {
                System.out.println(error.toString());
            }
        return obras;
        
    }
    
    
    
}
