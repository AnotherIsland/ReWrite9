/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package soporte;

import Database.DataBase;
import controller.Login;
import encriptacion.Generar;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import model.Usuario;

/**
 *
 * @author ACIE-PC
 */
public class ConsultaUsuario {

    public ConsultaUsuario() {
    }
    
    public ArrayList consultaTipoUsuario(int tipoUs){
        DataBase bd = new DataBase();
        ResultSet res;
        ArrayList <Usuario> usuarios = new ArrayList();
        Usuario us = new Usuario();
        String tipo = "";
        int cuenta = 0;
        
        try{
            bd.connect();
            res = bd.query("select * from usuario where idTipoUsuario0 = "+tipoUs);
                
            while(res.next()) {
                us = new Usuario(res.getInt("idUsuario"), res.getString("usuario"), res.getString("correo"), 
                        res.getString("pass"),res.getInt("idTipoUsuario0"));
                usuarios.add(us);
                cuenta++;
            }
            bd.closeConnection();
        }
        catch(SQLException error){
            System.out.println(error.toString());
        }
        return usuarios;
    }
    
    public String verTipoUsuario(int tipoUs){
        
        String tipo = "";
        
        switch(tipoUs){
            case 1: 
                tipo = "Cliente";
                break;
            case 2: 
                tipo = "Operador";
                break;
            case 3: 
                tipo = "GerenteS";
                break;
            case 4: 
                tipo = "Ingeniero";
                break;
            case 5: 
                tipo = "GerenteM";
                break;
            case 6: 
                tipo = "Editor";
                break;  
        }
        return tipo;
    }
    
    public String consultaUsuario(int idUsuario){
        DataBase bd = new DataBase();
        ResultSet res;
        String usuario = "";
        
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
    
    public Usuario loginUsuario(String usuario, String contrasena){
        DataBase db = new DataBase();
        String Usu = "";
        Usuario user = new Usuario();
        ResultSet res = null;
        
        try{
            db.connect();
            res = db.query("select * from usuario inner join tipousuario"
                    + " on usuario.idTipoUsuario0 = tipousuario.idTipoUsuario "
                    + "where (correo = '"+usuario+"' or usuario='"+usuario+"')"
                    + " and pass = '"+contrasena+"';");
            
            if (res.next()){
                user = new Usuario(res.getInt("idUsuario"), res.getString("usuario"), res.getString("correo"), 
                        res.getString("pass"),res.getString("tipoUsu"),res.getInt("idTipoUsuario0"));
                System.out.println("Usuario existente: "+res.getString("usuario"));
            }
            else{
                System.out.println("No es un usuario registrado");
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        return user;
    }
    
    public int consultaUsID(String usuario){
        DataBase bd = new DataBase();
        ResultSet res;
        int id = 0;
        
        try{
            bd.connect();
            res = bd.query("select idUsuario,usuario from usuario where usuario = '"+usuario+"';");
                
            if(res.next()) {
                id = res.getInt("idUsuario");
                System.out.println("USuario por ID: "+id);
            }
            bd.closeConnection();
        }
        catch(SQLException error){
            System.out.println(error.toString());
        }
        return id;
    }
}
