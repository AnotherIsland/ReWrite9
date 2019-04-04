/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soporte;

import Database.DataBase;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Reporte;

/**
 *
 * @author ACIE-PC
 */
public class ConsultaReporte {
    
    DataBase db = new DataBase();
    
    
    Reporte rep = null;
    ArrayList <Reporte> repsNA = new ArrayList();//Lista de reportes no asignados
    ArrayList <Reporte> repsPen = new ArrayList();//Lista de reportes pendientes
    ArrayList <Reporte> repsCerr = new ArrayList();//Lista de reportes cerrados
    
    int folio = 0;                                          
    String levanta= "";  
    String asigna= "";  
    String cierra= ""; 

    String usuario= "";  
    Date fInicio= null;       
    Date fResol= null;       
    Date fTermino= null;
    
    public ConsultaReporte() {
    }
    
    
    public void consultaTodos(){
        ResultSet rs;
        try{
            db.connect();
            rs = db.query("select * from reporte where etiqueta = 'No asignado';");

            while(rs.next()) {
                levanta= consultaUsuario(rs.getInt("idUsuarioLevanta"));  
                asigna= consultaUsuario(rs.getInt("idUsuarioAsigna"));  
                cierra= consultaUsuario(rs.getInt("idUsuarioCierra")); 
                rep = new Reporte(rs.getInt("idReporte"), rs.getDate("fecha_inicio"), 
                        rs.getDate("fecha_resolucion"),rs.getDate("fecha_conclusion") ,
                        rs.getString("etiqueta") ,rs.getString("contenido") ,
                        rs.getInt("idUsuarioEscritor"),levanta,asigna,cierra);
                repsNA.add(rep);
            }

            rs = db.query("select * from reporte where etiqueta = 'Pendiente';");

            while(rs.next()) {
                levanta= consultaUsuario(rs.getInt("idUsuarioLevanta"));  
                asigna= consultaUsuario(rs.getInt("idUsuarioAsigna"));  
                cierra= consultaUsuario(rs.getInt("idUsuarioCierra")); 
                rep = new Reporte(rs.getInt("idReporte"), rs.getDate("fecha_inicio"), 
                        rs.getDate("fecha_resolucion"),rs.getDate("fecha_conclusion") ,
                        rs.getString("etiqueta") ,rs.getString("contenido") ,
                        rs.getInt("idUsuarioEscritor"),levanta,asigna,cierra);
                repsPen.add(rep);
            }

            rs = db.query("select * from reporte where etiqueta = 'Cerrado';");

            while(rs.next()) {
                levanta= consultaUsuario(rs.getInt("idUsuarioLevanta"));  
                asigna= consultaUsuario(rs.getInt("idUsuarioAsigna"));  
                cierra= consultaUsuario(rs.getInt("idUsuarioCierra")); 
                rep = new Reporte(rs.getInt("idReporte"), rs.getDate("fecha_inicio"), 
                        rs.getDate("fecha_resolucion"),rs.getDate("fecha_conclusion") ,
                        rs.getString("etiqueta") ,rs.getString("contenido") ,
                        rs.getInt("idUsuarioEscritor"),levanta,asigna,cierra);
                repsCerr.add(rep);
            }
            db.closeConnection();
        }
        catch(SQLException error){
            System.out.println(error.toString());
        }
    }
      
    public ArrayList<Reporte> consultaNA(){
        
        DataBase dbNA = new DataBase();
        ResultSet rsN = null;
        try{
            dbNA.connect();
            rsN = dbNA.query("select * from reporte where etiqueta = 'No asignado';");

            do {
                System.out.println("El reporte es:"+rsN.getInt("idReporte")+" - "+rsN.getString("contenido"));
                levanta= consultaUsuario(rsN.getInt("idUsuarioLevanta"));  
                asigna= consultaUsuario(rsN.getInt("idUsuarioAsigna"));  
                cierra= consultaUsuario(rsN.getInt("idUsuarioCierra")); 
                rep = new Reporte(rsN.getInt("idReporte"), rsN.getDate("fecha_inicio"), 
                        rsN.getDate("fecha_resolucion"),rsN.getDate("fecha_conclusion") ,
                        rsN.getString("etiqueta") ,rsN.getString("contenido") ,
                        rsN.getInt("idUsuarioEscritor"),levanta,asigna,cierra);
                repsNA.add(rep);
            }while(rsN.next());
            dbNA.closeConnection();
        }
        catch(SQLException error){
            System.out.println(error.toString());
        }
        return repsNA;
        
    }
    
