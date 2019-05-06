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
import model.Consejo;

/**
 *
 * @author ACIE
 */
public class AdminConsejos {
    
    ArrayList<Consejo> consejos = null;
    Consejo consejo = null;
    
    public ArrayList<Consejo> traeTodos(int idObra){
        
        DataBase db = new DataBase();
        ResultSet rs = null;
        consejos = new ArrayList();
        
        try {
            db.connect();
            rs = db.query("SELECT * FROM consejo inner join usuario on usuario.idUsuario = consejo.idUsuarioC"
                    + " WHERE idObraC = "+idObra);
            while(rs.next()){
                consejo = new Consejo(rs.getInt("idConsejo"), rs.getInt("idObraC"),
                        rs.getInt("idUsuarioC"), rs.getString("consejo"),
                        rs.getString("categoria"), rs.getString("usuario"));
                consejos.add(consejo);
                System.out.println(consejo);
            }                      
            db.closeConnection();
        } catch (SQLException error) {
            System.out.println(error.toString());
        }
        return consejos;
    }
    
    public ArrayList<Consejo> traePorCategoria(int idObra, String categoria){
        
        DataBase db = new DataBase();
        ResultSet rs = null;
        consejos = new ArrayList();
        
        try {
            db.connect();
            rs = db.query("SELECT * FROM consejo inner join usuario on usuario.idUsuario = consejo.idUsuarioC"
                    + " WHERE idObraC = "+idObra+" and categoria = '"+categoria+"';");
            while(rs.next()){
                consejo = new Consejo(rs.getInt("idConsejo"), rs.getInt("idObraC"),
                        rs.getInt("idUsuarioC"), rs.getString("consejo"),
                        rs.getString("categoria"), rs.getString("usuario"));
                consejos.add(consejo);
            }                       
            db.closeConnection();
        } catch (SQLException error) {
            System.out.println(error.toString());
        }
        return consejos;
    }
    
    public int[] traeTodosPorCategoria(int numCat){
        
        DataBase db = new DataBase();
        ResultSet rs = null;
        consejos = new ArrayList();
        
        int[] numCons = new int[numCat];
        int orto = 0;
        int clar = 0;
        int estr = 0;
        int rima = 0;
        int metr = 0;
        int tram = 0;
        int otro = 0;
        
        try {
            db.connect();
            rs = db.query("SELECT count(*) FROM consejo inner join usuario on usuario.idUsuario = consejo.idUsuarioC"
                    + " WHERE categoria = 'ortografia';");
            while(rs.next()){
                orto = rs.getInt("count(*)");
            } 
            rs = db.query("SELECT count(*) FROM consejo inner join usuario on usuario.idUsuario = consejo.idUsuarioC"
                    + " WHERE categoria = 'claridad';");
            while(rs.next()){
                clar = rs.getInt("count(*)");
            } 
            rs = db.query("SELECT count(*) FROM consejo inner join usuario on usuario.idUsuario = consejo.idUsuarioC"
                    + " WHERE categoria = 'estructura';");
            while(rs.next()){
                estr = rs.getInt("count(*)");
            } 
            rs = db.query("SELECT count(*) FROM consejo inner join usuario on usuario.idUsuario = consejo.idUsuarioC"
                    + " WHERE categoria = 'rima';");
            while(rs.next()){
                rima = rs.getInt("count(*)");
            } 
            rs = db.query("SELECT count(*) FROM consejo inner join usuario on usuario.idUsuario = consejo.idUsuarioC"
                    + " WHERE categoria = 'metrica';");
            while(rs.next()){
                metr = rs.getInt("count(*)");
            } 
            rs = db.query("SELECT count(*) FROM consejo inner join usuario on usuario.idUsuario = consejo.idUsuarioC"
                    + " WHERE categoria = 'trama';");
            while(rs.next()){
                tram = rs.getInt("count(*)");
            } 
            rs = db.query("SELECT count(*) FROM consejo inner join usuario on usuario.idUsuario = consejo.idUsuarioC"
                    + " WHERE categoria = 'otros';");
            while(rs.next()){
                otro = rs.getInt("count(*)");
            } 
            db.closeConnection();
        } catch (SQLException error) {
            System.out.println(error.toString());
        }
        
        numCons[0] = orto;
        numCons[1] = clar;
        numCons[2] = estr;
        numCons[3] = rima;
        numCons[4] = metr;
        numCons[5] = tram;
        numCons[6] = otro;
        return numCons;
    }
    
    
}
