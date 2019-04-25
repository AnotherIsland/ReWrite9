/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Paquete;

import Database.DataBase;
import java.math.BigInteger;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ACIE-PC
 */
public class Servicio {
    
    public String cifrado(String contra){
         //String bits= Base64.getEncoder().encodeToString(contra.getBytes());
        
        //String bytes=new BigInteger(contra.getBytes()).toString(2);
        
        String binary = new BigInteger(contra.getBytes()).toString(2);
        /*
        String cifrcontra = cifra;
        */
        String text2 = new String(new BigInteger(binary, 2).toByteArray());
        String cifra="";
        
        for (int i = 0; i < binary.length(); i++) {
            cifra=cifra+xor(Character.toString(binary.charAt(i)),i);
        }

        String textcif = new String(new BigInteger(cifra, 2).toByteArray());
        
        String decifra="";
        for (int i = 0; i < cifra.length(); i++) {
            decifra=decifra+xor(Character.toString(cifra.charAt(i)),i);
        }
        String text3 = new String(new BigInteger(decifra, 2).toByteArray());
        
        return /*binary+" "+text2+" "+cifra+ */textcif/*+ decifra+" "+ text3 */;
    }
    //clave= 01010101010101010101010101010
    
    public String xor(String alga, int c){
        
        String resu="";
        if(alga.equals("0")&& c%2==0){ 
            resu="0";            
        }
        if(alga.equals("1")&& c%2==0){  
            resu="1";            
        }
        if(alga.equals("0")&& c%2!=0){  
            resu="1";             
        }
        if(alga.equals("1")&& c%2!=0){
            resu="0";            
        }
        return resu;
    }
    
    public void Basec(String Correo, String Usuario, String Contraseña){
        DataBase db = new DataBase();
        ResultSet rs;
        String password = Contraseña;
        String emai = Correo;
        String usuario =Usuario;
        
        try{
            db.connect();
            CallableStatement call = db.procedure("{call alta_usuario(?, ?, ?, ?)}");
            call.setString(1, usuario);
            call.setString(2, emai);
            call.setString(3, cifrado(password));
            call.setString(4, "");
            call.execute();
            call.close();
            
            db.closeConnection();
        }
        catch(SQLException error){
            System.out.println(error.toString());
        }
    }
    
    public String actUsuario(String NuevoUsuario,String ID){
        DataBase db = new DataBase();
        ResultSet rs;
        String usuario = NuevoUsuario;
        
        String resu="";
        try{
            db.connect();
            db.update("update usuario set usuario = '"+NuevoUsuario+"' where idUsuario="+ID+" ;");
            db.closeConnection();
        }
        catch(SQLException error){
            System.out.println(error.toString());
        }       
            resu="actualizado :)";                  
        return resu;
    } 
    
    public String actCorreo(String NuevoCorreo,String ID){
        DataBase db = new DataBase();
        ResultSet rs;
        String correo =NuevoCorreo;
        
        String resu="";
        try{
            db.connect();
            db.update("update usuario set correo = '"+correo+"' where idUsuario="+ID+" ;");
            db.closeConnection(); 
        }
        catch(SQLException error){
            System.out.println(error.toString());
        }
        resu="actualizado :)";
        return resu;
    }
    
    public String actContra( String NuevaContra, String ViejaContra,String ID){
        DataBase db = new DataBase();
        ResultSet rs;
        String password = ViejaContra;
        String contraN =NuevaContra;
        String resu="";
        try{
            db.connect();
            db.update("update usuario set pass = '"+contraN+"' where idUsuario="+ID+" ;");
            resu="actualizado :)";
            db.closeConnection();
        }
        catch(SQLException error){
            System.out.println(error.toString());
        }
        return resu; 
    }
}
