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
    
    
}