    public ArrayList<Reporte> consultaPen(){
        ResultSet rsP = null;
        try{
            db.connect();
            rsP = db.query("select * from reporte where etiqueta = 'Pendiente';");

            while(rsP.next()) {
                System.out.println("El reporte es:"+rsP.getInt("idReporte")+" - "+rsP.getString("contenido"));
                levanta= consultaUsuario(rsP.getInt("idUsuarioLevanta"));  
                asigna= consultaUsuario(rsP.getInt("idUsuarioAsigna"));  
                cierra= consultaUsuario(rsP.getInt("idUsuarioCierra")); 
                rep = new Reporte(rsP.getInt("idReporte"), rsP.getDate("fecha_inicio"), 
                        rsP.getDate("fecha_resolucion"),rsP.getDate("fecha_conclusion") ,
                        rsP.getString("etiqueta") ,rsP.getString("contenido") ,
                        rsP.getInt("idUsuarioEscritor"),levanta,asigna,cierra);
                repsPen.add(rep);
            }
            db.closeConnection();
        }
        catch(SQLException error){
            System.out.println(error.toString());
        }
        return repsPen;
    }
    
    public ArrayList<Reporte> consultaCerr(){
        ResultSet rsC;
        try{
            db.connect();

            rsC = db.query("select * from where etiqueta = 'Cerrado';");

            while(rsC.next()) {
                levanta= consultaUsuario(rsC.getInt("idUsuarioLevanta"));  
                asigna= consultaUsuario(rsC.getInt("idUsuarioAsigna"));  
                cierra= consultaUsuario(rsC.getInt("idUsuarioCierra")); 
                rep = new Reporte(rsC.getInt("idReporte"), rsC.getDate("fecha_inicio"), 
                        rsC.getDate("fecha_resolucion"),rsC.getDate("fecha_conclusion") ,
                        rsC.getString("etiqueta") ,rsC.getString("contenido") ,
                        rsC.getInt("idUsuarioEscritor"),levanta,asigna,cierra);
                repsCerr.add(rep);
            }
            db.closeConnection();
        }
        catch(SQLException error){
            System.out.println(error.toString());
        }
        return repsCerr;
    }
    
    public String consultaUsuario(int idUsuario){
        DataBase bd = new DataBase();
        ResultSet res;
        usuario = "";
        
        try{
            bd.connect();
            res = bd.query("select idUsuario,usuario from usuario where idUsuario = "+idUsuario);
                
            if(res.next()) {
                usuario = res.getString("usuario");
            }
            bd.closeConnection();
        }
        catch(SQLException error){
            System.out.println(error.toString());
        }
        return usuario;
    }
    
    public Reporte consultaReporte(int idReporte){
        
        DataBase data = new DataBase();
        ResultSet resul = null;
        Reporte rprt = null;
        try{
            data.connect();
            resul = data.query("select * from reporte where idReporte = "+idReporte);

            if (resul.next()) {
                System.out.println("El reporte es:"+resul.getInt("idReporte")+" - "+resul.getString("contenido"));
                levanta= consultaUsuario(resul.getInt("idUsuarioLevanta"));  
                asigna= consultaUsuario(resul.getInt("idUsuarioAsigna"));  
                cierra= consultaUsuario(resul.getInt("idUsuarioCierra")); 
                rprt = new Reporte(resul.getInt("idReporte"), resul.getDate("fecha_inicio"), 
                        resul.getDate("fecha_resolucion"),resul.getDate("fecha_conclusion") ,
                        resul.getString("etiqueta") ,resul.getString("contenido") ,
                        resul.getInt("idUsuarioEscritor"),levanta,asigna,cierra);
            }
            data.closeConnection();
        }
        catch(SQLException error){
            System.out.println(error.toString());
        }
        return rprt;
        
        
    }
    
    
}
